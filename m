Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080F11C01
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 12:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674478376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eJveKrkYDrKereox+XfsOm3RlJxwF6382gp5GwfBtxo=;
	b=bNynN3S4P2qy8IaLuZpFLyXdQyvBKJJS6XfmyBYywOPEjvU5IfzvAYfQGo88cUL8kAPawj
	EFAINSiRI6TEahH/FhfA7NltkuDBj0qbKtFPPr4T9j3xNzEYC7P7HM9pqBhblc2XLtO8r3
	MqVs0391RoMrkyw8yMFf6+yo0iSmUxw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-e4Jo5s5COL23bias47BpKw-1; Mon, 23 Jan 2023 07:52:50 -0500
X-MC-Unique: e4Jo5s5COL23bias47BpKw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A40018A6465;
	Mon, 23 Jan 2023 12:52:50 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E20CFC15BA0;
	Mon, 23 Jan 2023 12:52:47 +0000 (UTC)
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
Subject: [PATCH 14/57] media: atomisp: Check buffer index is in range inside atomisp_qbuf_wrapper()
Date: Mon, 23 Jan 2023 13:51:22 +0100
Message-Id: <20230123125205.622152-15-hdegoede@redhat.com>
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

Check buffer index is in range inside atomisp_qbuf_wrapper() before
using it do index pipe->frame_request_config_id[].

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 9cb9685d91bb..d0dd3dbd6f6a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1056,6 +1056,9 @@ static int atomisp_qbuf_wrapper(struct file *file, void *fh, struct v4l2_buffer
 	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
 
 	/* FIXME this abuse of buf->reserved2 comes from the original atomisp buffer handling */
+	if (buf->index >= vdev->queue->num_buffers)
+		return -EINVAL;
+
 	if (!atomisp_is_vf_pipe(pipe) &&
 	    (buf->reserved2 & ATOMISP_BUFFER_HAS_PER_FRAME_SETTING)) {
 		/* this buffer will have a per-frame parameter */
-- 
2.39.0

