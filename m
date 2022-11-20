Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC594433
	for <linux-staging@lists.linux.dev>; Sun, 20 Nov 2022 22:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668984081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a0JhFnnAyhPjoYGSxTnE/wxzuXOwUqMRKNSKNCL27iA=;
	b=HgI0qLJUgi0QXCM811gcRaYBE2vKkIFSTHi2EJJaqfedT4LCZyPtw+SZ22StWzOiltmumJ
	t7InFPOjgmVKx5vsjDoCL9bK20iuNSpJqnLt+etO027kmQWlA0ngnqJjKZgbx+DslKV6t4
	APZ9+0wXpRMMGV/4KcD93j8loB7Z3CQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-o0FXxEALMomtkIn6xjxqEw-1; Sun, 20 Nov 2022 17:41:18 -0500
X-MC-Unique: o0FXxEALMomtkIn6xjxqEw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A90E811E67;
	Sun, 20 Nov 2022 22:41:17 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.70])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DF42A47505E;
	Sun, 20 Nov 2022 22:41:15 +0000 (UTC)
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
Subject: [PATCH 04/20] media: atomisp: Flush queue on atomisp_css_start() error
Date: Sun, 20 Nov 2022 23:40:45 +0100
Message-Id: <20221120224101.746199-5-hdegoede@redhat.com>
In-Reply-To: <20221120224101.746199-1-hdegoede@redhat.com>
References: <20221120224101.746199-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9

I managed to trigger an atomisp_css_start() error by pushing my test system
towards an OOM situation, this triggered the following WARN_ON() in
__vb2_queue_cancel() in videobuf2-core.c:

        /*
         * If you see this warning, then the driver isn't cleaning up properly
         * after a failed start_streaming(). See the start_streaming()
         * documentation in videobuf2-core.h for more information how buffers
         * should be returned to vb2 in start_streaming().
         */
        if (WARN_ON(atomic_read(&q->owned_by_drv_count))) {

Fix this by calling atomisp_flush_video_pipe() to return any queued buffers
back to the videobuf2-core on an atomisp_css_start() error.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 83710af7690f..43e899457b91 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1353,8 +1353,10 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 	asd->params.dvs_6axis = NULL;
 
 	ret = atomisp_css_start(asd, css_pipe_id, false);
-	if (ret)
+	if (ret) {
+		atomisp_flush_video_pipe(pipe, true);
 		goto out_unlock;
+	}
 
 	spin_lock_irqsave(&isp->lock, irqflags);
 	asd->streaming = ATOMISP_DEVICE_STREAMING_ENABLED;
-- 
2.38.1

