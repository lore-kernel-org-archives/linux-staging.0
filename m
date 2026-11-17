Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935209;
	b=VS/8ChM3PMq0F3UJyHYKHVUZlAGP/XTwdZSNr5V38TrycR3FjbT6+TuoygOkRoK+GTZb
	 fv1T5LaaFjY5vynzjNalqHBl35aO6Sc9fIzGHTkSfu0RWCQxyhopn7jDN/S/pFx2nUsEA
	 uHrmVY9P84q7MdRHK120Pn0BqRgIr60z9H9MSWEm5IJKY8uNKRbUwLJg1uYiFy8orr57K
	 G+9HNrbe6VTiBRMr9W7sPTvXIN+Wr1BqnI6E2g9Ru75gjk75cFb0aP4f9iqTVr43vynoi
	 C8OD9xfYiK4SxPFoz3XQ1Y3COKk/MxM/bu7nLQTY5yRTJ++ogVTcCP8RPPOjiSa4TDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935209;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=3ME3t5U6QQS8bFqFY2d4WF1ZByoJFwpBVCnuAtXv7MY=;
	b=g6GMustCwpmjBbqyrTK979uD1AR+575iH3bZLyO9UPvA+NzpV5RqrQGR/6bV0msS987Z
	 fkXnoykGtH+aF4O1awTEvuGA2H8zH9GubRm9xiNlnG6Ksi2f1yyG++twHhhKN3uB6g5lk
	 wqmgm1mYpAOuZJbu04LB42pYWPgquKb9lmXRtm1wqOHlopvF5YEPxUrpyt4WK4HhqUMxQ
	 aWFTZeLOGUZ85fIEX7JelpIhbhEXqlmx7QOLo+vYFx4h+OFgvc6tUrbarO97nZxmI8T2m
	 5XYDMBO/rGEpCI+jLFXNRTKT/w/GkD8CYQrO6F3v2je9PlVHVMTeJByjTGBB376R7HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eilkXCnj;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAC3606A32C
	for <linux-staging@lists.linux.dev>; Tue, 17 Nov 2026 17:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AAC3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eilkXCnj
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so62460c88.0
        for <linux-staging@lists.linux.dev>; Tue, 17 Nov 2026 09:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794935208; x=1795540008; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ME3t5U6QQS8bFqFY2d4WF1ZByoJFwpBVCnuAtXv7MY=;
        b=eilkXCnjhM7EPJIfGvaaFX0ybvPTpqrYwiQzm7jcyi7zngbI15wJGQuifq0t5k/92y
         cs01Q1n9qa9/SwfHGNNGKClRMicC655oGYVwg7hoaE3/W6UG6oi4SeUdIt9YGhRszeg8
         +ukpYd/02B71fADy+mkBotk7mLHFKMSi7MKq9UhA2Q5GsqrB03PylK0ef0zq4iT5JoaM
         ac463SEyasWmZ0+uB2LqPUj2uuE/l7z16bzoKh6AVZxhhqxX9kN2IM1LVJbtezE5G9ZY
         Tg83YoK+UAnD8mfWU5+FTCFK0BxkwmKqP7IlhMbD7hFZcYflVYOvThs6M/3EZOhmcDpo
         R84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935208; x=1795540008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ME3t5U6QQS8bFqFY2d4WF1ZByoJFwpBVCnuAtXv7MY=;
        b=wHDUUljBU0t7CE0h14PYauglPyUnA3HkOWhUIY8shF/RKcxx82JeoaDPgxg2PY91bj
         m8D13JuVT91SPLa8vK9bmswPH2luCJbADPhve28nKO5fDFkTUdcTPT1+mtC0BmiivSq3
         45/nSbtFkEX/Sc7ogCje+xx5qF0iqwcVtxRVy/vzoOQiWv0p04EcV9a12DmhL+5Vy7/T
         +vr4aGdF2GGuPfUxPwRMG8A41oFCcAos2YxDsCTCwzgVlLBw477ls1RNzj6xr6MzH7Jj
         yAWCMnDuJsRwPzQGq8nVEexqiLwe1H+YR3Q4AZpk7vVMWNQVyv1ennjpbD87ScuINPa8
         e4sg==
X-Gm-Message-State: APuU4Z/RucvvZmdmbknZbTWOGyuWKSrnyd+ZmBh5SJKq4a6ru3qEO+IG
	hYWZOwHdSKWvaEqYlLWxbuRohG5ykkkwXFyB/68vScA3ENp6jjqPr8CC
X-Gm-Gg: AYBFou1ih5KVCSYUyYh9lSeoexOYHFpVsHdu6DRIw9iqt3rhhBrDAsR3ppDA1xelJbH
	jEBM3nlHD0W0zwX4OtX0gtCi1+bJbrkJcvCWlC47mrQj99qrKxeY7rL8x1nkEZY9TOBmFGhf4iP
	Tt13qRq8/JNNfHe2txykK0r+o3NsZ02ZbO+Xyiia53zSl+cUDko/HhNx9PJFLGl5xsSw3eZMDzS
	nQG3xMj3tUQySpEiZ/OYW375Lqkpql8gYujxDwMjKlYI2ajYC795l54uPi0eRujQT0nLa7643Se
	c2yrpYZvoeNl0X+AdfTkdSe7EPc0YMq/wm2Hiir9svSmBazE249qCxnTpgoiwb3Dm6OWcDKOaO6
	hbaNC9tDFu20vhSLGYuwfRAIw7b6sYCv5JDc1IAQW3h3Vnt6EaBD0JE1ixPFv36ZIp6tzta9Ezk
	rr8UwPTuAVLczQiVqJBnKafmecV8fZAYwyqvDqHLRtauVXm0VBIQIQ7xWsMqYkHAvW8wL/GT8Pz
	CqVqoJ8XaoK9ldQ+FtLNv5L4WjMgS0D5mqyGbD10/SdJgVD7hsVWEu4wr0dmaKyqWFOBD23nyFN
	GWCWOflwmo8+fmtmMQd6+d3nexux3BNBUMXUNfjYwZjD2Rc6pFEi8y4kVe5FIvNwdz9Sqda2BpO
	1T2Je75ZxOBER9k86hPqanpRI2d4pzvC9GIRoHaXcDQKS3g==
X-Received: by 2002:a05:701b:42c5:20b0:144:fd7c:84fe with SMTP id a92af1059eb24-1b543d48dcamr163814c88.35.1794935208052;
        Tue, 17 Nov 2026 09:06:48 -0800 (PST)
Received: from localhost.localdomain ([203.92.58.30])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319e381sm42046436c88.12.2026.11.17.09.06.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 09:06:47 -0800 (PST)
From: Shivani Patel <patelshivani2283@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Shivani Patel <patelshivani2283@gmail.com>
Subject: [PATCH v3 1/2] staging: most: video: Protect pending_mbos and mute with list_lock
Date: Tue, 17 Nov 2026 22:35:57 +0530
Message-ID: <20261117170558.33844-1-patelshivani2283@gmail.com>
X-Mailer: git-send-email 2.50.1
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

data_ready() and get_top_mbo() read mdev->pending_mbos without holding
mdev->list_lock, racing with comp_rx_data() which modifies the list
under mdev->list_lock. Also, comp_vdev_close() clears mdev->mute without
holding mdev->list_lock.

Acquire mdev->list_lock in data_ready(), get_top_mbo(), and when
clearing mdev->mute in comp_vdev_close(). Use list_first_entry_or_null()
in get_top_mbo() so comp_vdev_read() can drop the redundant data_ready()
check inside the read loop.

Signed-off-by: Shivani Patel <patelshivani2283@gmail.com>
---
v3:
 - New patch added after inspecting list_lock usage per Dan Carpenter's
   review of v2.

 drivers/staging/most/video/video.c | 34 ++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 3a0445ff6..92d5fbc9a 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -60,14 +60,27 @@ static inline struct comp_fh *to_comp_fh(struct file *filp)
 static LIST_HEAD(video_devices);
 static DEFINE_SPINLOCK(list_lock);
 
-static inline bool data_ready(struct most_video_dev *mdev)
+static bool data_ready(struct most_video_dev *mdev)
 {
-	return !list_empty(&mdev->pending_mbos);
+	unsigned long flags;
+	bool ready;
+
+	spin_lock_irqsave(&mdev->list_lock, flags);
+	ready = !list_empty(&mdev->pending_mbos);
+	spin_unlock_irqrestore(&mdev->list_lock, flags);
+
+	return ready;
 }
 
-static inline struct mbo *get_top_mbo(struct most_video_dev *mdev)
+static struct mbo *get_top_mbo(struct most_video_dev *mdev)
 {
-	return list_first_entry(&mdev->pending_mbos, struct mbo, list);
+	struct mbo *mbo;
+
+	spin_lock_irq(&mdev->list_lock);
+	mbo = list_first_entry_or_null(&mdev->pending_mbos, struct mbo, list);
+	spin_unlock_irq(&mdev->list_lock);
+
+	return mbo;
 }
 
 static int comp_vdev_open(struct file *filp)
@@ -143,7 +156,9 @@ static int comp_vdev_close(struct file *filp)
 	}
 
 	most_stop_channel(mdev->iface, mdev->ch_idx, &comp);
+	spin_lock_irq(&mdev->list_lock);
 	mdev->mute = false;
+	spin_unlock_irq(&mdev->list_lock);
 
 	v4l2_fh_del(&fh->fh, filp);
 	v4l2_fh_exit(&fh->fh);
@@ -175,10 +190,15 @@ static ssize_t comp_vdev_read(struct file *filp, char __user *buf,
 	if (!data_ready(mdev))
 		return -EAGAIN;
 
-	while (count > 0 && data_ready(mdev)) {
+	while (count > 0) {
 		struct mbo *const mbo = get_top_mbo(mdev);
-		int const rem = mbo->processed_length - fh->offs;
-		int const cnt = rem < count ? rem : count;
+		int rem, cnt;
+
+		if (!mbo)
+			break;
+
+		rem = mbo->processed_length - fh->offs;
+		cnt = rem < count ? rem : count;
 
 		if (copy_to_user(buf, mbo->virt_address + fh->offs, cnt)) {
 			v4l2_err(&mdev->v4l2_dev, "read: copy_to_user failed\n");
-- 
2.50.1 (Apple Git-155)

