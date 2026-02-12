Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1E31DE2B4
	for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 14:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770906106; cv=none; b=efIAfAdOWzNp8TBMRFoPFzJlQ5xmtLidaeLWm2CNOt+NEGkS/n3aKZtUigYwjHOxNhfWbEdf5rLUrlR/gJ0JCnDk8/gD/AfAvM2CLkqLqf1gcs2zqvj3PDZApDHrPUTNTXnIT2VSq3r47y/9cRHqgPYyiXwjZua32R+cl8nJTQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770906106; c=relaxed/simple;
	bh=8X/TIeuHP7ec2MA1OYvDRtEqF3NnZ2p3cjxrv+/C0aw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mVzB9Ee+WdjL8X7MX8mer0hcV1No/WFJCJtDCG3pV6An5kcQa3yDbvJTAoOZXkVCsJoRY75cde14ObMj0p+mpyCvXeKrorY8/sSK2pYZAW7A9AXzbr7vfQSC3SnEqwH2Gu8hVKG3wAYfrF5Q0x6wx3od+6q3JAHmkVEE6adz8do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iZCPXy1a; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZCPXy1a"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-823c56765fdso1865128b3a.1
        for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 06:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770906105; x=1771510905; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lAHnBnlDcF6gKpsL7hMRjNze/wmlprtKkzvbNC+eGts=;
        b=iZCPXy1aRND6V5spF1W3JpR2UqtaGFuRWFQGHv4v/GD0Ljysf4AVzj5meRaw7SDOt9
         VGXEXTGZr661pyYeeFJFXHuVsJCWQmC7aHbGBsg5p40lwaqThy7tK5ZsOSmSk1hOSpxt
         wKLSkHye4r2oDCFpdASatCNys5tnTlmP/4OzRWWPdrtg4xJoArWqO8PdOuTD0mWJdKYk
         JZzJz5qa32AtK2myiZIP1pvVB5mP8bnmlBpF/LN7DA+CcAbi1pJlajqLDXei6ldG10NX
         kHnNjoLexEC0yO3O6NOKlGq8zjYnjq6FgwSgvPNpph81ZedwDVgiOrjkkFtCzZUxJpwq
         FQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770906105; x=1771510905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lAHnBnlDcF6gKpsL7hMRjNze/wmlprtKkzvbNC+eGts=;
        b=k9PDWjLtJjYujjPKWytVYrY417Ep4GKL6Zu2gQAxM3IRnOYDVWE3ZDBmDtR2C5gVsJ
         qzrg3am2sM3FFswQotms73Ma+DRPFpFGw68Z1fzSBq1VHOzeOakDnOVhQRf1xgv3tw4B
         8SstNnvCiv1Xfbl0H/H4AudpUuY/Gj48eh16bbjw5nP0guQfND0eRoxK8jDUOFJ8US7e
         raWv61fjzkiZ+R1vqPQVoHUC68HTPEYcJK/zN2+NSgnGWMI09BePjudsKaNa5wGiTmfp
         kg8gi5mUgEn9pzl/OFVLWqYoG1rOdg1xh0Jejd9DkQ69DhucSd3mnGhxKbZLa2top37J
         4ztQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvrev+NRt03G6Tv5Kx56o8rVJLFU5SOB1NFV52MU7xnxbdxC8TOqUYy46UwkBLV8uoFBLw/sNzCXsBsuka@lists.linux.dev
X-Gm-Message-State: AOJu0YwToVUtgssmwlgHwI/VqVeiDglaYUlGUtqGra6v0Y4wfzpQ/Q8q
	ObPBqlY0VzlgKOHA03yr7scPTwgDei4GJ1QRv8eo4/8Eba+nyI2/Ge1X
X-Gm-Gg: AZuq6aJRNW7rbNQtYpsmtPpomORLL//Bp1l8vGJCzxEuwNVg32dyUxQUxhir1WwZrq8
	GxoFf6s/1IZBT2CNgeluKHhE4u68dzd6jSKqwDacljOY9w9KQiFEGRdvHM0wdgtvC7znMZorC9F
	MRduheataNLxW5CVOxsz+6C04qfjVamO0eGqLRyJo9pqirK7E76Och5VT5nOXbv0Hys/a/LovD8
	PtkrUped3COrhmbZ25ODfxJXOBu18/EN9TZ+pmEKBCQz/XXuiaL/IYkiNdjLbXBhYb/7H0wevaX
	ahyq0SOP8JeJvCyHVbrwbAM39zdKqk2HTeGmJ8+eSlBbP0TrnU9H/bfI1xmOzQwCPDjox9iJ//V
	XnDAiAvxTWS5iOvMtJqIVXEt0D2ftejEDitzj1kleYcZXXuq7ANp/DL8ty0hKbeg5i2cYHFO7F3
	T9t0s5ln2/laKpo3/toY99GeSSjpj0gA==
X-Received: by 2002:a05:6a00:44c3:b0:781:2291:1045 with SMTP id d2e1a72fcca58-824b2e32676mr2386732b3a.8.1770906104828;
        Thu, 12 Feb 2026 06:21:44 -0800 (PST)
Received: from snowman ([2401:4900:647d:9ae6:881d:5895:580d:d8e5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e366b82sm5336631b3a.1.2026.02.12.06.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 06:21:44 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	ethantidmore06@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v7 0/7] staging: rtl8723bs: coding style and refactoring cleanups
Date: Thu, 12 Feb 2026 19:51:24 +0530
Message-ID: <20260212142131.28131-1-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series performs minor refactoring and coding style cleanups
across the rtl8723bs driver, addressing checkpatch.pl warnings.
---
Changelog:
v6 -> v7: Split patches further to keep one change per patch.
v5 -> v6: Split LinkDetectInfo renaming and address checkpatch issues
in separate patches.
v4 -> v5: Rebased onto current staging-testing.
v3 -> v4: Updated rename scope, cleaned up formatting, comments, and
parentheses.
v2 -> v3: Resubmitted as a versioned series to avoid threading confusion.
v1 -> v2: Fixed incorrect commit messages.

Khushal Chitturi (7):
  staging: rtl8723bs: rename LinkDetectInfo to link_detect_info
  staging: rtl8723bs: rename rt_link_detect_t fields to snake_case
  staging: rtl8723bs: convert traffic_status_watchdog() local variables
    to snake_case
  staging: rtl8723bs: remove stale commented code
  staging: rtl8723bs: use bool for traffic_status_watchdog()
  staging: rtl8723bs: simplify boolean expressions
  staging: rtl8723bs: align and split variable declarations

 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 105 ++++++++++--------
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  13 +--
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  15 ++-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |   9 +-
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |   2 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c     |   4 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |   2 +-
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    |   6 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |   4 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h  |  28 ++---
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |   2 +-
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |   2 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |   7 +-
 13 files changed, 101 insertions(+), 98 deletions(-)

-- 
2.52.0

