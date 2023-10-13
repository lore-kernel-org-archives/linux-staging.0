Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC7412B7F
	for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 14:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WnwOHn3U"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-405e48d8e72so5562455e9.0
        for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 07:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697208265; x=1697813065; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dUwXwdN/92xgfkRGk4NgyBr2C8cERjjyDL8rj/W6Q4A=;
        b=WnwOHn3U+PIwKLUqNh2XSN9ga1horQlUYn+Byo116jujHrJwN1grUEGQeHwjP8tvkZ
         bNcrC1QVxnki7BY/HLQPw5Rt7LvkBL4rS/66PWjcW15i6Q/qJ2MXZYLfiJ7f85Q6cd2+
         1Cp9PR0Itzjb2U6urGgcNG7xTTrn4pMZh1t99cSMuM4FqJ1aS2ZrxHmvwEOZGTjOYgYv
         QqenAZmNA+XF6CFBRf4YsAQb1ybpvL39/3tyCw4Deoj7Hcq/DESVAEwm08LpiXLng5jX
         yRjq79GW8Hz1sk6VBNKofFsng+tq5qFPHZMuLLAtip8ShLbMPWu0bw9bjjwQn6AHPAct
         4X6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697208265; x=1697813065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dUwXwdN/92xgfkRGk4NgyBr2C8cERjjyDL8rj/W6Q4A=;
        b=Fgfl9yTtGXB6bLieM+RcqjdEooOM1RskmDp85tl1aa2io29XzUiCGFwGo2wMTwHplj
         v8FRnV5dMhWHSg0dIic3ZNgsCnzAv1a9/bt2HeWtPRhUYd4JQpjFTmga2tTjkQwDLUFn
         fvGAtGm9D/WA2/QTVHlVWGt0tj92FuQPMzSoOkb6k1WhdNtcwdg/nhYBT44D+Kdepe2w
         om+WU3bE5iTRi7Y9/A8KTfzPYveDnpTQTF2cHFBCfK6zNBaVnlZl3bdIovwHkvMIv53x
         JE2MzrQ1gkB7kjRLbTC+iAdBiLmLj4/LTMQmzkOo3bpwOl74o6jJeWJSGTytqt83g+8Q
         Dvag==
X-Gm-Message-State: AOJu0YzMgBMqV2mJ0QIlInmJw7Y1+weERQqibQsWTnxiI+S0pY5DPSva
	/oeU/odgGxKlNLDbAsAXVIM=
X-Google-Smtp-Source: AGHT+IHLyuSifzxEbeDJO3HER84faNj1Duelt7Do8Cm4/ovC64G4DtsR8Hxp0/615lXKfG//X3d1hg==
X-Received: by 2002:a05:600c:3b9a:b0:3fe:21a6:a18 with SMTP id n26-20020a05600c3b9a00b003fe21a60a18mr24335407wms.3.1697208265187;
        Fri, 13 Oct 2023 07:44:25 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id l40-20020a05600c1d2800b0040596352951sm331816wms.5.2023.10.13.07.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 07:44:24 -0700 (PDT)
Date: Fri, 13 Oct 2023 16:44:23 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] staging: rtl8192e: Remove unused enums dm_dig_sta and
 dm_dig_alg
Message-ID: <0aab74bcda5f582a5fe44a4c1405940d0c8261ad.1697127817.git.philipp.g.hortmann@gmail.com>
References: <cover.1697127817.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1697127817.git.philipp.g.hortmann@gmail.com>

Remove unused enums dm_dig_sta and dm_dig_alg. Remove unused entries of
enum dm_dig_connect.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.h | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
index 80ac77e269fd..84e673452be4 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
@@ -74,12 +74,6 @@ struct dig_t {
 	long		rssi_val;
 };
 
-enum dm_dig_sta {
-	DM_STA_DIG_OFF = 0,
-	DM_STA_DIG_ON,
-	DM_STA_DIG_MAX
-};
-
 enum dm_ratr_sta {
 	DM_RATR_STA_HIGH = 0,
 	DM_RATR_STA_MIDDLE = 1,
@@ -87,22 +81,9 @@ enum dm_ratr_sta {
 	DM_RATR_STA_MAX
 };
 
-enum dm_dig_alg {
-	DIG_ALGO_BY_FALSE_ALARM = 0,
-	DIG_ALGO_BY_RSSI	= 1,
-	DIG_ALGO_BEFORE_CONNECT_BY_RSSI_AND_ALARM = 2,
-	DIG_ALGO_BY_TOW_PORT = 3,
-	DIG_ALGO_MAX
-};
-
 enum dm_dig_connect {
 	DIG_STA_DISCONNECT = 0,
 	DIG_STA_CONNECT = 1,
-	DIG_STA_BEFORE_CONNECT = 2,
-	DIG_AP_DISCONNECT = 3,
-	DIG_AP_CONNECT = 4,
-	DIG_AP_ADD_STATION = 5,
-	DIG_CONNECT_MAX
 };
 
 enum dm_dig_pd_th {
-- 
2.42.0

