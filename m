Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573D834CFB3
	for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 14:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142901; cv=none; b=s+Gkl1jwAqlziN7TkhL8vnty1w3caShpyGha1VcVTpjSKdtBKOO3foK1+Ca/sUKXqNizKC/Hqmzt70VRbgHc9iVTZkPvDdGgja32KSqRY6rq9c1sh1sdYapQNe7Ypnyya203JKkG4Y282QvHMoRI3w4C73iYUKie1ktRJVUYpQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142901; c=relaxed/simple;
	bh=unhDWU3j7HXm8tKnMiJwHfKNJbf2ZhuKuePm6ASfLQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kFjXB4/wMRrtZPTBAFhLR97UVahFsRLd8+EKYCrNA566pnKvkLwqjynZxZxKRkGc4VjZNXk4+AS8JV658hd9BtPWZYDy4Hjvo16vCQr+lKLjsPNiDa2j4iY64RFVnmH6TYsp8xWo4c1GMMuPm2AeUsjMxEPbRTf6ri1WIcjoYAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iq5H+3TV; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iq5H+3TV"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-471b80b994bso52779145e9.3
        for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 07:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142895; x=1761747695; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rAO9OwRfZdFmlMl3mS0tub2HzSBi7qv3ODFvIZHKgFU=;
        b=Iq5H+3TVu1KDbVqm8bVWBFGcMgduWj/gAct7BKIWJ0wP+W8NMMA4/gcYFBvs5Q2LbU
         caf5WI4Yhf8i0ySTdQG9rKbpQtm/4fmRjIx2TxDH+zZqMkjn4MqOKlTA7U9M1YCxoFjq
         BlrVo4nqtMf/PffN0P7oS1WF3ZGoc1+tUElBd8APDNfMxO1rtByU8pt475GzQP0otSit
         bAlTrp9HNz3XI5g+ifpjplaY96yvSr4DuL4xadAMxx3IUPdPwKW1gbtqW5JWL3FJ2ibK
         OPhPy7Fqpi1CjWq5FGU2fVW2/WY/QMm3vten/m3TMcQ0Q2/s4AZ0ucgccggiznNajxyu
         73Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142895; x=1761747695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rAO9OwRfZdFmlMl3mS0tub2HzSBi7qv3ODFvIZHKgFU=;
        b=pdjEzUsLlzV6TbaM36kEoZ2vlfbBpGKRZC0tjFfZ+EopIjhDO9H/s/Bbdi5MOKuoMh
         5hoIJrElu/iAHrvaSxoyQTg4yYq+djt1zT1Dfa3ufVSskoNkWKmDhwPvxRbUg9rpvbtc
         15SMU79AeU13Dqpp2l4ZdzPY/5OLqwrmYBhjVOhsbS8//dt2DFykLDA7oBgdfmGX1MZQ
         HVsxn9jB7+ozObDeSVaQSdfhOPE8OfQn5tW0/zjFn6Z52DLOa0jFn2sKDxs+eEogEj7F
         schduY4OZwqmrW8Uxw/0QxI5NMvgYwf8eN7rMXOp1WBVamt8YPkXXshkCExIz4WTRQ2j
         2EfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOYnT6fQsGofQmzNJPJus9EIdEHj9XVnJtbUspDWk9dIRQZXPfxO3SClROc0RpBBUUSWqQaLp0lca4SOcS@lists.linux.dev
X-Gm-Message-State: AOJu0YyBksww5fqFcvO3PK/d/yDBZp5VQZ/SlvaL9XCJ6hey++OkEkOy
	u2/zQyyEKTXttc9XxJYNB5ptJefdg7J11ZUcmEgdeZY+tnfiWEvigbGL
X-Gm-Gg: ASbGncs0oXEkK1cDCHOKaMCSUevASvNTl17Wjg1/A6H/+XTA9P5YFFmgE92a9JRjXyz
	BkFn5T1tbM/1H9ct4OdGmxwu5z0h9ebssVG5XgC1gouBhGAqAju9cXdonlLPx1eouR977TmFm6m
	aDXIV2bPvsNjkdpJSyskQiGoSN7lcq12dsleDXdIHxfhvizVgdrlKBJURI+cBKdS8Vm5m/u+IjK
	OhGttRCsaDTYDXwqUEtE9BgDxVyNMG/G99FwV+m3Zcu6fgV6Vu9PitsGlbEl1udEuasDCwyGQ0t
	cMJP4qBcHhutviDjushSKGgpHxiRGy0arTABhAsuwQoUwtG8E8odBxBZIu7lH5+as/nQWJ7d37R
	DHhsPKuGZkja6qgH5toScbnbdpTCqnOJ5xn65VvyYFnAo0E1Ydt9pDLb6tZznqmnYuVC5upemsv
	owVQ==
X-Google-Smtp-Source: AGHT+IGaJGEihzS9F6fnNyhHVGRwXCsOXdE9dlWNhp4wiYwBqGQCgmFf5u4C0KR9SkCEnEJDDokDBg==
X-Received: by 2002:a05:600c:8284:b0:46f:b43a:aedf with SMTP id 5b1f17b1804b1-47117925da1mr126433075e9.38.1761142895124;
        Wed, 22 Oct 2025 07:21:35 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:34 -0700 (PDT)
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
	linux-staging@lists.linux.dev
Subject: [PATCH v5 07/23] staging: media: tegra-video: vi: add flip controls only if no source controls are provided
Date: Wed, 22 Oct 2025 17:20:35 +0300
Message-ID: <20251022142051.70400-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Because the current Tegra video driver is video-centric, it exposes all
controls via /dev/video. If both the camera sensor and the VI provide
hflip and vflip, the driver will fail because only one control is allowed.
To address this, hflip and vflip should be added from the SoC only if the
camera sensor doesn't provide those controls.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 856b7c18b551..90473729b546 100644
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

