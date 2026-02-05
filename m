Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CB4279DB3
	for <linux-staging@lists.linux.dev>; Thu,  5 Feb 2026 19:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770318832; cv=none; b=Xas8jRmTxHvePGc/KNsRpSQDKBkTmdtNmSnh1Nm7zj2s5dFR/PJMg2hHRhZ8CsaQjnYVGmis3xkR5tyXRyt/gGZvF/cknXUhMLgyBhL6TPcKuIUWUGbnMDseBvwRMiuaOVhrnNTLvwq3ke+Xa0Y2yvihAnExVAT1MRsu2oQnzwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770318832; c=relaxed/simple;
	bh=+6d2IL2o7eM5i7mxS8QplzrHXrpM9Gu0pdRjT0VFBKM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FWIlWmBrFeTf7ZSn9jdga/KfV+3kUzwZr7sotF+rZVdJRmTkVel4acKrorBVlu2C4UwVNuLtnmu/7CrqB+DsErSoahB9au5/7IrSlOs8x+/VTXmPN8traINsDg2mNVhQFTPU9S6bdMzKh2ofgySAJbuwQqpmM2HhZoclHDzO6Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=alu7FSVH; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="alu7FSVH"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-4359108fd24so891910f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 11:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770318830; x=1770923630; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aSmwX5jo1aHhNb1q51A/bPN0A3FfbNuaugD4NxvZhPg=;
        b=alu7FSVHYqSUfk6TrCBLEa+7s/eLB1K4/eJqTpwje61b9JdUxEHSlyecrb/vLWMNHY
         VUnsuPItFh/latt8E8fu1uWEuec2mJu211cAIG+rdF9JWcWY7GgW/gXSNJomjMVoavZg
         NrMU0d+6bTbkU31XeX8G+loD1gZ4womFbzV32bmnXRODFExLZtU8oloj+IwK0opJhlkt
         K2MpRfXL7v9Adm3vyOUu/Gg1Jdy0y3ug/cYh6Sw/QqPDE28ZNIBWYi8o5cXHZBZ5Eodi
         3lLRp2eOnzCUa/aZWU3A/FLFHVOZFd1alDgSOE1mX/zBpuJfsuXhzijPXTVXauqzXVeP
         C2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770318830; x=1770923630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSmwX5jo1aHhNb1q51A/bPN0A3FfbNuaugD4NxvZhPg=;
        b=g9uVgQzIwjLC2liOejUECjzP+R15hvoJvtc+PnP+71IxOUdOS7D6kIi6f5UcayEtgF
         nDyQOvMUMeC5jbGRe3DDJ2wgdRWmD505Cf9l1n1nIglwg5yYy7P9/KlWUnr5wdbfd/De
         Q000UDqPlrylaZVIQmC4/MHmnsppIC2r9eXhji9AT+CmnksxoLKGRj8qqjN9IiZ0aVuY
         ECKoKgMuVp8fwsuEY+J+xz0Mpon7KDKEztsOd5qA8gouvyS5udeLhWdrBPCPAKNDfdFg
         XwtHN4gxOSNVKgVJ5X3fTYf9B1qKwKFIkc0HfL6QukN9AMijJDjb36rJuBIfc8Uj8p0s
         qPJg==
X-Gm-Message-State: AOJu0Yy13f1H4Z+fRyG2Dxe32tXghKKYihF6TNVidRtE5erKHaYSb6CY
	w5rw3kCmTWRcRdpiK/aXqEHSm4rcwV9rqQHPs2H3F9ap/xb7lBI+Wqyj
X-Gm-Gg: AZuq6aL2U0C96qDKagMnjjeTSsxwstdOFF79XMkURJpEBtDabBLeFWy8l137YU2gRDA
	jqgst+nM3sTR852yHEC4XueRPzS1vxKs/CudBXdAKhtOrb5jV9K4F9Ew6IiBhGwHJOxUjrWIuXa
	wtk/+0xzey2UMEVUTPvDW6ZaP+WxqIT5udYYoEz4EEMrXpbbPUiF9uwL/nA/f1tHm/okp/pqGR0
	A7P5RayZwLSEpYqi/T0Wqqds8nW0Wt/KNHlO5IwJr4XHueRpzXVz4D4U1xmb7FaF1Q0an/9tPS5
	3u+IJ8+uLZC+le/eYLmG5D1ybgq5wHpBp8eZ19GK+LeYOrfWe9P0sWIFA1uBFR4mm6PINsR1xYM
	i09a5favVS0dus5UZv5ocXZOVKdMvVCOSQyKCVUbMkr4AV3L1Th9BhMgAuGte5GA1pv5UoNF5h6
	C3gFrKzeX3ASuc5VkJcLgdTNgeAG6hbvV/Dx7OJAKcYQPma9dfbHHYFa4bZe8whZWiyc0=
X-Received: by 2002:a05:6000:1a86:b0:431:74:cca with SMTP id ffacd0b85a97d-4362968a649mr339852f8f.44.1770318829808;
        Thu, 05 Feb 2026 11:13:49 -0800 (PST)
Received: from zeeshan-Standard-PC-Q35-ICH9-2009.. ([103.73.101.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fa41sm266057f8f.23.2026.02.05.11.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 11:13:49 -0800 (PST)
From: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
Subject: [PATCH] staging: most: dim2: convert pr_info/err/warn to dev_info/err/warn
Date: Fri,  6 Feb 2026 00:13:14 +0500
Message-ID: <20260205191315.8936-1-zeeshanahmad022019@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dim2 driver currently uses generic pr_* logging macros. Hardware
drivers should use the device-specific dev_* logging macros to provide
better context in the system logs, especially in systems with multiple
controller instances.

This patch converts all applicable logging calls in dim2.c to use the
proper device-specific APIs.

Signed-off-by: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
---
 drivers/staging/most/dim2/dim2.c | 44 ++++++++++++++++----------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index dad2abe6c0c9..e6d99d9009b5 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -244,9 +244,9 @@ static void retrieve_netinfo(struct dim2_hdm *dev, struct mbo *mbo)
 {
 	u8 *data = mbo->virt_address;
 
-	pr_info("Node Address: 0x%03x\n", (u16)data[16] << 8 | data[17]);
+	dev_info(&dev->dev, "Node Address: 0x%03x\n", (u16)data[16] << 8 | data[17]);
 	dev->link_state = data[18];
-	pr_info("NIState: %d\n", dev->link_state);
+	dev_info(&dev->dev, "NIState: %d\n", dev->link_state);
 	memcpy(dev->mac_addrs, data + 19, 6);
 	dev->deliver_netinfo++;
 	wake_up_interruptible(&dev->netinfo_waitq);
@@ -470,13 +470,13 @@ static int configure_channel(struct most_interface *most_iface, int ch_idx,
 	case MOST_CH_CONTROL:
 		new_size = dim_norm_ctrl_async_buffer_size(buf_size);
 		if (new_size == 0) {
-			pr_err("%s: too small buffer size\n", hdm_ch->name);
+			dev_err(&dev->dev, "%s: too small buffer size\n", hdm_ch->name);
 			return -EINVAL;
 		}
 		ccfg->buffer_size = new_size;
 		if (new_size != buf_size)
-			pr_warn("%s: fixed buffer size (%d -> %d)\n",
-				hdm_ch->name, buf_size, new_size);
+			dev_warn(&dev->dev, "%s: fixed buffer size (%d -> %d)\n",
+				 hdm_ch->name, buf_size, new_size);
 		spin_lock_irqsave(&dim_lock, flags);
 		hal_ret = dim_init_control(&hdm_ch->ch, is_tx, ch_addr,
 					   is_tx ? new_size * 2 : new_size);
@@ -484,13 +484,13 @@ static int configure_channel(struct most_interface *most_iface, int ch_idx,
 	case MOST_CH_ASYNC:
 		new_size = dim_norm_ctrl_async_buffer_size(buf_size);
 		if (new_size == 0) {
-			pr_err("%s: too small buffer size\n", hdm_ch->name);
+			dev_err(&dev->dev, "%s: too small buffer size\n", hdm_ch->name);
 			return -EINVAL;
 		}
 		ccfg->buffer_size = new_size;
 		if (new_size != buf_size)
-			pr_warn("%s: fixed buffer size (%d -> %d)\n",
-				hdm_ch->name, buf_size, new_size);
+			dev_warn(&dev->dev, "%s: fixed buffer size (%d -> %d)\n",
+				 hdm_ch->name, buf_size, new_size);
 		spin_lock_irqsave(&dim_lock, flags);
 		hal_ret = dim_init_async(&hdm_ch->ch, is_tx, ch_addr,
 					 is_tx ? new_size * 2 : new_size);
@@ -498,41 +498,41 @@ static int configure_channel(struct most_interface *most_iface, int ch_idx,
 	case MOST_CH_ISOC:
 		new_size = dim_norm_isoc_buffer_size(buf_size, sub_size);
 		if (new_size == 0) {
-			pr_err("%s: invalid sub-buffer size or too small buffer size\n",
-			       hdm_ch->name);
+			dev_err(&dev->dev, "%s: invalid sub-buffer size or too small buffer size\n",
+				hdm_ch->name);
 			return -EINVAL;
 		}
 		ccfg->buffer_size = new_size;
 		if (new_size != buf_size)
-			pr_warn("%s: fixed buffer size (%d -> %d)\n",
-				hdm_ch->name, buf_size, new_size);
+			dev_warn(&dev->dev, "%s: fixed buffer size (%d -> %d)\n",
+				 hdm_ch->name, buf_size, new_size);
 		spin_lock_irqsave(&dim_lock, flags);
 		hal_ret = dim_init_isoc(&hdm_ch->ch, is_tx, ch_addr, sub_size);
 		break;
 	case MOST_CH_SYNC:
 		new_size = dim_norm_sync_buffer_size(buf_size, sub_size);
 		if (new_size == 0) {
-			pr_err("%s: invalid sub-buffer size or too small buffer size\n",
-			       hdm_ch->name);
+			dev_err(&dev->dev, "%s: invalid sub-buffer size or too small buffer size\n",
+				hdm_ch->name);
 			return -EINVAL;
 		}
 		ccfg->buffer_size = new_size;
 		if (new_size != buf_size)
-			pr_warn("%s: fixed buffer size (%d -> %d)\n",
-				hdm_ch->name, buf_size, new_size);
+			dev_warn(&dev->dev, "%s: fixed buffer size (%d -> %d)\n",
+				 hdm_ch->name, buf_size, new_size);
 		spin_lock_irqsave(&dim_lock, flags);
 		hal_ret = dim_init_sync(&hdm_ch->ch, is_tx, ch_addr, sub_size);
 		break;
 	default:
-		pr_err("%s: configure failed, bad channel type: %d\n",
-		       hdm_ch->name, ccfg->data_type);
+		dev_err(&dev->dev, "%s: configure failed, bad channel type: %d\n",
+			hdm_ch->name, ccfg->data_type);
 		return -EINVAL;
 	}
 
 	if (hal_ret != DIM_NO_ERROR) {
 		spin_unlock_irqrestore(&dim_lock, flags);
-		pr_err("%s: configure failed (%d), type: %d, is_tx: %d\n",
-		       hdm_ch->name, hal_ret, ccfg->data_type, (int)is_tx);
+		dev_err(&dev->dev, "%s: configure failed (%d), type: %d, is_tx: %d\n",
+			hdm_ch->name, hal_ret, ccfg->data_type, (int)is_tx);
 		return -ENODEV;
 	}
 
@@ -606,7 +606,7 @@ static void request_netinfo(struct most_interface *most_iface, int ch_idx,
 		return;
 
 	if (dev->atx_idx < 0) {
-		pr_err("Async Tx Not initialized\n");
+		dev_err(&dev->dev, "Async Tx Not initialized\n");
 		return;
 	}
 
@@ -655,7 +655,7 @@ static int poison_channel(struct most_interface *most_iface, int ch_idx)
 		dev->atx_idx = -1;
 	spin_unlock_irqrestore(&dim_lock, flags);
 	if (hal_ret != DIM_NO_ERROR) {
-		pr_err("HAL Failed to close channel %s\n", hdm_ch->name);
+		dev_err(&dev->dev, "HAL Failed to close channel %s\n", hdm_ch->name);
 		ret = -EFAULT;
 	}
 
-- 
2.43.0

