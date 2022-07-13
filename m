Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C9815A9
	for <linux-staging@lists.linux.dev>; Wed, 13 Jul 2022 05:02:18 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id l23so17848384ejr.5
        for <linux-staging@lists.linux.dev>; Tue, 12 Jul 2022 22:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=o4KU5GfxgtTjFqUAyp9nHhKmqMhsJeckxPFNR7wwGhI=;
        b=Su/LoPrTpSQslxh3aRcpzhdO0vAseTq7tIMW75z4Nu13bfhVvB99uQhmU06C07/0TP
         sWzwKBqhY7cdtxYfZjAdgRCDWtB5MaOW3XZneAp+qDINW7YwDdfQmKesvSRi74r18UWh
         UDx6poxvQTA5+Ll78Drgf76DhYtDF6BlPvewOry66lnQ2qEiz9hqYAegzQALzfFTzlSC
         ajRPGjSA/s/GVH14orBrUhm4vMGoGqglqakwQYutWY0/hG5CA4/q8VgAMkqYJp/C966s
         1oPx2iKMCtMfJJkCTPms99QqE3E5Oxjbe+wTTKICBO+kiwcWOm/mQi24D8qGpNwfF2mv
         6c3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=o4KU5GfxgtTjFqUAyp9nHhKmqMhsJeckxPFNR7wwGhI=;
        b=jCd/I56oMmp9DsiHnGewi4Dka5o/jDjkVseIRoP1n/ColHNXlJr3qHKQKFREQ+9J0f
         f8DUFM+FpLKHS0FQDpff34NuvcoeyayAtSzwyIm8qklHhkcq7sky9yIDcod6ak4WM24+
         9qY7wYVW14fLaP7t/3xVE1YSVGjVz1TaK4XJdzKEDKB/3XXeW2YEzJ4J57/oqnTelwBM
         uKXz0x6l/44PVkaAt1mRDnqRwY7IglFQZk4BDqu1sXze1afciUjNbSrbZWi4KiiyiLWY
         8MJuyd2tdQcBMbr+ZuAWkq9GpD1q5bu7dxSOtko6ezV74/7dYZsI7en20Xp2MJbbfxZX
         Auow==
X-Gm-Message-State: AJIora+hdiIvcxIZEa8e1Tz+TEe0fKCctcV0+XDMU6cYp4HKi1pRE946
	pEY2Xz8PUXK8eyZHnv7GFjbRA0M0p/I=
X-Google-Smtp-Source: AGRyM1t6uC82lJ3lW6knb43+V1KxvgxUhrauEIGPKf18IZ1Sr7igNIjbN7AKlIBzbTBm41bCL3uyVg==
X-Received: by 2002:a17:907:6d9b:b0:72b:5cc3:79cf with SMTP id sb27-20020a1709076d9b00b0072b5cc379cfmr1641151ejc.382.1657688536770;
        Tue, 12 Jul 2022 22:02:16 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id b13-20020a17090630cd00b0072637b9c8c0sm4506178ejb.219.2022.07.12.22.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 22:02:16 -0700 (PDT)
Date: Wed, 13 Jul 2022 07:02:14 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 13/13] staging: vt6655: Convert macro
 vt6655_mac_word_reg_bits_off to function
Message-ID: <04fb37871c4d383c27287934a0dddb3aa7974b08.1657657918.git.philipp.g.hortmann@gmail.com>
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

Convert macro vt6655_mac_word_reg_bits_off to function.
checkpatch.pl does not accept multiline macros.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/mac.c | 8 ++++++++
 drivers/staging/vt6655/mac.h | 9 ++-------
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vt6655/mac.c b/drivers/staging/vt6655/mac.c
index aa9684229dfe..a7f645f9ccf8 100644
--- a/drivers/staging/vt6655/mac.c
+++ b/drivers/staging/vt6655/mac.c
@@ -62,6 +62,14 @@ void vt6655_mac_reg_bits_off(void __iomem *iobase, const u8 reg_offset, const u8
 	iowrite8(reg_value & ~(bit_mask), iobase + reg_offset);
 }
 
+void vt6655_mac_word_reg_bits_off(void __iomem *iobase, const u8 reg_offset, const u16 bit_mask)
+{
+	unsigned short reg_value;
+
+	reg_value = ioread16(iobase + reg_offset);
+	iowrite16(reg_value & ~(bit_mask), iobase + reg_offset);
+}
+
 /*
  * Description:
  *      Test if all test bits off
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index e7b648cf2024..b307161818a0 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -537,13 +537,6 @@
 
 /*---------------------  Export Macros ------------------------------*/
 
-#define vt6655_mac_word_reg_bits_off(iobase, reg_offset, bit_mask)	\
-do {									\
-	unsigned short reg_value;					\
-	reg_value = ioread16(iobase + reg_offset);			\
-	iowrite16(reg_value & ~(bit_mask), iobase + reg_offset);	\
-} while (0)
-
 #define MACvReceive0(iobase)						\
 do {									\
 	unsigned long dwData;						\
@@ -648,6 +641,8 @@ do {									\
 void vt6655_mac_reg_bits_on(void __iomem *iobase, const u8 reg_offset, const u8 bit_mask);
 void vt6655_mac_word_reg_bits_on(void __iomem *iobase, const u8 reg_offset, const u16 bit_mask);
 void vt6655_mac_reg_bits_off(void __iomem *iobase, const u8 reg_offset, const u8 bit_mask);
+void vt6655_mac_word_reg_bits_off(void __iomem *iobase, const u8 reg_offset, const u16 bit_mask);
+
 bool MACbIsRegBitsOff(struct vnt_private *priv, unsigned char byRegOfs,
 		      unsigned char byTestBits);
 
-- 
2.37.0

