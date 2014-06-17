<?xml version="1.0"?>
<!--
 * Copyright (c) 2012-2014, s3auth.com
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met: 1) Redistributions of source code must retain the above
 * copyright notice, this list of conditions and the following
 * disclaimer. 2) Redistributions in binary form must reproduce the above
 * copyright notice, this list of conditions and the following
 * disclaimer in the documentation and/or other materials provided
 * with the distribution. 3) Neither the name of the s3auth.com nor
 * the names of its contributors may be used to endorse or promote
 * products derived from this software without specific prior written
 * permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT
 * NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
 * FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 * THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE.
 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml" version="2.0" exclude-result-prefixes="xs">
    <xsl:output method="xml" omit-xml-declaration="yes"/>
    <xsl:template match="/directory">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html lang="en">
            <head>
                <meta charset="UTF-8"/>
                <link rel="stylesheet" type="text/css" media="all" href="http://www.s3auth.com/css/layout.css"/>
            </head>
            <body>
                <div id="content">
                    <p><xsl:text>This is page is auto-generated by s3auth.com</xsl:text></p>
                    <p style="margin-bottom: 2em;">
                        <xsl:text>prefix: </xsl:text>
                        <span class="tt"><xsl:value-of select="@prefix"/></span>
                    </p>
                    <table>
                        <tr style="text-align: left;">
                            <th>Name</th>
                            <th>Size (bytes)</th>
                        </tr>
                        <xsl:apply-templates select="commonPrefix"/>
                        <xsl:apply-templates select="object"/>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="commonPrefix">
        <tr>
            <td>
                <p>
                    <a>
                        <xsl:attribute name="href">
                            <xsl:text>/</xsl:text>
                            <xsl:value-of select="."/>
                            <xsl:text>index.html</xsl:text>
                        </xsl:attribute>
                        <xsl:value-of select="."/>
                    </a>
                </p>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="object">
        <tr>
            <td>
                <p>
                    <a>
                        <xsl:attribute name="href">
                            <xsl:text>/</xsl:text>
                            <xsl:value-of select="path"/>
                        </xsl:attribute>
                        <xsl:value-of select="path"/>
                    </a>
                </p>
            </td>
            <td>
                <p><xsl:value-of select="size"/></p>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
