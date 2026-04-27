Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E23367F31
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 05:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777268874; cv=none; b=aRj6dX82cmdITz+2XFV4or/f8u58nl20uaHTet5zMC0cVpXsNqPGy1IM77MleY4q3jdCQEjWs5J8yrFnZ1fSUEP9EhV0aWSsARtqnEh1l5MA3f8KSAeOmULQ6Piaj2iuKQziKR5RbZil5wrSUuXmLAM5m3lZ7Oz+XTHciPWDejU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777268874; c=relaxed/simple;
	bh=KkfNj1NQXDE3PipqYbJWPN/fNlYemAsIXaxfQeOJdaU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dsKzGTudN0Ozb3W3xMZKyRUbVxFXPO00gODDPLpXt0LpyKaeiDzsMZwveAVuqcesYbuzfq/gf1Y2XiNqtOXtLqVXFFbloKnJLdnkDMDG29Eg7XGbAFgV7XcMgR2/uSikMF9qu1m2fbUpRlvpGnZRaLsty6MXyvgSJ66DOzGStSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HSYZUxvv; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HSYZUxvv"
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-2b4520f6b32so13862935eec.0
        for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 22:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777268872; x=1777873672; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O1wx59qQpmYax+mg2eacWOTf08F7XgIOKeK3pBsh6NI=;
        b=HSYZUxvvS6tbQZnX1dQmD0nuTJl2ft5k4iG4WVM1sw70Ude0KmXBn9s4bnuzYT0b2b
         B2YVEf6cSo00ILG7Xb5G/HFOsYDruZ2v9zC1H35UAUDlaW6HrNq+nRIqjtPwb44Rgl+D
         D3DPpgXSSMRKA6V83DjtMqCOvUvEWC9Q5xA1sLWFtiOwaqnBezDMfWEb9ElVXM3YaFGH
         mGuPRxG1oVCkh5WXqFpYWerO/LqES0GZD9n05K8j3tlBu1uNm7yexY9ZkG9ERAvyKijf
         Xb6cf3UPOe+schCI2bQKaJDow/AOh0EdsCrU3EDIk1+wFzm7WatWLkJ2/peDiNMfoLFk
         6mVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777268872; x=1777873672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1wx59qQpmYax+mg2eacWOTf08F7XgIOKeK3pBsh6NI=;
        b=Ffdaw9CQV1WONnv0l8rk4jKYhR/1NstfO+WNEjzxPPcdgushXmT2vfIQRzHdgq3SaR
         D2JzHj5IV/zaQVotrL/0Zlzoiz+74BEmCTj495J/Zkj31nSlAVAQ4gkiyoX3xoxPIHod
         xcrB6yNvjCJ6plwHaRkZshP6wL9HaF3NWA+ZR8NA1ULcBpWCiJf2qRQjCKUZADBf9AKU
         p5mdOscG/o3GudC5l1IstsxnqPmtz9t4xkI15Fj2pEZ6s/QSRC7zsYv4s2KyIheWTQbP
         TQdgMxdFnWHFfkUQ/AnA0aZO/Hy6rJg7jtYMRaMeq277C64WOvVhuENWidNrL50c/dhg
         O3oA==
X-Forwarded-Encrypted: i=1; AFNElJ/xOd8lKXslpIr9MbKQ2hBxr6ZVC6a862EuYsy1BbSCigv4UHqJyvNtfB8FOeEDyOhENaYRPuE4BMWyqJxt@lists.linux.dev
X-Gm-Message-State: AOJu0YzkpMN169jqrIwWCSKap11GQF4gVWepkuQKDdYeOq83d3uxQjCd
	ZewUk9XBIHwK71Qn8nHHnybM7pEPT/qtwIyLcBQtYbxp0r+1F/1Dg5eJ
X-Gm-Gg: AeBDiev40qjMX0YjEMuMZETZeeWRNFlfqt7ZR1OT21kY7A9fNqVTzRzcIO/jvR9zo61
	6CY1ekM3xLiRcfktSY6XWA74fD8vturZ8nWUP2P9tGrf8DiUSWQxjiS03RshV4Xpk1QjoonbcwX
	VzY8KyIJxCh+adQbK7fCgwgXqzisxefxxRw+rxVNPpYStGEsxqdEbMaoAWirdzfSbv/b7O/BiQJ
	mcNwqOugXttnSQcxDyC4EzH9CMAb5IP0/u74TMVN3/3DgW8S2WKKu12wmsuCeEl8K225zR6WytK
	sSISigv4/TybMI+ekAkipwrCW65jDZEeM/QqLLB0aLdWFOZV97h3aggFqFGPU6rALk6YSbFIODY
	H3OM9r0qLqXwWImPbGpeXaq1tAeoDXhLq9qy/4NQf4EhQfzo1FqT97TlXIGPguTiIsN6WxYtgzK
	LQQ7My2BDLNDBN09Tb67311js7efmdkqBdvaqU19ezL3Yga7QdTrmN/qMwwJ5LvUm1cg==
X-Received: by 2002:a05:7300:8c9f:b0:2e1:e3e6:2909 with SMTP id 5a478bee46e88-2e465487fa5mr22396778eec.9.1777268872527;
        Sun, 26 Apr 2026 22:47:52 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2cfd3esm42350209eec.21.2026.04.26.22.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 22:47:52 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v3 0/2] staging: sm750fb: fix de_wait() return handling
Date: Mon, 27 Apr 2026 05:46:55 +0000
Message-Id: <20260427054657.758-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series improves error handling in the sm750fb driver by returning
proper errno values and propagating them to callers.

Changes in v3:
- Remove unnecessary comment in sm750_hw.c
- Drop unrelated comment formatting change in sm750_accel.c

Hungyu Lin (2):
  staging: sm750fb: return -ETIMEDOUT on timeout in de_wait functions
  staging: sm750fb: propagate error codes from de_wait()

 drivers/staging/sm750fb/sm750_accel.c | 18 ++++++++++++------
 drivers/staging/sm750fb/sm750_hw.c    |  8 ++++----
 2 files changed, 16 insertions(+), 10 deletions(-)

-- 
2.34.1

