Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16F95CB0
	for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 20:46:48 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id m14so15032002lfu.4
        for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 12:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SYoPT4Z7CKQZG/RxZi19Qq6arsiSyAJia5fwuEqEeTg=;
        b=bnploH8suwijQrwbMVg3fvPo8ek8FjJ78WxZMH4xFEpTl/H+3XzbOXqDYDdjucMJmM
         ZQhcYcp4Up6oPFzENNMMPbRIg9vKgkRvl0O0ltpe+Q/gFerRBGvUUW3ghxV6t6xW9vpg
         sy2RGPA1ed9EILRbqQXDmVSo1wuUSABsDLllzipwAyKjvMSV4mJ36JHSASZuQgrBdIkl
         ffrPT0bZBF7Dke6MmIckMH3tUdOu+bds08FChgOE/v185TELtmO8r6qh5fvExSAqUJpg
         na5cR+EHpAuOpWOxSGl2gAixN/eMfWMyGHJoG4jkvXu6JhjVXFr1pQLi40q5a5vnW/SW
         Mpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SYoPT4Z7CKQZG/RxZi19Qq6arsiSyAJia5fwuEqEeTg=;
        b=W3JaXbPdohM6wr6LuiaBENPXfaIGMfxXmVAYpOVAeXQIHBTeOsujbTpnK5/BiOew4U
         7tgFbhOTvDN3ClmnC9b/ObZNuG2ZVnTLa/y8MIu/VjTXIGJy95lpxPmD6/efmnp7v7bf
         WISXvdQqZ+rUDRcWFZuZlu2ZYgtIAxrpN+oIxnMHUyj6y2ngfTmoIc3LtoCYJSkMNJWk
         lmv2jiGhvZhMosSapM1TJD0Ui7bQTukbONWx0OD5vWRCu6xRN6zs4sEhCrxjWxhVTY1e
         Lx+Um5Rbl+e71yuj7YeawrUGoh8CNh5URb8dtzoTC3KP3nAHnXYuHTuGsLW3f5LE2BJ3
         0/FA==
X-Gm-Message-State: AOAM531/rUNvfmoJL0gDRj5ZIX1lPD3wf0WDPq1g9/sx+mPU4VhLyurf
	FPbAS/SbB4OQTMGKKSwzqvI=
X-Google-Smtp-Source: ABdhPJy2AsiJXOFIQkabHeV9Ot4ScnYx6th0lVvMfVR9KgtrQJD5mWaAxemvUnRTfuKYKIkg1Q2LDQ==
X-Received: by 2002:a05:6512:c11:b0:442:bdfd:3b7d with SMTP id z17-20020a0565120c1100b00442bdfd3b7dmr11342577lfu.283.1645390007222;
        Sun, 20 Feb 2022 12:46:47 -0800 (PST)
Received: from localhost.localdomain (109-252-138-165.dynamic.spd-mgts.ru. [109.252.138.165])
        by smtp.gmail.com with ESMTPSA id o14sm913955lfo.117.2022.02.20.12.46.46
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
Subject: [PATCH v5 8/8] ARM: config: multi v7: Enable NVIDIA Tegra video decoder driver
Date: Sun, 20 Feb 2022 23:46:23 +0300
Message-Id: <20220220204623.30107-9-digetx@gmail.com>
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

