Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E373449551B
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119865; cv=none; b=uha8M0+Wx3f0UTVQzTkwGgvKRFp55mVT8+N1n5t6vhLVd/O3clKCCc4LjMHQjOzFSSHg3boY+ojvj7lHK4IyNI1sBWXkRzz8Qt7HkbiTzOL8HC4Vm7aLMRn2YOu9S1qYVYK8Z1Q93LM1neZWhEAuwVHJHGDZ0sVXN/Bf2+dWlmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119865; c=relaxed/simple;
	bh=4vReyokegtoDdnzUCaFF1FRWkBMX2s/84JinAlpGIDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j3qRZnglic3blKeaREsb/Dt65rZYYQi0xF1IZqr+PIWIAtR7P7jS3JuU8yyQvalBLYPx7NLH/W4uaYdhpfbbsrv6Rn5oYAiYyyu9/G5zmPQGRBfOIye9vRX7K9nYWUHP2ihEJyyVGwbEPMVABMKqO275OyzSFkidl53yUnft2sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GwL8QzO3; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GwL8QzO3"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39da69c5ba3so16384881fa.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119852; x=1784724652; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=47CI7mo8Wjc0LIH72n9ZJUdZDiMq/SPSI3cwI67agh0=;
        b=GwL8QzO30Dt5aKz4LTloep+yaOKLd4OCPXAuJNnSW9WWJDHnUx2xVwIXHokUUb8OQg
         99pTmd/FoIA6MVSAZhy2FM/B/3e8eKBQob6wMoBgEy39pbKA2dmqkFplDOcACQ57ycZw
         wS6DzQar0Sgc0WLkxmfrACoh4ylqsMSQsA2XpR7viYBAAzMu3bSG7A8zBhXgTCr2mI3e
         jVfTQ4c6tt3BuPWtTtN3z7loP+fzdSpFexfXCK7d5iBD9caMAJ/cqk8+ZK7PH1XYJsYe
         wDzDHHtRljQpmvNTaKTn6jZAvfLBamZjVkl3LNxkb29BSlxEJWyeLYBAhuAhE2u/PPyO
         APmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119852; x=1784724652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=47CI7mo8Wjc0LIH72n9ZJUdZDiMq/SPSI3cwI67agh0=;
        b=B+utFOvUdbAWDbKK8Pxh61YRRz/YWueH01fSrBWawO17sfMU7lqLPZ4DbMTQG+BLXU
         pCZ1UySw0Iom7PpfI39OvOxtLpF0Urt9aOMSB0k70X7ss2DikUYOVW6m9EBnotFQpGnd
         lnq9I03L0D4ciF4ahQpG12EpXWTGNBFXjZKEWCdDc/ToDyEJS2Obym04lKWEDNYcWv5I
         Xq6hRY5eygaW/gPJ1OrISw3xmjjG7Gx4eLUaH9/yjIWpdpjO6lIey1pL0EMAWm+da3BY
         WugJRdoSJ4BBfim22o1dkgO4tKv5K7lKraYuB6+tONO9XNculkldrbaj8QleKHAwRc/H
         a2ZQ==
X-Gm-Message-State: AOJu0YwYuW2NVg/k25EYG5RL1hXTR2ibOPRx2wGnVBOZbm65hkPRrNBt
	MpEOoEGHky2+SrVMvEWIeJMxXcwDlvLhR4X5zNCgy8f89fjjzc4PwC4R+v+2SS5gpTc=
X-Gm-Gg: AfdE7cnlzzl4r5FDQOJQsxhKMK6UGivjLH7jZqU3th4DXSimNKFjFiAK7QH+Do6fhpO
	UTZ5tyaUuobCIWmLaoE1gALDV5LQ16b/73fd14t2I7/3iVxUlGwaNhPMDZbzAAgkIdWecfKK1gW
	hb16gonGi6Ld9Sc6OTwLZuDwbGrrFwNgAPV3CGiVDrX6OAgOjt6nbpXdO2ly/o8c8Q003jJ0bHO
	piCT4ikdKXydbZiNsTsdi1Mwmi65v9BbYDjyjvC8luyvMAzJV9EBZSj79IpORfpyd70mB1AgDuM
	s6uedeMH2lf2v8eJpr5TtiOcC0qHPN3ZXa3IQRV51WlYQ/rbAZOrhh3czPuwGuIr3qm0CsQKUUz
	dmwFbsJ1j1jdjBAeKCXQXQOZwbQYChI+dZ9VBtfWd7if85xyty7Cb3bcfpwXbDOUM0B5QvSQ14E
	XJwfG20ctlUbq/HqU9QULORdvf9hhjM1mOlmXkYz1Ke5HjB8JSdhyQF9V8KdE/aJpg291O/JWR8
	d4fkVJ+ET7WfQkXAyrZ0pdn
X-Received: by 2002:a05:6512:12c3:b0:5b0:5306:210e with SMTP id 2adb3069b0e04-5b0531567femr3904899e87.37.1784119852381;
        Wed, 15 Jul 2026 05:50:52 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:52 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 46/61] staging: rtl8723bs: remove rtw_get_mgntframe_raid helper
Date: Wed, 15 Jul 2026 19:48:14 +0700
Message-ID: <20260715124829.90290-47-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the tiny helper function rtw_get_mgntframe_raid. Inline the
ternary operator check directly into the callers to simplify the
driver architecture and avoid unnecessary call overhead.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
 drivers/staging/rtl8723bs/hal/hal_com.c       | 4 ----
 drivers/staging/rtl8723bs/include/hal_com.h   | 1 -
 3 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 62abfd896..0cc6887bb 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1897,7 +1897,7 @@ void update_mgntframe_attrib(struct adapter *padapter, struct pkt_attrib *pattri
 		wireless_mode = WIRELESS_11B;
 	else
 		wireless_mode = WIRELESS_11G;
-	pattrib->raid =  rtw_get_mgntframe_raid(padapter, wireless_mode);
+	pattrib->raid = (wireless_mode & WIRELESS_11B) ? RATEID_IDX_B : RATEID_IDX_G;
 	pattrib->rate = pmlmeext->tx_rate;
 
 	pattrib->encrypt = _NO_PRIVACY_;
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index b357c5145..0a0b41ebe 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -467,10 +467,6 @@ s32 c2h_evt_read_88xx(struct adapter *adapter, u8 *buf)
 	return ret;
 }
 
-u8 rtw_get_mgntframe_raid(struct adapter *adapter, unsigned char network_type)
-{
-	return (network_type & WIRELESS_11B) ? RATEID_IDX_B : RATEID_IDX_G;
-}
 
 void rtw_hal_update_sta_rate_mask(struct adapter *padapter, struct sta_info *psta)
 {
diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index 0a43655f7..962ba3aaa 100644
--- a/drivers/staging/rtl8723bs/include/hal_com.h
+++ b/drivers/staging/rtl8723bs/include/hal_com.h
@@ -126,7 +126,6 @@ u8 NumOutPipe
 
 s32 c2h_evt_read_88xx(struct adapter *adapter, u8 *buf);
 
-u8 rtw_get_mgntframe_raid(struct adapter *adapter, unsigned char network_type);
 void rtw_hal_update_sta_rate_mask(struct adapter *padapter, struct sta_info *psta);
 
 void SetHwReg(struct adapter *padapter, u8 variable, u8 *val);
-- 
2.55.0

