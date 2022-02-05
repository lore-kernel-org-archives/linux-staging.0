Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3843B2C9D;
	Sat,  5 Feb 2022 18:56:08 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2DA42240018;
	Sat,  5 Feb 2022 18:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1644087366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SMCULc6HrPXZzioFZHc2jhN/9bV7Xz9OY1iLkG08uy0=;
	b=UAZbgpiHK+JaZAjN3tWaPhzuYQq9gDsTD1qOGHDu8X8VGU6xO75SBLRMKvegGnRaUANpb5
	GAU6cJUKJ4umnbDElxMuftMtiMmcKH1T/9/9S7tB+TSa5qVnyLk8ctCCpnPXYW/sxFkpJw
	gDWLC5jHHwXVZHp+wYwMG7zIzwjYoTQGIFxFLQudM456XwzPlJQPlhBTr39YQfT86KzuJF
	RJgcydfREpUn9bEm2vpktZoKLE8919c2Tqme5jgb7kix9Z84roEpoItpgGBEsWDluKkObR
	N6LXSxwTPK7s78fK12sJkXh6Ra7kVoc1TmHbYZRQ2LZ+uDy/ZMK0yDrBRQhHsQ==
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Yong Deng <yong.deng@magewell.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helen Koike <helen.koike@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2 51/66] media: sun6i-csi: Unset bridge source on capture streamon fail
Date: Sat,  5 Feb 2022 19:54:14 +0100
Message-Id: <20220205185429.2278860-52-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220205185429.2278860-1-paul.kocialkowski@bootlin.com>
References: <20220205185429.2278860-1-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In cases where the media pipeline start fails but our bridge
has already registered a source, the source remains set and
the bridge code is not called.

Clean it in capture streamon error handler to avoid the issue.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index 4315e197d53f..6033acaa9564 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -628,6 +628,8 @@ static int sun6i_csi_capture_start_streaming(struct vb2_queue *queue,
 error_state:
 	sun6i_csi_capture_state_cleanup(csi_dev, false);
 
+	csi_dev->bridge.source = NULL;
+
 	return ret;
 }
 
-- 
2.34.1

