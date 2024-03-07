Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AB982871
	for <linux-staging@lists.linux.dev>; Thu,  7 Mar 2024 08:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709801071; cv=none; b=cYLMT/VUbf2eH2IHve0MqYB09V4bqgLBG3k+wpz9g1PCfZ75kzsUY2Qyw211kgv/8IjH0shVkMxejeCMJuzUl0DIPxK1Tahxrg0xVYNkTFAtUX6sVD2kwhVfPl3PIrIqVCx/qGewPh7W9JM2OBXML0+h7XW10Wyxidtn+UrZQ9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709801071; c=relaxed/simple;
	bh=fm0iBgE4SabS3Bl2mSLF5myIjuvQi4ZNn/Ua5rusr/Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nIU9JtZXFlRSIRWSAwwHnQWcubjotLbggAoNA99eZGrrNtOqAo/ztMdGDXYx8ovLSPT9aMcyNINm/lrIQkvoDOQA4qXKU8lVkb0a6dqyXl/+Tft8zw81C7LE2WwRad0IJTNz/7cI6hRexysf2P5bYUy4mPmo5slqEycATAJDDW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YzkOXJ18; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YzkOXJ18"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-564fd9eea75so792833a12.3
        for <linux-staging@lists.linux.dev>; Thu, 07 Mar 2024 00:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709801067; x=1710405867; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FoquaOEmQrmaw/2L6NuqbXwLRBOw43U2O3ew7WfCd14=;
        b=YzkOXJ18qfb91Vim30ITaHvOQOxEfgmHpZWH+iBbuRAHY5G14VW/GMwrs4rxEGIo5F
         QPnAewBtJQv5pRWpKkjeD2tX+Zgi9VwNIC98Lu3Ooqf+wBr9nD7TA2lDEo0VMHgJPoK/
         K74hF6Nb/ugSNmNk2hImfCr6bsoSHkgBzmNjzTKS3WE7/DlnVYm0zpBHBap99J+xgmjj
         fnkF33slq1Bnjbxc+NRSUYWhPoP6Wv/gPQa4rKq5GsrmBdSfMNwDbMKpBRc/qrmtF35x
         mVUNGaMqn0tJh2v+zq7rsV7OtdKurbblJqbltp48R+vk6QYmihYDUT1rn3S1CPtVAf1C
         3Fag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709801067; x=1710405867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FoquaOEmQrmaw/2L6NuqbXwLRBOw43U2O3ew7WfCd14=;
        b=qOXo/A+Lvz2likQnOMKf3w5MWhIRYtDx905P6tjNOEO1t+eYjPTIQ7njIoZPZq8bf/
         +5ZtYAe5OAJAaXez04JxHIbqM3fDIDWXz7l+Sn0i5VjspPkPsYGACvPnWf4ipzpXvbHl
         L/paQI0TvgV6LNzcOg1U8fxVecuRch0TVqas0d2zIugfzGXFOTsuX6Ip9QOtUjtasapP
         XCLqlR5s0Var9OtoFb1lUHsb5fxfmGmAFHgLkMK5SVKUnY5OS2dXguTTVdu08/RgEqPT
         YHEhk4kuSMFRkA3fK/T3pPp2302puMSzXfjn7P8J2IQZBJaskpGUxnMco4zS1pb2b/mE
         p3mA==
X-Forwarded-Encrypted: i=1; AJvYcCVnyzdpO7mzaYEnejPNPNRyzJZNP0UwDudiS2L/RzXJ4EkHle3m4QQjd0uffo3wkkP7DcQawT0ckZLVnH/AaO4qRR2r0nNnzwcBFu6sRA==
X-Gm-Message-State: AOJu0YzSWHPH1G5deB5XB/0GMxCEtb6c0fGB35GiF+dayYTE/UvfOAEW
	ukPWbVCaEuV/PajPtnqd9E2hVrClF2rUT/zzx1cgPklc5tgeYWuA
X-Google-Smtp-Source: AGHT+IFZL6NYsiT1l/iU8GebYvDLrylEs3PS0k2he6H/eKFsZQ/jSQkbM2UHgRAgw+obMCIHmMgI7A==
X-Received: by 2002:a17:906:b08:b0:a45:248e:b253 with SMTP id u8-20020a1709060b0800b00a45248eb253mr8650257ejg.76.1709801067308;
        Thu, 07 Mar 2024 00:44:27 -0800 (PST)
Received: from localhost.localdomain ([213.55.225.151])
        by smtp.gmail.com with ESMTPSA id s23-20020a170906a19700b00a44899a44ddsm7074215ejy.11.2024.03.07.00.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 00:44:26 -0800 (PST)
From: Ali Zahraee <ahzahraee@gmail.com>
To: sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com,
	tian.shu.qiu@intel.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: Ali Zahraee <ahzahraee@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	javier.carrasco.cruz@gmail.com
Subject: [PATCH] Documentation: media: remove documentation of obsolete struct members
Date: Thu,  7 Mar 2024 09:44:04 +0100
Message-Id: <20240307084404.7796-1-ahzahraee@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These struct members were removed from the struct, but their
documentation is still there, which causes warnings from sphinx during
building of the docs.

Signed-off-by: Ali Zahraee <ahzahraee@gmail.com>
---
 drivers/staging/media/ipu3/include/uapi/intel-ipu3.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
index caa358e0bae4..4aa2797f5e3c 100644
--- a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
@@ -2485,11 +2485,9 @@ struct ipu3_uapi_anr_config {
  *		&ipu3_uapi_yuvp1_y_ee_nr_config
  * @yds:	y down scaler config. See &ipu3_uapi_yuvp1_yds_config
  * @chnr:	chroma noise reduction config. See &ipu3_uapi_yuvp1_chnr_config
- * @reserved1: reserved
  * @yds2:	y channel down scaler config. See &ipu3_uapi_yuvp1_yds_config
  * @tcc:	total color correction config as defined in struct
  *		&ipu3_uapi_yuvp2_tcc_static_config
- * @reserved2: reserved
  * @anr:	advanced noise reduction config.See &ipu3_uapi_anr_config
  * @awb_fr:	AWB filter response config. See ipu3_uapi_awb_fr_config
  * @ae:	auto exposure config  As specified by &ipu3_uapi_ae_config
@@ -2724,7 +2722,6 @@ struct ipu3_uapi_obgrid_param {
  * @acc_ae: 0 = no update, 1 = update.
  * @acc_af: 0 = no update, 1 = update.
  * @acc_awb: 0 = no update, 1 = update.
- * @__acc_osys: 0 = no update, 1 = update.
  * @reserved3: Not used.
  * @lin_vmem_params: 0 = no update, 1 = update.
  * @tnr3_vmem_params: 0 = no update, 1 = update.
-- 
2.34.1

