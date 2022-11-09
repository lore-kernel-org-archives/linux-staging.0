Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0299117CD3
	for <linux-staging@lists.linux.dev>; Wed,  9 Nov 2022 14:19:25 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 2166CFF80E;
	Wed,  9 Nov 2022 14:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668003564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uqci2qSaw6deqAW4JCdUl71iNVBKipcC1QthJWE93Lo=;
	b=N6PXCZtsSKg2pkyPWymdvDszipVUVpU/oaIUEzH71VndneJOkkEOlkTlEqBo8DEnAdB4eU
	EMgIiqgIzHUuk/iWx4WO9F8kiyKg191Sh/sUSi9gMubFmnkhFNb08YD/ea/ftAoLRpUbhx
	/zbxxFiUDYUwz6yzmIqfQw/Qa4RW2uzaDHkXsBhVNlY1soxsfdc/aKKDFEi0M8MKr3Mjul
	J4rewTX2sHdm+Cn/hiU93LVuSG4Z/ihmeIU3AcadUrbLG6FyTs5A0qA9bjqD/T7acwhT1W
	AYujGYWTCYfoXSg2lui4+WJvuZ0O+AMsi7NOY/vLiSe1wzc17WLyp2FXP53drQ==
From: luca.ceresoli@bootlin.com
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH 03/23] ARM: dts: tegra20: add label to nvidia,tegra20-vi node
Date: Wed,  9 Nov 2022 15:18:32 +0100
Message-Id: <20221109141852.729246-4-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109141852.729246-1-luca.ceresoli@bootlin.com>
References: <20221109141852.729246-1-luca.ceresoli@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

Useful to enable it from a board DTS.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index ee757dc8c6a2..5e71dcbe8b12 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -62,7 +62,7 @@ mpe@54040000 {
 			status = "disabled";
 		};
 
-		vi@54080000 {
+		tegra_vi: vi@54080000 {
 			compatible = "nvidia,tegra20-vi";
 			reg = <0x54080000 0x00040000>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.34.1

