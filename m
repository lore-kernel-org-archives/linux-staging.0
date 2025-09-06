Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8DC3019B3
	for <linux-staging@lists.linux.dev>; Sat,  6 Sep 2025 13:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166874; cv=none; b=IsEGEwiFVpf5FP5wCHjT1TtJYLmA8tcKrssqNSdLd0yhqrIuygfC2eoG0ZJgS9BCiGnoPHUl2xtWEg8VXStr/Kaa6Mh4LJLfQYkQps+jl01YBJzry4bJeinq2PVVU7P3t7kcmwcMOYpgAwdB8u5IXkbXiSDnHY4V/AdjPERMCzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166874; c=relaxed/simple;
	bh=8tnFIzYEyxTw/7CgQvAPM+N5YfXOp0o7es7fwYlU3MI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k8Cf5a2Um/CocQqxyVfUmX0DBxbmeUjwou5a9IxROnahXqS0ycn6W8Mq6sVogc4na1iYdgT3fyFm7Oo+jYfnCTu0OJqajQA7iTeAaZf99dOnk5nyO8S6Tti1nqSMMw2OGmc3tDJ4yfSydZ1Be3JZU4ICNnnOC/p/VuIPdJ9uyd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HBPVJ4YA; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HBPVJ4YA"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55f716e25d9so2854433e87.1
        for <linux-staging@lists.linux.dev>; Sat, 06 Sep 2025 06:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166871; x=1757771671; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mhDgiHOnOUHFnbDg3vpOrqddC2vZG0fv0IytpHCc+Y=;
        b=HBPVJ4YAYbXLWK4OAsO3pFVf5eXZj3aNl7ioiM06P1fJHMq7Q75GOFiF2SJEBqsk0H
         bBYp1wGXmxzHJxgGy9jJK38a1kLzTuOcPgWHnlfgRK4jFFThLLBIQZ9VHxnHvcPweeSK
         dSwGITBRixJ72p9fyACand1S5S8sCx110dOFh5Zm1q5kDRE/d5SqzMxmrc4WPGow3+6k
         yxB2P42DVTjaDwvjIfLkiUXn2ipwtHKR7+LZlAyyBOrVl9NdqXh58LVGhAcqMCddTEhi
         q59MocK+py/H6xbxKDkDMihTtfLx9QkTMCWJMQQ10x8Gq4TL/0jr3WM3Qw+xdhbNkEy1
         S3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166871; x=1757771671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7mhDgiHOnOUHFnbDg3vpOrqddC2vZG0fv0IytpHCc+Y=;
        b=O0x1sE7PfHzzH6yYVvRjo9TJPknBABQ8kOfNoZsv4v1SmnUbaDxj3vzzhmcInAtJZZ
         5coW7Iper3UDKlJo3ahlR1ZKt+miVm31nmpsHTEG5j0bW5r9T2bfc9Ztn6WbVnjQKFgH
         zFQrQdsZfK9IQHC05bTpN2/U/FJe25EfnMkLp1go97k/sGdwMpSCUFJTGJE9IGSSC5cI
         miGva3AV+yg3Ry6XBuMff/Z1tR46isN/SDuU+zmABm3kbJnwixjPS7CNCA52IaE11Fh3
         S5cu13tTqMUABI1aBdFK5+JgrJtnhlcotLWcZ7YrFyXRw9+rvVibQ5X/ezyXJJkS0emu
         +HmA==
X-Forwarded-Encrypted: i=1; AJvYcCXXUg6Brb8uyRoIspfk5a5hhy9+t4i4eeBzbvJx6VxdkpCKkScvRMM+INlQZu388+p4Zb13KW4tfSqCqgZD@lists.linux.dev
X-Gm-Message-State: AOJu0YwBxRUyTOPXW6etApPVNiuxEE0LBPnnYSKMP8vy+13G3vNM+IlU
	lb/POwzRkft4CFSaYA1/okVC/Kmpb7OcK35jlD+biG/Ux3O6Pc3TMqy4
X-Gm-Gg: ASbGncs+/1a0CRFTmcKadFIJOMKXIFu+Le6EC/YHx8XbBb8AN+c+CTOEJFyq4h9xZoB
	mYIJhV04S4yA3XiABzGSO8BcIUG2FQBs+AFY7oPTX2PmsjBm3ZX+YSqmL3BjvX7QSlnuoiw4Ulm
	p1RRflVw9K3U3w0LW0qhnCsj3KW+1ZuQtxt0EQ8R2eTRXH9ZAQHuQmskUhn4gzYsZDj5JKc9D0E
	KpwQXS2IP5l5kPSlIQkBKne9oYa5FIJyz2Y1Et3h0wTNUfau0uTrIKyWnw9InyPeUiFTQp9HETx
	fu4oBcMbZYRB3JYZsvcvkPxTz5pxRnhwyb3yr6+DMqGVTnXZTa4msPx28CKclexw64H9aGlM+Gn
	2QTdll8GWTRXCQUdNcdVDiQGFZ5rbP+MM+C0=
X-Google-Smtp-Source: AGHT+IHEazhMUm4QC3TD/od78UfhCFya+ZuB6sMvgFxZAijLSg9k4+KtNdbKBe2GJTxtOek8Ckzs1A==
X-Received: by 2002:a05:6512:b87:b0:55f:3a96:936 with SMTP id 2adb3069b0e04-5625f90ee59mr671609e87.15.1757166870721;
        Sat, 06 Sep 2025 06:54:30 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:30 -0700 (PDT)
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
Subject: [PATCH v2 18/23] staging: media: tegra-video: tegra20: increase maximum VI clock frequency
Date: Sat,  6 Sep 2025 16:53:39 +0300
Message-ID: <20250906135345.241229-19-clamor95@gmail.com>
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

Increase maximum VI clock frequency to 450MHz to allow correct work with
high resolution camera sensors.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index e0da496bb50f..3c5bafebfcd8 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -590,7 +590,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.ops = &tegra20_vi_ops,
 	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
-	.vi_max_clk_hz = 150000000,
+	.vi_max_clk_hz = 450000000,
 	.has_h_v_flip = true,
 };
 
-- 
2.48.1

