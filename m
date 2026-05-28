Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C9F3E8330
	for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 13:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779975420; cv=none; b=isXpl5WV8N7rFyPd0G4owA2ywos5m0S1o5dXHUZbiiHjSj3KStS9WU3iUTrc2Z1yKVFKYNnSabzDxr6UnVvoaQboEy0/NXIPPsGORnl7Cwd925Ry3HqTXH1PQcxbKOO82vq39qC13Dr4FOflNDhrdjwlcg6Z8ujwPfd5rJfD1sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779975420; c=relaxed/simple;
	bh=1+sJkp3JF70DVYP25P+ln6YCeKtna0Et4kJeHhu8DTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XjEihAqt8aUqt8qfh9HUfB5FmhCJ9wFzXV+ZAiKlVyrT9f/lPilD3haGQcCY4mpwPvfEAefB9iriijfBo6pezp40kSpZPRGcSzIgLo/osILLhskAvmZpsCOH80nkB9xg5DI5bsISGv+04vsCoD07Lh/+ZhKDMwN+00cqez2+yOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jtCj/kL8; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jtCj/kL8"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ba4a1a0325so86917255ad.0
        for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 06:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779975418; x=1780580218; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t48DyodwJlxPQheligpryTlIvAFX3VKtkm/H9IvDGZU=;
        b=jtCj/kL8jvS0rTnAPJSRw5WwJ6XPTM3ShhiuJGrIEpLRzWl7yvfM1BMq82UtTlBp5t
         qOzsDVK0ZCZ9ZFvNwzTMdSLSIXhxFC4AO1XTcPebO+I2Y0+eAeA0g40wvGDDsy2DvJzF
         Yy+eJs3aiSV/XMXPG/h0VIhWdY4QO1RoBYx2gYf8DfeKGVp+ZcItkBvOWe5ZLEQpkGwB
         VAoctucaP3EjIt3Kr2y45Rq6Qnctk7SskUeYryuAq4iC3Cm9iab82et9OJdvgDfus9pS
         xvuB5ti/LqcspyHPLyBh4TZIJM5xokq81rTQb3ixxbAAEAqxt9qK8JvrRIhREKslDayz
         wzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779975418; x=1780580218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t48DyodwJlxPQheligpryTlIvAFX3VKtkm/H9IvDGZU=;
        b=nrrUeV67Q9GuEUkuQVFb99t/wYUc5OMHQn+Duc4jiy7OPFKUs6ZNoxI3qcn71nHV89
         IqZ+B7T4J3tU0YkrhNlx1+PTb7apDBlhqYiJHLH1MvAzWO0iHrApr5JmqWivPFB51R2L
         UCFcuxeChv2zHl/ZD7KE20c89EePyZpcwIo8tj5aHwxHcY7D0vT7PGZbYXo1T6lhym5M
         lz1QIPW58KA/5wshfAdaUkSZf1VWEz1vGvsN11vBgY03hJtN7tuSOGpCwa2OwPkgYqA1
         DnDBbD/eA9PIwwnNTZPOkhHlrNiy68ol8YSaiJOkXgYizpvyin3dpbABkzrpblrNK+Uc
         Vs1w==
X-Gm-Message-State: AOJu0Yw8IUyItl/j4vUS+myqj5vqXLiPhkScukk2GkT4QSYDGTC+tNYH
	0p6MYHYHM9ftFBbAKGHukbF/I8Tr65xrcUcvMaQtIK6TqIDSxqrO90JP
X-Gm-Gg: Acq92OEkdOSeRSverM16kiDkUEkkTZgaK4du2/usAWZrQmnKnFGU2MiowGtW2YpxYxz
	At+quQlnEn+0IGxQC1tz6kT0geyLKYgOtO1wpd5YSw9wg2N3WfPNTOplWs1x0iM8+HZn8dnLdjD
	2sBN6p1oU24S/xFStlPKEVhvu6cwN8knXn7x+0ZBB7/irswfCroyy3QtovxGdgDAix1kPAm9X5h
	VSdxpm4AJOAXPXmlxsAL90qcxVtU6eE8bn4tTkEHAS9MKyrzrna1OJZk4tcOE5DD/kudAsL6R5q
	xRS+LnLPdkPb6QnZ6pHvyq0zZzv+epDuwTtdmp+svEjLjjyfS+ZIsdwRMebxTf7ioo8OTKYhA4L
	jZXdcr3oaTynu5Olg8V8m8RQX7KVUje4e6A6pMKr6oiSmE4BgpD7bRDNHyVuPvKaQfQa0rmDpy3
	qyZynhFd2meYFD2qPp0HisguPQFVLp90Dz
X-Received: by 2002:a17:903:f90:b0:2bc:dca9:f0ef with SMTP id d9443c01a7336-2beb0770a09mr321444295ad.36.1779975418531;
        Thu, 28 May 2026 06:36:58 -0700 (PDT)
Received: from onish ([2404:7c80:75:55f3:d423:9757:6acf:6ef9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf13d83264sm8696405ad.17.2026.05.28.06.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:36:57 -0700 (PDT)
From: Onish Sharma <neharora23587@gmail.com>
To: sudipm.mukherjee@gmail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Onish Sharma <neharora23587@gmail.com>
Subject: [PATCH 2/2] staging: sm750fb: rename setAllEngOff
Date: Thu, 28 May 2026 19:06:27 +0530
Message-ID: <20260528133627.10850-2-neharora23587@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260528133627.10850-1-neharora23587@gmail.com>
References: <20260528133627.10850-1-neharora23587@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename setAllEngOff to set_all_eng_off to comply with kernel coding style
and improve readability.

Signed-off-by: Onish Sharma <neharora23587@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 drivers/staging/sm750fb/sm750.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 8f01b3c63fe8..716a8935f58d 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -848,7 +848,7 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 	sm750_dev->init_parm.mem_clk = 0;
 	sm750_dev->init_parm.master_clk = 0;
 	sm750_dev->init_parm.power_mode = 0;
-	sm750_dev->init_parm.setAllEngOff = 0;
+	sm750_dev->init_parm.set_all_eng_off = 0;
 	sm750_dev->init_parm.reset_memory = 1;
 
 	/* defaultly turn g_hwcursor on for both view */
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 0492b1afbb11..e8885133da2e 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -44,7 +44,7 @@ struct init_status {
 	ushort chip_clk;
 	ushort mem_clk;
 	ushort master_clk;
-	ushort setAllEngOff;
+	ushort set_all_eng_off;
 	ushort reset_memory;
 };
 
-- 
2.54.0

