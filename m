Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702F82C80
	for <linux-staging@lists.linux.dev>; Sat,  6 Nov 2021 18:38:24 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id y73so14521683iof.4
        for <linux-staging@lists.linux.dev>; Sat, 06 Nov 2021 11:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9S5oHAmnScjjJzJoMnQXat0UgrVfZXu2Ev8iwM+SUpE=;
        b=BNk6tEQayGxI9Bqdhs64NR/wTUlQovH1v52TNPLLpN4Fwb8M3S4KemGdRL5aTovrav
         2jmC2c24aWAcGb5ujGZNnXVnWET6hRwbtfoW87PqeQlfAeUiqPHno/wKHQ3Lg+VAvtFt
         wS0E510s+LBSse/ND5hh26SGO2yeBWv5eFIWTw7y2CLPe9v2x61ZnQc3jMwas88e4d16
         eyZj0lC9jwb5IU2AoOCljKgcHnDW8xi4y94/dHfxCoG96MTXF2/oJ2ACQYPGtbgTMvJh
         0oPpNh+hQmB7ddFCWiazix2//34C0qQdYN+1otszNpKAR3oWyP+WNUKcoG1sj1KLlqPG
         o9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9S5oHAmnScjjJzJoMnQXat0UgrVfZXu2Ev8iwM+SUpE=;
        b=WVBMYHHykhdT/nlghXbn6aAe0NEwQb9Orw1co2OQq22PH7xx3GwkqPz7E5GzS5aDrr
         u8mLJRWX9WYwY+l0ADiplYbKD1Zmzo2yob5QrJf6jsujXPGdF+uaNiTbNr122gTGtukY
         cCGJadcbeZXhnhD+Nq/MWha/0PQTEx9QhVsRztTWqK66mvREuiwC0/1VaxCD+zR+F3/m
         0uLlc+MyABxrxdJYky5CN2tmpeYzUmWmlNuEjofoCVmoI1jLtIAaMNHK15R3x7zbcwOx
         zdU8PAD17soBBVFZrtIclczzpveQnIgBx66A09JB9WQyfjF3iHb0rhoLuvKnHiAEUKPc
         w6Nw==
X-Gm-Message-State: AOAM5328iDPBA1eWbYmfdItcemXu+4vDEjcEMFleeBUgeN74Z/g+Dc5B
	YTdLcnQNhOFhIZ5UCaxH0Gw=
X-Google-Smtp-Source: ABdhPJx1eRslfc8lgovdJvKBdwnm0TwhpaEMzSronnvFUCLxb1Is+3dHZy24nDADw9qOgud4gfv7Jw==
X-Received: by 2002:a02:cb8f:: with SMTP id u15mr12236972jap.131.1636223903395;
        Sat, 06 Nov 2021 11:38:23 -0700 (PDT)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:64ba:1c0f:6d36:c11d])
        by smtp.gmail.com with ESMTPSA id o10sm7174077ilu.49.2021.11.06.11.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Nov 2021 11:38:22 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: tharvey@gateworks.com,
	frieder.schrempf@kontron.de,
	marek.vasut@gmail.com,
	jagan@amarulasolutions.com,
	aford@beaconembedded.com,
	cstevens@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Lucas Stach <l.stach@pengutronix.de>,
	Joakim Zhang <qiangqing.zhang@nxp.com>,
	Alice Guo <alice.guo@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-rockchip@lists.infradead.org (open list:HANTRO VPU CODEC DRIVER),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [RFC 0/5] arm64: imx8mm: Enable Hantro VPUs
Date: Sat,  6 Nov 2021 13:37:56 -0500
Message-Id: <20211106183802.893285-1-aford173@gmail.com>
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

The i.MX8MM also has a Hantro video encoder which appears to be similar
to what's already supported in some Rockchip devices.  As part of the
series, some of the video format names are re-named to be more generic.

The VPUs appear as media devices:

Media device information
------------------------
driver          hantro-vpu
model           hantro-vpu
serial          
bus info        platform: hantro-vpu
hw revision     0x0
driver version  5.15.0

Device topology
- entity 1: nxp,imx8mm-vpu-dec-source (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video1
	pad0: Source
		-> "nxp,imx8mm-vpu-dec-proc":0 [ENABLED,IMMUTABLE]

- entity 3: nxp,imx8mm-vpu-dec-proc (2 pads, 2 links)
            type Node subtype Unknown flags 0
	pad0: Sink
		<- "nxp,imx8mm-vpu-dec-source":0 [ENABLED,IMMUTABLE]
	pad1: Source
		-> "nxp,imx8mm-vpu-dec-sink":0 [ENABLED,IMMUTABLE]

- entity 6: nxp,imx8mm-vpu-dec-sink (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video1
	pad0: Sink
		<- "nxp,imx8mm-vpu-dec-proc":1 [ENABLED,IMMUTABLE]



Media device information
------------------------
driver          hantro-vpu
model           hantro-vpu
serial          
bus info        platform: hantro-vpu
hw revision     0x0
driver version  5.15.0

Device topology
- entity 1: nxp,imx8mm-vpu-g2-dec-source (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video2
	pad0: Source
		-> "nxp,imx8mm-vpu-g2-dec-proc":0 [ENABLED,IMMUTABLE]

- entity 3: nxp,imx8mm-vpu-g2-dec-proc (2 pads, 2 links)
            type Node subtype Unknown flags 0
	pad0: Sink
		<- "nxp,imx8mm-vpu-g2-dec-source":0 [ENABLED,IMMUTABLE]
	pad1: Source
		-> "nxp,imx8mm-vpu-g2-dec-sink":0 [ENABLED,IMMUTABLE]

- entity 6: nxp,imx8mm-vpu-g2-dec-sink (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video2
	pad0: Sink
		<- "nxp,imx8mm-vpu-g2-dec-proc":1 [ENABLED,IMMUTABLE]



Media device information
------------------------
driver          hantro-vpu
model           hantro-vpu
serial          
bus info        platform: hantro-vpu
hw revision     0x0
driver version  5.15.0

Device topology
- entity 1: nxp,imx8mm-vpu-h1-enc-source (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video3
	pad0: Source
		-> "nxp,imx8mm-vpu-h1-enc-proc":0 [ENABLED,IMMUTABLE]

- entity 3: nxp,imx8mm-vpu-h1-enc-proc (2 pads, 2 links)
            type Node subtype Unknown flags 0
	pad0: Sink
		<- "nxp,imx8mm-vpu-h1-enc-source":0 [ENABLED,IMMUTABLE]
	pad1: Source
		-> "nxp,imx8mm-vpu-h1-enc-sink":0 [ENABLED,IMMUTABLE]

- entity 6: nxp,imx8mm-vpu-h1-enc-sink (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video3
	pad0: Sink
		<- "nxp,imx8mm-vpu-h1-enc-proc":1 [ENABLED,IMMUTABLE]

This is an RFC because I don't have functional video on my system yet,
and I'm hoping there might be people who do and can help test this.
I have only tested this far enough to see they enumerate and appear
as /dev/videoX and /dev/mediaX devices.

I am also curious to know if/what gstreamer plugins are necessary.  In
NXP's custom kernel, there are IMX-specific plugins, and I was hoping there
would be more generic plugins that I can use to test.  I am hoping some
of the linux-media experts might chime in on how to best test.

Lastly, I didn't update any device tree binding YAML files, because
I know there have been some discussions about the power domains on the
imx8mq, and I wasn't sure if the imx8mm should get a separate YAML file
or if the existing one for te imx8mq should just be modified.

This will likely require the following series in order to apply correctly:
https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=576407

Adam Ford (5):
  media: hantro: Add support for i.MX8M Mini
  arm64: dts: imx8mm:  Enable VPU-G1 and VPU-G2
  media: hantro: Rename ROCKCHIP_VPU_ENC_FMT to HANTRO_VPU_ENC_FMT
  media: hantro: Add H1 encoder support on i.MX8M Mini
  arm64: dts: imx8mm:  Enable Hantro H1 Encoder

 arch/arm64/boot/dts/freescale/imx8mm.dtsi     |  61 ++++++++
 drivers/staging/media/hantro/hantro_drv.c     |   3 +
 drivers/staging/media/hantro/hantro_hw.h      |  19 ++-
 drivers/staging/media/hantro/imx8m_vpu_hw.c   | 143 ++++++++++++++++++
 .../staging/media/hantro/rockchip_vpu_hw.c    |  26 ++--
 5 files changed, 231 insertions(+), 21 deletions(-)

-- 
2.32.0

