Received: from mx2.ucr.edu (mx2.ucr.edu [138.23.62.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B992072
	for <linux-staging@lists.linux.dev>; Wed, 11 Aug 2021 03:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1628654128; x=1660190128;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=+r6J+pkHEbVFSGHQElxJnDO6jFts9TCA3QpIXRznslM=;
  b=N9Fk07JJqMMI3J/soNMxlZJO6BWC4VaMNZrDU3upimphLFGH2gmdipdN
   ojQo0agQ+Vv3clwfNLrAg0F9d/BG5DlQMVgA2+bOEL94izQZQiS1KFN+n
   YJQ0EBnEGPvtsCNHoafabrZz3Nr7RdWa+RkoixKKLDnilDj7orWmxF8xp
   ckbdPPzjrEbAqJDC5huwgkgdMSbu0/xMdPXl/i4pVK3ZVnMnltFQfUswe
   srA4OwP1Nv2bCOkYwtMH9zRGbyEvXhsw32XtitogB/y778KsmsZTH7dmW
   0WV3LcVAeLRGUlf/5kA9KfM2yPEKFLZCDcNSfZx3U1+I4VVbtuBZMLuzC
   Q==;
IronPort-SDR: gu8BJ7g/Fjm+D90//SDSpV538PXNLwZOjpNL33tdOM/37GtsCs7GsTZumZMOnKe6TveAQXQq0Z
 wcZzH2Yu0oBmtXTpPcTHXFk9pQ2hK7qGx/ASLWf7XBft3+Up16dJmKB/erceyltwzjuVzte2Er
 eY/oIzSSlF6SJuuZdNkPP3db2RTbggaOWmPMyuIwan4ZgBQ/6Q51LaEBsCif6dLoBKBWz+X8Fp
 szQDT8WqwGH1/I3SM69nsnb9QQfzR3OgoN5qsU9O4xW1ozdH2CncpeRPwEhvoxNlGR08pt6//U
 YqQ5GwxlxSWMZP/alTP2kxwL
X-IPAS-Result: =?us-ascii?q?A2F7AgAESRNhhsjWVdFaHgE8DAILgW6DeVUWjUyIaYplg?=
 =?us-ascii?q?RqGfIhogXwCCQEBAQ0BAUEEAQGEWAKCZAIlNAkOAQIEAQEBAQMCAwEBAQEBA?=
 =?us-ascii?q?QMBAQYBAQEBAQEFBAEBAhABAQEBgSALWQtjgU+BeQYEPYI1KYNlCQIBAxIVU?=
 =?us-ascii?q?hAgMTQBBQEcGSI5ghYBgwedHoEEPYwxMoEBiBYBCQ2BYwkBCIEoiH6EcSeCK?=
 =?us-ascii?q?YJQgTN1h2+CUASDW3sTgimBUAEBAZA6G4MGAYtRgSabcQEGAoMOHJ4xRZVFk?=
 =?us-ascii?q?Sq7KgIKBwYQI4E9ghUzGiWBbAqBQU0BAgECAQwCAQIBAgECAQIIAQECjjWOV?=
 =?us-ascii?q?iEyOAIGCwEBAwmIeAE?=
IronPort-PHdr: A9a23:TAmf0x/JNq+FfP9uWe+8ngc9DxPPW53KNwIYoqAql6hJOvz6uci4Z
 AqPvb4z3RfgZsby07p8ke3YsqTtCyQrwK2qlzQ8SqFKTAIPks4MngYtU4avAEz/K+P2PWRhR
 JwRHFBq8GumPkdLBc3we0PdomGo7T4VBx7zKRd5Kv76F4LMk8i7zeO/94HcbwhJgDe2fK9/I
 gixoQjNrMcdnJFsKrw2yhvHo3tIf/pZyGZ1Ll+NnBjy+9m98od7/ytfp/wu+chAUb7nf6sjV
 rxXEC4mM2Eu68L1sxTIUBaC6WEdUmUSlRpIHhTF4RTnVZr/rif2quxw0zSBMMboUb47Ryit7
 6ZzSB/pligHMSI58HrKgcB0la5XvQ6tqwB6z4PSZYGVNeF+frjcfdMcSmpKQ9hfWTVcCYOyb
 osAEe4BMvtFpIX5qVYCsR6yCA+rC+7zxDJEmmL60bQm3+g8DArK2BEsEtILvHnSsd77NrodU
 fqtwafI0zvNcv1Y1zT65ofKfBAsuu2AUa5qfMbN00QjCx/Jg1ONooLlJTOV0eENvnCZ4OphV
 OOvi3MnqwZsqTesxscjkIjJjZ8Sx1HE9CR5wJw6JdykREJnb9OpC4ZQuD2AN4dsXMwtXnxot
 T88x7YbtpG1YDIEx447xx7DdfOHaY6I7wr/WOuVPDt2i2xpdrKiixqv/kauxOPxW8e03VpWo
 CRIjsXAu34C2hHd6MWKSvpw8Ei91TiA1Q3e9OBJL080mKTVLZMq370+loILvEjdAiP7nF/6g
 ayWe0k+5OSk9uvqbq/4qpOAK4N4khzyP6Uql8ClH+g1PAgDU3KF9em+zrHv41P1TbtMg/Yri
 KfWqoraKt4epqOhBg9V1Zss5AinAje91dQYgWEHLFVYeBKbl4TpO0/BIPT/DfqnhlSjijZrx
 /TfMr35BpXBM2HPkLn/cbph90JQ0gUzzddY55JbDrEOPuj/VVP2tNzdFhM5Mgq0zPj7CNhly
 I8SRWaCDrWaPa7Sq1OE+P8jLuaWaIMLpDrxN+Ap5/v0gn84nV8dc7Op3ZwSaH2gHvVnIkWZb
 mDtgtsdDWsHsBEzTPH2h12YSzJceWu9X78k6jEhFI2mFZvDRpyqgLGZ2Ce7H5tWZn1JC1yVC
 nfoa5+LW/gNaCKULc9siTgEVbm6S489zhGirgv6y7thLurJ9SwUr4/s28Zr576buws18GlFD
 tadzmbFfWF9nytcVi021aEn+RdV11yZl6V0nqoLRpRo+/pVX1JiZtbnxOtgBoW3B1+pQw==
IronPort-HdrOrdr: A9a23:qvNFVa7DtAu4XQybwAPXwPXXdLJyesId70hD6qm+c20xTiX2rb
 HIoB12726WtN9VYgBZpTn/AtjnfZq0z/cciuks1PWZLXLbUQOTTb2KhrGSpwEIdReOlNK1Fp
 0MT0G9MrfN5JRB4voSmDPIaurICePqnpyVuQ==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; 
   d="scan'208";a="170462732"
Received: from mail-pl1-f200.google.com ([209.85.214.200])
  by smtp2.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Aug 2021 20:54:18 -0700
Received: by mail-pl1-f200.google.com with SMTP id u8-20020a17090341c8b029012d5f2333bfso528894ple.13
        for <linux-staging@lists.linux.dev>; Tue, 10 Aug 2021 20:54:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=lSccYX79bCga8PfiO71I5eGOlFYRkHyS4P+krasVmlI=;
        b=I5cXliLNrz0pkRqSkQwG+lMWO+hKcuYds1IDXZ+x5/wjGhKzYZ0mpCMbmirQ/AFDRm
         2MXx0XrKLnfh9hDihxZyCBVhVNznoBIsRylJ0s9WsdJogAfk2o39NeHdv2QmTq11GFaY
         h6g9FbYzd4yyW7SkY+ATWnGDlfoW8igtVTQDgnrAOdmYnEtewlBA8ZsPUmO5Hwl8TdDS
         4GDUGAuVBeygDNPz+35y+NbpYBk7OcjavGPkq472GCTvTDzXQomPplV2wfYytLxfCYQo
         YOop/tJM+q8ZafGo9E3i2tx3VxD2e9VtguTot0kBS5x4M4zuxmrV4i+OdLZR3Xkcrd2n
         Fuyw==
X-Gm-Message-State: AOAM532ZY79eb33llgHr4Pv2IB5l9wCuIO12VCjYz0m5bQ564Fteij0f
	2fnVLBZzqhFVIgnUJr0PZCR9E4qx92u6XJAx6W8M7spuP1xdoirv8CdtSEXsJaUFGHlLtTjMQH+
	9ruE+Vs4Es1bDGeG07AKDOi6aKX4=
X-Received: by 2002:a17:90b:f17:: with SMTP id br23mr8156316pjb.60.1628654057101;
        Tue, 10 Aug 2021 20:54:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqbNjbWkU4ar3037qpQVx+m8hnhLSTWWK+YqOhqq7Z85m2c+hqh7j8OGYm44oN3HtAPxORMg==
X-Received: by 2002:a17:90b:f17:: with SMTP id br23mr8156299pjb.60.1628654056896;
        Tue, 10 Aug 2021 20:54:16 -0700 (PDT)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
        by smtp.googlemail.com with ESMTPSA id 143sm21100364pfx.1.2021.08.10.20.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 20:54:16 -0700 (PDT)
From: Yizhuo Zhai <yzhai003@ucr.edu>
To: 
Cc: Yizhuo <yzhai003@ucr.edu>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] media: atomisp: fix the uninitialized use and rename "retvalue"
Date: Tue, 10 Aug 2021 20:54:03 -0700
Message-Id: <20210811035405.17382-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210723003607.64179-1-yzhai003@ucr.edu>
References: <20210723003607.64179-1-yzhai003@ucr.edu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

From: Yizhuo <yzhai003@ucr.edu>

Inside function mt9m114_detect(), variable "retvalue" could
be uninitialized if mt9m114_read_reg() returns error, however, it
is used in the later if statement, which is potentially unsafe.

The local variable "retvalue" is renamed to "model" to avoid
confusion.

Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
Signed-off-by: Yizhuo Zhai<yzhai003@ucr.edu>
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

