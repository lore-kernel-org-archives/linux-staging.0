Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7590B2C82
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 13:07:12 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.122]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MadGG-1n9lff0tJK-00c9Qs; Sun, 17 Oct 2021 15:06:57 +0200
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
Subject: [PATCH 1/2] ARM: dts: bcm283x: Drop fallback compatible for vchiq
Date: Sun, 17 Oct 2021 15:06:35 +0200
Message-Id: <1634475996-6809-2-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634475996-6809-1-git-send-email-stefan.wahren@i2se.com>
References: <1634475996-6809-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:CUdsPQthYM4D87Cyk8FMVpNf6oxobzYTEpaKlcSB12KnlqXQbGj
 Gdyv9Uooq3iyHyVugncvOCTp+Yi58QjIZXM3qkmEqPtnID7sTlOxXgU7mGVVy/QAPL2KcZO
 oh9z/cDi4pLThGlgZ74RGciExt8k6kTdmn24DMt4rhadDaztSj4Txq8wMXrDbBZ/Tk6wApH
 2G0FF6WQHaJH5jFx6Hmbw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HyTkRJbFX2I=:W01LaF3YFMZInrLr/Nc57w
 y+QnlEtgaNRYin0mngfbOnW+gdYFgnDoNAYv7Y5l7WCW3S5UzJLrRH4iRiiJ+jCCvIXQbhMZx
 Va+O8OgFz2tOJ0Q33dVjoCZnMIUvmzv7hc08nyt6sNzt8G3n8dHtuWZZOumnWhdeUKShj0geB
 BK5y4QZKMLrDiGb/GzZ96tm7yhTwljAADaSk2V0WWp85BQb+2JpO2rS7ZnxTJBvo+fg0I/YaQ
 EogT0DrPBv8Gh2YPV2OexgQ8B2yAl8JNK8KxieT4MKHB6cFSVFaMSeWZ9rKz6XGQR/yv84dLJ
 VXqTFVMCrvi9l4MY6JYg3yCbI/U1I99IuiJDcYEjj9/uH2/+1waAHmH9tZr3D/e5R78C/ej3J
 YvCeFVBrnHdLLsjYUe+a49zBcS8wFV2D4WJ0WytImECMd/QaKtJFEiJ9WPSiZilBIOxn3e6iv
 8u+f5ePdpCM3LvBPStsyRINtxmlPnr1lgtEI3fiXhJDDRuuLc/P135fKBL31wFR64rNHyta3g
 HgvtJfQau04O8R9WgedxWIdB+lAVPF32PTfFsGRxGvcm5x/7klIFXeJ+OViAl16rTx+2T1Veq
 Hl6SSE4QtmWVsQV3r/1lK4jiXPWd3pk2c7q5Avzo78hLsBBIbee521s9Xs5ZqR/33hh9Jr7xn
 MobG/Ve/eS09Fckt7+dGacOmHwNmDpaGE7GzRnxpy6q9MWZlPoHBnpRQaPI1CnChiTUPZYwc1
 2MP6FpD84IOdwlDsTSwxKhyiFcJI9ivoI1vdcr42V3BUJz8igpq6FTPpp4Y=
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

With introduction of SoC specific vchiq compatible back in 2018, we kept the
original "brcm,bcm2835-vchiq" as a fallback for older Kernel versions.
Now this fallback isn't necessary anymore. So before we create a DT schema
which also handles this fallback better fix this on the DTS side.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm/boot/dts/bcm2836-rpi.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/bcm2836-rpi.dtsi b/arch/arm/boot/dts/bcm2836-rpi.dtsi
index c4c858b..f98e0e4 100644
--- a/arch/arm/boot/dts/bcm2836-rpi.dtsi
+++ b/arch/arm/boot/dts/bcm2836-rpi.dtsi
@@ -2,5 +2,5 @@
 #include "bcm2835-rpi.dtsi"
 
 &vchiq {
-	compatible = "brcm,bcm2836-vchiq", "brcm,bcm2835-vchiq";
+	compatible = "brcm,bcm2836-vchiq";
 };
-- 
2.7.4

