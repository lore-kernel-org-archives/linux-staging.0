Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692203EAC86;
	Mon, 18 May 2026 10:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100289; cv=none; b=Z2c0l7hhWvPluhg/WSDxB0MNTlwR5wp1OUGCvVnhzOL1V4ccUrzycSBoFbO9N8XaU2gnAFceQimutmapcccMYgcOrmwxmzMy/LM8d+v3AOS6YRQ+L9sLrNvQukpqKBiWxzQsfgNEKIRyhNdrK5bHvLCeJJcJVDxrAo8Fgs0YkpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100289; c=relaxed/simple;
	bh=3KX5OyYkwJhiTbzQdQdOc5p3BV7xGqdUpy50KYOtY0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VwI9aSwDmwXQhoZhMqn00vDQPUdbiaIs3B/+UI5GedNZM4ipZKQqS88/bHtOMM7YeIDs41yt4694V3MEWhr/B2cSpkxqqnIkZY/a/vkEqCFu0i/7vSWgktx0zt75UdMd5uzsWi5SY8LdKa/dZO1smtF5Q+9itChFclzYNyUFD68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id B2F4A1F80041;
	Mon, 18 May 2026 10:31:18 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 3C1A7B40824; Mon, 18 May 2026 10:31:18 +0000 (UTC)
X-Spam-Level: *
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id ECF89B407F9;
	Mon, 18 May 2026 10:25:00 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arash Golgol <arash.golgol@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH 12/16] media: sun6i-mipi-csi2: Fix parenthesis alignment
Date: Mon, 18 May 2026 12:24:47 +0200
Message-ID: <20260518102451.417971-13-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518102451.417971-1-paulk@sys-base.io>
References: <20260518102451.417971-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is purely cosmetic, no functional change intended.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
index 682bdd82098c..17a9a215a98a 100644
--- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
+++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
@@ -96,7 +96,7 @@ static void sun6i_mipi_csi2_disable(struct sun6i_mipi_csi2_device *csi2_dev)
 }
 
 static void sun6i_mipi_csi2_configure(struct sun6i_mipi_csi2_device *csi2_dev,
-				       const struct v4l2_mbus_framefmt *mbus_format)
+				      const struct v4l2_mbus_framefmt *mbus_format)
 {
 	struct regmap *regmap = csi2_dev->regmap;
 	unsigned int lanes_count =
-- 
2.54.0

