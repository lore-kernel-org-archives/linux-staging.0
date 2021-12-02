Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2AA2C82
	for <linux-staging@lists.linux.dev>; Thu,  2 Dec 2021 04:17:38 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id x6so33516657iol.13
        for <linux-staging@lists.linux.dev>; Wed, 01 Dec 2021 20:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qPKRVwQNVkeF/2oHH9nBkzmtasV/VsF5J8RVzD1HMKo=;
        b=Aq4IF80sKC/8Nq8jG04N1gWMBtSXqubOSOku8KlTeCFN+5a3qnWSGbAeo8be+KzAM0
         lUNnQVW7Du7W7T2UK5JDDltBHd2klfq5rm8LRWj51/wYCA3xGeRFmKp+XKufK6QfoJd3
         umg5LLYu8uT5O8g1lu6lRHLFNM8mnDke5hO6Vgc3Km+I1d+Cb0y1dOby0VyEEXUv5HTm
         7FlFSnStWTENCIooxmhmseRZ1+kXUPzIjmJCaPoDLIwmmwPD2M718j/Pi3jLN/TH8GX/
         K7hP6wpxPI/+lkgVVhjAm1V2EangV9aShZaOGMnJsExHsdq/7IBusxq2Lxu4mbm8AAMT
         5Sig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qPKRVwQNVkeF/2oHH9nBkzmtasV/VsF5J8RVzD1HMKo=;
        b=sICg3bzlJsHEy88sOcRE8GN3lPLljUEJ1oCEmL1Os+59Wum/lSxd6Mxjnv3OJ6iH3z
         qOFsLRvhbn35j2zkIIXDMFV6xZUFqVHdCWDoexGs61v8XKhAl0LK27Hzw6u9FVM5MWsW
         /KzNeUYMIgLZKpuVr7fCN0ySsDlNPnuQdKwKebPZSqcKzYD08L095Jg5NMns1tvKOBD/
         qOZ/LXSBuxgX5YxX+x1W740lMuqV71Nuf+xdwSlEOPDB/ARd+gdlQXB2rzZVM1KQb7oA
         xobWhK9qZOyZv6xwOi/DhnQyrBUIJ3n+rgQxQboqnOx8QQ/yJM0ZjMjZMzo88UOGsjKQ
         OILw==
X-Gm-Message-State: AOAM530fCvL7Z6do4qalIXNSliTuvpwgmiEX+QKlWg+bYT/4vBGy1Qdw
	o6Yb8FS6438gL3yRmfGcWn8=
X-Google-Smtp-Source: ABdhPJxU4grEfANbv0EA6rQMSvRxuU7fvEMYT9BFGz6z7/Gf0+x1CBURE4kpWtALUj5mk0dVs+XXlQ==
X-Received: by 2002:a5d:97c3:: with SMTP id k3mr13150301ios.191.1638418657366;
        Wed, 01 Dec 2021 20:17:37 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:c405:2c26:c2b8:506e])
        by smtp.gmail.com with ESMTPSA id t14sm1030603ilh.62.2021.12.01.20.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 20:17:36 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: ezequiel@vanguardiasur.com.ar,
	tharvey@gateworks.com,
	nicolas@ndufresne.ca,
	aford@beaconembedded.com,
	hverkuil-cisco@xs4all.nl,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: [RFC V3 0/2] arm64: imx8mm: Enable Hantro VPUs
Date: Wed,  1 Dec 2021 22:16:25 -0600
Message-Id: <20211202041627.291625-1-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i.MX8M has two Hantro video decoders, called G1 and G2 which appear
to be related to the video decoders used on the i.MX8MQ, but because of
how the Mini handles the power domains, the VPU driver does not need to
handle all the functions, so a new compatible flag is required.

V3 is rebased from git://linuxtv.org/hverkuil/media_tree.git for-v5.17c
This branch has support for VP9.

I set cma=512M, but this may not be enough memory as some tests appeard to run out of memory

V3 of this series has several changes:

Update imx8m_vpu_hw to add missing 'reg' reference names for G2 and include references to VP9
Update device tree to remove IMX8MQ_VPU_RESET, remove some duplicate vpu clock parenting
Fix missing reg-names from vpu_g2 node.
Apply patch [1] to manage the power domains powering down.
[1] - https://lore.kernel.org/linux-arm-kernel/20211016210547.171717-1-marex@denx.de/t/

With the above, the following Fluster scores are produced:

G1:
./fluster.py run -dGStreamer-H.264-V4L2SL-Gst1.0
Ran 90/135 tests successfully               in 74.406 secs

./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0
Ran 55/61 tests successfully               in 8.080 secs

G2:
./fluster.py run -d GStreamer-VP9-V4L2SL-Gst1.0
Ran 127/303 tests successfully               in 203.873 secs

Fluster and G-Streamer were both built from their respective git repos using their respective master/main branches.


Adam Ford (2):
  media: hantro: Add support for i.MX8M Mini
  arm64: dts: imx8mm: Enable VPU-G1 and VPU-G2

 arch/arm64/boot/dts/freescale/imx8mm.dtsi   | 41 +++++++++++++
 drivers/staging/media/hantro/hantro_drv.c   |  2 +
 drivers/staging/media/hantro/hantro_hw.h    |  2 +
 drivers/staging/media/hantro/imx8m_vpu_hw.c | 65 +++++++++++++++++++++
 4 files changed, 110 insertions(+)

-- 
2.32.0

