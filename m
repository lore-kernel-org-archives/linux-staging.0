Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1167A22259B
	for <linux-staging@lists.linux.dev>; Sat, 26 Jul 2025 04:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753504459; cv=none; b=lXTGcSdeV2lzWse38+IImpb1MJm7nT+XPtzLxfBYLxceZDNdCKFVtdWXMueP/GMj5cag7/ByGtPXIktt1HL0Z/pjzEZ98h+UJcp5eo39JPuG2c2nHOtXkRrzw0qYNYFb+Vlvn4eY9YRHYBwH2g713iR+ONEaQykVKvKRq2ikn0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753504459; c=relaxed/simple;
	bh=d2e+T2yU2a4AET8w22kASfi4lDBNypov0MLe6Ab0DR4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MN8KMEGwrfRgjYCqhIaPwzlex12xMmZlBgKQlSP6YfR0ATZ4UcwIuIG/Mwm1UCpdXTuLbeKAz039yeh+4fNkemd4NZ6SokUoPs4JzYxWXc4NVCCKj2VYGu+hfi0riPSmbEl8KMIc6LEEnu68ZhxDQtDMp9tfqJ61Fc/VlrY52hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VfEvwJ6t; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VfEvwJ6t"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7e638975262so192993185a.0
        for <linux-staging@lists.linux.dev>; Fri, 25 Jul 2025 21:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753504457; x=1754109257; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GC+5ntkiMYOcg9q9ULRx/adh+E/wjCdGyK8BZoGwft8=;
        b=VfEvwJ6tqXiEvXB0FlvGietoJcs/4fV4/dj+goWtr6csttx2RW/rk/LhS6tFdvsFz4
         NGfO0zfVzJrPQm6Iz5oPmDVOG+P85hPiF7IkyKlQRNcHKjZCNU4ix4YoCuIuXIk3fdfb
         mPaAioxOlG14aWOIhJ3HcZiuONna8ZQQIXmsI/6bSazZ+ncWK+sXmosU2GBX4jfqgpqj
         YxKp2qHnW5ALXpuNFbEJvynHi1XruzoptkuZ2jiN+/ZGfOT8Xqn1TpkNQ2JBl5exWnH5
         gpxY4Pf644OsD6WtCRCeFwM+ML2dj9TbCkOsDKS1ElmwB47TBmtT8wUxRcZIZFJgctn6
         y62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753504457; x=1754109257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GC+5ntkiMYOcg9q9ULRx/adh+E/wjCdGyK8BZoGwft8=;
        b=m7QU95lcY5dmNVW5zHgorQrKjKSvFV9f1PKxZ8nzUxWhZ9ya17j+WdtnIVbkBKVOYH
         ImPgRrqXHgqJ8Mzr4qMgQFyupWF1H38jYKabdargumnrWHx6EynnmGAP/oJMFtxER79X
         uENH8mCuq31z8xpzWt63kN+skyUL1yN2Rfm6ZjZFhW70igKrQMWLpMd13sJ7xIIbQnF1
         paKUAEkSrsIRLCO7xf9G65kRhwbeCFCpUWiXzwvAA8pd4xiXDcBaUO6s6Qm/LQIHGA9z
         KWnkRleUwOeEWcqWUZQ9BxoxoN/vQPa+GmB9Ec4shNbpD5DXKzcZGXv+emeT/ZOnGSkF
         FpMA==
X-Gm-Message-State: AOJu0Yy0wWEefEaGJTC2z382CyytGUwxtNmPX4cuFiNj0okieL/eLCm7
	BOs3SytQoUuSD8ICaMkg+PZSR00fWgMWsk3D2ODEbDpgVt4teCob4J4c
X-Gm-Gg: ASbGnctW2w9lgrTfTGttQ5elqJInhZvWMnOXBuEt/7qFlhgYZDy/8MJJZbtpC9xXaVS
	qmDdKi0ra23/I74K32EBlWqcCYDkxfbDNmNVQKO9xrdZRHJrneHsRF4Ypo4l3nzoRavlE4OvT/Y
	tbRKslMjnhrVcAmsLe9pnGtBE73yg/w25ycQC+q9HC+NpOWO+2RHw3yH2BjLsAl6l2N6dbBYz/A
	cnaxygKd3JXYKQ8VfglAzBviWNvFvDwqX9LhxQjBKRlOax3/1glBXuJ85rtVH+Z6DWdwKTLdNTy
	mbo3xdVkCNWTsYGQ3edxQEmQtbxbnE/9aKjx+0VavHXTs6nul91UqgDoXWvAgwphWUNgujI+6XE
	NTt8OZQAjZQCcgpc84UZfRo18ltAMywny0fwgkk5LhzhNNF/1MMc=
X-Google-Smtp-Source: AGHT+IEz2pv6WB1PyFs4FPgWVH3seutfTorp8cVLUTzAsCHl/hXSEJr0qXxLqZTGBIZh+iqHRC8RYg==
X-Received: by 2002:a05:620a:2ae9:b0:7e2:c5ff:2078 with SMTP id af79cd13be357-7e63c1c74f7mr477625085a.37.1753504456831;
        Fri, 25 Jul 2025 21:34:16 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e6432a885asm70322185a.36.2025.07.25.21.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 21:34:16 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH 20/20] staging: rtl8723bs: merge nested if conditions for clarity and tab problems
Date: Sat, 26 Jul 2025 04:32:18 +0000
Message-Id: <20250726043218.386738-21-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250726043218.386738-1-vivek.balachandhar@gmail.com>
References: <20250726043218.386738-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Merged nested if conditions for clarity and fixed tab indentation in one
place. No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index dbaaa2357ee5..7c189a823c00 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1157,8 +1157,8 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 						rtw_free_stainfo(adapter,  pcur_sta);
 
 					ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, pnetwork->network.mac_address);
-					if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true) {
-					    if (ptarget_wlan)
+					if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true &&
+					    ptarget_wlan) {
 						ptarget_wlan->fixed = true;
 					}
 				}
-- 
2.39.5

