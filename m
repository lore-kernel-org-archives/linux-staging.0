Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B67E3D47AF
	for <linux-staging@lists.linux.dev>; Thu, 23 Apr 2026 12:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776948764; cv=none; b=D+d6NgtyZzG78LZIzRavrNXp4/pWYJU7bpaSDqwpvIWMVLKAxUsOLaBSPFto9bk5BNaDi/Yc7IWNId0OyruC5lQynRHScqN+o61MlL21SBpdr8Yc7v7D3Xwz0llU5+2qNIHVNk55t7DMN1MCxUxV8v3W4kiLGlvjcsXQZdzSbVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776948764; c=relaxed/simple;
	bh=LRYRTI1R6uFPtNm9boDuQ+J2WejITXqetBV3qvxnKrg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MNE6AMCZXzkI8g3wMEizBsgvx2aDBf2iEXgIHBISA2Z0KqZnSQzM0eMbgOdWiRpjW/UA119MQ0KFwo/YIgQrSytkN8No2f9hDjIm2Fo6TY0xbHx3c+FlRAmMfI+a+cvLLIu0C6rqwEDe2765q5msiwqea7ZIB5yTUsYLA3mfbS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CGRg4Ap4; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGRg4Ap4"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82fbdd60b64so2907780b3a.3
        for <linux-staging@lists.linux.dev>; Thu, 23 Apr 2026 05:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776948761; x=1777553561; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWTak0AZpT5PAGRyOPrLhAfTDkzNQwl7PRRG7ggCKJA=;
        b=CGRg4Ap49Qy1nUCj+J7smNbnJCTh1X0bovaSXuJXQBXJBNVwbLDS+h+6WIBQI6pasM
         7stDmfJktiWpvIJGnRLTFeW7mPkYAAuIbDOi1IfmQFaSw/vIV+agmwg6sTnaXCnfPLVp
         3Tt2M/lIWvpKrIO6+Z8NAzNaLBTIYp43H+h/HqgwcD4lnLBpYQ+R7rG/bByQux0HlBSc
         2jRMfh2ET4zFBlWOkwqIUqqBHHLsIuGQYCgkpNIGXKZG/rv77cge7wdo2DFwJSoXoOVR
         jryTPREXK0LzbGKBpOfmP9RIDjlP1hC+fSAkgjFqwKwj4WNoAD3/d5YtmsYH15aUrqCL
         tayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948761; x=1777553561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oWTak0AZpT5PAGRyOPrLhAfTDkzNQwl7PRRG7ggCKJA=;
        b=XCx2G78INTLUEuud9G9PY/A05djpYAiYkbeBWqthwiISenjFMeQoKoNPMKaUb/Vll0
         cFU6Z8HPKaQYpW2ZDCMLTfqraT++98Ep4zX9l5LrFR0GKPvYwnIW6YDFq4TPzo06iigD
         ePqP+Mj4t0Fhqp9UC43RvxDTZUsIc+eZo4A4AsoyC2Nkoa123VsbBWVJOEZEM8l/H7qi
         u59We3WoEFf1IFnRmSZDDVGI+PgfKrSNW/kM6NY6z1fSx6Pv2g59emT4tLuXEjmQA3zk
         uZshaV8zBINKj2LpWFCChnD8z515hj4Cza5pHa3z0/erQYtzYkhJwSh4EDQc3GRatcmq
         u+bQ==
X-Forwarded-Encrypted: i=1; AFNElJ/jnxP91PSjUjlg6CjrYm7z61fJR0m14mamNa+2OzzwB4DXqSM1zUbxlk558eiBHNjJi2XS3goRKUY+WbGi@lists.linux.dev
X-Gm-Message-State: AOJu0Yzm2+RQJIdcu5jt6/OCEh1yDjTMk4OOx1HJPjUtwPcgb5NiHEMz
	p67DqgabwXdoeLOJqhhMq1O1/ggj4NdGTixzQjfbKQNi+r5UaKwyGBfj
X-Gm-Gg: AeBDiesmvadX7rgIPd8JX4kX/oCcZyg7sx6MTIYuIODJwV4y+0AQ6WHaZScbeukNL2R
	sggkX0LSqXN8Yy+bJkl9R2uW4L9fv+CJB72+79CatKTL4HVAVH6MebXikVNZwTzqgCDjysDGIB5
	nP9hxTYT8ki4zn5lGecVT6R77xOCc9tKjzf6tCVub8H1h5dcmE1lJkrWPG809msLNC7fAthfhN3
	KoyKIHQieknZbvW9fuPoeN5J9/TtvaC74vGiw30dmuDpPY+x099ou2sHtDk/RcRyok8Z0T28OM9
	9QOOyartpWu4GQqncTeiuPim+fgvrBLXFakiIJzQOsII/xNMPhP5jdtRII0ryPBadUSgkZgDJzP
	xPn+v6DTd8NiFnM+4f3R/XiiS1z2eFjDe0FGXaGHsvBhi1AFc7OVZPacYtfOWe6u+j+BF0WB8Du
	ZoXAvc2FqzRcoNhWqG3hbE0/BfAmWclOs54h9QSJ9xIKoz2xCyBBBC
X-Received: by 2002:a05:6a00:3017:b0:82f:390a:69c7 with SMTP id d2e1a72fcca58-82f8c92c6f9mr27395845b3a.33.1776948761480;
        Thu, 23 Apr 2026 05:52:41 -0700 (PDT)
Received: from arch.localdomain ([103.182.132.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec0092bsm22043687b3a.50.2026.04.23.05.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:52:41 -0700 (PDT)
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
Subject: [PATCH v5 2/2] media: atomisp: Remove unused DPCM helper functions and declarations
Date: Thu, 23 Apr 2026 18:22:16 +0530
Message-ID: <20260423125216.19217-2-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260423125216.19217-1-debjeetbanerjee48@gmail.com>
References: <aejF4OlVJtKSknxg@kekkonen.localdomain>
 <20260423125216.19217-1-debjeetbanerjee48@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the DPCM-related helper functions and data structures that are no
longer used after simplifying the CSI2 source pad format handling:

- atomisp_subdev_uncompressed_code() function
- atomisp_subdev_is_compressed() function
- atomisp_find_in_fmt_conv_compressed() declaration
- compressed_codes[] array from atomisp_subdev.c

Since the driver does not support DPCM decompression, these functions
were dead code and have been removed to clean up the codebase.

Signed-off-by: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
---
 .../media/atomisp/pci/atomisp_subdev.c        | 33 -------------------
 .../media/atomisp/pci/atomisp_subdev.h        |  3 --
 2 files changed, 36 deletions(-)

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

