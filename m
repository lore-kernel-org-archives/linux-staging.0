Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5053D68
	for <linux-staging@lists.linux.dev>; Sat,  1 Apr 2023 15:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680361203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t4kfFE6KYMiQFTFIfMGebaiWP7ApdcSgc6W/HcJ9JMk=;
	b=ZXF2kMEKm4yyhzg4MgzwVrbtm2m7GGhy0wYlztQ9u4pBj2BAutkdJso54etpic9CwOGM6o
	NdD0USB3lr1sYq40OMMm8jXBWb68I0TXdjCds19Z5G7ln5+ScGvuY9Bz2pwA5LiJ956rIz
	mYqVvcm6gA/EiPnYhcotiunv/IypziE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-211-SjAC1yPnM6yLP0jkgWwOEA-1; Sat, 01 Apr 2023 11:00:00 -0400
X-MC-Unique: SjAC1yPnM6yLP0jkgWwOEA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5777C8533DC;
	Sat,  1 Apr 2023 14:59:59 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.49])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CB9124021BC;
	Sat,  1 Apr 2023 14:59:57 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 13/28] media: atomisp: gc0310: Add error_unlock label to s_stream()
Date: Sat,  1 Apr 2023 16:59:11 +0200
Message-Id: <20230401145926.596216-14-hdegoede@redhat.com>
In-Reply-To: <20230401145926.596216-1-hdegoede@redhat.com>
References: <20230401145926.596216-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10

Add error_unlock label + goto error_unlock on error to remove separate
unlock-s in all the error-exit paths.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-gc0310.c        | 28 ++++++++-----------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 6c0877ab96e3..239fc9012910 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -432,31 +432,27 @@ static int gc0310_s_stream(struct v4l2_subdev *sd, int enable)
 	if (enable) {
 		/* enable per frame MIPI and sensor ctrl reset  */
 		ret = i2c_smbus_write_byte_data(client, 0xFE, 0x30);
-		if (ret) {
-			mutex_unlock(&dev->input_lock);
-			return ret;
-		}
+		if (ret)
+			goto error_unlock;
 	}
 
 	ret = i2c_smbus_write_byte_data(client, GC0310_RESET_RELATED, GC0310_REGISTER_PAGE_3);
-	if (ret) {
-		mutex_unlock(&dev->input_lock);
-		return ret;
-	}
+	if (ret)
+		goto error_unlock;
 
 	ret = i2c_smbus_write_byte_data(client, GC0310_SW_STREAM,
 					enable ? GC0310_START_STREAMING : GC0310_STOP_STREAMING);
-	if (ret) {
-		mutex_unlock(&dev->input_lock);
-		return ret;
-	}
+	if (ret)
+		goto error_unlock;
 
 	ret = i2c_smbus_write_byte_data(client, GC0310_RESET_RELATED, GC0310_REGISTER_PAGE_0);
-	if (ret) {
-		mutex_unlock(&dev->input_lock);
-		return ret;
-	}
+	if (ret)
+		goto error_unlock;
+
+	mutex_unlock(&dev->input_lock);
+	return 0;
 
+error_unlock:
 	mutex_unlock(&dev->input_lock);
 	return ret;
 }
-- 
2.39.1

