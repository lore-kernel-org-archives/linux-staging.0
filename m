Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4BA2F5A16
	for <linux-staging@lists.linux.dev>; Wed,  8 Oct 2025 07:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908693; cv=none; b=dCCTqO6S44AOx+qURjeM6r6eRkYoD0TXtJOc9Z13ncvGA4MaV5/sH6x6v4/xahd52hTuTqSyX/OhXRm5n6ZeUFCxhQ/6hm4p4wFPn4auEwr53W++KG0XeqbktuoAW3wKiMX2YEi50YDfZYMTjNaUjZpWtv8oLq1I8/gYz0oDajs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908693; c=relaxed/simple;
	bh=EkGBXhItwLWxgQ/aIBX1I+SuRG7//x8trI9XTwjIFpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d3S6bff78SJPdNrXcDfNB92ls6oX0COD0Rf56C47d7nItDhU7rGggQLqJJntYPaMkgIQGHJAT4OFz7RU/0fPVRnOPLGVSsP5XelbdaidAeRPASbwWw9d7ySboX7sUwUrV4jaaryhVDUajNw9GnDZW9/nEV/jWefY4V4oUTyXtE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1lck9P+; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1lck9P+"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5906665139cso1801509e87.3
        for <linux-staging@lists.linux.dev>; Wed, 08 Oct 2025 00:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908689; x=1760513489; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PboKxjSSvW6h8IWsKUFqt3oWZleCNVGyc+XkVJL1pxE=;
        b=L1lck9P+ly8xlYZqpGS8k1puiVdU3kJ1lhflcwufIVrAjNiQ7msZ8mxCUDTrU1NBL4
         Ej70qzzyQiY0S6bE0rUkDV3Xh7eywg9x4mvw1Zk0J/AWdmDZ46lDRVvl/mspaXVFkdoU
         t7uWoRaxHZMNfqpRH05bKZkinb2YWeXIjSvuyUZH6x2Lf7GpZVS5gVz2cONYFENu46TM
         rkdA/eZZK0CwZc6DecU3oYwZMJRHk/cnPY/IENnjcmav4mAm59mRjqJ0LIuQODJzvxXx
         ct6FREjxNM3+XUeKw02XcECgGXMT67MKsPNppuM01Z3HG4ThEeuUWSdwKdPCbQgm9F9R
         4YlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908689; x=1760513489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PboKxjSSvW6h8IWsKUFqt3oWZleCNVGyc+XkVJL1pxE=;
        b=qvwNafq/ema0TbRfYJUiQOAJo0/yyXc/KsH1yCsMyVZaPTUjNoPEgM6z0SOVS7jDRY
         oAhoHNTzVKmAYoh7QbC0vyzyWptTatVR+gVyQInIYOGpKEWEXo/iu+46wIuQZ/FEsV4q
         AlfBEW+uCYkX7Ft202OG8+IU8YHtBhFDg4UZnZUW6398iqxz/WK3FKeOZ3gt6wjWUere
         o1HIvhINGqps5ePn9mFgd6tzuTXdRT9HXSkeV1tcwNRsYncc8VwiPd3oT85TiCYyBCkP
         OB82FEHEFNHcximWw6xoezaMAu5wRuAri7B4Bb3kJMl5MjSDMyI5kpoubyRvF1PKhStu
         ytXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWevUoiT/n4CWhEl3iDs5pcOTkhnq8OfXtaRYxj7ZFmFRd4mmdtgg/OEajvyVfQ4hCLuE7qikjMOju1Palc@lists.linux.dev
X-Gm-Message-State: AOJu0YxOEkjd7jM/v0yyZrvfoOINh6GECcZoGf+u3uZNSVgOjXJ8Vsho
	2WIIQkya01IQBcsbASqSdXt+MpLxYL7pLudMPc4SZRK9N8pC9ez3+kyH
X-Gm-Gg: ASbGncsFb9ozC5nFgeF3BE2k22cHRDiciXvr+kz3fJu0xyu2egtG2uxcso2iNk1qEWk
	4OOgKBwXv08U3mVSHi4+u9nLSac3uxkT8sLvWN4EH8LmJEUrWUxLmiUIxkESPVNNMeMvkY3ZHQl
	N1w6a8+FB7KkI1DHVtuTL0Jo4Y5xhHG434IgtNl1G8m7ixLsILZBrG5y+DPKGsG1yFAmmueWg6A
	Cb8zaBXS8wQ3Siq2yUo54aaFy/jT4h1h4WdFPUSl6FhBTzOtwZfPhX+zcw7BihB+/sQOdRdjkrw
	Tcwnugzlh+NhpL0/+vDzDHL+Wn3dyBhQd04/rMsPyHk5uoWqkTxfbRXVDV2YI2atRbbCZ+57Bt9
	nfb5iMxAxz6C3NEr61BMr+TdTnpnwZi+RFKvBQA==
X-Google-Smtp-Source: AGHT+IGnZcqKqG0CeOtJ+fmzvG5biXeb/ChpdaHmR1TP85hnqOnS5yRC3IE90h8eaQFZIrYCt7o/qw==
X-Received: by 2002:a05:6512:b96:b0:579:fbe5:449d with SMTP id 2adb3069b0e04-5906dc14a3dmr717226e87.24.1759908688715;
        Wed, 08 Oct 2025 00:31:28 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:28 -0700 (PDT)
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
Subject: [PATCH v4 09/24] staging: media: tegra-video: csi: move CSI helpers to header
Date: Wed,  8 Oct 2025 10:30:31 +0300
Message-ID: <20251008073046.23231-10-clamor95@gmail.com>
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

