Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2344C83CA9
	for <linux-staging@lists.linux.dev>; Thu,  7 Mar 2024 09:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709804949; cv=none; b=q3rnIDsjPSlv9Km2mdKf89w29zMCCK/3Dy8gYTmOaJlD7BJ12gepmPPurZ1mdo5qnGtTU4A+K/gzV5Lx+8apKEMk466P5GT0scL5B+7mmd+ZLP8W6dm3pSSlQ0jm7pr3g9z2AdAPBozHwWGYYceUIR4N33/wjjtYO3q7PPaYZL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709804949; c=relaxed/simple;
	bh=SyIKGM+zUIq7nerMQHVnFWFlfZ+9n7AIdySMeqsy7GA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k7sX1rFJIaaACEgiuBYjj6psbynw4tUMCn0987I1Q6+WDRMOz7tHp9a0ydJraeR8j0thtObfCbnRE+95emGhnuA4aVzaTRASubAODuxLZYwnJISJTG44BqMkKd1zgJLQsw/zgYWoBXCgaIe+h0yehlbkm6LyiseTlWPb+8qNzlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=INtyUO5h; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="INtyUO5h"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4130ff11782so3416995e9.2
        for <linux-staging@lists.linux.dev>; Thu, 07 Mar 2024 01:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709804944; x=1710409744; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E9yoQN2LCSmxbmuEOLxqt9Q4MdSkQpGeWBb6PU8m5tU=;
        b=INtyUO5hZs+nlWOO4wl7v+MzHXUmseX2Eh3gy1R7yaAOlDkj1PqEJBfnUeAyvwZiFz
         zdUXdcxv9P/p1fszX6te65HkjYh2F5KMz3N6IR4Mt5ouv/JUYhgmV+ENjfIraYehBeaY
         jmX6KmWBqFg5TvOQCAdJ9uK6K07lkxLCg6TCzSpjiMZZozgex/nBCWTug9+a3x4eOndZ
         7/riuNJt6ogqRGjt+GkO+zwq+y/7d5BOaBIiPDzKgE2P131ciZ7UYOS9DabeqsIrv1lp
         j6KR8iUFbw22Sm56moxajNnY0XIkBboz8mn3mrfMY2H5Tl35oW+EUhsZFUsZ3mOc1Gjw
         Mbyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709804944; x=1710409744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E9yoQN2LCSmxbmuEOLxqt9Q4MdSkQpGeWBb6PU8m5tU=;
        b=xQTxVY4AvjWRkfiMHdjvWhCUSWxQl2MVNuS5wNvUii5iLOAjsD1cUbkr3w2eJ6Q8MC
         iwhVRFENmf/EjRY2ZqtRgJyw37BtafKinNo1s8R+Zgir4uFYfHkMyjXfinmg+i/qJnFl
         R1pXdkrvKug1skyk4zZpx+OnNjYtHbcaZ/61kZpuXwa6O6XEvts0p0P4jFo9i7hROQDe
         ZwLlXHGIPudEhwWC4rYH4BBHsbdVeMcDe1xqyzYiPVNvEIRsws8XpeRubotQ9fEsyq4h
         VsW3eUd/qgZM3FboMKNupZ5QhuDPhoRMWi+zsyMb+fN47azrkTOGNxKDHb38C62XmFP0
         Zxdg==
X-Forwarded-Encrypted: i=1; AJvYcCU8ndf4CwaMW85QT0GrQt/uUIGu2oTh73X64pVARW7Y/gdkU6vSz6qFeBSN4sJFIeEFJmmIi2wslvBL65fbXiIRI6h8py4GaWSmYp61Ug==
X-Gm-Message-State: AOJu0YymXlacLS3vDrNsj+r3+SnRR5MDG3wXTU8zERM8RvlKjnhJIWoq
	gX9vLQjx1FZ6vUJz/qX3rL5+GeG4pZwwi8txmoXetNkxNo8K8DnmNCDraRs4K2E=
X-Google-Smtp-Source: AGHT+IFnrmvAtB1ezZQvIcRm6PjS8kaHV8XeFh+b2E1byy8yJYxsb94o7ecvzoWhs+Be2fccPiNCiA==
X-Received: by 2002:a05:600c:3550:b0:412:a141:c01e with SMTP id i16-20020a05600c355000b00412a141c01emr13027365wmq.0.1709804944163;
        Thu, 07 Mar 2024 01:49:04 -0800 (PST)
Received: from arch-thunder.local (a109-49-32-45.cpe.netcabo.pt. [109.49.32.45])
        by smtp.gmail.com with ESMTPSA id hn37-20020a05600ca3a500b00412f478a90bsm2017137wmb.48.2024.03.07.01.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 01:49:03 -0800 (PST)
From: Rui Miguel Silva <rui.silva@linaro.org>
X-Google-Original-From: Rui Miguel Silva <rmfrfs@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org
Cc: Mikhail Lobanov <m.lobanov@rosalinux.ru>,
	linux-staging@lists.linux.dev,
	Alex Elder <elder@ieee.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH] greybus: lights: check return of get_channel_from_mode
Date: Thu,  7 Mar 2024 09:48:13 +0000
Message-ID: <20240307094838.688281-1-rmfrfs@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If channel for the given node is not found we return null from
get_channel_from_mode. Make sure we validate the return pointer
before using it in two of the missing places.

This was originally reported in [0]:
Found by Linux Verification Center (linuxtesting.org) with SVACE.

[0] https://lore.kernel.org/all/20240301190425.120605-1-m.lobanov@rosalinux.ru

Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
Reported-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
Suggested-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
Suggested-by: Alex Elder <elder@ieee.org>
Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/greybus/light.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index c6bd86a5335a..6f10b9e2c053 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -147,6 +147,9 @@ static int __gb_lights_flash_brightness_set(struct gb_channel *channel)
 		channel = get_channel_from_mode(channel->light,
 						GB_CHANNEL_MODE_TORCH);
 
+	if (!channel)
+		return -EINVAL;
+
 	/* For not flash we need to convert brightness to intensity */
 	intensity = channel->intensity_uA.min +
 			(channel->intensity_uA.step * channel->led->brightness);
@@ -549,7 +552,8 @@ static int gb_lights_light_v4l2_register(struct gb_light *light)
 	}
 
 	channel_flash = get_channel_from_mode(light, GB_CHANNEL_MODE_FLASH);
-	WARN_ON(!channel_flash);
+	if (WARN_ON(!channel_flash))
+		return -EINVAL;
 
 	fled = &channel_flash->fled;
 
-- 
2.44.0

