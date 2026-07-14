Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5F04D90CC
	for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 19:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784056271; cv=none; b=PyyFyt7uhhdu3G9TW0D9HiAWmwiPgHv5DhdSm8NO3gDptYqabk1eBGYRAZN+XrQg5w3qy27nXEMsud5iQDz8e1oSggmiR5fxLjDXrtC5F4eP7/CSSp2Xq1h7ycCAmr6DsT84RCVUwSY+7xbAc3uJWpVmObLKnWuAkYbQ6dOKagE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784056271; c=relaxed/simple;
	bh=dL6AZe8iK0ixK2a7le+Esh6ltnlPeThUu0kyhVtloNI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=msbycv8Im91yu0NdOj+hSovUPYFlZiClWrJm0GA0YXMkn3mYbsc+Hv0KXXKz50m4H9gW6uWApb0mI686C/9morW9h0d4Xo3QOeafGOjOD0VuQNYu4Ev7xJ7cDr+akLyn2EE5+pr4zBBjjpbi+Q4zI1gG67JuX2YNpRDq1f+EnSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mr6becBl; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mr6becBl"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493f6de72faso7154745e9.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 12:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784056266; x=1784661066; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V8cflk1NhiWz6I9y7ZdfFj/dVqPOluavFLdFslOwS/8=;
        b=mr6becBl3BM091Cm9Dr2Ejbn3qYJinMT5UAJgWtixhHywdgv2uk15hWWESTd0S+655
         8xDsOS6HCjcR3Mp241eSHmk/pN8YMpzwszrBKo1PEnzy2d9TWe2w50ynVy6BVnZkbWFB
         bE3blw8HUE8uwV0XNqBzCeNwTYlSSlQ0Yp8wB4BHnTwfU5oNCz/RDTILqcUhBbXcc1Yy
         1XNz3v0caSVDqJBZFxwZhKIqXhmwWFuq5oH1YENkGzqXvpwd8V7tIIhaGPKDi/n3MlpS
         dyWIWeCm4ahs/A+VxkQ01U6Y0JidIrqOojE4CcmD6PVuJRdJ1YDx8vSfgREm1fik8fqm
         Ffpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784056266; x=1784661066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V8cflk1NhiWz6I9y7ZdfFj/dVqPOluavFLdFslOwS/8=;
        b=YQwlZo+peN+hrOXs3pqJA+lEBZmLXFfT3xCHlH8oIOqZzpVOqjxVKOZamioDfpEIed
         utDA1e0+k+on3BKzc+Qtd65cEv4iEn7ReKfs7N07Dx0OwzEKRJzwHQ156X3/ONce4R5U
         g65e+XVkdJfMnwtmvOpoEw1AkddIAvvOQYcGcYEToj9xn4O0KyBXqvcHpSz3bvaVxQPv
         lQ4jitX9Z1ibblQCsPotlbr5klW9/7dAoTiv1Jpz4rp6cU/cOO8KGyperFBt8rqhlEsc
         uGo5DylpQ2NCP/3Oi+CPMi4n3Hqw+j6N18Qqti7387kTe3dDTYel0lhpUJt1/bjDM0X6
         /pYA==
X-Forwarded-Encrypted: i=1; AHgh+RraO+j/ZXZgsIit/kt2foy9Z0Oe2NJdpZlwU3g0d6iM6613YUMBcdOmcFZCeF1Sia+360/IcrVz/mQrGFik@lists.linux.dev
X-Gm-Message-State: AOJu0YyQiV7+bVkntxpXccTMW1rebDaUyb9S8u0fChlLYHjAB3lHZk91
	cMcNfw5q0Pd1OlNkKrXU30jr3vL7lyBZ7em5n++J7NcWDOIZMJzxDUVP
X-Gm-Gg: AfdE7cnhdqxy3z53Ex2qDqFkvj54khQr3XUDlt66epvA/X3uaYhQ+iRC0jCX1Z87lWU
	DU5qhviUPIzepAh76GACGRkLDNXuXEeuKiMWDItHcDEepHP5zTfv2fD/e9EfIjj23J2Li4SflZ+
	FuhPVqzcqFNfxXcwwlr7tZTPcp74E6cTl3jmKBGD554j9Pjyz4kxm0Lm5xJxLs/1MIecK7B6AU7
	3MrA8Yu01lJGHtWejQE/LyWpp6dHDNK9EI/xfHN6rqb58e9T4cFd7ktoxSgV+niQmSEsasFxc7/
	ufS2N/O9KoJ7ZdNU6q5ZKrn8i5cZZcUPK3VKx2cO57A2KdMRbLVKMPk4k02vCEd3hiveJhbcuhR
	3Tl6HNV864knopnSxE2PgPvrpDrRE6AUXcoOlTfV5k2iORTHTb3mWg7U4G6/gA5DLDCTsS0yCGg
	BS1sXUUABD4m668nrFHwO+AqI3pqbvJg+X4RFBnkZBE3asTrVpBAlokXqlNuK9EpSxNcpoQUpw2
	fRbAhAwY2YiS+DqZejCjA==
X-Received: by 2002:a05:600d:8444:20b0:493:e2c3:af25 with SMTP id 5b1f17b1804b1-493f88bd90emr119328685e9.12.1784056266292;
        Tue, 14 Jul 2026 12:11:06 -0700 (PDT)
Received: from evil-archie.tail5479a9.ts.net ([2a02:1388:23c0:16c0:aa41:f4ff:fec6:26e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a2f951asm100677815e9.14.2026.07.14.12.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:11:05 -0700 (PDT)
From: Panagiotis Gravias <graviaspanagiotis1@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: namcao@linutronix.de,
	tomasz.unger@yahoo.pl,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Panagiotis Gravias <graviaspanagiotis1@gmail.com>
Subject: [PATCH 0/3] staging/fbtft: Minor cleanups.
Date: Tue, 14 Jul 2026 22:09:38 +0300
Message-ID: <20260714190958.219437-2-graviaspanagiotis1@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Solved some style errors,
parenthesis spacing, aligning arguments, replacing udelay() with
usleep_range().

I hope this makes future checks with the style script cleaner and more
helpfull.

Panagiotis Gravias (3):
  staging/fbtft: Remove prohibited space before close parenthesis
  staging/fbtft: Align arguments to match open parenthesis
  staging: fbtft: Replace udelay with usleep_range

 drivers/staging/fbtft/fb_ra8875.c    |  4 ++--
 drivers/staging/fbtft/fb_tinylcd.c   |  2 +-
 drivers/staging/fbtft/fb_upd161704.c | 18 +++++++++---------
 drivers/staging/fbtft/fbtft-bus.c    |  4 ++--
 4 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.55.0

