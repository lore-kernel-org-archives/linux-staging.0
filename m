Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2915CA1
	for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 20:46:48 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id y24so2669815lfg.1
        for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 12:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IO+00ag5H9UgwgXh7Y6aBKhP5QDoKDBvcFLhd/QJUA8=;
        b=fyfOOXRdPGTT5ZYvkvU5TtenqAFALurr8qi+olhrifwiYRgjJY1Vwgptang0GK6nmg
         eX0QM/ufrK6yfIsGVG5lpplkLVwKWejdrmFkz32dgivE4q8WNi1ER2XNWIaSHLs7AvTx
         hUQNbvdakNwbJlo0mrBxo862eLqw3kbqHQKNoLhVptbcGMMxtefmSnWIJNWXhrBj0zRj
         T5ejJvZ5Nx6kSGMnz7iqJCqB+RyJVfT+ExzfEPuRfERv79bRfkc3Ow5F68VhZiEbD2DB
         mFxdZylhUJmPzwl4N8Zj+ipC3S5hAZQKNli/DFWFDjsbTDROHg20M2P2C07I9Bkd28yq
         RD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IO+00ag5H9UgwgXh7Y6aBKhP5QDoKDBvcFLhd/QJUA8=;
        b=DwEYnHavgKQcCv4lr03WqTse+Hoo7tdEhOaxfh7EjmCEaAixHsAqUYDKLve83t8YoX
         QRraXDyPEEf9hjgQU4le8dCM3QlvXtKVRqT8f95r/G9VyPBwxSlCOostqiWvsJeLW4+B
         pW7LKwWgac5mFz4zfnqPR3VHne9/rVSthDaD9Oyz+RwrpvHQpCFSxVXD5IqtIV/vA/7O
         M/owOntVVQQh9mdpy7RctvV3To3ZasXMmrkLf+HIVfz3zl1/qFf9QhzQ1pSnhQJPjTwo
         F0EEa/LzZ6a3osEoRq6oww9y8EGq9hC3BCFb32l1R5lZ/uDowR2Lfs1UC9hD+w/8Chny
         ZFRQ==
X-Gm-Message-State: AOAM533+wBVu1IbS7k+2G8N7pCcOiVWHrOLMxeZmb2kylHmBe8V3hrtP
	jP7qDgpC3m/TY7rckuyaqg4=
X-Google-Smtp-Source: ABdhPJxmtfvx9srmoCc5Rw2k0UiFsSVC1z4t3pMwp/n7gS0DvPedg5hR/F67LM7wre3eN5NpMvsn7Q==
X-Received: by 2002:ac2:4ac5:0:b0:442:c5c5:14b6 with SMTP id m5-20020ac24ac5000000b00442c5c514b6mr11634135lfp.19.1645390006432;
        Sun, 20 Feb 2022 12:46:46 -0800 (PST)
Received: from localhost.localdomain (109-252-138-165.dynamic.spd-mgts.ru. [109.252.138.165])
        by smtp.gmail.com with ESMTPSA id o14sm913955lfo.117.2022.02.20.12.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 12:46:46 -0800 (PST)
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
Subject: [PATCH v5 7/8] ARM: tegra_defconfig: Update CONFIG_TEGRA_VDE option
Date: Sun, 20 Feb 2022 23:46:22 +0300
Message-Id: <20220220204623.30107-8-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220220204623.30107-1-digetx@gmail.com>
References: <20220220204623.30107-1-digetx@gmail.com>
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

