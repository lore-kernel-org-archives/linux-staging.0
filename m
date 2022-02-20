Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9ED5EAE
	for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 17:32:11 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id bn33so11454612ljb.6
        for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 09:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SYoPT4Z7CKQZG/RxZi19Qq6arsiSyAJia5fwuEqEeTg=;
        b=qvROLuhzXHAvpOjVR7palKoACWhkVigTt/i9NcZDHHqbZ9NoBHzEPynFCe8G8GdZfF
         XE8x3aV7YYd+AEp2QhGKPO70bVkBgYh8REhh5pDAFm+OPfYjfxMINYxTGqCA1fuKhyPA
         VJ4S/hJk+dQ1MLKfe29BeotDHFB0X2OOdAbo3lsLkA7gAOaXlVAnAmFSPMwD1t0yOZpL
         emFTr5H75ESBZWm5KIY59Zl9hXlX/iP7zx5tjMNJbsJzAQFbZ3Ef4o/pQLeA620kt83i
         dL9l1zIEhP5BltwxBym6eiUpEaQgHVyz/aI+A1SnHshW+ZikrTLjDY0Ti9wW/SD2pykW
         WHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SYoPT4Z7CKQZG/RxZi19Qq6arsiSyAJia5fwuEqEeTg=;
        b=fD80mEu20imaVb/wyhp7FULnSIdKq1CObGRREAoFFF/zxptqpI1D/sCanNUyWGoCbD
         eDdFys3kQf+7nFDwuuS69xAofLKs9D3G3sRaUj50C52npNrnQ9cGTJzeOvP1XjEPUNJY
         1AIDIPr1w3Xy8lxWa5XZWU9VJFpPp0Un+DLDWRB8r5nhboNvbtX6PUmCq4+af9ZdYt5q
         BbA0JP4r1hYEEJ0ll2s3c00tKqhxW7SW17N+8afemp5e84wReReqzQPO2+7c14mcbrPJ
         WVuHXl00uNpvOAnr55kuiodOEMddRA15gnuhna8UabpXqcX+yUiXTL5un2o27EdF+ScM
         S4iA==
X-Gm-Message-State: AOAM531stmgegVYOiohOT82KoskZNCIRvnU9mp9JpoUZeXeK27c0EZdE
	lM3SGDmsgO+P3c58oFcU14s=
X-Google-Smtp-Source: ABdhPJy0jHDNiQSjo2siQGsBvcghkwpSTrP8zhgIfLmZQZ0wYfrwBFmVfjDzbpMLDFTURYI2J/VUMA==
X-Received: by 2002:a05:651c:1505:b0:23c:95a8:33d2 with SMTP id e5-20020a05651c150500b0023c95a833d2mr11922301ljf.407.1645378330150;
        Sun, 20 Feb 2022 09:32:10 -0800 (PST)
Received: from localhost.localdomain (109-252-138-165.dynamic.spd-mgts.ru. [109.252.138.165])
        by smtp.gmail.com with ESMTPSA id f8sm880490ljk.97.2022.02.20.09.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 09:32:09 -0800 (PST)
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
Subject: [PATCH v4 8/8] ARM: config: multi v7: Enable NVIDIA Tegra video decoder driver
Date: Sun, 20 Feb 2022 20:29:50 +0300
Message-Id: <20220220172950.3401-9-digetx@gmail.com>
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

Enable NVIDIA Tegra V4L2 video decoder driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index dc0581deea9f..8a360d7f517e 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -669,6 +669,7 @@ CONFIG_VIDEO_STI_DELTA=m
 CONFIG_VIDEO_RENESAS_FDP1=m
 CONFIG_VIDEO_RENESAS_JPU=m
 CONFIG_VIDEO_RENESAS_VSP1=m
+CONFIG_VIDEO_TEGRA_VDE=m
 CONFIG_V4L_TEST_DRIVERS=y
 CONFIG_VIDEO_VIVID=m
 CONFIG_VIDEO_ADV7180=m
-- 
2.34.1

