Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0670425CF4
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 18:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770229884; cv=none; b=clietx4tribDITQv3pV3Kw88Ppfd7bglLIuVF8u0Oz7ZXwqg+SC+oC+5ynNLD5Dler9TcSClc8UVTsd/NWJIHXsJ1Zkf/KtUqlcl/tWz9ydWg8SpvDaYFJj5vBoU44S+VvZm6HC7S1Xe8MLc/TYmCx+MqN/I/67uejEp3Z75Dho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770229884; c=relaxed/simple;
	bh=ra8DPuKOfNSD/vi+y92NjbdOPEDPwFgnDaIse7a3rU0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c5DouI18x3u2hk6Ylk1IC9rF9nSrpqpVL4UlJrKjQME0TQvD68r89vcWWk2FMD0vKAJq51jQePWXrSvfUAd/au/jQWNTXJCCxxd6psuhLhtdu7tQQgO44ICAbz7Zk181Utb8CYFtZ5Ltc9phUTn/d3uLbkM1H94xGmqGqVqTBWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFSR8wNe; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFSR8wNe"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso5438a12.3
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 10:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770229883; x=1770834683; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0HZzBfrwkMBEPlZbMZ1LEVwggfU84xN1x/wOQpuSV+8=;
        b=jFSR8wNeggidSe5uPuwv63CsUhVGw3wo49+3IIvDKOHIUsIwVA3f70/QlLUatDrS6B
         ivCTrmETRRYLGAE/358jLfhrJKVyH/GDueM02ZWxMfMaCaCXutH6FB7JRHPge6vdSb4m
         nztUO55uzFH9V11dfMH1fVRY6ikydAw0wdzUw4sBfeqG77S/vJ9xIaUwakm5+TCXrouE
         xWO/OHw//C7rhVMN+Vak0zYT5ZlYigjF8p3nmXY/S9I5Cl2WXGoHtBPOFoi/fvc4DiM7
         nM48T6kh+RPUfqFPtBTDa10MCkRv4lJvK/3SZLAiJXU8d8yD2vGO2p5vOXWw5f1QeB9s
         7CMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770229883; x=1770834683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HZzBfrwkMBEPlZbMZ1LEVwggfU84xN1x/wOQpuSV+8=;
        b=H7uYb1dt6IiPYfx2c7AVqWY7iesKrG7uWXD6r3YaJ1CXhT6PJX3H3GnUN6d5LCO7Ll
         6LxB4/OKfrcVY2kTjoAlYnJjdIdUwxguJcda8x2odDNNP5WqAcB1oXrwDxiUFtiC0Y9P
         eFAwYtAYToYei5XaJywWvMF8ySxsWt13kT8bb97CGJKHt6/SHqwqqTKfHIQDNLas9PVk
         sDLSh+aR/xeU8zS3w7qnA+4sG1dPeB/+HFs8X+HbNFKETzoybKC08qORhUlvqY4mbN40
         6kq42V6FDTawVV4nwtzFx0QyT+Denk7/wW4L9uztHvsV3Gzs2vElMzHOGRQjuHEBtxQK
         /TBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwHTajX8A+3UNnGGUo2w8xlbhsuPac6Up/WO2vyAyNZlfwPSf2GBgZVLLQ+HBJ8hUIqSmcAGA3T4LPuyuT@lists.linux.dev
X-Gm-Message-State: AOJu0YyfYdcI5MqvpmgGZaoUAs8+TYoWuHZHgejkaRm+q3t3p19V5zcV
	Vc3+rXzKnAjwW77am0LnOaRnyLE0oftv+LVz4mW85vIkPfwwf1F5l+Ed
X-Gm-Gg: AZuq6aKj8zIkcmSpSk0JkEngqUOIWuMlHu7Ky1tvGuadTtIOn2PuFd8iPJVmMe99s0f
	UVfPhte/h5sePD+nBhKPMKgDBy1But1NzZmBgSl/1SfnFjMaghqmu6uy7zKEBZOcR6La5BXOV66
	fjgUjGX/VYnr9YdSSIeU8749jSzqsPe5kxYrdBz5V+E+e6SqFNDmXd6tnch1HK3SQFlab61ivAN
	BXLEVg5087jm6zkMnXNxEG2kMK+7f0VmsOveHMpkmlEB6kh7MYAABFsiuCW71lBUJbPN0qv6V3I
	0eU5v1YEp/FEuRUQQcmlO8bJvUukr5/iIxGb/e17G2nGmWpcKLdTyQpAM+Vwv7HZ0lX1r5akfhG
	OuW2ftbynN2S35XG9Py+9Vg0/rKUJR/1Y0mZ3YpfOWmlV9qfL7OFZFNsM7V1sozswSPmXgPW0NE
	UjAAlmXK03Jf8d18T/KPCa6H9A1JmY
X-Received: by 2002:a17:90b:5606:b0:32e:4924:6902 with SMTP id 98e67ed59e1d1-354870aa792mr3814373a91.3.1770229883208;
        Wed, 04 Feb 2026 10:31:23 -0800 (PST)
Received: from DESKTOP-7ISABPS.localdomain ([223.233.85.111])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35487143207sm1725230a91.0.2026.02.04.10.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 10:31:22 -0800 (PST)
From: Rachit Dhar <rchtdhr@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rachit Dhar <rchtdhr@gmail.com>
Subject: [PATCH v3 3/4] staging: greybus: resolved checkpatch checks for raw.c
Date: Wed,  4 Feb 2026 18:31:13 +0000
Message-ID: <20260204183113.182766-1-rchtdhr@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added comment to mutex declaration, to resolve checkpatch.pl check.

Signed-off-by: Rachit Dhar <rchtdhr@gmail.com>
---
 drivers/staging/greybus/raw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
index 71de6776739c..4f217f20f1c0 100644
--- a/drivers/staging/greybus/raw.c
+++ b/drivers/staging/greybus/raw.c
@@ -20,7 +20,7 @@ struct gb_raw {
 
 	struct list_head list;
 	int list_data;
-	struct mutex list_lock;
+	struct mutex list_lock; /* protects gb_raw->list and gb_raw->list_data */
 	dev_t dev;
 	struct cdev cdev;
 	struct device *device;
-- 
2.43.0

