Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1914C39A061
	for <linux-staging@lists.linux.dev>; Sat,  8 Aug 2026 17:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786209228; cv=none; b=T8T/M+IOkkglZa/CD+cP4t7U3RScmZr0Pf+LY+IrsSwn9UauW+IiImcnWAuWZxrpLmKn4e3cMieSasSZ02ly5K43QV1vFjCZDPgO373qVIk8pCZ8ZbhjhmGUCHgNUehP6nOzO9l9jwbXhssiCdEKHyXPBni2Vbg0Ub85hJ2Aaf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786209228; c=relaxed/simple;
	bh=BL4aaXl8jSrSD7KD2HElXnbVIvexcjEn3VDaSsBViDU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FeVLGWnKe4xdrHeCzZWsUTRfqVqcKYEYiHlDVk2fYwzQxYe3K8nGIQq78W8ehDZNtsrKZxXYJ99R6VwDG0kFbCe1HspRFUlFMnNPRy8L57ZAWF0ymdQ561qNuuqrFRVzLsvFxE7L5qQ8a7RXTAivN3e15pomExSOG2g8a3AX9d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UgK/+a+l; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UgK/+a+l"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so8412295ad.0
        for <linux-staging@lists.linux.dev>; Sat, 08 Aug 2026 10:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786209225; x=1786814025; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x7rcP/EoxmNlfdqa20sdJaHCXqVdRdQPLgQvgF3F3BM=;
        b=UgK/+a+lRmZmswHhgInSDqG0ILk1mWhWKAB+37dJiCeji8UXkeBFrNRhrYO5IdEU88
         FImmmzM2dGyFaLeC4xsm+WtSUqV3c4l+PC6mHZ9aPD8xaLL4EhyvSuFjdhEwni1EfZgP
         mldjS+5tUmIjMbnghdSlRHZM9w3g/CwHks9aJUmvWCFcbfw3Wmtw79lam7hCZHVC3jYN
         5fU/iIHkPpAig/CMzXBwcwdborXVHBXwv21VqUpC1IRUNGmgr3XbKv+ouEWpP1XIZyq9
         OQ3xacW3zwP4gOVnGxmDPir//RBp8l51iJyLQJqj7IcGpWH3+r/CqO3g5gJ9qEMyyZ0x
         Z1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786209225; x=1786814025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x7rcP/EoxmNlfdqa20sdJaHCXqVdRdQPLgQvgF3F3BM=;
        b=YKgl+qOYaDDL9OZbDQtRCB3yeO8gnlble7BLZtHJYTtduNQi9LXhOIGsQPmfUChqEd
         DzhSpH3xIRj4/W5hRsCUoJRUtOcx3wzjXUnLE8aIrxkoMlAEo3ttOshw7OSz6FxgPXxt
         gzspJqxqR2VeE8ebRcBDiK3ufqD+Z+atpk+LQHh6alMaFmnrO64983jgICPvuqEQnQBr
         FhlVmf4Jeu/Avox0jimXkrpL6oV5hBwJiohIMMkwZWjoypz29X4C2yOemr+DPe77AIqL
         PaDCne2PSA4v6J1u8EALxySRnH2kHnNJmhBxwXqJ/U5vNnIbZm0ReKBhD60mGRinanFe
         e8/w==
X-Forwarded-Encrypted: i=1; AHgh+RpPpEYPXPf3IoYFhxLzV4mprpMfUXN47eke+WPU2wS5IeGwl/qEg0HUk5UXYV3VhhISZr0tvBhWCKe2x4vj@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4pGFlvdvrziQPRm6+AelplkTSZ8/m552lTs8+eYTrRte+Dj6F
	rJzDE6PxSBNIhr5TXmhbaKtc4E8vumOhbyfFPzOTEQtLS2eAn4qABWAx
X-Gm-Gg: AR+sD13tZog/SRY7Iyz5xA6VUeRuhhlyRyIZrzLL6WxnMeWt7OLSVBgCMl2midEIsLf
	Z68qSp/JHjp9VUl/hhdMuWTBApQYZYGFVEcA0CfGMeKkZkMCITOz/iste/QdAqU+ip21X5UW9rV
	WgXH/6gct2ieTLlAg491a4sI6JSHgXvk3OolBD+KiL5KrQN5fJ0NGpkyceO/w9AcAr0/Y4zErh/
	XuFVTrbE+NhFaMIyxGMh1os0RI7YAMOCGWxY/0asifShpRV1b3Q3aoG+wxlJwCG/7fjCdzFVqAk
	/LQ2/Gw9//PYHCglKP6cM8kI0n9Q7KcI9NeAkCL65Jt4JpPBDezlDP82eBGVrl0R0O9/JzzDygP
	OrNwu5aKrzSiKdb1Mf46bHOl0/OwZrO15PHJhEUanFDwwq2yuJQ4ERdbv2UWRIrhoeLNYULNpmi
	Y+r3q523j//9VLREK4GciYljJIM+Yn7zUwU90vKEmtcOeuV7JCALtP4h0NQMM=
X-Received: by 2002:a17:902:f68f:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2d2948d4921mr135028925ad.0.1786209224584;
        Sat, 08 Aug 2026 10:13:44 -0700 (PDT)
Received: from PC.. ([103.172.209.59])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bebde308sm21597494eec.20.2026.08.08.10.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 10:13:44 -0700 (PDT)
From: Mohit Mishra <mishraloopmohit@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mohit Mishra <mishraloopmohit@gmail.com>
Subject: [PATCH] staging: greybus: light: use sysfs_emit() instead of sprintf()
Date: Sat,  8 Aug 2026 22:43:38 +0530
Message-ID: <20260808171338.72672-1-mishraloopmohit@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

color_show() and fade_show callbacks use sprintf() to format sysfs output
into the page buffer. Convert them to sysfs_emit(), which is the preferred
helper for sysfs show() callbacks as it enforces page boundary checks.

Similar conversions have already been made elsewhere in this subsystem
(e.g. loopback.c, arche-platform.c).

Signed-off-by: Mohit Mishra <mishraloopmohit@gmail.com>
---
 drivers/staging/greybus/light.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index cab02b5da867..2689f9a7524a 100644
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
2.43.0

