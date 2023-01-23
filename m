Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855432F2E
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 12:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674478487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zHUJ+C02E6YmrRlLtAxumEjggrRU0c9ROhtMF06hV2w=;
	b=YwC1Hva4S5mWTt1I6RXmgBgkXoWdP8ML2tkf1lCWseVKQJuy0xLCvtfyGSeqL/d4T2Y32D
	Kb84SL2WK5/94+hZR8xKaA4MOG2tl7Yt+zgrvRkASCrmicdaU8CuUb2W6Z8o0/wfDrWfZ1
	78ZFH48aOqw7LLKJUnwfcjhbKPO+PmE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-dO6RnIt-PgW7AABz4bggDw-1; Mon, 23 Jan 2023 07:54:44 -0500
X-MC-Unique: dO6RnIt-PgW7AABz4bggDw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA396101A521;
	Mon, 23 Jan 2023 12:54:43 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A380EC15BA0;
	Mon, 23 Jan 2023 12:54:41 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 52/57] media: atomisp: ov2722: Fix GPIO1 polarity
Date: Mon, 23 Jan 2023 13:52:00 +0100
Message-Id: <20230123125205.622152-53-hdegoede@redhat.com>
In-Reply-To: <20230123125205.622152-1-hdegoede@redhat.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8

The comment claims the PWDN pin is active when pulled down in other words,
it is /power-down so it needs to be driven high to get the sensor
powered-up (not powered down) and flag is 1 when powering-up the sensor
so the ! is wrong, drop it.

This also matches with the schematics which I have which shows GPIO1 also
enables a 3.3v line to the sensor-module which controls the privacy-LED
and indeed before this patch the privacy LED was inverted from what it
should be (and the sensor did not work).

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index d874e12da8cc..83d036b5d772 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -512,10 +512,7 @@ static int gpio_ctrl(struct v4l2_subdev *sd, bool flag)
 	 * before PWDN# when turning it on or off.
 	 */
 	ret = dev->platform_data->gpio0_ctrl(sd, flag);
-	/*
-	 *ov2722 PWDN# active high when pull down,opposite to the convention
-	 */
-	ret |= dev->platform_data->gpio1_ctrl(sd, !flag);
+	ret |= dev->platform_data->gpio1_ctrl(sd, flag);
 	return ret;
 }
 
-- 
2.39.0

