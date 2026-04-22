Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA453CF676
	for <linux-staging@lists.linux.dev>; Wed, 22 Apr 2026 12:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776860437; cv=none; b=ocb6NGFLH+rnkeXf6CpdfRTjVFpjGyjGXV8mPPbp/mOFjRFJJgu7rREry3Otkm1bPsE3QvfE7/LecOSc7pmxkl43c8byL6BXUnfqNyHa9IuU1eo2DWRuNQnWNfpSrq5BortPAIaYMxAFj1hEqM1gQ0iKb+76tNnAgLGa9JsDAfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776860437; c=relaxed/simple;
	bh=rmLpOD15ey5jJBcGlOs0VEkMCk8NVU61Cjr9b1lHTIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n7QwFvK6i6S+HoUxHL17EdmsVdpxsJtGUMPOmglgLeyPLZzcMPFR8FgDG5ruHzHbrNxylSFXIaYxrwyilZkwZ10f/Ojulm5tpU6mk+yQGHIjGlTJza6ShnHTM+X+0EjjI/S/GPsfb91OaPCKDN8/uN7RaJjXBmvdzFkyAhX+Cpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ob9bBIGQ; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ob9bBIGQ"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c76c60c7502so2349882a12.0
        for <linux-staging@lists.linux.dev>; Wed, 22 Apr 2026 05:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776860433; x=1777465233; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6msxAJ7rXJwvY4InrEwD2UVkIE7nFuki3yGkdlRuzs=;
        b=Ob9bBIGQUkh0HYFHGn7lbSmCM72ENjwjf1YU0q3QnW85hZx6aHW4AUQ9DjiTu2ixB6
         jFpygLN2TIRJI3O1rTwkacvpw4w51BBI9lPhGCOTol7ehqnaoexkEzjah16Y9NyMY8xW
         pk0e3uo1l8ph70G0EmISrfaXAR0rx+htS4xNuayBiuI3SbuozjKpP6S8+Tx13VHtXtOH
         xvzRZR67QJxlT7SwaJI2mj/9DreWXnrTVo65M8DZ1WWu3BLE5Z9qom2h3bFNplBkVixS
         eNUZnIaTyXQa1ryiPYrF9lB/PpdUdvwJ4KP4eGLxcTR2RFYX6K286beAJmzje4I2cIjV
         S2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776860433; x=1777465233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G6msxAJ7rXJwvY4InrEwD2UVkIE7nFuki3yGkdlRuzs=;
        b=lflm6xZ9B3IvZ0k3tn49ywH2SbIdfcIVZ9ILrlGq4Z82ZFHrZzRM+c+ECkpqRUSNCa
         1dhMy2Mun8OG0z5LvBDJkh45g/gxikaV7EfbaC0/ZL+ykouGk/q8//f48nxS/k3HU+vn
         kV4iYcmG/JYtpyoIoxXiRo6/5zJxYjgSzAThgRIpF4jz61+q/yXN8Qll4vgGSaMVse8k
         zT76bcg9TmVSTOtSt6Klz+0VmtYDkhPkkodRP5cMRah9qLvdN3MVdqRiRc441RUsYmpL
         CmzlP9E29sU3QkbxcmHPA5LNkazt/Xl5r4SRfX4gG8x2OgFgQ2FCxLg9mRml+TGMq34H
         5kgQ==
X-Forwarded-Encrypted: i=1; AFNElJ8PtNfNRYhsrwP0pmQFzFziU6fPJlJzCwB1zZ1TML+NFy/CjaoOV/X1C+VuY4rhncQ9ZdBFRGH7g594GV1e@lists.linux.dev
X-Gm-Message-State: AOJu0YylNbfPPGU5C+ulTf2z5Jj9xdybBLPXG3sYaCHk0gbnlqUKmVN4
	8qGebRB9BJPicr9/a8ngxgzfWLM4eoJNnyb1rPsZQX4wqod/7HY8lCbY
X-Gm-Gg: AeBDietXilIsPXBvEohP3nSDtS+scC4/80Lm0ax2lRN7vg8WM4wGtR6jcJ2pS4O1DOn
	MSkDIVnBHqiuvToM1fkbvNHrLh0YVHnkktGLA8wsCQna6awPjIAMAfi3ckzKa8q6glPEHOP9JZI
	MoXv0sR/pKR/ZGPPm69/ldRqPfDskWpsZlK8GspkRLdPRAcxTGvK1Ss3E9ZUY33vQnBaUOftpnd
	bJa4f0xmHJ2vJmu40i4Lc50UPuVN8GT+it6gujcPTQ5pa3YRgsRQ5HfFfc7R6alLkY3VRLeNa4k
	5wCEVW93083sbqkjeZZtmaja3pMQRLkn2mOk6v/KniFo+LqNa7CvWyiRJth3iQGLnncYVOk3beT
	sk6UM4gFFBGyICK71k+mH+lf00nNStzTFzVekFSoEpH+8ouGqIqdWgkrHyRB3yAIwDEeREratI+
	lLzLwlQhgVLKuMHtOLKyXXW0alxAfhR32qfofPSX25B68DmPRrZyeG
X-Received: by 2002:a05:6300:6d04:b0:3a0:babd:b959 with SMTP id adf61e73a8af0-3a0babdbda5mr10203472637.9.1776860433590;
        Wed, 22 Apr 2026 05:20:33 -0700 (PDT)
Received: from arch.localdomain ([103.182.132.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797701b1a3sm12798030a12.19.2026.04.22.05.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 05:20:33 -0700 (PDT)
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
Subject: [PATCH v4 2/2] media: atomisp: Remove unused DPCM helper functions and declarations
Date: Wed, 22 Apr 2026 17:50:06 +0530
Message-ID: <20260422122006.29390-2-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260422122006.29390-1-debjeetbanerjee48@gmail.com>
References: <aeiuhvqcT189lL5U@kekkonen.localdomain>
 <20260422122006.29390-1-debjeetbanerjee48@gmail.com>
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
index 3d56ca83ecb7..ec5d3d7d7700 100644
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
index e1d0168cb91d..a8d3ddeda3bf 100644
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

