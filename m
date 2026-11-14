Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794639246;
	b=1hOJQHdontrSZqzFOg9lWFHruDubqQqLFz56D8m87PGbR2UO/Jn5pR0FXSh0JcWqA+DS
	 8TfeMXvWKscaBFX/nuUPUDjOT7VFgPbd2egh9yCGxO3JWi2j2P02955fzvYu1j7NErAzk
	 8aRBQ5740cs7nzaTl3NWaoDsMB0EZslR1pWM2Gj87C1RVOnOkTOr6aak3zVEZ/FFcZUFY
	 JDYVNhX0jXPF6szvvDF/nY+9vkKSGaX2pglxRQ11YrPTirOKMkizl4tfrvkf6Gkw0wUH8
	 uXbzcafPc1QJSQ9C4+DQpR65tZTgLqLX4H3aTawQboILCv5S5ZvlO1SSjlNuhXWfNpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794639246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=jpc7xYgRbp0PzEsHnP3QCuDwXQdtcMONN5oNV3WRItQ=;
	b=pE/uA4qeLgWxM4XTDiU3LHZaTCWTkrLXkDHuAqtL4U7b0GPy2+A13Q2GwyB7NrXPax++
	 b8gVoiebL0uJixTDrgDcG+dwlhCvdiumW4VKuXH5fusujkJ8sGFDxv6wSBGGGTHjkwNYM
	 JabfYIYJ7EAMJBE5FRNn8i+Cp75qbPbt0uZs26R1uCte6dMI16Mr1vahc0ePnuYqaQjpa
	 ixCk/nOHfroeujD01fNLPZCN9aQMxvHtof5ud8qGY/VBHDwA/xckeBEXMHW0KLHrdxbmr
	 yAR2mgT3tmLmQiH/MWSzuLs4LFuVDGI5qnNzgUT3dUivRsZaLpA+y1z6tlzw9soLWmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ihqAz0+A;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4203B606A32E
	for <linux-staging@lists.linux.dev>; Sat, 14 Nov 2026 06:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4203B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ihqAz0+A
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-37000e7234bso2917396eec.1
        for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 22:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794639244; x=1795244044; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jpc7xYgRbp0PzEsHnP3QCuDwXQdtcMONN5oNV3WRItQ=;
        b=ihqAz0+AKtvyIyGCqzHfomZbn3wgh0Uqqz9E40l6X+UKJRHyM8J/Gi7BOBA7zIpsS6
         xTILSxk9ZyaQvGO3pqByBJ7xWNQaPXGiWmTypVigO+mJ51FPtQZH2H7KDAUsfpAucqGJ
         qfkhQO1LMgo2caV6WvA2xbCAJTyvWaDfmaq8KUlFsV7vTJh4o7o+ffDOGS31FurHQrfK
         roJDfi6hJ1y2JSeyL2mCzV4kqWOWkRsqfhEYqKw232LUTEddagmvvIdyEao5ozBHUCG5
         tl9hiYKfOMETtqBuF2hiJIaGOQQ4+hihCGWIdRyqWO7FI6Azh8iriIdTjE+SfDQZyOw/
         WpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794639244; x=1795244044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jpc7xYgRbp0PzEsHnP3QCuDwXQdtcMONN5oNV3WRItQ=;
        b=POVvF19af1u+ixAY09mTYDzvzFRM6dsfzsFlvXANhJPtgSVlFadX8rzjrcDvHIVmqo
         5WxIKFz1YXGhRqoI2mhmwaS5LXwvAXgQcBB3EnWA+VA2Dqp94K92WxB1pKTkHR0wlzqV
         qwX08m8RtLyvSg9a/FWywhybw9VlYBzG8VEer08V8KpXHNsvlfoLICHp72IOX8x3J9o2
         nSrkycqblgBgf86cyMRkdeAp1saeAqmSjUXrQYKUq2BAerdLDhAg5KGRe8FuDr2SnToe
         XIRjRR3WaaB13zGxI4NLHLgLf7rGv3IGyUOBHlH6WX/iYnlxELHUFwQuKCsz4gvBEEOL
         q5Pw==
X-Gm-Message-State: APuU4Z8e8k1xrZCBkVu+QRKbYlggwkACrZQ/z2/cMB11c+f1VwNMuPml
	UmOp+58PyNZPUPcuTEbH9wTLfOGeSr13sg+zA6hb3ArCEAES8+pJaOv+
X-Gm-Gg: AYBFou2u+Npxs9eTmMww8t0KSmvbGkj5iM52+2mqz962Xe55MLfY8xSzx0epULlI3Kw
	/RlAE/drEOZgfkoBtP8vu4AyaSpwm50vQLNuzXv8XAJbeBFtuVhByF27y2YbAt4ENELWVWeATpE
	hdUdkBz+WULXsJQNKHCvfb8z4YYxq/+87ogDKPsk1skZmUXgkZsC4WfWuvGzKHPqgqKx5ol4hO/
	EJMG9Wd+PpmkwBsGjiZr/5j3AhH1aoQcS8g3qI2rNBr3tXO1DvwLz4u257OBIITe34nIKWbyZP9
	TX6gb+1Rb8Drqv4ZJfusuJCYFLUs6Vev9OT/PtAUzB0JtVjbVUHvqLBYaOyUFI2LqfW0xlVvZ89
	rPimlLBroi7wxwp83WPH7td0watDvIWpVUOL67/k/XkLi5w7TbNiAT/v+j303rTuwDPXEjgGJU2
	d7C6Ol4PSVx6hSsqhi4QMhdpXkZRwcoodYd6Yk0N6t6IWNyputhSc27p0qLZ6LVhSWQHJQzyRga
	cMMu6kMFaBX4w/zjBljq+Q4B6ozguFdbiEIHIevIZOUiUDkejG14wFe3+jo3iUIhaX28pzIVgtK
	JR6w4HjYNNXn62ZqV6hc+Cq2mDpla9AsGLRPCrpk1mgL2342ksYRInvecXfgGzFO4H7qlS/iWis
	/mIUUsuYodd0uXPGDRBFs5rwugQ==
X-Received: by 2002:a05:7301:2024:b0:36a:18e2:64c with SMTP id 5a478bee46e88-379655d3d12mr4902007eec.11.1794639244069;
        Fri, 13 Nov 2026 22:54:04 -0800 (PST)
Received: from kdev ([131.179.133.114])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm13297026eec.3.2026.11.13.22.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:54:03 -0800 (PST)
From: Niloy Meharchandani <niloymeharchandani@gmail.com>
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Niloy Meharchandani <niloymeharchandani@gmail.com>
Subject: [PATCH] staging: most: net: use guard(mutex) for probe_disc_mt
Date: Fri, 13 Nov 2026 22:53:58 -0800
Message-ID: <20261114065358.149853-1-niloymeharchandani@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace manual mutex_lock() and mutex_unlock() calls on probe_disc_mt
with guard(mutex)(&probe_disc_mt) in most_nd_open(), comp_probe_channel(),
and comp_disconnect_channel(). Include <linux/cleanup.h> and
<linux/mutex.h> explicitly.

This simplifies error paths by removing the unlock goto labels and
temporary return variables while ensuring the mutex is always released
on scope exit.

No functional change intended. Compile-tested only.

Signed-off-by: Niloy Meharchandani <niloymeharchandani@gmail.com>
---
 drivers/staging/most/net/net.c | 57 ++++++++++++----------------------
 1 file changed, 20 insertions(+), 37 deletions(-)

diff --git a/drivers/staging/most/net/net.c b/drivers/staging/most/net/net.c
index e6e4498d33ab..e08804c8ec6e 100644
--- a/drivers/staging/most/net/net.c
+++ b/drivers/staging/most/net/net.c
@@ -13,7 +13,9 @@
 #include <linux/init.h>
 #include <linux/list.h>
 #include <linux/wait.h>
+#include <linux/cleanup.h>
 #include <linux/kobject.h>
+#include <linux/mutex.h>
 #include <linux/most.h>
 
 #define MEP_HDR_LEN 8
@@ -175,21 +177,18 @@ static void on_netinfo(struct most_interface *iface,
 static int most_nd_open(struct net_device *dev)
 {
 	struct net_dev_context *nd = netdev_priv(dev);
-	int ret = 0;
 
-	mutex_lock(&probe_disc_mt);
+	guard(mutex)(&probe_disc_mt);
 
 	if (most_start_channel(nd->iface, nd->rx.ch_id, &comp)) {
 		netdev_err(dev, "most_start_channel() failed\n");
-		ret = -EBUSY;
-		goto unlock;
+		return -EBUSY;
 	}
 
 	if (most_start_channel(nd->iface, nd->tx.ch_id, &comp)) {
 		netdev_err(dev, "most_start_channel() failed\n");
 		most_stop_channel(nd->iface, nd->rx.ch_id, &comp);
-		ret = -EBUSY;
-		goto unlock;
+		return -EBUSY;
 	}
 
 	netif_carrier_off(dev);
@@ -201,9 +200,7 @@ static int most_nd_open(struct net_device *dev)
 	if (nd->iface->request_netinfo)
 		nd->iface->request_netinfo(nd->iface, nd->tx.ch_id, on_netinfo);
 
-unlock:
-	mutex_unlock(&probe_disc_mt);
-	return ret;
+	return 0;
 }
 
 static int most_nd_stop(struct net_device *dev)
@@ -299,7 +296,6 @@ static int comp_probe_channel(struct most_interface *iface, int channel_idx,
 	struct net_dev_channel *ch;
 	struct net_device *dev;
 	unsigned long flags;
-	int ret = 0;
 
 	if (!iface)
 		return -EINVAL;
@@ -307,15 +303,13 @@ static int comp_probe_channel(struct most_interface *iface, int channel_idx,
 	if (ccfg->data_type != MOST_CH_ASYNC)
 		return -EINVAL;
 
-	mutex_lock(&probe_disc_mt);
+	guard(mutex)(&probe_disc_mt);
 	nd = get_net_dev(iface);
 	if (!nd) {
 		dev = alloc_netdev(sizeof(struct net_dev_context), "meth%d",
 				   NET_NAME_UNKNOWN, most_nd_setup);
-		if (!dev) {
-			ret = -ENOMEM;
-			goto unlock;
-		}
+		if (!dev)
+			return -ENOMEM;
 
 		nd = netdev_priv(dev);
 		nd->iface = iface;
@@ -330,22 +324,18 @@ static int comp_probe_channel(struct most_interface *iface, int channel_idx,
 		ch = ccfg->direction == MOST_CH_TX ? &nd->tx : &nd->rx;
 		if (ch->linked) {
 			netdev_err(nd->dev, "direction is allocated\n");
-			ret = -EINVAL;
-			goto unlock;
+			return -EINVAL;
 		}
 
 		if (register_netdev(nd->dev)) {
 			netdev_err(nd->dev, "register_netdev() failed\n");
-			ret = -EINVAL;
-			goto unlock;
+			return -EINVAL;
 		}
 	}
 	ch->ch_id = channel_idx;
 	ch->linked = true;
 
-unlock:
-	mutex_unlock(&probe_disc_mt);
-	return ret;
+	return 0;
 }
 
 static int comp_disconnect_channel(struct most_interface *iface,
@@ -354,23 +344,18 @@ static int comp_disconnect_channel(struct most_interface *iface,
 	struct net_dev_context *nd;
 	struct net_dev_channel *ch;
 	unsigned long flags;
-	int ret = 0;
 
-	mutex_lock(&probe_disc_mt);
+	guard(mutex)(&probe_disc_mt);
 	nd = get_net_dev(iface);
-	if (!nd) {
-		ret = -EINVAL;
-		goto unlock;
-	}
+	if (!nd)
+		return -EINVAL;
 
-	if (nd->rx.linked && channel_idx == nd->rx.ch_id) {
+	if (nd->rx.linked && channel_idx == nd->rx.ch_id)
 		ch = &nd->rx;
-	} else if (nd->tx.linked && channel_idx == nd->tx.ch_id) {
+	else if (nd->tx.linked && channel_idx == nd->tx.ch_id)
 		ch = &nd->tx;
-	} else {
-		ret = -EINVAL;
-		goto unlock;
-	}
+	else
+		return -EINVAL;
 
 	if (nd->rx.linked && nd->tx.linked) {
 		spin_lock_irqsave(&list_lock, flags);
@@ -390,9 +375,7 @@ static int comp_disconnect_channel(struct most_interface *iface,
 		free_netdev(nd->dev);
 	}
 
-unlock:
-	mutex_unlock(&probe_disc_mt);
-	return ret;
+	return 0;
 }
 
 static int comp_resume_tx_channel(struct most_interface *iface,
-- 
2.53.0

