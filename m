Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232A115A9
	for <linux-staging@lists.linux.dev>; Wed, 13 Jul 2022 05:01:48 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id z23so1301270eju.8
        for <linux-staging@lists.linux.dev>; Tue, 12 Jul 2022 22:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8pZzd2vkbWzLoKgooVDcdAnN/Oz4GsC2lEDWrGxwNUk=;
        b=KpZJ/sxYtSgXBtNQ+dEC26HGEsAQPY7u2WhDe5g6ImWu92np52XYUjSP60mI+gMuaw
         T9k19F3IUTnr7YYdGx6b6LkfB/g74O8A1ZFpSeRdSg2iEtxiPf+pBlQ2STr2blPeCsZD
         U//nJZq1+EK8pZUUqpuJPRhWHEKAB1YuNkRr0cOijw6Y2YkgoATpTWj78RqpmczydnS/
         Gl/7ogIr9sON1sb93fvZ6n88d+4i4L67P+MJhdWrm4m6snOoePVKdgcbTU7kFggjVb89
         T5RfyqA7sQ2NAY4J1eVSfJ9GDXcpElcoF3FX0cmYM0ADpDSUe9UBOr7jTN3PsQyO/j5D
         KZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8pZzd2vkbWzLoKgooVDcdAnN/Oz4GsC2lEDWrGxwNUk=;
        b=3m/HbOS8um7053qepcm0wDsyEJ1O7Yk7i6/YHkgoDq6X9qftE6YuyuNtVhjAXDlH5n
         yTaczM3GYeleuUHp74aeDh/Kt9l2C9XOOips48RXjHqkZK0ggtwIY5sMJXACRq+OM4by
         fCulqGXynhb3lfBV2MnWpRBDQsRa+crMEJ4+POwYqgq1aDqQKIsV9N/jxq/ZkrlRO4CV
         82+qV2y2Y20Bysp5rPgzeWAa7L+8FxWd3o9eRhEURyTupbuk+VfnLqgi6fr5gEprt6z6
         HwvJtGS3jElSb5K0J+98NhRhOWbYz5Fl0M+KTGub8ueBzHWF2s3A2u6I4nbBn0w4RB5X
         FKuA==
X-Gm-Message-State: AJIora9uS9B9ms7JJMgsOh7C8T2kxpOLj2TkU9HNwy3IZjTAb883iDf6
	8DYT3yZocJIeSfBbZxpmhl8=
X-Google-Smtp-Source: AGRyM1uRDQnlEJOfnP6nA+lxydgis+vWUMY0ZLHQjr1LIpnr00RBVAO8LZmUkvb2Sj9kxQlcRMuu8A==
X-Received: by 2002:a17:906:284c:b0:727:3773:1a53 with SMTP id s12-20020a170906284c00b0072737731a53mr1461214ejc.765.1657688506419;
        Tue, 12 Jul 2022 22:01:46 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id i19-20020a170906115300b007262b9f7120sm4475495eja.167.2022.07.12.22.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 22:01:46 -0700 (PDT)
Date: Wed, 13 Jul 2022 07:01:37 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 11/13] staging: vt6655: Convert macro
 vt6655_mac_word_reg_bits_on to function
Message-ID: <255c7f5a5e98a399aa4e299e7cf567016bd86d60.1657657918.git.philipp.g.hortmann@gmail.com>
References: <cover.1657657918.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1657657918.git.philipp.g.hortmann@gmail.com>

Convert macro vt6655_mac_word_reg_bits_on to function.
checkpatch.pl does not accept multiline macros.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/mac.c | 8 ++++++++
 drivers/staging/vt6655/mac.h | 8 +-------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vt6655/mac.c b/drivers/staging/vt6655/mac.c
index 902034a28c6c..076e1bfff3e0 100644
--- a/drivers/staging/vt6655/mac.c
+++ b/drivers/staging/vt6655/mac.c
@@ -46,6 +46,14 @@ void vt6655_mac_reg_bits_on(void __iomem *iobase, const u8 reg_offset, const u8
 	iowrite8(reg_value | bit_mask, iobase + reg_offset);
 }
 
+void vt6655_mac_word_reg_bits_on(void __iomem *iobase, const u8 reg_offset, const u16 bit_mask)
+{
+	unsigned short reg_value;
+
+	reg_value = ioread16(iobase + reg_offset);
+	iowrite16(reg_value | (bit_mask), iobase + reg_offset);
+}
+
 /*
  * Description:
  *      Test if all test bits off
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 031316d42dba..3b23334db538 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -537,13 +537,6 @@
 
 /*---------------------  Export Macros ------------------------------*/
 
-#define vt6655_mac_word_reg_bits_on(iobase, reg_offset, bit_mask)	\
-do {									\
-	unsigned short reg_value;					\
-	reg_value = ioread16(iobase + reg_offset);			\
-	iowrite16(reg_value | (bit_mask), iobase + reg_offset);		\
-} while (0)
-
 #define vt6655_mac_reg_bits_off(iobase, reg_offset, bit_mask)			\
 do {									\
 	unsigned char reg_value;					\
@@ -660,6 +653,7 @@ do {									\
 	((unsigned short)(((unsigned char)(lb)) | (((unsigned short)((unsigned char)(hb))) << 8)))
 
 void vt6655_mac_reg_bits_on(void __iomem *iobase, const u8 reg_offset, const u8 bit_mask);
+void vt6655_mac_word_reg_bits_on(void __iomem *iobase, const u8 reg_offset, const u16 bit_mask);
 bool MACbIsRegBitsOff(struct vnt_private *priv, unsigned char byRegOfs,
 		      unsigned char byTestBits);
 
-- 
2.37.0

