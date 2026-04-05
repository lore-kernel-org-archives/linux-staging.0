Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8AD21A447
	for <linux-staging@lists.linux.dev>; Sun,  5 Apr 2026 14:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775400033; cv=none; b=VR/Z9JRfixA64aUjKzNvtNc7O3cGkEIEjU97U0CXSTM9OZzya6KXHNfFe4a1jlAcatXl2U5dSl0b43WT6urPYY1eEDekEBcbJTEnQZs7egTC1jem0Fz9OHhiI3o5nCssq9yjge/lI0dvxXRbx0BDGRyK67rSCzBh3z7ShWoek34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775400033; c=relaxed/simple;
	bh=o57nDzUcwjzzNYdYa1fEZbcujPgrvwX1wbUM7FcCYOY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=haSX3mwwKbygFEy1/JQwdqc3JCzBMoz18WcG+5T2QWkGM55HwFNe7Elm6mW+py3yrbP7UYGoEeK0fns+1lU6KyKe1I9o48M6q0HhCJ6CzG4T43vb0zjn1LdjiJ8PXht37OWuPb6wiJYyZHvoO9gnphtCG4T5ljBQXKPFW8YvsE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FA7Qnuvm; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FA7Qnuvm"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4887fd35e60so20541195e9.2
        for <linux-staging@lists.linux.dev>; Sun, 05 Apr 2026 07:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775400029; x=1776004829; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2rX2Mt4U5Ul/WWWB25XlrFzy7r9st1JdZt2a3PPdzNg=;
        b=FA7QnuvmlqSpjWLJX3aQT9Hxo2HJXEvyRyM0cq1xsvGjujBpo5QVmqCGoqeRvJN0Dc
         nEl/kl7gCYybYAmAhQucPypR189gznUt8ODSDil112kskukER5b1IcQ31gnTV3iRtLcX
         o3VpiKvxd0z58TQ7i9irLf3cveqVf4ojZyGH9yH1+OB9qcKr8ulew4PYRcSmLR6rfNGD
         1fuj84R/6UoXjVM1zspu+5Yv0YxeoKslMgaoXDiJqTHVFcElGWcKZCZseTLxeogVcf12
         asBgTa4/KbJ3RH6uN3M2kecs4VAgR2t/21JIYiGksrYsEXuEzPY58DY2WrMhZs/uqRs0
         rYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775400029; x=1776004829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2rX2Mt4U5Ul/WWWB25XlrFzy7r9st1JdZt2a3PPdzNg=;
        b=DliGPXVz4A2q06MQg04PJagoqBSZo9cNmhEAWoBxVAMVsJ4EfCkQdsz1VLnbAb8fd7
         15PiivIokSTlKiDweRyLYhWEMX5uHC4j+8pRuanSLdar9rO1wxffsZ5iRoT3+XAI1rLy
         8HC3R+eQVfI5h7cPzrT09dliOtUZKtbvjPtXsY6pB9gpTqhOyfTi/IDT/5sC3ZAIJhmg
         uj59GJSDkpbd1UlGyfrhjFwxv7XoaCP2eOtsfL6Y33LXgv7+KsvMr0Y64gQPUcDW6KWV
         MXPIfcwWb7O8ucqrvA6vjGufK8Wt90K0OqdLButEaq8T8auFO0HDS07oRgIyppgMeIkM
         X9Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWUpsExviwWX8axmojaSewnq9u/zbr1flYykLdQijHKf5EV9HzKpr2fRSnAsFq9+6ymbpqOnNMZVB8RDZC5@lists.linux.dev
X-Gm-Message-State: AOJu0YymJ8X//aQImmn/2YC0Iewz8WMCSG5R5mZXM8FJNvJFiI4Lsw/T
	jmooIHp6M0SL5rBw4LJP0qO0NkQpRSpp3CQHllIeJ6AqjTtRrYfQYp7I
X-Gm-Gg: AeBDievImgLS34+K5oRiqHfV0BJvykf5YEkpJ/obZ5xkV7iux6WGdu/daAWAqC/w77Z
	ltM2HOR5Dg4SyrvCnaX0BzNPYear/k0tZkSW5Dz6qK6ncSASt/+fhXnED5nDmQrfrPhHx6/7p23
	zc9flGTJcQ2kVMZrTZijiKxuy//ZpWD0sHZGMlI5kY6fpNU5ApPke0V/gjrufsD1IoBxY4Wqdng
	28BTpAXumCbtiu1m5uBMB/U+oyZnZYSI0j5gSjbAdPmMIP9Be9Ib6/9Q+0Zw5isr6IfezzFpBpK
	o1omgW06sauqxTaoYIoQ0qVOT3xB68qIJrShwwaf1x/kN057JtBCbc0LSwpjyKPsBpD327SAyBa
	JyVykY05yYQf0hNu6HU8flDB/vkx+zbmQprQd6Dwv6ReUr0flqEWHMDNKpW4vnMfNcV15ZNeuU1
	55UOw+QOcqfApxUpBJ1VMgmTCWAOXs/S/s9ydTT2vsvk29KWADoDzZH1we5h4Ishk7GwWe4jpt0
	F3oUmtoaDxUT13Vgoh0/LDNaj+clU0FpbS+lK2zzPZ4PRqnqxeEghGxeTiSWZnE8w/33As1Xoak
	rMQeihFkSqKA8dS/OJk=
X-Received: by 2002:a05:600c:4d06:b0:488:9e43:9690 with SMTP id 5b1f17b1804b1-4889e4397bcmr84321725e9.10.1775400029111;
        Sun, 05 Apr 2026 07:40:29 -0700 (PDT)
Received: from localhost.localdomain (ip-86-49-246-182.bb.vodafone.cz. [86.49.246.182])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899e8e897sm69594945e9.26.2026.04.05.07.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:40:28 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	grondon@gmail.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH v3] staging: media: atomisp: cleanup parenthesis alignment in pci.
Date: Sun,  5 Apr 2026 16:39:11 +0200
Message-Id: <20260405143910.10517-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <adFrJmqSfx7dEJWt@ashevche-desk.local>
References: <adFrJmqSfx7dEJWt@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cleanup parenthesis alignment as per checkpatch.pl in the
pci/ directory.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
v2:
 - cleaned up all files in pci/ directory
v3:
 - removed newlines where params fit the 80 char size on a single line

 .../staging/media/atomisp/pci/atomisp_cmd.c   | 178 +++++++++---------
 .../media/atomisp/pci/atomisp_compat_css20.c  |  37 ++--
 .../staging/media/atomisp/pci/atomisp_fops.c  |   4 +-
 .../media/atomisp/pci/atomisp_subdev.c        |  11 +-
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |   2 +-
 drivers/staging/media/atomisp/pci/sh_css.c    |   4 +-
 .../staging/media/atomisp/pci/sh_css_params.c |  78 ++++----
 drivers/staging/media/atomisp/pci/sh_css_sp.c |   2 +-
 8 files changed, 160 insertions(+), 156 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index fec369575d..b22f880cec 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -356,7 +356,7 @@ void atomisp_eof_event(struct atomisp_sub_device *asd, uint8_t exp_id)
 }
 
 static void atomisp_3a_stats_ready_event(struct atomisp_sub_device *asd,
-	uint8_t exp_id)
+					 uint8_t exp_id)
 {
 	struct v4l2_event event = {0};
 
@@ -367,7 +367,7 @@ static void atomisp_3a_stats_ready_event(struct atomisp_sub_device *asd,
 }
 
 static void atomisp_metadata_ready_event(struct atomisp_sub_device *asd,
-	enum atomisp_metadata_type md_type)
+					 enum atomisp_metadata_type md_type)
 {
 	struct v4l2_event event = {0};
 
@@ -2352,8 +2352,8 @@ int atomisp_cp_lsc_table(struct atomisp_sub_device *asd,
 
 	if (IS_ISP2401) {
 		if (copy_from_compatible(&dest_st, source_st,
-					sizeof(struct atomisp_shading_table),
-					from_user)) {
+					 sizeof(struct atomisp_shading_table),
+					 from_user)) {
 			dev_err(asd->isp->dev, "copy shading table failed!");
 			return -EFAULT;
 		}
@@ -2488,29 +2488,29 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 		dvs_hor_coef_bytes = asd->params.dvs_hor_coef_bytes;
 		dvs_ver_coef_bytes = asd->params.dvs_ver_coef_bytes;
 		if (copy_from_compatible(css_param->dvs2_coeff->hor_coefs.odd_real,
-					coefs->hor_coefs.odd_real, dvs_hor_coef_bytes, from_user) ||
+					 coefs->hor_coefs.odd_real, dvs_hor_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->hor_coefs.odd_imag,
-					coefs->hor_coefs.odd_imag, dvs_hor_coef_bytes, from_user) ||
+					 coefs->hor_coefs.odd_imag, dvs_hor_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->hor_coefs.even_real,
-					coefs->hor_coefs.even_real, dvs_hor_coef_bytes, from_user) ||
+					 coefs->hor_coefs.even_real, dvs_hor_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->hor_coefs.even_imag,
-					coefs->hor_coefs.even_imag, dvs_hor_coef_bytes, from_user) ||
+					 coefs->hor_coefs.even_imag, dvs_hor_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->ver_coefs.odd_real,
-					coefs->ver_coefs.odd_real, dvs_ver_coef_bytes, from_user) ||
+					 coefs->ver_coefs.odd_real, dvs_ver_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->ver_coefs.odd_imag,
-					coefs->ver_coefs.odd_imag, dvs_ver_coef_bytes, from_user) ||
+					 coefs->ver_coefs.odd_imag, dvs_ver_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->ver_coefs.even_real,
-					coefs->ver_coefs.even_real, dvs_ver_coef_bytes, from_user) ||
+					 coefs->ver_coefs.even_real, dvs_ver_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->ver_coefs.even_imag,
-					coefs->ver_coefs.even_imag, dvs_ver_coef_bytes, from_user)) {
+					 coefs->ver_coefs.even_imag, dvs_ver_coef_bytes, from_user)) {
 			ia_css_dvs2_coefficients_free(css_param->dvs2_coeff);
 			css_param->dvs2_coeff = NULL;
 			return -EFAULT;
 		}
 	} else {
 		if (copy_from_compatible(&dvs2_coefs, coefs,
-					sizeof(struct ia_css_dvs2_coefficients),
-					from_user)) {
+					 sizeof(struct ia_css_dvs2_coefficients),
+					 from_user)) {
 			dev_err(asd->isp->dev, "copy dvs2 coef failed");
 			return -EFAULT;
 		}
@@ -2544,21 +2544,21 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 		dvs_hor_coef_bytes = asd->params.dvs_hor_coef_bytes;
 		dvs_ver_coef_bytes = asd->params.dvs_ver_coef_bytes;
 		if (copy_from_compatible(css_param->dvs2_coeff->hor_coefs.odd_real,
-					dvs2_coefs.hor_coefs.odd_real, dvs_hor_coef_bytes, from_user) ||
+					 dvs2_coefs.hor_coefs.odd_real, dvs_hor_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->hor_coefs.odd_imag,
-					dvs2_coefs.hor_coefs.odd_imag, dvs_hor_coef_bytes, from_user) ||
+					 dvs2_coefs.hor_coefs.odd_imag, dvs_hor_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->hor_coefs.even_real,
-					dvs2_coefs.hor_coefs.even_real, dvs_hor_coef_bytes, from_user) ||
+					 dvs2_coefs.hor_coefs.even_real, dvs_hor_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->hor_coefs.even_imag,
-					dvs2_coefs.hor_coefs.even_imag, dvs_hor_coef_bytes, from_user) ||
+					 dvs2_coefs.hor_coefs.even_imag, dvs_hor_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->ver_coefs.odd_real,
-					dvs2_coefs.ver_coefs.odd_real, dvs_ver_coef_bytes, from_user) ||
+					 dvs2_coefs.ver_coefs.odd_real, dvs_ver_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->ver_coefs.odd_imag,
-					dvs2_coefs.ver_coefs.odd_imag, dvs_ver_coef_bytes, from_user) ||
+					 dvs2_coefs.ver_coefs.odd_imag, dvs_ver_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->ver_coefs.even_real,
-					dvs2_coefs.ver_coefs.even_real, dvs_ver_coef_bytes, from_user) ||
+					 dvs2_coefs.ver_coefs.even_real, dvs_ver_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->ver_coefs.even_imag,
-					dvs2_coefs.ver_coefs.even_imag, dvs_ver_coef_bytes, from_user)) {
+					 dvs2_coefs.ver_coefs.even_imag, dvs_ver_coef_bytes, from_user)) {
 			ia_css_dvs2_coefficients_free(css_param->dvs2_coeff);
 			css_param->dvs2_coeff = NULL;
 			return -EFAULT;
@@ -2605,17 +2605,17 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
 		struct ia_css_dvs_6axis_config t_6axis_config;
 
 		if (copy_from_compatible(&t_6axis_config, source_6axis_config,
-					sizeof(struct atomisp_dvs_6axis_config),
-					from_user)) {
+					 sizeof(struct atomisp_dvs_6axis_config),
+					 from_user)) {
 			dev_err(asd->isp->dev, "copy morph table failed!");
 			return -EFAULT;
 		}
 
 		if (old_6axis_config &&
 		    (old_6axis_config->width_y != t_6axis_config.width_y ||
-		    old_6axis_config->height_y != t_6axis_config.height_y ||
-		    old_6axis_config->width_uv != t_6axis_config.width_uv ||
-		    old_6axis_config->height_uv != t_6axis_config.height_uv)) {
+		     old_6axis_config->height_y != t_6axis_config.height_y ||
+		     old_6axis_config->width_uv != t_6axis_config.width_uv ||
+		     old_6axis_config->height_uv != t_6axis_config.height_uv)) {
 			ia_css_dvs2_6axis_config_free(css_param->dvs_6axis);
 			css_param->dvs_6axis = NULL;
 
@@ -2631,39 +2631,39 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
 		dvs_6axis_config->exp_id = t_6axis_config.exp_id;
 
 		if (copy_from_compatible(dvs_6axis_config->xcoords_y,
-					t_6axis_config.xcoords_y,
-					t_6axis_config.width_y *
-					t_6axis_config.height_y *
-					sizeof(*dvs_6axis_config->xcoords_y),
-					from_user))
+					 t_6axis_config.xcoords_y,
+					 t_6axis_config.width_y *
+					 t_6axis_config.height_y *
+					 sizeof(*dvs_6axis_config->xcoords_y),
+					 from_user))
 			goto error;
 		if (copy_from_compatible(dvs_6axis_config->ycoords_y,
-					t_6axis_config.ycoords_y,
-					t_6axis_config.width_y *
-					t_6axis_config.height_y *
-					sizeof(*dvs_6axis_config->ycoords_y),
-					from_user))
+					 t_6axis_config.ycoords_y,
+					 t_6axis_config.width_y *
+					 t_6axis_config.height_y *
+					 sizeof(*dvs_6axis_config->ycoords_y),
+					 from_user))
 			goto error;
 		if (copy_from_compatible(dvs_6axis_config->xcoords_uv,
-					t_6axis_config.xcoords_uv,
-					t_6axis_config.width_uv *
-					t_6axis_config.height_uv *
-					sizeof(*dvs_6axis_config->xcoords_uv),
-					from_user))
+					 t_6axis_config.xcoords_uv,
+					 t_6axis_config.width_uv *
+					 t_6axis_config.height_uv *
+					 sizeof(*dvs_6axis_config->xcoords_uv),
+					 from_user))
 			goto error;
 		if (copy_from_compatible(dvs_6axis_config->ycoords_uv,
-					t_6axis_config.ycoords_uv,
-					t_6axis_config.width_uv *
-					t_6axis_config.height_uv *
-					sizeof(*dvs_6axis_config->ycoords_uv),
-					from_user))
+					 t_6axis_config.ycoords_uv,
+					 t_6axis_config.width_uv *
+					 t_6axis_config.height_uv *
+					 sizeof(*dvs_6axis_config->ycoords_uv),
+					 from_user))
 			goto error;
 	} else {
 		if (old_6axis_config &&
 		    (old_6axis_config->width_y != source_6axis_config->width_y ||
-		    old_6axis_config->height_y != source_6axis_config->height_y ||
-		    old_6axis_config->width_uv != source_6axis_config->width_uv ||
-		    old_6axis_config->height_uv != source_6axis_config->height_uv)) {
+		     old_6axis_config->height_y != source_6axis_config->height_y ||
+		     old_6axis_config->width_uv != source_6axis_config->width_uv ||
+		     old_6axis_config->height_uv != source_6axis_config->height_uv)) {
 			ia_css_dvs2_6axis_config_free(css_param->dvs_6axis);
 			css_param->dvs_6axis = NULL;
 
@@ -2683,32 +2683,32 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
 		dvs_6axis_config->exp_id = source_6axis_config->exp_id;
 
 		if (copy_from_compatible(dvs_6axis_config->xcoords_y,
-					source_6axis_config->xcoords_y,
-					source_6axis_config->width_y *
-					source_6axis_config->height_y *
-					sizeof(*source_6axis_config->xcoords_y),
-					from_user))
+					 source_6axis_config->xcoords_y,
+					 source_6axis_config->width_y *
+					 source_6axis_config->height_y *
+					 sizeof(*source_6axis_config->xcoords_y),
+					 from_user))
 			goto error;
 		if (copy_from_compatible(dvs_6axis_config->ycoords_y,
-					source_6axis_config->ycoords_y,
-					source_6axis_config->width_y *
-					source_6axis_config->height_y *
-					sizeof(*source_6axis_config->ycoords_y),
-					from_user))
+					 source_6axis_config->ycoords_y,
+					 source_6axis_config->width_y *
+					 source_6axis_config->height_y *
+					 sizeof(*source_6axis_config->ycoords_y),
+					 from_user))
 			goto error;
 		if (copy_from_compatible(dvs_6axis_config->xcoords_uv,
-					source_6axis_config->xcoords_uv,
-					source_6axis_config->width_uv *
-					source_6axis_config->height_uv *
-					sizeof(*source_6axis_config->xcoords_uv),
-					from_user))
+					 source_6axis_config->xcoords_uv,
+					 source_6axis_config->width_uv *
+					 source_6axis_config->height_uv *
+					 sizeof(*source_6axis_config->xcoords_uv),
+					 from_user))
 			goto error;
 		if (copy_from_compatible(dvs_6axis_config->ycoords_uv,
-					source_6axis_config->ycoords_uv,
-					source_6axis_config->width_uv *
-					source_6axis_config->height_uv *
-					sizeof(*source_6axis_config->ycoords_uv),
-					from_user))
+					 source_6axis_config->ycoords_uv,
+					 source_6axis_config->width_uv *
+					 source_6axis_config->height_uv *
+					 sizeof(*source_6axis_config->ycoords_uv),
+					 from_user))
 			goto error;
 	}
 	css_param->dvs_6axis = dvs_6axis_config;
@@ -2744,8 +2744,8 @@ int atomisp_cp_morph_table(struct atomisp_sub_device *asd,
 		struct ia_css_morph_table mtbl;
 
 		if (copy_from_compatible(&mtbl, source_morph_table,
-				sizeof(struct atomisp_morph_table),
-				from_user)) {
+					 sizeof(struct atomisp_morph_table),
+					 from_user)) {
 			dev_err(asd->isp->dev, "copy morph table failed!");
 			return -EFAULT;
 		}
@@ -2758,17 +2758,17 @@ int atomisp_cp_morph_table(struct atomisp_sub_device *asd,
 
 		for (i = 0; i < IA_CSS_MORPH_TABLE_NUM_PLANES; i++) {
 			if (copy_from_compatible(morph_table->coordinates_x[i],
-						(__force void *)source_morph_table->coordinates_x[i],
-						mtbl.height * mtbl.width *
-						sizeof(*morph_table->coordinates_x[i]),
-						from_user))
+						 (__force void *)source_morph_table->coordinates_x[i],
+						 mtbl.height * mtbl.width *
+						 sizeof(*morph_table->coordinates_x[i]),
+						 from_user))
 				goto error;
 
 			if (copy_from_compatible(morph_table->coordinates_y[i],
-						(__force void *)source_morph_table->coordinates_y[i],
-						mtbl.height * mtbl.width *
-						sizeof(*morph_table->coordinates_y[i]),
-						from_user))
+						 (__force void *)source_morph_table->coordinates_y[i],
+						 mtbl.height * mtbl.width *
+						 sizeof(*morph_table->coordinates_y[i]),
+						 from_user))
 				goto error;
 		}
 	} else {
@@ -2782,17 +2782,17 @@ int atomisp_cp_morph_table(struct atomisp_sub_device *asd,
 
 		for (i = 0; i < IA_CSS_MORPH_TABLE_NUM_PLANES; i++) {
 			if (copy_from_compatible(morph_table->coordinates_x[i],
-						(__force void *)source_morph_table->coordinates_x[i],
-						source_morph_table->height * source_morph_table->width *
-						sizeof(*source_morph_table->coordinates_x[i]),
-						from_user))
+						 (__force void *)source_morph_table->coordinates_x[i],
+						 source_morph_table->height * source_morph_table->width *
+						 sizeof(*source_morph_table->coordinates_x[i]),
+						 from_user))
 				goto error;
 
 			if (copy_from_compatible(morph_table->coordinates_y[i],
-						(__force void *)source_morph_table->coordinates_y[i],
-						source_morph_table->height * source_morph_table->width *
-						sizeof(*source_morph_table->coordinates_y[i]),
-						from_user))
+						 (__force void *)source_morph_table->coordinates_y[i],
+						 source_morph_table->height * source_morph_table->width *
+						 sizeof(*source_morph_table->coordinates_y[i]),
+						 from_user))
 				goto error;
 		}
 	}
@@ -3318,7 +3318,7 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
 	   bytes. The RAW frame we use here should always be a 16bit RAW
 	   frame. This is why we bytesperline/2 is equal to the padded with */
 	if (ia_css_frame_allocate(&res, arg->fmt.width, arg->fmt.height,
-				       sh_format, padded_width, 0)) {
+				  sh_format, padded_width, 0)) {
 		ret = -ENOMEM;
 		goto err;
 	}
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index be5f37f4a6..347389a64c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -584,7 +584,7 @@ static void __apply_additional_pipe_config(
 }
 
 static bool is_pipe_valid_to_current_run_mode(struct atomisp_sub_device *asd,
-	enum ia_css_pipe_id pipe_id)
+					      enum ia_css_pipe_id pipe_id)
 {
 	if (pipe_id == IA_CSS_PIPE_ID_YUVPP)
 		return true;
@@ -1025,7 +1025,7 @@ void atomisp_css_update_isp_params(struct atomisp_sub_device *asd)
 }
 
 void atomisp_css_update_isp_params_on_pipe(struct atomisp_sub_device *asd,
-	struct ia_css_pipe *pipe)
+					   struct ia_css_pipe *pipe)
 {
 	int ret;
 
@@ -1456,8 +1456,8 @@ int atomisp_css_input_set_resolution(struct atomisp_sub_device *asd,
 }
 
 void atomisp_css_input_set_binning_factor(struct atomisp_sub_device *asd,
-	enum atomisp_input_stream_id stream_id,
-	unsigned int bin_factor)
+					  enum atomisp_input_stream_id stream_id,
+					  unsigned int bin_factor)
 {
 	asd->stream_env[stream_id]
 	.stream_config.sensor_binning_factor = bin_factor;
@@ -1908,8 +1908,9 @@ static void __configure_output(struct atomisp_sub_device *asd,
  * downscaling input resolution.
  */
 static void __configure_capture_pp_input(struct atomisp_sub_device *asd,
-	unsigned int width, unsigned int height,
-	enum ia_css_pipe_id pipe_id)
+					 unsigned int width,
+					 unsigned int height,
+					 enum ia_css_pipe_id pipe_id)
 {
 	struct atomisp_device *isp = asd->isp;
 	struct atomisp_stream_env *stream_env =
@@ -1960,8 +1961,8 @@ static void __configure_capture_pp_input(struct atomisp_sub_device *asd,
  * yuv downscaling, which needs addtional configurations.
  */
 static void __configure_preview_pp_input(struct atomisp_sub_device *asd,
-	unsigned int width, unsigned int height,
-	enum ia_css_pipe_id pipe_id)
+					 unsigned int width, unsigned int height,
+					 enum ia_css_pipe_id pipe_id)
 {
 	struct atomisp_device *isp = asd->isp;
 	int out_width, out_height, yuv_ds_in_width, yuv_ds_in_height;
@@ -2317,9 +2318,10 @@ int atomisp_css_copy_configure_output(struct atomisp_sub_device *asd,
 }
 
 int atomisp_css_preview_configure_output(struct atomisp_sub_device *asd,
-	unsigned int width, unsigned int height,
-	unsigned int min_width,
-	enum ia_css_frame_format format)
+					 unsigned int width,
+					 unsigned int height,
+					 unsigned int min_width,
+					 enum ia_css_frame_format format)
 {
 	__configure_output(asd, ATOMISP_INPUT_STREAM_GENERAL, width, height,
 			   min_width, format, IA_CSS_PIPE_ID_PREVIEW);
@@ -2327,9 +2329,10 @@ int atomisp_css_preview_configure_output(struct atomisp_sub_device *asd,
 }
 
 int atomisp_css_capture_configure_output(struct atomisp_sub_device *asd,
-	unsigned int width, unsigned int height,
-	unsigned int min_width,
-	enum ia_css_frame_format format)
+					 unsigned int width,
+					 unsigned int height,
+					 unsigned int min_width,
+					 enum ia_css_frame_format format)
 {
 	__configure_output(asd, ATOMISP_INPUT_STREAM_GENERAL, width, height,
 			   min_width, format, IA_CSS_PIPE_ID_CAPTURE);
@@ -2456,7 +2459,9 @@ int atomisp_css_video_configure_pp_input(
 }
 
 int atomisp_css_offline_capture_configure(struct atomisp_sub_device *asd,
-	int num_captures, unsigned int skip, int offset)
+					  int num_captures,
+					  unsigned int skip,
+					  int offset)
 {
 	int ret;
 
@@ -3355,7 +3360,7 @@ void atomisp_css_set_isp_config_id(struct atomisp_sub_device *asd,
 }
 
 void atomisp_css_set_isp_config_applied_frame(struct atomisp_sub_device *asd,
-	struct ia_css_frame *output_frame)
+					      struct ia_css_frame *output_frame)
 {
 	asd->params.config.output_frame = output_frame;
 }
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index c7aef066f2..c51d04af6c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -96,8 +96,8 @@ static int atomisp_buf_init(struct vb2_buffer *vb)
 }
 
 static int atomisp_q_one_metadata_buffer(struct atomisp_sub_device *asd,
-	enum atomisp_input_stream_id stream_id,
-	enum ia_css_pipe_id css_pipe_id)
+					 enum atomisp_input_stream_id stream_id,
+					 enum ia_css_pipe_id css_pipe_id)
 {
 	struct atomisp_metadata_buf *metadata_buf;
 	enum atomisp_metadata_type md_type = ATOMISP_MAIN_METADATA;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 3d56ca83ec..d707e13ae7 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -202,9 +202,10 @@ static int isp_subdev_validate_rect(struct v4l2_subdev *sd, uint32_t pad,
 }
 
 struct v4l2_rect *atomisp_subdev_get_rect(struct v4l2_subdev *sd,
-	struct v4l2_subdev_state *sd_state,
-	u32 which, uint32_t pad,
-	uint32_t target)
+					  struct v4l2_subdev_state *sd_state,
+					  u32 which,
+					  uint32_t pad,
+					  uint32_t target)
 {
 	struct atomisp_sub_device *isp_sd = v4l2_get_subdevdata(sd);
 
@@ -841,8 +842,8 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
 	asd->vfpp = v4l2_ctrl_new_custom(&asd->ctrl_handler,
 					 &ctrl_vfpp, NULL);
 	asd->continuous_viewfinder = v4l2_ctrl_new_custom(&asd->ctrl_handler,
-				     &ctrl_continuous_viewfinder,
-				     NULL);
+							  &ctrl_continuous_viewfinder,
+							  NULL);
 	asd->continuous_raw_buffer_size =
 	    v4l2_ctrl_new_custom(&asd->ctrl_handler,
 				 &ctrl_continuous_raw_buffer_size,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 900a67552d..33b46bdf24 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -846,7 +846,7 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 	/* Register internal entities */
 	for (i = 0; i < ATOMISP_CAMERA_NR_PORTS; i++) {
 		ret = atomisp_mipi_csi2_register_entities(&isp->csi2_port[i],
-			&isp->v4l2_dev);
+							  &isp->v4l2_dev);
 		if (ret == 0)
 			continue;
 
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 6cda5925fa..4de35fea38 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -4385,7 +4385,7 @@ sh_css_pipe_get_grid_info(struct ia_css_pipe *pipe,
 	} else {
 		memset(&info->dvs_grid, 0, sizeof(info->dvs_grid));
 		memset(&info->dvs_grid.dvs_stat_grid_info, 0,
-			   sizeof(info->dvs_grid.dvs_stat_grid_info));
+		       sizeof(info->dvs_grid.dvs_stat_grid_info));
 	}
 
 	if (binary) {
@@ -4797,7 +4797,7 @@ static int video_start(struct ia_css_pipe *pipe)
 
 	if (pipe->stream->cont_capt) {
 		ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(capture_pipe),
-						    &thread_id);
+						 &thread_id);
 		copy_ovrd |= 1 << thread_id;
 	}
 
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index fcebace11d..1d383c034b 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -1057,9 +1057,7 @@ ia_css_params_store_ia_css_host_data(
 
 	IA_CSS_ENTER_PRIVATE("");
 
-	hmm_store(ddr_addr,
-		   (void *)(data->address),
-		   (size_t)data->size);
+	hmm_store(ddr_addr, (void *)(data->address), (size_t)data->size);
 
 	IA_CSS_LEAVE_PRIVATE("void");
 }
@@ -2628,8 +2626,7 @@ static void host_lut_store(const void *lut)
 		gdc_lut_store((gdc_ID_t)i, (const int (*)[HRT_GDC_N]) lut);
 }
 
-int ia_css_pipe_set_bci_scaler_lut(struct ia_css_pipe *pipe,
-	const void *lut)
+int ia_css_pipe_set_bci_scaler_lut(struct ia_css_pipe *pipe, const void *lut)
 {
 	int err = 0;
 	bool stream_started = false;
@@ -2670,8 +2667,8 @@ int ia_css_pipe_set_bci_scaler_lut(struct ia_css_pipe *pipe,
 			gdc_lut_convert_to_isp_format((const int(*)[HRT_GDC_N])lut,
 						      interleaved_lut_temp);
 			hmm_store(pipe->scaler_pp_lut,
-				   (int *)interleaved_lut_temp,
-				   sizeof(zoom_table));
+				  (int *)interleaved_lut_temp,
+				  sizeof(zoom_table));
 		}
 	}
 
@@ -2710,7 +2707,7 @@ int sh_css_params_map_and_store_default_gdc_lut(void)
 	gdc_lut_convert_to_isp_format((const int(*)[HRT_GDC_N])zoom_table,
 				      interleaved_lut_temp);
 	hmm_store(default_gdc_lut, (int *)interleaved_lut_temp,
-		   sizeof(zoom_table));
+		  sizeof(zoom_table));
 
 	IA_CSS_LEAVE_PRIVATE("lut(%u) err=%d", default_gdc_lut, err);
 	return err;
@@ -3435,8 +3432,8 @@ sh_css_params_write_to_ddr_internal(
 			return err;
 		}
 		hmm_store(ddr_map->macc_tbl,
-			   converted_macc_table.data,
-			   sizeof(converted_macc_table.data));
+			  converted_macc_table.data,
+			  sizeof(converted_macc_table.data));
 	}
 
 	if (binary->info->sp.enable.dvs_6axis) {
@@ -3483,9 +3480,9 @@ sh_css_params_write_to_ddr_internal(
 				params->pipe_dvs_6axis_config_changed[pipe_id] = true;
 
 				store_dvs_6axis_config(params->pipe_dvs_6axis_config[pipe_id],
-						    binary,
-						    dvs_in_frame_info,
-						    ddr_map->dvs_6axis_params_y);
+						       binary,
+						       dvs_in_frame_info,
+						       ddr_map->dvs_6axis_params_y);
 				params->isp_params_changed = true;
 			}
 		}
@@ -3538,20 +3535,20 @@ sh_css_params_write_to_ddr_internal(
 		for (i = 0; i < IA_CSS_MORPH_TABLE_NUM_PLANES; i++) {
 			buff_realloced |=
 			    reallocate_buffer(virt_addr_tetra_x[i],
-					    virt_size_tetra_x[i],
-					    morph_plane_bytes(binary),
-					    params->morph_table_changed,
-					    &err);
+					      virt_size_tetra_x[i],
+					      morph_plane_bytes(binary),
+					      params->morph_table_changed,
+					      &err);
 			if (err) {
 				IA_CSS_LEAVE_ERR_PRIVATE(err);
 				return err;
 			}
 			buff_realloced |=
 			    reallocate_buffer(virt_addr_tetra_y[i],
-					    virt_size_tetra_y[i],
-					    morph_plane_bytes(binary),
-					    params->morph_table_changed,
-					    &err);
+					      virt_size_tetra_y[i],
+					      morph_plane_bytes(binary),
+					      params->morph_table_changed,
+					      &err);
 			if (err) {
 				IA_CSS_LEAVE_ERR_PRIVATE(err);
 				return err;
@@ -3578,15 +3575,15 @@ sh_css_params_write_to_ddr_internal(
 
 			for (i = 0; i < IA_CSS_MORPH_TABLE_NUM_PLANES; i++) {
 				store_morph_plane(table->coordinates_x[i],
-						table->width,
-						table->height,
-						*virt_addr_tetra_x[i],
-						binary->morph_tbl_aligned_width);
+						  table->width,
+						  table->height,
+						  *virt_addr_tetra_x[i],
+						  binary->morph_tbl_aligned_width);
 				store_morph_plane(table->coordinates_y[i],
-						table->width,
-						table->height,
-						*virt_addr_tetra_y[i],
-						binary->morph_tbl_aligned_width);
+						  table->width,
+						  table->height,
+						  *virt_addr_tetra_y[i],
+						  binary->morph_tbl_aligned_width);
 			}
 			if (id_table)
 				ia_css_morph_table_free(id_table);
@@ -3597,15 +3594,15 @@ sh_css_params_write_to_ddr_internal(
 	for (mem = 0; mem < N_IA_CSS_MEMORIES; mem++) {
 		const struct ia_css_isp_data *isp_data =
 		    ia_css_isp_param_get_isp_mem_init(&binary->info->sp.mem_initializers,
-						    IA_CSS_PARAM_CLASS_PARAM, mem);
+						      IA_CSS_PARAM_CLASS_PARAM, mem);
 		size_t size = isp_data->size;
 
 		if (!size) continue;
 		buff_realloced = reallocate_buffer(&ddr_map->isp_mem_param[stage_num][mem],
-						&ddr_map_size->isp_mem_param[stage_num][mem],
-						size,
-						params->isp_mem_params_changed[pipe_id][stage_num][mem],
-						&err);
+						   &ddr_map_size->isp_mem_param[stage_num][mem],
+						   size,
+						   params->isp_mem_params_changed[pipe_id][stage_num][mem],
+						   &err);
 		if (err) {
 			IA_CSS_LEAVE_ERR_PRIVATE(err);
 			return err;
@@ -3761,8 +3758,8 @@ ia_css_ptr sh_css_store_sp_stage_to_ddr(
 {
 	IA_CSS_ENTER_LEAVE_PRIVATE("void");
 	hmm_store(xmem_sp_stage_ptrs[pipe][stage],
-		   &sh_css_sp_stage,
-		   sizeof(struct sh_css_sp_stage));
+		  &sh_css_sp_stage,
+		  sizeof(struct sh_css_sp_stage));
 	return xmem_sp_stage_ptrs[pipe][stage];
 }
 
@@ -3772,8 +3769,8 @@ ia_css_ptr sh_css_store_isp_stage_to_ddr(
 {
 	IA_CSS_ENTER_LEAVE_PRIVATE("void");
 	hmm_store(xmem_isp_stage_ptrs[pipe][stage],
-		   &sh_css_isp_stage,
-		   sizeof(struct sh_css_isp_stage));
+		  &sh_css_isp_stage,
+		  sizeof(struct sh_css_isp_stage));
 	return xmem_isp_stage_ptrs[pipe][stage];
 }
 
@@ -3810,7 +3807,7 @@ static int ref_sh_css_ddr_address_map(
 			to_addrs.addrs[i] = mmgr_NULL;
 		else
 			to_addrs.addrs[i] = ia_css_refcount_increment(IA_CSS_REFCOUNT_PARAM_BUFFER,
-					    in_addrs.addrs[i]);
+								      in_addrs.addrs[i]);
 	}
 
 	IA_CSS_LEAVE_ERR_PRIVATE(err);
@@ -3834,7 +3831,8 @@ static int write_ia_css_isp_parameter_set_info_to_ddr(
 	succ = (*out != mmgr_NULL);
 	if (succ)
 		hmm_store(*out,
-			   me, sizeof(struct ia_css_isp_parameter_set_info));
+			  me,
+			  sizeof(struct ia_css_isp_parameter_set_info));
 	else
 		err = -ENOMEM;
 
diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 6da151e7a8..8559d37822 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -1464,7 +1464,7 @@ sh_css_update_host2sp_num_mipi_frames(unsigned int num_frames)
 
 void
 sh_css_update_host2sp_cont_num_raw_frames(unsigned int num_frames,
-	bool set_avail)
+					  bool set_avail)
 {
 	const struct ia_css_fw_info *fw;
 	unsigned int HIVE_ADDR_host_sp_com;
-- 
2.34.1

