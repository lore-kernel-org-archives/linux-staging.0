Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3AF2C81
	for <linux-staging@lists.linux.dev>; Sun, 14 Nov 2021 22:24:18 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id l22so38235560lfg.7
        for <linux-staging@lists.linux.dev>; Sun, 14 Nov 2021 14:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=48XZovVNV/PbOzkLzCtoiEWbflOcMGPbMrTaZE0X8FE=;
        b=UgVvGAMFXb9vtVkKql7iJujsrJJqhAwxQCwiHDvRzTQUi+Fb6GwlYbhcFSPnNajD05
         afV/+a/LFb5zr1xGqCW+HdhvA1sWz5ABHcKVXLVkQY6Wgyg+vX7jH/eUZSb33nE+zgFu
         l4ilY16549yC28TBbZ8kCsB0o+qfcgaPCggv2GOH1CiJemJ/tv83Xc89wyUn6cd9k8IR
         GiLXCRs2deXQDGs7nmlf01X4Fx4fMqu8qgBMqSzbtLwzntDHT+/6jwf0onpM24cQWPN7
         eHaqitDTh7ETVe7o/oJnqg9Hfq64ld/xGddxuYCSbyjoqWDnS/v2A6jMfQlYio7DEftP
         zjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=48XZovVNV/PbOzkLzCtoiEWbflOcMGPbMrTaZE0X8FE=;
        b=t8RzRuDH46Sgrdkvw6Hu012F3mdLkWTSHZaH+Tbpff1y5nfWahSWL0V3Pf24vl3zYG
         bm313H3gvxS6mccDrkl+Is2BwUsE3TdIcOeWnSWH08FGNyzTaCFc/XV4xhzev7je4qX2
         TjkESSUPVlo1BZYJ9oJfieoGtKLkjAKiYHBmXwHui1yZFSfO99VDKWr/x0wYiMbVRPtp
         LElDzRl7ZOVOAMueNMGmuw48CZJ1i4jyjq+oZ43F7YTx1EO/Y4FyTT4K2Ya6/Qg9IniQ
         5RsMZvV2+mLiCeJnpmUSnDQat1zHD/TN+dj8QX8a1C77syz3ePrD9tJAKI+Lw2P387Q6
         jI1A==
X-Gm-Message-State: AOAM533kdh5rGsjp4eQJBo7Q4Uj9H0sqOLw2L9C+XGgKgRkPsYsRKyA9
	geUd4OsaOJ2lKDDigqsQ7/Q=
X-Google-Smtp-Source: ABdhPJx7CA5hvSVinPXfamTs948Bg57tl1gmgxN88USRgOgCCEs84DwQyamqOWvJJDHXts2zZMMzTA==
X-Received: by 2002:a05:6512:c28:: with SMTP id z40mr29762557lfu.457.1636928656490;
        Sun, 14 Nov 2021 14:24:16 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru. [46.138.46.211])
        by smtp.gmail.com with ESMTPSA id d6sm1223339lfi.52.2021.11.14.14.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 14:24:16 -0800 (PST)
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
Subject: [PATCH v1 0/3] Add NVIDIA Tegra114 support to video decoder driver
Date: Mon, 15 Nov 2021 01:23:50 +0300
Message-Id: <20211114222353.22435-1-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Video decoder of Tegra114/124 SoCs uses additional memory buffer required
for decoding of protected content. We won't support that content, but it
is impossible to disable access to the buffer, hence a stub buffer needs
to be provided. This series enables decoder driver only for Tegra114
because Tegra124 support requires more non-trivial changes on both kernel
and userspace sides.

Dmitry Osipenko (1):
  media: staging: tegra-vde: Reorder misc device registration

Thierry Reding (2):
  media: staging: tegra-vde: Support reference picture marking
  media: staging: tegra-vde: Properly mark invalid entries

 drivers/staging/media/tegra-vde/vde.c | 143 +++++++++++++++++++++++---
 drivers/staging/media/tegra-vde/vde.h |  18 ++++
 2 files changed, 148 insertions(+), 13 deletions(-)

-- 
2.33.1

