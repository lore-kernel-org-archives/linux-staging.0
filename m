Received: from mx2.ucr.edu (mx.ucr.edu [138.23.62.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0CD168
	for <linux-staging@lists.linux.dev>; Thu, 24 Jun 2021 03:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1624504615; x=1656040615;
  h=from:to:cc:subject:date:message-id;
  bh=SblKopDqFHSiwCfGDOMHISY6FX5IDGcC7lO8ql3WkLo=;
  b=hpY/zxsUCyMlJ5EtKnmLMEI3fCc4nS/nUcov45xCmKiMPZDveqlrLs8G
   gVIionMjkN/yNZHowSRebZYFgev9N+Lia38UP/rhjql0r2o/yf713c0af
   1u4guBXcUPDfzWJzGIk58UK5CrxQDG4K+OcDwpqJvqTDuQv/ye7KmR0FL
   iLftNFtsKJrNVaqFaBoX9A7MWT1qgh3WV9Ma3lw7eDiMZ3GK/SPbnuJGC
   4+usLrGnCRSTzthyKwxhM+VOfYIMYaG2V3PDgNg5Lun4tMDht1kVnnlJv
   Ha0Bh9cr+JWvoLkSUlEeeuignY8HNdjaAvCAebaEvN1r5UooMU0BIMvBF
   g==;
IronPort-SDR: WWshRNxqQIl84azsNospzd/PC9hs70S4hccGij311Qk4v/SQigngz8pue4fklmlK5yCqxpOOfQ
 rwWnEwNoufZTK0eXOtAjr+goUBlrz7sYNuCWCZsvHSDub3E9nJOWbJKdq0VcBk2dg7G5cxYNhy
 iXG2Z6I+Y6TFAlwskfn2EzjpX5HtUTE/eavnhdsWSCEK3V0cOK/Fwn0NeVoKfvelbwZOQnolNf
 GJ1OffpSU/6E6QILGACo6LL7Rh8wtUhMrnJSVT78IhoGjCJbOzyNjfFYE6qOVCopd9Mf34oDTy
 iQ8=
X-IPAS-Result: =?us-ascii?q?A2GfBgD799Ngf8fXVdFagmCDeVUWjUyHLwEBAQaMGRh/h?=
 =?us-ascii?q?nmIZYF8AgkBAQENAQFBBAEBhFCCcAIlNAkOAgQBAQEBAwIDAQEBAQUBAQYBA?=
 =?us-ascii?q?QEBAQEFBAEBAhABAW6FL0aCOCmDZQsWFVJQRQEFATUiOYIWAYJhJpofgQY9j?=
 =?us-ascii?q?DEzgQGIGgEJDYFiCQEIgSiIeoUXgRmBEIQCdIdvglAEgxt7E4N2AQEBkBAbg?=
 =?us-ascii?q?wQBjDubRgEGAoMFHIJ+mm5EhlSOJZB+uiYCCgcGECOBMYIVTSWBbAqBQVAZD?=
 =?us-ascii?q?o11AY53QTI4AgYKAQEDCYwrAQ?=
IronPort-PHdr: A9a23:RCmSDBR+6Zz2ePJ2WssBh72PENpsokGfAWYlg6HPa5pwe6iut67vI
 FbYra00ygOQDMOAt64P17WempujcFRI2YyGvnEGfc4EfD4+ouJSoTYdBtWYA1bwNv/gYn9yN
 s1DUFh44yPzahANS47xaFLIv3K98yMZFAnhOgppPOT1HZPZg9iq2+yo9JDffgFFiCCzbL59I
 xi6ogrcu8sLioZ+N6g9zQfErGFVcOpM32NoIlyTnxf45siu+ZNo7jpdtfE8+cNeSKv2Z6s3Q
 6BWAzQgKGA1+dbktQLfQguV53sTSXsZnxxVCAXY9h76X5Pxsizntuph3SSRIMP7QawoVTmk8
 qxmUwHjhjsZODEl8WHXks1wg7xdoBK9vBx03orYbJiIOPZiYq/ReNUXRW9AXsZKTCxBA4W8b
 4QSBOQfJOhTsof9p1oQohu6GAanGefjxzFUinPz26A11PgsHA/a0AA9Bt4CrGnYp8jxOKsPU
 e25ya/FxijBYfxLwzfw8IjGfA48r/+CXrx+dtHcxVUzGw7fklmds5DpMy+T2+8Qs2ab9e1gV
 ee3hmElqgFwozivxtorioLUgY8UylHF9SVjz4Y0OdG0VEB2bMW5EJRMrSGWLZV5Td4/Q2xxv
 isx17IJt4KhcicQ1JQn2wDQa+aBc4WQ7R/vSuScLzdkiH9heLyzmRa//EuuxODiSMW60FdHo
 yhYn9TNtH0A0x3e58mZR/Zh/UqtxSqD2gLO5uxLP0w6lazWIIMizL4ojpcfr1jPEyvslEj1j
 KKabFso9vWo5uj9f7nropuRO5dphgz/NqkigNKzDOo4PwQUQWSW+/6w2KP98UD3RrhBk+c4n
 bPDsJ/AIMQWvqu5AwhI3Yk98xu/FDKm0MgAnXkAMVJFZAqLj4j3NFHKJ/D1FfK/jE6tkDdv3
 vzGJrLhDojUInjNjbvsebJw51RTyAo0ytBf6JZUBa8bLP3vXU/xscTUDh4/MwOq3+bqEMtx2
 p8aVG6VAaKUMLnevUGV6u8vOeWAeYsYtTLlJ/gg/fHujHs5mVEHfamu2JsacHC5H/VmI0qDY
 HrgnssNHGkRswojUOPqkkeOXiBOaHavR648/C00CJq6DYffQYCgmLiB3Ca9Hp1LaWFKE0uME
 WvyeIWLWvcMbi2SL9RlkjwFTrihV5Qh2QuqtA/7zbpnM+XV9jcFup39ytgmr8PJkhRnxD1mD
 9mamzWcXWF9nztQHBcr17o5rEBgnATQmZNkiuBVQIQAr8hCVR03YNuBkoRH
IronPort-HdrOrdr: A9a23:mg5anq3dxFvruxbYiSo9ugqjBLMkLtp133Aq2lEZdPWaSL38qy
 nApoV96faZskdzZJhfo6HnBEDoexq1nv5ICOEqXItKNzOW3FdAQrsSj7cKAAeMJ8Q9zIRgPG
 tbHJSWcOeAdGSSRPyXjjWFLw==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; 
   d="scan'208";a="160618691"
Received: from mail-pg1-f199.google.com ([209.85.215.199])
  by smtp2.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Jun 2021 20:15:46 -0700
Received: by mail-pg1-f199.google.com with SMTP id v186-20020a632fc30000b029022192d6757dso2841820pgv.22
        for <linux-staging@lists.linux.dev>; Wed, 23 Jun 2021 20:15:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=+IbvtWPOhTjlxqwR4MNXPf2er5NRjM2nXY4Wvi5w5Z8=;
        b=UInUS14Yh95mk95/GlnUQHtU1DUigQnepAJIQ4U4fyO65a9l03dyYASdn7kkP3mPSJ
         GsBr2Aej2v6AEtQ+kDGDRLNqaDJiE7tb5iu6rLdpiDuCeLjmIB/HeexPww+C4Odtgf9O
         pzfZcV1gIcQ31r6HYOimgwa+ETms0bhAMllgRgWmejXUsT1Lf1vFy5IH4qOwfQ4zBUjj
         bna/A+Ij/z8SPLXldlEYcQace20IPT6/kJwkz2QdlWlHM2uFJL9gicg4iExVk1lU+k5B
         DSOnjah+TXfUgjY3D3abM8Mx2vQ7Qw/G8vaWPnRzkjF/YDFad1QJbdWXrWp1rRsefiFS
         lCZg==
X-Gm-Message-State: AOAM532FHz/xpCzG4Pb+qEWL5zisvQntOLr7NOZbqHQ1CytvXzOxnbdh
	1TC9Iw0+C/FRNZqws3SerLTS5duef1+NqS8andDtCO0FnTxYe09TXkGGzAM/+W/Yw/UZ2Jusjc5
	zJFMmSTFcZCpxln8+euF00Ge6oRY=
X-Received: by 2002:a17:90b:1291:: with SMTP id fw17mr3008323pjb.105.1624504545075;
        Wed, 23 Jun 2021 20:15:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4C+kYv2hUl0KJDQVzoA3q03zbeF8vVcB+7UTZ0fKdC08nXOLdUMs3yBBA0ckjCw+LxUv8Zg==
X-Received: by 2002:a17:90b:1291:: with SMTP id fw17mr3008313pjb.105.1624504544896;
        Wed, 23 Jun 2021 20:15:44 -0700 (PDT)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
        by smtp.googlemail.com with ESMTPSA id u7sm811917pjd.55.2021.06.23.20.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 20:15:44 -0700 (PDT)
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
Subject: [PATCH v2] media: atomisp: fix the uninitialized use and rename "retvalue"
Date: Thu, 24 Jun 2021 03:17:17 +0000
Message-Id: <20210624031719.11157-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.17.1
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

Signed-off-by: Yizhuo <yzhai003@ucr.edu>
---
 drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index f5de81132177..b02a8cd3dde7 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
@@ -1533,16 +1533,20 @@ static struct v4l2_ctrl_config mt9m114_controls[] = {
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
+	ret = mt9m114_read_reg(client, MISENSOR_16BIT,
+			       (u32)MT9M114_PID, &model);
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

