Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4522BEC51
	for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 18:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752604118; cv=none; b=rQdo858nQLIrsIVjbtxv6aKzJC7k3m/cAg2EDJGbGFaD3UrDsUsk8gwzK/zcrRP9k33JgZTEjhgd0ejpfNR6i+CmL0tkZfugvrrHRmV14xLj3iKvbkhCscySCjc6MuzYFloulnYnb74Ia7hm9F04YLnSxy4OwKnsZO0gZz62otI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752604118; c=relaxed/simple;
	bh=jZXa93EnkKPsER3v2eQGqokw1yYueS1I2clvseSv5Kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KPCtkbgqHCsHOTjdNguzjzKqOQOoBaWcfgr/0BR1U7jnRveRY7BztjubTykcdBzYUWVL2RSRERV/60igHflTpHu2oxSne4wECZhHnP4B7UcUkbZAJRg9T+WiMaxsEwD0tC44M6IkzD6HGluqBOU5BFWBl1ArPO8U7kCTyJlpPtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fj1v0sGA; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fj1v0sGA"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-60c3aafae23so348691a12.1
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 11:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752604115; x=1753208915; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/IA/PW/XrIS37fLIlQkAaqHqkiJ709xrEkI5utPy7XI=;
        b=Fj1v0sGAcQFxffvAahSnHvpN6sqpGhX/uOpcI3qPJsl2vuR1yWAlFii+St6299MBDV
         G/TxpPejWMYSENl+BLU3OyDzRrLbI4uxzmXm3nebbVioqJBfeCpXdAI72oHUiedbDUPH
         O4P0W01/hwc2XRIi7uOvbWkxBMTnk99+FMRW/UBLWVlx7Wuum/gC/sZcXx6RDMcdCjdz
         BRjKaQ0rS2lmeCEwLn7TYxYefM2ZX7GVbxX9593wEdVs/fD8SERIB+N1hhBYkwoRZUXI
         74b9gpRycZlwjhLAgvMzloWL444yGpJIE+7vDFp720heZhJvJI8WnvhfGbvAtMvSuuUu
         iLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752604115; x=1753208915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/IA/PW/XrIS37fLIlQkAaqHqkiJ709xrEkI5utPy7XI=;
        b=Errj3rOZsYU+/2HglCSqQo0yPnXt1Hf/h100MJa1JvZEFX93kOw3J81M+znjrsPPrC
         aup1OqBdtYLavRVKF/9uUhNrt0va7+dtGDIZBTMgAbOUPxe26y4sI3iTaDC8ksoFpus6
         2SxfyN+HQ5sX1zOx+mT1o+HAvxNYkmqn6Zs4Sphg99DPUEr0OubZ5RIrU+64rTysMXKV
         Xb+YDMVF8EPkp5nb/uvysqL70Yb3WOQoVsuzjLEsHkecOjvOr45hwXcZAdUxDPMwdOLl
         OIX2nmqwGc0rops/xQsn244ftFmPkRehWWdGQZ+TbnHHRL6tUvoh+t/nI1YzneGRWbaF
         v4cQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnRUSkUFScDsiEaePyh0S1NDLS9c1mrxP+r9rK6CjmPWWjblMsi3KqmtOU5SaYwVLJW9TZsNQJB/sjNZoi@lists.linux.dev
X-Gm-Message-State: AOJu0YzIjQooQYLZu2rEXQnO3hvKh0UqX5zbciGLT+taqfvcSCrV6ELq
	bqjjT3agQfrgDqDWgYJcifrQiLS93Yw9vI/E0C40hr1Wgao3kKfdw2aN
X-Gm-Gg: ASbGncuMbquQdb/ozdIZVp5Tw8zjfHgjMh2xPWfX9lqYeogSLOP3ec6F8nBWuArjGPm
	vm4sjJN85te6L3vT5h9j/xRmhngHuNx+QZe7Sv3bdbsO/kyYu7j1YNWzLHjmVnLYenYKcTZHDbW
	Ffr8gOKkAW9r8eOoW60utlOHHff/KknCJcDomZq3kJ7brObgOXauTIa4xeW+TDbnl4G3m7ReqPa
	cg5gGyCxGBkzWmmhsXbTvvO1g2JOqIgQYG11glak8SnJLiXqZxSkaXaS3Fycr3KXNCsasmgZSWr
	Wvjju28tD0RepNHGi1xs777X6p59ucsiKPB2KtGtkINiB9mNCBqYdHBf3TCBnF+bHPkjpx+gDVC
	Q3w//U9e6/Eq+2RFtJqJ3GgA=
X-Google-Smtp-Source: AGHT+IH7BOifHjuscVWUuNkqokWkmiGzCh2TaQtOLAGddCuuQZlRz71WpuPCz6g5MZoRlm/6h/u/rQ==
X-Received: by 2002:a17:907:3c92:b0:ae9:c8f6:bd3 with SMTP id a640c23a62f3a-ae9c8f61583mr78675166b.7.1752604114572;
        Tue, 15 Jul 2025 11:28:34 -0700 (PDT)
Received: from tumbleweed ([95.90.185.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df2fbsm1039562766b.158.2025.07.15.11.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 11:28:34 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 08/11] staging: rtl8723bs: remove function pointer xmit_thread_handler
Date: Tue, 15 Jul 2025 20:28:11 +0200
Message-ID: <20250715182814.212708-9-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715182814.212708-1-straube.linux@gmail.com>
References: <20250715182814.212708-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function pointer xmit_thread_handler and use
rtl8723bs_xmit_buf_handler directly to reduce code complexity.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c          | 4 +---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 --
 drivers/staging/rtl8723bs/include/hal_intf.h      | 1 -
 3 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index d9791027a2f5..29e0610f72f1 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -285,9 +285,7 @@ void beacon_timing_control(struct adapter *padapter)
 
 s32 rtw_hal_xmit_thread_handler(struct adapter *padapter)
 {
-	if (padapter->HalFunc.xmit_thread_handler)
-		return padapter->HalFunc.xmit_thread_handler(padapter);
-	return _FAIL;
+	return rtl8723bs_xmit_buf_handler(padapter);
 }
 
 void rtw_hal_notch_filter(struct adapter *adapter, bool enable)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 11d9b9031215..c35b0235d3c1 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1315,8 +1315,6 @@ void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 
 void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 {
-	pHalFunc->xmit_thread_handler = &rtl8723bs_xmit_buf_handler;
-
 	pHalFunc->c2h_id_filter_ccx = c2h_id_filter_ccx_8723b;
 }
 
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 7b634180c6c0..ce3c6de8a325 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -161,7 +161,6 @@ enum hal_intf_ps_func {
 typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 
 struct hal_ops {
-	s32 (*xmit_thread_handler)(struct adapter *padapter);
 	void (*hal_reset_security_engine)(struct adapter *adapter);
 	c2h_id_filter c2h_id_filter_ccx;
 };
-- 
2.50.1

