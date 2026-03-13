Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45A53BD245
	for <linux-staging@lists.linux.dev>; Fri, 13 Mar 2026 16:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773419884; cv=none; b=eOxTNUmK8CzupkKRs6UHnGo/abfIb74h9oqSptRkdmLtXSWSBt46ooK484dx3OfeRTJjVzMYV9/tNdohrtZ+fHkYNMoLdeQcw5mWbUA3eYm7SJGXB2KbuFGwy8O7rCkjLh4qc43eoLfEfcXoWZsFuQYm857arwPd8tnRy4ESk8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773419884; c=relaxed/simple;
	bh=W1XXsPRnx1fqT9I5G1u82x/nU+gRo2BxmmcTnMIdPR0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JHeAoDvhtkmhu2Oz3l3E0X84rhNny82VuKYu2lgavKZgf8FaOToHgb9PF6dOSbk5DRDLFApeA/36nLhyRijNMEHfZd78oDU+SSMyKu6Uu0NeyMLotHzIGa9Rtu2kH9kuk2SYP/+nX3meyuTLiv7lq2RQ1z1bayXZweBQLXBhexs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lAQ8l1JX; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAQ8l1JX"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-485410a0a8aso22097425e9.2
        for <linux-staging@lists.linux.dev>; Fri, 13 Mar 2026 09:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773419881; x=1774024681; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i7CXb8U44RcRKmxQ742u8FVm/RdCaen6B3HL3nk1lw8=;
        b=lAQ8l1JXsKJrT3wJuGZmwWpixmo3P0ktmODEi1ZRgmD5JvNj4/FabVWenbCiANFref
         lPZhK+mjXi/Q3VBqKMMpHkjoBiC/WCdVYTPaCLb2Sl/sAmtPbnTEOkFh/FdZdJl2qsSr
         nu8gboOUFdMVN5oeMA5YvEcZRnwrrPBDDb7Pp5m8/99v0xRI/NmWfjb+vPzAxY1dtYCV
         qQduNawlxkzxQzmdYa80426sRJEK2HBO2qUFvjPwByG1/l9oFqI/4wJj9zU+pB9KBWbX
         KojLpEmGNwIXnMc3rCe882nT58jdw+3MMXBZAUXnHT+Iz8QM9E5jG/QCdPR7bOM9MYy3
         iz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773419881; x=1774024681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7CXb8U44RcRKmxQ742u8FVm/RdCaen6B3HL3nk1lw8=;
        b=LNP+hqzjrpyG5BUWLfNRExlx/RKEQYl8XjAfDKIqNmd90DUB7+1OnP10RnjOEYEwNl
         KnoVXjCw/Dz2jHTw+P3e5pD4ZOYtnxkMl+gmXijd8tChcNHua1BlHWVJyzFAMca9VnXf
         q8NcN4/EaCD2ZPpuUep0YvE6Kioy5aa+sHYeawDgEcMDWEwUQ0hzlksl0KuFydKL5x+C
         /Qsu3pDGtqJxtdylYCCPGB5JksjhQ4PxdLdi76rRr4kJ3u1k/96khpYivD6cDinpiTou
         0ykxYTfnr5y1CZCl+FAb5FX9EJd/tVUYZm21QC3fLA0ZRKRGKDvVZ3KCVJUH9LfEQZJt
         GUuA==
X-Forwarded-Encrypted: i=1; AJvYcCVUyfcO5naYgUWy5Utx9ItOctEnxGEDDDfYCSAUQCnTX3pYgnEczw+V6CYRbqlypb4TB3KKdyg0D+zfAfEb@lists.linux.dev
X-Gm-Message-State: AOJu0Ywfxc/rmKP6YDgUaPd/dBQ+X97RANS9fDoDJJadiVxEc6cr5/ZU
	d8mWt0keo5UYRsL5sLhTj+5X4YraC0fLm3Y2pJo9VCTKuoPcX506Ebvj
X-Gm-Gg: ATEYQzwHt7/s3yh4hjEkkNtC+8bSV+6hQIQLqe2NiJSfd+roBIguy4o+9bQBAQ0WLR+
	OzZj4jImWZFQKl+fdqW6740FfUQTx5BDKyJpY0Jv7DOM6eNKM6P6P8EDioTfYnau8ruchYhxe17
	AkAALPG3m6+b33sPgpF/RiP5ovZZsqxMnHQeFOswm6BVSUhfnEI5OatEqn3WLpjtvQjEWFyF24M
	QitEp6aMsceah2p+3zI3vN8f++qvetDNzZynAtWeKMSlo/IQQeKyjTuHgwMdHUDhk/JCbjzW8hA
	ClGYrTWrFTVn3Cncm8aIo7L9+8LESLFsmbbSsNp5tP0BNz719927aDg+ErvrrrEYtWeJPwWPiTs
	J+/Ous4CsFRJecxfvihdfxQcBSE+ibYEisRR6sFtlcCrx9qg7cj1Iygf589JpQfh7L2azWbRcp4
	PY4liYMb9jkC8qcfHlOx9BLUaoG+8s5GJihYUeKKKWOTtpM3Bjg7A=
X-Received: by 2002:a05:6000:2509:b0:439:b811:11de with SMTP id ffacd0b85a97d-43a04d7c5a0mr8180809f8f.7.1773419880912;
        Fri, 13 Mar 2026 09:38:00 -0700 (PDT)
Received: from DESKTOP-BTQF5RC.localdomain ([85.110.79.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2273d9sm21369695f8f.34.2026.03.13.09.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:38:00 -0700 (PDT)
From: =?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ethantidmore06@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: Improve error handling
Date: Fri, 13 Mar 2026 19:37:41 +0300
Message-ID: <20260313163740.454-2-b9788213@gmail.com>
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
V3: Fixed patch description.
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

