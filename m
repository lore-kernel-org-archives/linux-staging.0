Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E442D7A
	for <linux-staging@lists.linux.dev>; Sat,  2 Apr 2022 07:29:33 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id c10so10039353ejs.13
        for <linux-staging@lists.linux.dev>; Sat, 02 Apr 2022 00:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OH8RZ4OIzhVJTj6gW8TRG+Xxd32IsFfZ6Emdp764vYI=;
        b=CBPOL+qENhXL+CPBSso8tY02v1TtdY5Ezr19BsGbZCM6GiMKRsrpQDgLa4/oEcpOya
         V21x10jj8SzE2awlpDIYNf1nN0b3ARhCjYl5n4DDZ1GUi9OSoedEXgR7k+zE+CTFjKEK
         zkU2ng7pNiprCKWQEOgNPMvltdh+V/+3rbkNABGdZitsv7EGIO4mnje2HKUOyMbqaGWS
         Q9N7KduN5pDKY7xgxHzOakSKDAUyrHyRXXzbbpOcroLGkROK5q614QuFhbTDKiv5F3Jc
         CMe60ug4MJdDnlj5b1AO67hfD1iRShPNpdSKwuoiPmUhaObnNyJkYGmkA4yAwC+GNonZ
         WXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OH8RZ4OIzhVJTj6gW8TRG+Xxd32IsFfZ6Emdp764vYI=;
        b=ncexvSsOCPHldR+A5LXuAHig9KHhioC+axQPy2x9EjDXNSMIo+SNXncrJ2SdOtdhAv
         Y4Fm9a7AoLnra8HRtc+bQ+5UaP0WNW6DQBwiCyqUP/6oc4FvwwcVsAoPYKT9wI0lmPuK
         ty3vYG8aiQlbh8u7+A59Ow98Dbd17cYSmmOgmCnpC0UVI+l/8nZvoaSDPE/tToXng10C
         MuRj5WmLksF4N7bcCtn49hcv93h0MlNlr+KSQbrUHPPSf3Q7aAQdNr2LIdWbBNieGHBw
         JJwTNJ+J1HqoQtQJqFdwdBG67OOuT8mVS2zghMGsMOFxnB9noiisdLCgbUnhMLBqqOj6
         CX2w==
X-Gm-Message-State: AOAM533PvjeoEnIp4GqQa4X8ccJ9Bh9ZRdCuAttrfpmA63Z3o3ElACeY
	YJao6JYPIQBXSkRz9Gw2B5Q=
X-Google-Smtp-Source: ABdhPJzyxuh//5B3BXtYXfFKg4wcXx+0DYbN3eTbRNKfVHw0CuppwJGGACNW1HZ2wt3rLtgj6L4dAg==
X-Received: by 2002:a17:907:3e1a:b0:6e0:5ba8:8e0f with SMTP id hp26-20020a1709073e1a00b006e05ba88e0fmr2781838ejc.581.1648884572210;
        Sat, 02 Apr 2022 00:29:32 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a074e9.dip0.t-ipconnect.de. [84.160.116.233])
        by smtp.gmail.com with ESMTPSA id fx3-20020a170906b74300b006daecedee44sm1800489ejb.220.2022.04.02.00.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 00:29:31 -0700 (PDT)
Date: Sat, 2 Apr 2022 09:29:29 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] staging: vt6655: Rename constant definitions with
 CamelCase
Message-ID: <3e2c464b7e67667ac135c555d78be9da2c3bb318.1648882847.git.philipp.g.hortmann@gmail.com>
References: <cover.1648882847.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1648882847.git.philipp.g.hortmann@gmail.com>

Rename constant definitions with CamelCase in mac.h as
they are not accepted by checkpatch.pl

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/mac.h | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index a1576e006d69..6221351c6400 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -261,18 +261,18 @@
 #define TFTCTL_TSFCNTREN    0x01
 
 /* Bits in the EnhanceCFG register */
-#define EnCFG_BarkerPream   0x00020000
-#define EnCFG_NXTBTTCFPSTR  0x00010000
-#define EnCFG_BcnSusClr     0x00000200
-#define EnCFG_BcnSusInd     0x00000100
-#define EnCFG_CFP_ProtectEn 0x00000040
-#define EnCFG_ProtectMd     0x00000020
-#define EnCFG_HwParCFP      0x00000010
-#define EnCFG_CFNULRSP      0x00000004
-#define EnCFG_BBType_MASK   0x00000003
-#define EnCFG_BBType_g      0x00000002
-#define EnCFG_BBType_b      0x00000001
-#define EnCFG_BBType_a      0x00000000
+#define ENCFG_BARKERPREAM   0x00020000
+#define ENCFG_NXTBTTCFPSTR  0x00010000
+#define ENCFG_BCNSUSCLR     0x00000200
+#define ENCFG_BCNSUSIND     0x00000100
+#define ENCFG_CFP_PROTECTEN 0x00000040
+#define ENCFG_PROTECTMD     0x00000020
+#define ENCFG_HWPARCFP      0x00000010
+#define ENCFG_CFNULRSP      0x00000004
+#define ENCFG_BBTYPE_MASK   0x00000003
+#define ENCFG_BBTYPE_G      0x00000002
+#define ENCFG_BBTYPE_B      0x00000001
+#define ENCFG_BBTYPE_A      0x00000000
 
 /* Bits in the Page1Sel register */
 #define PAGE1_SEL           0x01
@@ -497,7 +497,7 @@
 #define MAC_LB_INTERNAL     0x01
 #define MAC_LB_NONE         0x00
 
-#define Default_BI              0x200
+#define DEFAULT_BI          0x200
 
 /* MiscFIFO Offset */
 #define MISCFIFO_KEYETRY0       32
@@ -698,7 +698,7 @@ do {									\
 do {									\
 	unsigned long dwOrgValue;					\
 	VNSvInPortD(iobase + MAC_REG_ENCFG, &dwOrgValue);		\
-	dwOrgValue = dwOrgValue | EnCFG_ProtectMd;			\
+	dwOrgValue = dwOrgValue | ENCFG_PROTECTMD;			\
 	VNSvOutPortD(iobase + MAC_REG_ENCFG, dwOrgValue);		\
 } while (0)
 
@@ -706,7 +706,7 @@ do {									\
 do {									\
 	unsigned long dwOrgValue;					\
 	VNSvInPortD(iobase + MAC_REG_ENCFG, &dwOrgValue);		\
-	dwOrgValue = dwOrgValue & ~EnCFG_ProtectMd;			\
+	dwOrgValue = dwOrgValue & ~ENCFG_PROTECTMD;			\
 	VNSvOutPortD(iobase + MAC_REG_ENCFG, dwOrgValue);		\
 } while (0)
 
@@ -714,7 +714,7 @@ do {									\
 do {									\
 	unsigned long dwOrgValue;					\
 	VNSvInPortD(iobase + MAC_REG_ENCFG, &dwOrgValue);		\
-	dwOrgValue = dwOrgValue | EnCFG_BarkerPream;			\
+	dwOrgValue = dwOrgValue | ENCFG_BARKERPREAM;			\
 	VNSvOutPortD(iobase + MAC_REG_ENCFG, dwOrgValue);		\
 } while (0)
 
@@ -722,7 +722,7 @@ do {									\
 do {									\
 	unsigned long dwOrgValue;					\
 	VNSvInPortD(iobase + MAC_REG_ENCFG, &dwOrgValue);		\
-	dwOrgValue = dwOrgValue & ~EnCFG_BarkerPream;			\
+	dwOrgValue = dwOrgValue & ~ENCFG_BARKERPREAM;			\
 	VNSvOutPortD(iobase + MAC_REG_ENCFG, dwOrgValue);		\
 } while (0)
 
@@ -730,7 +730,7 @@ do {									\
 do {									\
 	unsigned long dwOrgValue;					\
 	VNSvInPortD(iobase + MAC_REG_ENCFG, &dwOrgValue);		\
-	dwOrgValue = dwOrgValue & ~EnCFG_BBType_MASK;			\
+	dwOrgValue = dwOrgValue & ~ENCFG_BBTYPE_MASK;			\
 	dwOrgValue = dwOrgValue | (unsigned long)byTyp;			\
 	VNSvOutPortD(iobase + MAC_REG_ENCFG, dwOrgValue);		\
 } while (0)
-- 
2.25.1

