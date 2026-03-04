#!/usr/bin/env python3
"""
合同生成工具
根据模板和变量数据快速生成定制化合同
"""

import sys
import os
import re
import argparse
import json
from datetime import datetime


class ContractTemplate:
    """合同模板类"""

    def __init__(self, template_text):
        self.template_text = template_text
        self.variables = self._extract_variables()

    def _extract_variables(self):
        """从模板中提取变量"""
        pattern = r'\{\{([^}]+)\}\}'
        variables = re.findall(pattern, self.template_text)
        return list(set(variables))

    def render(self, variable_data):
        """渲染模板"""
        result = self.template_text

        for var_name, var_value in variable_data.items():
            placeholder = f'{{{{{var_name}}}}}'
            result = result.replace(placeholder, str(var_value))

        # 检查是否有未替换的变量
        missing_vars = re.findall(r'\{\{([^}]+)\}\}', result)
        if missing_vars:
            print(f"警告: 以下变量未替换: {', '.join(set(missing_vars))}")

        return result


def load_template(template_path):
    """加载模板文件"""
    if not os.path.exists(template_path):
        print(f"错误: 模板文件不存在: {template_path}")
        return None

    with open(template_path, 'r', encoding='utf-8') as f:
        return f.read()


def load_variables(variable_path):
    """加载变量数据"""
    if not os.path.exists(variable_path):
        print(f"错误: 变量文件不存在: {variable_path}")
        return None

    with open(variable_path, 'r', encoding='utf-8') as f:
        if variable_path.endswith('.json'):
            return json.load(f)
        else:
            # 简单的 key=value 格式
            variables = {}
            for line in f:
                line = line.strip()
                if not line or line.startswith('#'):
                    continue
                if '=' in line:
                    key, value = line.split('=', 1)
                    variables[key.strip()] = value.strip()
            return variables


def get_default_variables():
    """获取默认变量"""
    now = datetime.now()
    return {
        '签署日期': now.strftime('%Y年%m月%d日'),
        '签署年份': now.strftime('%Y'),
        '签署月份': now.strftime('%m'),
        '签署日期数字': now.strftime('%d'),
    }


def interactive_mode(template):
    """交互模式：逐个输入变量"""
    print("\n" + "="*60)
    print("合同生成 - 交互模式")
    print("="*60)
    print(f"\n模板中发现 {len(template.variables)} 个变量:\n")

    variables = get_default_variables()

    for i, var_name in enumerate(sorted(template.variables), 1):
        default = variables.get(var_name, '')
        prompt = f"[{i}/{len(template.variables)}] {var_name}"
        if default:
            prompt += f" (默认: {default})"
        prompt += ": "

        value = input(prompt)
        if value:
            variables[var_name] = value
        elif default:
            variables[var_name] = default
        else:
            variables[var_name] = ''

    return variables


def main():
    parser = argparse.ArgumentParser(description='合同生成工具')
    parser.add_argument('template', help='合同模板文件路径')
    parser.add_argument('-o', '--output', help='输出文件路径')
    parser.add_argument('-v', '--variables', help='变量数据文件路径 (JSON 或 key=value 格式)')
    parser.add_argument('-i', '--interactive', action='store_true', help='交互模式：逐个输入变量')
    parser.add_argument('--list-vars', action='store_true', help='只列出模板中的变量，不生成合同')

    args = parser.parse_args()

    # 加载模板
    template_text = load_template(args.template)
    if not template_text:
        return 1

    template = ContractTemplate(template_text)

    # 只列出变量
    if args.list_vars:
        print("\n模板中的变量:")
        print("-" * 40)
        for var in sorted(template.variables):
            print(f"  - {var}")
        print(f"\n共 {len(template.variables)} 个变量\n")
        return 0

    # 获取变量数据
    if args.interactive:
        variables = interactive_mode(template)
    elif args.variables:
        variables = load_variables(args.variables)
        if not variables:
            return 1
        # 添加默认变量
        default_vars = get_default_variables()
        for key, value in default_vars.items():
            if key not in variables:
                variables[key] = value
    else:
        # 使用默认变量
        variables = get_default_variables()
        print("\n使用默认变量，未填充的变量将保留原样。")
        print("使用 -i 进入交互模式，或使用 -v 指定变量文件。\n")

    # 渲染合同
    print("\n正在生成合同...")
    contract = template.render(variables)

    # 输出
    if args.output:
        with open(args.output, 'w', encoding='utf-8') as f:
            f.write(contract)
        print(f"\n✓ 合同已生成: {args.output}")
    else:
        print("\n" + "="*60)
        print(contract)
        print("="*60)
        print("\n提示: 使用 -o 参数保存到文件")

    return 0


if __name__ == '__main__':
    sys.exit(main())
