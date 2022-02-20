Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360E55EA4
	for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 17:32:11 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id b11so14479042lfb.12
        for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 09:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IO+00ag5H9UgwgXh7Y6aBKhP5QDoKDBvcFLhd/QJUA8=;
        b=JpDGxNWG8sLuTXYaiJQxzqnyddLCFDMrLR8cb0x1Gsn2CT+k70tpzV3ThMc3NHMl8q
         lNyeyjUK40m74p/K3qa8zb7zpiDYHVaiMRAXGg3rrwATaf1DKg2zKhjxn5PF70snjeww
         E2TOSbxWtEgcSv17D0ZnApUgjUVuNE+VCsM13nz3x0grKYSZO0YI47ld7/2W0TqBWjB/
         Khd4YUNef2F9Zm5ARfTrcgHm3sfIKJe3nX4REQ/N6NbUKo1G5zanhV7GxxcUcrhESm4L
         9sdseuuiUslEoQkxc7rkGorsr2fGBuLDOwD/tOhdisqbroPlSS/vd+0Sk5DcWDx+cic1
         Ry6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IO+00ag5H9UgwgXh7Y6aBKhP5QDoKDBvcFLhd/QJUA8=;
        b=3SiDKixM4XbUY5r0TXshzQVxps2RyM6N8k7x7rR02/nt+ZrCPKts57e5E5qy1fAdYO
         OB6H4v21tWa5240uYPixc06FDhyCmFFAlIarW/hU+lxYyAfNKwz+hGn6YyFdCgGcZneg
         hCqKE4zcNYyZYC0jpP0EqVKEGJkZDo6Zw3VY1qnrVQH3P8c0u5R9hvJlJAu6llNog7Be
         aXo8Bm2HObb9EVukXSCp5Yg8N7aJ171qpQqAm5eI61lTJjBJ5t+OJKm1snxPS5nz1ibg
         j+xe9QMLL0fFmBIywbhNsgLY2svFvs69Ys8O2MlEFCpJ/j6I8YKQWiJnC90cWQ4OA2Pj
         hAoA==
X-Gm-Message-State: AOAM532WGtrsY82+kBFs8zeLwXesXQHX2Zd4UBDNKgyasJWh1nTlMka6
	e9tFcj/J9+hG6Ks0ErHYgEg=
X-Google-Smtp-Source: ABdhPJxknnG7wpUNWgtPYbvVxTvMxVUm5Eh67LiSqNKka33MfIxMc9WagPQFc5eGtyH2/49qgzSOZQ==
X-Received: by 2002:a05:6512:306:b0:443:5e0b:1d9f with SMTP id t6-20020a056512030600b004435e0b1d9fmr11230083lfp.122.1645378329373;
        Sun, 20 Feb 2022 09:32:09 -0800 (PST)
Received: from localhost.localdomain (109-252-138-165.dynamic.spd-mgts.ru. [109.252.138.165])
        by smtp.gmail.com with ESMTPSA id f8sm880490ljk.97.2022.02.20.09.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 09:32:08 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 7/8] ARM: tegra_defconfig: Update CONFIG_TEGRA_VDE option
Date: Sun, 20 Feb 2022 20:29:49 +0300
Message-Id: <20220220172950.3401-8-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220220172950.3401-1-digetx@gmail.com>
References: <20220220172950.3401-1-digetx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CONFIG_TEGRA_VDE has been deprecated and replaced with the new V4L
options after de-staging of the tegra-vde driver. Update the config entry.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/configs/tegra_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index e7385c10a30b..0a39033a5c6f 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -298,7 +298,8 @@ CONFIG_SERIO_NVEC_PS2=y
 CONFIG_NVEC_POWER=y
 CONFIG_NVEC_PAZ00=y
 CONFIG_STAGING_MEDIA=y
-CONFIG_TEGRA_VDE=y
+CONFIG_V4L_MEM2MEM_DRIVERS=y
+CONFIG_VIDEO_TEGRA_VDE=y
 CONFIG_CHROME_PLATFORMS=y
 CONFIG_CROS_EC=y
 CONFIG_CROS_EC_I2C=m
-- 
2.34.1

