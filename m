Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1E82C82
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 13:07:17 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.122]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MMnru-1mJSWy3JTA-00Iopc; Sun, 17 Oct 2021 15:06:56 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Rob Herring <robh+dt@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Mwesigwa Guma <mguma@redhat.com>,
	Ojaswin Mujoo <ojaswin98@gmail.com>,
	Phil Elwell <phil@raspberrypi.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 0/2] dt-bindings: soc: bcm: Convert brcm,bcm2835-vchiq to json-schemas
Date: Sun, 17 Oct 2021 15:06:34 +0200
Message-Id: <1634475996-6809-1-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:HcgF6GKzf3ITZhG4DQ1jGxpWvWeqYFRZ9gwf+eZgutQ+Ie9MX4V
 dY77C4s0yspKXUeYFmGGImIoTJbfpUnDodn8qmvJHs+rMXN0rOZE7GEMJRUeEbu1r8jOLsN
 2wj6CFeak6vCFGZf7senpzQXfdNt5TFzIwnhcYdVWKZX7fJLBwWilbmZKnjR24J6fTEZzAj
 XGc/To/24tAWN7pRH5r7w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZpdYrFoOSQw=:ZcFhvCfPoUUeZsJIxHGiHx
 JuMRZKi1UnSnPln89Z0oF4g7EAcpoFEc7qr4wcpdR4GUbTTEN0rJhL9TqIvmflYaIDt1qiCmy
 TDZQ/tqWUOBAMWHwEtCs22zh9D87ufztD0A0vW1xty5TAPe4K8GESJXfLv9tjS35dKEon7d7J
 nDwoZzQc8U13VHPDrLEei8wYtabpPXX+ff299grH1CgOOv4GgjrdtLiVzCJmUv8Ri841+G24U
 05bCAwmxF0cgOJ86xGIcTrf5HcNV/RA21t3RqpZUDtHbORpp12vpnQClV2dKRxq1La7QjByk4
 DAR9mfDw/C6ObOa2EA/5uEh7oS8w24NT1vkOsynyvGzfyKUYDse7uyhlGFTe14s8B/K844367
 pyC6NW/xmSgSrJNhqgw8I78+tLretTkNQtgkNjxFoYaQFE6wnvkg072Ao1g7H03uf5vBknTEx
 xO5c+4nyNvr31rSBFpe2vKB6OvynWz2QGG8QBnVT1XcGH+4Jf5+UKhdaHSHBbRHOHNKpQ8ScQ
 E9hSu8HT45u4kgY9xwJQpVjrY5IkFJH7TW2GU3AW1BPr2txanPdtt/ThIIUSlsQpy1ckWtixz
 zgCYx68hrL5pcGvdp+KtA3hlerXxtU6kMRJST5cd0B34OlG5hoART5C3aEB99pN0p3dm1LXQ+
 yOtL6lPl3YZdzXeD9+5kOL9Qeiyhh9P5fExRVe0aMVvSTVlQZFzZb0u7sykM96tSQcFflSrWB
 qOrpTNch2RDvEqN26fOfOtyTVx9PLB88++m9AkWPwxwjLiacyjnZd5b8m+4=
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

This series converts the VCHIQ bindings to YAML format.

Stefan Wahren (2):
  ARM: dts: bcm283x: Drop fallback compatible for vchiq
  dt-bindings: soc: bcm: Convert brcm,bcm2835-vchiq to json-schema

 .../bindings/soc/bcm/brcm,bcm2835-vchiq.txt        | 17 --------
 .../bindings/soc/bcm/brcm,bcm2835-vchiq.yaml       | 47 ++++++++++++++++++++++
 arch/arm/boot/dts/bcm2836-rpi.dtsi                 |  2 +-
 3 files changed, 48 insertions(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.txt
 create mode 100644 Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml

-- 
2.7.4

