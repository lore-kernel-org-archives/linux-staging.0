Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8F63750CC
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 12:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774009317; cv=none; b=KCOVaCMJLyETwQsWx6Fb4YLu0YniAArS8eUVQFHM4aJ14dGK5HShS1BQg5F8RRxMOcipsDof/5FuJJ+p3xCQPEJmjiPiOGrw2LF2PdXgN7Ev1oagGeBDdhOZVaSTFhxIUS7WHGf6zsILcrlA5kIL+LDXqnjHI4hFoXN1cb5GjhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774009317; c=relaxed/simple;
	bh=v96PNO7JZcSpgwIP+i7MyzSXLiowY0GWYlPVyR8BZEA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=me1ZpT07h2G9/kiJhJ07zDwuZP/0DSOd78vzpS4IoGq+EgU5gyadVZOfWHIM+gnyC1IEIZwD75doOnz0HOaZSOSz0PujJ5/pzaa+FzW/YrGIOpMHFDEXTkzdIdNQbI067tS64GnrVY3Og0/lSRsI3tXQdgliC0fAZfJ+JQqf6Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dWjKDiaC; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dWjKDiaC"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-797ab169454so5751487b3.3
        for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 05:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774009315; x=1774614115; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k7+cf9UVx8yIXX2wSQOEYzcbrcA/3+O6tZyWoew/v9A=;
        b=dWjKDiaCsjqVoZ1AxzJB3qRCKGVDlC91ILh3wBzoYj4/QOb+rOQ3EJD2zg+Po3V6Sx
         MF9sR3IL78z1XoBdX7j+xK4zcMkq1laaldQDMuMB8xYGsQDgIoXUlaWI7HqM5bHewTeD
         oJFRf2ycXYmf1KL8k/dDbhoOLZeF9GyfiTQ/ZHOcjES9mEtCFmCPOJjfxjVwzKsRRqB7
         1jqF5b7bAnZnDSgtYkmPs/ncCpXKgcgTM9AWKinZHrdidMRONwmLCxPFzX4uGwXV46H9
         xNDw0xPs+w3vDbRI4sf0rFUfvL7H9xOVNO0YzC+dJdBJpOrI/Hlnj37dZc7ArMkmEZCy
         OGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774009315; x=1774614115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7+cf9UVx8yIXX2wSQOEYzcbrcA/3+O6tZyWoew/v9A=;
        b=FYobsopJCWWbFczGFJr1OcO3EhKFUSM9wlavYAE8+hiehvn7B3Euo7zXEpfmPKW4Jd
         6uANIyL0E37S/V1bBOUuKh3A0y7sN+CGzMu6s8wQ0vUx6fJ1bK7TPWDW2R2ObHwKckfg
         iiaHtwJZefikI0mjQmgDVt/+9ugn2/h/dr5DZ9L3ZFixfl9ue90xk8Kydk5uswDiUpUg
         uNYKyjRz0jdfdI3KHLIyPklxzMpe6kz87tLWECHW4HX4zJkNNcdnsi1HRHInAHGno+9C
         ZDgWMXRA6rGzL1Yrb4TLdz1iwdmOQSXWZcnlpFrEFjq/E/b4awTN6IT5OlkDRG8WRmnb
         i1Ag==
X-Gm-Message-State: AOJu0YwiWxwvqBmb8NyuvHZK1U0ZD10tUMx6saFhV0Ey62PpytcJbksk
	YKbhFGnE/HT7SlAnxoc8TQZ3jIDkrQ5wKnmnXzWEH8uVHW3dehSms3Wl
X-Gm-Gg: ATEYQzysOaDl9I5bP0XCCIrQaWa7r/ZP/a8fGT+ES4zuuQYcc9aoxjzx9Q2a3p6cbp3
	YiJbgdU/OKtbWdnpNXmwR9S3EoyDGwwElpy62KSqZZDweFI+R48OEsKg1hywtEFXoa9VABJTn5O
	W1rcyR3Ut5TXGNSONrocjt9/FWuWqhviRvTqeCoSYyV7HD6efh0TSZVsuIIP+MEyhsCJ16GJIXn
	inTctMvtBMW0L1Ro/a5FYFt1sIpgcmh9e+VXxlVnx8wcxCgSNT18tybAoJN3re7uRYJeax8RIU2
	EGIGMGZNfGPlXwMROTYUo75hS8q8Sy4lsDUkXd91t3ReKguCWb1Eg6K2kd+SYRAwbyjrdZLZgVW
	NBJFz2xgZ7Uxhoo5EO3IH4BYC8EcFDTZwEAiqHENSwKJPBcZ20zXud8EoHQaWbxhWUkHRI8k0QY
	zBzds2ZpPaxUZWkaPGCmvdTQ==
X-Received: by 2002:a05:690c:660e:b0:79a:6e1a:3f3c with SMTP id 00721157ae682-79a90af3af5mr28525957b3.15.1774009315199;
        Fri, 20 Mar 2026 05:21:55 -0700 (PDT)
Received: from archlinux ([93.186.98.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a9057f820sm14075977b3.40.2026.03.20.05.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 05:21:54 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 0/5] replace custom functions with kernel network
Date: Fri, 20 Mar 2026 15:14:58 +0300
Message-ID: <20260320122119.19563-1-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series replaces custom functions for checking mac address type with
standard kernel functions from linux/etherdevice.h designed for this
purpose.

Patches 1/5 and 2/5 will fix checkpatch.pl warnings for future patches.

Nikolay Kulikov (5):
  staging: rtl8723bs: replace deeply nested if-else with switch-case
  staging: rtl8723bs: move logical operators to end of previous line
  staging: rtl8723bs: remove custom is_zero_mac_addr() function
  staging: rtl8723bs: remove custom is_broadcast_mac_addr() function
  staging: rtl8723bs: remove custom is_multicast_mac_addr() function

 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  8 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  2 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 48 +++++++++++--------
 drivers/staging/rtl8723bs/core/rtw_security.c |  4 +-
 drivers/staging/rtl8723bs/include/ieee80211.h | 17 -------
 5 files changed, 34 insertions(+), 45 deletions(-)

-- 
2.53.0

