Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047FD7C
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 19:17:02 +0000 (UTC)
Received: from stefanw-SCHENKER ([37.4.248.41]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MKMIR-1oymZJ1guV-00LnoG; Mon, 23 Jan 2023 20:16:50 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH] staging: vchiq_arm: Improve error log for vchiq_platform_init
Date: Mon, 23 Jan 2023 20:16:29 +0100
Message-Id: <20230123191629.21019-1-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nV4STryCcVUHGE5dIUaRdGHKyo1Ztf+jy++6FO6YTKILRWyRiMS
 hcTkPOFx9D+nQrx/sxYPfOAwuJJ7wCxMVG7Zb3bpSYKPcziYA7mE8Y/FEzTmB9WGVjgDrBk
 4609Gww03qqXHLwo/y+GobD8cRuS64ay0jDQTw96u3So8P4Ik6CweqC/jPpxoI7gkmdcHE6
 PbWE9dVuJ86NXCYOCh/3g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nJRxEJPFa8Y=;A0q45VNvsNvFn9tB2wHh2lC3CG+
 48T4+yyuZNi0w4xZ/wrjpfKO31GKruQh4h88wBk1lhXBVWsa3Gt25uYy1/wpwUrCjwFRE4jgg
 +XcCfY5rZPB8CNWSDyJTM59QsK0tLTGKVfNtZeFQPFdm9yi7JmgsGslrJzeeEB2ahxWkVIjY4
 7N3yHtc0TnA/yVjzsowVgaq/6MKNfx2r+Ndunw+I/EbvegA5PuEx3l0Z1NP4r0J+Tl5XxdYWK
 oAvJCvHvvKdoqi8KZ202GVNt/xbys9y5BvRAxAm9C2OmAvHKPEg2nMjNaHXsex5/pyYUxfmj7
 CpQzueJU5oickso4A91mSM/mKeWn6WjmvpmByYxquE7bHc8PIg+L3Rz0pg+UwqKBJTjkAbbwT
 HIKaE7kGgg8KhV1UjEee1j+YlfX+ycxyEm5ifJrKyxF2iqh5bknPcjcjW8kF2GMj1ZLfU5DKI
 dTRPVtYFW6At5K3mWyUd7Ret7aruoCc8UazQEokLaV661N1XGevaIjxaA5Y1BR5drPxmUrJ6Z
 teClHSe6fQmDR2g0Nv3HP+9YQN6h7+rODyWbf8wP9DBfLOJodSoij5Pt8JMTqAHMLvfHO5RIs
 iVXnQh32l5fnur6YfzaIrpglfRtk5VbaoCN0wPo7nTnc3Oa/zBC064AtRM0IKmaA+lY2I/bit
 zONsv1S1AUBH5fR7FqLIFxSlYFpx72V/WB4y5zwCAQ==

During sending the base address of the slots to the VideoCore
firmware via mailbox property, issues could happened on the ARM
and on the VideoCore side. So better separate the error handling
in order to provide more details. This should help to narrow
down the possible cause.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c    | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 4a57ff760106..2ae1d3f5d500 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -546,9 +546,15 @@ int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
 	channelbase = slot_phys;
 	err = rpi_firmware_property(fw, RPI_FIRMWARE_VCHIQ_INIT,
 				    &channelbase, sizeof(channelbase));
-	if (err || channelbase) {
-		dev_err(dev, "failed to set channelbase\n");
-		return err ? : -ENXIO;
+	if (err) {
+		dev_err(dev, "failed to send firmware property: %d\n", err);
+		return err;
+	}
+
+	if (channelbase) {
+		dev_err(dev, "failed to set channelbase (response: %x)\n",
+			channelbase);
+		return -ENXIO;
 	}
 
 	vchiq_log_info(vchiq_arm_log_level, "vchiq_init - done (slots %pK, phys %pad)",
-- 
2.34.1

