Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4A225DAE1
	for <linux-staging@lists.linux.dev>; Tue, 27 May 2025 17:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748365894; cv=none; b=Qy4dlK+5cGN3Jd4uYevuYu2kgyB0qiZnE5ab/22BGzVb3GKWvdfa5uMiYlCt8rBOeVfu/Gal644bthVbGmNcTI39YVSmyDHkSA1cisdyBIUhV6jobPdGorSdh8XwzyLT88BaeNhwoCWSoDhegMLrWLGu2IJiPBcLE5eqrnNoD6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748365894; c=relaxed/simple;
	bh=BAHBdkQJKTMWjTYd1N7GqR6d4nnM047AWC8u6YKpT1g=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=WuqXz47PgopdkejgMgz7K22K9hLFvEClPGKiwT31Ymccux0iall7wOF/BCa/RKIag9a95FlA431VB3GmnBilvwnElLdppIE23azPEw0Lx7Q1bDirim5vyVVLquEBB4ebfA0EM84ovdfZdH8sipwDFVBOXAuiODdQTifkX785//4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vgKDeC2m; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vgKDeC2m"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2349fe994a9so7572295ad.1
        for <linux-staging@lists.linux.dev>; Tue, 27 May 2025 10:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748365891; x=1748970691; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/JvhhsVzxZpk7DMVkKHCJuZXnAATuH0obboMI/6t6mU=;
        b=vgKDeC2mudAp/O5LMzAufSuh0Y3v3SHXM6Wsu+rHRS19Yn04Nz0rBwThV6ZofguDQz
         Y6wV69BzJNL9rLzvIv3YrqFDlA1OVWHMqbuuN5yBMfB/OYvnv0bGPLuNXZvfNIAincu/
         VDIbvYdBfWXxlk9MByeY8AdsyyM/g0XAuTsV8d/vBp52qU+4YPQKQsLvHoGRTKNdfVDP
         2yR9VTw7X+BQ82Z2NGT9pf4qWG67JwqnHgREHNKIy+zc6IgNeWOgqDLUDH3mJIQD7hn3
         mm97U/58sgNnFB8l4EgDNhH9fdlVNVz4hhBNSlGfhFRoZlHogMqqMsDsLPwWaGZ1A8XL
         M/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748365891; x=1748970691;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/JvhhsVzxZpk7DMVkKHCJuZXnAATuH0obboMI/6t6mU=;
        b=anwYSua+tFihrP5FYSrmgIlLIBhMBQcmOOJ2S1w1LKLGU5CcyjETBemYZLCP+UaRV3
         OTK6+Pa57zGI5Fk8wil+PKBHW8PTKIE4dbcgL1LNc8cVy3ywwZAfmDYAEvoOb0PdMFMm
         7YyEXSDiYR2SmW6bWGvJ2h1FB2EDMD2G1EZ7e8EqKC6WjGYwS/yfEZYEmM07KoeQzNSg
         psuEsFMe5NAwjax61PUtMSdPvE5CV1VXH4qPb30+sxWoFtLwdDsfavGXQScW6EH/9Tr+
         55/nBlh+O62Ctxm39E/3vUgPCja/9yc0tIAar3+7RtH0xSLf6LsAu6gDGfk4EGAScNKL
         QPbg==
X-Forwarded-Encrypted: i=1; AJvYcCXg55GKS6wW5vpHpJ9c7UEwvjiuLTY4GVrU8zqVpz1YQt8Hnu8xma4R2/u6k+2J8gHSlwPx4Y3//MwyBGQL@lists.linux.dev
X-Gm-Message-State: AOJu0YxvNbVyF3NLespSIGoy4icEny7b7mlxkjJzJrnwD0I1Y2aa5Zcd
	X05HrnjycQD2LBk9EeDb9wh2Li2X3S7KmSguPWawUgljaJfWkK+KX0maMiVXKwBXzt0SudEAz7l
	flm3f63oGaGrvMJBjHjHhgg==
X-Google-Smtp-Source: AGHT+IFlObLHeHzUVU0aoa/6zQoHjEBLIMWsx/uXdkET+437ZwqTAGXDxMMkOl3bzunvlhVkDNDYu4RJDS5pvyYQ
X-Received: from plu15.prod.google.com ([2002:a17:903:368f:b0:234:7a8f:b8e8])
 (user=ericflorin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:3a86:b0:224:23ab:b88b with SMTP id d9443c01a7336-23414f48ec8mr186992505ad.8.1748365891579;
 Tue, 27 May 2025 10:11:31 -0700 (PDT)
Date: Tue, 27 May 2025 10:11:22 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1164.gab81da1b16-goog
Message-ID: <cover.1748365488.git.ericflorin@google.com>
Subject: [PATCH 0/6] staging: sm750fb: cleanup `sm750_hw_copyarea`
From: Eric Florin <ericflorin@google.com>
To: teddy.wang@siliconmotion.com
Cc: sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Eric Florin <ericflorin@google.com>
Content-Type: text/plain; charset="UTF-8"

This patchset covers style cleanups in `sm750_hw_copyarea` defined in
`drivers/staging/sm750fb/sm750_accel.c`

PATCH #1: staging: sm750fb: rename `sBase` parameter
PATCH #2: staging: sm750fb: rename `sPitch` parameter
PATCH #3: staging: sm750fb: rename `dBase` parameter
PATCH #4: staging: sm750fb: rename `dPitch` parameter
PATCH #5: staging: sm750fb: rename `Bpp` parameter
PATCH #6: staging: sm750fb: Rename local var `nDirection`

Eric Florin (6):
  staging: sm750fb: rename `sBase` parameter
  staging: sm750fb: rename `sPitch` parameter
  staging: sm750fb: rename `dBase` parameter
  staging: sm750fb: rename `dPitch` parameter
  staging: sm750fb: rename `Bpp` parameter
  staging: sm750fb: Rename local var `nDirection`

 drivers/staging/sm750fb/sm750_accel.c | 46 +++++++++++++--------------
 1 file changed, 23 insertions(+), 23 deletions(-)

-- 
2.49.0.1151.ga128411c76-goog

