Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D9E7B
	for <linux-staging@lists.linux.dev>; Wed, 27 Apr 2022 22:45:14 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id k23so6152545ejd.3
        for <linux-staging@lists.linux.dev>; Wed, 27 Apr 2022 15:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ULuEHFX75GMwmo8k2GzRUntcH3yDcucdCP1qTc/I1I4=;
        b=ml8uzSNJMVs1/c6qGisCf+ClB3pqZe7KZtcX9j50z3ZpwAqed+4ReF/LBsDS6MEa13
         fcf1XXRgzmoNG60h+AX1FFwo1w3N5Tx84W0KYKYDSSlXYm07xf9MyW27uXcw47ArSttb
         y5ZNDJXdKgUbVHtLIUGnhraNOoSizkDT6oyHxJX+vTNrze3tUJbsrpWdGv5SHa+rfhV/
         HjrKmJlCwBbH1WMxtq8+MV4qOvHavNuK4UhqXC+SW5rIgSNenYyv/tofybFkaLG466bw
         ogRBcnYhJHXDhZWM0nAClK0PTcjEZnd5XEPs5//E5udmm8/hj3ueTWnesQsv/zssDiFp
         GLdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ULuEHFX75GMwmo8k2GzRUntcH3yDcucdCP1qTc/I1I4=;
        b=R3LfRYCEdYkjUcsJWz7NIikGYfg640q+dBfXMJSToOiH4jmHV14zUJaHTQOgbLTP9T
         grqlv8I3nkZf/okR+s53zT5Uzgxns6IG9OSESKFdHzCfjV+CV5DNugYAF0mu1Rkpb8Xq
         8sJNSNIa6AMJeBhmuzU3N0pWTgVkI3fOdRLvZ5vxgkMUpP1g2xJM61lNuUlvUoMwicZf
         lLpqX9Ef9ykNzpKTY4/TVQkdjy+xhQykBB1LSd+bl91BHPGspIVz5I/ASNbD3ChHiWeq
         Owgyrl5UdpnO51pPynJq/p3vOJWJ9WI1CBHhHCEYq7rQrFf//XD8gARgeAt5dYixGl6n
         oSog==
X-Gm-Message-State: AOAM532/Er7uoe/c4HWryvpMBJQPzOH4XjMWkZxAT0Kn+HZMa222yfNj
	5IZ/QhUsYbftEG9COuWnn8k=
X-Google-Smtp-Source: ABdhPJw/kmkRb4ECwQsyT2nZLTfzWQIwaBKXnJ04SiQk3nK6jZlCQaiwz131OR/BDU6OGu6woJ2hCg==
X-Received: by 2002:a17:907:c06:b0:6e0:9149:8047 with SMTP id ga6-20020a1709070c0600b006e091498047mr27930716ejc.765.1651099513153;
        Wed, 27 Apr 2022 15:45:13 -0700 (PDT)
Received: from localhost.localdomain (84-72-105-84.dclient.hispeed.ch. [84.72.105.84])
        by smtp.gmail.com with ESMTPSA id t27-20020a1709063e5b00b006f3a94f5194sm3762594eji.77.2022.04.27.15.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 15:45:12 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Geis <pgwipeout@gmail.com>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Liang Chen <cl@rock-chips.com>
Cc: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 0/3] Enable JPEG Encoder on RK3566/RK3568
Date: Thu, 28 Apr 2022 00:44:35 +0200
Message-Id: <20220427224438.335327-1-frattaroli.nicolas@gmail.com>
X-Mailer: git-send-email 2.36.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

the following series adds support for and enables the hardware JPEG
encoder on the RK3566 and RK3568 line of SoCs by Rockchip.

The JPEG encoder is its own little Hantro instance with seemingly just
the encode functionality.

The first patch modifies the bindings with a new compatible, and adds
the ability to just have a vepu interrupt without a vdpu interrupt.

The second patch makes the actual driver changes to support this variant.

The third and final patch makes the necessary device tree changes for
the rk356x device tree file to add both the node for the encoder and
its MMU.

The series has been tested on a PINE64 Quartz64 Model A with an RK3566
SoC using GStreamer.

Regards,
Nicolas Frattaroli

Nicolas Frattaroli (3):
  dt-bindings: media: rockchip-vpu: Add RK3568 JPEG compatible
  media: hantro: Add support for RK356x JPEG encoder
  arm64: dts: rockchip: Add JPEG encoder node to rk356x

 .../bindings/media/rockchip-vpu.yaml          |  2 +
 arch/arm64/boot/dts/rockchip/rk356x.dtsi      | 21 +++++++
 drivers/staging/media/hantro/hantro_drv.c     |  1 +
 drivers/staging/media/hantro/hantro_hw.h      |  1 +
 .../staging/media/hantro/rockchip_vpu_hw.c    | 62 +++++++++++++++++++
 5 files changed, 87 insertions(+)

-- 
2.36.0

