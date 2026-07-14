Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBCA42B326
	for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 22:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784069578; cv=none; b=rj9kBH//dXwOJqbusLTW+dS6zc9i0ljOfmhCdD7nHL1q3ZL1cpVmjyUIHqjtHNvyW6OilaCXa0fSqtfm5laGyPnA63MsczGc7fUvpiwnzxlZwq6gYKpm+skFC9vU8SZXo6oDaQPTizz6fZXUy2j9YO1gsPcY1dggtinR1b2Zedw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784069578; c=relaxed/simple;
	bh=aneHEOEVTUFpxhruqbXN4fpzumP0voPWx/etkXlO+EI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PaP1b2+J7Kepus5bM6s6B1g2y1qxUo1vy+vYK3I0WdElD9udQ7hGZVFmRlsx3eJhOAkfJj4tHuvTMQQxXSFgjExxLK8uPp7u12FYHx3KPOiQi6jA0Wr+W4xNHPw5i0bgeZmAlidefuMezuy6AJuWMisNwmSKgmhvFiQAD+aH/h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PIpg5Aro; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PIpg5Aro"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-81ed073fed0so1113077b3.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 15:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784069575; x=1784674375; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=huMAZLasX9MtSdlliVLSBQtahcShQoIS8BrLCB4qkoo=;
        b=PIpg5AroIj6rM/6X2hjb3v2GmC+i7U2JLYOOUuT4zTczPokK6Uk9EzHn8xN/MKbs+3
         ctY1e6wKCYjuFmF7e4l8zS3t/sTDchpEGs0d219zrKM4/ZPeBlcSKlesnNkwcmO/nFIG
         daGRd0kSq7Q2yWw/BDPhsBWuSZ4y2H1hOM4rLnBm8R5Ko9gahy9x7/lgr2k8sH1WJVdr
         VwEOVzUJT44vhpEoPWKycYUfc4JfhabNHJzd3I8OhSyD08sKs8iq8nUYx9Xhx5cEAb4H
         eQ9tlIoUzwRnXAT59NG+T4bvSDvUaKIrl3rDzZNo4G5VkCtt++r9t5hqeAIza6s5y5fC
         I3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784069575; x=1784674375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=huMAZLasX9MtSdlliVLSBQtahcShQoIS8BrLCB4qkoo=;
        b=fv0TZ/TiaAE1tji06hNOIzqCH63ttyS4LLoufIR9SpY4KY/n/tyl3h50BeQRDSaysv
         LbS+hj8zmqGCAeYELuEtYuW9oX8CXmKaup+khhDIg6oNPSYdg8sKU7gG01JQsHXtHRcR
         Z5IV8SmCmCx7oKMEmNVpeUjUGS7dM+dmLyYHBdkOEYw51epB5jAuSUNs6y8Q1tLXb41c
         3mxmnpaKfpeDlHoAqSRFomtXfilyPniBgMWoEuShycuaC+Zr8glsV24vRgkXIQzJTNT+
         9L/EiVFvldgCYnH+iUs6a1UAMl7nZNdusBmC6FdYAUD1KINl/Ac1pt3ciakhgkh9S3GX
         /dYg==
X-Forwarded-Encrypted: i=1; AHgh+Rpy9u8NzGC945deKOA2NYoFjM8/U3CE+CWj0H4z65eI49k5CH/En6DZB5XQkoe9LPTYmCVZ6RKQH7aWeUDB@lists.linux.dev
X-Gm-Message-State: AOJu0YwkPgZ33ctboDfm67Ah36dTAVw0E2cuso0Y+vldUIAGR9pUb/Nx
	jEnPAgU/YsfBztQf9qHr/5SVuu9XFja8pAS8wu4jNl6td9tTtm2EJ2tc
X-Gm-Gg: AfdE7clDOd1hr9ugDF/a3XweVtiO4kzS+mNOVj9k+6tFLJWVSs5h5R/i0oZnr+Ov4oh
	TIwMRyDkMXZxbPehxl4HSjiAbfinJG3ZRNIXiO1n4CQ5+UvVCsmi9B1OVa4gMVCm8s0N/nNASSx
	u5Du+6aowaiEoVZnGL7B4NqoUTRUlCjGSmjmzgtYCBd/7UF6pHN2xdj2xCqC9JEcOdVc2dqc+TF
	6IdDRn2JtbB7Orzoz1wuUxYViLp125ogzVAsTno4vvv1zDVnIK6GhJEjiRzZFhJAZaUJ2UtL5u9
	BaB96qApEUP1ZzTIXqeJu/gECXH0uKfpR9d2rdniliCY3Nd4CINdzdI32/qC3pRuKgnYqH089KA
	NZ35sjNY+n5ate1UqeN1VLjZmDSEBEAjc6kq4BWeZQODfSDyj0wxeUVasGAqnCdRnfYJoyK2hlO
	s3nKVuX8EtFtnAQkfVGu+LaF9vlhGRznxaUc2tlSMnsTaADQwnY4UbFz9eaqwgdbvQGay9j2RZW
	IPg
X-Received: by 2002:a05:690c:4507:b0:7e8:6a6a:dc11 with SMTP id 00721157ae682-81ecf86d451mr4640387b3.19.1784069575635;
        Tue, 14 Jul 2026 15:52:55 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:a510:f4e7:1a8:cf71])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c249b87sm153446897b3.49.2026.07.14.15.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 15:52:55 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	feng@innora.ai
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 3/3] staging: media: atomisp: drop redundant out-of-memory messages
Date: Tue, 14 Jul 2026 19:49:02 -0300
Message-ID: <20260714225235.47134-4-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260714225235.47134-1-rodrigo.gobbi.7@gmail.com>
References: <20260714225235.47134-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On allocation failure the memory management core already emits a
detailed warning, so the driver's own IA_CSS_ERROR("out of memory")
lines add nothing but noise.

Remove them; the error handling itself is left unchanged.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/staging/media/atomisp/pci/sh_css_param_dvs.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
index ad2a9b84e232..c0102056d421 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
@@ -25,7 +25,6 @@ alloc_dvs_6axis_table(const struct ia_css_resolution *frame_res,
 
 	dvs_config = kvmalloc_obj(struct ia_css_dvs_6axis_config);
 	if (!dvs_config)	{
-		IA_CSS_ERROR("out of memory");
 		err = -ENOMEM;
 	} else {
 		/*Initialize new struct with latest config settings*/
@@ -52,7 +51,6 @@ alloc_dvs_6axis_table(const struct ia_css_resolution *frame_res,
 		dvs_config->xcoords_y = kvmalloc(array3_size(width_y, height_y, sizeof(uint32_t)),
 						 GFP_KERNEL);
 		if (!dvs_config->xcoords_y) {
-			IA_CSS_ERROR("out of memory");
 			err = -ENOMEM;
 			goto exit;
 		}
@@ -60,7 +58,6 @@ alloc_dvs_6axis_table(const struct ia_css_resolution *frame_res,
 		dvs_config->ycoords_y = kvmalloc(array3_size(width_y, height_y, sizeof(uint32_t)),
 						 GFP_KERNEL);
 		if (!dvs_config->ycoords_y) {
-			IA_CSS_ERROR("out of memory");
 			err = -ENOMEM;
 			goto exit;
 		}
@@ -72,7 +69,6 @@ alloc_dvs_6axis_table(const struct ia_css_resolution *frame_res,
 							      sizeof(uint32_t)),
 						  GFP_KERNEL);
 		if (!dvs_config->xcoords_uv) {
-			IA_CSS_ERROR("out of memory");
 			err = -ENOMEM;
 			goto exit;
 		}
@@ -81,7 +77,6 @@ alloc_dvs_6axis_table(const struct ia_css_resolution *frame_res,
 							      sizeof(uint32_t)),
 						  GFP_KERNEL);
 		if (!dvs_config->ycoords_uv) {
-			IA_CSS_ERROR("out of memory");
 			err = -ENOMEM;
 		}
 exit:
-- 
2.48.1

