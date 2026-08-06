Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666A73783B5
	for <linux-staging@lists.linux.dev>; Thu,  6 Aug 2026 00:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785977026; cv=none; b=P0Z0WSgXJrjyNlPbm3ed+aJ0g/16WOcN8NAkQikL/i+XshvP1DYGmYX2hC/IvESFfdB77uWqNmf4tZU+H0S4KOQ4Jcd1q1jLLod+tD0YOfvYkGtRo50+q9xPg5Tao+h+NBXWTX4wDKdroqBPr2Tu8BkPEAHY0lE3aHKaDQxOwWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785977026; c=relaxed/simple;
	bh=f/C38F7jfyhiNamhgj+2J3Uarv9zAZn+JoHs8l44B5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HlFW0Y7JkoT3Z7jCmpPj9QCMbB/xPUlMgRxjgml94VCoa2TXmb7CEOKC4YN0BFSAgbQRmIluNtK8wxhhbnrc+daOHgY0qAn5DVeHhvIzEAIM5KdkDrC/EtaAtjgzAH8fx4nYjss/c+beO1eBudWn0AOlh+Ge2v+wZTc38gIoqGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvP1kskS; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvP1kskS"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51bfad59921so11319941cf.0
        for <linux-staging@lists.linux.dev>; Wed, 05 Aug 2026 17:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785977024; x=1786581824; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=64E9cSA7smKn17NrMcFh/iNHZ8v+Am6PSKOl3YRRdE8=;
        b=dvP1kskSkB66N/SBlC2+8WCoOcNYIlhOQaYzEi+y2kImyGbxwBYpfaZpvjB20J+JAK
         N3KjHiFqSv0qMgMhvnV/bImRhL+viXfPJ1Vhn3dNA65fq050mjgiBU7LEZxmO3/Lf9jR
         ceX5lufaAcvUEhRafMdnfF3YoipgQJnd3ET1/lpWXkKyvAz5prryu0g7TTJZ1C9bS8Ht
         Q2ST+1h4r1zeZomGnEeZWE7X9ED7bVdhj3ThixWaBbmjiMAlFFKR7KDdWqKF4qDX0LrG
         /Uu0R7qIq9FhDFaSIGWF/YKDQAKZuXY3ZUze/89wrShdFBn/f0GSUecd9AYepjuf6lnT
         uVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785977024; x=1786581824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=64E9cSA7smKn17NrMcFh/iNHZ8v+Am6PSKOl3YRRdE8=;
        b=GM+uTCjc1pc2+8aria//FCRQKpoar6S9ak47yV3W9kPt/9JLuYy7NcrTKwJyCAmfmB
         MOvGwCQqX8sDnm7A/R7Y66wLCzCgnVpXvxfwdJm8/vzsj+VE4xiabL01B4nvmodpTaa3
         eetkKC6Rc28STZfv0WqVMOO3dJvMQL+m6lj3tQNHwE0qRsuObudxHLamjgvXLQrUta6d
         MWkpCYJkcyzEKeiAMFn5SbsOhYuKZS+teRkY1V+pN6uEByecSEyqZQ8BHMWVopKrprbx
         1/1+nh1mQ018lv1U1Z6hLqUp3n03JVKx9YdX8NBGZofuBNCmqwh5gZ024fY6k0BxdQJZ
         Jo3Q==
X-Forwarded-Encrypted: i=1; AHgh+RrmeyAudszalbCVlncRr8AkSU3y1J1ALLJhgUYk4QO7CvL2H9XBSQ36ChXp13iGBtnLwXMRzqYWZqyUrnef@lists.linux.dev
X-Gm-Message-State: AOJu0YzPmvu6uBHWZIqLam41eH3jj2b77FCUEC5CJYXZkdLp6YFNw49H
	FFwQy92WME9DdJJUJYq3Gav0R/K5AIdKdwqAq9BBW33MzXDkKnVRqanT
X-Gm-Gg: AR+sD12xwzxa3ubEEKD/Piore5ywRK5Ih9gzgyQrGIXptV5H2eOUwTB9DeXEb3dAJFY
	YhYqZ6fbpTpKtSOlNI2AxtVZSrQgWlk0rMNsR/+rjr/H54esw+w2H5KUdPD2D+2FH5BlXcsBgqe
	ymMDvgMeo+a2X3myMRBkT65sGWcW34Rdnl+NEV7HPX0xGXj7UAd7ixoM0etViLH5vIBHHQ/g0Ji
	yLWGi9vfccZRl/ETUz1r/lY9DNRk5+3SHE3zdzk3C+MNTBjTRays0HEja/oRozgX2JFbDOFaUIv
	5y9sj86PJ/qVW+OM64fvhNjqV1++vaEyn1BuJkBLN7kazp4aGncYJV1XvC/oB88uHwCObk3SFrx
	hZE2ZejCFFp0bqUBV/UaWkxKM1PDe4aZfoCR+ZqwGBlEjNlGqEYT+UWMtyMiC26Q4PDHvin+B0I
	AwnDKn04G74P5hTkK2z/U0U9smMJNN5+mUrKet1KcL/IMRlRG5b0IMTi7yrekR9DfL5MImIR/Ya
	FtTRddJp9mz09M8qbT2u5+u7xzLY8rRUIcdPttAznOv27ozJGWQ8Tx0qDBJeTcOGvCDN93uC+gn
	N2ZLA02fd7bKq+4T0vnDVS6xyw44Gw2yoM+rTlbYQqakUqgr1G0zBr707S0t1VCwiQ==
X-Received: by 2002:ac8:6f08:0:b0:51c:1e46:711a with SMTP id d75a77b69052e-52ce614523emr127663011cf.24.1785977024279;
        Wed, 05 Aug 2026 17:43:44 -0700 (PDT)
Received: from alex ([143.244.44.172])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52ce892a695sm30989811cf.14.2026.08.05.17.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 17:43:43 -0700 (PDT)
From: Alexandros Xanthakis <xanthakis.alexandre@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandros Xanthakis <xanthakis.alexandre@gmail.com>
Subject: [PATCH] staging: sm750fb: make g_fbmode array pointers const;prevent accidental modification of entries.
Date: Thu,  6 Aug 2026 03:43:25 +0300
Message-ID: <20260806004325.3253-1-xanthakis.alexandre@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexandros Xanthakis <xanthakis.alexandre@gmail.com>
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
2.55.0

