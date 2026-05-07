Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CB7238159
	for <linux-staging@lists.linux.dev>; Thu,  7 May 2026 02:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778120559; cv=none; b=VdkNoSlQ3yt8FAauX/fd237idBf+fmpt1cv++jKqagK25HxKcDoNxN6JdE5EodVv0thyfc5NK4qkuDTikV9iP0/MSt1/SylYfkKJejDfFh5JaP0LiusAN5cnvprov5VyeZQxL14mC5xIRy1OqstjMqHjLQ2tc98+iM2//njLSzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778120559; c=relaxed/simple;
	bh=8nxz7b6pzvptsxQavYhry6DOMizBSXb5xpuCPsJbSSI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=N6EmVsGnGnSM0oi0gebKyL4cKLxRru8WeFmrK10Vjm9G9o23mnpCHuxGjd+s6XUtuYN5qg+elE+meQ/GjqwHbuCJvf3whEnARUr576xCrorzMQyGlbvR+PMuT1x6HggO1cfpPO4SyycuGF3r5MVlosm0y09HntphX1neAxjavTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SvC2HXeG; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SvC2HXeG"
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-2f68f3b075fso693502eec.0
        for <linux-staging@lists.linux.dev>; Wed, 06 May 2026 19:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778120558; x=1778725358; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hU7xl+fV6UprDQvL7p9kbzsKjs2HsXfsZSPYvXWsgDY=;
        b=SvC2HXeGgOKDi/h/VGsofaxC34C5+Ji0gUFE5tRmLi749VdbEFsrx3lQSqzjok/ZA4
         52AhmPkes7hEa2gJKZKgyXl+MyALzDySQZh0DYR8DT6tX1LI/4C6TtgGjrkvL9qoosrZ
         NCtO84C1SkfuI3POtbtquga6uxXASFhaG4UcsfHI68G0zRDeUFPJZPJYIeD25M0VAWkm
         Tdv0cXh+lbrr8Glbtkfdn4ut+1PmBZ5ZS42PvgWNUS0H0JtybN0Gubu3bJSOGIqKA18+
         gX2gRVxVspFvH1PQ//DVDty0cqu+Fxx3bG1aqIV5LX2PEaN7Cuv60pvInYmCyke2/ONQ
         T/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778120558; x=1778725358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hU7xl+fV6UprDQvL7p9kbzsKjs2HsXfsZSPYvXWsgDY=;
        b=hv17H6+dihx751zOld13mkhdwxvLnKnE/viZhNyFaPP9qsIwF3iQWyCwenJDU/KELi
         LRv6WmmCXDNc+nSeySsSkAqd5+93acqFmGG4CyclxAa0ujHfTi/7eSKuNk/i4t3DzVzB
         +ztTdOxuIF5LnxfDjKVDSFzVATna/sVqftY3jb6pGQmx962ymgewvwQLy57RNHQEhsQE
         NPPPNXzKzHM3GYCIkITIuKjptjyCT4t1buHwIaBaeJsJ9xi6wv7L7/XfFKyfemkHgLib
         UY4o6/YyjA+2U/VklgSAakGyl/7iwGDHHDzU9Z1T6MoZ85GUpjKk0YDv8sjjM43nwIqX
         +7ZA==
X-Forwarded-Encrypted: i=1; AFNElJ+mNZElMAwC2hX9YseiyVfV0cmUTa+hlTvc9XPEY/IiDdL1ersuajnkwkGxvWjvKFlBcLXgT5WEVnEJYlG5@lists.linux.dev
X-Gm-Message-State: AOJu0YyRKfWHh/PWTQnsxICPa1KQR4t9g8NTpzp38Q6qbzo/5SywWG1B
	niYWp8A3gzBxQEwe8m6oEjuwjfyyYKABN3aDza8tndFfs3g6uuMO23+l
X-Gm-Gg: AeBDievGX7yEBVfkRTQMVluZkp308SlQvTulrMqWIRewA1QUHXiwyLmVmgv5cVyaohW
	tqmU4ihHBgi0nQNxYAAt+DHXCvp5yYKB+54V0uGb/Fz6qQmsh9mcaJ6tbvEyXg/jznDF8S57okx
	Ps57gBF1kjylfLYf2ZTfHrVEvnAcYcjPCzcmZ3q3ycWFUkXfqxflO4OGd0aWqtPZqKk2eb/yWEr
	fg0vneJZ76lVT6GZcGJGwy+g/qWCftJA4Ao0gVFpsSOhfVRIMTHmoZB7rO2H+ddFWz/bHTp4EYg
	JZ7EYBEZ3BZTMjfqhq01AhnoEFp2J/NjRPHiXxshMWiFjYZsHXAMG9UJKStcj35XBV7jkwbMsBL
	pGaCAkWRQncq5dpLAQ7MxS9VEkck2qO+H6du5QNWyN7vZuXfbz7I6TJrUmzFtwhbVHkVqL7KylB
	bBvXRVcocBdoahL1xBtVUK2NLW4zMvmLicIosddiIkEw9+w6k4mXI73UlnNKDQsOnzd0kGgOt/v
	PtJ
X-Received: by 2002:a05:7300:7492:b0:2c5:ed1b:ca9 with SMTP id 5a478bee46e88-2f548e95b2fmr3359388eec.1.1778120557733;
        Wed, 06 May 2026 19:22:37 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f570384e46sm6658192eec.26.2026.05.06.19.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 19:22:37 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	luca.ceresoli@bootlin.com
Cc: thierry.reding@kernel.org,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	digetx@gmail.com,
	hverkuil+cisco@kernel.org,
	dan.carpenter@linaro.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v3 0/1] media: tegra-video: vi: fix invalid u32 return value in format lookup
Date: Thu,  7 May 2026 02:22:12 +0000
Message-Id: <20260507022213.29290-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v3:
- Add Fixes tag and Cc: stable@vger.kernel.org as suggested by Luca Ceresoli.
- Add Reviewed-by: Luca Ceresoli.

Changes in v2:
- Follow Hans Verkuil's suggestion to use WARN_ON_ONCE()
  and return the first available format (index 0) as a safe fallback.

Hungyu Lin (1):
  media: tegra-video: vi: fix invalid u32 return value in format lookup

 drivers/staging/media/tegra-video/vi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1

