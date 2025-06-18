Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EC92E8DE1
	for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 10:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240802; cv=none; b=EJCDnspjhTZFeSZBWwRA1BUqIECyn51NI0cn1CpBmDmKAWlBX0cJC0ZRSzaT1MRx/rFg2NnIPWWewTcwG6wErqtFu5Ggr3AuY7Qyt1q67UUw2j7wuqEAJkiVv+RGFFgT6Nijjff44vJgRbCDfNsSJ9kMMW9ELsKcDMRtQ/8srPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240802; c=relaxed/simple;
	bh=keZ1faaIFvVOvInU7QqkuDNgyGg0bkTnRQ6lLbb2oBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jbFN6dNy7Fk7EkPtCqr81yipK+OnXGqzRftV6hXCRM2SsGnePffwj2s/c3wioFivmNf/NGGyXWu+UsBdNhQTyoDzFojTy6tAVwxLq4snIykTZtk0lzjuX0PAZYwT28gPG33akgri0obbo4UY0iov4vfcCz1kolPSR7op3i0mplI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PXIPkcAm; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PXIPkcAm"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60700a745e5so14775789a12.3
        for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 03:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240799; x=1750845599; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81HfN+4Jk8ZhDwBd0SjZBE23LsqPoqzRdiRvC3t8CZc=;
        b=PXIPkcAmCdny766fOPHx5gtE1o72CSQVNOlOwTO331wGOAfsN7B5tK8E7zEkE02rQZ
         Ho7qJGvJzBaqqN5wWy2gJnzTFcp213eazmnpcZ9EIy5ZkKkQmVIu+WIMzWMvRvvYnuGV
         O2qQJm9+YZWG3CiedtwfbaCIh46iWpgZkJ9K4Ok+zT8AMUGIlrpqYyR6GOc8hzhPNC51
         decvdfWDuAMLTePaHkO9ovaKyD50TrCT3JPEHGVAgWzgW/HupkGSM/RF1ofYj7ggx5Zf
         UETe0DFVhmC5n/UZp/+RDMGf4RdCVRefr6d0UMljcvdQ4jQAAY2ED0hWDcG0mt4i92j5
         bIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240799; x=1750845599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81HfN+4Jk8ZhDwBd0SjZBE23LsqPoqzRdiRvC3t8CZc=;
        b=P4Ye8Thbn3Z2WjTiThZ6uI9CCCqs9+YF1r1hQk0tyiFKLYK4goSyZf1B30dPiqBBU5
         N+80tH0QuzJd3UaQeIFcEjmUo61KAN0CXztkObX3WIrLpQGHAVVSEo4NMerRN/TNfgFH
         Q+XJowQg1Fi5scZIAvxHYiJgCzKkq/dHJRCYGtPmdJTg+W0ex3lzSuKwVd6oK/EmVTv6
         8x2AdzS3W29uCyZFHoK0ciSNxBkGBckRq8lb7t4xsp33dNWBuQvG1PwIM2J8w680Kh74
         MFndXJF8PumGMDAs389GVLd9Qemz/MSEHgyNaFy8bPI59UNklV5bGkcOkkduIzbeqf6s
         KtYg==
X-Forwarded-Encrypted: i=1; AJvYcCW+K/eqXvpTxYc5U33v1ZfW8eyG6kKRvMGWp27oj0pSS7M052Kh6tUFEA/hN1QWdhTM4y7pIZk3EGe8mdUG@lists.linux.dev
X-Gm-Message-State: AOJu0YzZEyfe3Sm0lzAPAFuZXUXQMvwaD57wqVMfXFWDG38EGVTWBi2c
	hBDXCKCK4KcL7LB53NX/+hInhrmIWSWViI5igTxM6mEZTzYy1jis6Hm3
X-Gm-Gg: ASbGncs5Mo9HXVqnjbmQsaNIpk2JVuguaNo69MbsgTw77c9vkBgJBanRHVUaFrMRen4
	g8VRkE62HP4r7pBRd+nZyaxHOHrHYvRa8U6XQqNbraxkLkWdJdE4a7ZSs95B7RcircateFcHtUz
	4Uia2W0/s6GbvYqiTEH7YApzKxO1BVSw65WKfKEWJIcIwJQ2W8tRzJgN5MJKx4nD1eBnsVDPDXs
	LLbNY5N0JcF0QCfKqvIYK73z+MnvYgACFMPzO9evX1+5xDS73MHZxpZE5iUgl5ru9NWUmy8Eh5X
	y2ozLXOmvzTC+VlqnR7WAbkLtlkL6zyYLOByOpWJgpgJ2kIWbS+0NsmDjZPXWFcm9Rqq3JZeX+c
	=
X-Google-Smtp-Source: AGHT+IEOr9zNV44WWLFTuOxIUvg/uRqUB3RWX2y9R/qoxpU2YJx9EhRm+2O/OmrkiW4wu8vIyE0epw==
X-Received: by 2002:a05:6402:2708:b0:606:f836:c656 with SMTP id 4fb4d7f45d1cf-608d0948348mr15115181a12.19.1750240799157;
        Wed, 18 Jun 2025 02:59:59 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:58 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org (open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)),
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v4 16/19] arm64: defconfig: disable deprecated MAX96712 driver
Date: Wed, 18 Jun 2025 12:58:52 +0300
Message-ID: <20250618095858.2145209-17-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618095858.2145209-1-demonsingur@gmail.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The staging MAX96712 driver will be removed as its functionality has
been moved to the MAX96724 driver which makes use of the Maxim
GMSL2/3 deserializer framework.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a9..6f4254f562da 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1300,7 +1300,6 @@ CONFIG_GREYBUS=m
 CONFIG_GREYBUS_BEAGLEPLAY=m
 CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
-CONFIG_VIDEO_MAX96712=m
 CONFIG_VIDEO_MESON_VDEC=m
 CONFIG_SND_BCM2835=m
 CONFIG_CHROME_PLATFORMS=y
-- 
2.49.0

