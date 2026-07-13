Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9A73769FE
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 23:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783985662; cv=none; b=IRJVRjEufIhnOO6U0V4snpA7Pitl/obPVYh+KF+TMPUtTJgs9mD1kzdxsvE1wFPyStwF0lxPw2+Vl7LrjSCGsHEM+guK0BBZ+e0wb71k8NR7eQmvDLxhuwc1AG9PFhJZYMYQcFFaLa8dyOrY/4sJZ1WSb16Mmw0jRxo1n65dJaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783985662; c=relaxed/simple;
	bh=vI7IUfDTfhJhO23+36VGjVdFP5t4Tvo8CJM9Posgewo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LSo2Ebj1qJUUuqWCai8SJR3BaFGoO94cjmQV1gqSkucm2doC+V7qzQLdLh73xyvN03eKWRRNUdP8xzqAFY6gu5Ea0AHPrPyXDo0sMgMzFApjMAnUOd6S9Wf8kCtK/47aDZ53ZEMhMKLiP+lqfzunJw7pyJRKUNLUCaKlwbNZVSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dlbnJG2f; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dlbnJG2f"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so467309a91.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 16:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783985660; x=1784590460; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=//ZlacB2Oa2FNvdIBoflrEYY2gfZtfJvgiobaqyBbuo=;
        b=dlbnJG2fmMVyW2kJbRm3iqVkGX9edKIIw9evofhDEOgf8jp/7Xqv1Q045pww4kTBU0
         1oIxPZLqp4tS1p0xSjIvRSf1Q8P/6Z7LN59N96YIyQGC+ky7z+zg7pDgXCxxsU7QObeF
         RmC+YGwWtgghlYt3fRVF+FRilMbs8bp4B5xjYVt0URJXmItuljvMahA0gIizD764OYEm
         M/rpU9+NpOfYeTW9X/AJYTA0iM5XukiIbGdYXenhfaGhNg3BEQS9mBb2OEZLTn5jP7w4
         23VzAsv1V99WhTs7CfS7uE4jL7+0U5soXxD4+Ok9/UTAug6jajDvoCF+rsmrF+aL1gMU
         fZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783985660; x=1784590460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=//ZlacB2Oa2FNvdIBoflrEYY2gfZtfJvgiobaqyBbuo=;
        b=oTU5RtChTVAeZGL+dTHtqPYdbJqRgM6jE9RkumpX978tUZJi69hCrZfKIXs7zkQlRb
         TqJewJ3j4GE8zWTJhBbAP9KkGfFisuSa3yPKqMYUFqhhejo8f8ntfr5gsgM84dUv4M1J
         2Vn4qz2rD+h+lkT9RD/9TXnQSDRU2yAMXboJRazA+JqhYzjsPRW9QBFxqU8aHoOFg8ZZ
         iWQPamdArgseHd6W2AVLa+U/BFrICjtQYvHqwyiT2X8Wmg9Jp8wRogSpFZKtWEkdfWZm
         C5E7m+sK0nMWGgPm+h8gFco0sIfQAqaHOkD07wYRMPRh1IRVwQAyckoXFiD1Vz4X2VFR
         G8kA==
X-Gm-Message-State: AOJu0YyoZYi5tK9OY4aRHiUALAf/0g/vTuL4M/bGB3Onkf5OR/jcR5KF
	JEXPFjuQtFAKsOR+RtCxY2XnpYupEr9ZEt8cMOzMYELYnqMPWMcT1igk
X-Gm-Gg: AfdE7cks2ud3sTLoFkRdGJW4Sc+ENIyivPs4ETni67+uZ918xCZHoIdy5Xmxg3qQ1IW
	raY7Ve2eN9GFUOF8pKT4TislYcvDlLw2qoLTnzSoUnobY8bTEHfwmU7gi7e8qvfKdnvL530DuCG
	SmdpcX9rTLFHqDVpivb41ICMkfuVYClEzcpyIVicjy8oKx4qMnk6cnm/Kel+x8buAMDL6yyJefq
	yg4K4vWNcvRbccS4uLDPO5bkRSqNZJZMrY0r9AnXTB5/uXb3vvT/RRqRW5YezeHJUuXiNV8FgPY
	NEF70cp9OnH6nwfXdRRx5K0FCQXJh7Q34ZCw1NH09CU+wbWv+ztHSb+bs0vS8nifPHfz9SYGEfw
	rxGGgRuOtWBXxAanuUeZYomO/k8FxUFaHag7bUL5kt1jbBrEcjF0BQocYrEWtlZRQpAqJJoIFok
	78VLdV3ANW/e7pmJN+PrV2bN/OgeEJ38Ta/ikaoG2HhHYo98r8CMy9OoCk5WbOB6nhlfx4JVvaw
	Z1oYCSjNq70qoaeyhY24cBy6zGUvUv+BwtZs/PmdL1Sl4OvGaukE9IeNLergnc=
X-Received: by 2002:a17:90b:3d90:b0:381:973e:fa08 with SMTP id 98e67ed59e1d1-38dc7a49f4emr10412330a91.18.1783985660265;
        Mon, 13 Jul 2026 16:34:20 -0700 (PDT)
Received: from bloom.localdomain (S010680dac2bce256.cg.shawcable.net. [174.0.186.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cebec91c92sm30178305ad.56.2026.07.13.16.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 16:34:19 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>
Subject: [PATCH] staging: rtl8723bs: use kfree_sensitive() for key material
Date: Mon, 13 Jul 2026 17:34:01 -0600
Message-ID: <20260713233401.48262-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The set_stakey_parm struct contains a 16-byte encryption key.
Use kfree_sensitive() instead of kfree() to ensure the key
material is zeroed before the memory is freed, preventing
potential information leaks.

Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
 drivers/net/ethernet/faraday/ftmac100.c  | 47 +++++-------------------
 drivers/staging/rtl8723bs/core/rtw_cmd.c |  8 ++--
 2 files changed, 13 insertions(+), 42 deletions(-)

diff --git a/drivers/net/ethernet/faraday/ftmac100.c b/drivers/net/ethernet/faraday/ftmac100.c
index 5803a382f0ba..adb318925f44 100644
--- a/drivers/net/ethernet/faraday/ftmac100.c
+++ b/drivers/net/ethernet/faraday/ftmac100.c
@@ -49,7 +49,6 @@ struct ftmac100_descs {
 };
 
 struct ftmac100 {
-	struct resource *res;
 	void __iomem *base;
 	int irq;
 
@@ -1137,11 +1136,9 @@ static int ftmac100_probe(struct platform_device *pdev)
 		return irq;
 
 	/* setup net_device */
-	netdev = alloc_etherdev(sizeof(*priv));
-	if (!netdev) {
-		err = -ENOMEM;
-		goto err_alloc_etherdev;
-	}
+	netdev = devm_alloc_etherdev(&pdev->dev, sizeof(*priv));
+	if (!netdev)
+		return -ENOMEM;
 
 	SET_NETDEV_DEV(netdev, &pdev->dev);
 	netdev->ethtool_ops = &ftmac100_ethtool_ops;
@@ -1150,7 +1147,7 @@ static int ftmac100_probe(struct platform_device *pdev)
 
 	err = platform_get_ethdev_address(&pdev->dev, netdev);
 	if (err == -EPROBE_DEFER)
-		goto defer_get_mac;
+		return err;
 
 	platform_set_drvdata(pdev, netdev);
 
@@ -1165,20 +1162,9 @@ static int ftmac100_probe(struct platform_device *pdev)
 	netif_napi_add(netdev, &priv->napi, ftmac100_poll);
 
 	/* map io memory */
-	priv->res = request_mem_region(res->start, resource_size(res),
-				       dev_name(&pdev->dev));
-	if (!priv->res) {
-		dev_err(&pdev->dev, "Could not reserve memory region\n");
-		err = -ENOMEM;
-		goto err_req_mem;
-	}
-
-	priv->base = ioremap(res->start, resource_size(res));
-	if (!priv->base) {
-		dev_err(&pdev->dev, "Failed to ioremap ethernet registers\n");
-		err = -EIO;
-		goto err_ioremap;
-	}
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
 
 	priv->irq = irq;
 
@@ -1208,32 +1194,17 @@ static int ftmac100_probe(struct platform_device *pdev)
 	return 0;
 
 err_register_netdev:
-	iounmap(priv->base);
-err_ioremap:
-	release_resource(priv->res);
-err_req_mem:
 	netif_napi_del(&priv->napi);
-defer_get_mac:
-	free_netdev(netdev);
-err_alloc_etherdev:
 	return err;
 }
 
 static void ftmac100_remove(struct platform_device *pdev)
 {
-	struct net_device *netdev;
-	struct ftmac100 *priv;
-
-	netdev = platform_get_drvdata(pdev);
-	priv = netdev_priv(netdev);
+	struct net_device *netdev = platform_get_drvdata(pdev);
+	struct ftmac100 *priv = netdev_priv(netdev);
 
 	unregister_netdev(netdev);
-
-	iounmap(priv->base);
-	release_resource(priv->res);
-
 	netif_napi_del(&priv->napi);
-	free_netdev(netdev);
 }
 
 static const struct of_device_id ftmac100_of_ids[] = {
diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index b932670f5d63..a34ee407285b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -899,7 +899,7 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_
 	if (enqueue) {
 		ph2c = kzalloc_obj(*ph2c);
 		if (!ph2c) {
-			kfree(psetstakey_para);
+			kfree_sensitive(psetstakey_para);
 			res = _FAIL;
 			goto exit;
 		}
@@ -907,7 +907,7 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_
 		psetstakey_rsp = kzalloc_obj(*psetstakey_rsp);
 		if (!psetstakey_rsp) {
 			kfree(ph2c);
-			kfree(psetstakey_para);
+			kfree_sensitive(psetstakey_para);
 			res = _FAIL;
 			goto exit;
 		}
@@ -918,7 +918,7 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_
 		res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 	} else {
 		set_stakey_hdl(padapter, (u8 *)psetstakey_para);
-		kfree(psetstakey_para);
+		kfree_sensitive(psetstakey_para);
 	}
 exit:
 	return res;
@@ -958,7 +958,7 @@ u8 rtw_clearstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 enqueu
 		psetstakey_rsp = kzalloc_obj(*psetstakey_rsp);
 		if (!psetstakey_rsp) {
 			kfree(ph2c);
-			kfree(psetstakey_para);
+			kfree_sensitive(psetstakey_para);
 			res = _FAIL;
 			goto exit;
 		}
-- 
2.55.0

