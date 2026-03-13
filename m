Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7696034216C
	for <linux-staging@lists.linux.dev>; Fri, 13 Mar 2026 12:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773406164; cv=none; b=sVF4YHUJfURucT9qFEPzyAwrSJVtPER4Bknj8DvEu8PhyFS6cEtW8JO4/q6voAgD18CpFPONbmNxUDhSMUbLIpnQgyVFeR1gzYaEduKN4hgyZunqOufOIxcVrO+oBQXRxYFBadkvfjKR2VLFCLUYwswRTBJto4miXQz2NbMKkWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773406164; c=relaxed/simple;
	bh=YX8DYrvANKwmCN46nhqzvNj0wKv6Y9mNMCkpfTSdD8c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Sp8ZnGcZcppaMBIPnP2FwRB4g7TbpvQSnCwyWP2s5rtjaEiB+M2fBTdYiTwrDpuVzJNBvEzVzxKq3+16nm28YW5kz8T56yr4PSQlIOjm5detrNjp4xj+Z8vTWx9DLnKyPZTA6dqaqmXBMNNYASv3o++IF5kke0B168x8t/jtkng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5PI6iiq; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5PI6iiq"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-48539d21b76so15272655e9.1
        for <linux-staging@lists.linux.dev>; Fri, 13 Mar 2026 05:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773406161; x=1774010961; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1saJ09mUSFnv5wvSt1w6UXZlmb5ycX3irFzPT0gfncs=;
        b=A5PI6iiqDSuYHYNf16tBuLE+kT+68KyfMy1/lRPmS/rykpuSOQk3MqELn7HnaScwl5
         ZQWQ8+w0Byoy5vR5ISRvXwN/5xQcz5u+RJFbmw54IWNmifhu93tRNGkTD7yeWPg5QLh1
         E1OiL1/P5DyEPqgiWIhJqKotkuyI263XxOUIzxzfh30enVQBqUtgKH0/PDtyMdobolUH
         1MNyGhgqKt3ccN0g4s2fGCCjOXTj5/wxmHR1F9sIbKylZMRXz01Up4ZY5ilcy8fRPGFS
         8Wtzr6/v6VVxfbKkCKok9a/ZqylZ/N/UR7W010WjikwsNCSUjo0Tv6rSz4dEsIqgl3yn
         LN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773406161; x=1774010961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1saJ09mUSFnv5wvSt1w6UXZlmb5ycX3irFzPT0gfncs=;
        b=M2MVZUkdpUD2aY31S3KZYffl2O7WARg9yxRliYNpeLC7ftC8KWi+HSFSfsWdHuU+Re
         vNW/R5CCgw9rTuMhRQPZWb5CyiUVeLJ+OwSa4D0DtBl7rVMy+fptILC2JdtX+8w4rT8r
         phY2CAca1SoImN6bOqX+LUlLnYMCam6c4WNkbdjsSnDw20Fj5VaZAb+CeIWQHVVZKaKZ
         t+zQGNQqlR/X2OVtss3f89F6Gyh7nUgI29GK5zkNyD8sVSznS0fKIUXaNgYa0uM0eaST
         Y6M11tObXwzyNPhFI7kABEISvmdOqZSgeDnA+W3napkHZbNziRNjFATmZ/cvKR3txezh
         OgVw==
X-Forwarded-Encrypted: i=1; AJvYcCUc9LxsKw0LaLENUzSpZJ47y0Ww//FZeXWtEnIGw1vsOzYdGdIke3/zPsCXTpYw80VsWWkWXZRA7yz1wVWP@lists.linux.dev
X-Gm-Message-State: AOJu0YzgXzAGT+qbZDsSuv7F6qkZ/IjJvBBhs6KoVu/eTMNt10l0+ZdV
	0iXyDG8ECBLJwp5CONKqUZQ+Lc+xQl19G1DMwNNqjtFETcpGDRYFb+6LRBK2r4Hy
X-Gm-Gg: ATEYQzzUQt50Q06IYQJgRQbvb5CXIUIqmoL2F4kyXrRMf/ywQybExijGP1VP6iaRvNQ
	wD0LSTL5O2hy8w2HXVC/WM7YXQMMZ6bGzkew3/eXdDvstTN2mIFU6ZICTYleC/1g928mM8RYaqr
	kF9oOYS8x7TfF+S7Kmgzf/UsXs8GWSyX3VM2FsSCRJa+HWuF2EvoKxnu1ZLStGgV6UASuFKmYK5
	6G73WNX581Wr6D9kCKcMMf0AXmClUx7FQnvr2bCYYInGnqWdkZlTnkE3W47gfn0IGvnlIp4SwlR
	RDV1qx0Yetf0dYqGRl3Rbh+ftffFRYZuu5eruslbhIQHrS8Jm4iGo+wdjymSRS35KTaES3CAkCB
	FFAW8oQAzjSr48WSiqXPSVUfSIROcT4IsW0ePmRdfxGpAYCwD+dsYEJlPNtnUJrfL1n83DIbVuM
	cJchAKaDxnjE92s0aMBlZRYPbsx4UrZ3d4eITVPcqX
X-Received: by 2002:a05:600c:8b45:b0:485:4526:ee05 with SMTP id 5b1f17b1804b1-48556700c0dmr50666915e9.19.1773406160368;
        Fri, 13 Mar 2026 05:49:20 -0700 (PDT)
Received: from DESKTOP-BTQF5RC.localdomain ([85.110.79.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557c89186sm60296075e9.1.2026.03.13.05.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 05:49:19 -0700 (PDT)
From: =?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ethantidmore06@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Improve error handling
Date: Fri, 13 Mar 2026 15:49:08 +0300
Message-ID: <20260313124908.579-2-b9788213@gmail.com>
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
returns immediately when an error occurs. Additionally, ensure that
intf_free_irq() is called when pm_netdev_open() fails to avoid leaving
the allocated IRQ uncleared.

Signed-off-by: Bera Yüzlü <b9788213@gmail.com>
---
V2: Used int_free_irq() in error condition.
V1 Link: https://lore.kernel.org/linux-staging/20260312131933.29505-2-b9788213@gmail.com/
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 28 ++++++++-------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 7ba689f2d..e86b8af8b 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -1124,35 +1124,28 @@ static int rtw_resume_process_normal(struct adapter *padapter)
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
 
 	if (pm_netdev_open(pnetdev, true) != 0) {
-		ret = -1;
-		goto exit;
+		padapter->intf_free_irq(adapter_to_dvobj(padapter));
+		return -1;
 	}
 
 	netif_device_attach(pnetdev);
@@ -1168,8 +1161,7 @@ static int rtw_resume_process_normal(struct adapter *padapter)
 		rtw_ap_restore_network(padapter);
 	}
 
-exit:
-	return ret;
+	return _SUCCESS;
 }
 
 int rtw_resume_common(struct adapter *padapter)
-- 
2.43.0

