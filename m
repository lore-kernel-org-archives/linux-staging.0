Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF21A1DE8B2
	for <linux-staging@lists.linux.dev>; Sat, 17 May 2025 11:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747482095; cv=none; b=JqTzShRk83Ifiu6rRmF8HWc7lu7luU4r++aVXAfsaNdqyuXU602BXKBO4RimokWbKeCOJH/sT9o3LE6/nn5qauZjfKfMYIytOy8JuN8mtKXZJQD368GY9CslIWo+ARZ/7ZL5MiEqxSWAHZmJlXI6294pLsREliBccOM1KAtkgRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747482095; c=relaxed/simple;
	bh=jK/vrgG07dcevue1rte3AVOpSkRUFJqw+vDhVBclD5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hpkx7TFxFxZ6PMpggM7V0HMZVUWPjoqDjVWi8G7Y85qnSLshpirvbgXE/5SDTrIvGqR/M6OHoRMNxytSRxtQRohdImhn95csj4goUMjxHxUe3wZfp0czs0ZA9npWeA5gzSucbTE59/XTuyYvL7bMzEeD2SWXrZeAG22Ts1XQ2S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZPTQnkho; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZPTQnkho"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747482092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=37rKD/x6wYb49G2Eb30IpXZhx0NW0+TDvj/kszqUg4A=;
	b=ZPTQnkhobkwWssHvvoubEDHxUjJGl43sEO8G4MKP6h0Io27BdWiz8smy/pQkpSWUBOErUa
	aERM6s0FEbPzsQh1ey4UG/qSqu1zsP5ubFk2OqIjib9Mb/4syVuJtzVq5Xrl0mN5x5SuY9
	tKw4c3PrIQCiKm2dEDjhbtfckONvxqI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-66-EA3mrYpLPQeTYsl2P0lG3g-1; Sat,
 17 May 2025 07:41:31 -0400
X-MC-Unique: EA3mrYpLPQeTYsl2P0lG3g-1
X-Mimecast-MFC-AGG-ID: EA3mrYpLPQeTYsl2P0lG3g_1747482090
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D9EB01800446;
	Sat, 17 May 2025 11:41:29 +0000 (UTC)
Received: from x1.redhat.com (unknown [10.45.224.43])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 251EE180045B;
	Sat, 17 May 2025 11:41:24 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 03/23] media: atomisp: gc0310: Modify vblank value to run at 30 fps
Date: Sat, 17 May 2025 13:40:46 +0200
Message-ID: <20250517114106.43494-4-hdegoede@redhat.com>
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

Currently the sensor is running 30.9 fps, increase vblank
to have it actually run at 30.0 fps.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index f253b4b494f2..6b11f0ff6088 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -141,7 +141,7 @@ static const struct gc0310_reg gc0310_reset_register[] = {
 	{ 0x05, 0x00 },
 	{ 0x06, 0xb2 }, /* 0x0a //HB */
 	{ 0x07, 0x00 },
-	{ 0x08, 0x0c }, /* 0x89 //VB */
+	{ 0x08, 0x1b }, /* 0x89 //VB */
 	{ 0x09, 0x00 }, /* row start */
 	{ 0x0a, 0x00 },
 	{ 0x0b, 0x00 }, /* col start */
-- 
2.49.0

