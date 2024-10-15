Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A391E4A9
	for <linux-staging@lists.linux.dev>; Tue, 15 Oct 2024 01:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728956870; cv=none; b=iE5OTtf0NK1Cio8aHBAg4gYa/NVH7M/T9L4POrUSDwsYoCIkxOf/gvxmu/sw7nby6nIoy0xsJ+q+x2kNTsoV6dDaljP4SDU66o4qNUY20GEeenpyqGwrQfc25ZOGcnIfDS0mSWdVgbDCbrB0GEeZs6AMuYP+XZI2DZOJw2WZrx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728956870; c=relaxed/simple;
	bh=Nleey2H6mpjLNRUgj8eAZtflmLtxNMDUuYpvN4avZ+4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f+aLOm0nsfAA3duL5NgJAhor+8RgMR1TVPFnqDejT7K2SqHQs2hPwgrs5z51V7p0VVgp5JqtPz/IwuEvjDpwtRuxXzBwdt5bv3cFwlAFDXMfy0Z6cgWyN79IL1v6moaWl6koA9Klf3//9sCvW4o8JvrUBHcqe+uFPM19GBihtxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YvsBAH57; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YvsBAH57"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20b5affde14so28610145ad.3
        for <linux-staging@lists.linux.dev>; Mon, 14 Oct 2024 18:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728956865; x=1729561665; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Od9PPiJWSfzSS2iYi922gDR8xeqfA8wbKIX9K4tpGbk=;
        b=YvsBAH57G1cuUePHxB4Zam9joS9WypzXoKL/OXKcoA84nP6Tra1gr3JZoHSrfzVg0p
         tobU8tV1mY96n0srfuH437EpGiWhMxWEWv3OEfc8zbqyPAurWWXouA/8pqsgjk5FBLXU
         +5WvRgPMhFS7qPQgiFvPCsGPakQMdILsKhM8VPXMyzRRzXXq18CEISuH0CG+3FLSLD8L
         X8U/lRp5TiZPni43rUiAAc5jJBgn9FpI/sDm83IVmlq3L6RQT0MuT+nppvDfQQtGFQiZ
         cPSppcp7WzelimCWSQJ9PLsHyXVDh4v0fOPZkKLRxDUgHJ78bB7nxgC5+EwCypuJf23k
         /tUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728956865; x=1729561665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Od9PPiJWSfzSS2iYi922gDR8xeqfA8wbKIX9K4tpGbk=;
        b=T52OLGhtdjp4vssyWT+8mMtbjw5znvpEGxRpJZ5PEjhm782jgJ3nmidfzirrWI/qYv
         iByoS4k5GlfS82XeOTjg1OjBxNFK8O9+3A3bzQSKTUtUUm2YuwoRT9OIkYxtnLAxOiyz
         mmGW3kGBVHqHTqcsLlyuWbaaQsYZdCdzpX6LUH8YpvnnFn81sZmD87ClYiDRjxlqy1oz
         m4fR7ksrxEcZzosBb/N2F3qEfdt8tOeXg8i3z0T2pKO7Ih6qTLUO3CkRvFtrIeZnfW/t
         LUjyPEup6IaX26M584toZquWG+gme6c0V4J22Lh+9Fs5mrGfx0F8tjrHDuAjW3EDPiXu
         Ib2g==
X-Forwarded-Encrypted: i=1; AJvYcCWLpwvkreJLQeWYwCGgjN/2i69ww1jb+bqffdfnZm/8HJLHK1A88JlkQiyb41klvalzThepPYUHpBEBGNlK@lists.linux.dev
X-Gm-Message-State: AOJu0YzEpFVKEu1MaPMWcqes/kPiSIEiKJ5GXfknBHnRwGM5ZZEB1VGf
	Yu3DZu3VW+3nYMuxpDBJ88ywWV7jfRbxVaDOhgm1ruPWEuYTJ8ph
X-Google-Smtp-Source: AGHT+IHmLfukJ81rh9Cyrtb7n1QpMwoWASLTTRibUWM/QLDeXu8Mku5SQfH4k/iQGyt80c9xdY2PTA==
X-Received: by 2002:a17:902:d4cf:b0:20c:f39e:4c15 with SMTP id d9443c01a7336-20cf39e4eb3mr70058815ad.22.1728956865495;
        Mon, 14 Oct 2024 18:47:45 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:4e84:7ad0:3bea:5c55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d18036251sm1863615ad.172.2024.10.14.18.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 18:47:44 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] staging: rtl8723bs: change remaining printk to proper api and remove commented code
Date: Mon, 14 Oct 2024 22:47:36 -0300
Message-Id: <20241015014738.41685-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I noticed that recently some debug sources were removed at [1],
but some commented code were left inside some files, which I think 
was used at development stage. 

[1] https://lore.kernel.org/all/ab3d501e2ef0bb3980d8d271fb667ce20ed8dca5.1725826273.git.philipp.g.hortmann@gmail.com/

The change to pr_debug over hal/hal_com.c, function rtw_dump_raw_rssi_info(),
doesn't impact the user since is reported as 'debug only' on
the original caller: _linked_info_dump()

I don't have the hw, just loaded the module inside qemu after those changes.
Also, I'm suggesting in the series to remove the commented statements rather 
than changing them to pr_xxx() but I would like to ask an opinion about this.
Tks and regards.

Rodrigo Gobbi (2):
  staging: rtl8723bs: change remaining printk to proper api
  staging: rtl8723bs: remove unused debug statements

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c   |  6 +++---
 drivers/staging/rtl8723bs/hal/hal_com.c         |  8 ++++----
 drivers/staging/rtl8723bs/hal/odm.c             |  4 ----
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c   | 12 ++++++------
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c   | 12 +-----------
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c  | 17 ++---------------
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c    |  2 +-
 7 files changed, 17 insertions(+), 44 deletions(-)

-- 
2.34.1

