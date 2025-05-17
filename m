Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312AC1F8725
	for <linux-staging@lists.linux.dev>; Sat, 17 May 2025 11:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747482156; cv=none; b=o9wMe7oqotTgBiiXtfzyTcHY8+7IZhOrAH3AOPzLoFcX/LF9YBIM+qj2IpnydrBYYanR2b+ZVZzVUZ1aa7oSGHmZeiAWSuagc3Kh/SYNR8ld2oKxWIYZQWzhC+vuFa6IqBK/73+E9XrQN6sMGWbSCnfMnDarfF+4HTyogHGPMII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747482156; c=relaxed/simple;
	bh=WqZGmpEk3vxwwUIWJwfn1HYSoEqI/BkNDa3C3E2cEkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vDk00tPk7eIyGeZaYgtAPPvCrl0Lb/6f2KT4YiBh//eea6MsQ1nuoTVT9MD+aEUfw3n3GNQnWl9upS3VBvLZOwfb/KH3LQzcROk9R3DI1jMa2w7QdjMVTQh8Hz4GaK3APUuNFueKJ4ZgPDpgerIuO1Zu+bF0xwZkcI/ORxzVe0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ers8up/g; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ers8up/g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747482154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TZZqZ5gfyYgjgP5y0/m1L5GU/Z5B/x2lcV+xdaYXqL4=;
	b=ers8up/gBNL7tZP7kUYaHl6d1hD8QjL+vp2FgDpttPNSEL7ZpGIeSeRFx2KnBVZ0IpvYig
	/2AXWyoz8KiLcjUSbr3AJTDkjwSnhMjS+cVJ8hFXgDGkuzL3Yi7jTCCFReGfFHZ8NV+MT+
	ceeoIT2WjTYz540u+xgXL3Q02k3Dkz4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-303-onfJIfqAO5SKOECpAw3dJA-1; Sat,
 17 May 2025 07:42:28 -0400
X-MC-Unique: onfJIfqAO5SKOECpAw3dJA-1
X-Mimecast-MFC-AGG-ID: onfJIfqAO5SKOECpAw3dJA_1747482147
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BBA5A1800570;
	Sat, 17 May 2025 11:42:27 +0000 (UTC)
Received: from x1.redhat.com (unknown [10.45.224.43])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2B254180045B;
	Sat, 17 May 2025 11:42:24 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 13/23] media: atomisp: gc0310: Remove unused is_streaming variable
Date: Sat, 17 May 2025 13:40:56 +0200
Message-ID: <20250517114106.43494-14-hdegoede@redhat.com>
In-Reply-To: <20250517114106.43494-1-hdegoede@redhat.com>
References: <20250517114106.43494-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

is_streaming is only set and never read, drop it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 162b81789eca..948579c0373d 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -88,7 +88,6 @@ struct gc0310_device {
 	struct media_pad pad;
 	/* Protect against concurrent changes to controls */
 	struct mutex input_lock;
-	bool is_streaming;
 
 	struct regmap *regmap;
 	struct gpio_desc *reset;
@@ -522,13 +521,11 @@ static int gc0310_s_stream(struct v4l2_subdev *sd, int enable)
 	if (!enable)
 		pm_runtime_put(&client->dev);
 
-	sensor->is_streaming = enable;
 	mutex_unlock(&sensor->input_lock);
 	return 0;
 
 error_power_down:
 	pm_runtime_put(&client->dev);
-	sensor->is_streaming = false;
 	mutex_unlock(&sensor->input_lock);
 	return ret;
 }
-- 
2.49.0

