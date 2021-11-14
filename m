Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D0C2C83
	for <linux-staging@lists.linux.dev>; Sun, 14 Nov 2021 22:24:19 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id y26so38226530lfa.11
        for <linux-staging@lists.linux.dev>; Sun, 14 Nov 2021 14:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KAUkz2SRPh78XWLAzuTkM/CtAlT6USvDgmC5PSJlsC4=;
        b=IkfTsXNX2YKbkn4lfSWNNpx04E2sE+JT0mqnydwTWOcL3viNEeFO8WQbWDiUIuMv9L
         9+Z4blaVKFFiq288OO/ZHDd10I55kjAuCcDSPJGXij4zWGSmbPjJOg0CZwXuEbWwsfqz
         JzeGPtv3t3UZmHiPX+xOfMU8ZdbGwP3df5dAkLPKAmx6I9mV44g5SGX0elwaEzdX6Q0n
         xKjoDDS21+WDJTGY//tmTUVJbQQ5L7/kP9NWpZiIVidetsmkWsfDv2sQDm3ez2opda6D
         7hrI/gJ8M6cUQ6H1cG7dyRFEfmdGi654RIlbERMeajRFKQ/5OsRKN7oMRddFimPzGKb2
         Njjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KAUkz2SRPh78XWLAzuTkM/CtAlT6USvDgmC5PSJlsC4=;
        b=4LSIGj3w6RVjkKRvkUU01oyJnbKnOpENwddSN0avOzMWdzF/imrxc+7UtOi/2JlamB
         LKsJS3kWYKpbDY5ubJPazmrfpOogp+jHozCi2mifONTDnKtv3ftkVmhyLCRbren3ivTS
         NuJichPP1OL2LUKizcMi2lPbbqv7YLHXsAIk2vLCA4zGBXzgOz2cInVWUhCauPBcJRQP
         fyy2+ifzAy4Ekw5bpO32LI5e99YjbT1JR+nFnxomA51FhfygAumoNJLPnh4jJea1LIXC
         tG0tuGqWLZ3tlMp0JpWy33zFbwx2gc5eY1V2HtDDZGtBaow4ld8E2rj2fLPaHSr1lTYG
         sQAA==
X-Gm-Message-State: AOAM5321T39IjX3Gsi6PPYHICLLmlPMBIVS5QxN7ZeyqIc+ItOPEHqGT
	j4nkcMVubZMSvlIjHz1HwKM=
X-Google-Smtp-Source: ABdhPJxYMrC3XGSSkzeRtsVyfysLitYoXFFyVKPySBwCCul3412jKa6/XnksEzH0Wh6Gv2vGsb6GoQ==
X-Received: by 2002:a05:6512:3b0a:: with SMTP id f10mr29917406lfv.410.1636928657801;
        Sun, 14 Nov 2021 14:24:17 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru. [46.138.46.211])
        by smtp.gmail.com with ESMTPSA id d6sm1223339lfi.52.2021.11.14.14.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 14:24:17 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Anton Bambura <jenneron@protonmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] media: staging: tegra-vde: Properly mark invalid entries
Date: Mon, 15 Nov 2021 01:23:52 +0300
Message-Id: <20211114222353.22435-3-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114222353.22435-1-digetx@gmail.com>
References: <20211114222353.22435-1-digetx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Entries in the reference picture list are marked as invalid by setting
the frame ID to 0x3f.

Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/staging/media/tegra-vde/vde.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
index 42da57f191ef..ba7ef280423b 100644
--- a/drivers/staging/media/tegra-vde/vde.c
+++ b/drivers/staging/media/tegra-vde/vde.c
@@ -336,7 +336,7 @@ static void tegra_vde_setup_iram_tables(struct tegra_vde *vde,
 			value |= frame->frame_num;
 		} else {
 			aux_addr = 0x6ADEAD00;
-			value = 0;
+			value = 0x3f;
 		}
 
 		tegra_vde_setup_iram_entry(vde, 0, i, value, aux_addr);
-- 
2.33.1

