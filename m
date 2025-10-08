Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96742F7AC0
	for <linux-staging@lists.linux.dev>; Wed,  8 Oct 2025 07:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908704; cv=none; b=uRo9b7H6M7dtS61sat8VEiF578gkBBt5cx/Tr5BdE/L2VMUZjtpj9RKJZIG7z0fr6P4Zenmc1THSfQgQuIqF2UShQLrZQXKfRzOeM8/KvPHf4ea4KLdqW8BWAk4xwjxm8psoNZrBklZDzBCYqOPnpG4sc6zCTGZGmKuhOWI73Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908704; c=relaxed/simple;
	bh=RyMqVUMoRxnLE2+LH/uDoKbsjsXYMu268PiHdfObUHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=invUhC8V2q4NEbrm1nuQxAc7rGs88vyEu5bJqEDZUWA9T7VLKKmvXVp8hw8v8HMBWOif9j7XDBLJ3xZNaCNVYuxmHnVA0kDpPOdn0LHYQjzbEl4aNMp+GuyIOaN/LLZ7vjVwjMZrWTXnPWKiPafgYa9hRMBi4kDPNzjisdS8hxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lu8M97wr; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lu8M97wr"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-58afb2f42e3so8513271e87.2
        for <linux-staging@lists.linux.dev>; Wed, 08 Oct 2025 00:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908699; x=1760513499; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hswO6VHAbXRS9t5lyAgR5F2WC+ilzEfgsXiR8FyXf7w=;
        b=Lu8M97wrJJNsCkiCH66Q0HRWPLvQyI8wB4M2L4IpLgJqScnIW66ZdE0wsSnURVlnOJ
         dpDG0IuPlhTaciZMzIflx4xAltVLqaQ9GkBSgXixHk25V6uWcTB5uQyUmUGQoegE9WJP
         Z9Z+rGjGleAvWOmnKvYYUPlS94hEdvcDm+2OSV00UZHgZVVV+7ZhuwkhNwKhrjOKjJdU
         Q03ATyp8NLStVbpocY1/7COvJBe0+xedgWirOrQSPeTcJmF2FFRbWNZN2VNNd3Gt+I3B
         mEuFjXd06GJhdK3mjIQbjHLL/rxnRIb61v+hwOdDCCKefMQEC+OhRd/PfR6gLnkS8j9w
         oySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908699; x=1760513499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hswO6VHAbXRS9t5lyAgR5F2WC+ilzEfgsXiR8FyXf7w=;
        b=tqn68vo/69IwqCRqhFJJOZjpr/wPNQu/2ZHJ9E10TMdgvUXtvmVTdxXvQd3LqYEu37
         v2MwzsCZsFH6Lw20vPgd1f2K3zpvbBtgjrMZAy4mySlu38VuXlKstz6hq4oT5WkmPwae
         0xstdaQo06wyg1yQ4u8CaMKLYiJ+fjhTTtbvVr6g8jGLAQl/q14Jj1WRFUX+ayD+eN5X
         Rea4IEXQCgjs8lae/L57ablKxJ7ULdLqTV0ymR8s10XruHplVtiASI9fEqUKbgSADAxn
         xEgGmdVziw74jbDY8XJrznQ0FxB3DZ74+XvI3xJ9rDt/APuLA6u+KpFfiKdgPfYIWMYs
         STKw==
X-Forwarded-Encrypted: i=1; AJvYcCW6LtBLRSCb0cAkEV86bPrH/Wysd2m5SPZ9sEEH0YwSnJcqm69cjq1/2iv9iFhVXOrFqV4Z5Wat9xyBTKMs@lists.linux.dev
X-Gm-Message-State: AOJu0YwzlFyZkQlmG8wSYh0IIGio0VShT4vRwyjZdXzEFge+i3tXBrcF
	F50ezpn9jdpkT4hucPoY+41+LqAW6kjQCPCVznWNP+20dbxo+uX6gXWR
X-Gm-Gg: ASbGnctRgFsBs7bK69IC2Xl5fQtoTBfc9hDkC+U9tC/7/dggIGV40A7GUqAosaOTtaQ
	u5vkz21k5sbiG7Rk7W6lowWs/KAJvOV63VDh4dLoZkl2AE7whMj6Z8qBcOzeLLGGrjdbKQEwquq
	caNxIGzo7KdlVJzrZt0ZmSZj7jvrBWGvtyGMPM2c8ZzmbNJQf+bWsGUP10/yI6ZqZQKMjKTURJO
	SZSjazH3PKxUOtyBvqIl6rIybKy5++dbNTYDI/PeIzRe+GzIyyAE2eq4B9Xb+igMSQUmy8vRQSP
	tRetxk9wvwIfGpaEx8LpyD9oQam96CxoBCPKbvbvNdKjY18cvAkYkyT4LevxhsaXl1jh7AMBFkd
	UhUaXMVUdpjz0lHPqTDn73g4dHWoSKIGMPi8XOupWiTPSXjPf
X-Google-Smtp-Source: AGHT+IEFplvbNC950NzSCz1hsTj2zh7bFgfmbElqdtfxWz+oMV6+2KVz4G+D8Gd8rLXbzooyRNyKYw==
X-Received: by 2002:a05:6512:b96:b0:553:2c58:f96f with SMTP id 2adb3069b0e04-5906db0ccc5mr608183e87.1.1759908698844;
        Wed, 08 Oct 2025 00:31:38 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:38 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 15/24] staging: media: tegra-video: tegra20: set correct maximum width and height
Date: Wed,  8 Oct 2025 10:30:37 +0300
Message-ID: <20251008073046.23231-16-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
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
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
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

