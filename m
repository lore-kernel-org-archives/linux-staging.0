Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7FE37B014
	for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 22:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782168273; cv=none; b=FvIH2KPyYUPuwyUUAa/vqupGq6Rqs2paF/OznCn/4RGXatwzROSL9DeFKF7daemMv/YFxzdprtTSLSXbEgR4rfTHLiSx4nJlMy1wyOwlu5aXVuX7JD3UItrksK2nvTHwySTn07BUDhQiF/A39Bdc2g02oDekZ8JX6fhrJL2Ft3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782168273; c=relaxed/simple;
	bh=ZfxkuR/9Vuef1Q22juZJ6EBv0iqn5LNDE8SSCqmYfWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ErBFgzwrY4S2yQOysykYEEVrWh3F+2eyr6IihC70b9GZurgLsKoj8kKEpfWmV+TFODhqxxt/DnySFXmyCwEtMxDt1VSjQTHODijhGpRFOX/IGa2xgw5Uw17pVIgFj8hocrzZ5AvObrW6DfaZLMQ0Gh5MZCyxn5+e0nkR9sXVG/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dRfPcA+U; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dRfPcA+U"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3042a388168so336269eec.1
        for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 15:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782168272; x=1782773072; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fjpcGprWwQ0lr9GK2KFC92iw63YTslpmj1gCXP7xFg=;
        b=dRfPcA+UnBNcbIs2GlRJiipVJ5Ba56jVaUvKdrPq5D0OwuWiiDtAF9Kuu5b1matqV/
         y8A1vc1URciY7ybE5kSU2EDBz2EW6cIROA8tG3dy+9fGxZ2NnvK+ACwk75OkXYpUTQEv
         7YkggwhXeZpGRGib1r6TDZFbGJBLtj4WBZiEtNSrIiNXT6SzO2b9ETs1YORGfkeE3Rax
         ua/Po6Kaytp9P5WgFqURJyle5UlV/FZCZPJCXK0CkW7PrHMXiO1IR6argRo+UwGSjfS+
         OZvqlVWb5Z7+zRmCxCGQ5fL7IcUI/3tDO2kZis/hutQC30HnNunozsTJHWVfp4YTw/Xw
         OYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782168272; x=1782773072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7fjpcGprWwQ0lr9GK2KFC92iw63YTslpmj1gCXP7xFg=;
        b=URL60QNWtnhRKba22KI9/BCRgwMyBxYPY5pY6/sSudAO7/ItjuWMp8kAKkoL+28tx+
         U74dVv7oZnsfMXW7CnYulQ+k/uLwL4ydHKthzTS99m2pJwUC/dmSysh33T8q/BV67NfH
         amb1G2cworottJDdy/1bbDLFQwVWTT2oyofFBQcPtDMUBiwVkLsnOHiv2Zb9fcIeKKPM
         5OpoPb4y88yTp6lh119esskdIhq8eguztjk7FIpsjTxObp/AE1cYkWv2IVebM2VFl0Xl
         p5YnyEhYOYJDKD1GNf4oz+OmCgPODpqHpXp7hdBT4NNid+uiMZInxSYnAtIddVz6558x
         Wqhw==
X-Forwarded-Encrypted: i=1; AHgh+RpVgVzYeVIgU/t2KGCQEHHncnkhJpvkD3WOUcb3z5tE6ZuRsH90FUj6KfEFg92G4OCVipT8+7KH+qQKz0Wv@lists.linux.dev
X-Gm-Message-State: AOJu0YzBomVVzb242RMGkm35HKTAlUuWpfd8/r8nkSg66bk64zTjSxzc
	lz2viFhEcGxePPTiFl63W8igL5wRIbWFzKtgUQ4PJCGDAEhKg+hVMSiu
X-Gm-Gg: AfdE7cle+uIKjGMd9y+FVhVmBOqd93Skfss5/0utryh6Ii0N5ykS/vphsUonCxj69oR
	Dt5ENKtONIRkFD8HagJXBkhGv+9Sq2yrUTj6n/yG/zwr17oDcuTr5sh43zl5o6Ok5pMpR0wZ24K
	dKLSLn6XRuezj6B1gHBHCHdj44ywPZo6mkNDEleYs2C+HU6dSi8wdre60oU43JZwdowHZ2ZtkQl
	uXSSP7nAco/+H9jjhZZBKUJuuFNbx8KRDjEfSaTPUlKboQJR8AqR89VNgO5TvFlcFvqHcqY8fR/
	pOEaOrXXMeltfFCRffSGuOrsdTsZSYdP1f/2zmvph1ij26DEVriO1J3fIqmM4Zn+/4PZkFtTdS1
	EuR64iKqUVVcKxMHM7myLeVWtvxqJbawXSAenxRrFQyx8c7xMgNBK3I1GncC1d5lDLbmW+jjLzD
	wxV2NwmO9s9jBDhlduup5jHhGUbCtHo8uiBRpwg5//fSOCvf6vCnz9XIGYX/i8IQyJZlo=
X-Received: by 2002:a05:7300:7313:b0:304:cd0d:9ea5 with SMTP id 5a478bee46e88-30c555526ecmr1107469eec.7.1782168271573;
        Mon, 22 Jun 2026 15:44:31 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:691c:629b:eda4:7c2e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1ba1c376sm13087954eec.3.2026.06.22.15.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 15:44:31 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 3/3] staging: media: atomisp: drop redundant out-of-memory messages
Date: Mon, 22 Jun 2026 19:42:44 -0300
Message-ID: <20260622224402.34001-4-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260622224402.34001-1-rodrigo.gobbi.7@gmail.com>
References: <20260622224402.34001-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On allocation failure the memory management core already emits a detailed
warning so driver's own IA_CSS_ERROR("out of memory") lines add nothing but noise.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
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

