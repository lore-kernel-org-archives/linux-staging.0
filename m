Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39A726F2AA
	for <linux-staging@lists.linux.dev>; Mon,  6 Oct 2025 12:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759753121; cv=none; b=HacUkp+AlN7J4Lruor+lv/lg+C6XsAhvfP+m13Tma3e0BhBM+oIERoCEuN5dvC04haxJI4Cj9+P9hOBPfWMJxp9T3iEtjueb2f2SUgEB6iCb2/hCEcdpdwBeuEfm8L9QGo2lK43wdAhMJEd1kzAgcSccg9uz2hbKHA9dI5INkKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759753121; c=relaxed/simple;
	bh=KsehnIz3zhaIRQ7nBGds+hNWCCyU0OXicbw+mHAQcbw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JqHWNW6s/Um9/Qm+4oxC0LgS9+8xrJ5sUcWM2QZ7EKukqciu4fv79fXRlqVMBHlY5bUaVJ0iivXzX6i1skKfyUULchMlH7yZUpB/yzMpKHmfCyxFK00xM3cOR4UmtVRSzm3SsIxGiHHDnn0cacLVvWv7goKAfh2pBpbEV2TIFu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fC/1IoyV; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fC/1IoyV"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-78af9ebe337so3158939b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 06 Oct 2025 05:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759753119; x=1760357919; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4JqL1nlgUvZ4Y+a9ncnNqpy2LNfdBYiZdaCXYGPWAqA=;
        b=fC/1IoyVcd6cietRrK313AeGkO0bDdn7vx5uhKG/RlR+qjNtPWqFO1C1sEJskGqh1m
         gXLoe4FP3BCPOYQtb/v1jfmiULGjpNuG0kuLmpFVN+C7/tVpKegMqozXPPr6kvt4yK3O
         FSRu7gwNfG+D1pHAV9WK325TXrjUh3Gv/b797xLxH68hPmqpTg2AatUeTdvPilm17GUN
         lh4pJf4aoAI3ExQ9vzOV6O8B5/G9zUEKzm96/7onTqStOkQdwLNWCEAbh2tMH3EMCBnC
         UrlaOhYJoJcseueYuPWRtKMMwUHvCZKv5OVvDkLxSLPPMhsbCP4gaCRRc1t4e+Dutjsf
         BcHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759753119; x=1760357919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4JqL1nlgUvZ4Y+a9ncnNqpy2LNfdBYiZdaCXYGPWAqA=;
        b=sm1thrOS6feS7nmA6g0BIYs8tH70bU+vo/W7aIDnVX8rLx6ZKKGvRDNWBLKW8+O/AE
         83y4Fw8+JfkkjZicfqUMtOeIMHBJS0un/TaA5nwIPyXG+Rf7LTsfJb9ktZHFf7WP/fBw
         5Rz3cBKu5k0rwMny1AKJVLDP4zlmPmcs8aMpfmAVhpXBxImRmjK0updxVM5ngLEUnllR
         a/7+8b075Pp5sEz+kQ7BcCui0kmDj4SZ9PvJa6PJk2vyMXZw+mjy1oHA0i7OxhYhXUtr
         YcEwBeF/tf4dZ2Wj3BNG6lS5Zx7ErwlMv/+NkIsXPByQCkjsMOquFl3hXWSc7quER/Ke
         Zk1A==
X-Forwarded-Encrypted: i=1; AJvYcCVeg9AW9jsJUqBBAOnpQZdbXNIFOMHDSpGMYbWgy0gBZjo5fT+FufXJSivbEdgrZFPliHH1MXjMmpUjs++7@lists.linux.dev
X-Gm-Message-State: AOJu0YyKo1PSeWttuivF5yjjE4il7FW4/FlWs5EqqB5HtgbT9cXluN7b
	qhYjhI9xYKDj7FpyeC/NixeEeVV7/QNeJkjFT8a/fQOCERFwvx37uMXO
X-Gm-Gg: ASbGncvOdB4rVDnfRBW/3FuWRtbO/deWmoa5J/DAERPDvr7SKX3miYOxtSeT5oUtnZI
	Nf9aVfhsOEwl7FrPwG7fIL9IrID/qdSvTLmRmSClLSl5Kt0MA+3GgC0VZCtmSCjlJDQIM4csvR3
	xLtByyemTNtn5uvlk+29D2sMW9BzhJC3PUzHGz0FgXFQL18vTtILqs5b7/t5TmdWH3dXagD+eqx
	EHasqjfNToYIT3F2EEz5N5ObCQjjdo9HNngI1dRtlrTpFGlcDHlrmdR5JP61eV7W7j/n9ifelgk
	qgbZENSkPW7Psh/LI2J0AO19xoMV+0oC/nY92UrukuCDIorYMn3IKzQWLmkOGA8VSesq/uwbIhT
	+c4AnjKkRnLeiAFfQkqyF0p3/cLelgb2s33y5ifN65senQ6zvso9KYXfoRegq3ERyBS+mrS+jE8
	Fe84TNW4mxdBghypw=
X-Google-Smtp-Source: AGHT+IEJlwikdDfuEqvB89md8pAfVXWDudGqoNcbE2zkbJKF7mMx2bYqTgGXO9agoUxrYeU07eF8fg==
X-Received: by 2002:a05:6a00:2349:b0:781:52f:f13c with SMTP id d2e1a72fcca58-78c98dd92a4mr13864940b3a.25.1759753119149;
        Mon, 06 Oct 2025 05:18:39 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:fa6f:67e6:9404:f1b2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b0206e809sm12540612b3a.71.2025.10.06.05.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 05:18:38 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: Remove commented ifdef CONFIG_WAPI_SUPPORT
Date: Mon,  6 Oct 2025 09:15:41 -0300
Message-ID: <20251006121825.8114-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove ifdef CONFIG_WAPI_SUPPORT comment from rtw_ieee80211 since there
is no way to enable or use it. Also, there is no documentation about the
purpose of that config.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
I guess this stands for "Wireless Authentication and Privacy Infrastructure",
but that config is not used anywhere inside rtl8723bs driver. It was first added
at 2017 [1] in the same way, so there is no harm to remove it.
Tks and regards.

[1] https://github.com/torvalds/linux/commit/554c0a3abf216c991c5ebddcdb2c08689ecd290b#diff-2f54b83e0bd9062cc10a53a0a6ac9193744cfb4cad1bca851127012003a6a816
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 53d4c113b19c..027b2dd0a4b9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -560,7 +560,6 @@ int rtw_parse_wpa2_ie(u8 *rsn_ie, int rsn_ie_len, int *group_cipher, int *pairwi
 	return ret;
 }
 
-/* ifdef CONFIG_WAPI_SUPPORT */
 int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi_ie, u16 *wapi_len)
 {
 	int len = 0;
@@ -600,7 +599,6 @@ int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi_ie, u16 *wapi_len)
 
 	return len;
 }
-/* endif */
 
 void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie, u16 *wpa_len)
 {
-- 
2.48.1

