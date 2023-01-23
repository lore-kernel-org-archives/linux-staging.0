Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9631C01
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 12:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674478349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZB/ISPaSIj9SIRxYCE7mVvFn8pcCnYATENe+7tfG6AU=;
	b=is4eqczKsLKHqG5XEZaOuP9TZNW48TxzyYcQuWpqckDcQvI5uP/SCoOesq3jYo4oans6kf
	CtwtpPTtm6S6HjlFEnKsT2GuYwBqcWLhNmjzua0cgMkWoRO5NlsvMMGlalrUvBaaw7m+u9
	kKmGkyzZ8JQwcAbaT5O3t+/MMh/E74U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-Ef0s4yufOy6eoN1_SZ7x1Q-1; Mon, 23 Jan 2023 07:52:16 -0500
X-MC-Unique: Ef0s4yufOy6eoN1_SZ7x1Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 148223C02533;
	Mon, 23 Jan 2023 12:52:16 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7AAEDC15BAD;
	Mon, 23 Jan 2023 12:52:13 +0000 (UTC)
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
	linux-staging@lists.linux.dev,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 02/57] media: atomisp: use vb2_start_streaming_called()
Date: Mon, 23 Jan 2023 13:51:10 +0100
Message-Id: <20230123125205.622152-3-hdegoede@redhat.com>
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

From: Hans Verkuil <hverkuil@xs4all.nl>

Don't touch q->start_streaming_called directly, use the
vb2_start_streaming_called() function instead.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Link: https://lore.kernel.org/r/bc6c24ec-72ea-64a1-9061-311cc7339827@xs4all.nl
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index cb01ba65c88f..4f35e8f8250a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -636,10 +636,10 @@ static int atomisp_enum_input(struct file *file, void *fh,
 static unsigned int
 atomisp_subdev_streaming_count(struct atomisp_sub_device *asd)
 {
-	return asd->video_out_preview.vb_queue.start_streaming_called
-	       + asd->video_out_capture.vb_queue.start_streaming_called
-	       + asd->video_out_video_capture.vb_queue.start_streaming_called
-	       + asd->video_out_vf.vb_queue.start_streaming_called;
+	return vb2_start_streaming_called(&asd->video_out_preview.vb_queue) +
+	       vb2_start_streaming_called(&asd->video_out_capture.vb_queue) +
+	       vb2_start_streaming_called(&asd->video_out_video_capture.vb_queue) +
+	       vb2_start_streaming_called(&asd->video_out_vf.vb_queue);
 }
 
 unsigned int atomisp_streaming_count(struct atomisp_device *isp)
-- 
2.39.0

