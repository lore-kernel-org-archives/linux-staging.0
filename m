Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519272DC323
	for <linux-staging@lists.linux.dev>; Tue,  9 Dec 2025 04:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765254490; cv=none; b=RfsLTsjw9acj3W67+iPRt8g9vYXUfN2ZmySAv5BVwYXYoZeCDigyBBOhBHm1aajPjMhlWFfvhQacLV7U5kGEPuGf36hDKKX63d2WzXbskI3J1LrjV59Hxsz0jsQcJOze44WlF6Fc+YqMeuQWpgqMSxaN3K8I9KGc6KeiyFX6dYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765254490; c=relaxed/simple;
	bh=LsB2Rw1u+BAgI+Dke597qwki4yRQSIPkKWxz+iJXnKI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VKNE437xcHKbps6LvMPFO+J9y+dBnEv38MWX98IQDYf3A7BAZmffjK2qjQD3KvZPJW8kL5JIk2f/Nv1U2sg8MoZ5gP7RnWO2XimM1IQzAP3oXbjwwtSPHUKZaXV8pYxnHjmrt+w95Q3bwv8iJzzaplCEPcmiY9Uddaz4jnsWOaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WAhfnGLC; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WAhfnGLC"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-340c39ee02dso4161522a91.1
        for <linux-staging@lists.linux.dev>; Mon, 08 Dec 2025 20:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765254488; x=1765859288; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OlS8NGZoUAbx3WVREmoqnUjbjOgDJ/P+b1vdg2wt/Bk=;
        b=WAhfnGLCRIAgjzyrq2sXKiInTjnp9huFnvuJnLB1Z/6+Vdh0AIjiL+jvHpy2kWORCR
         T4KeY9QvP9CbD+U96zGBX3TMKBro1K0AvSracATUeZ/6EdLm3pqlRS+BaC3n4SaKS6PP
         LF+XM/3BzrvifFxl7bPI9MQY11GblutMs90FLweTEtGRo+y8mOgT0J9rBXvQTFxOyJKV
         LntQa2hYcol6KqfRD1VwJrM77bj8NJXL0Y5E/j0yf8oUdi3kQkw10UjEdR/k7vZpBEQq
         WQ86k4y5pHA98dPc0Ve1hie7p0MTl60bO5jbYQmqV5hsWZZKQvut6OK+wb5BfQjSSGsz
         PWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765254488; x=1765859288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OlS8NGZoUAbx3WVREmoqnUjbjOgDJ/P+b1vdg2wt/Bk=;
        b=cEbSKIZYFEe0qKuMM1sLiEfA0yDb160fno1REMPhs3/J+AJRS5gSlZ1Bdo/B4Hm6Sm
         47ykTqKXfSsco3n989Wn6Sx9WzWe7zQh+p3MMPwPA7WTmx8cTke+NjIa4iTcboB8CSrT
         OADebto707SJTID2+KJeK0Hb8zO24f1N41hZAShkgy4Xh+V0WyiKuDk0ubOe3TsTE1/2
         z4qNYZJeySG6hwvL2m0SRxZgddr+dBU84vSmZbz2XoJW8Q4KqFISzk4/saHsqRheCN8t
         P4eQJwlWVUm9fhXmV3yp3cAhz+bQrcYvHO402UQYDHs3EXHEarW2Ehdj+aplrac8G6gV
         FHQw==
X-Forwarded-Encrypted: i=1; AJvYcCU4/XLBZ8UskeFgrxP5kQ0nTJVwspMOBvQHsNRzMXWUrz606Su6sxk6gBlQEJP4ZCPSuRrWNAXkxvtSSMMb@lists.linux.dev
X-Gm-Message-State: AOJu0YyX5K43Xe6B0IelnQBHw4roksKt645WBBSwWwOY1xKi2vV4/7um
	6e9Wt3OmTAkZYfutYivcQd5uDSQ0ERhbupO4DuhjjoxBQivLen8j6iSv
X-Gm-Gg: ASbGnctpqepHNcXIZaTcmVOaT98PNp5VvoHcDd9XMTWWKT3iYw3zPifCyNLIkQ5xUsI
	EJPHEiZFGXr8osEant1Umou6MEY1f6AY8inAKVIjRZM4uyM4dJ172emn2KlWJXOaTxON0vheQ+r
	PrHvsYKpVl7A8ateiZ5YqS8nsejIpbujAnQWGw2qQ9qRW805kvhS8ZnYiT2dty0CKIe9bgledgA
	089rof8EwKYtaU3u1xgmB1sTbpVfRfpAeRkw3lZu8Mlu2vbMWSq+TpinxK2AKvaOcJ4qpTFl5K2
	bJ0f/f5yoVgJtI8mnwvs26z0HsGlk7JfrsQXiMbvLGCCneU7u63Z0y2CxhsvKQunFN/7E0uHibE
	+o/zuUVIe/s56tJYjooVfe/Cgjc2A8pKaT/A69OuHXGIiRyKepXqz9t/kJ/Z3wOVz7EqbQkPeCj
	NKbBK3vJa3sXy0ETxRq1xDkyPUzTAMQuuwrWqbWnRh6wiHNys0KuCm7A==
X-Google-Smtp-Source: AGHT+IFg1iIMyFLucr9uOHmmv9GE122UxHPeUmvBUIJroW50FItL/tqkSaQEcjZrl0Un6zQJ6OWfHQ==
X-Received: by 2002:a17:90b:1e07:b0:340:c64d:38d3 with SMTP id 98e67ed59e1d1-349a2511cbdmr10578046a91.12.1765254488312;
        Mon, 08 Dec 2025 20:28:08 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:b455:298d:48bb:1784])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49b90fd5sm765185a91.10.2025.12.08.20.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 20:28:07 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	tzimmermann@suse.de,
	andy@kernel.org,
	deller@gmx.de,
	gregkh@linuxfoundation.org,
	Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH 0/3] fbdev: Guard sysfs interfaces under CONFIG_FB_DEVICE
Date: Mon,  8 Dec 2025 20:27:41 -0800
Message-ID: <20251209042744.7875-1-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This small series makes several legacy fbdev drivers buildable with
CONFIG_FB_DEVICE=n. Currently, multiple fbdev drivers rely on fb_info->dev
and sysfs attribute registration unconditionally, which leads to build
failures whenever FB_DEVICE is disabled.

Thomas previously noted that FB_DEVICE should eventually become optional
and that drivers should not depend on sysfs or fb_info->dev being present
unless the Kconfig explicitly selects it. This series pushes in that
direction by tightening the FB_DEVICE dependency boundary without changing
any runtime behaviour when FB_DEVICE=y.

What this series does *not* change

- No functional behaviour changes when FB_DEVICE=y.
- No removal of sysfs interfaces.
- No changes to fbops, memory allocation, or display update paths.

Build & test coverage

Tested with the following combinations:

1. **FB=y, FB_DEVICE=y**  
   - Baseline configuration; no regressions expected.

2. **FB=y, FB_DEVICE=n**  
   - Drivers build successfully.
   - No sysfs attributes are created.
   - fbdev devices operate normally (where applicable).

3. **FB=n**  
   - Drivers depend on FB, so they properly do not build, unchanged.

Motivation

This moves fbdev closer to supporting FB_DEVICE as truly optional, helps
reduce Kconfig entanglement, and clears several long-standing TODO items
as suggested by Thomas Zimmermann around legacy sysfs usage inside fbdev 
drivers.

Feedback is welcome, especially on whether the guard boundaries around
sysfs are placed correctly or whether more logic should be pulled under
CONFIG_FB_DEVICE.

Thanks,
Chintan

Chintan Patel (3):
  fbtft: Make sysfs and dev_*() logging conditional on FB_DEVICE
  omapfb: Guard sysfs code under CONFIG_FB_DEVICE
  sh_mobile_lcdc: Guard overlay sysfs interfaces under CONFIG_FB_DEVICE

 drivers/staging/fbtft/fbtft-core.c            | 20 +++++++++++++++++--
 drivers/staging/fbtft/fbtft-sysfs.c           |  8 ++++++++
 drivers/video/fbdev/omap2/omapfb/Kconfig      |  2 +-
 .../video/fbdev/omap2/omapfb/omapfb-sysfs.c   | 11 ++++++++++
 drivers/video/fbdev/sh_mobile_lcdcfb.c        |  4 ++++
 5 files changed, 42 insertions(+), 3 deletions(-)

-- 
2.43.0

