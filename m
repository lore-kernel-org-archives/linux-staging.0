Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001351FECD2;
	Thu, 24 Apr 2025 22:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745534086; cv=none; b=WVOWzEG0n9USiObEJV8loF8j8IkhLK2xNyhNkkvmb24IkOGhttxdEyeLhjuUaSIO+oNVHywrrnmKu/IcFgGaY05REdn+Xx8mi9s3Ql/z/EMgFTQaCAKxvK1lMKEvHrWLnZzAslduzX8VQXjaiEqiJp4DThxsUHPEs/vgNoSJaGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745534086; c=relaxed/simple;
	bh=VWh4kPPKdkOQVzxNTI4Rpz+DpHzxe+cGoaqxuamFDo4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eGeAL2qkld7zPjjsRIzzAMKGiJ1rnh6i503JdqLHg77h48pHGlJdaO26ljvfGqJ5jK/abx+o6JHfAyCCEDEpOlhG2qTmBW0ZbRX73qUeTJSWshI9sHuTrK1n6BC4HBf09zQ/8HbPmlwM3g+6FlOS03W3MomJ27OjFsqVH7bWyqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Js7cjNVx; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Js7cjNVx"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c9376c4bddso182123985a.3;
        Thu, 24 Apr 2025 15:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745534083; x=1746138883; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uSe1JtB1eGCQWd41wt0spQWbOOvTZzsVz6y1xhAjnKM=;
        b=Js7cjNVxQw1xmm2xFEfAeASadSeo6zqxWqr7eztkJq3wv58FYau8x0A+cRWIBWXNgR
         h2ZtxTXbuIGo/3U5iZ8eaMi6zv1xV2kmX8PwvL4eCywImfrnAKMnctlJBfIjflGiPfeV
         YBKmzIM1K57069/gU0HH+zoGHyA5MDCqhW/fRCWNMdD0+1GNO6CDLzXDq3qJzv7hLRZv
         FeMh52vfMCHFkLRCPoJ3ij3hl993cXSW8k3gA9bUl+2Zq6bJXOzR1ACiMHYl7TtIIPw/
         eCzNwTJncvEdFtjPnk38YM5KRxtpYAvCd2nBqYe6Ds1tW01TMgu7TsRdpJM+0g+Q3kGC
         0/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745534083; x=1746138883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSe1JtB1eGCQWd41wt0spQWbOOvTZzsVz6y1xhAjnKM=;
        b=jHBmdIF8np2oFdwoj6hDvAA1tfbJ8Qaw3rFveK67ewjMpdzb7XzonCX444YXpU/jVM
         UxT/Mimc/kQmP6PwmMBchIhPZnP5Az6FDEw1YbM+CDqYv2Y/0qNGkPXa9mkbUy2nYfwf
         qunBmq9B8vnp2yuzNdRO1xN/4DJMYAx8piP30duGWs1+VHJt3PXN1+9cBLEgHx0Tzf1z
         78TMWzDWEorPkzCgPTzlNO1UFc1Oi6tSrKP7LSnhQmcnf8xsVt0PIB3r+QQq7HiNqJkP
         ksPLIO74/xsPrGLTgmdJZVYdtwcA9CHqfkDs0WMx6t4EsHm0WVZdvAN5zabAA+owWP/t
         WiCg==
X-Forwarded-Encrypted: i=1; AJvYcCWThTIvZfj2YLxAl6mcPjH2XDJVc2eOQMcHJy9qzh9RlJmkamKs2xzNbkasME+4tpx0gynW7RILq5t93EczC/es/zSi0g==@lists.linux.dev, AJvYcCX/+kliqlLLhBAZfciygktORLnexgBBoy2cUcf5plUIR2SVBhVMyWpg14y9gF27snY3YKyTG1UWkUO9PGGCpA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwEs9J0UYEXoheQJBzFn70cQTbE5n7cptoVm4oBXKXpN2n4FtG/
	yUDNNY64DIDaeVbPC00ijQ/Bx2aWRhneJIkHRyzoxtp2kWifwhz2
X-Gm-Gg: ASbGncurBfwZF+8F4QW+jnYE5g9VMxUSqTLCnfwzb9u1OG3ppvQNqXWKnwBKvrB5CED
	K4/LTVl62/Y3HojQc4XAK/lIl+11WDTcBUDRs+aF/7EKDUcx0nl0ivIYWvwskci2CwB5x+WJ2Dv
	RSUZKC8HhQJwnaJa9dysuJBXtswwNUdj1IvOglBPwIq7Q7v6Xnf2D3/YJQ2RE8qCtEJE1wHDYcO
	z2IhbYID3OIREf77vivEqpMtYO8aFBeGLjvL4AeL8fYv2Ujqr1E+YGpvBa1+GifUaq+gghCDHYb
	EI2Y6Xwx6HbxOgwwUyORVXrtjWQudpE38wzaxeGoMLvBU/KuG5t1EBe3kRmuJ7WeUinNVOIu5p0
	S7Y05sTwUJb5JBll/ZIs+6t+Npb3yyw==
X-Google-Smtp-Source: AGHT+IF/3gNk72gTyd1veyOt2Ztb8OnlYKh/uOSphzG7MTtHCdbh3Yc9ARSZj/f8onW2cfcKVNzFEQ==
X-Received: by 2002:a05:620a:298e:b0:7c5:3da2:fc75 with SMTP id af79cd13be357-7c9607135b7mr42472985a.24.1745534082912;
        Thu, 24 Apr 2025 15:34:42 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958ea36eesm142986885a.111.2025.04.24.15.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 15:34:42 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: andy@kernel.org,
	dlechner@baylibre.com,
	gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Michael.Hennerich@analog.com,
	nuno.sa@analog.com
Cc: gshahrouzi@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v4 0/2] staging: iio: frequency: ad9832: Fix and
Date: Thu, 24 Apr 2025 18:32:07 -0400
Message-ID: <20250424223210.91317-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1 includes the initial fix.

Patch 2 refactors the code to use the out_altvoltage_powerdown ABI via
an extended attribute.

Gabriel Shahrouzi (2):
  iio: frequency: Use SLEEP bit instead of RESET to disable output
  staging: iio: ad9832: Refactor powerdown control

 drivers/staging/iio/frequency/ad9832.c | 69 +++++++++++++++++++-------
 1 file changed, 51 insertions(+), 18 deletions(-)

-- 
2.43.0

