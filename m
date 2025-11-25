Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AA6319610
	for <linux-staging@lists.linux.dev>; Tue, 25 Nov 2025 11:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764069678; cv=none; b=eQlUeHXutXd9Dm8EkIAWK1ByPAX72c3sWGoP5QwPYYLVWDciiy/8ZjgmVO3AZeCHv2wfgmMfzKoKtO1JW/mkpTxmY10BhioiFGThwLnVaz4p4DSOO5cayD5Ilhx0tlnBw5lfSgARZ9jzn34KVhZ2fZDXRWU0vDfttzV3InCdaeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764069678; c=relaxed/simple;
	bh=5A2pDKNhbF0/77JU3bsQaFVBTUYS4izX+U7cPkgVXAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IQI9KU7OtBYY18z23IiKa9xAunSmew1m5r3aaifV4kYWnOY6jsiVNR8DIfjM3Ztvv7yYCfBag0w2oYAJiYQS4YA/KFgnr/oi3hVStcFuJp0/++rLJyofyDFjeDNIt4cPpHcRucPhzz5BnmycysA6Nw62ujPnPDUD6y83NiU8Pqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFiGnMPY; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFiGnMPY"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-343684a06b2so5386172a91.1
        for <linux-staging@lists.linux.dev>; Tue, 25 Nov 2025 03:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764069676; x=1764674476; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYCzOSmeD3AlFpQHOBdKOssS9JyrnynNQJZhTfGWgls=;
        b=cFiGnMPYwDzm4YnFIunI4ycgj2puGJZOgmwc+ywORUtk2rz0ahvirQFuX8DngnPDKN
         d94So3fi+rX1ETXvxEx+YCKlAEoG16obxsqLv/c74ya8R0G8Q9dNixdtTdUTcDYEc2PI
         ivgGKhpxfWTFa4rGFA88d7H6DXvzpeac7/juahnYMXjRYgIA2y/iECHOBSKsnfC0HTum
         QadrRkGfnhiCNOHyABWHN6wd9Lhl3pwNRNRHXXjZzxm/xMhcrAtYatLpSFXsj6b7Kqiy
         cvOzU/s5H1jvZpG5+r8jBMpPmUGmG2DS64EzXPQf9EXVF+b7E+/bupOVjkPqXfPaseWS
         NoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764069676; x=1764674476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nYCzOSmeD3AlFpQHOBdKOssS9JyrnynNQJZhTfGWgls=;
        b=oZddw0um5wt4AG26Hz2KbnVgkFfQwjEA/HaK8P768gO5h0aDSsoKhIwjpuCyjmE/uP
         avrwN/pynP0nnUMgCRg8jbXyPYPA/tfEXLijit6iV6sllidotRNM2f68NupFmpktxkgd
         wGMZemlh+gUodpKXHZzIO52OIabcNDOFqNjjY6owjsIPW6SG2TULyMQJphKqWzYdBuWO
         lOlxRx+xCuoXQx295aPdCQ14AJIlag/V8e6dGBEZ1JTFzGlqpq7G0iADXgnwhmSQhgCu
         LBUymF73VnPfNqNvpo/iq82DIsgAird+DV1dIOCnp/+9vJtoc+zUjeQlr5hGGip+kI2o
         fxqQ==
X-Gm-Message-State: AOJu0YwEonwTuPJdRb9a6i1lGJCRHuYLpj0c5rNCPSyci1UwcnpI1Fup
	OFmECujEFeQGnj9+Zf7sZghPzf8rGicsPZc0OFqL3LVXi0jXfaSJdvdL
X-Gm-Gg: ASbGnctCeXJ4LRdV5Z9EipJQ2Pvobia9na+IlbCfkIMIxQLLwMXeFdgJetvd8rJ35tw
	ctJ0svaFeEBx3vIZtvplTD2chzIvG0kJqCMWNrwK1RUl0mwyC7cp6kDvdThl6qmXmEzaRrirv3e
	Kbc7YpJ2HxVWk2jghuNGsqWTrtjdxM7GfItNHQMZ+SWHDadO1cFZoeI0I8VGXps/LvVRCqi6HSn
	nbEBjb8VWHm6+LuQrvZjXVtfYeEs20x4JDifOmpZhzyRmrxTp2HpNSal5fr9kiQ+ZsSrV+KrGhh
	yV2BxV3WtxPJXybZXGiz4dAlQPvXmeDXu/OnRdQafy09Jp8AaeYnIPERy8wK1eG/v928Ow7fGEx
	1gZTdLVXcBFsY3a7jVUeeZWP3hrdrSqYba4PDc3cckO0dpr0Bq2rwJaJuP07Sb6KxFX8MlyAIp/
	usgodobF+CfQ1W2gUqMipAv5T7kTkPn7DUJDvx0TzJzpq0iWXFyHD7UedWJx4Pjc/Kd0Fi/6rXJ
	iCJOWorf69vSI/CUc2BMzXpRmP0U5u9sQ/N1jnrjK6Wd6SkG664qDkBg+G0lqRaUlsP1i/Q4NH/
	h5A7oKMe0eHuk/j1IHA=
X-Google-Smtp-Source: AGHT+IH5lMArkNfhsGEGK/fgLgKF5OQcQdSf/g81Ys6AxJe2WVkBUoOLKtd7yNl3CKRxVTK3S/lf+g==
X-Received: by 2002:a17:90b:1fc5:b0:32b:9750:10e4 with SMTP id 98e67ed59e1d1-34733f3eb71mr15682419a91.27.1764069676199;
        Tue, 25 Nov 2025 03:21:16 -0800 (PST)
Received: from cyberkunju.asia-south1-c.c.gen-lang-client-0196962068.internal (125.31.93.34.bc.googleusercontent.com. [34.93.31.125])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727bcaf13sm16296250a91.1.2025.11.25.03.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 03:21:15 -0800 (PST)
From: Navaneeth K <knavaneeth786@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	david.laight@runbox.com,
	Navaneeth K <knavaneeth786@gmail.com>
Subject: [PATCH v2 2/5] staging: rtl8723bs: use standard offsetof in cfg80211 operations
Date: Tue, 25 Nov 2025 11:20:56 +0000
Message-ID: <20251125112059.16913-3-knavaneeth786@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251125112059.16913-1-knavaneeth786@gmail.com>
References: <20251125112059.16913-1-knavaneeth786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace usage of the custom FIELD_OFFSET macro with the standard
offsetof() macro in ioctl_cfg80211.c. This improves code readability
and uses the kernel's standard mechanism.

Also include <linux/stddef.h> in basic_types.h to ensure offsetof()
is available for this and future conversions.

Signed-off-by: Navaneeth K <knavaneeth786@gmail.com>
---
 drivers/staging/rtl8723bs/include/basic_types.h   | 1 +
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/basic_types.h b/drivers/staging/rtl8723bs/include/basic_types.h
index 1c2da18e6210..16b270fe0203 100644
--- a/drivers/staging/rtl8723bs/include/basic_types.h
+++ b/drivers/staging/rtl8723bs/include/basic_types.h
@@ -12,6 +12,7 @@
 #define FAIL	(-1)
 
 #include <linux/types.h>
+#include <linux/stddef.h>
 
 #define FIELD_OFFSET(s, field)	((__kernel_ssize_t)&((s *)(0))->field)
 
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 315bab373729..60edeae1cffe 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1712,7 +1712,8 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 
 		if (wep_key_len > 0) {
 			wep_key_len = wep_key_len <= 5 ? 5 : 13;
-			wep_total_len = wep_key_len + FIELD_OFFSET(struct ndis_802_11_wep, key_material);
+			wep_total_len = wep_key_len +
+				offsetof(struct ndis_802_11_wep, key_material);
 			pwep = rtw_malloc(wep_total_len);
 			if (!pwep) {
 				ret = -ENOMEM;
-- 
2.43.0

