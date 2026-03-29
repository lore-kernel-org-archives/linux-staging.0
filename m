Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918D9481B1
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 06:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774765214; cv=none; b=m0NTFS5uy+e0teQT57tTriY1AW9APGgNrEfxTZ+b5uLnKIMZi5OqmgnU1OhKGRN7EocxjX6iT6e4QwxJktKUbBbiMtZsm8A+M3Ly+5vFp23KEGR3iHCBaZ50WWtBzdwozm25HzKBiYSbKQn1LMrpLZH8dgMUj7gFcTMCPYhyPT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774765214; c=relaxed/simple;
	bh=KIctrFMkwzb+e9qVyARdABXgvBrIrhDp/Rj0SClxo9U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=S1rSqWa7QXu7iUPqJ+WuN1GELt9XPYsOAele0ZZZrKZqtcp55vuBo6bJbcSnsPKxM4BKJ16i9vvsqwF4afhbs0A2Jo5N1qf18f1PAy27ruGEXTG4R4GhKPM+nBgJCS8lV+CrgP01UuDXxn+XBdqyCD/ygyKPw51f4phIRJEzUeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o35+TNgK; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o35+TNgK"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-953aacb9d78so153231241.2
        for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 23:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774765212; x=1775370012; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KIctrFMkwzb+e9qVyARdABXgvBrIrhDp/Rj0SClxo9U=;
        b=o35+TNgKzxn5oFkghUSDvtG2k2LrZj2k+Xwx0ngeVfKazGKV3hWrImth+RV8pRBKZY
         9g1wXXmGrmE9Walb7wm+GQRaZBTZMWhka/tdw8VHOVjKT12pr5Rdaiw0hdCOrnfhXfup
         APap19xo3EVHwIr8+9tfMcsf3TSLr5gP3/+Y2alWvneNqZzLwGvAkn8TYngojRZiFxQK
         YYCWd09qHMI9FvOW1OjQ7JEvovY4bnRGfCbYfGz4cDfmQHHDeX+RhVhki8k2BS5zlqo+
         2z1g92ypCXGRoC4awZO2YEShcrK+K5iTWzhPP2iqD3CtbEJszGYGsgzBgjy8evJ7Ri8Y
         gmaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774765212; x=1775370012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIctrFMkwzb+e9qVyARdABXgvBrIrhDp/Rj0SClxo9U=;
        b=D1TbWjIOEBWJyHI6RvkMnKzTJlWnsnW7uXLE4pS16TRq1tReWNyQiV8H/F2/z1U8BQ
         NCKZckTnh4lbuDYLz1RJ5sYAqsQnGb/EnIUnswc5RghexTICSJbEdWuYxCX68Poe4SWI
         gZG5iOjouBSdcvbKyU1jqPY9gzGRmLO5F6AksilXgz1nN+Ac46h5mbStLJ9nK7FHd4Nw
         PH+IaE2pq885D3ryxO9dAOsZzIvaZV5EdE8VxqqehGzcKwxg2/tbilFPYjgu0oIZpZmq
         tb2ack7XWDhUL1vL5ehb9WejMlIccLTqC7zd8m6ah/jtsg8vnRJNApGvYLgOc0kFLrKa
         rOtA==
X-Forwarded-Encrypted: i=1; AJvYcCUEYnFdB9URQ3SNvYDs+FsLNc4OSO8UEzRoMAB1dlTrrIE6Rd1Y89p7M7O9YXfc2LKMg/NRPYO9EwbgLu4j@lists.linux.dev
X-Gm-Message-State: AOJu0YzYt1DamMZWCYWXYNQDjwGZtJJINUPNlpWTwbrHQXkthu+zdQ6m
	WmOX+2qgvmvuTx7zueK9SDpt3HFg36H7pPuJy1vQrhU/jx7EveljV3bp
X-Gm-Gg: ATEYQzyGLgD+V5iK64U4Jt46Sl/1/7vcDvQ9wx5QQHVd/tyxGOfOsa3xWwZr2ylmHE1
	qxS5U2ZbFyTNFhJNhKyHirUsYqtWOgG8xYncswth7thIwo8+JPczqNX2LqBNZnhxjrOiJ1DRHmS
	nIqcq7ZkVqgoSVgl8ennEmjiYXi4nFYmjYk39fjwU21vd03TnyBKb7NlcSd1WnW0L3ybJIVpRdO
	nHeXSTAf3LnlbsS0erKGR6onlZpYxq5KRBJaP9tLv8UYqs4dPkpHDCNR8l3yt4XPFWkA+yoH01j
	YoIcQPOokxKAyTmzKlpSNin5pFY7f1wetgY0FSpvMBDSy+A6PxdaDs31gciTtkQNhpr64T+oUst
	GS3l3JOFbN9DxYXkGCeimkCU8Ucaa5l9YogrBKzm5UxQyaqX+ywFd37a9kHloRaUcljhFzPWJL4
	+94NjhW1vPfm5AQRDB9qJuH4HnFk+DEvJCWB4=
X-Received: by 2002:a05:6122:208c:b0:56d:4511:9367 with SMTP id 71dfb90a1353d-56d4a0d46cemr2804517e0c.0.1774765212473;
        Sat, 28 Mar 2026 23:20:12 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:6d76:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d58893d21sm4429929e0c.2.2026.03.28.23.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 23:20:11 -0700 (PDT)
From: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>
Subject: [PATCH 0/2] staging: vc04_services: vc-sm-cma: fix security issues in clean_invalid2 ioctl
Date: Sun, 29 Mar 2026 00:18:44 -0600
Message-ID: <20260329062004.492812-1-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series fixes two security issues in the VideoCore shared memory CMA
driver (vc-sm-cma), accessible via /dev/vc-sm-cma which is created with
mode 0666 (world-accessible, no authentication required).

Both bugs are in vc_sm_cma_clean_invalid2(), reachable via the
VC_SM_CMA_CMD_CLEAN_INVALID2 ioctl on 32-bit ARM kernels.

Patch 1: Integer overflow in kmalloc size computation
Patch 2: Missing address validation in cache maintenance operations

Both issues affect 32-bit Raspberry Pi kernels (RPi 1/2/3/Zero and
32-bit RPi 4/5 configurations) running the rpi-6.6.y kernel series.

Both issues were found through manual source code auditing.

I would like to request separate CVE assignments for each patch as they
are independent vulnerabilities.

Reported-by: Sebastián Alba Vives <sebasjosue84@gmail.com>

