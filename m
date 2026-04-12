Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FA537F750
	for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 20:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776027160; cv=none; b=u8G2yEO+vCSkKzoDAliVgUltu2N9yySO5sTGmzwiRIkOFHnMV2u/XfdW3jAT9NaPKUpRPcOD4moC0UDPFOeWknX6fUw6Z4tnoYaSAEe3CEUHwCUIX5X+BvHI7IDp3MLjTCKOxRX2mX44LM5A/3CZIDyU1cF/42GKKhdne05nKJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776027160; c=relaxed/simple;
	bh=nIUuhPo14Rb84c9rV0PW6bxTvbOBeIThPmGOtOwZmx4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I5AyM0SR6Y0WhYwBCRs04sPVoWASBzV2g71AlQN0v4oBfBCM+MD0uh/vWlj7vbhDwwFjlTNUcEDmX5OzphCDvoAk0oHELSGx4omooeQXav11mgQLojIo/n3rhQYbFegMzJbWxClYHU5FUeN4/DMAMGxntDvouzV0j51McNA+Wfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TT6YiI+l; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TT6YiI+l"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-66b2d49ffb0so4771462a12.3
        for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 13:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776027158; x=1776631958; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mgiKlidCsyHiOBrFB0tntTy3c+WIv2+mYS1vg1TsEJk=;
        b=TT6YiI+lVR4m61bNbK6jCCYN+cvPMNsXMDok6xOwZ9VPBqk81uOdhXFyi8vQJgsyIY
         P8gB0MeCYsSoG3rvcwEaP5jNfC/kcWPRlvacLeN/Sjynlh5Jj3KD3qH6TbHgl0gabN1X
         Y0C0vrL9yLGyRxNkvy7laswoLhe50ns4rSTlv2k/+d2vIQRXE+EowLzF+8RDQibUuxoM
         jGVTaUV3Qnjv+SGjlyGRxJWrLU59knGsQ/wRQn8oLSG/kBvljY92hoJIQMVItvbT+niJ
         YZirhQbi/88xurkaUiSTloR1iKonNIHYEvqPBt4RLnYSzBBN0xiUdBoB4qvKl+bipGwW
         2bWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776027158; x=1776631958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgiKlidCsyHiOBrFB0tntTy3c+WIv2+mYS1vg1TsEJk=;
        b=KfD0q+AoM1VZagKaU6JXypsllyrJwMJtLTNrOHMDm+nuDwa+JQveJSI7kA2ka4W3Sf
         Uf+eb+ib9WQnw4ngYGef87Cyeo92BEYZDP6LFaBRn60JI+ymzKTbOhDaqfEBoC4ivW+e
         aQDtLxWI9EYDO73rXSJaLPf86ZXgv3lUKURYWwsvrQBaYEs/QVwe89rtm3J845Zo5Z/i
         x1UyuBFi5teTUYdbTPTYKHfRzOJhDdKhKqdidlNJ8W7cfKamSV5+kXGFB/HI0rji+j8S
         Tw8z3YZDLnisZUSY1rfLP59eP1AVbhKQcUXVe6zBtkdoIZumnKnpiW7YB/YK7VJiaeJv
         morg==
X-Forwarded-Encrypted: i=1; AFNElJ/T1aYnrA3ZSSm+ZfB7LmwKkC8PfKpF3d0BWC8cduY3IJ03qEifpeY9aHontfCmgKNcBrUafeoycPD6FYS1@lists.linux.dev
X-Gm-Message-State: AOJu0YzcH+MWtVchdcSQRZ5KRTrf3sNRgeXWysFqyj7qhmRjK0C3rYmB
	Jyz5rfpcWLuiPOa59IjNdfF6gc5GdYekswdq4xL/MhY9f6AVkXeeDES5TwaiGsavFI0=
X-Gm-Gg: AeBDiet1I6l2oXmvDe8I+PL6bccmQVkO1RcSz7cJH5PhjqY1u8zhPEYciPH02wl+vFD
	EgzaOOlMEO/Tj5rl3nmAxyoCsotHaYq0yUNvulMN2RePZBLTl461mJbSmSPEDRrzlLb6IzQKY87
	k+0pYCFXb9A9X5OavO0VtnawXM1YpgAgsEc6nvmMPatTt6sPJ7q9F+FdpP0MBlUTpPI9PuJEhol
	CAMOWatLWXgf+TmdnmWHgQMEyxVG0dOG6760Z9XuhY2bP4Rfl0HKtJD6ANfaIjtjyIbUxcXx/cp
	ZM9YcaT/iWNAhiMrQMrReSsFU9A6I3Jl0via0dQ6c8HXCp98ls2kNIL24nqlB3yu399NDIUK9uf
	/kYzDxrcvVLIqrJASyvZG9UjDeAgTtNolzVZqe9QlFfry9IPdabvx2QXL+s56wHMUbd+/gfcfql
	usydjpTP1SJSUbQQ4UdyO84ML69KLjohaMsiNZTfZhn8e+ZFe0tK0+nlTPbKFB6+a/nbPZLitt/
	iKfGcu2luAn+3J4ZLmUo2/Wt9DaDXGfE/dZY73cEeM0mXhPKOA0fsvwBw5NDuokcLLcUi63HJCu
	qYqNJQ==
X-Received: by 2002:a17:906:518c:20b0:b9c:7748:a26f with SMTP id a640c23a62f3a-b9d7260e086mr457213466b.17.1776027157563;
        Sun, 12 Apr 2026 13:52:37 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6de97e36sm265193866b.10.2026.04.12.13.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 13:52:36 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: linux-media@vger.kernel.org
Cc: niklas.soderlund@ragnatech.se,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH 2/5] staging: media: max96712: add NULL check for of_device_get_match_data()
Date: Sun, 12 Apr 2026 22:51:08 +0200
Message-ID: <20260412205108.387023-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

max96712_probe() calls of_device_get_match_data() to retrieve chip-specific
data from the device tree match table, but does not check the return value
for NULL before using it.

The pointer is dereferenced later in the same probe call via
max96712_mipi_configure(), which accesses priv->info->dpllfreq. A NULL
return would cause a kernel NULL pointer dereference.

Add a NULL check returning -ENODEV immediately after the call, consistent
with the defensive pattern used in other staging media drivers.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/media/max96712/max96712.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index 0751b2e04895..8a65c37ac739 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -416,6 +416,8 @@ static int max96712_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	priv->info = of_device_get_match_data(&client->dev);
+	if (!priv->info)
+		return -ENODEV;
 
 	priv->client = client;
 
-- 
2.53.0

