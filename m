Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41919343D82
	for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 12:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605822; cv=none; b=lcIGvRY8yWIhKTY/yscTGaFNYPAddjumggNcmAEYm+ODxU5d2mTn+DmC0ErYzCiykT9cfcw9bV9Wu0ue/CsjemIB7ycbWChWBVXfAnqICRyJaMZUP7SXxMkHiJ24GezT80ARf3IOqo9RsCvP83ijr2BVTkwX0RzSMedvSosJDJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605822; c=relaxed/simple;
	bh=awI4rQeiGqwOySE7Nuham5GhR2ALw2iQDjgmBhFD8lI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XwL05x9wK4LoZmhla5NrlZmrf/LZIgFzTAgRXzHcVfNoxRhjXT5vG+shEofodWb1enDjEn3wmM9vlbEmYyjxGDx+L3tiJF8WUF80wLYFjT8A2IT/UJptFJQtkmAVBVMu+GMzFXU90aZ6Eo0oZa5LtiVSM+gTtqxrm75ak/EPmVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9n3kSZ7; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9n3kSZ7"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-afca41c7d7fso1055546866b.1
        for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 05:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605820; x=1756210620; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Tsn7/PVaqosvLaCs7iLw7AqoWFV1xRnJguVR9ccfWw=;
        b=i9n3kSZ7bzHaeVpIiIVECwQbacbaBUbJdWqynEIzwxhxfN97vjJejolGXPLoPcAnZB
         se7xSqarOcrqlMXZ72VoJKI6IVl0TDQ6V79vKfKWI02SVzXirfs6jEqLw4w/mQj1c7KF
         IAdO/rvowwMw3yxZQmlKfKCzBKbV5Uzl3iNlyom89PL0MhxuH8E/LL32ViYel8JvIUR3
         8jD5ZNEW/9xBQjlRR9owAZC0KXbMQtzQJBEGX1mz97E/OybnVakkm9GA4oroFMj6rImS
         L2Z/+xgR5iZWDBNVmQlrnibq4TAYy2F9RvQfAc8AWEwCNySENdq/mYNdPjeTd6gI5cPa
         2ASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605820; x=1756210620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Tsn7/PVaqosvLaCs7iLw7AqoWFV1xRnJguVR9ccfWw=;
        b=K6kJNhtvccggM58BLtdZF4Rn5QUFR95S9uBVbwbDQpXpx22XMEhCvbq2+YuN7UjTnZ
         k1KvAh/GY0kPBrHptTcq/AUdtoSeCip9lShFmrL48k7xP5oirVC/6lQ5Py6G88AFY9LW
         GWdVeq9rk5LJqjhxt8WfsNJGN3A7R0wSqfZizS0ThB1kfNhE+4IWs6VJwmPXErmsKYRY
         dvpUeZjuQD/zvx6q/eHXF3k3okf9RAS9PXnoIiFpi4JF/Cgqi4y71GSQHxYxx1rTcfNS
         /+nIk4uZzyYGzZYRBN0XlfKgFbklHDWM7gsoB13A+c+5U9clMK2F3aRuGzdZRhieKq9D
         e5kQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa6lgSN7xQfDu4d1Yau0QSHmql8WMeWTbGxsY0VJdqwO2fZ6e2XxVAnycvcRjmkZuyppRh3v4CkBkDA/+w@lists.linux.dev
X-Gm-Message-State: AOJu0YyKy7mUA/vFKQmRF5kIs+2YIOGp1uFTCNPAwYT7obZx8z5Ww1uq
	o1tkBTdPA35lGSq/4+zOK61oFqB1hAZYbXzYfU0aaIT52FoP4B43rwz5
X-Gm-Gg: ASbGnctKYuvkL4Yf4rtPacROdbe3ZTnb81a00kIUjB1nNbZPFhjiE0VWbxd/p9kWba6
	hp0GjbLYMctZU3FlmjpK7/fzZ+dzG8OAgyG0eoKSLmCQMZd25cpnn/vlRXdfGxFSRNM2/GuipDT
	eZaFDp4C1k7IGZr5rjtKDHjntK7OkY2oxjys7pf1Kgl5QuA5eO8kTivh5ip2ILF+Y2U406R2uZj
	RiVEKROWkr7EBzaEIt8N1Ko7rYKHcmVxbLtEeIFMFHIdMRtJdwHi6b9aEYn5kvPGaCwBVneAxWb
	mPuy1HvkjrIyCOYKKccRUDxR2inG/wC3+LRlnG26kLEoEihPPoG1dHvWy1JQab47VpK4IuJmprk
	iLK6GGV4XG6/Nag==
X-Google-Smtp-Source: AGHT+IFR03wUf/s5dpcY5Njkk1gUJvemYOHmy3eI5N7Qv20olVtXIdCUE2WYMpm0yBZGx4Vnde7sxQ==
X-Received: by 2002:a17:907:268b:b0:ae3:5185:5416 with SMTP id a640c23a62f3a-afddf091d30mr244037666b.13.1755605819462;
        Tue, 19 Aug 2025 05:16:59 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:16:58 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 10/19] staging: media: tegra-video: tegra20: set correct maximum width and height
Date: Tue, 19 Aug 2025 15:16:22 +0300
Message-ID: <20250819121631.84280-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819121631.84280-1-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Maximum width and height for Tegra20 and Tegra30 is determined by
respective register field, rounded down to factor of 2, which is 8191U
rounded down to 8190U.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 7b8f8f810b35..3e2d746638b6 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -23,11 +23,10 @@
 
 #define TEGRA_VI_SYNCPT_WAIT_TIMEOUT			msecs_to_jiffies(200)
 
-/* This are just good-sense numbers. The actual min/max is not documented. */
 #define TEGRA20_MIN_WIDTH	32U
+#define TEGRA20_MAX_WIDTH	8190U
 #define TEGRA20_MIN_HEIGHT	32U
-#define TEGRA20_MAX_WIDTH	2048U
-#define TEGRA20_MAX_HEIGHT	2048U
+#define TEGRA20_MAX_HEIGHT	8190U
 
 /* --------------------------------------------------------------------------
  * Registers
-- 
2.48.1

