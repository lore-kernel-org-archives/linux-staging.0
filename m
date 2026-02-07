Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C282745C
	for <linux-staging@lists.linux.dev>; Sat,  7 Feb 2026 15:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770478627; cv=none; b=KmAnZuclLpJDRABVj0zTb2c1IaaSBnE7/MGfyNiJPUqoRzIQsMQLQ+dCwtf8dp1EnKClhZ2cc6K+azN7+HzLSHTRBvosF0rsHzDI7qNgjxF3tNYJn2d0qwRT7h3bHBT8UGiXe4dDI4VjCubKGPFGnCeLqc4GHkMeEbu0fKRANlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770478627; c=relaxed/simple;
	bh=WkAb2pNhz6Dgl69G7CNYQ64QUWJ4cKW8u01AHwLjZ0I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HVkGE2J0AkuOTujpAxGj2onPk3cbkY5gz+CpZIf7e8u4B4GWFa+dsqg+1hO/0fFjHZclb5m1+pkMEPWTfp17t3zh7Av3lfnb0+l40RADVpSP6UfKHDXN66oNxYV05blt4nMz+rJxNYikiQ57/B7G8/K5B9mjh6RRIc5U4oi6KKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=el9qyRji; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="el9qyRji"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b885e8c6727so182541166b.1
        for <linux-staging@lists.linux.dev>; Sat, 07 Feb 2026 07:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770478625; x=1771083425; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZyfO6Wt4gjdc/BNcrwfaeBvSt1Wq2H1phlZ0J+Zduew=;
        b=el9qyRjiLCXjt5xtZdfNqa0TSHF3YmSAMzwF/yYHAaFkzRSoKefm7dF1GkVP0O1lML
         uBkb212hvBDwrmlaK0vA7lALBPVF5OXRvryV9X+5bqFOI1h642a7jKg0/u/+W49MI0Dg
         ik7SKwiJkphgVyazxXp4stOIJyCG/xifSVRDpEbG7UAS68RPRaE9i46C9m8Yjdo39XF1
         6SkOiUJ6XvlPpcsQmGw6tly5TRKNwfHjfFN0DMbsE0mlqgf7/5P/qqfQVP6ya2eCRcCA
         wNMaR7p0a2QvLhkG7vyKd3tRt+aCJPPmZ28r0RKCnq3VpiIDfkkSG02bNYcWQbpdMHqn
         24Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770478625; x=1771083425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZyfO6Wt4gjdc/BNcrwfaeBvSt1Wq2H1phlZ0J+Zduew=;
        b=PU6tiU4sZJfsVtSDgcr4ItoeS//Dsa2fXu5RV5XFtHzbVdfQhCFf3xKyMiDXm6cQEo
         D1m/2bqkO/hILaqtkaDFU0BQ9MQqCIm7djrJnjmWCC8eUMOayBfib3wOAE4rR4r12Gl9
         HtLj7uiPpPLqLjVSC3Yw/RmQ3fB4X16nrHTk+oPzAhXECTZ9IacqwZJBkJ5AVlqUNBf6
         W7g9lSo81+xTYfRAVmaJPRiDe+1bwxDqd93YE/9WH04Zz+dLPOTYTvMvNRMRleZe9kJz
         aOBxZ0hPBFuKKb5K2mLgUD21HonfVnApdDFPnOb+ctTJ8NeCN8lw7K+oOuK56oLHkDPX
         Xfvg==
X-Forwarded-Encrypted: i=1; AJvYcCU+/l92dcTNmcDCxdvKNOt9peeO7wH6c1JFpdmHQL48TZ67BKfK09G+PQgkIO5F1ADZNFHj5eHTnWWDguBB@lists.linux.dev
X-Gm-Message-State: AOJu0Yzw+o4GVdXGEQEN5ASQdh3fQdfwt4lZ1NYIAReNBrG7HlMAu+HG
	HpCOGHEZ/iuUizR3rUTA3nD/FnDfvJfK0d/dM5z+V1a11FI7zu6KkRKS
X-Gm-Gg: AZuq6aJnazMU1vjBPJr3syiugfyqRjQiwA3NDu9OEtrBhKl6VKNmHTT8DJrecpgYTN1
	legQKBA72xIIatVqCf/vPd7NyWFkt2K68I2tUQ121vuSADCaLx0zV0CMyFNOvuuZZJZo5VgZk5d
	GR+9C+sHSh4SGZ54ZceExOavNjMqW7pmYBH8+nhXW1eHiRqchWLcIGyJO9Yt3VpqGzBLjsl0Ae9
	fh1E4gcywlrGa/U/P8MCxYLygztL40RZUtGNmcEOC8T4sJxEUfeYme5nEGnYj1awR7z6X9fph8y
	uhCnaYiuzDrdreOKqMSkAAOCyg4as05Bc0tb30c2NCFAp0pKlYoCORtnV5UvvfILJufWupM7N/5
	j+uvuJbtALFDj+7eGgniAH4REZMKrO+lWaZQ5tE7Cjyb3JfvSmpPmycnuHnIcuZtvVudUr4McP4
	djf2UdGoIYNibZWgCdCy4fbG7DkYk+s80DYxCyiZS1AS1QJ5S2/S9rw0+yg0xxe5J6yXp6S3n4X
	ytLKVG4KkjWmjm3XkYrbCWXm3EJE+q5ag9ZoHRTxzFDEfIZgrQg/jnO4MuEbO9/
X-Received: by 2002:a17:907:960a:b0:b72:5629:1789 with SMTP id a640c23a62f3a-b8eba132f50mr614997066b.13.1770478624847;
        Sat, 07 Feb 2026 07:37:04 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-a.c.od237066db22328bb-tp.internal (170.249.141.34.bc.googleusercontent.com. [34.141.249.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda748aa6sm181308666b.1.2026.02.07.07.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 07:37:04 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH v4 0/3] staging: sm750fb: clean up logging
Date: Sat,  7 Feb 2026 15:37:00 +0000
Message-ID: <20260207153703.2049-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up the logging in the sm750fb driver.

Changes since v3:
  - Dropped the strcat and strncmp patches as requested by Greg KH
  - Consistently removed all pr_info/pr_debug/pr_warn diagnostic prints
    in one patch (previously some fb_find_mode prints were kept)
  - Split dev_err conversions into two patches: one for sm750.c
    and one for sm750_hw.c

Patch 1 removes all pr_info/pr_debug/pr_warn diagnostic prints
from both sm750.c and sm750_hw.c. These include address dumps,
debug variable prints, fb_find_mode result logging, and CH7301
DVI chip status messages.

Patches 2-3 convert the remaining pr_err() calls to dev_err()
for proper device context.

Artem Lytkin (3):
  staging: sm750fb: remove debug and diagnostic prints
  staging: sm750fb: convert logging to device-based in sm750.c
  staging: sm750fb: convert logging to device-based in sm750_hw.c

 drivers/staging/sm750fb/sm750.c    | 88 +++---------------------------
 drivers/staging/sm750fb/sm750_hw.c | 26 ++-------
 2 files changed, 14 insertions(+), 100 deletions(-)

-- 
2.43.0

