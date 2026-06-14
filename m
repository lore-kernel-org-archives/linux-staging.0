Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D822848BA
	for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 20:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781467723; cv=none; b=QHYyTBhmGJ5I/l5tf+sL/HvUX4vtPVXsWO6gkUgovg1ue3xMSANGT/6wp/Pi3rW45PHxXKIShWQFXfZPTGtDQsmfcSkhiJG1yujo8wYpcDMgNHaIsk/8GJkCdTxZYXy0+NBDdzo/1/8s4CPVhkb0yOnIX+ZncKk1kGcILKFfhzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781467723; c=relaxed/simple;
	bh=t9hJB0O2AbpQy0bG9J3Vr3qulzMoJf9YIfoqR60+/aA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A/YIk7Gg5iyGPO74LaNXZsgxFqHFQF87mlDPWXwA7l0MAgUgRr2ohTnvDkSAgY3KUpf0WiJhecakHxNpfECBChQ61SXAX0dMPwZQQItwVtJ9FBbwQ8dfZoZ7YT56dDMUNx5biEcFRV9SLRMVhDEi2H6lGr1Dkc0PGYu51k9mlS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=adFaSFby; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adFaSFby"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8ccda0ac4fcso29975646d6.2
        for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 13:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781467721; x=1782072521; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Qu5+bIQSk8l7rGQCe26ymBQKDA4my8QPuaUxaRTH6o=;
        b=adFaSFbyZGhBr9VkbhV4GmVWfKRMb0miOIZi/laol+hzgy+BzJKMcPEx8UwZDPaLEZ
         aQUtcVqmpCypfw9V3j0/Ic2evretlpQSsHjU9DOKC+SD5+MjH1bRrbAVF/QpuZgYypzo
         cjTyi7kWi5hneoPs2KHWw44H2wKE5klJJ5CqLDxGIQ91u7AKBr6ShM4ty79zzwlobw1M
         4Kp0+SGiR4OwchWl2L4+gsNtoG8WZsHCaFF5dNYQCzR9RUHzugkJ0SJS+g8MQ6RBoYVL
         WNGPlCJYi6N4eyMeVoMvzpCXd7sE65RGTsnTYHJTF3+ha+cIWXPmO3elb1SmjIax9ZvQ
         Dq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781467721; x=1782072521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Qu5+bIQSk8l7rGQCe26ymBQKDA4my8QPuaUxaRTH6o=;
        b=gMdSdZbRGvyqFbCC3kHYCfodxv+MPbeWj8kTZpw3BKrry3cTNSKRoN13dlfnul+wwQ
         FNjdX2WxXQnOid87dmfs+lBf/rkmuHz0cuBye1l647nCAAfMIrist+upqFcc0NUAzvHV
         FytWvHTrBAv5JlU8bpyMly1+FPsQ7oOV9vRwDpOzUpR+bueK8uVt+yil+kwFs03eZWZm
         A0kcRs1tesbf29jvcicZMcZaOKvnBPFP79AfGbryPOMTLsu8a6Hg7WoOPUdhoD1zttHe
         01gr4pbAZf6I6Iots6ChMa5rxR0ct4bWU5atytcc1XCacx/zyXuRUWk/kx/iuUiap9SP
         3Zkw==
X-Forwarded-Encrypted: i=1; AFNElJ/vwTVJRaNdCgXev9BSWs8R4dDyoYMZr/vSfgsvE0DAheEFOvaXYYvEFmrJQ2QNhYTA2CPL36L4qiuJ4x7S@lists.linux.dev
X-Gm-Message-State: AOJu0YwqkjTciqSmGy8IburpoT9BY+bLGOa6nKYW+TmhBqfUWoFAMTTW
	bvj+fhcBFPEUhLYLD8g7kYWeb9m2XujXS0Ln0eNC2PmcvG2xDWfir6Jd
X-Gm-Gg: Acq92OH8yJiRdPjEO3VWLrxAixArh7+wK879AoEMDWbeCFb+n+IOe7AeMvfwyuf+iYn
	pZWvBEC+kg5bTN3O3E0hpir8R17NxATw+5nK0Lk7qYVW0gW+YcuHo8fcfw3sntx87TgX7BnZFjS
	Ajrfz7WUF3M0zogXobMpKOglRQ2aqhXTkgJlkVsepvRsQe6FJq+CYJcl/IANhEcA689guN7f1u5
	tlBVQ0Z4ai3wIz1bioPJpD2mb5KdQrd8ADeXVhw6Xcm9L+QLqRn5JL8j4hde3kivRAoYedbl49F
	Z6LYEczDemYb4Fa7ols+vl7rqm6roubmMOyzHlrJhewXxAQYhjVjzvduk1AFCUdiwcqODKSb048
	kY61kMGBUAhkDZhOeu6qhC6pnrK6zcan8VOh62mKEycVW9QUoIcqfpjpfBJNEBI1sHkNE3gVHsT
	r+vZs8HJzQEk4XH7Z8HXANh5DkQ+mU2sFuOPZwzw8ZqXxqSvNSXI9KxEc=
X-Received: by 2002:a05:6214:3189:b0:8ce:cc38:e496 with SMTP id 6a1803df08f44-8d32e30f3f0mr196398416d6.22.1781467721402;
        Sun, 14 Jun 2026 13:08:41 -0700 (PDT)
Received: from localhost.localdomain ([38.174.6.30])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d300f6af40sm90192986d6.8.2026.06.14.13.08.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 13:08:40 -0700 (PDT)
From: Keefe Reeves <reeveskeefe@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: abdun.nihaal@gmail.com,
	error27@gmail.com,
	chintanlike@gmail.com,
	namcao@linutronix.de,
	niejianglei2021@163.com,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Keefe Reeves <229415268+reeveskeefe@users.noreply.github.com>
Subject: [PATCH] staging: fbtft: use %pe for backlight errors
Date: Sun, 14 Jun 2026 17:08:37 -0300
Message-ID: <20260614200837.17908-1-reeveskeefe@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Keefe Reeves <229415268+reeveskeefe@users.noreply.github.com>

Coccinelle found two places where backlight registration errors are
printed by passing PTR_ERR() to dev_err().

Use %pe instead so the error pointer can be printed directly. This keeps
the behavior the same and just makes the error printing cleaner.

Signed-off-by: Keefe Reeves <229415268+reeveskeefe@users.noreply.github.com>
---
 drivers/staging/fbtft/fb_ssd1351.c | 4 ++--
 drivers/staging/fbtft/fbtft-core.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ssd1351.c b/drivers/staging/fbtft/fb_ssd1351.c
index 6736b09b2f45..b6cb60f20b11 100644
--- a/drivers/staging/fbtft/fb_ssd1351.c
+++ b/drivers/staging/fbtft/fb_ssd1351.c
@@ -218,8 +218,8 @@ static void register_onboard_backlight(struct fbtft_par *par)
 				       &bl_props);
 	if (IS_ERR(bd)) {
 		dev_err(par->info->device,
-			"cannot register backlight device (%ld)\n",
-			PTR_ERR(bd));
+			"cannot register backlight device (%pe)\n",
+			bd);
 		return;
 	}
 	par->info->bl_dev = bd;
diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 3da42c8ca6e3..b6a846ada3e0 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -187,8 +187,8 @@ void fbtft_register_backlight(struct fbtft_par *par)
 				       &fbtft_bl_ops, &bl_props);
 	if (IS_ERR(bd)) {
 		dev_err(par->info->device,
-			"cannot register backlight device (%ld)\n",
-			PTR_ERR(bd));
+			"cannot register backlight device (%pe)\n",
+			bd);
 		return;
 	}
 	par->info->bl_dev = bd;
-- 
2.54.0

