Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2D1346A12
	for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 12:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605831; cv=none; b=Zt3tCoKy+od0HODtfLhr6RlKSu/kiG2HCNTsSXPad70FTsFnFaUxsWH9S1DsuZdQKzCNdEmYuH9+YwSO0+2tyjVg6Jbo5Rq6Y7Q6gAw/kmtfuCznD7QlZZSj5kvFtr5nroASwYxRQiZQ5rDdWk3m8DzNoM9cyU36Hv6Q65WA+Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605831; c=relaxed/simple;
	bh=MSZYGNJEFcpn6E15xp6m+06imWAuOLjbBEWI9PBWdeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YEn1WHJobKdKRardbDm9tklYYx2u7p3rupwqunm4cVBMdrFmU69iHvcU3jmwfkPu6hqicYhonSHrG9SE4EWhjpP4alDm4FT7Xd/KK6cD9z3jwAYgjOoBRig5Gvq+uoh4beuimAQTwHjW/43OKntFUjET0F4tkuO3KPdnIwS8OLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIdD3CA9; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIdD3CA9"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-afcb7a16441so804951166b.2
        for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 05:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605826; x=1756210626; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ruw0ucM84Yq0/DRMCy2d/jkgPYOwi3Fpd3K2L5RAUSk=;
        b=XIdD3CA9w3pL+qwsn82PEiUwVagUaaiT1sVgkBpDvBCeskrBT+nQ+B8TsDsNJ165O5
         wPk13HijegeDlnoZKTNFw9TDOLkXJcq0Z1d6HtgcwnxlcjwnxDmlb3a6vMmhutucdC+S
         +nisobIKPT3Nx2TLVrcgCE+pYmDv/QxLB9et8uVZcaCFCMqIKHzdUysQoAQkZMrMYM1d
         u5hThO0JB75GFckOS+GVraUK/PI+tAf0xBYIQmi3uiTw6i70t9CFHCm3DvWPTpPMOrV7
         WIODteODI8LU2jzXRLmAPJcF2xnByAoZXjIs/cTyXld8zIeJEe8716k/0cPKQUn3RKal
         0mcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605826; x=1756210626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ruw0ucM84Yq0/DRMCy2d/jkgPYOwi3Fpd3K2L5RAUSk=;
        b=f+hs+8URBfAXyBqLKvVX18IDQ7Zy5iIg1HDlBx00QgD0byMcsVBJucTaH4TxvJIP6i
         c49AE0XrLR73IVwePbfewdw/m/vwjpNZrNPQNoyiyBCOnYRz3hjwIfOKqJeXAKfv08eo
         rwiRhnpG6MgOOnnX8kF1hoWFy1jgeJ1uO6LRSWIKhrH7/124Ryt/LzQkZE/8mIVbnqAr
         z+6Ciro7/C2WtxwFFGv2s4heMYX8XwJ43/FmQumQr65pqpTSioanobMBXCPnr9Sm5XZ1
         peAPqcSBlrspUvh5Nf6TgA4cI+4N2F2GuykgyiUOC2uoOcL4cBbIu257lTJP3WcOgozr
         /Iug==
X-Forwarded-Encrypted: i=1; AJvYcCU+dUQwT0bwqbzwHdgugAqKPYISfmmcKsQTImE/AfJPZmmIu7nvOQDr/eW9LeiJtuyHAo3EBpE5+CmydSSz@lists.linux.dev
X-Gm-Message-State: AOJu0YwSjhnpoIb/G3TemOvsH6zdSDxn4vT1ZhJUcESRwpKt8f0ry9Ir
	adXEELkurgsFFAeRiYYgh+14p8/REhUobuzt3JM9it8qZ4WqqPhUc7B5
X-Gm-Gg: ASbGncusQQvsQUywpE/aPjGjgkfxu8n6w4B1AE6QGm0t98bmbym7JAmeMC7l0a3qN3V
	xr/le7etsCbp+I01nkE+A0QTcYugRtTAL9eacBZph+Sd7JH5XEKsPXIbje2PkBLWz6YlRSpsptV
	1OMMME+J6W3Apy+/NG1iePWcWRxThsVYXRMfu5Z7vfp+NlgjYDyJRPD24ftlTr/2YHKVWyKImuu
	hOBY6MFy4IHK5y6uDMYVb+in7c6+OOsE9vee5+yk0997A+dalGZiGqVJYTiUHnO8T+Nin8DMw87
	5ZH0vti74aLhA+uKs2P5S0fAJW4zR0XtMJMof0ylnqiUbOjGW97GgcqlPWLFOT+6C8/r88/VhJA
	mezggMzWRXcQHtQ==
X-Google-Smtp-Source: AGHT+IEaH+8GjnNNMFbsi7+SYVJyxwBXDv0Ziy+pvr7sQlX7uGXafFVlDGk7vl7NvUBiWatUvLDKKw==
X-Received: by 2002:a17:907:d2a:b0:add:fb01:c64a with SMTP id a640c23a62f3a-afddd1e72d9mr235789366b.43.1755605826436;
        Tue, 19 Aug 2025 05:17:06 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:17:06 -0700 (PDT)
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
Subject: [PATCH v1 14/19] staging: media: tegra-video: tegra20: increase maximum VI clock frequency
Date: Tue, 19 Aug 2025 15:16:26 +0300
Message-ID: <20250819121631.84280-15-clamor95@gmail.com>
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

Increase maximum VI clock frequency to 450MHz to allow correct work with
high resolution camera sensors.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 71dcb982c97b..67631e0c9ffc 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -589,7 +589,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.ops = &tegra20_vi_ops,
 	.hw_revision = 1,
 	.vi_max_channels = 1, /* parallel input (VIP) */
-	.vi_max_clk_hz = 150000000,
+	.vi_max_clk_hz = 450000000,
 	.has_h_v_flip = true,
 };
 
-- 
2.48.1

