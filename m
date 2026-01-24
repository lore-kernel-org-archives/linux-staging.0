Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CB518BC3D
	for <linux-staging@lists.linux.dev>; Sat, 24 Jan 2026 17:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769276522; cv=none; b=Eej6vk52WvNQWGVIdOn6MyTBUOsM++VLGeNGZAQKoBEurWgGrPMEh0gAsRNyaYsXY+b97Hx1KHRs3NI3N7pCAEjGKp2+T4pLq84SmifJVRdH9GAbfAsvU0vsf+5To8qWeCSZWMNU/oseFM97GQ49Kg1RNZHH9E2ssP5R7QcbVC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769276522; c=relaxed/simple;
	bh=ByboBixU215fxbeixqHKrq1887UR1GngHtSGhmu27OY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oReCDSaeNqXk7iGzleAV8cposCYvgMsQ1pFgPM5joi19fEYNwXpDbEAPnQAdUuaQom2wSuTwBoHkrAm2wKEXZ4CYUtyFmzd91UukqEHGlqK8ECI8c9g+09K2X1Wmw6b6aG8vFySQFRAjW3NaWZlC8XV3mk7QCxvIrL6JXZRugvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFCqRXZp; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFCqRXZp"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a7b47a5460so17510875ad.1
        for <linux-staging@lists.linux.dev>; Sat, 24 Jan 2026 09:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769276520; x=1769881320; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bb5n6sM2fqMcuUW4SQz6w+f0gdChJ7fTob5ZS9rYksg=;
        b=ZFCqRXZpJbVzyaallCuUAZWKBQIRr/KeedtYePPve5WagbKLz2ln4oBKUo/3O1SYWi
         4qrO35VDF4QOgzK19QVmlW7U46FbeYBy/iED02H/cmQAICdXsM5UOSdE8BPosjQWpq5Q
         I2vGvUyULKM63HH2S3OdPLiZbuV4nsvqyrcXsxFZOcQXBmXXY9MLcIJqxHI4huJCIApa
         zl8Kv0qdOryHo0JTyZUgHkANYDZPGYuAgHgw3KUebDHGleY7vSaX6KYV/cXsussBL5LF
         Sec3ZqRxFreffqEqFduGjk9et5zwGrr6BDNynuKtRHPXFjlAmindrll09MUeQgyJQRls
         GTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769276520; x=1769881320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bb5n6sM2fqMcuUW4SQz6w+f0gdChJ7fTob5ZS9rYksg=;
        b=XhgF5zB9Z3XkDnMtysmDl+HfqrcdEe41eC5RtsYI0pzzKeo6jt6PEMKOrQTMdfcbdV
         Ga92EF8KMo+BtHj7fKb16X6m3WNVu9cbZj4siw1CuOWU513vXbyZtgBtbzPjXmSEoG1n
         UVSHBJTSAKEU7QzvXP5fJ4seMEaGgylBGkSwZlkDbR7RLQNDOWMuGniEhS1gXM90vYlP
         fw8wF8E9Oe72edlyIGIyzEnxKtcgx3w7M30G0sEWfnZcZTruToAXfPjmpoWUfiqg6DFZ
         jR91GsyXTDk0yBMzxIV+G1c4GRMbNvTqFYlgDiivlPIK7APBYHAQ30wiRVu+TSlIrQWR
         9oLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaQfJSRRaI34EHooNd78BWIxD8t+HJNMpC1qas0ggEVGSbTITdVpM91AX1DBug+WoqKd23nljPElhYdS9P@lists.linux.dev
X-Gm-Message-State: AOJu0YzJLgJxIiQHPoEKNJv7wkXI+ifaRzK3WCNhDmv1Y1Yu5NZ7tcmx
	n7h3ujwwqwQgPOM1XkLTgE1RQHrkCtWtxxZ8NIBx8BUf/eHD8YFCwWy/
X-Gm-Gg: AZuq6aI0QEddPlvizILFp86pfIv9anWNwiV5P3jsDItbkoWv3IDiyvEwBYZrAUOkO3a
	bZWmyVejPRuQGxS5uMZ1SajDLRFWN7I5CAgcdORFaBgs10hOvX207G3V+uxys1yprtT6j01QQAe
	6HiL6FTESe5m9oqKwUFOBPU+ED6wqscpstedTEprO8gxk56QrQXC7/j/vxC8D8i57ddtNxtqcE7
	fl3oD/sySyrQJFmekHs+BbLIcEwHf4iv2gCir34AQ2rQR/GQiqC/BeWFYfIQPx+/HNcPs2KJLxO
	g9Z/GZasALb3UTiqkJgyjhhZWukj/4mBpGAoPQeNmGiaGNmZM5N7YHdM6vBOwGSk2Nc8qf1GJ65
	FgYt+rEL1+pjMa/fa14aPQKV0CNs02uF1ZkA2RFQco49Ki8DZYY+RUXbhsrR/3VvlEUo37qjWOm
	U7NM1ISNjaQ0qlToBswkc5kFGcjxN8sQ==
X-Received: by 2002:a17:902:cf43:b0:2a7:a3b3:3229 with SMTP id d9443c01a7336-2a7fe73f971mr58217855ad.5.1769276520124;
        Sat, 24 Jan 2026 09:42:00 -0800 (PST)
Received: from debian.ari ([152.58.177.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f97902sm50096855ad.57.2026.01.24.09.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 09:41:59 -0800 (PST)
From: Archit Anant <architanant5@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Archit Anant <architanant5@gmail.com>
Subject: [PATCH] staging: greybus: remove completed GPIO conversion task from TODO
Date: Sat, 24 Jan 2026 23:11:49 +0530
Message-Id: <20260124174149.10314-1-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The task to convert the Greybus subsystem to the GPIO descriptor
interface has been completed. A grep of the directory confirms that
no consumer drivers include <linux/gpio.h> or use the legacy integer
based GPIO API (gpio_request, gpio_set_value, etc).

Remove the stale entry from the TODO file.

Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/staging/greybus/TODO | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/greybus/TODO b/drivers/staging/greybus/TODO
index 6461e0132fe3..43fb6dc3dff0 100644
--- a/drivers/staging/greybus/TODO
+++ b/drivers/staging/greybus/TODO
@@ -1,5 +1,2 @@
-* Convert all uses of the old GPIO API from <linux/gpio.h> to the
-  GPIO descriptor API in <linux/gpio/consumer.h> and look up GPIO
-  lines from device tree or ACPI.
 * Make pwm.c use the struct pwm_ops::apply instead of ::config, ::set_polarity,
   ::enable and ::disable.
-- 
2.39.5

