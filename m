Received: from mx-lax3-2.ucr.edu (mx-lax3-2.ucr.edu [169.235.156.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA8A2FB1
	for <linux-staging@lists.linux.dev>; Wed, 23 Jun 2021 05:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1624427772; x=1655963772;
  h=from:to:cc:subject:date:message-id;
  bh=HeroiO/f70kMSW1+IDvJqEJ6G7TytY2YJRExDN92zzI=;
  b=qAXWg70s/eV0PHTNy2k7tEa4Ie3LaQUe01v+GOkNbsRHBLRMDl0kWn+T
   eJ/caFguzts/Trz9DiUtDVBxJzHl+7Ys19vCplVsxGcwmFMWFxbz9gK5w
   F9+8QumQlBVPEJrGSCaZ1csN/NQZa7pomRR1Sm1/f+I3clVu7Uz6Jxle3
   Aghyc6DNk4EfTtJdYTk+W4ilx2ETieRjegHrRPky+h3tZol7NKZF9+xbG
   h0cgHgQcZLg4M4cOXJi8yHB98WWP3ZHJoQNFEUgdhFlRg5sNwGQ1EoVlJ
   Tx9Q0gTU4viPK4cgdUScs0m0Tj4nkb7K/B0/fd0A1MaTR2Tcwoi6ULjiZ
   Q==;
IronPort-SDR: teZ2HeTfkU+Ch+00CvMqsJMKriL1PYRN6OZNAecSq+FCfN/KivuBmxu162hnyH2vgP43SUMQQl
 AldPBALrSSP07KRzbMIl2C5t9yEsQN2aj/ieZvNxPX9FdYXn8CrGLdNuPLExbLXescC3CNM2eO
 kLoWLMUC+BubpKMkHSyQhk6JAktcVhfzM92r8J5mdck94fxeJbxciK9duzLSNRHgq85w7UbxYk
 S2ZrJYK0RISFYwKDvGLpXDXri6htkHBsQTFYGdoyf5JbtjsfGZvIoO6mxx1pZxadJgyNLt3VcV
 9Zw=
X-IPAS-Result: =?us-ascii?q?A2HoBADIy9JggMbXVdFagmCDeVUWjUyHKgEBAQaMGRh/h?=
 =?us-ascii?q?nmIZYF8AgkBAQENAQFBBAEBhFCCbgIlNAkOAgQBAQEBAwIDAQEBAQUBAQYBA?=
 =?us-ascii?q?QEBAQEFBAEBAhABAW6FL0aCOCmDZQsWFVKBFQEFATUiOYIWAYJhJpoagQQ9j?=
 =?us-ascii?q?DEzgQGIEwEJDYFiCQEIgSiIeoUXgRmBEIQCdIdvglAEgx17E4N2AQEBkA8bg?=
 =?us-ascii?q?wSMO5tFAQYCgwUcgn6aakSGUo4lkH0Buh0CCgcGECOBMYIVTSWBbAqBQVAZD?=
 =?us-ascii?q?o11AY53QTI4AgYKAQEDCYxUAQ?=
IronPort-PHdr: A9a23:UF98GREbYkpy4qkf+0ds0J1Gf9xMhN3EVzX9CrIZgr5DOp6u447ld
 BSGo6k03RmSAd+Qu6IMotGVmpioYXYH75eFvSJKW713fDhBt/8rmRc9CtWOE0zxIa2iRSU7G
 MNfSA0tpCnjYgBaF8nkelLdvGC54yIMFRXjLwp1Ifn+FpLPg8it2O2+5pnebx9GiTeyf79+I
 xa7oAbMvcQKnIVuLbo8xAHUqXVSYeRWwm1oJVOXnxni48q74YBu/SdNtf8/7sBMSar1cbg2Q
 rxeFzQmLns65Nb3uhnZTAuA/WUTX2MLmRdVGQfF7RX6XpDssivms+d2xSeXMdHqQb0yRD+v9
 LlgRgP2hygbNj456GDXhdJ2jKJHuxKquhhzz5fJbI2JKPZye6XQfdYbRWpaRcZRVipBAoyhZ
 IURFuQKIOhYr4jjqFsKsBS1GA2gCe3zxjNNgHL52rE33uo9HQ3bxQAsA88Cu2nQoNnoNKoeV
 Oa4x7TKwzredfNbwTfz5pbVfB4vov+CWql9fdbNxUQ1Cw/IlEmcpZDjMjiI1uoNqW+b7+94W
 O2tim4mqgFxoiWoxswxjYTIhoMUylDe+iV43Io5OdO1RVVmYdG4CptcrT+VOJZrQs47RWxjp
 Sk1xKEct5GhYCgK1IooxwTZa/GffIWE/BDuWuaNLTp8hHxpZrKyihW8/0W+1OHyVsi53VRXo
 ydEkNTBsnEA2h3N58WbSfZx4lut1DSS2w3c9O1KIUY5nrfYJZ452rM8iIYfvEDZEiL1mEj6l
 rGaelgk9+Sy9ujqZrbrqoeBO4J1jgzyKLoil8K/DOgiLAQDXXKX9fqi2LDt+0DyXa9Egecsk
 qbDtZDXPcEbpqmkDABLyosj8BO/Dyu+0NQfgHkHMEpJeBKZgIjtPFHDOPX4Au2+g1SoiTtr3
 //GMqD4DpXDM3TOlLTscaxy605bzwozwtRf6IxOBr4dJ/LzX1f9tN3eDhAnLwy52/jrBMl52
 48EWm+CArWVPL3PvVKI/O4jPu2BaYwNtDb4Mfcl5vrujXEjmV8aeKmkxZsWaXG4Hvt8IkWVf
 Wbgj9kaHGcXogU+Vvbmh0OfXj5Of3qyRb4z5iknCIK6CofOXoStgL2H3CemEZxaf3tGCkyWH
 nfndoWEXfgMZTmWIs9giTwESaOhR5Ul1RGvsg/61rVmIvDJ9SIGq5KwnPZv4OiGpBAg9SFzR
 5CMwWGETjksxUsVTCVw0axi9x8ugmyf2LR11qQLXedY4OlEB0JnaPbh
IronPort-HdrOrdr: A9a23:XsATLa90EQec0ZJ5hWpuk+DZI+orL9Y04lQ7vn2ZhyYlF/Bw+P
 re+8jzuSWE6wr5JktQ/+xoUZPoKRi9yXcc2+gs1NyZLW3bUQWTXeNfBEjZrgEI2ReVygeQ78
 hdmtBFeaTN5JFB4ajH3DU=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; 
   d="scan'208";a="50113760"
Received: from mail-pg1-f198.google.com ([209.85.215.198])
  by smtp-lax3-2.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Jun 2021 22:55:03 -0700
Received: by mail-pg1-f198.google.com with SMTP id k9-20020a63d1090000b029021091ebb84cso704978pgg.3
        for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 22:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=dZ01YeGO36ttJa1EkqeDzGCMLruDwsRboZArrpn5SFM=;
        b=Dj4/GzURP8dahturC+MLzcsDcHBXRHWHM+5pc4rJeH0WC6w1wvhSQpaNkwxLDaJq7s
         lmFM5OHS+Fwuv5S3CyCgFOZQH4EhUUvfTXdvEw/kt4rsfGxCfDBwEYhFyHb0fR0tt70f
         4JJxQMY285g/de+mvVG2HolTE0Srho8WJf4Rsasdrp7Uxj9bygS1DUwLKPsoGRGcZi0B
         BKe6STwstEMMtOt33nb/Uj4R1yvM2nw4pzuhEKaJH0eiAYpOjeQ0j3eHjbtlhD+2529V
         ZJPP8KALj8vOVUgZGbwh69dehb7MkobA5brtIjem+Luq5ClYTXBm/bUKZfTizJuv5PBP
         kfkw==
X-Gm-Message-State: AOAM532TVryBiXVslNO+4oMkgXEntj0wGyFTljYq9BvRCpypo3VgGsyK
	pkKCurvDT8gD/rlnNjAG5moE8Y/FE7xUsOqp5jfB72NliADc9mLci8onedBATe+rPGLxHRsIK04
	M8doPgjWPBYpmpOIY1C98pEewjBA=
X-Received: by 2002:a05:6a00:2395:b029:304:7a51:6f1d with SMTP id f21-20020a056a002395b02903047a516f1dmr7387055pfc.53.1624427701883;
        Tue, 22 Jun 2021 22:55:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZcMZuv9nHzaTSg9WiNWU0DHaItTgV98zNDYoD4whsou4ZO9Ewniqbv6pxQU3GccP+KRXscw==
X-Received: by 2002:a05:6a00:2395:b029:304:7a51:6f1d with SMTP id f21-20020a056a002395b02903047a516f1dmr7387023pfc.53.1624427701428;
        Tue, 22 Jun 2021 22:55:01 -0700 (PDT)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
        by smtp.googlemail.com with ESMTPSA id ml5sm3980846pjb.3.2021.06.22.22.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 22:55:01 -0700 (PDT)
From: Yizhuo <yzhai003@ucr.edu>
To: 
Cc: yzhai003@ucr.edu,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: atomisp: fix the uninitialized use and rename "retvalue"
Date: Wed, 23 Jun 2021 05:56:31 +0000
Message-Id: <20210623055634.12603-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Inside function mt9m114_detect(), variable "retvalue" could
be uninitialized if mt9m114_read_reg() returns error, however, it
is used in the later if statement, which is potentially unsafe.

The local variable "retvalue" is renamed to "model" to avoid
confusion.

Signed-off-by: Yizhuo <yzhai003@ucr.edu>
---
 drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index f5de81132177..fbd6c6cd84c8 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
@@ -1533,16 +1533,19 @@ static struct v4l2_ctrl_config mt9m114_controls[] = {
 static int mt9m114_detect(struct mt9m114_device *dev, struct i2c_client *client)
 {
 	struct i2c_adapter *adapter = client->adapter;
-	u32 retvalue;
+	u32 model;
+	int ret;
 
 	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C)) {
 		dev_err(&client->dev, "%s: i2c error", __func__);
 		return -ENODEV;
 	}
-	mt9m114_read_reg(client, MISENSOR_16BIT, (u32)MT9M114_PID, &retvalue);
-	dev->real_model_id = retvalue;
+	ret = mt9m114_read_reg(client, MISENSOR_16BIT, (u32)MT9M114_PID, &model);
+	if (ret)
+		return ret;
+	dev->real_model_id = model;
 
-	if (retvalue != MT9M114_MOD_ID) {
+	if (model != MT9M114_MOD_ID) {
 		dev_err(&client->dev, "%s: failed: client->addr = %x\n",
 			__func__, client->addr);
 		return -ENODEV;
-- 
2.17.1

