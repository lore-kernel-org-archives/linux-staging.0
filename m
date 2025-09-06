Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262112FFDEC
	for <linux-staging@lists.linux.dev>; Sat,  6 Sep 2025 13:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166867; cv=none; b=tM0w+lloVXIrDWx5qhBKGWBDYBTBsTcGvC7m2ehintNw4/8r5/TImSNtv8ms2rQVpswOg1UTsX6dXRVYD56AK2Hvz0TJEt0uyP00jqghxzb4kgNBNsqpx76HLZcoTgmYO3MLbrf6m+7ofWlHZfc7TpdyoNYNaIFEaNTf0GzLlvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166867; c=relaxed/simple;
	bh=yUPRW8PzJhxqKEYGFHeoRk0hg2dhQG1xB9Q++hNVuuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M0Wikr8YzYLV3fXr6hrNlFeo4X2SpAER9AvkxPSf9iFJju/J48E5szh6yx8ChX6BQs165q+oBnHDAnYnphREMNH1NVLE3k4h2Xx3ggbGvWXsy2RhcXDDHduZP98MG+mrR0vm9kx8ZaX+VBmrfnEi1l2ksfTOXNeC5kZfF1nL87s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQGAOU0E; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQGAOU0E"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55f720ffe34so3952910e87.1
        for <linux-staging@lists.linux.dev>; Sat, 06 Sep 2025 06:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166864; x=1757771664; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rFbfOnw0ovhU07hOjO5egRNR9/9PjyUG+9rcYSQ22M=;
        b=KQGAOU0Evo8sL+QbyJ5zotHUZFYPUL/ayCb7nMnkH++kp6qdqYxL43N5yMzB9oWZa/
         eiwBXwNt7zPV7PCh8287w6FAwg1o08BGh6lryOb5C/1w7i8JihJf1G4PKTME7Js/h0QZ
         rFqw4MaQFWXH8QQj2BVQxByvwPXOPiH541+hyw8GwQKm4M+4rvj33th9eeo4jLoFfEpz
         /jEJ93a6Z5TlRG+MpDWYbCCLG5XPYZPuvE6U/J7ydz8pKlgFN9YCxISviVQ6YlrZfTDt
         whrYb1Fsreid8FqC4eBiWIWvRT7Rn4aN7qK8zGxuTRPpwwysJ61YlnP/KpYIgxty8deh
         aP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166864; x=1757771664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0rFbfOnw0ovhU07hOjO5egRNR9/9PjyUG+9rcYSQ22M=;
        b=O8S8rSWkC04KfW5sGtlcrVV+8Wsm5kFcoChi8Hfwobv4BRutqSD/v6c203oPwd9iIB
         EihesJqYHizSmGom6NJePUL87qKoIf945zBniNvUV2N+ti0AT4RLZX+HPj6s3pVZFMtw
         SiWtSJQkYh1hJnZQCxiGUQe524JEXxanRfv2Uou3zU8yJC1JceZryIn//UB2vSuKLVQe
         x6t1de18X1T+N2mG1HdWAAVyTDhWm5oCUr9VqHX/KbDbEuu8Hn0OmhsyJ40nBCexGzUX
         5WpJ6sAz9dX07jOrIXIPZnu4k8JtWvsX3s8KFp+EUpy+ztqmR2WCFA+IdNCn/2jAreRU
         fKVA==
X-Forwarded-Encrypted: i=1; AJvYcCWbx4sv/9fkgtaZg66l4t9NdH9MlwPsZVlAPM+kbPwKqPSgzlQcaDash0gjS/dC2UbNxBoJexGO9SlNM4l2@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2ECxqu4FPI0LxN4LUFq2eqgsgFI7OsIVROzCs2Bk22UgCb0fQ
	VEvP/ypkVeUyH9I3yow/MCaezonSsUGH7b+dL5IOAhDhApr6jVYXNUEL
X-Gm-Gg: ASbGncsJvO0OW2YWG/RHj85HvsPUvl81pCJSS02y9V9p4NolOctJs2ITVCchYeJutPc
	lhIByEVOHXtkDOoZOTs4jsznv1FItLUNufoIzUoe3HGZTDZrmBK33Kjgvakmve6pi0EOC/bLxwV
	QZ81GD2SFmiSpvCVuJr66vb8RxHTwB5nT4M5XWgcGoVn8LbR6gbsRwyWKdj7kr3VPAuB/HKxqhK
	31NA4OqPULAfkt6ZQKS5AET8wm0Gq0xf5Wj0otJUJnaR3Cw5SQb0YoPx2cL/jctl8H1aCL/+fnU
	XCtvHZjbFb4pR8aE9/mWFpsr1+XstYvgjadEDFeXAbgDTPZvvkKmFJFtFRwDuGFh030q+hPYb94
	S951Sysm3nK0+2g==
X-Google-Smtp-Source: AGHT+IGLEI0q+3ulE2AcGy+vQLvJcnyT7yWeDJ/WZ3nBnLMGXX3O9kNd1Z42W2XvmsQg5afDS7/KKg==
X-Received: by 2002:a05:6512:b05:b0:55f:4072:d34b with SMTP id 2adb3069b0e04-562761985b5mr636622e87.25.1757166864108;
        Sat, 06 Sep 2025 06:54:24 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:23 -0700 (PDT)
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
Subject: [PATCH v2 14/23] staging: media: tegra-video: tegra20: set correct maximum width and height
Date: Sat,  6 Sep 2025 16:53:35 +0300
Message-ID: <20250906135345.241229-15-clamor95@gmail.com>
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

Maximum width and height for Tegra20 and Tegra30 is determined by
respective register field, rounded down to factor of 2, which is 8191U
rounded down to 8190U.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 461593c49594..3dc26f5552eb 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -24,11 +24,10 @@
 
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

