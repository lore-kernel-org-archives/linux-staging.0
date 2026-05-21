Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D693101B6
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 21:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779397578; cv=none; b=hSA3w4wKnw7qXO/oIPRpgpCxiot9JAGAf1jScZsLi02+kSHQA2Pbi4rQnSyLK58WjHeHS+dDs/mM5s5BeUmPKWabQa/SKtK1FCPUloK6Pag4cagiMjCZ1Li20YiJYV9KlcR+wC8oGDk3is9CGTVVjVu7cKDYku+NxUg88t8gyXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779397578; c=relaxed/simple;
	bh=1uhEEK98nunvnkkFu5cl/S6f0C3ToIAbTXCG6iyCI+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KaGid4EoJ+cKxdT2NSwqQWa7aq7Y6sOGVuhfiEDz+iAXARW3HQQ1KLvKXb2fYK+9llGQkoUoilbI+KJUGIdjl7VOv+vxsWMlDfVDfB9lpkFbkKEiafV1BICL5XI6MDzqe82g0yGZd08quuaKL51JCimFVnM2JB9uNfPG5rD7evg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V748ewwa; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V748ewwa"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-484d3c0855aso2643699b6e.3
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 14:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779397576; x=1780002376; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LupQ9aUXS/2zk9VeUz06e4gA4DsWebDm6OAqQ1TQUKc=;
        b=V748ewwa5cRwKzDaWLHgp6SxR4EgtpQZ//lRoSPKZhfcR4UMaM9E1QMHZDJOUptVIl
         J5P5syypIHXTfPR8efprhusCFuK4sy6GymGUwD0iK4LXtEdhwGaZus4/EpFV05gJhgNU
         1MXlmdOZItNyHIHWVDniJhhgtVl9zjL83wT4zQ1PyqwwUnmn752CwBH8PZxAlE4edCc5
         XqNm2wZKzI7hUskVZRhKSlZbhiG1i/HmivhT+1A0kgdCD73yZ5gh0RneQ3X6gPN49rh3
         nig5yxA7W5iteBRXjCkBAmIAqXh6jBiqp/b6NkcPZ2sBx5QdMNqhr/c3B6bRXoU3iFA7
         2mAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779397576; x=1780002376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LupQ9aUXS/2zk9VeUz06e4gA4DsWebDm6OAqQ1TQUKc=;
        b=iwEHa8oAEnHO07tOIaqAY2x4jNEMzjthMJRODz0UOmXdwD4iQKMA7bMAMzCJRfGJYy
         rcnpEqzlri3alqk/YnIHLu5MV23slu+TQo6Jmh8BqplFgpnPofdp9Et09ez7MPoGBlVS
         WLGLks3yD4NaOBD4u4BoaPPH1MmZcdXRQd9nanqdR1Eqm3L8j93NDHxJLC8MXfj+Snva
         MTn75yYTSyU77vZU3/xqeJWl4L/JXqU19hcOqkIQ4rZqArfq0Q0fhJCmuSgFBNZz8lgW
         Bg3opt44cm03Xm4crtPcfZLt+dj7umAuPgl0XTHyO8/batLC0vgAJ53kZ4WnS7o6tQXk
         uguQ==
X-Forwarded-Encrypted: i=1; AFNElJ+M1yrP5+0SPjRl3JhakU0vdhh67ASVF16CT3jQ3bTaU4y2d8Hfv7ht1FtRIqIrnn18xlEYCfsXenXzyQsh@lists.linux.dev
X-Gm-Message-State: AOJu0YwdtpE2z67vkLfuMvWJQ7JWhmAcfZyVSHZhfgJZwn3srcW52oRk
	juIkAu9WwGCwdB4k9Tz/0OEgAwuPPPs6xTkLE59Q/G14d/COE9XjccMY
X-Gm-Gg: Acq92OHH7eyhviASDQcr+f8D+01f4QilbOEaDaIt50kTIpx1bP919xu4dpH0UfPEOWG
	qPet39VRY6+IoVmWoGNf8+hzevMsFNnrA5iuDOO21ENuFvs3vwulzrqd+f92S0wrvP7c0BPnM4G
	liXGu3kKz/kXq4AomtC87EXjvFnQajmEVgh4bZLMs56E7E6JdSovkMpM27ocXuocjygAExotJF+
	RL+H7TKCDg4B+IesACw9R3pklHOZXb2aZdimLhHsDGh/0qMADjw+0qMqFHmjtSR5xW5QAViqHM2
	FreNnJSRyyEAMxon7bH16FNPDdba42FvSm/rBHXw3DPEVX2biK33mYeoNlMcPYuKU+ljhFwfxFq
	XujujAIuLQslqDcNgH168lhPlu9zaew+2+LUzzyAF6n+DM3gO5zDBKrbnuvT+sYigbkOJ8Ac4YV
	+Q6eFQ9cLRsv5Jhh+QOUGzUK69hNFC1OA=
X-Received: by 2002:a05:6808:11c5:b0:479:fb8d:dfa9 with SMTP id 5614622812f47-4854a278a49mr395826b6e.29.1779397575760;
        Thu, 21 May 2026 14:06:15 -0700 (PDT)
Received: from pop-os.. ([2806:264:548c:885a:fb25:8a80:d99d:260b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-485431776acsm954022b6e.13.2026.05.21.14.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 14:06:14 -0700 (PDT)
From: =?UTF-8?q?Diego=20Fernando=20Mancera=20G=C3=B3mez?= <diegomancera.dev@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: m.steinmoetzger@gmail.com,
	guojy.bj@gmail.com,
	straube.linux@gmail.com,
	error27@gmail.com,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Diego=20Fernando=20Mancera=20G=C3=B3mez?= <diegomancera.dev@gmail.com>
Subject: [PATCH] staging: sm750fb: add const to g_fbmode array
Date: Thu, 21 May 2026 15:05:22 -0600
Message-ID: <20260521210523.133725-2-diegomancera.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521210523.133725-1-diegomancera.dev@gmail.com>
References: <20260521210523.133725-1-diegomancera.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Diego Fernando Mancera Gómez <diegomancera.dev@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 89c811e0806c..8f533f3b1b42 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -21,7 +21,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel __ro_after_init;
 static int g_nomtrr __ro_after_init;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char * const g_fbmode[] = {NULL, NULL};
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview __ro_after_init;
-- 
2.43.0

