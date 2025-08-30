Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54A22D5C73
	for <linux-staging@lists.linux.dev>; Sat, 30 Aug 2025 17:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756575564; cv=none; b=uFcGDxilXZm5T9lWjzjwMDe9E4Hd66qfq2fMZDRnPxBCUiu24UX92RAnThyTZ2rlUYBEWLHxASK/g9iEM38gh+3dpjpkK7R6mb13R4uGuTa6M5fJr3cST9PrrqkP+u3TenNNNJDUssLOUXpRX1LTAsF62RxqjeoXzzGUdv7nWLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756575564; c=relaxed/simple;
	bh=bRv34QZeUsGRMmbO/KM3BzFgbgNXwP5WC/xesqcskJ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M761ig2Tv1YImNTQvseauxN/+619GpxLuYzQg+zkuHkYvRFEf7QYtbTGQxyWixpDIeWmdLNy6MiGex2tH9yUIvwUtJ8Qw384TelJmqIhMVvAGs/9HtxTcdOXQQOd23AFrLmHJnWgBEK8f9jk5QcFysMpQpaMSZQoDpJcfNa8TKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aTy4A212; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aTy4A212"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2489359cc48so6816655ad.2
        for <linux-staging@lists.linux.dev>; Sat, 30 Aug 2025 10:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756575562; x=1757180362; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETXuVNXIq9MNAcEeVRd5xBs+jfDzG9umQE4H0ixj1/4=;
        b=aTy4A212xoQohnco1efge6rmsXZ+vRQZKgWEgZ3Po3DC17OyaDp38hhcy5L7roKRwK
         dYJYbZNEgILeZfhnIWHGiOVG1ULQz/tOprKf4aj4qdJXjuDNIA+jlfLCyo1UsvQuCb+6
         J2gvDyc++tPnHq15uvZvtEBL13jzQkB5YjyxpHLJdD5jNkfWUgXrKNNXBojja27ht00n
         4mFlkpu/CNckqbRZePsqNuRv+mwFPOndPqZcda2b1Msp0jBi3Sx6W1sddK7ruIw+N+tL
         7/YE/hLWGt+nSkW1P3UzHisnto3tpqb3Vmnv/ESsfEhsqLaCTi+AYJ1fo32bD0qB3Ciw
         PiGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756575562; x=1757180362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ETXuVNXIq9MNAcEeVRd5xBs+jfDzG9umQE4H0ixj1/4=;
        b=MdpnjPfJ1/XU52puqLv2WxRZWCeUlCctTV+Bp74A2pr6qEYJ5iuY1QF73I2KrPO+lZ
         gdJKBq4PWb6t/uUcwPJLAYTxX/xGvIyWDEy+FdYrGukTK7eyDqGRpJV3G8xenM7z0zAH
         jzCExtxsRnRGeZXP3ORWEm2aaLniZn+go9tJXNAdmG7T5vZGtqhMvuc01JumlW5ovzoN
         Ac/THlbQY9yhPDv+rZQUqQ7b+yEg7e1SWov6NVzEqLG94mksE/EmyzvOaIAX9FpD6q4g
         GoD9mUNZKoFkOWJdldqyiXTZ2Hh4ORY4/d3RIWFXhlVHAm+yM6OdjrPLZ0V2q6gKJPNw
         +Ypw==
X-Forwarded-Encrypted: i=1; AJvYcCUSwXZpTA8adFM2PLJd2hITDAJKLsyvu6xCi4JJ6+4e/Sfvf/r75J5B1g3ghUbdE7O/274+DuAIRocNvNP3@lists.linux.dev
X-Gm-Message-State: AOJu0Yxa45udEv3WN1i2EbxQmSZ+R2L2kp7ERnx5CeKSppuzt6dtB+nP
	HWlhcY1DAxzDOXqBMDnS7xF+RR3jn/uj/bhQc8r6b+GihD8c84QFPxJg
X-Gm-Gg: ASbGncvI5NtVvKNmM3grg5+u+Vq2RT6S7EvUvCIQaklbXSdvn4RI0ypgg+WDHRzhIZ1
	MXTnaWLscfZh2kRJ7z2UUHG01tqBnxiC2VqS61siVI6EZhb58LKF0A5q+gDbRY2ESLkz31fXZsT
	EizADZHRNVLIRIlpZ2JFf7s9eyNJjlOOOyWdc3ubdHjdmEbfGjNocvGP1btTOxyn7a5BtdlmRXZ
	mZdfkFeSACPRz2mGO4lBlTkTbVNZcjssLZBTWbpNbnGlms+c1G9PXxSGdYlIvxnJ4X6IxCq8gea
	6HlKdT04LkAklbhwFdwzk2uivSJHDTBFgWQtOTf4q205d4d/qP3mHVKLeIWfnp0mmkR8xxJt0NC
	y81EnV+jG6ps0gBzR5ZUIUHJe3TSEq4L4W32UO/DdPQ==
X-Google-Smtp-Source: AGHT+IEQMlEuh9ApetxKqLHAyWAj6WwoICnokFpZDwrZ4Vzc5kyx9IzKhufzz6cMaGBpmsh6eXQcbw==
X-Received: by 2002:a05:6a20:12c6:b0:240:6243:b9ac with SMTP id adf61e73a8af0-243c8160dcfmr4346700637.0.1756575562072;
        Sat, 30 Aug 2025 10:39:22 -0700 (PDT)
Received: from raspberrypi.flets-east.jp ([2400:4050:d860:9700:eabe:57a8:cf74:875e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd28ad39csm5154525a12.27.2025.08.30.10.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 10:39:21 -0700 (PDT)
From: Masaharu Noguchi <nogunix@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	dave.stevenson@raspberrypi.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil@kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Masaharu Noguchi <nogunix@gmail.com>
Subject: [PATCH 2/2] staging: vc04_services: bcm2835-camera: avoid -Wformat-truncation
Date: Sun, 31 Aug 2025 02:38:50 +0900
Message-Id: <20250830173850.323897-3-nogunix@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250830173850.323897-1-nogunix@gmail.com>
References: <20250830173850.323897-1-nogunix@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

    - Fix -Wformat-truncation in vidioc_querycap() when composing bus_info.
    - Use scnprintf() for the prefix and strscpy() for the remainder.

Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
---
 .../staging/vc04_services/bcm2835-camera/bcm2835-camera.c    | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index fa7ea4ca4c36..c2788659af12 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -874,13 +874,14 @@ static int vidioc_querycap(struct file *file, void *priv,
 	struct bcm2835_mmal_dev *dev = video_drvdata(file);
 	u32 major;
 	u32 minor;
+	int n;
 
 	vchiq_mmal_version(dev->instance, &major, &minor);
 
 	strscpy(cap->driver, "bcm2835 mmal", sizeof(cap->driver));
 	snprintf((char *)cap->card, sizeof(cap->card), "mmal service %d.%d", major, minor);
-
-	snprintf((char *)cap->bus_info, sizeof(cap->bus_info), "platform:%s", dev->v4l2_dev.name);
+	n = scnprintf((char *)cap->bus_info, sizeof(cap->bus_info), "platform:");
+	strscpy((char *)cap->bus_info + n, dev->v4l2_dev.name, sizeof(cap->bus_info) - n);
 	return 0;
 }
 
-- 
2.39.5

