Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E35A32E698
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 06:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770706444; cv=none; b=qM9OSYwM2xJZSRT2MEvt1JXDIaAZCKBCKk4VHoO32yhlAveJBPhWLKdRQAhNsWsR6DreqEFi8CnLw0qWVXXGj7FuNvV9Dc9o2VdewGeACBv14LX6o3WGyTb1gUvRUuDwcfByTJtqVYCxKkZWY/75y414W5LSpWoumsTq0ErhoGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770706444; c=relaxed/simple;
	bh=Q2VYFQgEVOU/u7R3vzhLGaCgwNXK2WJK6+Zrz42RVWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JbJTMc5xNd6ARUkrZBsFWXiolNtNK0dbhwYVR9b9Evw611m9PYWc37e7gW6pGSFYRy5ds0v7gfbtP8y6lq3jB+34y46GPf+Uz1kt3QQvTYGaztdTrBVRK8Ooi+I2yapcJaaFyiinCZarpGQxyakFIWZSHuvwEPZ2/R6dZWmOyRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJIBcpfr; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJIBcpfr"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-823c56765fdso263054b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 22:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770706441; x=1771311241; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ClrEluuRBpBNX3LtTP3TbTvXVdo/TuK3+YRH6EpwVjE=;
        b=TJIBcpfrN848iglA0udDqPyStwfL3XK9POSQogko2o8+hEJCHCzA3NfQHGVVLUUczE
         /ff9wz1vew0RL2tfymGPXGsxn88i+9MObKDzer4R95DMyGW7D3cE1IT2pQKAQo2GSxTV
         adJjedWeF8ZrkQVice+TmmAy6gSo+0IxOB2s+uIpRX/coVGEumW7As4nOPJWcj4/gxkA
         NfsZmGSHIIyXxUatwjCHY4/Tg5Va/OR/kHG5pOPx+UpQxgIgVrdTd4ZG0rTk7DskR5rD
         lz9vddc9Bkz3q1mC2QzmhCQ99JigD9/BKmzrj4GDRZJ8MP4ca696PLkJ53zfUdhubnBb
         dzmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770706441; x=1771311241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ClrEluuRBpBNX3LtTP3TbTvXVdo/TuK3+YRH6EpwVjE=;
        b=OPQl4aBPe66BQAm5D/2YzRmlvqWEwrZF05quPIx5P6H7DftnFX14/azKULwM2dKSbK
         0K8KbqIue5/Lk01s/z+3NtZcY/EQ7g1CcdjQjqrZL/9TV7FhpOaM9WnyI/1eDRd65dU9
         FDSEAAQoP3Or0DqQvX/ZrqXiQy1kWdB6zQQnr6SZFazizFkVOvN13KNl/9hR5PCjSSd0
         HazxCN8dlHdv7xNIkfy1C7HzMbW6rdRaCocVkFZF2k/VyjPcwhaafTZCGMYFLEzZqLbQ
         6iKC9FwgqDDSmw+6EuT6ZL+92zK51HErDMiL6LoiWBdPMbV6guDEb4hjMOQrDh4M/uwH
         F9WA==
X-Forwarded-Encrypted: i=1; AJvYcCWyFOtrmjB/wZHFasQJc7+syAI8VFlNhQqLFx0Wi8DormMhvilTUTYDhcyQNvNhKoKXnmHIhJ02eB0TmVwt@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3LynRFw8udksOxFGR61CEcIXvdyYnIY+zQjcXRH2D+nYjcVXI
	uHb4p7ZofmfHvKPiLM535Xr6dymcbG5j8AnExzc5x2PmuhUadvY/hub+
X-Gm-Gg: AZuq6aLzIF+MaHsd0uzO2X5taAtOL8iO4BE6iMq9Gv5z/SCMM5b1mhaXKiOhtl0P5RU
	ES8jEJPjTrsr9hWipDGhtb3VNE6Sa14iqBOQo+SsSzKZhQluyKtsCwAyp2zPNYoTuJRX90m8wKu
	PrQZMo5hMEJ/WbX5MgfMZleOjla1R0eBQUQEV6CfsTo9ZWCDWqfDvLJWBvIBbrvM9QrT+RDkUaP
	4xX0yf+Jmgrbltyl4+HWEyBzXmzVFHvBrbul64cEvG+7wFFusAPccZQiyNXg4Dvzw/8waAN0H9z
	9RDUM403W9Mo3ruanlMDM4cqHHNtGy5dRfNWQkENipBjwe8yrdU7fySVI+GMA/PPJUa9e+LRS3Z
	+hWoIGnj4WeGTay2tjbTo7n28tMQWRw3gZSwQMAZBk613owE5AXlZfluW8VgzYOUKLuT3JyY+D4
	dbI7EY2i8EEgdVr89pL36jOD4w3WsK0CbxFJxU/6oiYhKM1j9EjhEOysJWPSIWRNhK7BHTbw7W4
	e+rRYg=
X-Received: by 2002:a05:6a00:4c07:b0:81f:ac81:d597 with SMTP id d2e1a72fcca58-824413cef8bmr13476647b3a.0.1770706440767;
        Mon, 09 Feb 2026 22:54:00 -0800 (PST)
Received: from zeeshan-Standard-PC-Q35-ICH9-2009.. ([110.93.227.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824418b3b80sm12154180b3a.48.2026.02.09.22.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 22:54:00 -0800 (PST)
From: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
Subject: [PATCH v4 2/2] staging: most: dim2: convert pr_err/warn to dev_err/warn
Date: Tue, 10 Feb 2026 11:51:21 +0500
Message-ID: <20260210065121.3661-3-zeeshanahmad022019@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210065121.3661-1-zeeshanahmad022019@gmail.com>
References: <20260210065121.3661-1-zeeshanahmad022019@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dim2 driver currently uses generic pr_* logging macros for
reporting hardware errors. Modern hardware drivers should use the
device-specific dev_* logging macros.

This provides better context in the system logs by identifying the
specific hardware instance associated with the error or warning,
which is especially helpful in systems with multiple controllers.

Signed-off-by: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
---
v4:
 - Split the work into a 2-patch series as requested by Greg KH.
 - Converted non-critical informational messages to dev_dbg() to
   ensure the driver is quiet during normal operation.
 - Converted remaining error and warning messages to dev_err() and
   dev_warn() for proper device-specific logging.

v3:
 - Removed "staging-next" and redundant "[PATCH]" from the subject line.
 - Shortened commit message lines to stay under 75 characters.
 - Added this changelog below the "---" as suggested by Ethan Tidmore.
 - Cleaned up temporary submission notes from the permanent commit body.

v2:
 - Rebased against the staging-next branch.
 - Fixed CC list to include relevant maintainers.

 drivers/staging/most/dim2/dim2.c | 40 ++++++++++++++++----------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index e1b1a606f36a..e173a00336fa 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
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

