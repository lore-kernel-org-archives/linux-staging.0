Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23E430E0E9
	for <linux-staging@lists.linux.dev>; Sat,  9 May 2026 04:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778300627; cv=none; b=o7WVGsOAgqxs+lKRhT3oO/ubVpftJMIeQpaEE8PeiBRWfHT8gTSRos7shRCcf5j/fjmCMmtViWoPvrvuAFLjcC9MeB9sXDTdwnzEe+BfZ40nAEBdrpZkQYnhQJGFpMon0XQ4GLPrIBJ9xYLbMvVqnoW+IDETh3uOEDMi4OblXW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778300627; c=relaxed/simple;
	bh=CKke4Msw8/PLH8nhKUerngv2DSwaDHoC476azgsQhfg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pRI4PuW77JJLp6jk9Xtr0C3ndBGBCj96q1YTH8I3CCWkKQJreBLfsAPAHKzBFPKva6w2MAHwIsYSZbrUWoBtEoUFA85w7soVldPCg2LrVZeeNwYG+rKI7U5ZA2Nb5w0gfXLOUfRjx3hlIjGd7Rvi6PURAVRrMfZEUHKt2nRD94E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JsKOmQW0; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JsKOmQW0"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12dca45ca21so3914727c88.1
        for <linux-staging@lists.linux.dev>; Fri, 08 May 2026 21:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778300625; x=1778905425; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aRKZOw+tN4b+M9k7YcVf9omUjEsEpnV1wyPi8YHlakA=;
        b=JsKOmQW06JeqxWi85nN+x4pQgKWXQCgT65yZFNDIPAcLQD4h90jBP41Ln155Det9Hr
         P73aTS5CtDhxWjjkhXn+y8NnjviGj+kgw3sTlKkCSItYk+2E+KdpUBAM+mlQlseJTI5Y
         +8ff/gcns5upKK/gQApSof7ll+uehvvLJrE3Ndj3SDK4ypbri/2xjfxRRQ82KtKe9YZt
         TalLkGKUujqzBT9qnZV98Zan2q2/ukm1Mxaqbi7P05OBoo6ml9Zu/IxUlx0o5CSz0p5r
         qRRBT2SGELb2q98UZiZhl7QjaH+/qSMUThL0soVcYqtLuOk9JB8yQoYsqQ6WBFjWgxoj
         dFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778300625; x=1778905425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aRKZOw+tN4b+M9k7YcVf9omUjEsEpnV1wyPi8YHlakA=;
        b=LFHE75tue/jdJbA9SDHwJx0Xf33VcrGYfVsxZan1J+2g/osLvcRxm54j95eGhfzmiW
         tRQHpF6Eamw7q5jKt/5waRPaz3ZXgt307hPW73cpMlasm7jdnkkI14HpMKmEiVlXrtpl
         emlUUdF5jDlstWy3Gq9TiuIv3AOZ0I7Fsi1ihn+n8aumYOC9Ww9fbXGu4Z5f+p1MXL+Z
         nQwKwMQsJ+0I9/TBxX6k7yv2URh5nR309CZYTV24SKbMMoJCxl8duT1kH3KBXUyTqs9c
         NDEn8W1C7HkJqxjphsLpHsa1CX7HdNwtlFjbetIIbgQgGMgvF5weYiI+xn4K5BWqvcrQ
         Alzw==
X-Gm-Message-State: AOJu0Yy6vkmc+50zF6NyDR3mQjNHvORuS3x3NPHicGPmv+VvUtgbakwF
	570X1O7frIwI55h02hZsjbrFsJhnJOj0QNUFfRSdzFGcAgKc6Kldgrl4N2GAtw==
X-Gm-Gg: AeBDiet2jiYYoJPLriumCxmLW5jFAuqQ+lnsbSw3RiZb9VOkAnCc2/IOtPqYm5NpdPR
	ZLHbs8hj2MyizWOdx84jvGnwSvqaQ2OoA1lNCrVKNe96vH/Vi0FywWg3PINW/CYtj2iUMmeuzBL
	tP5jaYVsDnypOU4/ceYe7oGr1Kk69FxR3ko3crtf4SteVpxA2G3xgfGWG3LqY5xCVqqC7YnkU9U
	K71WlqzmulOx6/PXzaSVVVBq/orc8eZD6SlpO8jiPjN0md3GzoAr0xy3gNGzEsXRsc3n+4Au1a8
	nhbO/sndb71aOgTj62x94IxeHp5wFyNVGR4yN7rdi9nf2Sc+JvP5yTqLrX/mWB4piP8q/IQPkA8
	lgWZbH3WE1uWIXaYgMQeEVE02gFX8UxJICXR6E9E+OZTAN9YrJFgwLK6SiW1aU3Uu7rWGTJOB0Z
	ixit1lvxjMlZTjvzaPTaTWeT/avLkSpTSy
X-Received: by 2002:a05:7022:e985:b0:12a:6e97:c21f with SMTP id a92af1059eb24-1317d56ec75mr7904575c88.0.1778300624453;
        Fri, 08 May 2026 21:23:44 -0700 (PDT)
Received: from TestUbuntu22.. ([73.15.108.84])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-2f8884750ffsm4950956eec.19.2026.05.08.21.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 21:23:44 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Jennifer Guo <guojy.bj@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: move block comment terminator to new line
Date: Fri,  8 May 2026 21:23:10 -0700
Message-Id: <20260509042310.4745-3-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260509042310.4745-1-guojy.bj@gmail.com>
References: <20260509042310.4745-1-guojy.bj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move block comment terminator '*/' to separate line in order to
adhere to the kernel coding style.

This fixes the following checkpatch.pl warning:
  WARNING: Block comments use a trailing */ on a separate line

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c  | 3 ++-
 drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 6ab65e9e8bee..005b0b724bdd 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -148,7 +148,8 @@ static void setCCKFilterCoefficient(struct dm_odm_t *pDM_Odm, u8 CCKSwingIndex)
  *When		Who	Remark
  *04/23/2012	MHC	Create Version 0.
  *
- *---------------------------------------------------------------------------*/
+ *---------------------------------------------------------------------------
+ */
 void ODM_TxPwrTrackSetPwr_8723B(
 	struct dm_odm_t *pDM_Odm,
 	enum pwrtrack_method Method,
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
index e56536dbbd96..ad0b2d36312e 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
@@ -53,7 +53,8 @@
  * Return:      NONE
  *
  * Note:		For RF type 0222D
- *---------------------------------------------------------------------------*/
+ *---------------------------------------------------------------------------
+ */
 void PHY_RF6052SetBandwidth8723B(
 	struct adapter *Adapter, enum channel_width Bandwidth
 ) /* 20M or 40M */
-- 
2.34.1

