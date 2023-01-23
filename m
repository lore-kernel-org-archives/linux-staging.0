Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C37B1C14
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 12:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674478385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iRF0FCkhSfbekDHbGpL6HVAbbt9JiLG0xDJ9T5ggWvA=;
	b=ikO8ITiR42MqQIpHWUQl1DDgJnmciISOLk5E9wUYQioJf40/eWIq1faTc9T3nFxLtc0Kcu
	kAIObdVVMB+X4mr5ywIBlFw7rF5zc+eAU3xrgmyOR+LEo1iuLMF6h82YB2gwmekqh3pM4U
	47qPVkk1iFJ7tLUT35FkKT5dRPew1F4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-I0CNU0-WNoetFNzkL7yJmg-1; Mon, 23 Jan 2023 07:53:01 -0500
X-MC-Unique: I0CNU0-WNoetFNzkL7yJmg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E197D18A6461;
	Mon, 23 Jan 2023 12:53:00 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 67599C15BAD;
	Mon, 23 Jan 2023 12:52:58 +0000 (UTC)
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
Subject: [PATCH 18/57] media: atomisp: Do not turn off sensor when the atomisp-sub-dev does not own it
Date: Mon, 23 Jan 2023 13:51:26 +0100
Message-Id: <20230123125205.622152-19-hdegoede@redhat.com>
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

The atomisp driver creates 8 /dev/video# device nodes. 4 nodes (preview /
video / viewfinder / capture) for each of 2 possible streams aka
atomisp-sub-device-s (asd-s).

Both streams start with asd->input_curr set to 0 (to the first sensor),
opening + releasing a file-handle on one of the nodes of an asd,
while streaming from the other asd causes the sensor to get turned off,
leading to the stream failing.

The atomisp-code already tracks which asd "owns" a specific sensor,
use this to only turn the sensor off if it is owned by the asd.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_fops.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 78af97a64362..833c7aac8f0a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -828,13 +828,17 @@ static int atomisp_release(struct file *file)
 
 	atomisp_css_free_stat_buffers(asd);
 	atomisp_free_internal_buffers(asd);
-	ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
-			       core, s_power, 0);
-	if (ret)
-		dev_warn(isp->dev, "Failed to power-off sensor\n");
 
-	/* clear the asd field to show this camera is not used */
-	isp->inputs[asd->input_curr].asd = NULL;
+	if (isp->inputs[asd->input_curr].asd == asd) {
+		ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
+				       core, s_power, 0);
+		if (ret)
+			dev_warn(isp->dev, "Failed to power-off sensor\n");
+
+		/* clear the asd field to show this camera is not used */
+		isp->inputs[asd->input_curr].asd = NULL;
+	}
+
 	spin_lock_irqsave(&isp->lock, flags);
 	asd->streaming = ATOMISP_DEVICE_STREAMING_DISABLED;
 	spin_unlock_irqrestore(&isp->lock, flags);
-- 
2.39.0

