Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A4D1C01
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 12:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674478370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fpqtaNJ3Bc2LW21VnCwO0dY309Wyq22tZQAKIWZMKeo=;
	b=NnZOS6TgZBIsImiSZSzXJEScl8Q0A6/OTljA2eSd2/al/aGSCXecw9ZeHKH/7IQGfyhdCB
	KxiLIyCqrGjpBGtMo7mJFb9wp5QyknS5ZZVbRxiOEe/YUrUBQZqBm/ph/gnUiJKVoILd68
	pehd688h1V+IRRoJJ6MI4/A6b8XaS/Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-547-H74jbILAMq2XkVJCZHpQgQ-1; Mon, 23 Jan 2023 07:52:45 -0500
X-MC-Unique: H74jbILAMq2XkVJCZHpQgQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D3643C025C3;
	Mon, 23 Jan 2023 12:52:44 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8D8A2C15BAD;
	Mon, 23 Jan 2023 12:52:42 +0000 (UTC)
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
Subject: [PATCH 12/57] media: atomisp: Propagate set_fmt() errors in queue_setup()
Date: Mon, 23 Jan 2023 13:51:20 +0100
Message-Id: <20230123125205.622152-13-hdegoede@redhat.com>
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

If set_fmt() fails make queue_setup() actually return the error instead of
returning 0.

This fixes the following oops on set_fmt() failures:

[ 1060.378662] ------------[ cut here ]------------
[ 1060.378805] WARNING: CPU: 0 PID: 2080 at drivers/media/common/videobuf2/videobuf2-core.c:840 vb2_core_reqbufs+0x3f7/0x430 [videobuf2_common]
...
[ 1060.381414] RIP: 0010:vb2_core_reqbufs+0x3f7/0x430 [videobuf2_common]
...
[ 1060.382066]  vb2_ioctl_reqbufs+0x9d/0xe0 [videobuf2_v4l2]
[ 1060.382181]  __video_do_ioctl+0x18e/0x3c0 [videodev]

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_fops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 4643bb0db995..682239ea042f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -80,7 +80,7 @@ static int atomisp_queue_setup(struct vb2_queue *vq,
 
 out:
 	mutex_unlock(&pipe->asd->isp->mutex);
-	return 0;
+	return ret;
 }
 
 static int atomisp_buf_init(struct vb2_buffer *vb)
-- 
2.39.0

