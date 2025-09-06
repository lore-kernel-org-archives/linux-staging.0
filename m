Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E060F303A35
	for <linux-staging@lists.linux.dev>; Sat,  6 Sep 2025 13:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166877; cv=none; b=b3d7qDHjTjS/NsMp5IqdodMyAb04qP+vfcAR02KaS4Xh3KuzEXuFgHPiqgBWobNhz2+cpMAwNn50hDud85YNwMEVoZYwofO/nrpDIqXycu/b+OKjUXmxs2d8AK1ygko6f/NdOrYnlrg/37ldkO7MtWXdezi9KMuiX/oVePQhxis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166877; c=relaxed/simple;
	bh=fJShAdTcKpZMzkDxABNR7aNe5A8MwUP+G36B3JDeLus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ORsi4FaUgDg5cVGILEhkIhl7zR/UAL7dT8pe18wTYYMMD3PTKPYDlNa6q6QU0Bl93FTR/X0R/k7l2LD4/rk51EF5cH0vo1+ppMlDZwzqBlKLucQIyI8egvBcEnWS4j61/d0/4csfMyV5guMnG6UiTpX2UpEAHYM8u4tIlZo01Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mRTbT/FP; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRTbT/FP"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5608d792558so3492340e87.0
        for <linux-staging@lists.linux.dev>; Sat, 06 Sep 2025 06:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166874; x=1757771674; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNTsfQxNPr67Asls944jtBoWmsz4/ks+GrA5zAOV45E=;
        b=mRTbT/FPj/PgU6x76iW2vmkx3juclTohw/W07i3ZTYgyDhbTfo62gmj6SWaet/89hN
         PYSjaR3xRrmKIpXCOh0cAVd38smIx7ewhFcOeDX8p4RQzbYG0jLleWpXtrC2H4t+dsQe
         KpgEQRzQy13aua+G0Zl+q0RkJPl7+RCeJx/hg4ELL2nDhY2HgRgLe3Qjg5owsCci90KU
         8DYBMafoleFzSCa80A2JU1wr4ZkPkp7xa5URlYbYut/dm6/6Q/gwRZEgArQ7soJ8HQ3u
         yOK+FYtXKl2+8MUeKyQPO5XS0QmazwdBN0HM1tsH/Q3OrGUd2p2OopcQoXHANXkWtq10
         OAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166874; x=1757771674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aNTsfQxNPr67Asls944jtBoWmsz4/ks+GrA5zAOV45E=;
        b=n0iQ2XhRoGT+aGO9RLjOqIbXQG5u/clTlYUT5gC2swo/KtPTRDOhZZEAc/AgP5iCZq
         LZEvSMHLQar9crcWJf4nDRc+o61oLjRFI0GwnxMW3ThPT8ywO6rZuGiVgszjdDtFD6zo
         HP30p0iEfrdcI5RHPsP1KWLgg2/FNEraaUeDjDuWNqOTcf4mDtgGggo5wqO7Edu8wV2n
         E92HLOZ9ChM+z8mf3LqeC+cBjrcyaYcetCLmMUwHhQp8/arIYnSIKNfAqOAgjbT3YE9y
         r5//cNOhcw/gxdcCsjFDDK5TglMluji/s8Ii35gDomU61pmY8L8EhZkc3+3AYXkT0H8A
         VS5w==
X-Forwarded-Encrypted: i=1; AJvYcCWNPdh6z3Rk+RyfVk32xibFEsEczaf1dszJmnIJk3Q/yX69lBqIwjX2AANyaJGvromDmas7s4/+rxd95G3B@lists.linux.dev
X-Gm-Message-State: AOJu0YytZcjnQH+wDVI3DwCfNYAEv4oPy6aL9Q0ICNmiFkjB0MlyFJoJ
	zBbhGBBQWbjuNiKQQz3ir4gpe4FNGP5atzjzFoleG8uP7WRThYGZDfiM
X-Gm-Gg: ASbGnctMYRw6pQY3WBiZBK93qNgIrrCeb2RUcNo5LD4VbJTJXCQvxvNtEEwTQ9VuOm5
	jTss0PsqnJu26yNsDHp8pRPTCjG08X1VpI7dzM1Ia/tFToIHIsGw5azqC9jWddjImxcsN5AEInW
	6P8UIw81qO9vEWPBT9obcSHB6xbsbL466ex5eBSh8RkK6d2aJXSdFuDH0pbr/nVMIzYYBqAopxO
	Ay7mVuw7KDlNVwoxvoeayBjJyVKojmv7kmVi6d7+J3AZPRFKjZKpG8L18qFo4iVmaZeL8nUOXlz
	QxmNnZH05egAPu130FncHrwg5gkEWSKSrpJm6JfXzqfNQcn2hTXQzd0XTMPoQwctnKC7DPuhAjV
	mT9Ko3SGJM5l8O82ZCJEMC7zP
X-Google-Smtp-Source: AGHT+IH1vblFyXu/7o3n3WbTvyGZ3MOBFvdatO7tkrpxQQblaA/pNjQzUSIoFy2wgH3lZ8pHhTFemw==
X-Received: by 2002:a05:6512:2213:b0:560:8b56:5dc6 with SMTP id 2adb3069b0e04-5625f53580amr634047e87.19.1757166873870;
        Sat, 06 Sep 2025 06:54:33 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:33 -0700 (PDT)
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
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 20/23] staging: media: tegra-video: tegra20: adjust luma buffer stride
Date: Sat,  6 Sep 2025 16:53:41 +0300
Message-ID: <20250906135345.241229-21-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Luma buffer stride is calculated by multiplying height in pixels of image
by bytes per line. Adjust that value accordingly.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index f9adb0611638..20cdcc4e01aa 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -497,7 +497,7 @@ static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
 	u32 data_type = chan->fmtinfo->img_dt;
 	int width  = chan->format.width;
 	int height = chan->format.height;
-	int stride_l = chan->format.bytesperline;
+	int stride_l = chan->format.bytesperline * height;
 	int stride_c = (output_fourcc == V4L2_PIX_FMT_YUV420 ||
 			output_fourcc == V4L2_PIX_FMT_YVU420) ? 1 : 0;
 	enum tegra_vi_out output_channel = (data_type == TEGRA_IMAGE_DT_RAW8 ||
-- 
2.48.1

