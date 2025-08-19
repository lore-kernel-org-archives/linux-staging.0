Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832C033CE88
	for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 12:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605821; cv=none; b=nXKvkBjva+3dpRQtyAmKs/2N7yb+03MxLoRcD4+0sGAKRoPyiI2Pkq9tmhZfMzjYwL8H3QkEKldGNVK9gIXvkluPrK+AyuCDbKOEgHn+DQ4tPfiflQGm+FuTezGyO2YdRkrvPsrtHdC/VY7kuhtNmCf7wyIhxB0hJAp0kXlHAsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605821; c=relaxed/simple;
	bh=osCItv1gM5PQB54g4FfDR02SJAqzIhc4j1K8ul5onL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ihWv1hB/ZVNsdUg/yTm/u7jQo3L1Ir0xwy6P0hMZWiYgSd7WBiA6vGsELVm5jUFi0fM8jPBaAfkOQ/tuUYlbZYvJz0Wuc4lKTZiM+QGBOuoeV3EFPB4nUxBr39mmGGlAYauJ/k/lUlk3GydiYs5/U4Q4+2v0gQaF2chxY00QmYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S6A50bpD; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S6A50bpD"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6188b7949f6so9686946a12.3
        for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 05:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605818; x=1756210618; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X39bS8YQI5ECgqe9acCiMShhqwPzQXztY7zHETyiqVE=;
        b=S6A50bpD1aCx1hYjSXa3YCsh65IHcALdzUOOHt+/yqSaj4TnRk7qIGaIpyY6O0W6vc
         0um6oSVgQIsnPSsrthb6wEskaxwOES1LSat2HS1qLAHg8meCydw+SkZdf8UBfTrqaNID
         g9V6DX8kkaiSPUWrZTlowUOZWeYN2/fnlHxACMGTzA+qXnC7xizamJaifCstsuGqz0OR
         St8bUk2VrvZy/78Nwnpw8a4Uo8qFPSiLPV6/kzm7r9sxjyourhw0u0Bl8dEuFY33q6bR
         DymKKmtwTCad4ugmowHP1Sh4gp6QUItGUUX4My+bs/0F6skb80sbUaPcclilBhHJamvy
         RbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605818; x=1756210618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X39bS8YQI5ECgqe9acCiMShhqwPzQXztY7zHETyiqVE=;
        b=OUBgn+U9oRGWJ/746K2/fTGLs9dZEO0H55Y7YQtYJOTcyh0M4UyXdApkEdC+pBUDkg
         S/c/S9x2bMDuH48RuVWXU4lkchOVqsfzcP1pZn0Y4Fc9sHXFmRsSnuqi9hxWjP8XGsO5
         NKvcloYsQH9k6jUYxMk+VH1SUPyiKWEfR80yUuSSIUzq2gFE+ILRU+KIp7JRi9zoa901
         KJh4qudz2swgl6V8Dtxkv6HuN3U6ijlZ1jLG4CHAmDQ9iLVIoDWgJl7IBwavHrXpNBT2
         pbTlJarzGhpfQ2RfISuJXSDjxNSyyeBUX9V3mHFMgvAVq/CL3uemQz3ZT7xu9vSeS3my
         3XeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiXiGvz3ry265lJqf6x8L5OBqHluigFkWxBp4foRN/cbb80Tsv910i/d6KGKo3Ji+A6mhdBb9t/eIbnuYu@lists.linux.dev
X-Gm-Message-State: AOJu0YyHIMd9vzrNlz61MM25fRgq1Zb0clMzGWH0uQ1akWkYEInfqxsn
	91vgraOpkbHeUwRyio7uthE8sGk1SJUbTIQGjIZ9EG166cMT5GZNs0LS
X-Gm-Gg: ASbGncs9fCHxeSyMUBPXvO5n62W+Ik3jHUE7uYRnjHYVFJbPA8ivJlXb0+uuWKpzlgI
	KVVirOHjlx3pUWRAGxH7KBfjSC5tCOSWla3sbErfcrIVe+i8aMTW2kadcVYwZpURT9EwEQYWciN
	CN4jC/DJVhV6/Al4yWaauOaJnzDnZu1Uxv/tTHDz/P72zPv6zXMm8vLK1egmB739MpALX11/WQj
	fYlDNK6nDpiwYLG70mgj8WCz4Kk82+D6ZnePLkPadA7YudO1P5p9K0zF33/NEV4Br+BD6Dg0rjz
	RJym4Jx4xy46eCk7Qi+SHwHobtBOlMK84OudVW2U2C+14v6cBUhJW4jJvEr9d6sIqNjYbbiEgnp
	l+vQshv6mg+tZtg==
X-Google-Smtp-Source: AGHT+IGbpGm2q0e2vT/L5TwS5YIPOoZV60ORppzvUtAWrZ8nGwnpAAbMDs2G1YJK5NIJt0MUou8dFQ==
X-Received: by 2002:a17:906:6a25:b0:af9:6e4a:3b2c with SMTP id a640c23a62f3a-afddd1e8b70mr223480566b.43.1755605817641;
        Tue, 19 Aug 2025 05:16:57 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:16:57 -0700 (PDT)
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
Subject: [PATCH v1 09/19] staging: media: tegra-video: vi: add flip controls only if no source controls are provided
Date: Tue, 19 Aug 2025 15:16:21 +0300
Message-ID: <20250819121631.84280-10-clamor95@gmail.com>
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

Add HFLIP and VFLIP from SoC only if camera sensor does not provide those
controls.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 4f67adc395ac..61b65a2c1436 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -961,6 +961,7 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 	}
 #else
 	struct v4l2_subdev *subdev;
+	struct v4l2_ctrl *hflip, *vflip;
 
 	/* custom control */
 	v4l2_ctrl_new_custom(&chan->ctrl_handler, &syncpt_timeout_ctrl, NULL);
@@ -986,11 +987,13 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 		return ret;
 	}
 
-	if (chan->vi->soc->has_h_v_flip) {
+	hflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_HFLIP);
+	if (chan->vi->soc->has_h_v_flip && !hflip)
 		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
-		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
-	}
 
+	vflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_VFLIP);
+	if (chan->vi->soc->has_h_v_flip && !vflip)
+		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
 #endif
 
 	/* setup the controls */
-- 
2.48.1

