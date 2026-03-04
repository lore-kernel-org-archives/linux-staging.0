Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38632848A0
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 13:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772632286; cv=none; b=c7K9Gzl3Qy4fnNvRygKl4Rv2hHp2MIUaKhx55WYYmnO7gFt+ufNdOodIo0ghbNkfMi8OXFUhsT3+Q7f7Rc4Hgqc+FkOGY+ToG2VkrD6ujkl+byBNjyCtp1rcDCnvvh1z29pAJCnCS5NDnCRtTOpyBPco+8TjUasTEsr7B61L0QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772632286; c=relaxed/simple;
	bh=bhBMtTdOOntrNP0qIaIr5UFXAwVxNP5MgYNTWX8QSuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L5bQu2sENgmp9F7N1YCI6P/vysMi8dWW7/BD+AvdJghRlFBC1tjm0qN9k4OSLMoGomLKX3vTNKWf7eVf5O7kfe5JJVoakFr9KbiVG3SmE7JYW8Y1MZHUO1pyhoCP0tsGGV7/yOu+tXSaJc67F3Yrj0vaCOlijI642909KPxWoFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YnMrgFBL; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YnMrgFBL"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b8fb6ad3243so1011975366b.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 05:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772632282; x=1773237082; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yPvcBxeb6bLXtj51SXDdoU9e9wr4RMgGlTDHdUvIrrs=;
        b=YnMrgFBLmF/NlUUBxBfysFkgAPYbe9mszheJc1V63RuCO6166Z8KA+1Azf1BAgsSTV
         kw5T5Y0O0NpQiSBC+E1P/Ob+uhMUF5OqL/4Meksw99pX6Mj1SA16LTpOCDSG0Y/Dhilh
         mhGvtFywSi74zWXPZN3bY4UvIUJayZfDAB1s7PNLICAxTN0m23nO9GJgjCrNxmml0hzp
         qeDweBBcCUbm6GPa4P8Ozli5+jcKxWAXoyAjcXRmfQbg2EqTrMK37lTzYeXb/bEpDTPC
         EirVev6xvSHhBpmlYFioVHLcX2963h61reknLGGuvLfwXFVtch14jtA144jVz0+AvrYZ
         jcgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772632282; x=1773237082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yPvcBxeb6bLXtj51SXDdoU9e9wr4RMgGlTDHdUvIrrs=;
        b=YGL0ihGwtOHsQiHG27TKuzqEyYkJ3A1+FWrB0crkm09dlkjv/GF0JvOOMb6WmqXNL+
         5FYQ+Ad2MrYZDQZ4Q2cCai7aXl+suzu0fzvLjJpC1I2a8ol5WKZJyW2tdjNlMfzdFhAS
         KL2KE39d1sbPiGBAyE6YzK5DYf5PpiorahxAmC1vPHfY9XKVkA+3jCVdZtXP4dARfzJg
         ZoG1j1DXxvOEhh5BIUA4VUeTA7Dg0FGXzXGyWDRD9IcNTh7PLZKkVXrj+p39JWzghNxp
         e9a0d5Km1nNQkh/Vqfge9x3lQP59iucFaL9Pl86vNz6jfX1BR2X3sumahT986ftt/2PH
         6trg==
X-Gm-Message-State: AOJu0Yxy1d8YHi4j1ly0mFUqe9mAD51piM6R8NLBezB6CM/Ls3d7E7GU
	MOjkHL8PONigI9dIe91be6ypUcfSArx/ziEYjbiYuYuz5X6bmBCM1Jmcpg+fqYOL80kfcA==
X-Gm-Gg: ATEYQzzTb8RK/gRHFg5Ur0OlwnK4rJqeiVFYP/SnkYTYuaR2sEGabpItj0XYaSbXlx7
	ykhQ6XW2OmXA+oyXDK73KTsLG36Ay7SO2mkHhH7g33nlyqekJG9fOcLuWpdG3DMxDACCDdJQm2C
	v8eiOZuy9eVUZaDWe5xxddNGPAiVG1S2R9TPW/EAVnXMv0hYXOLNI31ByYWXRiecgZsgcsu35DC
	azh/T/T+mIm/fnCT+OyFxPNwVcnzqP2RWHSbIgJl+LVdTpiyOQPbKFXZjpQqHqjxgrSc0FuS3Gh
	jkDEs+K2mKugsnwFiyk0p5c1FdmyV4z1VAEpR2kkH3jFrky5DwA5+PCZ3Zur45quaNM+LbphdgO
	nJxNVb5fVfD9BmTV08TIDKvWzMEEDKBl6tWKdoFGqlmlxpw9otMSDYv640BLspXax62xjEzsjDC
	aISPhfFM7/IBKwBkg3V8tvyRcSg4DjW2OgtMfhNLUtdthaI4HbvtT2GG0cUBYwcZYvNbYZJSO3E
	R+jmLxCq3Tws75fjLX7q64cwAfn9/7vlGlxrIjbGgs5MUNY85/Oz8VS2W7CYkK6aRtd2ZzU9acb
	IaUUYc+Ef1rZEfFm
X-Received: by 2002:a17:907:6d11:b0:b84:1fef:329f with SMTP id a640c23a62f3a-b93f11c0d29mr131059566b.26.1772632281887;
        Wed, 04 Mar 2026 05:51:21 -0800 (PST)
Received: from DESKTOP-JNMGKT5.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ac704b0sm736324166b.22.2026.03.04.05.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:51:21 -0800 (PST)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: replace kzalloc/kmalloc+memcpy with kmemdup
Date: Wed,  4 Mar 2026 14:51:20 +0100
Message-ID: <20260304135120.38004-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304130706.37347-1-hossu.alexandru@gmail.com>
References: <20260304130706.37347-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace open-coded alloc+memcpy patterns with kmemdup().
This simplifies the code and avoids manual size/copy handling.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>

v3:
  - Drop unrelated DT binding changes from v2.
  - Wrap long line reported by checkpatch.

---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 1295b1c1e..0f50f7141 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -128,7 +128,8 @@ static struct ieee80211_supported_band *rtw_spt_band_alloc(
 		goto exit;
 
 	spt_band->channels = (struct ieee80211_channel *)(((u8 *)spt_band) + sizeof(struct ieee80211_supported_band));
-	spt_band->bitrates = (struct ieee80211_rate *)(((u8 *)spt_band->channels) + array_size(n_channels, sizeof(struct ieee80211_channel)));
+	spt_band->bitrates = (struct ieee80211_rate *)(((u8 *)spt_band->channels) +
+		array_size(n_channels, sizeof(struct ieee80211_channel)));
 	spt_band->band = band;
 	spt_band->n_channels = n_channels;
 	spt_band->n_bitrates = n_bitrates;
-- 
2.43.0

