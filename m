Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97566388E7C
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 08:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527379; cv=none; b=FW3C4M8XpdLPumcUoWErx+6zugjDQRE3KhmwG1x7qHbyjmqKDYxw5zXVeYKPq1UWvImAPNkaB22j3ZxOZKAOJIAPWPqdrEGgiR3WkNFFq8hjeceXKLY6eWM4gAVRMAJWnFsw5bmu9a6p+aiX9/HPDQcw8LpBP/L7L1ICClV58pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527379; c=relaxed/simple;
	bh=MfI5zeRl0pyQjV4WKNqmsKtJ3wxSTwwt/NrFXusc/w4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m5CvhnKaSlQPY5GrYA5HOC0mZrIFhg4wquEGfClIhHS9lpp9a2WtZaUELDslljbprAd+JohSOnwN5DfVgI2SsxwC24xyEMoWieMLHAsP4si4Fqk3uJ50JtXEaWHxVmNQPGq3UiFxW/u1accJJDd582y2LwQ+IaCUeo3iIgqwdH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Czlj7O3R; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Czlj7O3R"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-389fad34e2eso87324401fa.3
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 00:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772527376; x=1773132176; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZu8rHNV14RcsNYnYAtHHPAFsuTgdzw+TBP2m+knG7k=;
        b=Czlj7O3RS/FIdfvd84vuma9Yv0Kd+yTf1HGN7Y6LTZqbMbwqUzHWO7jiG4szWryluY
         yvDqPKnJwBfj90ICgb91wRmzdnJWTeXxSpZ3ID7TRQe1eAMJBYZ2xJvg8+wW/PQ9Ig/t
         YvoQsF32/P5vPXxAK8CZDnQ7hTADRQ7IDsVILqtMMnWbw9v2P7kki+v5L9EJZQ4Ns+Mq
         PvvzY8X52clr0w6wMzAhmFHvB+jNzWpNRMdDQFx45EQoew7Sq9r8bcAU50ha4jl+fiw8
         6D7vvRHyQSWq36vNoykZUNwJQXc6C6UJuGrGWBZ749aTYGUnJ0iMSQPo1kO4hEQeEVxM
         arYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527376; x=1773132176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HZu8rHNV14RcsNYnYAtHHPAFsuTgdzw+TBP2m+knG7k=;
        b=XS4idToKyu/UkKzcTjTRvdXsxaaWmXBeV09n8DQZJCLFBbxlVAnf4DzHKQxXfUFs9W
         Q0b/hYmHErg7VVioQdDhf1gNghCgqK/koIT48tE2wKtFWhJAiq1sVV8krSjoD0sfCHVe
         2yRTogpdcBmj35Nlo+wg+uS+yEH4detkAfxHzvgvC3vEfNdABX2oqImO6tV6jSKaRABR
         0i3zL79wkXcONKXeq8vqCy1v4sJ7fslnTTm2WRBQEA3I/NimN5FSX7JMY3BtBQhyL+No
         pXLBmeHDeG6S4ttGbPQGeLvK1uNfYITuXtwRAxNK6oDGuygXHuL8WcGQf/+J+OkiWXSI
         0RkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZ22R7Y/tHe8acUz0lMJm6VuFOsjO4VLkLzGFsVJqg1wUkDoOCl3TMD7X8zs4fc5V5f6UUufRCKKf6VMIa@lists.linux.dev
X-Gm-Message-State: AOJu0YzMa6ri0bi2TqhL1zWZcGonbpKbIywUSItJ5SF4mI9SdXo3YwGz
	v8NO12ykcn2XTWbx8UKDYvZ3tNuNAWpRFAaAYeIqPI/Ahu/pLEhDyy2f
X-Gm-Gg: ATEYQzyBmiDo+q9SiIF53+lPiBUwaa/oxhin594al8Is8F2ph/LvzVNuHNu8M/7i5i0
	/GPC5JnKi07zQpqBw6kjRdm2lUz2S9CkFsB8tvOTHQQdJ1TVenvY36ZJ/8B46pvsGGcwirJ+PVg
	klOXcZQk+XReTQwCdYij0H9dH/fNA+Ef7FLVUMczJIWbG5bIsbVgXs0oJ9ady5QqdzGA8kLPO2v
	uSSt1VNkRqh+fOfevOVXHFp+HFjMLAXe/55OQbwVBJPKcDeoQTM4/TvCKmL+aH0lf0ju/I5hZF1
	42S7rb5htMsx4qdzFZBdCozmn+HEjYYYaZcuU/wucV9ZgKQeuXAK8hrxP485p8pHY3AZxV1FhH+
	Ojh6YSesoX96x6Kzctt7FOjdDWzQmPu7KlY1JGke829XZcGXjwSxjClgZr4CQYku7T4XBw2TfW3
	++2wvhxOjCv5K7
X-Received: by 2002:a2e:be23:0:b0:387:1836:e7a3 with SMTP id 38308e7fff4ca-389ff105659mr100636351fa.5.1772527375546;
        Tue, 03 Mar 2026 00:42:55 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:42:55 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v7 04/15] staging: media: tegra-video: csi: move CSI helpers to header
Date: Tue,  3 Mar 2026 10:42:27 +0200
Message-ID: <20260303084239.15007-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303084239.15007-1-clamor95@gmail.com>
References: <20260303084239.15007-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move CSI helpers into the header for easier access from SoC-specific video
driver parts.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 11 -----------
 drivers/staging/media/tegra-video/csi.h | 10 ++++++++++
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 7842104ca933..f858c05ce6c9 100644
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
index 609c5952e050..2b4d586d3845 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -155,6 +155,16 @@ struct tegra_csi {
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
2.51.0

