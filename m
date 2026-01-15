Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BC53358D0
	for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 10:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768472985; cv=none; b=AjTTm+5uhOKMmgLzKmfTZI9SBZ4vcWPAPvKE8eDRXi70hKQjKZmmS9EnbrvM2xB2qEdXYzS8ccMGyi8t70XSYxQxSVYqNszoWR2LaZvJuA9h5V/Rk4EaPr2zhRPV+AGUJwpe5mEMjuiCJZOrpkeb+FBytCiImuKYOSS+UZ3enqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768472985; c=relaxed/simple;
	bh=X4Xd7xCbh0SYcYlle9KWj8HqcSr5tjqYYkab5lzv5eA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OuECzjL9zh3TjsoJXm2upSJhrcbYd9xQNzZ8Mpp0cIevShbMJ+JT9rLKcEhboqmLlCRAI9nZ6Ijb2m276bXUuplA9vzJK3z12foDodcB3EsHz7z3YVadliGcV4P3aDxE1bhB3OkUVwBDhCsl/gh+mjai5d8/mLLf3iwrpEEwtS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCYZuDH7; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCYZuDH7"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-81ecbdfdcebso451320b3a.1
        for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 02:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768472984; x=1769077784; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TVfdJ9orhJTwSTgdiMULruB5PJZpaLviIQa1t2ELkLU=;
        b=fCYZuDH7sOkBob0L1QkdsLy1nOXUXDyiedOxWy9FTgRCmcbWWpuKDC5RzHzhc99GUm
         A+Su7gL07O057OkNikYycDBwp/UEAHzo2e+eHW5466yzulnCIU5fXs5oNqtez1UaxuJH
         aA7pdDHNrBDgACFStFsUEoPAdyMx/uAAOqlHLPEbQ8V0xpHF9+my5PLWPSJT9Vah1wpY
         DWewFucGx+I2ARnGzLj3psmFL+TLYXkXmpmVREKx29MC2Rsrzsdo5n9sRD67YCERKAZz
         Bk3z6Nilf0LJjjDPskwaBIltleC+oZjEfzTMj5TpdO28Onmr0M17HFuCPsT4mtec5DAp
         XxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472984; x=1769077784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVfdJ9orhJTwSTgdiMULruB5PJZpaLviIQa1t2ELkLU=;
        b=AULlaBhAK0I8l93wEx2QKoFKM327f6pUKHUgiJlCoxzr24g8jeUJI3b6+O4wHKqoXS
         HTkdL9Cax7PryOPAysGc35MCTnBlm90SQ+sqLUioML41kfghI02WI/grHDTJNsxkCz7G
         wCvqHJoknXFhgYQQRoa+YN3SOlFg5ijLNR4tJDvUXGVpgeg3IUrDK0Cr23L1JGePoHdx
         g3BfWF+fLcwjsQALTvETJuDRTdKruxf8G8TsimvgSr7YbWMy8z35RdHK+res1ynASxaV
         U5fStL7l/W+nv62DKnfcK9PVjBst2J8mzSq/c8BdBVToBp9AhmrkNeKYc2hu6qyXp1fy
         zKFg==
X-Forwarded-Encrypted: i=1; AJvYcCV2LxTnBcJ6PaTRMuwVqSsSjBwD8ufsKIOLuOm1Abi75/ygn4ioGKlXTkcZgeq6JEfHYKEITNFB3ELr9inn@lists.linux.dev
X-Gm-Message-State: AOJu0YwAGboZB3Pg88ud7KS9mf4OLDhIYpkja2Jc1Knm6GPreKVPk7KF
	gamatHDPsoGjuyaQuzhDKppuCZvMvvyLbhFxyLlkCL8MDcFqPQSYqA5F
X-Gm-Gg: AY/fxX6SQEPBQ3nw2mkfkvGGpNLu4GovB+8U6HSkzkWFJbJGBqDPP5b5oz2TxceYIHc
	YS1rQilKB7UaVS1PaXiCmdGJrxxuMkJnC7F2h28ilMdT4bVZr6UdJN6y2V2SlXRkSI41zuEykl+
	8gklw0VEWepS3Atwx2FSyJe1jjlx8W2BKMfxMnYvOatoYAS4eKhDvT/6aOdqH/KzvUJNgL79v/T
	Byybfnv0iGB6qwoiNFHQZCX0C4433OYfcISY831Z0nvedYDa8PToL0huCK6OU5PNJRTT1YhB7LZ
	bNLldjmPoxcXHHjk/3tjdbnHTBlo4K0HV8h74nBNMqIzur2Xybn2ZHIRhbBKEAZM+ksa3alpVow
	Y5L4QACSRb5yKEJU/fnQUPN5cYkIMu9dM9KygiVcPINniRHNKrM9G+8XVeIyt29Yqlpg4BpuGgS
	Y2tegRmwXQrqn0aTg=
X-Received: by 2002:a05:6a00:440c:b0:81e:cbb0:db14 with SMTP id d2e1a72fcca58-81f81d2c44amr5666372b3a.21.1768472983741;
        Thu, 15 Jan 2026 02:29:43 -0800 (PST)
Received: from snowman ([223.196.193.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f8e4f61fdsm2103488b3a.26.2026.01.15.02.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:29:43 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	hansg@kernel.org,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH 0/4] staging: rtl8723bs: coding style and refactoring cleanups
Date: Thu, 15 Jan 2026 15:59:06 +0530
Message-ID: <20260115102910.10018-1-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series performs minor refactoring and
coding style cleanups in the rtl8723bs driver,
focusing on rtw_xmit.c and addressing checkpatch.pl
warnings.

---
Khushal Chitturi (4):
  staging: rtl8723bs: fix operator and type cast spacing
  staging: rtl8723bs: simplify boolean expressions
  staging: rtl8723bs: rename CamelCase identifiers to snake_case
  staging: rtl8723bs: fix line length and alignment issues

 drivers/staging/rtl8723bs/core/rtw_cmd.c     |  17 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c    |   2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c    | 238 +++++++++++--------
 drivers/staging/rtl8723bs/hal/hal_btcoex.c   |   2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h |   6 +-
 5 files changed, 154 insertions(+), 111 deletions(-)

-- 
2.52.0

