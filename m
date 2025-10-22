Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BB634C120
	for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 14:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142925; cv=none; b=S8R8S3+oSlBeegiZefo6YwxPEAqPuirIWXr+GdMlQCB2zh2HL+0EibCp/TDtOARZ+m/a0H0a+jLb4ipdtm1lzFpEAnhXFeO0SqAyCrac1f3BLPGi4/WM8a03WMufGFHJoly1xUGHKum3EwK2vBIGr9dzsKVPeTzLLm7sW3bvgo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142925; c=relaxed/simple;
	bh=DQG+inBx8ZXDHcXJybTvBi9O4BMU38YbAkGRkU7JaQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mw1YH1Bgia1sepNLbKrqmFQX75cYuLEQnJZZDJ9CY4C/Rz3Y+05H7JSBA82SF62Py4VKMi0D0DLkwZKOf5jNiS7VXeQNj5fJX4XoUPpT5qBe+YoEyrwUMGCbPmSW6sESLsQU6R3HSvuGLBkG495MKnk/L7/bVslGLwI9fkF5YbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cb1GPQlw; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cb1GPQlw"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4270491e9easo4308082f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 07:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142919; x=1761747719; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNRJG9b/INfi23des3nzlgfKaLYdiUShg0Bsn9STYF0=;
        b=Cb1GPQlwsj4ly3oYkUD3BjcAkwpSs+sk+OyFZJNqsoeoRK2RXn9AzOaWishM2I73vV
         UOQpG9AhJm+6XEh2C30WNxO5MjQzSY3efOHnrocRrUZvodC/ys+wRA0KJhuMcMjDS5J+
         CTYqyn+ranLc5wOTLTPC+vsYBxSHPYj4+oY7svLltpLt9D/O3CHpjVu2a3tE5Kc4UOHp
         tvHG9Gw69FlrRidPucQhd85eSANSPV89+zcUHiAnkpn1N9hVoImwFoWn4PMnr+TyuOU7
         OIrY3XMg0GoJFKMVtSeDChiRdJsHgMdymw3lG5kV1kXONbKBl9FWC4mUSzJL79ZAiUeh
         oguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142919; x=1761747719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNRJG9b/INfi23des3nzlgfKaLYdiUShg0Bsn9STYF0=;
        b=lBmYGMdkcuijoGM218UNTF2OBS1B0o4gQONMj0VPbFXpZJ9NAGQpqv1epfzgHdiPL2
         gHL83OhCOKlpEqHXIpuiYpSDRZ5InjEFLoT3NP7LJuVEDZfIfETQ52cSqYL/ijFv3eo8
         TFHQsUKFprTVacuCikdF7y2W2kBAvm9OtonuFkljrr2IyGVA9CLxAeV9PIA86DZ8FDSk
         lZH4qa6m6RFWVKFANRuv3re/OOO4zS77PeFsN94leBaormP7sw1k1CTIFuDj3QmOF/O2
         VdMEU8KKt/ndENg+SlSTSm+qPJudItYAFL6DqioXLuCk9jiA27m8xqG5ANx4G3eStGOT
         fv/A==
X-Forwarded-Encrypted: i=1; AJvYcCXz2HP/nbZo48ah5dUeZQZNZ7qCDdXoalu+evUYPGPoBF9cgDa0EAe/FA1T9z95J9ZbxYnT9fc2wC1AAgJH@lists.linux.dev
X-Gm-Message-State: AOJu0YyQkJ8ZbdSfHjXIrJ4lKPHv+CL2I1PsY1e4eUbHSUHhyoFll0J/
	sRXbYY6GgfR0lpH8rn2jrXdxdNo0B8rjaR63pl7li/BUc2Vn5Ap/Tedf
X-Gm-Gg: ASbGncu6KM+gPPz+ZEuqjQjqaCVP0oD0SNXl0Xe9GZD5HCIiNFRPVrtVyo9JKB0s5mS
	lxX2cen1F83RGixVkLknhhmIq2QAqBEtZqcLy7kaCvYxkqjqmbtNjCNueS6Miw5CBqeGg+M52Pc
	pEz3BnPk0gISUESg68RKP9w+K5cG9lfM5trUwHzJe473Vpdq1LNiDAAFbBWSe7G48wVNxRDMA80
	/L2jVnpoXSPEqMzezl+AcUtsakn1DfXqLbJB/m8faYIxDGA/udrFpkgM2WPJWEcr89M2AwgDt8s
	0CRElsCWfn030wwoLeAZtD8WfKg9zRguJa9+0AHTZ3xfpShIZkbeeY22e7VyJwOHRmyu8MoJLUx
	6pGWo5cZiHhlvcGg2IatZ6rVWy70QZHIVOTY+kOuSI3P/WN0RrePkYcwnMDkodTUDiEd/WBHmLt
	nPSg==
X-Google-Smtp-Source: AGHT+IHXd0IcgPPuddYC43FouBDl7JZ23qUq6zvhrCcNdJja7V9zzVEVqdzVMGBz5q8/P63zDQWKhg==
X-Received: by 2002:a05:6000:2913:b0:428:3fbb:8409 with SMTP id ffacd0b85a97d-4283fbb8df6mr11330113f8f.46.1761142918838;
        Wed, 22 Oct 2025 07:21:58 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:58 -0700 (PDT)
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
Subject: [PATCH v5 20/23] staging: media: tegra-video: tegra20: adjust luma buffer stride
Date: Wed, 22 Oct 2025 17:20:48 +0300
Message-ID: <20251022142051.70400-21-clamor95@gmail.com>
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

Luma buffer stride is calculated by multiplying height in pixels of image
by bytes per line. Adjust that value accordingly.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 0457209b789a..626f34543853 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -504,7 +504,7 @@ static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
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

