Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3628921CC44
	for <linux-staging@lists.linux.dev>; Fri, 28 Nov 2025 16:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764345949; cv=none; b=EZF6KHHA8cquT7y4vtBqF9oHN6WoGCXX2pB+eN3BKFzdOnxfspg4CCXxY1h/f6hjuMdhvv036TX52AyL2hCVqv9IBIiIRN28TUDEX33vglw6fnPvTuBrPv4GrjS1omM5ND3pBAiIIrsnFCYFyaR/rYIsldY0aQpKJmzBKInNQo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764345949; c=relaxed/simple;
	bh=7R/V3fLA5ZUpQU7ZkDgrTUeowxcERJCp6oWcWnZd8YQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=g+LAoHq1sLnziqAvCIqAbVycuJyYqOHFrogRNA05FSlFSdYTOQpen5tJWDmsF6gkgA2jFKue3EktE56CBmHdbLfPgwbbMOfUG52MznouqgB5UbcpA3+f6Tt2/ygM3gdE0GSGRJi42Cskzs6c8TaA0BdRoKfNsb7Gl9Hsjh3npQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TYoMGSaG; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TYoMGSaG"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-298287a26c3so24002875ad.0
        for <linux-staging@lists.linux.dev>; Fri, 28 Nov 2025 08:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764345947; x=1764950747; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jr0436cSAe7dIJCuJ52U9qMmv3xepyLVevZMH0j277U=;
        b=TYoMGSaGQWuSfFyFpUsUZUH0moMrVf7xlO6wbgjeDLzb1lwHSxe7a13YA5nnJeDntL
         3rKQ8btdAVTVcGRRjOE1mMWKhblm5iVjIx1IIYe6C0Jm3V4hQmuUBQ41kgc84/HfDbRi
         3SUqTGgVlcYRdowzg7Vhg4iVpG56H0cgafDsUIb3pMXWORzfnDlkyHUq/cG0QIYn1PSJ
         NxXzw//5GuotFq04wIXmuNCImIvW3oKZ1sDXa/hdl/MRicH0E0OdYDliopT9PIVYh6yA
         PP6KYacjEHotWrRJ268lOezqAFIPGQVGeYxQvmd9QdHNqMFzuleomMmK58vLCL433fBz
         onpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764345947; x=1764950747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jr0436cSAe7dIJCuJ52U9qMmv3xepyLVevZMH0j277U=;
        b=GVkCc6f1sVpZvIvMffEV13kBJl86siaePOYHCTSGhQrrj+kb+7781uRT0zXv8WOyzp
         vfCZmeZN4eFU9KPhWJ7fEB2yBi+DFTHIid++LQVuyG7X4g67cc3nskgtidKPUpsy3/V0
         Knne1pcDCzfCcSVGFODawwqgEY/iGk/w3fU6cRwsEj3HeU2vsdMMKU2z+vncUNKODSM8
         10oadWETdpmnw1TBPrEeYH29fIoNUTNCZYVdYvlmL9mOBDfFWocYmG9M9VNXUg7d7rrp
         vnanGBcUzlYfM481qGSlYPKoUuZDx8FpGdsWU3A7fDi/B09zOioR3UCyA2Hsh6q484Al
         rR8w==
X-Forwarded-Encrypted: i=1; AJvYcCU8rQMqFn0zwSmiZvf659LV/lDY2ZTaN1Oh73Tt+2pfJ+i19pbwms/YYLUQBTOiQ5T+Dgyqj8M83LvI5JRN@lists.linux.dev
X-Gm-Message-State: AOJu0YyK1ZjwMrhtJlZES7AF/lP70zJcf1HFsk7YE89NUlRKwOccKJ2n
	kkVvOu0OgoQ6h/Tfu2SMnf+v85/SfVTeXHnQf54nMzK5xGAf8+87mj+k
X-Gm-Gg: ASbGnctsji6pERDQN6fiH01z/JygfKEKL9N4EpLVk5r9Ac6kplOvuXjA7dI/WiGUdyr
	19MEFHmeIrBstsbxO5+hz3eUMaEte/yOd1cN6jDJrJEOc5h31Qw7wbcMZmsq+mzkrL8q12044dC
	1Qm/J/7QGBhRrCnkTCMgKO8UeKRAJ4cAAr5eXOXohLWLEJon52/Qj5UeLQSwb7MxKG0/dByZvd0
	04wvW17rvfpct/sWnQy4HqdRObinc6afOpxEb11vkS0tucFw37l5nwLj1NteqddCtxK5FbzkLOi
	FVu2UO179krIIVRUng5l6K43X1COehd0+IfU2/+o9uPsoa6BAmhx8lzHeqFKyF5zjeyZ+P/NyRe
	tfWRW0/IzKr0r3Q5UAACX72Hf1Yil0I6cD6qoo+aEhaRJoqVqsJsx6IhCJkHMZ9LOWQE4cFAyDa
	Na1d33Rj2aicwIJzp3UeTf3g6c66ctpqzQsv6PeQ==
X-Google-Smtp-Source: AGHT+IEbRdUXnl5aQOE+Qq55lmPGygxKdzplNnm4FsxdZSNypxAVuwWstG2sn4JYjVv8VNlcsFkFkQ==
X-Received: by 2002:a17:903:11c3:b0:297:e3f5:4a20 with SMTP id d9443c01a7336-29b6bee38ecmr348858315ad.26.1764345946851;
        Fri, 28 Nov 2025 08:05:46 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f26f11fsm5408499b3a.50.2025.11.28.08.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 08:05:45 -0800 (PST)
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
	aha310510@gmail.com,
	linux-staging@lists.linux.dev
Subject: [PATCH 5.15.y 00/14] timers: Provide timer_shutdown[_sync]()
Date: Sat, 29 Nov 2025 01:05:25 +0900
Message-Id: <20251128160539.358938-1-aha310510@gmail.com>
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
 Documentation/kernel-hacking/locking.rst                    |  17 +++++++-----
 Documentation/timers/hrtimers.rst                           |   2 +-
 Documentation/translations/it_IT/kernel-hacking/locking.rst |  14 +++++-----
 Documentation/translations/zh_CN/core-api/local_ops.rst     |   2 +-
 arch/arm/mach-spear/time.c                                  |   8 +++---
 drivers/bluetooth/hci_qca.c                                 |  10 +++++--
 drivers/char/tpm/tpm-dev-common.c                           |   4 +--
 drivers/clocksource/arm_arch_timer.c                        |  12 ++++-----
 drivers/clocksource/timer-sp804.c                           |   6 ++---
 drivers/staging/wlan-ng/hfa384x_usb.c                       |   4 +--
 drivers/staging/wlan-ng/prism2usb.c                         |   6 ++---
 include/linux/timer.h                                       |  17 ++++++++++--
 kernel/time/timer.c                                         | 315 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------------
 net/sunrpc/xprt.c                                           |   2 +-
 16 files changed, 322 insertions(+), 101 deletions(-)
