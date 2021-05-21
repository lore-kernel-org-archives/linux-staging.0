Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B11570
	for <linux-staging@lists.linux.dev>; Fri, 21 May 2021 19:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621626494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dcVKe0qdt5wPmssTiHpynTzWxX54hdMY2B36rci5X+Q=;
	b=S2FjYcCeJ44M5oGOH96bfIj6i8n46enoPIw+P9Udkcmc8YAscmr7RBIy9kSgc9VhM2MSny
	S6rxgTAiFStdgXxArB0p88aq0yPHSic7/EhYc7ReoNaVEcXqebLlYxx5fRTTMJp4BHSenH
	nKZ/sco+TBRhfGmDog0zmqlZlvBH+wg=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-jQvwsTFKMMOukYfeBVEjZg-1; Fri, 21 May 2021 15:48:10 -0400
X-MC-Unique: jQvwsTFKMMOukYfeBVEjZg-1
Received: by mail-ot1-f71.google.com with SMTP id c19-20020a0568303153b0290315c1232768so11512264ots.9
        for <linux-staging@lists.linux.dev>; Fri, 21 May 2021 12:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dcVKe0qdt5wPmssTiHpynTzWxX54hdMY2B36rci5X+Q=;
        b=YhYbueTQx2bu0P3PT0jXG8oa9z1E8fKBEPpaJGUT1dmuZUWJ29d9JgYV/VSuh9xRGS
         KgKSnyi8i1en/aM8wBg/0R6BOfAUQr6Z2+FcaIrOUxQkgEjJ3tkiRnkdEEEnaRw9Rb73
         lc18wyb8+2LM8KnCqNWOlXhxKF5IgbirXdKx56Dutzrv+x9qoxYehQGaJU7F+b0t5YED
         DCwrqwwgIJIIQILUbcHLeSjVSBXpwayI5ezDA4qDoQJQOspLziKNavdEeRgSR/L0eoLF
         pXxGGlo/v+eSG5ZpqW4y38swXYR6v8/MZHlLYnxYr8fHYlv++OthyaNfOeycUrAGpQa8
         UFPQ==
X-Gm-Message-State: AOAM531CcrZ1gEB1f1Og5et4OOXgMuhv+IIpptJq+MXWJFwKzxHhrq6T
	GmtaiCj665a1qVl5es7X69LIdqkc/HVkP2416+d8HdZJr+dDhcxgQ/YPsZC6wkmWt3Y84N3T3Qz
	rNKBr69ZpeJgK5dWp55ZOsIZR4w==
X-Received: by 2002:a05:6808:6c5:: with SMTP id m5mr3394630oih.128.1621626490083;
        Fri, 21 May 2021 12:48:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYrYQGPQcv+yBq3l/flebYi1hTX+R84vJTx8eoodbyd7DfEsBjcEW5UppYT9L2Rb+H4ngnOw==
X-Received: by 2002:a05:6808:6c5:: with SMTP id m5mr3394619oih.128.1621626489952;
        Fri, 21 May 2021 12:48:09 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id w20sm1302157oic.54.2021.05.21.12.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 12:48:09 -0700 (PDT)
From: trix@redhat.com
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	drv@mailo.com,
	martinsdecarvalhobeatriz@gmail.com
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] media: staging: atomisp: improve error handling in gc2235_detect()
Date: Fri, 21 May 2021 12:48:05 -0700
Message-Id: <20210521194805.2078135-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Tom Rix <trix@redhat.com>

Static analysis reports this representative problem

atomisp-gc2235.c:867:20: warning: The right operand
  of '|' is a garbage value
        id = ((high << 8) | low);
                          ^ ~~~
When gc2235_read_reg() fails, its return val is never written.

For gc2235_detect(), high and low are or-ed and compared
with GC2235_ID, 0x2235.  Initialize both to 0 and skip
checking the read returns, it's errors are not passed up, only
-ENODEV is.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index 38defa0f81513..3b6e02b1f45d1 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -849,21 +849,14 @@ static int gc2235_get_fmt(struct v4l2_subdev *sd,
 static int gc2235_detect(struct i2c_client *client)
 {
 	struct i2c_adapter *adapter = client->adapter;
-	u16 high, low;
-	int ret;
+	u16 high = 0, low = 0;
 	u16 id;
 
 	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C))
 		return -ENODEV;
 
-	ret = gc2235_read_reg(client, GC2235_8BIT,
-			      GC2235_SENSOR_ID_H, &high);
-	if (ret) {
-		dev_err(&client->dev, "sensor_id_high = 0x%x\n", high);
-		return -ENODEV;
-	}
-	ret = gc2235_read_reg(client, GC2235_8BIT,
-			      GC2235_SENSOR_ID_L, &low);
+	gc2235_read_reg(client, GC2235_8BIT, GC2235_SENSOR_ID_H, &high);
+	gc2235_read_reg(client, GC2235_8BIT, GC2235_SENSOR_ID_L, &low);
 	id = ((high << 8) | low);
 
 	if (id != GC2235_ID) {
-- 
2.26.3

