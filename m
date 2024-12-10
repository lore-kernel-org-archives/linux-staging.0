Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795D322ACEB
	for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 21:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733864901; cv=none; b=Eh5+PtsI3Wgm+zi5qrGmD18xNpj2DaCTWlwo3MCk7AhNmkDtCUIqGBQ6yFw6GlQnDG6akKvfS98uEkRoROVBTa0c4O3Hl/KraqHB++qFYwsrNIz2/nESmU/FcnG4zctMA8rJ4HJmE7PSvkkPkePKLT1e2s6ZfBUdpFUgZiBNQng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733864901; c=relaxed/simple;
	bh=+2Xqrpvz1YenH2keEsjBCW3bT3euCCI/Gd2YI9cj05E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HhOw43LKqcb1/S3aBCFvmZOGWviOdzQXhj7MDmhOdGHt9C5r+jQreNKewHpunllAvr3nV4Pyhb0IzCzbrwq5DAtxmnU70zVyVUrI7US2JsB5ssZtjxKOFxyaVioH5edyL5Co0QVXjEJNSSA1nmRzdvytSBe5plL/G7JGmAOiH8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nRgxHx66; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nRgxHx66"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2efe25558ddso663638a91.2
        for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 13:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733864900; x=1734469700; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wme4X18VN8xA7KAuqfQ7sWF9XXzuE8s+l4Pv8ZaGRFo=;
        b=nRgxHx66fYupk2WLUfNZFyKoB+Nq9U/6EF80LK5rP6bHF6+uJRYjiUFqluV5VSL/xM
         0e3p81//L2m6gMNDIHkyAj4+6RABCJjlLvVdtqzTGwBM27iCpN9zNH5Wcg8BG9AP7Zpr
         4x1dCYNVpizXHIL7a1NCwgkN6wN4+6qrMJJO51X1/1ZHUv3o4omqhfIMSt4XvIiQijYF
         KRHh0ehIoq+orVPl/O0UEd7Hol/m1GnKRQaGvMdFAPQQIvriP27FNseD4fpunCVMZXqK
         J07B8YUFiJgtgrgTemcJNYxvut3oUA3Nr33iuonziHm97eYI0S5ujwGxtsO5m+JdQ0Ym
         79SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733864900; x=1734469700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wme4X18VN8xA7KAuqfQ7sWF9XXzuE8s+l4Pv8ZaGRFo=;
        b=G/6rhTc5nFTbTfDQHDjZBj8+9aZzE9BFyZxJPMIgDmpMnLDjj66EIYyJS0Vt2qlWAm
         9FlhFKVOSIQBGjC0st7oXdnmaJkxzXDjL4NzXUorbmXKglt6leIs+LJiLmdkorVQYyR0
         z9z01ISgoKvJ2KByQTpLYgSyNtXAWKVapGmTCV12WhrFyjtQnvydHi5UgB//JYh+lo9c
         zN40drte8lvgNUcX9UUuwHCe0eTHTYenGB2srdO1jdTSvmYqvPxzJe9Lk7UtrymapxXB
         x5TBkVKE+YcZDClBBlOxhtgvAxjaHnoI2fEOoh7nU6wzKe9wjahQRkUObR9Sm7ilU+by
         DA8A==
X-Forwarded-Encrypted: i=1; AJvYcCXv6UfT7TEorlcvW5sJxBYmERmmoDFLzvE7JlFAk/GYyZdUZrIuRSns9ynbbQW9KrJI6sU2/eeN9ZpN0fps@lists.linux.dev
X-Gm-Message-State: AOJu0YzuWc+DjErHNJ899P06OpNukly7f4p5H0ODHrtk3FGaAZAHwDPz
	5t0/sLinSbzWCtfurnkyqaD4p3x9H4zgwIaLEfB4eY2KLAMcevLw
X-Gm-Gg: ASbGncvvQYeF8kSvVyDjYQ0ByM6swKRZKmsjzZqIlAFPL6PL9s36IvJjtZDtyeDMzGj
	jkjo3L+IuRYEkN2XlBFcxEGXoFG8Q3hSwVTFfyRE2cvwxOo2yX5lBvG9dyont05IDclT1nM1YRK
	cjObpK9ujzKwES9JIJpVbT4KBYB5/G25pkoAUARFpEPgT+O9TywHYtI78eL+dinkqHrrxSYdc67
	WFQmyymh/jvig4sh9tmPNwdbuN3sad8vf5oAlJOP/WVr6WWKfkgGXB4a8VVzYUJFmtMMJDti27Z
	2w==
X-Google-Smtp-Source: AGHT+IHkUtC3WQHDqA2c6GfGiPYF/ugEdICoxhxajdJe5+hEK0O3IpMAU7nos51NQXFN4kipl+ZZaw==
X-Received: by 2002:a17:90b:3b49:b0:2ee:cded:9ac7 with SMTP id 98e67ed59e1d1-2f127fea904mr727992a91.20.1733864899475;
        Tue, 10 Dec 2024 13:08:19 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:7409:107a:a63b:a3da])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef2700979fsm13385731a91.18.2024.12.10.13.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 13:08:19 -0800 (PST)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] staging: rtl8723bs: remove code depending on cflag
Date: Tue, 10 Dec 2024 17:48:17 -0300
Message-ID: <20241210210741.17101-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split previous v3 version into a series, making easier to review this changes.
The proposal is to remove the code isolated with DBG_RX_SIGNAL_DISPLAY_RAW_DATA and
all the related code since it was not compiling and there is no information about it's usage.

Third patch depends on the second one due the enum removal.
I think now is more cleaner.
Tks again and regards.
---
Changelog
v3: https://lore.kernel.org/linux-staging/20241206230110.11893-1-rodrigo.gobbi.7@gmail.com/
v2: https://lore.kernel.org/lkml/20241125225308.8702-1-rodrigo.gobbi.7@gmail.com/t/#mf22f30a9c689bd793988d7e7a58c0b119206116c
v1: https://lore.kernel.org/linux-staging/2024112500-authentic-primarily-b5da@gregkh/T/#mea4fba3775a1015f345dfe322854c55db0cddf43
---
Rodrigo Gobbi (3):
  staging: rtl8723bs: delete DBG_RX_SIGNAL_DISPLAY_RAW_DATA ifdef code
  staging: rtl8723bs: delete HAL_DEF_DBG_RX_INFO_DUMP enum
  staging: rtl8723bs: remove HAL_DEF_DBG_RX_INFO_DUMP caller

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  1 -
 drivers/staging/rtl8723bs/hal/hal_com.c       | 55 -------------------
 .../staging/rtl8723bs/hal/rtl8723b_rxdesc.c   |  4 --
 drivers/staging/rtl8723bs/include/hal_com.h   |  5 --
 drivers/staging/rtl8723bs/include/hal_intf.h  |  1 -
 drivers/staging/rtl8723bs/include/rtw_recv.h  | 18 ------
 6 files changed, 84 deletions(-)

-- 
2.47.0

