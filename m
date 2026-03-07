Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B104C92
	for <linux-staging@lists.linux.dev>; Sat,  7 Mar 2026 16:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772899298; cv=none; b=c1NnbA/x4TTsYuCGARe+QFHHVpHBCFN1J77a2wsaeWiG3aTT8JT8MBjLyxVLAdwoWzx8OfFId6u2nimeLopoQtGklzILn12KvYvX3WfeQG1eQHfJoL1xAFFf6ENi1stefhTWEGklwhS6BFWGB2Vb7iw7bjtpM8EnyVC/bWiuZNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772899298; c=relaxed/simple;
	bh=3tB5smaI5qFmybFRzcsqB4MK2NVSLHDfMBeI9RPvxYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gy6IMeRbBgRkWtMR3RgspDzi6DqUkcjqwkC99jVtEKi0iXD9ohyGvPNKD/p4rhJ0jSNxY/Ciw/nttHd6WonFJugreUbcyiOE//gjIFGlLHt2TfFtYHNL1h1Uk/CflXhhdmCERZclryoWkWJkUo387WXNJbjNmiFmc5vVjMx1is4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmxlZWWy; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmxlZWWy"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64ad019bbd4so9344770d50.0
        for <linux-staging@lists.linux.dev>; Sat, 07 Mar 2026 08:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772899296; x=1773504096; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbfF08PEIsM/gTKgvTd8JRmxcmclvI5VhNskVaVWLTU=;
        b=lmxlZWWydxbAFWyvf15qu2BsdcUXZdqPeoX/1DsQxoCutIaGMellbASfNPO/1p/OqG
         YuwfByTkBGrdFZQoi4pkyqJLN/p+ztZgrRVWkTXjSyW8wISnxd15OKrce83ePX1ErGLJ
         GR0tpr4SV+HWxTeB19UwY1Pbny5EvDafcvhapJ1CQZ3SOfBpzMlHDb80XLAFaA130DDo
         2wXyPk3vxgRHCTGynAYTxb5OKCMlbkYaRM7oXzug+1L/ZI8Iwealft2KUJWshBiK+u+S
         HbG9lfQOM0/M62nvWk8W1ffPfrv6T3S/qEh6B5e0c4+c0yjp+LTzHSJazmb6Ke/n5u0w
         4YcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772899296; x=1773504096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WbfF08PEIsM/gTKgvTd8JRmxcmclvI5VhNskVaVWLTU=;
        b=NuVLB4WPq5lX/E402FZk2ZyZ1ly7Y4067w8DwGp7j+En2dOTKodLZgQorQMU55oIkC
         tosXW0yUDIb6Ls8V9zJWqN8ttoRHif3LCaXwqjIm+pe3OdoL78rwFfbzMQq3wIQ1BHgV
         SY1FOs0nVOR9IWmKBfa90mvAUq7Ab8bO2cwiVb0MEDOdv3w8KNjsRmQPJlectlBz+4ZR
         T8WQPJKhl+0TuXpXowDHWcAvgDyQDStI4xL687hTHF8DSE1KOBrspFFJD6DJcXcVebFv
         MSqiDGwHSIOQtgkEhCySr+Tp3mUfqLONy5DYWknG+eGFE0JxiV022uhEv1iuWWAX2pow
         a4qg==
X-Gm-Message-State: AOJu0Yzk91YqB57YsNk+MykBt4XFsLwQILFrDlD3Km0w8qqdu5K9znaU
	LCwjVJOFc2dJOHiWU7Lh4hn+WmERB4BePppNKd3Mu7iNYn32kuKotXrk
X-Gm-Gg: ATEYQzzdG6CS8onnpY5I9HipTfW9IX04fGbDYo/iCieqjTy/ozE4RIohgO/fW5LCMe8
	nDI4ZYJf1nol8KAZRBhZevqaF+rDKNHCWx3202Ch++On4hlhZDaQgyBsWpdaRPXValounovE1pA
	ss7XareFrtnIqe5tmHl3Z+Cpb5Te8GcZKGyQFz8MEyqvpHItNGd8qR7OAyKHfONPrs/7Xud4LJ0
	oAPwP58Mc3lpP4LeFmKqSa+f+Ki9e0QbiVswNXf4KzdrXRYU6/hS3Orb7uRHvdmjQvRAgVh3gLF
	oBT8ClRJAuQzHj56gwP7XimgnZJsZfkyQ0lITRouzOzg0Nqu0Q26JKKwFjPWBnPNx/kIaXgXy//
	wAVWWajHa6C1VFiLCfntEilsOQXU34EC+GHOu5ja1r0N8yZiGECL8blVji0EcNCQaML5o5DtAlz
	dz98ivr6k7L5nigW2P9f86xDG0
X-Received: by 2002:a53:ecd7:0:b0:649:df15:ae26 with SMTP id 956f58d0204a3-64d143029d3mr4637502d50.73.1772899295792;
        Sat, 07 Mar 2026 08:01:35 -0800 (PST)
Received: from archlinux ([185.140.162.146])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64d175d2f31sm2232160d50.5.2026.03.07.08.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 08:01:35 -0800 (PST)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	ethantidmore06@gmail.com,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 2/4] staging: rtl8723bs: replace rtw_is_same_ibss() return type to bool
Date: Sat,  7 Mar 2026 18:58:31 +0300
Message-ID: <20260307160024.18039-3-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260307160024.18039-1-nikolayof23@gmail.com>
References: <20260307160024.18039-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_is_same_ibss() returns a 'bool' value, but has an 'int
type. Replace 'int' -> 'bool' types to make it more accrurate.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c    | 6 ++----
 drivers/staging/rtl8723bs/include/rtw_mlme.h | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 85ec172d6a89..3f8ccedbd85f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -328,9 +328,9 @@ struct	wlan_network *rtw_find_network(struct __queue *scanned_queue, u8 *addr)
 	return pnetwork;
 }
 
-int rtw_is_same_ibss(struct adapter *adapter, struct wlan_network *pnetwork)
+bool rtw_is_same_ibss(struct adapter *adapter, struct wlan_network *pnetwork)
 {
-	int ret = true;
+	bool ret = true;
 	struct security_priv *psecuritypriv = &adapter->securitypriv;
 
 	if ((psecuritypriv->dot11PrivacyAlgrthm != _NO_PRIVACY_) &&
@@ -339,8 +339,6 @@ int rtw_is_same_ibss(struct adapter *adapter, struct wlan_network *pnetwork)
 	else if ((psecuritypriv->dot11PrivacyAlgrthm == _NO_PRIVACY_) &&
 		 (pnetwork->network.privacy == 1))
 		ret = false;
-	else
-		ret = true;
 
 	return ret;
 }
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 96a402328398..9ead083e6b95 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -379,7 +379,7 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitframe);
 void rtw_append_exented_cap(struct adapter *padapter, u8 *out_ie, uint *pout_len);
 
-int rtw_is_same_ibss(struct adapter *adapter, struct wlan_network *pnetwork);
+bool rtw_is_same_ibss(struct adapter *adapter, struct wlan_network *pnetwork);
 int is_same_network(struct wlan_bssid_ex *src, struct wlan_bssid_ex *dst, u8 feature);
 
 #define rtw_roam_flags(adapter) ((adapter)->mlmepriv.roam_flags)
-- 
2.53.0

