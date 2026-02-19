Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B8E34A3DA
	for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 17:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771521197; cv=none; b=ZJzpMqnDXzo9lsdl5xk7lBrLpL0gDjrgcMH/MB02u9Kqa5wA27cpwZn6jXBsGZtmWx5ew2xbjea9z6uQ02LbPL532P3Dmua4oXTIgwHtG0mZDQEEA0RYcL6e8JeRK2DMH58JOfmw/gsFt22Eu+2yPJ2VyqdaajV9iRu6/qMbmZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771521197; c=relaxed/simple;
	bh=ovXr+6sxYeMEpCTtHn7L/b6JHB1FSSOMciED12Xosvg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=okgek5QAzCr8f9cVYQNFqHF1BwVdPR7M5TG2Umf+Zckih5etHdDR2n2vIQBqYzTHJAxKumqsVTlcyND8polEfQav8k3lfRcECxJs3JacxzazE3Z5JFaodM7LaiJi1kdhfauCb2RHennTC+NcUcfKTfO4PasslP4IyxX4NoTEajU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q5mLhbsQ; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q5mLhbsQ"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8249cb73792so1029133b3a.3
        for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 09:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771521195; x=1772125995; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jler9eAcfNnsrMpyyoJoP7qdaGNuUrFvk9+cWB5kmEM=;
        b=Q5mLhbsQZqzibrTubS3s/aYhu1R5f88xdxuPb6FN6iQ96J6ndvpUYpGAfpzGApBDCv
         vNHwgAaH/cqTwB+oQ5vIuS3AJ4K7NMDeoufNYU/MDOa1hggGY1GBEE3pqnOQZL0hl0Bb
         gegjJVHWmXd6eB39CjphlML97uj5jGzXugPj4h5S2dr5a820vpUFaBhN1Z/pK32hbEir
         8zWAD9cptzOnpWJ3lX8JrbwSdr0wD7uT0+pPgAZ92tKBqFg+uZiHZeCpDmlBdLlBb9UQ
         2tnTYB3h/RNBNAPoaTAYCh/Wax73sxSyv5G2+DfeMevlV7MCFinK9vs928mTR7HZrUjX
         LyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771521195; x=1772125995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jler9eAcfNnsrMpyyoJoP7qdaGNuUrFvk9+cWB5kmEM=;
        b=us4LWP5kxFoUzB9seYwMzCvJO5DJwJbAdL7dPYdr4mPtp49otd9JI4NH/RwMpzFZjy
         dDAACl7i5BzgvIDDLkTm8B6s2b/Qki2V06CNYzkIssEjCAzGohTr4qWcdXfskOae2qCK
         xbdR3Ux1FtXZvujV7v6nxCjYW9y3Sls+vWbrBAmutdJcrfcAI4smQRaZidVmaPS44z7m
         H/jpermsUnhlAcXfy8cqcG5xDkztCiOaxSuP5mG9CvzPlGFDbEB0sphkRzTMCPuPyJEk
         8VjUEhPAlQuqFhTB0siqXBmS5HY6Y7QJiqoW/S8bFfvZVnOBBjHf/hZGogV3n5Kwdzb5
         n3Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVe+Ucy0uYP3R4JbdDL0kLL8hwyBVtYHTnVtbWOD3bLZl35j9qJnsnPqmj4S9J//p4qrcI7PafU/D4iU4TM@lists.linux.dev
X-Gm-Message-State: AOJu0Yxa+GXU3Tvk2NTPiWx/5QedG6tRbu1XE1qDPxHlgO2cM0x43yex
	ITHlHa66K//vJIw8orrVYnCe8Xgdk/XlUSRft4dn1tUEdLxwyYpAwUla
X-Gm-Gg: AZuq6aJltS8u0iXpLT+UdsQZ3ObfGnvG/AJrsCiwNUBcOzwa/LnJ8KSrrl4QPhW21BQ
	/CtrrMs2+V3Rdac8ZiURoh+28x0h5UgDDqR7LljBnU2+Anw1+MUds0u0HfYRgl76OOZFVUtcTe3
	ZkGHBUkVCk8UqTI630Um87OjevmzNyFuJ5EKsrEmOLUk0KL8pYOMw5eRR4QzIKlsxyM0TxtNDF9
	Dgmx9u1h/9Br7l0YdJV1obQaXLcOTZG/SqmZsdFcowqwrl1eVpYiolBy7XBxnE9IwOjpWxxXLHj
	ODIIZ6wXkSdhe9nTfoXKQDv8GAlg7ejaM2iyPoi0VGZHyVHkodV0T7Q92hymCgtQnfxUT9PFW1Z
	/M6jU8o78lf8Gn00C44d/qH0jSvEt3QN67uovBSOcITjBuWYlbcGDB39kMpFrTLAwwSmRrB7Tr0
	C6bOIhG1B06H0ZqFjvCjeG17+p2NgRuFyyRBCV0TSUEcD62x3vXg==
X-Received: by 2002:a05:6a21:103:b0:394:5c08:7fb1 with SMTP id adf61e73a8af0-39483aae871mr19808016637.72.1771521195247;
        Thu, 19 Feb 2026 09:13:15 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.236.165])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e532fa2e5sm15895002a12.26.2026.02.19.09.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 09:13:14 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: stable@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	Julia.Lawall@inria.fr,
	akpm@linux-foundation.org,
	anna-maria@linutronix.de,
	arnd@arndb.de,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	luiz.dentz@gmail.com,
	marcel@holtmann.org,
	maz@kernel.org,
	peterz@infradead.org,
	rostedt@goodmis.org,
	sboyd@kernel.org,
	viresh.kumar@linaro.org,
	zouyipeng@huawei.com,
	aha310510@gmail.com,
	linux-staging@lists.linux.dev
Subject: [PATCH 5.10.y 00/15] timers: Provide timer_shutdown[_sync]()
Date: Fri, 20 Feb 2026 02:12:55 +0900
Message-Id: <20260219171310.118170-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "timers: Provide timer_shutdown[_sync]()" patch series implemented a
useful feature that addresses various bugs caused by attempts to rearm
shutdown timers.

https://lore.kernel.org/all/20221123201306.823305113@linutronix.de/

However, this patch series was not fully backported to versions prior to
6.2, requiring separate patches for older kernels if these bugs were
encountered.

The biggest problem with this is that even if these bugs were discovered
and patched in the upstream kernel, if the maintainer or author didn't
create a separate backport patch for versions prior to 6.2, the bugs would
remain untouched in older kernels.

Therefore, to reduce the hassle of having to write a separate patch, we
should backport the remaining unbackported commits from the
"timers: Provide timer_shutdown[_sync]()" patch series to versions prior
to 6.2.

---
 Documentation/RCU/Design/Requirements/Requirements.rst      |   2 +-
 Documentation/core-api/local_ops.rst                        |   2 +-
 Documentation/kernel-hacking/locking.rst                    |  17 ++---
 Documentation/timers/hrtimers.rst                           |   2 +-
 Documentation/translations/it_IT/kernel-hacking/locking.rst |  14 ++---
 arch/arm/mach-spear/time.c                                  |   8 +--
 drivers/bluetooth/hci_qca.c                                 |  10 ++-
 drivers/char/tpm/tpm-dev-common.c                           |   4 +-
 drivers/clocksource/arm_arch_timer.c                        |  12 ++--
 drivers/clocksource/timer-sp804.c                           |   6 +-
 drivers/staging/wlan-ng/hfa384x_usb.c                       |   4 +-
 drivers/staging/wlan-ng/prism2usb.c                         |   6 +-
 include/linux/timer.h                                       |  17 ++++-
 kernel/time/timer.c                                         | 316 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------------
 net/sunrpc/xprt.c                                           |   2 +-
 15 files changed, 322 insertions(+), 100 deletions(-)
