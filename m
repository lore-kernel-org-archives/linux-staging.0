Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE15B15A9
	for <linux-staging@lists.linux.dev>; Wed, 13 Jul 2022 05:02:07 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id ss3so11818831ejc.11
        for <linux-staging@lists.linux.dev>; Tue, 12 Jul 2022 22:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wN7/gNJBgu38ouetv3OP7CgVYpHlU5zqKmahD//PyWE=;
        b=cN2okkhM1rEKWcNhuv5KbGnU2IcO4jwVN8X0XFaLqPRQiZJwxm8IoWwAzVOezItXzr
         B4szhFyzRYD+LBsTNUQ0z53PUKkXajAmQEauQCQxBwkLUZecCyDnHEdtB1Oz2cj3bYbg
         pOs15l+JSGNdegyMooZQ3pcK4HlW4VcRxV6PFehHIR740IN0q7kHkztes1hcGVjB7YxZ
         tUBuRHDl43nhO6idD5ci9/DM7WG4fSRwobULAgOmtmdHwGuYk+5FK7isGzP1I5MFHoBo
         h0kFB5b7nCxV3uGcwb1p86EXi7ZQCe+kWiVsKS24qzdcmgokIAFTitwYznvZSvJYMNHF
         Uhpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wN7/gNJBgu38ouetv3OP7CgVYpHlU5zqKmahD//PyWE=;
        b=yDK4Fi698pVPrAmUqaOoY9HUwklC6ognM5ZKlbk8hkBApiU8xaS4Izc7MYxC0R5kzx
         px6SwRzD27fbffbjFFi3m/AyXnJkIGhKij2aLAgZreLtd3q1Y4+OULIq9tbchtUjZD6I
         MTgeNxYmNxcWNKQjQ7tNY3B/Jw92UaCKOR4I4djxyjvQ0BhB6HkudbFbUP7NVJJcGq+6
         6tGXngGn8Z3P9QzZFldV40tYymcNTen33jq0seznNEKRCWlTWlNuzqGvpZKJQ9M21Vu6
         J1cN5az4ZOt37txxrgwYOrShGBvSVGNignxP1djONBdjbP9cP9Ggi6RafWy5UAMXLjTY
         fg4Q==
X-Gm-Message-State: AJIora+SxI8czWMAHqKU7XTCvMq0DcPY+QeAs7HHClHT62tMMLKTV6La
	uD0SE0A9R0WXICncHz311uQ=
X-Google-Smtp-Source: AGRyM1tLEBiNFrjipJRZQZQ0orwZb4Aj3HpFuQ9Sodd/jBAt8/Gq0iZZo7rQ+cuL6u4FibFFVsImEA==
X-Received: by 2002:a17:907:62a6:b0:6ef:8118:d3e2 with SMTP id nd38-20020a17090762a600b006ef8118d3e2mr1501409ejc.605.1657688526117;
        Tue, 12 Jul 2022 22:02:06 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id o15-20020a170906768f00b0070efa110afcsm4493151ejm.83.2022.07.12.22.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 22:02:05 -0700 (PDT)
Date: Wed, 13 Jul 2022 07:02:03 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 12/13] staging: vt6655: Convert macro vt6655_mac_reg_bits_off
 to function
Message-ID: <422950c8e1349fba2f97b0b95ba13f361cde05d9.1657657918.git.philipp.g.hortmann@gmail.com>
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

Convert macro vt6655_mac_reg_bits_off to function.
checkpatch.pl does not accept multiline macros.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/mac.c | 8 ++++++++
 drivers/staging/vt6655/mac.h | 8 +-------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vt6655/mac.c b/drivers/staging/vt6655/mac.c
index 076e1bfff3e0..aa9684229dfe 100644
--- a/drivers/staging/vt6655/mac.c
+++ b/drivers/staging/vt6655/mac.c
@@ -54,6 +54,14 @@ void vt6655_mac_word_reg_bits_on(void __iomem *iobase, const u8 reg_offset, cons
 	iowrite16(reg_value | (bit_mask), iobase + reg_offset);
 }
 
+void vt6655_mac_reg_bits_off(void __iomem *iobase, const u8 reg_offset, const u8 bit_mask)
+{
+	unsigned char reg_value;
+
+	reg_value = ioread8(iobase + reg_offset);
+	iowrite8(reg_value & ~(bit_mask), iobase + reg_offset);
+}
+
 /*
  * Description:
  *      Test if all test bits off
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 3b23334db538..e7b648cf2024 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -537,13 +537,6 @@
 
 /*---------------------  Export Macros ------------------------------*/
 
-#define vt6655_mac_reg_bits_off(iobase, reg_offset, bit_mask)			\
-do {									\
-	unsigned char reg_value;					\
-	reg_value = ioread8(iobase + reg_offset);			\
-	iowrite8(reg_value & ~(bit_mask), iobase + reg_offset);		\
-} while (0)
-
 #define vt6655_mac_word_reg_bits_off(iobase, reg_offset, bit_mask)	\
 do {									\
 	unsigned short reg_value;					\
@@ -654,6 +647,7 @@ do {									\
 
 void vt6655_mac_reg_bits_on(void __iomem *iobase, const u8 reg_offset, const u8 bit_mask);
 void vt6655_mac_word_reg_bits_on(void __iomem *iobase, const u8 reg_offset, const u16 bit_mask);
+void vt6655_mac_reg_bits_off(void __iomem *iobase, const u8 reg_offset, const u8 bit_mask);
 bool MACbIsRegBitsOff(struct vnt_private *priv, unsigned char byRegOfs,
 		      unsigned char byTestBits);
 
-- 
2.37.0

