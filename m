Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3E93F0ABD
	for <linux-staging@lists.linux.dev>; Mon,  1 Jun 2026 20:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780346564; cv=none; b=UDZQaITRz9CUvzvnyZtsMPXvEN/YNzYz9QoqeLVjmDQY/JWj/M372ea1trBh+irxsV58fbqNzDOSJ1UxNnMzO87vPhSQArdVUlx28hbC9oA0zJntdkkAIEDSufvKWAfIElBoW75HYCU9ofnjiebi4y01y3MsSXHUJuHYVJzfCv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780346564; c=relaxed/simple;
	bh=wJzJjq8VGiPHDMnd2bF16LA1BnBoE5aYaUBNbiWuFfY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lpefplxlpxkhZ0fDc6WpJ5R/y+itD4Jkucvh1QsF1HfjBx+pY0CD6UfyKkzrNqBS6yVlIQTw3x6dA5RUDGx5XQ8TMwgkMKt9OEpLNcatYsZVK24QrAg9zDpb49SfZs6Grd4NT4kLk4fu7My9dmxZtG5g8DfQ5g9JnD/RuIMuNvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gjVNh4Yq; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjVNh4Yq"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490a765d410so20146905e9.1
        for <linux-staging@lists.linux.dev>; Mon, 01 Jun 2026 13:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780346560; x=1780951360; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I0G7ki3DgUqS+HG9tvsaWLATArhSWddbLLLuSt8Su2U=;
        b=gjVNh4YqBk8iYvXEMaUrixS80qoFFsTK6AIlPCzr+VkScjlc/Dr9/h8OcJrJ6+8gGv
         eCH7njDindZf8rNTgPN4E4JabWLDJbq2vif4JQMZQYNrNVSQ82SKPWoK7ACqIsB1FPO+
         h1otigAIdmRj3/+mgYJ5/YjwtTW+S8wox0HGTRGUFlDT7gcRyAUJDVrDO9ChdjTdwbGf
         W78aC2XgDXgn7T+V2OUZQB3wEbYC8yR3FUaot5ij0qy+oKThg2RI1B6sUrQ+qY9D6qXq
         9PTUkjaZrVRtIxA33nL9oQCSLcgt6+C7Xt0TsmjTBPv+wC3Ob/1ihhFNTSlsNiYqlzKt
         fC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780346560; x=1780951360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0G7ki3DgUqS+HG9tvsaWLATArhSWddbLLLuSt8Su2U=;
        b=Kfya4qlTj/lt7BPc28q3nc68BiNtAdzKRqyON0hPv75rNl7+x+9ZERObqFWpa3i1/U
         mgoBVqyunAs9z20o2Ce6/kd/AaMpzg7bNRsFUIY52blmCj2rti1SRACSV/YodLKFxKmI
         ZB7odWfXRYUbfXvzgDOxis82RA0iMNYjTN8qXDDRd9lj5uzLwSFEHxkOODoA/vz47GPX
         NoPbYsN0lPz/YpOSBJ7xggNqVuwotnj4ltmYFCmU3Od9acoRvK6gtQIcTDKhC4viL2iJ
         p+8fM6qn8Lq/HF1qbLfxIYqDw0FjYGzrDCoGyPSuf6JrzV7LJ1HKp6pQ4wWBDhmJuH23
         MoLQ==
X-Gm-Message-State: AOJu0Yys0QKC1vUBsaY4s8s6U6Q1ftZt2zChq4/OZQvgtShd8gme/Ef0
	LQlpjmEY870Ba4EgolML4WPVMSEeDIgN92l7iRosY+SsUVkUbw6GRo51
X-Gm-Gg: Acq92OGDEnkFGK0lUIqBmjADAsKsSPBxPID9rOzwmxcrOiUFjc+SAgwzxn7jbSVC2Lc
	axVGPIBWZo35a7aWiXt4MW1WCrcvu0Gk0fDSVpY4S3N8yoIhtBttEPDpLby260g11zSnaPzr2SX
	cjCBNbF3CISMaxUnwpo4v7k8vKLNOpweC5xJCP87zxEjqcM6QqNni4qOWEsmgnhOHOqs4QpqIC5
	4yII3S1CjrZj/jdpjOVbR7EDbk4mRo6TIOFibhTUvp4vDO3GFnjF1lqvqToXpqsaXvO6e2NWQ10
	GibN7M9WHnk1lSIyLrxdgglaSlT0cUrT136BYatV6rTXmi77uGvLwl3acfQXogHFPMmvbm2XY4B
	oXKbBMR1GKSvVn7I2WTGKO73L7ztlnrFOgnmNunnRNn50WcDYrb2WGI8X3qP5zWFXZNRqBSXyiH
	lsLS7dsBogejyfr0vEDEmD2ZX5nBw4Seay6kcanNKGQZxyBPYsGJ8PpS2glez3bYUKuZH5BHqQ8
	lUXoyFICznZtUf3uXszI0rdYts=
X-Received: by 2002:a05:600c:c3ce:20b0:48f:e230:2a21 with SMTP id 5b1f17b1804b1-490a2975173mr175649525e9.32.1780346560317;
        Mon, 01 Jun 2026 13:42:40 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-002-204-131-161.002.204.pools.vodafone-ip.de. [2.204.131.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e19a06sm16988405e9.5.2026.06.01.13.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 13:42:40 -0700 (PDT)
From: fliegbert2@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH 0/6] staging: rtl8723bs: Rename camelcase enum values dot11AuthAlgrthm_
Date: Mon,  1 Jun 2026 20:39:52 +0000
Message-ID: <cover.1780343502.git.fliegbert2@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>

This patch series mainly resolves the camelcase checkpatch issue for several
values within an enum. It also resolves a checkpatch issue regarding the use of
space instead of tab.

Dalvin-Ehinoma Noah Aiguobas (6):
  staging: rtl8723bs: Rename camelcase variable dot11AuthAlgrthm_8021X
  staging: rtl8723bs: Replace spaces for tab
  staging: rtl8723bs: Rename camelcase variable dot11AuthAlgrthm_Open
  staging: rtl8723bs: Rename camelcase variable dot11AuthAlgrthm_Auto
  staging: rtl8723bs: Rename camelcase variable dot11AuthAlgrthm_Shared
  staging: rtl8723bs: Rename camelcase variable dot11AuthAlgrthm_WAPI
    and dot11AuthAlgrthm_MaxNum

 drivers/staging/rtl8723bs/core/rtw_ap.c       |  8 ++---
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 10 +++---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 18 +++++------
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |  2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  8 ++---
 drivers/staging/rtl8723bs/hal/hal_com.c       |  2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h  | 16 +++++-----
 .../staging/rtl8723bs/include/rtw_security.h  | 10 +++---
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 32 +++++++++----------
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  2 +-
 11 files changed, 55 insertions(+), 55 deletions(-)

-- 
2.54.0

