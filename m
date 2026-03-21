Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1463176F8
	for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 15:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774106041; cv=none; b=c+J5ATnpwUUnoOT4DpueH1VimODlqjecCl99Fa6MmKxtfTZRU9YJdxsBySdwhi8LBmVOKTFPHdeGbUR2lMzGKmHByg2cygO+hbQ3MS1ps01P1GEnr7XeddFaWLADxhmmhgMUJxscDe1fEvMkgaxfFbvhDLeLyusnnNw1XkTvza8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774106041; c=relaxed/simple;
	bh=bRQxzO5D8C79HbBXHagYQvESgg8Etw7ard5U+Hx3Zso=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qeMeAs5IgWi6uK5UdESOdgcgiVDR29Y9ymOSgstRllh7N9RIGIuJXMqchcBrpC0k68kVenaDq4LoG2dogI3tzF0iEPAt73HWVopONBHGWqncQRsNs0SbHDqHJuuhlq5iClTP4yQP/k+OISz/rJFdTzC2k0PbjzYa0/lBfb2tnKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TaDH0Fki; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TaDH0Fki"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-950cc286d86so389701241.0
        for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 08:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774106038; x=1774710838; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sQ8tviBAfO0tMlhPRp3BxSFc5BcgnTHzUHUu5Zk5Fxk=;
        b=TaDH0FkiHq2SQE2pQI1+nRbqlWsbegRMJIvtN+nY9ij1HDt+KKsC4hHFtD65y4sZu7
         V48mVvwTuL81GVJfphRfpZQtZY0WWADjJwCmtRDUvRXZEeoLo1oZJIMMuVmxq9vIM/xD
         ICo1M4MECnYExtlGBtpHJhti1t6cDp40WTCXG8brfgFRMjDxdvSXNyt9cG/3EiN0dlhT
         hJ8AZsKs/RIILwa+Jw0X8UnSbv0UTqEClk2Wlf08t7rB4LMbCK9ti8Rx2Ku49ittdM3c
         u4bZcB35gU9XjVIsvUoHSWqujPMvSXjIWaXzDKMHLS3giQuRXE26t9+IByUVt5oZJoXB
         Uicw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774106038; x=1774710838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQ8tviBAfO0tMlhPRp3BxSFc5BcgnTHzUHUu5Zk5Fxk=;
        b=BAFx0JQ80ipfPGa9NJ5mc1CAe0s/5Cfzjhc6YYSsZkobZeH1qPnqgbIIvsVaJNLoJc
         FZMHdlrajxfd7JPIu7K59BeTPMusWUGAizg8widhvxy5rnYeo36wuQ5wPYy0r10EXSCd
         4i8kBW+VVNpU1lSv8/FhgS+4oQqGUy5+S51dkKJepzoUNjG6erALGuXCqlQ7K+CyAnqy
         rTtuQ+H+CjQwARwu1ZppWTQBHWsxSsZpE8wfjBMzZzzBFB6WGFgUSH+acZxLzj9CcOug
         BO8QUh0UJGa02KOQ5C0jxlNG0i10jbkhTKE7JG+FmPHtd5fvp8BX5t2SmZgI6qeET/a5
         G9TA==
X-Gm-Message-State: AOJu0Yy07SF2kXKFvw/H7qqYsFUwRbISjULV4IH+fpEL1V7Y5KQUkF3d
	sApjrIfckn31eJ41QuxIiNi+BuBowFuY0pjYUS0US7ehgR50rq376fLX
X-Gm-Gg: ATEYQzx14AslAeq08eG9cLLKv96jbo54lRXR3jNdUJBQaoqPGSJWJk7tL/wgQu61QlK
	9WkgBWZy/lAy/+Bqy8/PXZaPkSxySUxDNF9No9IMd6fmi68IJPRsGv4ApwkiGeBsP4rf0CwCSjK
	EySjIVZjHeAn0SzjDUzlL6vA4U5UekU2suK1EtMtG9ijPTS2L5+0sSghqxPNuioiQ1GQ3Qd3SYT
	fflaWAPznerunyvRM5EOm9NUvRX3KzRVSkA25UBc4PlF3nQw/VorZaVgqv2lnP8hIQ+Qlhbv0/j
	jGMiPd5qEdn7pN9GytrhlGqaB2UZFhB+K7voJEz3SQqBPUXedHDybzzRBevnin+1BKa0m1gEDjv
	CPMrqk6ciXeVEEea3M3IoMPEu1YA3idFMwNOy224FEyUIVL9aJi4kFqm6pyz7fwCp2F1g1xtMqC
	iIWr0n9Ogk8mz390YeItUQUaqvnOhnds/bB3/eolxhJFer0VpI
X-Received: by 2002:a05:6102:605b:b0:5ff:c831:b986 with SMTP id ada2fe7eead31-602aeac9371mr2582496137.8.1774106038558;
        Sat, 21 Mar 2026 08:13:58 -0700 (PDT)
Received: from localhost.localdomain ([131.255.96.168])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-602afb4ed6esm3186753137.10.2026.03.21.08.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 08:13:58 -0700 (PDT)
From: Marcos Andrade <marcosandrade95963@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marcos Andrade <marcosandrade95963@gmail.com>
Subject: [PATCH 0/3] rename rt_channel_info members to snake_case
Date: Sat, 21 Mar 2026 15:13:39 +0000
Message-ID: <20260321151342.19864-1-marcosandrade95963@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

his series renames the CamelCase member names ChannelNum and ScanType
of struct rt_channel_info to their snake_case equivalents channel_num
and scan_type, updating all their usages across the driver.

Note: Some pre-existing checkpatch warnings remain in rtw_mlme_ext.c
regarding line length and CamelCase usage unrelated to this series.

Marcos Andrade (3):
  staging: rtl8723bs: rename rt_channel_info members to snake_case
  staging: rtl8723bs: rename rt_channel_info members to snake_case
  staging: rtl8723bs: update rt_channel_info member usage to snake_case
    in wifi_reged.c

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 82 +++++++++----------
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  4 +-
 drivers/staging/rtl8723bs/os_dep/wifi_regd.c  |  4 +-
 3 files changed, 45 insertions(+), 45 deletions(-)

-- 
2.53.0

