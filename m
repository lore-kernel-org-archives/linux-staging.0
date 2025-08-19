Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A6233A02F
	for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 12:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605816; cv=none; b=UahhMqfTqDBETt2XQIdOXg5e5P8vNqS5g26D+O7kb9kN0maLI/vJmrzgTlefveQ4uUxX52FZN+FMtr2xaJLDmg3umyrGWeDLXcvAnZTAglogoUzJD0U36x2ggCNfvOcGpqxKNnvW7aZ0FXEt11/7qqwjYH8cVZqzf2qyVtrCwVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605816; c=relaxed/simple;
	bh=EkGBXhItwLWxgQ/aIBX1I+SuRG7//x8trI9XTwjIFpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GeXwO2Tc2EkXW+2zyPBB04P9bxXIVhT/YNw3YnDTJ54AGXSf5cgfsgNsCJ70qgaadnCMhZJem2BDPzDqOm7V8jR1Kt2isS3g1Go08FtNrRtojwluzKyI+ClXgBPe1wzvImHXh3vd1TxPEyvtEf2exUNZfZCjOtT4N+lBjL67QOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UnoP3986; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UnoP3986"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb7acfde3so730530566b.3
        for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 05:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605812; x=1756210612; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PboKxjSSvW6h8IWsKUFqt3oWZleCNVGyc+XkVJL1pxE=;
        b=UnoP3986guij/+0fT1gbuu3GMjMK/elTmwKvB0cQ7h9elFS4VToz3VKa5B6t3TDmMH
         X6vZ03Pzi+ixrkADOMGx4dciLxZvK3SOU8g3rMgtwoeF/pTQjUhSeK47/eBc6Eadgl9C
         Wp+wJlNBXvkTrmfJHnsdn3XWhc95OZnkLP2GVLSZiF8baDA8iCg5XSUFMu1n5k+FZmFI
         L7YyyYMtN7Ilnf7v/tE3kX6N5QDEv7LD6PZKqtilT3CVYHLITl0mM1wF5smDmzIaHZ1v
         aXX6i6jFhVxnDjKNCWGvMsWeF5ZPgO71dIByjxRY67wyPBJfc2JLnbIZZ9HO4SrCSqO+
         MGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605813; x=1756210613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PboKxjSSvW6h8IWsKUFqt3oWZleCNVGyc+XkVJL1pxE=;
        b=I2RTce9003qy4D3x7Qt0Siie5i9VoF+tpK6tKMO4dV/qo1qrXa+m64FTNevbBYHM0P
         B2zGt87xiwuLyB74UrmR35MxB5fJ022X/xiZjOZoiavDu1+rEAouHsMqKG13SgWlU5xV
         usHuWWZa+JjyU3qreygULoFlSnSbk2ltktN4untbuACwlz4uqX0neGku2tV21aTvE7NS
         aOZl9YbFWEeK5v14Q/k8uoV+UEPUhejPow9ZTux+hRWw7hhNaoPKoD5bI646Ko5ZbB1I
         9xDRlSsRrdJTyOUjbTyhyxKQDF5IVGtLK7+CNo0KeAx1Lz4XAqjEyfAxLfByT2o2uV7h
         DzRA==
X-Forwarded-Encrypted: i=1; AJvYcCWIFeQFLtjO+tv8znlderHljRlHVFX2P+yt+eNGnIW6XCO6jklgEAbodbcbhlamQAVEg5NAENs5jJiMgVou@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+Bz5FijzemijUpatBV6arIQT27gvsCidRWzBlJhsefQludrc0
	+2EEGt1Wqi2mV5fqOeyolpRZHrsIxM23nhgC8SdpWvY7BmuhbO/TOT9E
X-Gm-Gg: ASbGnct11C9xRXwxI2dEQfGOekWTB2Z3ywp1cD3cYZ41r+xA0RtO+Vl9kvnRbH7HOwf
	4lidfwikaQ3VtThFTLxOV+qTKuWYBQDKtFRvuqHjwcOt1gz8NhV1n00OHnWNy3CPJwGufcK+cG+
	vDu3jcSp6BVXPNnTSsp3LjJWP5cOQUYUzeE5PO9Jl7ILQAF2xZXSKGUi01DI+AxBGXw0J3HTmRf
	YYuETZrmbiRgXdMqY2gTsQHKWYILZXwv1jus/ljyZo5ox6rX1znf5vFgWn+/ArDt9OasYNv4SJ4
	2RUAlkRZiaAcJ2xY8DSqs1rERXsaKDPuQiWBanxZOsGFAXZGC1I7zQqshAqmPvs4oiwV6hDz5CP
	SPg5EmNJ2JSRLIA==
X-Google-Smtp-Source: AGHT+IHy3F/e1kSRDlbofyboq4p2pglFSUtVJLGVczC1I6BCAnBxgMTYMS6YyE/2e4b1RIBWu7NZlA==
X-Received: by 2002:a17:906:c113:b0:afc:d5a3:90c1 with SMTP id a640c23a62f3a-afddd21a8c1mr208971666b.55.1755605812119;
        Tue, 19 Aug 2025 05:16:52 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:16:51 -0700 (PDT)
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
Subject: [PATCH v1 06/19] staging: media: tegra-video: csi: move CSI helpers to header
Date: Tue, 19 Aug 2025 15:16:18 +0300
Message-ID: <20250819121631.84280-7-clamor95@gmail.com>
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

Move CSI helpers into the header for easier access from SoC-specific video
driver parts.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 11 -----------
 drivers/staging/media/tegra-video/csi.h | 10 ++++++++++
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 604185c00a1a..74c92db1032f 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -20,17 +20,6 @@
 
 #define MHZ			1000000
 
-static inline struct tegra_csi *
-host1x_client_to_csi(struct host1x_client *client)
-{
-	return container_of(client, struct tegra_csi, client);
-}
-
-static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
-{
-	return container_of(subdev, struct tegra_csi_channel, subdev);
-}
-
 /*
  * CSI is a separate subdevice which has 6 source pads to generate
  * test pattern. CSI subdevice pad ops are used only for TPG and
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 3e6e5ee1bb1e..3ed2dbc73ce9 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -151,6 +151,16 @@ struct tegra_csi {
 	struct list_head csi_chans;
 };
 
+static inline struct tegra_csi *host1x_client_to_csi(struct host1x_client *client)
+{
+	return container_of(client, struct tegra_csi, client);
+}
+
+static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
+{
+	return container_of(subdev, struct tegra_csi_channel, subdev);
+}
+
 void tegra_csi_error_recover(struct v4l2_subdev *subdev);
 void tegra_csi_calc_settle_time(struct tegra_csi_channel *csi_chan,
 				u8 csi_port_num,
-- 
2.48.1

