Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB2713D51E
	for <linux-staging@lists.linux.dev>; Sat,  7 Feb 2026 02:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770431716; cv=none; b=sNUSc279HpNN3EgY68Szk4BrFGRnrxo8aLgCu63QfoKMmrncmUfnjkeRflQqba0dF5Ppqf7O0vEzXHHDYoKQCP1c+82nzkegYOoN6BFPI1wzFLy17KodcXSjjyKBJWeKca1NHCHuO7NPCjo+wsE+h6EFVjJwIxhF0aK4lPhSAsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770431716; c=relaxed/simple;
	bh=ppnlubqyDmjaMt7hma1N4XCwciKrKv551fYstqTWoho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gJqOcQfaaM0oP7yFzr3bmObMo87Pr8zRKMHI8Obxabmu6BHh3+V93U4nIzxP7GFY04sf8HjNqpLApQb8OhAHXLiOk0xNr41JtOgb0WrH537uLDdOm/CQIzHM8ORGHt488/MtV75/Yd7niE1EWxR9+0eGW2Xuti0oKQmsHYtA9Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lzfBWzRQ; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lzfBWzRQ"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so14183235e9.3
        for <linux-staging@lists.linux.dev>; Fri, 06 Feb 2026 18:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770431715; x=1771036515; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wOpt3htMY2iz8H2GNKpJZWV8g8hBj7+/EaR4EFNUVj8=;
        b=lzfBWzRQ1RsBFS03EWpgHwNtT4f1rDPeXaom9UnxOwWjFJ17Bji+M4iFw5U+MLcmYK
         56dmtNkyigqSq8H5Cnw+B/H6KlPg+SbeRDX9qtOfAgvQMtCg4DnJ/0lMA2PWZqDFiiIs
         BcV18mEA9tBjdGxp5Ab+79RhLtA2LRB7HuIyspf8T8TaTjx6qvW1Ct8aE9tUy8XIDDnn
         XogHDRa0rtOJpPOB6ILfBCzLB787+qGitTUfaIJVK1fb+0bYA/+RYtPY2zdN8gpv+vtO
         zF7x/1QTLkPQuI/cGBseHCFH2jg/fdV7v/dQrrPHyqm5f+FzT38hJqFyD8A/DgJcpMC1
         lejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770431715; x=1771036515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wOpt3htMY2iz8H2GNKpJZWV8g8hBj7+/EaR4EFNUVj8=;
        b=s7QUAyNxkVV+5chFkzODXWKQ3yhKCJ5L0rNBaeDH9G7BdPhdt6Y12dlbxrg/nrb8TW
         /uWIZ7b+8FromKsYcgMjalgE19/cn13C4xFZzGIg05jsuSPoi8ern5bZEoww/xsPMwYJ
         YAMVmEk2/E+qyAarDVvEnoODgPbQD6PVyL/4pf/WarIka98TjcUPi/iTjKCxNW6qBC1h
         tlK5rS3SeRfBYTMIG65ZoxF4IPJUzgwTqySCPgWOigTG+y6bglpWFi3eG3R5lxEUtuHx
         6oaUZjBGp0hrPV92zsF5eHBG6SLz8aXXAhDAqgJUB8h4rick9QtxUNCJ/mZraKYg1aQv
         QLOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCbQw4sKtHqQUiJDwY69Qmk1okeMqi+UVDUkS6FL7h0udpsNgzZkphuRN9oZHmmLBiANhG8QE7586ttDih@lists.linux.dev
X-Gm-Message-State: AOJu0Yxwrz0DnTCakrprPGhv5dDR9Tihsx9FUSmAzwzCranrya73VcZj
	ysFtHAgzgG+cAFZrJhDu6X9N1DGRjElZFOtdb8eLI8yMCxBWtnu0Gu3a
X-Gm-Gg: AZuq6aIBOTB4stVNh8wFAO0Ew1vCcIr/QvjqQ6RpqJLBYV3MyAPR3Ki2gY0V8I9gtqJ
	XYxtRhvVzcoCAoP2LipLRaoer3V5sH4dPQaT3en1GFO3m72M6GURfvMk6nk7nrTq7saBc0Wesei
	gAhSS3UfM7ym4Sgnu13AUyE2QS2kHNq8GkmfCu6rKYDkrVDvWq6C5Cj5QnlDcWd60v1jxOb3BvD
	Qkr/zzR2/Ze+FDJIw52RGxTjGoLZLK7audNhT6YwZ+dvrUxQgbnJSyu0JTtlKxkSLILqkUfbTeQ
	NYgGEUBAlHaXV2aeLy3O/W27HT0L/u6qo7cN5edlmFAHsHZx4xHxiaoQidHxB7r+VBFyZhOwvgG
	UBSqVldTUX6x/upZQpGgXQJ5IXv9qs8Q6RXSaMqGTYylozOlxv5ukYlvoll6bBBOU+ANa677h6H
	ALYt4av30krRjOKVAT5FY0X9qBb3ZKludRoFkB2On+zTR9KmjgnquXj5o0
X-Received: by 2002:a05:600c:3b23:b0:45d:f81d:eae7 with SMTP id 5b1f17b1804b1-4832021cb8fmr63117945e9.28.1770431714400;
        Fri, 06 Feb 2026 18:35:14 -0800 (PST)
Received: from zeeshan-Standard-PC-Q35-ICH9-2009.. ([103.73.101.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d2bab2sm297129815e9.3.2026.02.06.18.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 18:35:14 -0800 (PST)
From: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
Subject: [PATCH v3] staging: most: dim2: convert pr_info/err/warn to dev_info/err/warn
Date: Sat,  7 Feb 2026 07:34:32 +0500
Message-ID: <20260207023433.3935-1-zeeshanahmad022019@gmail.com>
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
v3:
 - Removed "staging-next" and redundant "[PATCH]" from the subject line.
 - Shortened commit message lines to stay under 75 characters.
 - Added this changelog below the "---" as suggested by Ethan Tidmore.
 - Cleaned up temporary submission notes from the permanent commit body.
v2:
 - Rebased against the staging-next branch.
 - Fixed CC list to include relevant maintainers.

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

