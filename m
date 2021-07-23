Received: from mx-lax3-3.ucr.edu (mx.ucr.edu [169.235.156.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B04168
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 00:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1627000548; x=1658536548;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=WjZhPfz6WGA+e7+W6h7hHSdZYaAsvQABJiyNAJlDjpE=;
  b=c81le/XpKWk2Z8zMg2IWyhFkiWVQ5+BMXmWH1AdnXakxr5Avmq/r7jp2
   lsIssb6jywCaiJSZd9dwn6F2ltVhx8mngddapqH73QQdBfWvipHH06rq9
   bLKdWAt1H+jdq3zDbJ8c40bOlH3K24Yyi3MZ8vPQzuUPgajOKWSARPVuQ
   WgEgw0AMNag5uvtS64CEjome4hKaYpi/ZBlnBLQHPFKPgoOn9UJm2Q7YY
   14E7Z8lhBQFu0vCrV5jH8yN3xsyH3FuZ8Pb5sv4yBe4J0XZNx6L/37d+v
   gIyfK0iCvorTgpFVMifBieQJfTcbYaHgLlHeIjKgi1d4b/AhiNTUxpTF2
   w==;
IronPort-SDR: cxfaXlJn3ChhCG7tOXqeugvbZj2IKeUtn34pHKdQMeSVA75WBmnoBL4ANpYOSeHlAu82b0Kbom
 HSQHoeW+fdrrXJaJxd1gxm4nrDwRkmf4VrV69o6WVPyo7C6rYTeaGKqcnScu7td/dkdVBBh5L6
 2RVnW9yJwiGzON8sUDV20SgwJlXKDZpzM+/epYjste3NfgnSMa/EK5ga5kVEDeSnwKpipAowTH
 VH3oDOFqFmVoHUKpvYyPs6MWKjKrquEGIBh999xE2RA7fxNccQHokJrA5fIX3XFi5sSXuPNVmE
 lnQ/XwXqqSf4lWFyMjJgMdQm
X-IPAS-Result: =?us-ascii?q?A2FsBQBQDvpgf0jYVdFagmKDFmNVFpRkAQEBBowmGIECh?=
 =?us-ascii?q?nyIZoF8AgkBAQENAQFBBAEBhFcCgngCJTQJDgIEAQEBAQMCAwEBAQEBAQMBA?=
 =?us-ascii?q?QYBAQEBAQEFBAEBAhABAYEMC1kLY4FPgXkGBD2COCmDZQkCAQMSFVIQPxI0A?=
 =?us-ascii?q?QUBHBkiOYIWAYJhJpx2gQQ9jDEzgQGIJAEJDYFjCQEIgSiIfIRwJ4EZgRCCU?=
 =?us-ascii?q?IEzdYdvglAEgx17E4IpgVABAQGQMRuDBgGMZptoAQYCgwwcgxKbEkWGYI5dk?=
 =?us-ascii?q?Sa7FgIKBwYQI4E9ghVNJYFsCoFBTQECAQIBDAIBAgECAQIBAggBAQKca0EyO?=
 =?us-ascii?q?AIGCwEBAwmLWQE?=
IronPort-PHdr: A9a23:Q8QDzhDOU7OzUmCuafFZUyQUmUMY04WdBeb1wqQuh78GSKm/5ZOqZ
 BWZua81ygSWFt2Eo9t/yMPu+5j6XmIB5ZvT+FsjS7drEyE/tMMNggY7C9SEA0CoZNTjbig9A
 dgQHAQ9pyLzPkdaAtvxaEPPqXOu8zESBg//NQ1oLejpB4Lelcu62/6u95HJbQhFhjWxba9wI
 R6rsQjfq84ajJd4JK0s0BXJuHxIe+pXxWNsO12emgv369mz8pB+7Sleouot+MFcX6r0eaQ4V
 qFYAy89M28p/s3rtALMQhWJ63ABT2gZiBtIAwzC7BHnQpf8tzbxu+Rh1CWGO8D9UKs5Uiq+4
 ah1VBDoiT8HNz8n/2HRlsxwl79QrBa4qxBi34LYfISZOfx7fqPcZtMaXmtBXsBeVydcHI2yd
 pYED+QAPelGq4nyukYFoR+wCAWwAe/izDhHi2P40KEmzugtCB3K0BE9FN4KrXjZrND5OaEPW
 u630abI1y3OYfNI1zng5obGcRcvrvOCXb9rbcbd1VMiGx/fg1mMtYDoOS6e2OQXs2ic6uptT
 eCgi28mqgFxvzivwdonh47Jh4MUylDL7yR5zJopKdC2U0N7fMKrEIFKuy6EKoR2X9ovTmd1s
 yk11rMIo4S0fDQWyJs53R7fbeSKfYiI7B7+W+icICt0inJqdr+jhBu/8Ueux+nhW8Sp01tHs
 ypIn8fCuH0D1xHe5dWKRPRg80q82juDywTe5+FaLE0yiKHVKIYhz6YumpYPtUnPBCz7lUXsg
 KOIa0kp+/Kk5ub5brn+u5ORNot5hhvgPqkgmsGzG/o0PwoUU2SF5+ix2rvu9lDjTrpQlP05i
 KzZvYjfJcQcu6G2HRdY0p0m6xajFzem18kYnWUfIFJFZh2Hi4/pNknLIP/iDPe/h02gkC9px
 /zbJ7HhDJfAImbZnLfuerZ97EFcyA4twtxF+51UDbQBLOryWk/3qtPYEgc0PxKoz+vjEtlw1
 YMTVXiRDqOEMa7eq12F6vw3L+mJfoAVuTL9K/Y/5/7piH80gV8cfKip3ZQNaXC0AuhqLkuCb
 HrxntgBC30GsRQjQ+z3kFGCSyJcZ26uX6Ig4TE2EIamDYbFRoCwj72NxTy7HoFMaWBJC1CMF
 3joep6AW/cNcyKSPtRhniYAVbigTY8hyB6vuBXnxLV5MOqHsgMCspe25dln5/DU3UUj5zx9D
 pzFiEmQRHsyk28VEWxllJtjqFBwnw/QmZNzhOZVQJkOupt0
IronPort-HdrOrdr: A9a23:oNr8yK6CPV5BYlUe9QPXwPXXdLJyesId70hD6qm+c20xTiX2rb
 HIoB12726WtN9VYgBZpTn/AtjnfZq0z/cciuks1PWZLXLbUQOTTb2KhrGSpwEIdReOlNK1Fp
 0MT0G9MrfN5JRB4voSmDPIaurICePqnpyVuQ==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.84,262,1620716400"; 
   d="scan'208";a="59232962"
Received: from mail-pj1-f72.google.com ([209.85.216.72])
  by smtp-lax3-3.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Jul 2021 17:34:39 -0700
Received: by mail-pj1-f72.google.com with SMTP id r91-20020a17090a43e4b02901765d5b4c69so4516696pjg.1
        for <linux-staging@lists.linux.dev>; Thu, 22 Jul 2021 17:34:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gm4YUZj/EvvmVEru6DPj42P4a48GvfDB+tH0wczqnc0=;
        b=ZiWDHLEL20N+fp+SdT+XQ3KrMMC25uJPwvvTBAZF/3c1DJgOHZb0QAI+U8+65lVRNg
         iyBYYls6ORU4/9QD9Zea5UN9BwI2Uw0TbeJSnz1g/BRfOYQUZpiTqRAQaYmYtdV1d9Zg
         Uke3kYuglxRaBs5I1kliJ3TStMGmyLFwyyo6gOsuR/Yh5x0zim5neVjtGN0qAi2UuZPa
         yLO0OybKux7bnu6Tgb9UG2/M6vXK2Q0HOFXyUJ/MAo5IW078ZWqPicBcll3a4lUhX22g
         MSWmRxSNRJ7shnqymFEyvVvLu4A391T1LNpuDqq7j4GrZhHydwI9my+jJgpBEmWqFkRv
         QKTg==
X-Gm-Message-State: AOAM532cCLfildUUhC/hlezgfF5/JoL5k82OZRoGZJdnJMwViNdW3ZBC
	ompm8tmPwO4Jlne3AQy7b/Fb7VtGGo1+VHbD2+RkYcZ8uo+vPKEEDOV2y8izGRMYEosO4t3m+F4
	7wBC4Mnko2VPzfkyN7eoEALyEk+0=
X-Received: by 2002:a17:90a:474f:: with SMTP id y15mr2247993pjg.2.1627000478320;
        Thu, 22 Jul 2021 17:34:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3T0RPoWuoz2nGgWu0oAbQM62TN09QruMzto43e2KyEy0LRuU/QLOYIutxXpEvtusHLp4qOA==
X-Received: by 2002:a17:90a:474f:: with SMTP id y15mr2247975pjg.2.1627000478123;
        Thu, 22 Jul 2021 17:34:38 -0700 (PDT)
Received: from kq.cs.ucr.edu ([169.235.27.223])
        by smtp.googlemail.com with ESMTPSA id b18sm4059224pji.39.2021.07.22.17.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 17:34:37 -0700 (PDT)
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
Subject: [PATCH v4] media: atomisp: fix the uninitialized use and rename "retvalue"
Date: Fri, 23 Jul 2021 00:36:04 +0000
Message-Id: <20210723003607.64179-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210723085145.1ce7ee5c@canb.auug.org.au>
References: <20210723085145.1ce7ee5c@canb.auug.org.au>
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

Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
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

