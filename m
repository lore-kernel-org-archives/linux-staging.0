Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB592F851
	for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 17:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776014687; cv=none; b=KMKjBpQabixoFIlMPx6aEl2WL+wyYQMLNGOTp9xZh20LzQF56dGmFCvD9KnefpfYwTulXkmBaHCXmQ9Gdh61BZvEBGzZ5WFJIBWVAKSupaLffPiiU5JR17CLt4aLT1G0Hu8/PV/9pJc1wIz+qFgLnqyVM5KDdr9hIsKXwihrUyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776014687; c=relaxed/simple;
	bh=LnP9ZkhnHG1MxUGh8a2gUL2fys5g5ptWYukCv+33FPM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rREXFv9BBYcUP2ZueoyWlm/5Ro1vZAyItWqu47g0DO0reMZqa/8QKg7zuGthWg1NEbbMj1E6Dp/RdAD1c6wfoA/OElfPWxVLd6/fVWZ94HV/FDtliV5wQNnPZ69Na16w1QCJhJ5bV3W0p5XpeyRYzWC2u7AxQAMPHgJzATtsNmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c02bCgav; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c02bCgav"
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-2c15849aa2cso4333370eec.0
        for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 10:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776014685; x=1776619485; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IqDxjqHmcb6xKt99g2eKfC+2hdNdKPlT4sR9OKTs9UI=;
        b=c02bCgaveo/RMHvCEiqmDLI59MU5oyBMYhPBBr+Z6Vpw4mwsSL9uL/owoDBvQw15f0
         RHfFmRPiktZkyHpSa8zrOtVcm5BtZhruipQOBbxmvlm01/u4z+VX/lpaxwKMq8sUdVro
         KyP7GAr74GQHaVSV5kQ25Dai+RTw0nAP7Rl4vhL4r97IlPIknFPxoJaGu5jPBJFlZtGP
         Un5h7+YQkHoRp0Zr3UyclBNJTMnWcfvUv+9rOsIPDXFI+wyLJT5ufGsm8mrN+HQNIkJm
         o0fO0mGNbrSXJlXU1up/RBJVww8J02HwCdK1iQbs8gJa+o3rQ+4VKpT7AbRjx8PFDvq6
         yP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776014685; x=1776619485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqDxjqHmcb6xKt99g2eKfC+2hdNdKPlT4sR9OKTs9UI=;
        b=MVluLnNZRJNoDWAVqg+9zaimNlkcccchIetb5TKOQ6Zc2BDPdCE2xiXxZapgbWr98e
         cxBhTnwAx4WvYspYbEmA5ZwolKqoVk7T3HbDdd68BPL3ZHTRYhdQw2U5ZpgFTheHu98d
         GclNvgv42LRB6UHfXrNfRb3r2WeECDfu7xpoYiglmlTuynqN2x2YKT/gLZe+0pPGqHB8
         KUY+q/QVfcPRmK2PnUlIUq3595iMswxU6tPtcpbyqsvZGny23uypyHWPqXnIfECKcYDF
         JyEBMYz9qVgXPfSQ55CUybRZ/tdJfiFkGQG6/T8mBg4hxtklvurBGeNwppN2TMHMneiX
         Vp7A==
X-Forwarded-Encrypted: i=1; AFNElJ9zEpe1lVvTL5d+6p37332R1fAW1pn9PFYBfD+QNz3XoOxofPNGHLtnc7bzG3Ooo2VDb53yz6qdGPdghlnE@lists.linux.dev
X-Gm-Message-State: AOJu0YzQUkck5m276KpT1fCLwXZLTc4eMq6l9ZvdW/MP8gXH6D/ZpgFU
	tCKkZeBL+MzW8Fnku8gqICJD8j6I79+Ku8S4shu5GyqzvUJDAriPXIXP
X-Gm-Gg: AeBDiesEPvVIah0j06lE7CPUsNgLJonWeHsEq6WlrOA8sbXp37KrB3idAPdSguSMEgN
	FYaV1VFlFwxbVh8+MCqB0Nun35sjdartkPc2GxegP46tWGLKfuSa9kciaQECb3ZOClbVE+jZwhW
	4UK4vgUtFh5pn0fPKTKdxxPdG/zj07O5nCIfSj3Fn3p3qfvFdEty7BJSxYTXt9nmCJdwa7xyZEU
	ukhW5GF3j7LRDT5TZOAIPgbXmxFUcYB6Sd84gbmb7CCHg3TwakSW6ZAwcAkyZQZ5hLCZBWwISrh
	akmx+HcdINECbKMXQOKOHXgeoRcbtUJQGA0W/QOWUFSEbAnbonV6IUIduD6kzJwIKMry/5gMHNs
	cOGcu7mzklNtGJvo+fl5I6rFxS59aO0waCwQ1s7c95q2py/znc4Jgr1/lAzlQzaYvNu/ghvU3ew
	aqtkKdjmIqCGrLa4n8U0ghhAkUqDZx6F5drns1OrAk3+KylMIPUZryVZI=
X-Received: by 2002:a05:7300:dc88:b0:2d8:c484:6b6c with SMTP id 5a478bee46e88-2d8c4846f3cmr799968eec.25.1776014684774;
        Sun, 12 Apr 2026 10:24:44 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d80acca4c5sm5618864eec.19.2026.04.12.10.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 10:24:44 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] media: tegra-video: tegra210: remove redundant NULL check in dequeue_buf_done
Date: Sun, 12 Apr 2026 17:24:16 +0000
Message-Id: <20260412172416.33052-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

list_first_entry() does not returns NULL when the list is known to be
non-empty. The NULL check before list_del_init() is therefore
redundant.

Remove the unnecessary check.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/media/tegra-video/tegra210.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
index da99f19a39e7..a6606768fa03 100644
--- a/drivers/staging/media/tegra-video/tegra210.c
+++ b/drivers/staging/media/tegra-video/tegra210.c
@@ -362,8 +362,7 @@ dequeue_buf_done(struct tegra_vi_channel *chan)
 
 	buf = list_first_entry(&chan->done,
 			       struct tegra_channel_buffer, queue);
-	if (buf)
-		list_del_init(&buf->queue);
+	list_del_init(&buf->queue);
 	spin_unlock(&chan->done_lock);
 
 	return buf;
-- 
2.34.1

