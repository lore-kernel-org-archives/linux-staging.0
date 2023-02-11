Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE11CEBF
	for <linux-staging@lists.linux.dev>; Sat, 11 Feb 2023 14:46:40 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id fj20so7694407edb.1
        for <linux-staging@lists.linux.dev>; Sat, 11 Feb 2023 06:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=At5WvDKkNcOWkplR/dJTsQKEuzD9hrUAo21A4/rUxec=;
        b=wfwH0Bfi2CpxdAUmncYHWglK+QFVlyrKwkmpa1qPPxx9ajZdWsWH4EQpFdon9JRIic
         4+2aJ3omS1g0NQzjjOqOhx3i92p+j77VY+BcNXHGyITeMcjzx+K8pkU93Zw898YEzX5R
         lYhK9OOJowHUQZsAjAG/pW1XkVogwAkI7b2FAsnWRi6QDPhjfcsOp+gaGksN6jRVML8C
         WLrAqCo6Qo9zGVf0eRk7QcF2pTZsb1v82hgv9hJpxxYmcU5TpZ+bUM23dJTKYmDB1BV+
         r5vCB1YFAi8cVgTNdI7BIzcCGvGzYgzQbh4824g0yghUQtlaIwT49/qPHpxQxFsiCWVi
         2VlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=At5WvDKkNcOWkplR/dJTsQKEuzD9hrUAo21A4/rUxec=;
        b=kcuroGZZXUFx/F4AAbN6Hku3xiF5t5l1epq13XxD47ZBXDsNwgOzMm8sv3qjV5IzUc
         Lzp7RlkGreaBk8FPQzy5NlcmfVNgGbW2yKBz/zHKqNz5rU1kWxq1TAsS7epvbWBMy8rq
         VgTNKo3K2ejuLjtIEIReoNf8hA42IS653UkZ0l3EnRXzx3d68TocBZDb9+uODhW0di0W
         G45/aKhdu/ZsbR9I9kPnIJZHG9JDzY0Zyl2dXSbokvDptkJLF0buPX3NpKpqDDeSaOBs
         frNfi5n0Gsfzs4YWPGeNle4ZqrP76ulKfhi9z/DS/AoaPmxDhyDJ/Pvg2GpnBk3Cw+X6
         BYuQ==
X-Gm-Message-State: AO0yUKXd8R68VRF7HPH79S0W0rLSG7ns0q7HRPLjaWfX0mDV5MdEGOK/
	CWsoFxJdKEMcwWT2qmn33Kz29A==
X-Google-Smtp-Source: AK7set/74y9Mm210hoh6SmKH7HmluvFaWhx+S99Alej+1fs9ucdMCg9NaNGI/J4bYQCWlPYUPyu1XQ==
X-Received: by 2002:a50:d719:0:b0:4ac:bdf7:dffd with SMTP id t25-20020a50d719000000b004acbdf7dffdmr239261edi.12.1676126798966;
        Sat, 11 Feb 2023 06:46:38 -0800 (PST)
Received: from sleipner.berto.se (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.googlemail.com with ESMTPSA id s6-20020a50d486000000b004aab36ad060sm3802854edi.92.2023.02.11.06.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 06:46:38 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: staging: max96712: Add support for 3-lane C-PHY
Date: Sat, 11 Feb 2023 15:46:14 +0100
Message-Id: <20230211144614.3816247-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add basic support for outputting the test patterns on a 3-lane CSI-2
C-PHY bus. As the driver only can output frames form its internal test
pattern generator, enabling C-PHY output is as simple as setting the
output mode to C-PHY instead of D-PHY.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/staging/media/max96712/max96712.c | 36 +++++++++++++++++++----
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index 99b333b68198..d93dd985fb27 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -30,6 +30,7 @@ struct max96712_priv {
 	struct regmap *regmap;
 	struct gpio_desc *gpiod_pwdn;
 
+	bool cphy;
 	struct v4l2_mbus_config_mipi_csi2 mipi;
 
 	struct v4l2_subdev sd;
@@ -127,10 +128,18 @@ static void max96712_mipi_configure(struct max96712_priv *priv)
 	/* Select 2x4 mode. */
 	max96712_write(priv, 0x8a0, 0x04);
 
-	/* Configure a 4-lane DPHY using PHY0 and PHY1. */
 	/* TODO: Add support for 2-lane and 1-lane configurations. */
-	/* TODO: Add support CPHY mode. */
-	max96712_write(priv, 0x94a, 0xc0);
+	if (priv->cphy) {
+		/* Configure a 3-lane C-PHY using PHY0 and PHY1. */
+		max96712_write(priv, 0x94a, 0xa0);
+
+		/* Configure C-PHY timings. */
+		max96712_write(priv, 0x8ad, 0x3f);
+		max96712_write(priv, 0x8ae, 0x7d);
+	} else {
+		/* Configure a 4-lane D-PHY using PHY0 and PHY1. */
+		max96712_write(priv, 0x94a, 0xc0);
+	}
 
 	/* Configure lane mapping for PHY0 and PHY1. */
 	/* TODO: Add support for lane swapping. */
@@ -332,8 +341,9 @@ static int max96712_parse_dt(struct max96712_priv *priv)
 {
 	struct fwnode_handle *ep;
 	struct v4l2_fwnode_endpoint v4l2_ep = {
-		.bus_type = V4L2_MBUS_CSI2_DPHY
+		.bus_type = V4L2_MBUS_UNKNOWN,
 	};
+	unsigned int supported_lanes;
 	int ret;
 
 	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(&priv->client->dev), 4,
@@ -350,8 +360,22 @@ static int max96712_parse_dt(struct max96712_priv *priv)
 		return -EINVAL;
 	}
 
-	if (v4l2_ep.bus.mipi_csi2.num_data_lanes != 4) {
-		dev_err(&priv->client->dev, "Only 4 data lanes supported\n");
+	switch (v4l2_ep.bus_type) {
+	case V4L2_MBUS_CSI2_DPHY:
+		supported_lanes = 4;
+		priv->cphy = false;
+		break;
+	case V4L2_MBUS_CSI2_CPHY:
+		supported_lanes = 3;
+		priv->cphy = true;
+		break;
+	default:
+		dev_err(&priv->client->dev, "Unsupported bus-type %u\n", v4l2_ep.bus_type);
+		return -EINVAL;
+	}
+
+	if (v4l2_ep.bus.mipi_csi2.num_data_lanes != supported_lanes) {
+		dev_err(&priv->client->dev, "Only %u data lanes supported\n", supported_lanes);
 		return -EINVAL;
 	}
 
-- 
2.39.1

