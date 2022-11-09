Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BB117CD3
	for <linux-staging@lists.linux.dev>; Wed,  9 Nov 2022 14:19:28 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 5234DFF803;
	Wed,  9 Nov 2022 14:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668003566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=07aa8e8fT8doZikfGZmbSjdF5gbvueSS4qnnav2hELw=;
	b=WF/bT8xY6heplVG8iPYA60kQYXK5xpTQmnjVVbPc8xzh7WmGRpvhCMu015ps/0Zm/zejA1
	bRDsJTvC9OumkIhRW79VmwZgb4WrT9q4jahAEZDgQDPMmUVJrcrSSy/ESpp5RwgvWOBT8X
	DLk6gV3C8qoXr/3oemLP8fDbct4oXfHnuRrC9PBPSEUi7+n/Mg6qVR8AzOGdw8eToABYDy
	6zu+rDF9vFejFMD4F/50FqvnKS++agbfO5WRegmKuxeCAnbRSr+x4vSiC/ek/1ZoQefNy6
	zOModhZGUskX91Jb/5C9xcIcCTo+mee6pTMIBIusSLhKtJIhBSquXvMuQ8af3g==
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
Subject: [PATCH 04/23] ARM: dts: tegra20-tamonten: add label to avdd_vdac regulator
Date: Wed,  9 Nov 2022 15:18:33 +0100
Message-Id: <20221109141852.729246-5-luca.ceresoli@bootlin.com>
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
 arch/arm/boot/dts/tegra20-tamonten.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20-tamonten.dtsi b/arch/arm/boot/dts/tegra20-tamonten.dtsi
index 6d51a5572a34..703293e9bd41 100644
--- a/arch/arm/boot/dts/tegra20-tamonten.dtsi
+++ b/arch/arm/boot/dts/tegra20-tamonten.dtsi
@@ -418,7 +418,7 @@ ldo5 {
 					regulator-max-microvolt = <2850000>;
 				};
 
-				ldo6 {
+				avdd_vdac_reg: ldo6 {
 					regulator-name = "vdd_ldo6,avdd_vdac";
 					/*
 					 * According to the Tegra 2 Automotive
-- 
2.34.1

