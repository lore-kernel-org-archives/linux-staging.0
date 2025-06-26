Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEB01F5828
	for <linux-staging@lists.linux.dev>; Thu, 26 Jun 2025 16:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750954224; cv=none; b=u87HodPIiSw0YI3YPGTQOHl4TUjtRbNh7c9SHrFU3Zx0Zw5APzFlgmvPlNadTP9e7R/mDk12yal7WJwdXPi/P6MgxxYlUpK5gUCe8qh0pbmIkD98RwC1xhP82a7n4UqHIxUtj+v9CXCcqlT2crSOl8kGOsABunTjpoTwgR8+DVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750954224; c=relaxed/simple;
	bh=AQiq4z0xA88o3HSFvbhcfQRTGqMXtRqE6hPl7TrS0QA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GqnO4I/liU0shZv9mg4Rt1ao1ZSWi+PgwsWpSk3DBCBhG24k8u/fsqvlplY3GYNllj7rPgQI8aVv/dqCjdploM13Kgb9WfW6mxssWWmpzadkB7MrV0EWbJ57FsrnJi7N7xIY4ezGnVLyN0vLL3brXG3FvjC9TQs+poOO12eUhpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I17eJ44l; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I17eJ44l"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7490acf57b9so988252b3a.2
        for <linux-staging@lists.linux.dev>; Thu, 26 Jun 2025 09:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750954223; x=1751559023; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RO2tN+aSoxvaSEMRq7XEvMbHrJsjG9xLguEP52powFc=;
        b=I17eJ44lkDQbsKya1zWb+kNyGNV+zEqiRBjNp7MCjYVY90FbYjQDuko/YBGWqrRXaG
         Mt9+xPl1Q5FLyriOdi1uSIuVZ4WwI45zEyza3rbQbMOBNM7WqglRLwnNWBBY1IL7nq17
         U7wwI4m2FQqqqpFvUJpLjCxnn+nk5OGUGiYFfkhtpcRGyzpHYSUHBnq+uM2k8vOOyLNK
         XTjsuotLANDZjxoDkriOPuVlUP+yL4YuJBgXICy3YFvDvtfbUXpR6OEwY5T99xmuYw4Z
         SvJW0Ijz1b+5N6Sttwf5FT9p+6IIfibOluM8+YEi5vX/9xNFuXrhxYxtT+l8Cc1CgG0M
         Gl0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750954223; x=1751559023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RO2tN+aSoxvaSEMRq7XEvMbHrJsjG9xLguEP52powFc=;
        b=K0BA954MDJCxCy8llu7PbubVTV+PFwlvM4JIPVNS+y6TrzyJr4KUejRX/fY2x3XjLD
         j4OVOpEusF65APqy4W1iJF5TZ44VlKOiITJd7YX26oGjpPyZHYUda/lDVGWOP88wyKLA
         N5w56NwRV01Bj9bEwxt0++UUG2IhBZGLtCvJ5Eq/inbJDuRQl0EjqwnhOHoBC+d714mZ
         XuMNGGUOrAFlU4XiZNTXcWNgdkdy8ij4CelJBZK0B8yC0e9jgagxvK0w31Citozyjqyu
         i2srWcRfoZJr+Y3YYIxyBJVzBAkuWIJwH/pBi1s6KDVemOmx92cNidteRMkZMp7yOqTP
         tOEA==
X-Forwarded-Encrypted: i=1; AJvYcCVifLCzXT19hqnie/zB2DTWaIKBoj3mAcRKJV13a/RlHLTQSZ05defQmD0gl5fJ+z5xDKOOecBz51YYEZ4C@lists.linux.dev
X-Gm-Message-State: AOJu0YzlikbEqnPH7Aea8RX0NeoKQXQsqg5mQkITbri0gcFxFSMTyFrK
	4xQaH+Bhq69tlWfApscK/XcbmIOEX0e84njaO+cDSu6/mx/CDn41tdwM
X-Gm-Gg: ASbGncsuLjYvC6/S8mI6NkZhttcyQC85vz0tUlppapRgbCzCLlx3UeA6aeRKLiskMZT
	n+5+Gk9XIptLdq1eW5jya80M/NMUfu56vC9GIicYXZTJA+mY6dSTIBdrLHKLvcAxMRDhTDD0UR/
	uaOVMTdMS/8et8d65hjN2L64lYAqpMbOFuOcv3xH2ZAiLrq+oae91GpqcW0gthP1lzsNISX1Ltn
	tVTstr0GW4vZd1Bv3VyM4yyirLcM+5NzkEWva7FYv2pagXd5plijPnyr7m2HBqbD2RiTm4qrMhL
	R5awelnK3klsMAOWUNLs+j0uO8lkKgKdQp20XlLlFZIbNv/JItE96C1H8lYSoz+czA==
X-Google-Smtp-Source: AGHT+IF9+/ylR0X0zs3Ub5Nxn8yMQupY0tyd0iZN0NmSeaDh2qSacydKHfMjG6bR6+uLmMbB2VYVHw==
X-Received: by 2002:a05:6a00:3c90:b0:748:3485:b99d with SMTP id d2e1a72fcca58-74ad45abe59mr11562215b3a.18.1750954222499;
        Thu, 26 Jun 2025 09:10:22 -0700 (PDT)
Received: from icarus.. ([45.64.160.138])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af540ae36sm114168b3a.14.2025.06.26.09.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 09:10:22 -0700 (PDT)
From: Pratibimba Khadka <pratibimbakhadka@gmail.com>
To: mchehab@kernel.org
Cc: Pratibimba Khadka <pratibimbakhadka@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] staging: av7110: Replace msleep() with usleep_range() in tuner function
Date: Thu, 26 Jun 2025 21:53:50 +0545
Message-ID: <20250626160853.8772-1-pratibimbakhadka@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace msleep(10) with usleep_range(10000, 12000) in the PLL lock
waiting loop of nexusca_stv0297_tuner_set_params().

usleep_range() is preferred over msleep() for short delays (< 20ms) as
it provides better accuracy and allows the scheduler flexibility for
power management optimizations. The 10-12ms range maintains the same
timing behavior while giving the kernel scheduler room to optimize.

This change improves timing precision during the PLL lock detection
phase without affecting the overall functionality of the tuner
configuration process.

Signed-off-by: Pratibimba Khadka <pratibimbakhadka@gmail.com>
---
 drivers/staging/media/av7110/av7110.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index bc9a2a40afcb..7f6c610579c8 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -1827,7 +1827,7 @@ static int nexusca_stv0297_tuner_set_params(struct dvb_frontend *fe)
 		if (i2c_transfer(&av7110->i2c_adap, &readmsg, 1) == 1)
 			if (data[0] & 0x40)
 				break;
-		msleep(10);
+		usleep_range(10000, 12000);
 	}
 
 	return 0;
-- 
2.49.0

