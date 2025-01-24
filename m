Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBF71CEEAA
	for <linux-staging@lists.linux.dev>; Fri, 24 Jan 2025 10:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737716391; cv=none; b=rPTP7K7/+cdcRnwRB1gsVv5LQrxUgAsr4aV3V9/9StPJYUEZYFemXfJn64GmNj6H7lKdTfKQoov+qLtucV7xC7phEGHz3WPfX5PZvoCgTrQaoD0u0v8sx0wZaiRFpgEuWHsmKuR2fk1QSyoS22faJGsHYXAfwx/bXgHPm3xuY7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737716391; c=relaxed/simple;
	bh=GQYzPxzv+s9O7SQSRnNcLw/LofV20I6dCTxy80QgIb8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mzo/vY5Ng4fxMarvhIzHG7rJ24SQHEzx0P9+xWxCwd8QThfVG0Xs5uV+z0GjWl5HCb/nMKt3TkKgVEcBXqAsVr9hrOTtiw6znD9vnLLSjy4YsrpwvbWeNHA/Wl7A3b1LN3UvbZ4aE4kOfC5S0HR5rXkGGYDpUOCEAYJehgTebW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7Va3zuP; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7Va3zuP"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-436a39e4891so12953645e9.1
        for <linux-staging@lists.linux.dev>; Fri, 24 Jan 2025 02:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737716388; x=1738321188; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QpxTL4Qjh5Q65RowGoEAMODcPN5gd8f6xLLqccWUofc=;
        b=b7Va3zuPV4WyLD8HPRI7ODGo70JAGej5gBbsJ1343PPwVO6oJG71q4fUhj6JoCAt4c
         OCKnLcDEdjDCIMiX9JHVhQsI3rVpHXTPC8yVwfesLUpac9azlPNaurx5S2Je+3hpEXb/
         /TRn3Mb+9OFhtm9Q7EmNV9IkBUiq7xdS0RaCvTS7Zbxezt41FBuLJkT7A+reWvU1AvqZ
         jnm96LTTdk5VE7HddMJ9n5yuaGrdikVRKaHAMxSXiRU2D08qhTfJNwVX/C8wjQb/CDW5
         xdFE2BjxB4cO3qwZBTFaGrBploiuKTVbmhKttdU/mV0vUirb/6ixSszBjmyEEWm/ZFr6
         L1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737716388; x=1738321188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QpxTL4Qjh5Q65RowGoEAMODcPN5gd8f6xLLqccWUofc=;
        b=Ym4Pj0Zrb3kBcnM6pY0ajUs+yhoQglORjh84bAJA/7Xl7sOffN0H522JTA+ZcACJsV
         C2R9GMF6/NztDn3o8rBwe9IKydOMESzM5xZHA8bN5BrROWLNBdMGuaXb3rQQ9HyfdIix
         ipnOIPSW0egIOt9OvZloB7jK6M7n9UX551lPwRTQUw1UbQxTH9B12WKgwCHIq25ay1Wu
         Wq204MN854QZC87ex5H8rav2rRloAMFl60puxSukKJVejfrHuFt+Sx7HYDG+qheoxV3k
         Z9Aiz9t9KDwZMgaYvNTa49sIJ/vyZkJRKMJGy3W3RwsaYZGQ2Eq/DAPyd4zypihMEBFb
         QlLA==
X-Forwarded-Encrypted: i=1; AJvYcCUTlp7sN29u08T+qjGAUBn0EQiEqNQhwZoVERLbrN9TnGNf9wWKVjAXQfkhcjiOXYiKgt9M38hf3voS7xwZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6uJQ6J/gTD+I/0JG8/g6Vs+yXmbhEt+VES+v7yjbW0jtyoqI2
	Qr4yTRceX8w3HT6GA986skawW1k/8wuLuZSaqW5fv7fX6BB6udKC
X-Gm-Gg: ASbGncu8p1+CmFPnbzH3neeqw7EUcxE6I3S9Kp+Mt9R6NxSwoExXtvPkT2/sbwaDyQc
	ZKYzvJYcGOeS9gnBlwsK9kUNro3+oW8Mbc26z4UmJQieEVqJMrGB7KUS/Zh3RBqPYj1VXvYfbLC
	BscVYcELGtaMXyPWjxdYQBGc15RunmybBSxAxh1ibh8heLCHgGMo101MJzdAhnH5U5nP57/qJkE
	6ztLKontRMapxbE0Df++5EO+0EQPAK/vF8iIgTxI80HFy6IqFmWW9rCurKWVLZLFFrY1HC1ISVQ
	6tbw1ZgBPRRbDv+IXINzaqAgL88tQ/P7SCdb+WEQ
X-Google-Smtp-Source: AGHT+IHiyJOjCBz7d2WhhEYXNXrjBaVOBWxNdwwdZshz4577j9EJWQAxJYlfLnuDSBjnklWPUSLGug==
X-Received: by 2002:a05:600c:1389:b0:431:52f5:f48d with SMTP id 5b1f17b1804b1-43891460bbemr304618685e9.31.1737716387783;
        Fri, 24 Jan 2025 02:59:47 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd501f1esm22101185e9.12.2025.01.24.02.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 02:59:46 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 0/3] staging: gpib: Fix CONFIG_GPIB_HP82341 build failure
Date: Fri, 24 Jan 2025 11:58:57 +0100
Message-ID: <20250124105900.27592-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver was causing a build failure when comiled as a module
because the isapnp_read_byte symbol was undefined.

Patch 1 fixes a compile error introduced by an intervening patch
Patch 2 exports the isapnp_read_byte symbol for modules
Patch 3 removes the dependency on BROKEN in Kconfig

Dave Penkler (3):
  staging: gpib: Fix pr_err format warning
  pnp: isapnp: Export isapnp_read_byte again
  staging: gpib: Remove depends on BROKEN

 drivers/pnp/isapnp/core.c                | 1 +
 drivers/staging/gpib/Kconfig             | 1 -
 drivers/staging/gpib/hp_82341/hp_82341.c | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.47.1

