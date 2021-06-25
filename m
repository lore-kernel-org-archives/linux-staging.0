Received: from mx2.ucr.edu (mx.ucr.edu [138.23.62.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B2D2FB8
	for <linux-staging@lists.linux.dev>; Fri, 25 Jun 2021 05:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1624599451; x=1656135451;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=G2oig34TGgKGc+PsnU3ZBFvHpvFyfTN2H3X7vZGztVI=;
  b=VFN9VlCvFOwo2/rnPHXhc9EEdi/rTMtGKo31D8G30CKYHbtZnuFoWBfE
   mpFgokFNQ9qu5byxvcuETVIJNArCKs2Twoycf51uFFe9/dcz2RTtJTBYT
   akhLrnJGWwsybeKtV9//pZiPYmoWJO8Dtjtmab2kew/XPXFzE+q690fz0
   zYLsVYMjHs/KtIz7fkJckjLjrnQKwYNFNFFrr2kOOieAjEUYVhsrNIKw/
   pJkiydYwnSsTD/EYCqqFIlH5IwUlJONqyrAAIytTng4JCodv+rUbZS3sU
   WbK9wkcIP5SBRGyxEiUZXbsJUziVpz6igxT6YSz1UL2MzmVEM5mskPeB9
   Q==;
IronPort-SDR: 7WjwyW+wp/NsdJnbbAhWpBqTz/rfhA5d/A7JPDibyBo7hAK543ZFic2P0+YzzpoArdz2ZXhzvz
 gd/ljW5yRx1nIhFG/1uSXQ2Fy2eOHySxoOT14mzX3BeEIhpiQ8XuMunR+huNfdzP4cIYoagHRH
 IAmGvJoML7ne02GK54F9KIMnyhDA6oqWicTkXokYWf0A3LHFQg+xPlW1tYyqr1Pri4JrXukVgS
 gNKIter4R9ll5bim10F4H6rSdBm+xz45foXGqqaFM8TA2rSvf5yri05VLL01SIbCJcgHAs8i95
 A/k=
X-IPAS-Result: =?us-ascii?q?A2G6CADzatVgf8bXVdFagmCDeVUWjUyHLwEBAQaMGhh/h?=
 =?us-ascii?q?nmIZYF8AgkBAQENAQFBBAEBhFICgnACJTQJDgIEAQEBAQMCAwEBAQEFAQEGA?=
 =?us-ascii?q?QEBAQEBBQQBAQIQAQFuhS9Ggjgpg2UJAgEDEhVSEFE0AQUBHBkiOYIWAYJhJ?=
 =?us-ascii?q?psJgQQ9jDEzgQGIKgEJDYFjCQEIgSiIeoRwJ4EZgRCEAnSHb4JQBIMfexODd?=
 =?us-ascii?q?gEBAZATG4MEAYw8m0cBBgKDBRyDAJpwRIZUjieQfroyAgoHBhAjgTGCFU0lg?=
 =?us-ascii?q?WwKgUFQGQ6cbUEyOAIGCgEBAwmMbQE?=
IronPort-PHdr: A9a23:dNd3TxaMAUavO3JKFqkHIVf/LTHv0IqcDmcuAnoPtbtCf+yZ8oj4O
 wSHvLMx1Q6PBtmFoKwZw8Pt8InYEVQa5piAtH1QOLdtbDQizfssogo7HcSeAlf6JvO5JwYzH
 cBFSUM3tyrjaRsdF8nxfUDdrWOv5jAOBBr/KRB1JuPoEYLOksi7ze+/94DXbglSijewbrJ/I
 Bq3oAjRq8IbnZZsJqEtxxXTv3BGYf5WxWRmJVKSmxbz+MK994N9/ipTpvws6ddOXb31cKokQ
 7NYCi8mM30u683wqRbDVwqP6WACXWgQjxFFHhLK7BD+Xpf2ryv6qu9w0zSUMMHqUbw5Xymp4
 rx1QxH0ligIKz858HnWisNuiqJbvAmhrAF7z4LNfY2ZKOZycqbbcNMfRGpBRd1RVy1HAoOzc
 oABEfMPNvtWr4n8uVQOqQaxDhSoCO7h1jNEg3n70qom3ukvDQ3KwRUsE84TvH/JqNn5KacfX
 eWzwaLVzzvMculW1C/95obWbx4vr/KCU7Vyfsrf0kQjCx/Jg0+MpYH/Iz+ZyuIAuHWb4ep6U
 uKvjnYqpANwojmuxscsl47JjZ8Sx1HE9CR5wJw6JdykREJnb9OpC4ZQuD2AN4dsXMwtXnxot
 T88x7YbtpG1YDIEx447xx7DdfOHaY6I7wrjWuiRPDt2i3NodK6/iRi97UWtye3xWMaw3VtXs
 ydIkcTBu3AT2hLd5MWKSvRw81qu1zuSyg3e6f1ILEQ0mKfFLZMq370+loILvEjdAiP7nF/6g
 ayWe0k+5OSk9uTqbq/7qpKYNIJ4khzyP6Uql8ClH+g1PAgDU3KF9em+zrHv41P1TbtMg/Yri
 KfWqoraKt4epqOhBg9V1Zss5AinAje91dQYgWEHLFVYeBKbl4TpO0/BIPT/DfqnhlSjijZrx
 /TfMr35DZXBM2HPkLn8cbt56ENQ0gUzzddY55JbDrEOPuj/VVP2tNzdFhM5Mgq0zPj7CNhly
 I8SRWaCDrWaPa7Sq1OE+P8jLumWaIMIvDvwKOAp5/v0gn84nV8dc7Op3ZwSaH2gHvVnIkWZb
 mDtgtsdDWsHsBEzTPH2h12YSzJceWu9X78k6jEhFI2mFZvDRpyqgLGZ2Ce7H5tWZn1JC1yVC
 nfoa5+LW/gNaCKULc9siTgEVbm6S489zhGirgv6y7thLurJ9SwUr4/s28Zr576buws18GlFD
 tadzmbFG3BmnmoJH2dt9L10uwpwxkrVgvswuOBRCdEGv6ABaQw9L5OJirEnY+0=
IronPort-HdrOrdr: A9a23:/7krMq3D4Zj7ZGvszw/aggqjBI8kLtp133Aq2lEZdPWaSL38qy
 nApoV96faZskdzZJhko6H5BED/ewK7yXcd2+B4VteftUvdyRCVxelZjLcKqAeQfxEWmNQtt5
 uIsJISNDQzNzJHZArBjzVQa+xQueVvOZrF69vj8w==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.83,298,1616482800"; 
   d="scan'208";a="160879411"
Received: from mail-pg1-f198.google.com ([209.85.215.198])
  by smtp2.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2021 22:37:24 -0700
Received: by mail-pg1-f198.google.com with SMTP id m13-20020a633f0d0000b0290222ece48979so5351974pga.1
        for <linux-staging@lists.linux.dev>; Thu, 24 Jun 2021 22:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xtwG69GQCPYiiB5WlVucW+OBGTJgS4kN+uKVm3Qcm3Q=;
        b=LuBa6XyrAJ42jjVbLHge+xNbc1gnGVxkCppYQxYpqTLq0YsliJ053FiWydmqDcCl+T
         YHbBAMy7iBOR8GGF1ECnxMkkRwlz7boJ4/HSe2EnC/Dn3gAcStXaLQrsSEF8BTOcEhAw
         2Waofthjzk/mKaVjujk5Az1uVu+0R35TgMNy8kmHYu6q9Lq4KYoRDnlgHFGQ4ZoBNDC0
         +l9w6/l3eFxlTYiMHV17xNmbEdNUfMeOYUV4BIIUkXEM3YEnmnjvwNJ4o7ONTYwK4xXL
         Duu9NILnlwWf9S6qVAscpX84xTru8MahL9kOCNtRKtRCwjcWuy6YFkCnGW01dcWRx3gU
         D6/w==
X-Gm-Message-State: AOAM532cuvjaoyXqpcfzTX2seTuruQQRzonp+HOS1n3pqkym0Zp3MBXC
	OeabbRS6OGtULSLlyFLLE/ProalaMHJYArHZlnkAn0bHOhSlVc07A3AatO2QSjRLE8ikt99qWmh
	XNejAuiAEf8ZbwZIq9vjG4SqSvFc=
X-Received: by 2002:a17:90a:af95:: with SMTP id w21mr19507059pjq.72.1624599442521;
        Thu, 24 Jun 2021 22:37:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqRTmcqC4vi40EHsgDckYDej90aX9OSDH8R6PN5TIdXSwHdDOECqZKmcofW6Yn2pEh34YR1w==
X-Received: by 2002:a17:90a:af95:: with SMTP id w21mr19507045pjq.72.1624599442356;
        Thu, 24 Jun 2021 22:37:22 -0700 (PDT)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
        by smtp.googlemail.com with ESMTPSA id z26sm260933pfk.112.2021.06.24.22.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 22:37:21 -0700 (PDT)
From: Yizhuo <yzhai003@ucr.edu>
To: 
Cc: Yizhuo <yzhai003@ucr.edu>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] media: atomisp: fix the uninitialized use and rename "retvalue"
Date: Fri, 25 Jun 2021 05:38:56 +0000
Message-Id: <20210625053858.3862-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210624031719.11157-1-yzhai003@ucr.edu>
References: <20210624031719.11157-1-yzhai003@ucr.edu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Inside function mt9m114_detect(), variable "retvalue" could
be uninitialized if mt9m114_read_reg() returns error, however, it
is used in the later if statement, which is potentially unsafe.

The local variable "retvalue" is renamed to "model" to avoid
confusion.

Fixes: ad85094 (media / atomisp: fix the uninitialized use of model ID)
Signed-off-by: Yizhuo <yzhai003@ucr.edu>
---
 drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index f5de81132177..77293579a134 100644
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
+	ret = mt9m114_read_reg(client, MISENSOR_16BIT, MT9M114_PID, &model);
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

