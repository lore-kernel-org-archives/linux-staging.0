Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08DC3B4EBD
	for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 14:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779027609; cv=none; b=tDWpG1qsx3pjXbwFLWuMxDPxqRjcoMNVKB+u7TA8HJu9BD8GZdQ9B0D0XVGyPomZRUxMkG2wDMznc2lD+4fDCKkmfKQP/FbgYPwEW6xHTgJIEhFusmOf3A8wLzlW6xzCvbN3D2WAmMqo39G7puFzeHGFMrCdPX4l4dq1TZZEmD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779027609; c=relaxed/simple;
	bh=FgMuZMFbAPsvJz1TbL2odfi2bqtJjH8DMVa7sdhzyHI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nV3rSaYbTCspyPYYakbdDlu2ge//qvtnvzxUDSd8zvXzxrb+TR/ZBRcCfD65JDXDyLccFItWoR8O271n1ucycIjgwnXYBVxAY1P8mVt9KSp1U07ZvpDuHhuhQ/o87094HAly8AmFEI4+GlQrpZqC//HTK4+QxYB9RSnPl7Ov964=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n+9wdqAR; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n+9wdqAR"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7dbcb467f2bso1527619a34.3
        for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 07:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779027599; x=1779632399; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X2dHAbJHKvqoa7MzKayL3x2YgTfCv90vmXzecnGUpW4=;
        b=n+9wdqAR2ca6z9sY4G1FnkrMXaCFBzx0sgGZaLSJmL5mN4U9m9ypRLuj9QWd/FpQWT
         hEKDSS8cL6xR8Zb6vzyRsnVm7EM7ZWBjp0eSQhMpQ6bgjscJMxmxffPnvofvBEmJTOMG
         EaKhjqmZTGlhtNEsKQBlN2o3SnwIz3qDvGOqNUfCt7Oul0yBMxu3MI4DYyN6iuwHmuBA
         QF/WRBzf0zQwf4Zwu/mILzQ2Bn1litJLlvS4dCUPUXxkGad1tRDa1D7O0O0SzB9olt72
         nzCfI7HjBvX9ADRDd3dKQkHb6DFY9Em3x82+S4K49SGUbrzocCBksktOa4NJV5RNQnvg
         d56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779027599; x=1779632399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2dHAbJHKvqoa7MzKayL3x2YgTfCv90vmXzecnGUpW4=;
        b=A8AsB6X0HlNvfgi5KVG1EVQ+XCWOrYISAOJXsl1Qjm0TY883qTDssRPf16q6L+7GZp
         /0qpL1mrOz2GNX9whOKMIFzfAMfWw2kAxpISfynbuaoqSffrnuvMPd4HRm9ju4zZCz9O
         fjXjliHnMFxuwAqhL1CuSwudOBRu1e0eI3XEM5f1NhNouI7icDdunkoBVwidvy7n8pW6
         FrFzhzOZLeuW4jBZMxDtv49RkA+VdAR31bWfjyP0INm59G1vuX1p0gTzDW67VK7tr/Gb
         Y6N9wvKgqRuAR1KGm4GfIlypSa7quxJDl0jVm5L/TSKRhq1OYR7Sj8bTx4zdR2CndCOz
         186A==
X-Gm-Message-State: AOJu0YwpdsSwHINiaCkcceMtCeEmSgmGNZcNLsMXGmGdDG0111hEmls6
	F8ZygVnvHt+bxIr0Yu6IkcpbmC1DRoKdawzcuuUpjnepeOa2oyPQSrIx
X-Gm-Gg: Acq92OGWcqh1kCZAvHwpHDRRKA2BijPCfCel76PPYG6YU1VhrstWivadd7gTURiBBUi
	T5MULhTDINPVAdyZUr41hT5jxHoT20vDBRAVBwD/vgSILjCHrMyz3bwGB2TEm4HpYjwsxGjRnpZ
	TitqiezCoysGeXznStkSR5OjfKKVVxd6J3oVcY8Qq+1ZNQqjaYKjaWj1yjyQY0i33uD+DpE8fZG
	XQCnzgJJTbm9C3rdrWb+n5FrD9G+7hLNc9QPBv8AuvbX1j6CQg5AHznO/NhgMZG+8uDy+bh8HkK
	ZK8+/oSsz4cqM63idQ5k+wthNYVOFU2suTGy4N8eS1FTbao0L/baywG4wuX/2N6jwktRFPwh2KH
	4AUoevLnfIxuI8gfeYrO1GfYHFBNADNC9Dk7f8yv7unq9ZFUwZlwGcVROcq8DSYlFxBQN62aJ/u
	6i/9oe1ppfoqNmkDK9mSgLZB/v4vFCzwjbv1GKOe/H
X-Received: by 2002:a05:6820:615:b0:681:b070:3dc6 with SMTP id 006d021491bc7-69c942ad83cmr7426375eaf.10.1779027599500;
        Sun, 17 May 2026 07:19:59 -0700 (PDT)
Received: from MacMini.lan ([172.127.162.94])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69d04911744sm4153583eaf.12.2026.05.17.07.19.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 17 May 2026 07:19:59 -0700 (PDT)
From: shayderrr <darknessshayder@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pranav Bajjuri <darknessshayder@gmail.com>
Subject: [PATCH] net: octeon: fix carrier state, null guard, and modernize phy ioctl
Date: Sun, 17 May 2026 09:19:55 -0500
Message-ID: <20260517141955.79666-1-darknessshayder@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pranav Bajjuri <darknessshayder@gmail.com>

Add netif_carrier_off() to cvm_oct_common_stop(), guard
cvm_oct_adjust_link() against null phydev, replace open-coded
ioctl checks with phy_do_ioctl_running(), and zero priv->link_info
on stop alongside last_link.

Signed-off-by: Pranav Bajjuri <darknessshayder@gmail.com>
---
 drivers/staging/octeon/ethernet-mdio.c | 64 +++++++++-----------------
 1 file changed, 23 insertions(+), 41 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-mdio.c b/drivers/staging/octeon/ethernet-mdio.c
index 211423059e30..4b5cac324eff 100644
--- a/drivers/staging/octeon/ethernet-mdio.c
+++ b/drivers/staging/octeon/ethernet-mdio.c
@@ -17,6 +17,8 @@
 #include "ethernet-mdio.h"
 #include "ethernet-util.h"
 
+#define CVM_OCT_PHY_FLAGS 0
+
 static void cvm_oct_get_drvinfo(struct net_device *dev,
 				struct ethtool_drvinfo *info)
 {
@@ -36,30 +38,16 @@ static int cvm_oct_nway_reset(struct net_device *dev)
 }
 
 const struct ethtool_ops cvm_oct_ethtool_ops = {
-	.get_drvinfo = cvm_oct_get_drvinfo,
-	.nway_reset = cvm_oct_nway_reset,
-	.get_link = ethtool_op_get_link,
-	.get_link_ksettings = phy_ethtool_get_link_ksettings,
-	.set_link_ksettings = phy_ethtool_set_link_ksettings,
+	.get_drvinfo		= cvm_oct_get_drvinfo,
+	.nway_reset		= cvm_oct_nway_reset,
+	.get_link		= ethtool_op_get_link,
+	.get_link_ksettings	= phy_ethtool_get_link_ksettings,
+	.set_link_ksettings	= phy_ethtool_set_link_ksettings,
 };
 
-/**
- * cvm_oct_ioctl - IOCTL support for PHY control
- * @dev:    Device to change
- * @rq:     the request
- * @cmd:    the command
- *
- * Returns Zero on success
- */
 int cvm_oct_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
 {
-	if (!netif_running(dev))
-		return -EINVAL;
-
-	if (!dev->phydev)
-		return -EINVAL;
-
-	return phy_mii_ioctl(dev->phydev, rq, cmd);
+	return phy_do_ioctl_running(dev, rq, cmd);
 }
 
 void cvm_oct_note_carrier(struct octeon_ethernet *priv,
@@ -81,15 +69,15 @@ void cvm_oct_adjust_link(struct net_device *dev)
 	struct octeon_ethernet *priv = netdev_priv(dev);
 	union cvmx_helper_link_info link_info;
 
+	if (WARN_ON(!dev->phydev))
+		return;
+
 	link_info.u64		= 0;
 	link_info.s.link_up	= dev->phydev->link ? 1 : 0;
-	link_info.s.full_duplex = dev->phydev->duplex ? 1 : 0;
+	link_info.s.full_duplex	= dev->phydev->duplex ? 1 : 0;
 	link_info.s.speed	= dev->phydev->speed;
 	priv->link_info		= link_info.u64;
 
-	/*
-	 * The polling task need to know about link status changes.
-	 */
 	if (priv->poll)
 		priv->poll(dev);
 
@@ -100,13 +88,13 @@ void cvm_oct_adjust_link(struct net_device *dev)
 	}
 }
 
-int cvm_oct_common_stop(struct net_device *dev)
+void cvm_oct_common_stop(struct net_device *dev)
 {
 	struct octeon_ethernet *priv = netdev_priv(dev);
 	int interface = INTERFACE(priv->port);
+	int index = INDEX(priv->port);
 	union cvmx_helper_link_info link_info;
 	union cvmx_gmxx_prtx_cfg gmx_cfg;
-	int index = INDEX(priv->port);
 
 	gmx_cfg.u64 = cvmx_read_csr(CVMX_GMXX_PRTX_CFG(index, interface));
 	gmx_cfg.s.en = 0;
@@ -114,26 +102,21 @@ int cvm_oct_common_stop(struct net_device *dev)
 
 	priv->poll = NULL;
 
+	netif_carrier_off(dev);
+
 	if (dev->phydev)
 		phy_disconnect(dev->phydev);
 
 	if (priv->last_link) {
-		link_info.u64 = 0;
-		priv->last_link = 0;
+		link_info.u64	= 0;
+		priv->link_info	= 0;
+		priv->last_link	= 0;
 
 		cvmx_helper_link_set(priv->port, link_info);
 		cvm_oct_note_carrier(priv, link_info);
 	}
-	return 0;
 }
 
-/**
- * cvm_oct_phy_setup_device - setup the PHY
- *
- * @dev:    Device to setup
- *
- * Returns Zero on success, negative on failure
- */
 int cvm_oct_phy_setup_device(struct net_device *dev)
 {
 	struct octeon_ethernet *priv = netdev_priv(dev);
@@ -149,8 +132,8 @@ int cvm_oct_phy_setup_device(struct net_device *dev)
 	if (!phy_node)
 		goto no_phy;
 
-	phydev = of_phy_connect(dev, phy_node, cvm_oct_adjust_link, 0,
-				priv->phy_mode);
+	phydev = of_phy_connect(dev, phy_node, cvm_oct_adjust_link,
+				CVM_OCT_PHY_FLAGS, priv->phy_mode);
 	of_node_put(phy_node);
 
 	if (!phydev)
@@ -160,10 +143,9 @@ int cvm_oct_phy_setup_device(struct net_device *dev)
 	phy_start(phydev);
 
 	return 0;
+
 no_phy:
-	/* If there is no phy, assume a direct MAC connection and that
-	 * the link is up.
-	 */
 	netif_carrier_on(dev);
 	return 0;
 }
+
-- 
2.50.1 (Apple Git-155)

