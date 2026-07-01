Received: from mail-lr2-f2.google.com (mail-lr2-f2.google.com [74.125.230.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B30713A244
	for <linux-staging@lists.linux.dev>; Wed,  1 Jul 2026 03:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782877571; cv=none; b=lhuI7v2L/WgUd9J+aHtu+VeTAHYUAwL43k2Snn0dw1qpqYqpPlvn9eaerl74b5SbcIRsECvVcKYTrRxGVS4i0mMxsTJQHEsTqmalC7qX/UOSZ90mERIEi5ITqh8T264ujWWUNT8ljXdfy8q9ZUGBAtOIFSb79Rd7X1Bt1PqoFlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782877571; c=relaxed/simple;
	bh=Sq89uGz10pVo64QUiZ8/BpES6hmpfn1tG/h4Mb9egxs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mpa/T3oYD29nX9kuELm1SPWTEdh1uE6prAAT50BUMpTdu2EsqlHmenhQ8+tLlF7ImDN+2BCT615Hd8MW/Ti99PWEUqRGPDigPBq2LXnvujm92BveitHss+Tb3QU27+gQk62CkVn5EEmxRTEtMYytye21Rmwv726gACXxe5zwfIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/YfUWhS; arc=none smtp.client-ip=74.125.230.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/YfUWhS"
Received: by mail-lr2-f2.google.com with SMTP id 38308e7fff4ca-3967995bd4eso1151751fa.0
        for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 20:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782877568; x=1783482368; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r6N/JmeBk9DGQeD2dKaQh5XnYgag8lTn6wljFX2j/Mk=;
        b=F/YfUWhSNA9EIMWOzxTJ6gaVBHNTza/WPtQptHG5sGq89uEZTG4Jb8Wm9+ELMWLjBA
         jJFaFtWOSCdnVyx/LvCXMO2D1mXx6YQ1Ns1pGMTiif5cgrAuEt//Bf6RhYrFf4jQF5Hv
         iwVZnDEzWzvOkvM2wEFuaUA4BH8LSWsccdo3lZxwDGAbYsmIF69M/tBh+N2LNM0ocWeJ
         MJUHP2FG/Y9nt8rH0K2h0AOy1dwLg/FTh522BgtLU6+7NTQsD9YLMwM0TSzmAltDkvQ8
         jHITx30J2xXhHVhJ05r2GAY6h/E129Xb+kk+ZXczTQ+74/4PYQaD2g9ufPhUTWippawL
         Gpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782877568; x=1783482368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6N/JmeBk9DGQeD2dKaQh5XnYgag8lTn6wljFX2j/Mk=;
        b=lPpgKIzl+t7Ae5tf91bwEPQlijfijc5aiNQRvQH8xN6uMWGB6cIWILrwezjKTz9qJk
         KSTKwCnYoek8zDp68vlJC+WocoPHNXcS7pm5DyA82l0BtZY9FuyDK+2bNkTEHZzvSRom
         3YANF2AxGzVGmgT1UbbGm3MJlB9lc4WECkj6D9kJmb/uZ910j1pXGpzU/1UVmu5fDXBs
         /ft9b7etRaqeILRiNeIH6R+CfKzozHalf0pmVxyqbCu6+n3+9qBFfxQ0QwWpyI9glcUz
         1EieHaAl/jcrmnEffZlpFfBXVM4uUscxlTjBfTvqUL5ytNVzKzumEJ+4lEb+BH4ARXQa
         WQqg==
X-Forwarded-Encrypted: i=1; AHgh+Rr+Xo86vT+uqV9A59t0nAonTh0KWM/3DXkHu7HSaD+ibmMGHsnrK7A/D1s7xhbWDItnwNwNf3bvWo4yg+9W@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/ER0l2DT1K2HIQsQiAFxb5VIQfSI1eUk5X/vPcL6UKDYDsAuR
	v2aQEdNjBLjOzUkmrxwABCn2AYe7ykrbynFVfUrBMNwTsdN+e1jg8R3S
X-Gm-Gg: AfdE7clU5FvQoPqdbkagUGC1Mi4JreSa72y5SOSKx6CLPMq3Q2BT2G/skt1op3VXp9z
	aCRqhVfqhmGBOooXTaxpnh/nE16iQTQ1VpxogfecDWVHIKPCLCFMpZn8zJxdXGcZH0zmStDofrq
	R/J/u/N3AQpDCN/q7jzm+Ca6B2IcibniqR7r3c8y9etdpI+wxjAEagjFMlwH2Xfig9GiS/Fb3Dy
	uZIei5g1wukY15v3eSxedtQWtwJD/HbR3QwVEp116iu7rz/+KMs7s2xMAwQA47NXNBuapNTr+1+
	Nw/yJAcljRDABVgXN7TzvXScYhqgnvGf1xJ9lBI2yc3puapbK0oUcPUnMeyLiSrkCfzPBcsyI8n
	NxoJ4JvFxL3EW2qilTE056uNoBgLPmkWvJCV3GGmyu8yZ8rwH6hM/6IYV332t+87SNLTxHdLZeA
	39LlwNQucPtr/Ws1rVG9tfE3yiFwiyKw==
X-Received: by 2002:a05:6512:3589:b0:5ae:a76b:4bb2 with SMTP id 2adb3069b0e04-5aec10c27aamr488150e87.33.1782877567875;
        Tue, 30 Jun 2026 20:46:07 -0700 (PDT)
Received: from myhost.localdomain ([89.253.29.25])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aebe4aa01fsm958606e87.75.2026.06.30.20.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 20:46:07 -0700 (PDT)
From: Ruziev Miraly <miraly.dev@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Ruziev Miraly <miraly.dev@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces in rtw_wlan_util.c
Date: Wed,  1 Jul 2026 08:45:52 +0500
Message-ID: <20260701034552.5668-1-miraly.dev@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary braces for a single statement block to comply
with the Linux kernel coding style.

Signed-off-by: Ruziev Miraly <miraly.dev@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 1d37c2d5b..cc05decd4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -256,9 +256,8 @@ inline void rtw_set_oper_ch(struct adapter *adapter, u8 ch)
 {
 	struct dvobj_priv *dvobj = adapter_to_dvobj(adapter);
 
-	if (dvobj->oper_channel != ch) {
+	if (dvobj->oper_channel != ch)
 		dvobj->on_oper_ch_time = jiffies;
-	}
 
 	dvobj->oper_channel = ch;
 }
-- 
2.54.0

