Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFFA200C84
	for <linux-staging@lists.linux.dev>; Thu, 24 Oct 2024 18:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729793467; cv=none; b=hRgtJsPVjNRRh5xJFhPrBGQRjbm/jcssuHdBgXY7oA8P+wV6/a8u4ZSMpTxo6rczVn1xUVTdDQnZ4gqZR9NQBndeq5pAA7mBMzYz4VFT7iRAtfp9JmdKJo81f4GGcINA1+7A08c0qTS3F5eZ4knxliRaLKOUh+iDgnQrGJxbw0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729793467; c=relaxed/simple;
	bh=pMXdS9Y43tEVF1g5qT4UYg2DiIIY/uHnTarQtEyEZ9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XyD+TCDWGLvuryeBRoek7T2pdnaMNPISqqRPYu3iZHIcQguo8Rdy+g26qaBo5bz+FVafeBtj32svPyDyH7wSIIuuEq0jC+tYPvW1THGLGe+Hzk9yS83zgJJg4Nvb6Vbpc//yGPLpaZrZRLxumrxu9AOrBJZ+qSvZGPAkpSNMZs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KZ8x61aw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KZ8x61aw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729793463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uqEsnFfp3puSbfjZ9fURZe08WNMsouBpkjmmxvudh7Y=;
	b=KZ8x61awEfMteZ2tw/YNp0OrAwsOZ3/GCrfMEnjM6UmwBvu2vlFIW/thxz06058oba5OnJ
	7qIQYnIdPSc4k2x0XR6fBwgYATTQlfDlpznM2HsrFo2iWkNXpzOQcypEa4N13oyEa2rkhn
	fBxwjGw0qUB8J0dJXCB2/vjCvH7qSQg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-630-1uQj4VkTNDG6G0y4F0Vnjw-1; Thu,
 24 Oct 2024 14:11:01 -0400
X-MC-Unique: 1uQj4VkTNDG6G0y4F0Vnjw-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5CD2319560AB;
	Thu, 24 Oct 2024 18:11:00 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.75])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 250F619560A2;
	Thu, 24 Oct 2024 18:10:58 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: rtl8723bs: Remove no-op netdevice_notifier()
Date: Thu, 24 Oct 2024 20:10:52 +0200
Message-ID: <20241024181052.67031-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

rtw_ndev_notifier_call() does not do anything other then
a netdev_dbg() + always returning NOTIFY_DONE.

Remove the no-op notifier.

This also fixes a WARN() when unbinding + rebinding the driver
which was caused by the remove() method not unregistering
the notifier.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/rtl8723bs/include/osdep_intf.h    |  3 --
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 28 -------------------
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  | 15 ++--------
 3 files changed, 2 insertions(+), 44 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_intf.h b/drivers/staging/rtl8723bs/include/osdep_intf.h
index 111e0179712a..215ece612f71 100644
--- a/drivers/staging/rtl8723bs/include/osdep_intf.h
+++ b/drivers/staging/rtl8723bs/include/osdep_intf.h
@@ -55,9 +55,6 @@ void rtw_unregister_netdevs(struct dvobj_priv *dvobj);
 
 u16 rtw_recv_select_queue(struct sk_buff *skb);
 
-int rtw_ndev_notifier_register(void);
-void rtw_ndev_notifier_unregister(void);
-
 void rtw_ips_dev_unload(struct adapter *padapter);
 
 int rtw_ips_pwr_up(struct adapter *padapter);
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index fc9b9c5efb50..4bcc1c0d9fcd 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -381,34 +381,6 @@ u16 rtw_recv_select_queue(struct sk_buff *skb)
 	return rtw_1d_to_queue[priority];
 }
 
-static int rtw_ndev_notifier_call(struct notifier_block *nb, unsigned long state, void *ptr)
-{
-	struct net_device *dev = netdev_notifier_info_to_dev(ptr);
-
-	if (dev->netdev_ops->ndo_do_ioctl != rtw_ioctl)
-		return NOTIFY_DONE;
-
-	netdev_dbg(dev, FUNC_NDEV_FMT " state:%lu\n", FUNC_NDEV_ARG(dev),
-		    state);
-
-	return NOTIFY_DONE;
-}
-
-static struct notifier_block rtw_ndev_notifier = {
-	.notifier_call = rtw_ndev_notifier_call,
-};
-
-int rtw_ndev_notifier_register(void)
-{
-	return register_netdevice_notifier(&rtw_ndev_notifier);
-}
-
-void rtw_ndev_notifier_unregister(void)
-{
-	unregister_netdevice_notifier(&rtw_ndev_notifier);
-}
-
-
 static int rtw_ndev_init(struct net_device *dev)
 {
 	struct adapter *adapter = rtw_netdev_priv(dev);
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d18fde4e5d6c..81867b98d793 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -382,7 +382,6 @@ static int rtw_drv_init(
 	if (sdio_alloc_irq(dvobj) != _SUCCESS)
 		goto free_if1;
 
-	rtw_ndev_notifier_register();
 	status = _SUCCESS;
 
 free_if1:
@@ -484,22 +483,12 @@ static int rtw_sdio_resume(struct device *dev)
 
 static int __init rtw_drv_entry(void)
 {
-	int ret;
-
-	ret = sdio_register_driver(&rtl8723bs_sdio_driver);
-	if (ret != 0)
-		rtw_ndev_notifier_unregister();
-
-	return ret;
+	return sdio_register_driver(&rtl8723bs_sdio_driver);
 }
+module_init(rtw_drv_entry);
 
 static void __exit rtw_drv_halt(void)
 {
 	sdio_unregister_driver(&rtl8723bs_sdio_driver);
-
-	rtw_ndev_notifier_unregister();
 }
-
-
-module_init(rtw_drv_entry);
 module_exit(rtw_drv_halt);
-- 
2.47.0

