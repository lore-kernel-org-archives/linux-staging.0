Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E8F3909A2
	for <linux-staging@lists.linux.dev>; Thu, 12 Mar 2026 13:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773321596; cv=none; b=FXqjdDl/wd5rHVK2DFwcl03qcSHTftyry3KkeASLqmOmeyBLaGunKIGPRbjZ1YLBqNY4lo66c3yp2cdnd8q0e64bVtQ754jEbBeszXdoAvPe2itSfZNhIwnxlt0d34X39KZqpin36ZWTorjQRRZwTOybij6jbke9uZKE+ABUOFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773321596; c=relaxed/simple;
	bh=jkGwDSg5iKVY4RYB3LXl77Iie5oQ/J/hQiue6Oxx5zw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CTDywvWnLlTF9RZUR4h2NxK5dOso9WGqyregWM713ZkJw1l2S7UgmSEedGgLvK/4Jx3QuHc26pFFAVSkzqMvDg4kgjrjMms1LSqGUTL3kVxNzmVx3QfZN6jc6+zh1MFEtK4e7kDPrXdeaHtYpjfKw0/2Yx9G/SwisU/krI4JUhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bpDWgxRa; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpDWgxRa"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4852fdb36a8so11596195e9.2
        for <linux-staging@lists.linux.dev>; Thu, 12 Mar 2026 06:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773321590; x=1773926390; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UQ7STsHE7rEfwGzRvfZisMH+OggyIloJdy1dOS8CO7Y=;
        b=bpDWgxRaZGge+DQxdfd0JuCNO3OoJGukBZpnRUia/gB1dlTN8L8AZOp2uldJa9Wv09
         zy8Fby3Xm0fLT+PTePK1SzSzSKp8lsC1lrYkRU2/duE+lQvRRw08844JeR4YT04+tUX8
         fmUTDjuSzvk6POZvMESs+MdjA+54I2eyltUwLjLmx134UbMiYCDpSOFuEtVj8Ym7Ppi3
         zGqH32bi5hu0rojR1OUk4NRY9adI8m1Hi4Lnw/PDQm7HymvA8Ehq27KArmorjB3DlBJ8
         w0Ad5WOv2kfDIImKiOO/C6b1p38RdlB7JAbsaixLhhlzWmZayb1DE1NO213xdNtJgsnn
         1iwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773321590; x=1773926390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQ7STsHE7rEfwGzRvfZisMH+OggyIloJdy1dOS8CO7Y=;
        b=gVsFj5fCu01YGCQr+1+MpFqP6lu8lWZ7FSvQ5cscVvn9oMRHbh3AqHg+koJ/6FWhiv
         unruLNmuzxPqkwSzl864ZGFwvgjcwEzlCD8IURUngtMKW2aiGdrKHRKW6AQXr6ccFrzF
         6VzAeAy5QZ4cSbCfQ/QovZ+RqfPnMew1GppsuL5X2+o/C9SuJnoxYKIG7t95mWE9SHJo
         uHket09jPKPkomstiVUZkj7XKnf/oAGoWCHUMnH0U/cTpziwA21ViydAqBYb6Hp4jgaS
         DRfbIDOlunsME9umEAbfqOG4IoSn2FRpjMDS4qsKGDulWP0h2FjzhGrN+ydaVFT/Eg7f
         1jaA==
X-Gm-Message-State: AOJu0Yyqd/xbPryVcewsdpNbLnI9hmnC926lyXcW2WktWeVr+D3MOkGR
	HTMJeJX9wMMnN6Iqa5KF30U43JVSWLy/9QH0qk0TH9kVEnAaEWqzZIeN
X-Gm-Gg: ATEYQzzZs/T/EcOOD1g93OlGD2D5YFoOjRVAXIWbummFk06zzQVQjj0QX+7dVTco83A
	2cR5n2ZD85acW0FkaMLOuhMDAUpCZ6f+/6K9uzSCw3J+OCTDrMrrU4NKzybPuURAzLawzRMCeat
	HmCy6Hd/69OrUd7Uc8a7PYRF/B/rbWLrhzoNLHgLMcOqGIAndhGokHjUjnn4Apv8JLJsPleBBba
	cofaZvyK53idXP5ehZL2P8VCUugbo00uxLLPuAgEoEUHk0X3EOT6k4QVBWNUBz2hMpWOAGDJtOl
	1sbhdFjj+O+xEL+u42nHfv4s7ro3FYNlRXtDy2tSchI+/y51uEupbYSRISH9xbgBHZkZ4H5r/LL
	uVjDazl4QVJVa6YjhwD/oSoMtir4qc8ScRl28nT3nvUad/KyTTYNAaBt8W8kAeyBdLpcXMCp7JI
	a/VdPRzg4zxSBdHNy0a79Zj8HAZvAK91pa8o1IdFta
X-Received: by 2002:a05:600c:46d1:b0:485:35a4:939f with SMTP id 5b1f17b1804b1-4854b1484b1mr106948175e9.28.1773321589454;
        Thu, 12 Mar 2026 06:19:49 -0700 (PDT)
Received: from DESKTOP-BTQF5RC.localdomain ([85.110.79.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854a1a4444sm72107005e9.0.2026.03.12.06.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:19:49 -0700 (PDT)
From: =?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ethantidmore06@gmail.com,
	=?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Simplify error handling
Date: Thu, 12 Mar 2026 16:19:34 +0300
Message-ID: <20260312131933.29505-2-b9788213@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove unnecessary ret variable and goto exit pattern. The function now
returns immediately when an error occurs.

Signed-off-by: Bera Yüzlü <b9788213@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 30 +++++++--------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 7ba689f2d..fe910cc68 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -1124,36 +1124,27 @@ static int rtw_resume_process_normal(struct adapter *padapter)
 	struct pwrctrl_priv *pwrpriv;
 	struct mlme_priv *pmlmepriv;
 
-	int ret = _SUCCESS;
-
-	if (!padapter) {
-		ret = -1;
-		goto exit;
-	}
+	if (!padapter)
+		return -1;
 
 	pnetdev = padapter->pnetdev;
 	pwrpriv = adapter_to_pwrctl(padapter);
 	pmlmepriv = &padapter->mlmepriv;
 	/*  interface init */
 	/* if (sdio_init(adapter_to_dvobj(padapter)) != _SUCCESS) */
-	if ((padapter->intf_init) && (padapter->intf_init(adapter_to_dvobj(padapter)) != _SUCCESS)) {
-		ret = -1;
-		goto exit;
-	}
+	if ((padapter->intf_init) && (padapter->intf_init(adapter_to_dvobj(padapter)) != _SUCCESS))
+		return -1;
+
 	rtw_hal_disable_interrupt(padapter);
 	/* if (sdio_alloc_irq(adapter_to_dvobj(padapter)) != _SUCCESS) */
-	if ((padapter->intf_alloc_irq) && (padapter->intf_alloc_irq(adapter_to_dvobj(padapter)) != _SUCCESS)) {
-		ret = -1;
-		goto exit;
-	}
+	if ((padapter->intf_alloc_irq) && (padapter->intf_alloc_irq(adapter_to_dvobj(padapter)) != _SUCCESS))
+		return -1;
 
 	rtw_reset_drv_sw(padapter);
 	pwrpriv->bkeepfwalive = false;
 
-	if (pm_netdev_open(pnetdev, true) != 0) {
-		ret = -1;
-		goto exit;
-	}
+	if (pm_netdev_open(pnetdev, true) != 0)
+		return -1;
 
 	netif_device_attach(pnetdev);
 	netif_carrier_on(pnetdev);
@@ -1168,8 +1159,7 @@ static int rtw_resume_process_normal(struct adapter *padapter)
 		rtw_ap_restore_network(padapter);
 	}
 
-exit:
-	return ret;
+	return _SUCCESS;
 }
 
 int rtw_resume_common(struct adapter *padapter)
-- 
2.43.0

