Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D3326B2B0
	for <linux-staging@lists.linux.dev>; Fri, 19 Dec 2025 06:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766126065; cv=none; b=a/xITbNdsk+lUgPFmMAhbckHZuG7YBVN+4bO/i7prd6VmlPdB+auOUSd9GynMiKurPwh6+ckv2XIDmgygYx0YpBdPVcD8XJsyIuFyP1zva+74bz92E+XB31BKWtH4HWuXS8qNp2Sv2kJAj0RpvN+m1tD49Qg9QPl4hr2QZwx+RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766126065; c=relaxed/simple;
	bh=7iDR8e3TeBaHyWqD+kkzzwHHw4yUuW1fbv1K+fMdMiU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qj/Yozdr7+9KUWTZMkuUVV7it7iswySCmdOVJeouEp9+AyK/loRsVwRfYo3g+7IcWQ5//InMYMeJn3Sl/6gAq7KBo5Bgv/jAZvxB2Lx7P/1p7lxYQ82ivXP5q2Wd0x2Of/mqG+UXODBpq5Z0n11E6tcDLTkCefD1p/PWfQUwlOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BBgBXXcz; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBgBXXcz"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7baf61be569so1649971b3a.3
        for <linux-staging@lists.linux.dev>; Thu, 18 Dec 2025 22:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766126063; x=1766730863; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PtApUwKq5LTlAZfiPhjoZp4RZhVCVrNP+ta/AnxmBAU=;
        b=BBgBXXczod/xQV4eZqM4EDXI2Z9vPSgTuag5COolbHH6RneSy0kr4S8otydv3Zeh54
         ELaSQuHumD3rw/Ka3Tv6rReXmsfnjaiCehZMjj94rNgyXhr8okwIHCnpErTRX8QoPvyA
         daSZYr2HA4eKddxQKuuWVGuzC+IEOfO6ereKRN8MW9xrLkt2lLbaCVlILqUxURw1FyEo
         Pxkv8EhYttOjjfBDF6BqVih4mpPvMyXrNhwnyVCwQeUvROaS1X/wJQAtvZOzQK7HDTZz
         yxGnGO0rQ3CEel9Q4l/sVqpI0JQkgz1x59be8aWlTaElQy2jkN8avxn9ByQY+Ry0tu9G
         5k7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766126063; x=1766730863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PtApUwKq5LTlAZfiPhjoZp4RZhVCVrNP+ta/AnxmBAU=;
        b=XdYYm4E8cdh3+ehMyCfWDQwBosAlPXCYEYQwfnDW75GkaYjYS+8SphfsF6HzvllOZ3
         y0/+WkvO34sIFQb+1hBkCBfVp2JmVUxXY2eAOLSthu7SQeOK8XsLL3PjsEFrKS7t0MoI
         1AJdTvR/zawjLUKThulS9HujFRFoXNCTgVBtcAQgtF3uRUEniSIF1/xvkLo9MP2eVlfS
         suyyCgU/4WPfP/H0AsddQPEubnGVAH3OJM2bPR+/yUpwTbvN0LeJhb+Y/cVlWmwADSPH
         /1y6bFs2RMHjd+YlNNWnpRogGDT9itEnLq81oafdmAS9EPY8wKhVPO31S06ydKCPyIXv
         wuDw==
X-Gm-Message-State: AOJu0YxXyO3iSUqyBcWgqSHTEpKsbiWlcMaTwKWeQMctxv/6//mC6Ic6
	JyiHOv7nH9fHInvZncrYSIHMdi/04Tj4UBEdcxBaS+EhxIIjCzacwqdfAEZiJLiQ
X-Gm-Gg: AY/fxX7di1tlu8w5Hx2GJHBorJ4mOb9x6s+nyI1VhOcejzpXtSgEx6aQvBHnR+d442i
	YRAXZDvvJiJmgm4IQJ7Slx6DuUN1UW8Q62LsCiOqgZr0uYkb+kPaBnej0tDy8KvtvgPNfJpFJqx
	lyqu64mkyK76c2VTEUwyKXQbz6aGvubpOlgxNqw3IJbKzSXmYM30AnI7wKNwEen+0ZzEAHVfoVr
	eQeH+l1XidS0eR0T0sjn6APswwmeWtLhSkGrpSeNGLH2cp8KlhhDBUixrC8lFwgBxxZYtNzhOjW
	0n5uX4+7R34Xkr5epxuJ4bREh+7JBZ4wmFa/oJex2buN8v94vncPZwBwtzSy2+7RDPvWBpEFzcO
	7QDyqUEMpE4GsxMamv0CMO9HbClvFT0PwToFOhuDMq/dJ4loscQJdvxV++2dsCVpjQTV125Lt/G
	9aT+mzVGAFrPRpyFARnLqr
X-Google-Smtp-Source: AGHT+IEBUhK2Xhd/vERxrRo3qb0qqafz1YfRLA38kwbJl4FPpUL8VK6BlUcPTMFVp3pKndE7f6Vc8g==
X-Received: by 2002:a05:6a00:f95:b0:7e8:4471:ae5f with SMTP id d2e1a72fcca58-7ff67456610mr1698594b3a.43.1766126063362;
        Thu, 18 Dec 2025 22:34:23 -0800 (PST)
Received: from DESKTOP-MOQC9AF.mioffice.cn ([43.224.245.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7a843a18sm1282071b3a.14.2025.12.18.22.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 22:34:22 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: linux-staging@lists.linux.dev
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH 0/4] greybus: staging fixes and cleanups
Date: Fri, 19 Dec 2025 14:34:11 +0800
Message-ID: <20251219063415.46818-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes several issues in the greybus staging drivers:

1/4  staging: greybus: spilib: fix function parameter indentation
2/4  staging: greybus: audio: avoid macro with side effects
3/4  staging: greybus: gb-camera: use BIT() macro and fix formatting
4/4  staging: greybus: greybus_firmware: fix long macro lines

 drivers/staging/greybus/audio_helper.c     |  6 +-----
 drivers/staging/greybus/gb-camera.h        |  9 +++++----
 drivers/staging/greybus/greybus_firmware.h | 15 ++++++++++-----
 drivers/staging/greybus/spilib.c           |  6 ++++--
 4 files changed, 20 insertions(+), 16 deletions(-)

Cc: linux-staging@lists.linux.dev
-- 
2.43.0

