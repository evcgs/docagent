#!/usr/bin/env python3
"""
PDF 转 Markdown 工具
支持文字版 PDF 提取和扫描版 PDF OCR 识别
"""

import sys
import os
import argparse


def extract_text_from_pdf(pdf_path):
    """
    从 PDF 中提取文本（文字版 PDF）
    """
    try:
        import pdfplumber
    except ImportError:
        print("错误: 需要安装 pdfplumber 库")
        print("运行: pip install pdfplumber")
        return None

    text = ""
    try:
        with pdfplumber.open(pdf_path) as pdf:
            for page_num, page in enumerate(pdf.pages, 1):
                page_text = page.extract_text()
                if page_text:
                    text += f"\n\n--- 第 {page_num} 页 ---\n\n"
                    text += page_text
        return text
    except Exception as e:
        print(f"提取 PDF 文本时出错: {e}")
        return None


def ocr_pdf(pdf_path):
    """
    OCR 识别扫描版 PDF
    """
    try:
        from PIL import Image
        import pytesseract
        import pdf2image
    except ImportError:
        print("错误: 需要安装 OCR 相关库")
        print("运行: pip install pillow pytesseract pdf2image")
        print("还需要安装 Tesseract OCR 引擎")
        return None

    try:
        # 将 PDF 转换为图片
        images = pdf2image.convert_from_path(pdf_path)

        text = ""
        for page_num, image in enumerate(images, 1):
            # OCR 识别
            page_text = pytesseract.image_to_string(image, lang='chi_sim+eng')
            text += f"\n\n--- 第 {page_num} 页 ---\n\n"
            text += page_text

        return text
    except Exception as e:
        print(f"OCR 识别时出错: {e}")
        return None


def text_to_markdown(text):
    """
    将提取的文本整理为 Markdown 格式
    """
    if not text:
        return ""

    # 简单的格式整理
    lines = text.split('\n')
    markdown_lines = []

    for line in lines:
        line = line.rstrip()

        # 跳过空行，但保留段落分隔
        if not line:
            if markdown_lines and markdown_lines[-1] != "":
                markdown_lines.append("")
            continue

        # 尝试识别标题（全大写或特定模式）
        if line.isupper() and len(line) < 100:
            markdown_lines.append(f"## {line}")
        elif line.startswith(' ') and len(line.strip()) < 80:
            markdown_lines.append(f"### {line.strip()}")
        else:
            markdown_lines.append(line)

    return '\n'.join(markdown_lines)


def main():
    parser = argparse.ArgumentParser(description='PDF 转 Markdown 工具')
    parser.add_argument('pdf_file', help='PDF 文件路径')
    parser.add_argument('-o', '--output', help='输出文件路径（可选）')
    parser.add_argument('--ocr', action='store_true', help='使用 OCR 模式（用于扫描版 PDF）')

    args = parser.parse_args()

    if not os.path.exists(args.pdf_file):
        print(f"错误: 文件不存在: {args.pdf_file}")
        return 1

    print(f"正在处理: {args.pdf_file}")

    # 提取文本
    if args.ocr:
        print("使用 OCR 模式...")
        text = ocr_pdf(args.pdf_file)
    else:
        print("提取文本...")
        text = extract_text_from_pdf(args.pdf_file)

    if not text:
        print("未能提取到文本内容")
        return 1

    # 转换为 Markdown
    print("整理格式...")
    markdown = text_to_markdown(text)

    # 输出
    if args.output:
        with open(args.output, 'w', encoding='utf-8') as f:
            f.write(markdown)
        print(f"已保存到: {args.output}")
    else:
        print("\n" + "="*50)
        print(markdown)
        print("="*50)

    return 0


if __name__ == '__main__':
    sys.exit(main())
