Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794265277;
	b=0v9dCPDKR4yagfdgzrofFgt9/trNsFsoqKwY6VKHiD8Z9PaRlcoBD+A/ca7CJeWtkZPH
	 wo5fXToRgbZAgGgbiqfSi1uTTbOO0KLu+7KGqW6QjAIj8GXz63a5dUVzCDN189SqPYy9q
	 gmJUOrETIq18YdrdQjH9DhILTgfGojYRER7VXXg99XYtpQ13hokZQVWONUM5AMCFdoSq/
	 eLJduu9YG6BKH+f3bheNFbDd9SXs1Xffo7ZRtVuCtjeLUXJscu2aWn7j8cwiKqJoQnDgv
	 I7uVYFBGdPhX+P1d3xxT/qnYlpuXCOU4+aoufIq1Ev6Zw0RxFPbXDIKq05X5n32c/4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794265277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4ZCxpFg3sggMqB6xZf7RlXros3d1gScbU1ZLbBo7GTI=;
	b=ekRRztP8hhQZpRQgsf3KIIaTWhEl2hWj9IeGOASDnCOxa20XI5QFe3xBHsWUyacbw8T9
	 SC4h0Sx3/cR6aw8fBP8UYsoXtfc5K1m7d/Nue07aynQxvkUA64PBhWh7JA5hXN5SKsGos
	 2laYcU6DzkxkWGmqA3Y4gGhQmOeLa8+YAuXuh/G5Vz8bMq6Vp2Clp4rSaEgQ95zxtkwjb
	 UJIHUXg8ClPl8ygQs8Z0Co5V2BQXNkup9lpRXkf9IQhet6BReVPfAvaiLm2E0qQXtHpPq
	 TuFrmNsqNEhVmxwkZ1o++g4WJkrIDA19zvA1ugZkU6+/H6fBF7y9qjOIOjJR2JqD7HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jl7zZpsX;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676C0606A321
	for <linux-staging@lists.linux.dev>; Mon,  9 Nov 2026 23:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 676C0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jl7zZpsX
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so1644948a12.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Nov 2026 15:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794265276; x=1794870076; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ZCxpFg3sggMqB6xZf7RlXros3d1gScbU1ZLbBo7GTI=;
        b=Jl7zZpsXUMuQA8wI9Me1n8EbPoaN5A9HNR5CNWlUMYpXwlkuiKPKQHE8LcS8RPqeQD
         KkxkXtQt4vDexcuPm8vJYDRKF20MJ9jIEKTeqZ5/RlGUBibj1HZReXS4Q9OCUoYTqVWc
         jmmVLuzJSxCHehQMKpCh/d4KCYg9iU1jLOtJE/JA8kHJLVlvR9Hbts5njsTH/0HwFdZ6
         BLqu+IYWZMYtTgZb0EiamNBWI+WOe2SGAnDp0eqQrlOi6yb4x/+Iveq34iYXd4iEytUq
         3XvYsqJzyWfZgXX71TrpLOP3+yoe4Ht9mZkSdfuYDQ97T3Y/KwxJNOQMhRJYjgIhwrZJ
         BWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794265276; x=1794870076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ZCxpFg3sggMqB6xZf7RlXros3d1gScbU1ZLbBo7GTI=;
        b=gCxU6rXIFZTzoObvIGt0auM77ZlFwG5KSy9P66wjygHNoBHPI7NnrCOTfeVok7K0W2
         tMn3q9rVv3yitIVY+P1xUZmwtO57AUyTVCnIeNWfp+GOJcGMBi52hLyAkAwwpeN2NTko
         2qNRxfBaEYRMNwRbpc7CZ66g5utKy4zw2FjNdOpGvNXkDbzY1mBNI7sSTE83z0WE7JSZ
         tMbtiD09DFd3qaHqi2nhLPi5Pm+lrRNpViQqxBBchrsQijaCWd886tBBKUFdfs5w5dZY
         qFPf55LIRSgnoBROVqaLECWhbxuNc4Kf8ie4ez0akQxf5auCBFH5e78JPVS8G2J3Dkc+
         kAbw==
X-Forwarded-Encrypted: i=1; AL+hErEaoCSEngcWDZse6oW4BWa3XOMKMlbVpzhWzn2lUwGb8FrAP6PescyP3motW+2PtIv9v/VrogfHogGlWByf@lists.linux.dev
X-Gm-Message-State: APuU4Z+Kposz276y28EYUDVHUF2QK9dT7g+gwIt4H5pTTgGWUHmZlLsq
	97EBJg+9eBctrAqOwLKQ5l7aaD8wWWnUyeQxfRRTtTf6HNddgJq96ozI
X-Gm-Gg: AYBFou2QUp3ax7XrO4FdHhVyL7mzBEe3sS81w9EHW191geSrKR2/vcjmjeDHStNbVkV
	ku8nqELec+Stg6Dx+9nSs9SeEwCq0IGji9rZZDGfoeWXSzb/waZajT5ObwbpBa5QOYwnPtOWXwS
	/DnjaBAgnIj3m0AZ/XEKi3BSIjeAAWIA4GClM+r20nFEHtpkNNl2RiTWRF7m8Cy+twveY87BWGQ
	V0hL2mKAFYN5yiDCw9ex2yD1l3/+et6ycft6gjP9yeI1aK3jC/2d6/CeSKHMApS1YIj/pnhjB9+
	izQozPgr61yf392lbVoWKnm1o3YsHPDd3zw979EwClaDo4g7+DIDyHbVqSeIf4u/a/hX/jRq392
	TKjrMJ/tQ6+Gn3xMhl7EpNv8RiWJmH2ba3LtkrCzoHMM461KgDV5PiX9cUPWRvgIuxhmGhazYVe
	6HHudJ1BNPCWVT6jyTMIo57HaTAAEj3mMNcM3e7KjQXBGr53a+ad80m0tqk2vy6KCg8hU+BqaD8
	u7NsdGpBYfSQx+gFpa2xUGyLO2y4dU3Gl43lq0LmLAMzRz9aNxBOJwH6xcIqhYBMHUQ+7AXewwL
	LOt6yRpJ/l8YOU3XKLLrOICYuqdDMS8mOjp9RSUL9QrlL5O2DRUlzcL83fnhoSzwKyzO3NGj+zf
	xhnK3DaZDcnzfwQ==
X-Received: by 2002:a05:6402:c4ca:10b0:6b7:1c:ead7 with SMTP id 4fb4d7f45d1cf-6b7569d88d0mr547971a12.20.1794265275825;
        Mon, 09 Nov 2026 15:01:15 -0800 (PST)
Received: from fedora.tailb87685.ts.net (ip-194.15.124.140.laito.net.pl. [194.15.124.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7578beb01sm265789a12.6.2026.11.09.15.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 15:01:15 -0800 (PST)
From: Platon Miller <platon.ksenzenkokk@gmail.com>
To: gregkh@linuxfoundation.org,
	rmfrfs@gmail.com,
	johan@kernel.org,
	elder@kernel.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Platon Miller <platon.ksenzenkokk@gmail.com>
Subject: [PATCH] staging: greybus: light: Use sysfs_emit() instead of sprintf()
Date: Tue, 10 Nov 2026 00:00:59 +0100
Message-ID: <20261109230059.24572-1-platon.ksenzenkokk@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Use sysfs_emit() instead of sprintf() in sysfs show attributes
(fade_##__dir##_show and color_show). sysfs_emit() is specifically
designed for sysfs attributes, is PAGE_SIZE-aware, and avoids potential
buffer overflows.

Signed-off-by: Platon Miller <platon.ksenzenkokk@gmail.com>
---
 drivers/staging/greybus/light.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index cab02b5da..2689f9a75 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -173,7 +173,7 @@ static ssize_t fade_##__dir##_show(struct device *dev,			\
 	struct led_classdev *cdev = dev_get_drvdata(dev);		\
 	struct gb_channel *channel = get_channel_from_cdev(cdev);	\
 									\
-	return sprintf(buf, "%u\n", channel->fade_##__dir);		\
+	return sysfs_emit(buf, "%u\n", channel->fade_##__dir);		\
 }									\
 									\
 static ssize_t fade_##__dir##_store(struct device *dev,			\
@@ -220,7 +220,7 @@ static ssize_t color_show(struct device *dev, struct device_attribute *attr,
 	struct led_classdev *cdev = dev_get_drvdata(dev);
 	struct gb_channel *channel = get_channel_from_cdev(cdev);
 
-	return sprintf(buf, "0x%08x\n", channel->color);
+	return sysfs_emit(buf, "0x%08x\n", channel->color);
 }
 
 static ssize_t color_store(struct device *dev, struct device_attribute *attr,
-- 
2.56.0

