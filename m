Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7986E23C8A0
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 23:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770420922; cv=none; b=AGBrJU6ZsDm1kKQmxcvPnr6xn2R3KgxiLqbUDdcYQKCYwx2Lt5N6gcDV+wTC8cE/wDPNGE4JVSP5eBBGLcxfsh0n+S1dshxJZZtKHCvxyX1Q5QWM7s2w2Ax102Jfx0rFmpPS0mrBblS3DeKK6GGS7KXKyADTLIZkFKa2nRIhckU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770420922; c=relaxed/simple;
	bh=ioFVdvu04jyE88Bl/6Klw1xQVaUTbTejnlaXrA2zP1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N0c97zyJpXyPNva++FXNi45XQ1briFa5FDOXlVHxGmMyN4H5HRnThrSGUqrajQqCCEFV5+DXE6a7pxOvWigiGfFHKJ86sd05elu9rP4hqeqP1vWxRCr0fRTD5LVpXeOHKQWScrw0Koc97fMjghSzWi2m0yhDmd6JZL2gPowim94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m1ePAZBW; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m1ePAZBW"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so13306765e9.3
        for <linux-staging@lists.linux.dev>; Fri, 06 Feb 2026 15:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770420921; x=1771025721; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k451G6QmqVBd/yN6Z+kczBOVlmYBdf3X7amT540mWgg=;
        b=m1ePAZBWGJEpytW6eYGTOqUcxwC8fibN1KtatnokamyfwyDHJIdiHef2po+ZvJmf3G
         /bLFNeYGu65nizpUdBQ0LeDmt2IV5Oa5xiZf1SQSHjwlU6FjwIOmth7JN6mwfZX5A3yQ
         /mdEbgvYcfHo58s/0i9PTQRbR3iuec6th9pO6hm8N91Cn3tqOexJA+mRvjFiszrIF6um
         5GTjfB3HSgb9guNZMcUTiUyn7duT0errPlojuzw1x2qMRStZsxEj9nUYglFXWVBpFgac
         5D+1/gotd27oF06kVJUwNQwbg1Vkz6JqI6/yX39RP/WpBxTlqNMN167UnQ0zN+3aefsX
         HwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770420921; x=1771025721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k451G6QmqVBd/yN6Z+kczBOVlmYBdf3X7amT540mWgg=;
        b=hKbDcvTsl5c70GYMMcEbYYoyIMaIEKzHGkCVvpTbiEtFwDsPItrIihhdVzveIZWm/g
         Ir4h8tb3GxWbN+xLhrLX3ltNxLwCotB1W4zRUXGbYpmYswug7nOA6U6NFpWKKiUyUVRV
         gy92EHKzED4q0NBi+JB6rF/3+8Y84kz/b/+S4CHnYCNXoBuAlO6sYxmAzP2ydc8h18N8
         8RPP2lkxUoJfpz0464PRLjFG8VrDw8WOcQDT8tkx4y7Em62YxXOY15xJPCwtOlm5UY/Y
         QUw+LCMyNqY2kirPHa0WrxymgLbfufnKZRk/kP0Kw+tjNbA5f4f4+d9RDtDnS827ERO3
         UGLg==
X-Forwarded-Encrypted: i=1; AJvYcCVknKzrRdI9DxbFio3AOxjLm4NaLMEncZZhs8IqjUe1SFL+8iSJIzJc4L5OIA/3Q9f4VKiYQV8w3kwmsXYD@lists.linux.dev
X-Gm-Message-State: AOJu0YwLilRugcspNhWGaOXthmh4ujn86S2xk+jEzikHVhFihiXpRKQm
	JE8Ri4YStI5o4wa3DQTfQqfltO5RfTU0gXIguCqibeGk0kxav0qwkhf3
X-Gm-Gg: AZuq6aLGqC2T0XG81btpRya0fK6+1SstchOah0iGBZhQlyJXt36Nm17ZdP38zl/zj1v
	PvFjZg8mXnylrqOPDP1cgQwc4HYrfxGjAgEAoNETMpgaCLITWaMUyNW12e2PF0H71bowNIyedWb
	njkUDRJhyOL10ap010SmKN8Iy+ztN5kXj9sQgn1lREv/5UXfQXC+bi3ubqWIOVjkm4CDMLaY4R/
	BgeP3UkQ8XQ0SvrPxBPyjleP4r+6xbjW1/YMSIoHNrq2PNw0UVFZm7TxCmWQJegYP4/+hlEPfEn
	h7mrBWdJNwOod+fqKgm5rNvtYYXMTkBI0Tkc4MZH3Kk1y1eLmHEdnNRCxupx3BiMb3g0DH8OECl
	/mDfDHSAw7oPDRAoY3IJagljwVqX0vO8EmhubXWi9XW+1+5hYT6uajEbD+wkr1nLyCXhE3XUedO
	rL9BoHBeue5u+3AnFMxavIwK4FhsYjWUn7fGFcjOniH0LwzRLiO5O67KBQ
X-Received: by 2002:a05:600c:4745:b0:47e:e807:a05a with SMTP id 5b1f17b1804b1-48320226f11mr61273875e9.33.1770420920720;
        Fri, 06 Feb 2026 15:35:20 -0800 (PST)
Received: from zeeshan-Standard-PC-Q35-ICH9-2009.. ([103.73.101.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296b34d2sm9805767f8f.1.2026.02.06.15.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 15:35:20 -0800 (PST)
From: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
Subject: [PATCH] [PATCH] staging-next: most: dim2: convert pr_info/err/warn to dev_info/err/warn
Date: Sat,  7 Feb 2026 04:35:01 +0500
Message-ID: <20260206233501.5682-1-zeeshanahmad022019@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Note: This is a re-submission of a previous patch sent with an incorrect CC.
Please consider this the correct submission.

The dim2 driver currently uses generic pr_* logging macros. Hardware
drivers should use the device-specific dev_* logging macros to provide
better context in the system logs, especially in systems with multiple
controller instances.

This patch converts all applicable logging calls in dim2.c to use the
proper device-specific APIs.

Note: This patch is rebased on the current staging-next branch.
It was previously submitted against master.

Signed-off-by: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
---
 drivers/staging/most/dim2/dim2.c | 44 ++++++++++++++++----------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 80af965356d0..4bcafda481f9 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -246,9 +246,9 @@ static void retrieve_netinfo(struct dim2_hdm *dev, struct mbo *mbo)
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
@@ -472,13 +472,13 @@ static int configure_channel(struct most_interface *most_iface, int ch_idx,
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
@@ -486,13 +486,13 @@ static int configure_channel(struct most_interface *most_iface, int ch_idx,
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
@@ -500,41 +500,41 @@ static int configure_channel(struct most_interface *most_iface, int ch_idx,
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
 
@@ -608,7 +608,7 @@ static void request_netinfo(struct most_interface *most_iface, int ch_idx,
 		return;
 
 	if (dev->atx_idx < 0) {
-		pr_err("Async Tx Not initialized\n");
+		dev_err(&dev->dev, "Async Tx Not initialized\n");
 		return;
 	}
 
@@ -657,7 +657,7 @@ static int poison_channel(struct most_interface *most_iface, int ch_idx)
 		dev->atx_idx = -1;
 	spin_unlock_irqrestore(&dim_lock, flags);
 	if (hal_ret != DIM_NO_ERROR) {
-		pr_err("HAL Failed to close channel %s\n", hdm_ch->name);
+		dev_err(&dev->dev, "HAL Failed to close channel %s\n", hdm_ch->name);
 		ret = -EFAULT;
 	}
 
-- 
2.43.0

