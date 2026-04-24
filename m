Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E9E23370F
	for <linux-staging@lists.linux.dev>; Fri, 24 Apr 2026 13:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777035889; cv=none; b=IWNQ/WIYOi2mNphihKZSOma5nVk8ZnhUr3XgNp3eDU3eUQhJnyOaxmT5bbNJVn2Ryx1B5Z+/HNiemNoTK/9XLD0VJo69RF7HC0h6Z/ZxJc1A2uWilsC3xIm6uIBlqM0iTwh8qVicqgFQ4PoCgk0/VIRa3YIIxeNjW7aXTS5HofQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777035889; c=relaxed/simple;
	bh=sUhARkVV6WLuVK6uPJiiX5weqFRNg5lAxGuewHw1t0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q1VuaU/0insUF4Thz9TCRDXYPrK8Hp39MsIEoZ1WrQ9h2wCGaU/3vZlGDI4Fso8qHUkA/1+lVP1Cr1laT3gyHZQ0DjOlF9EJSeHxNVphrgx+pdP6Sh1pSdI5ELMKd7DsulMG2EtQ3nCEVB7gpCrvBcVX+8GKdPA6Aw3yuaOYHGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UCvXDxdP; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UCvXDxdP"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso4663263a91.0
        for <linux-staging@lists.linux.dev>; Fri, 24 Apr 2026 06:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777035887; x=1777640687; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7K+Nhaj6x5Daa8GmE0tApiYThiT0TvOLB3gffHvOj0=;
        b=UCvXDxdPYuTR4o2O3J14pebCPCBrmorUXSuUwYDzi0kxS3f3/EmCIjqkOZtcWxotS1
         8gkf4E/Ti0hbiOdv1R3/oqe18/l+6Hcg2RPGkAQHOrtkAK738Lq9u7EyyadP6GhA4Zmx
         mjzSEQvEcJT4ttqypi8MyNyexbuYWRd9OLPj7yIvGaZdtZQOlgjNOdCEBhiPr8me6Jjk
         prdZZb03BbOvukVGWYHe5OVnkdxJT0VFEus20Kr7jqfYPKok1Y4dUD/R3wPwL/oG02JU
         XQq84DePljxK18ZScSNod1VwufaTwPJuhHO7BCPAx4+fqirWQ+JIsTJcPnD9wKgP3sXA
         weVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777035887; x=1777640687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e7K+Nhaj6x5Daa8GmE0tApiYThiT0TvOLB3gffHvOj0=;
        b=epm3gPEQFMdSVqD0TsfWYDmfH7i6BiOoXka2EqKoALWaRIksr8nDJ26xqAJnzSPXd/
         CFkquYp9ec5D+XGvCvZmFUZew5ZKE4758NvlTz9C5XgmOQvSeHNUJRK0B6q1YpE9O4+H
         25ecxHxbAqO1QpfRYH4hhhNzP/Y6Pc3a7MP7mZKRNlRs5wablCqtTubtpesVv/9S8G3e
         HLTr+VHWl4AXqd3v/FoPQDm69gO0QWtz0pRzmSuzTZex/V7WUsirajHA2xBanXLvGQuH
         S97TdyszkuuqqK1t8IKf/luvTLDhtMSiMwZe0BkWmAV8t/cyuWinxkq7AXMYpEW4grKE
         4dbg==
X-Forwarded-Encrypted: i=1; AFNElJ/O75QIkA8/Duz6S6SF8YilUQbMeXxAJVC9rIB12IRFYgO0PaPJJZv7JiSAyc7hwf6Rew/My7psAoC++98d@lists.linux.dev
X-Gm-Message-State: AOJu0YzH6Owbbxf9NfIg83q+GJ2vLcJ8TKqf1zUo5CXsSWasUXY9e8XN
	PE839ttB7/ztOKwHjnZRPQoBNDky8GpnA9pXyL3ovsKiEIZKF8cNmjjz
X-Gm-Gg: AeBDieua7eJU2wAQnDRjI2grgs+a7dTMLtKrwQOqgz+37M/+zSTfJmwO6GVpQYH0e4I
	aQeknYEB5vyQDzbG0hvvSJU1GlGYGgkAzqTuRs/POZBxkjLCC4ayfPSyMemGLa0W8YxOQjg3WzS
	U/bHo9j8a+abbWNAjUT4PzrWly/Ust7WwWtLCyPCMvL3Kk3zaKdBwSZ327Ls0IBNFs3gv+p0XOK
	OY28xsqlFEws1jn0urlYv6kLN7/XkKxvaZF8PrM4qq2M7FiFLbwcwgdU08q6PnjJdL08WBR9JAi
	DptEHgQbKCrW0Vu/HTPGCKdgX9eO/xH0Pg+wQvWAZzQZg/KKI1SjPK9BRBLTeUkLyeuX4SVumv7
	47pPtTjBD/mz8xSqeRahykhDOUkVqLtW9PGhnEgdYrajeZyqq3r/xvjbIzwpz+H9ZVmFimIW0dq
	zOm2XbLvNWLBY0YLRa7HpOfgkGxELpxBBGLCN8Q9bvJbfIv2wIPeHu
X-Received: by 2002:a17:90b:3b4a:b0:35d:a4c0:a0ac with SMTP id 98e67ed59e1d1-361403d61camr31590648a91.3.1777035886857;
        Fri, 24 Apr 2026 06:04:46 -0700 (PDT)
Received: from arch.localdomain ([103.182.132.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3613fba1436sm8517285a91.11.2026.04.24.06.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 06:04:46 -0700 (PDT)
From: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: andy.shevchenko@gmail.com,
	andy@kernel.org,
	debjeetbanerjee48@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org
Subject: [PATCH v6] media: atomisp: Remove unimplemented DPCM decompression
Date: Fri, 24 Apr 2026 18:34:28 +0530
Message-ID: <20260424130428.27019-1-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aeqJt8gI0I8KnMVB@kekkonen.localdomain>
References: <aeqJt8gI0I8KnMVB@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CSI2 source pad format was set by blindly copying the sink pad
format, regardless of whether the sink pad is receiving a DPCM-compressed
mbus code. The rest of the driver does not support DPCM decompression,
so remove all DPCM-related dead code:

- Remove the FIXME comment in atomisp_csi2.c
- Remove atomisp_subdev_uncompressed_code() function
- Remove atomisp_subdev_is_compressed() function
- Remove atomisp_find_in_fmt_conv_compressed() declaration
- Remove compressed_codes[] array from atomisp_subdev.c

Signed-off-by: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
---
v6:
- Squashed into a single patch and removed comment in atomisp_csi2.c

v5:
- Rebased onto linuxtv.org/sailus/media_tree.git

v4:
- Complete removal of DPCM decompression attempt
- Keep source pad simply copying sink pad format without unmapping
- Replace detailed comment with explicit "DPCM is not supported" statement

v3:
- Drop "staging:" prefix in subject

v2:
- Rebased onto latest media tree (fix CI apply failure)
- Fix missing linux-staging recipient (typo in v1)
- Fix indentation
---
 .../staging/media/atomisp/pci/atomisp_csi2.c  |  1 -
 .../media/atomisp/pci/atomisp_subdev.c        | 33 -------------------
 .../media/atomisp/pci/atomisp_subdev.h        |  3 --
 3 files changed, 37 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index 95b9113d75e9..d15e607784e5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
@@ -107,7 +107,6 @@ int atomisp_csi2_set_ffmt(struct v4l2_subdev *sd,
 					     &tmp_ffmt);
 	}
 
-	/* FIXME: DPCM decompression */
 	*actual_ffmt = *ffmt = *__csi2_get_format(csi2, sd_state, which,
 						  CSI2_PAD_SINK);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 9de9cd884d99..07189230c308 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -51,39 +51,6 @@ const struct atomisp_in_fmt_conv atomisp_in_fmt_conv[] = {
 	{}
 };
 
-static const struct {
-	u32 code;
-	u32 compressed;
-} compressed_codes[] = {
-	{ MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8 },
-	{ MEDIA_BUS_FMT_SGBRG10_1X10, MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8 },
-	{ MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8 },
-	{ MEDIA_BUS_FMT_SRGGB10_1X10, MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8 },
-};
-
-u32 atomisp_subdev_uncompressed_code(u32 code)
-{
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(compressed_codes); i++)
-		if (code == compressed_codes[i].compressed)
-			return compressed_codes[i].code;
-
-	return code;
-}
-
-bool atomisp_subdev_is_compressed(u32 code)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(atomisp_in_fmt_conv) - 1; i++)
-		if (code == atomisp_in_fmt_conv[i].code)
-			return atomisp_in_fmt_conv[i].bpp !=
-			       atomisp_in_fmt_conv[i].depth;
-
-	return false;
-}
-
 const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv(u32 code)
 {
 	int i;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index b12bb65be3f2..b399319ae2c9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -296,8 +296,6 @@ struct atomisp_sub_device {
 
 extern const struct atomisp_in_fmt_conv atomisp_in_fmt_conv[];
 
-u32 atomisp_subdev_uncompressed_code(u32 code);
-bool atomisp_subdev_is_compressed(u32 code);
 const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv(u32 code);
 
 /* ISP2400 */
@@ -309,7 +307,6 @@ const struct atomisp_in_fmt_conv
 *atomisp_find_in_fmt_conv_by_atomisp_in_fmt(enum atomisp_input_format
 	atomisp_in_fmt);
 
-const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv_compressed(u32 code);
 bool atomisp_subdev_format_conversion(struct atomisp_sub_device *asd);
 
 /* Get pointer to appropriate format */
-- 
2.53.0

