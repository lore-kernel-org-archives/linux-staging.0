Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBF632470A
	for <linux-staging@lists.linux.dev>; Thu, 30 Apr 2026 17:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777570235; cv=none; b=REwgmLVcpQlOaLiFyODejAjalCLh6N/TN/asUhcqLFqXN+LJPcC4rJx8qfhmfvRPmyZ70m/TtttCTTHQymEdhsluIJ9lfhv/NW86+JVlp01W9Tb+WpgQpo7v/rl+gfzOZArtmz0bTXwI7bJw3DL0sbNPmEBuQFZK8hadmHpHnUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777570235; c=relaxed/simple;
	bh=b8H9b/U/D+iTqLwXbFQ3tK2Zsv312tif3oUR7Mh3p0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i8r+gcjJWUlzgXXLKbZk7Y2ruiJUUnpgjXPQ5bTiRhWTZQaxk2mo3pKmKUa/csLJpFjXnyKSqZsbJ3O3OyUTzwTxHl4bbMDRq3cwt+m6f8nWDeV6ExQ/2Q74N73EeXAwCiyOx6sbqmf1Ej3movID5WQ8dJhQOG3vFVp5iEgH7dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TiORbF5r; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TiORbF5r"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7982c3b7dfcso13091707b3.0
        for <linux-staging@lists.linux.dev>; Thu, 30 Apr 2026 10:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777570233; x=1778175033; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wFUV90Ni+mksOYQDlRLjFevnwjXxsZtOKix/EgGx46E=;
        b=TiORbF5rIAFDj8N0FseEwrnHnHX9ucogQqTDjRcb69qokDb5rX3wKmoHWl/HgaKNpd
         1H7yay4sBFFHYYkah/SS2QnzHvNjhjf8Z1vsKHHli0cDktojgeRMhgeaCTgC4GSbO9FU
         g8g+u2ExDGM7WYjT/ktbuJSmf7x3VgM7GWRXvHwNwhJpLRNLKrT8rVkQylmUXAMK3d5w
         W4BSzJ2ZbRyixaejoZKiNPWwzYBRj1n4l8hBD0YMVc2pAMlYglnUWGUxfsTTaRMTcgy0
         gT8ftXMJWYBUiwljM/Nbas0Uckv20T+3A0agEEQm8ASqb3rs7yFWkcKhHhrnTBGdrOxs
         ZUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777570233; x=1778175033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFUV90Ni+mksOYQDlRLjFevnwjXxsZtOKix/EgGx46E=;
        b=kghfBfxKlgzgeuxJs5hBrXKLp1O0vsm0BYqkdt3lW6t98PewfM/O2sHnv3kPWNCPYl
         uf9ZKBu194U/ZsDZsa2pZwRcgZwT7+Y91CJRDuKdZfg5PsTYAHH2bZCIl1JVHnAlmI+W
         vd1cm/4wgS84WNztE1zc23OYx+EEqz/mpa6t60Pu3Mv79Ajbd9d/qzuqaFZDL3KM/pW1
         0ZRyjAT5LDZ+nAKcEwPX8fGZIdOXCrWFpj1Bo8yQCTbtHOVWGzr7z/2lekIGcX8NVl2X
         LDVV048naeiEkfpE2XI3OAlCWb9NIh1KhSNpd4vS5HBl1z9XJPWFb19BkpPAxXGW8UXJ
         LXCg==
X-Gm-Message-State: AOJu0YwWac0sUGeLNpcP3iZACVY9bwTQV/GEIqP+s6ofGFsvjiWOp71U
	sMrwJdUO/Ojd0qRYQDdAO7ch5Ev4ix4fazRW3jv2uxxQ6GOU5TLb1uUI
X-Gm-Gg: AeBDieuuN/KGJlg7aTBdS8Ddq4gbJSR18XvZT1qWAuEwvVTCqBeF827ymgrM6pgNGC5
	kx9OEXVseI+YxrSv2cCRF2Db4r8gCDSNjxHJ1HUwgJTYDMgIrZFHoTnDIRy7BWTh/chOkiPYLjF
	+VD4QqwtA4xoIvZh+xrBl06FJrLdaq4tHDl/4MZ9Yoe7G/s5uzedQACkz6AGQ9SqMfnGLY32ltf
	lGpHv//P2dzwmXHFXLWkAnJJe3PEyh06oLtzwZr8pIAWKz/cQL5mmSzUY0TK0ruDPRi5RbBNCeo
	aU8cWb3WcQawdE/K/WZoIwpOlAtRUQE97uKRPZZE3JYihu0LlHzAbtX++Gi2xtV/sGn4FbY5X/M
	bkIFXibfzJqXQ3d6GPhvdni89NIWKCgMlrIdY4CiYhmBnbTwGhguUFEcK+pK25MTDz8zY5oYWEm
	z8v6h2w52hIapevjzOArdddRzEnH+IXJRDNnw=
X-Received: by 2002:a05:690c:3481:b0:7bd:5cc4:1961 with SMTP id 00721157ae682-7bd5cc42eb0mr21548347b3.37.1777570232875;
        Thu, 30 Apr 2026 10:30:32 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd665298b4sm232837b3.7.2026.04.30.10.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 10:30:32 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2 0/2] staging: rtl8723bs: cleanup hal/hal_intf.c
Date: Thu, 30 Apr 2026 20:29:04 +0300
Message-ID: <20260430172954.12828-1-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is leftover patches from v1 that Greg was unable to apply.

Link to v1:
https://lore.kernel.org/linux-staging/20260419072034.19824-1-nikolayof23@gmail.com/

Changes in v2:
	- Rebase on staging-next

Nikolay Kulikov (2):
  staging: rtl8723bs: remove wrapper rtw_hal_disable_interrupt()
  staging: rtl8723bs: rename DisableInterrupt8723BSdio() to snake_case

 drivers/staging/rtl8723bs/hal/hal_intf.c     |  5 -----
 drivers/staging/rtl8723bs/hal/sdio_ops.c     | 17 +++++++----------
 drivers/staging/rtl8723bs/include/hal_intf.h |  2 --
 drivers/staging/rtl8723bs/include/sdio_ops.h |  2 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c  |  2 +-
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c |  5 ++---
 6 files changed, 11 insertions(+), 22 deletions(-)

-- 
2.54.0

