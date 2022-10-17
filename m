Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD7810F7
	for <linux-staging@lists.linux.dev>; Mon, 17 Oct 2022 08:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665996745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sa4Ekpf0YYB4bhI1FofxXSt5C9f6cErnVvnkzS1DIkw=;
	b=jBi1wT9MkV8tnz0S4iHB3dyv1z4TlfQ3IHR1TzKgkP683iQJNxd8ksuAQHaL3f5hFRWT7Z
	INxjdtAEfmHpdYKBGphJtOqjRwefCW8FtD6FV/BdxqouBteZ7uZrfersSZYHNqbb5RuFtV
	yN4VkObb4x6kfaBRMDJKacOvUQqQ7KA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-SRrilQx_OBKSchcIK1qcJg-1; Mon, 17 Oct 2022 04:52:21 -0400
X-MC-Unique: SRrilQx_OBKSchcIK1qcJg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A1333C01DEF;
	Mon, 17 Oct 2022 08:52:01 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 226E210A58D5;
	Mon, 17 Oct 2022 08:51:47 +0000 (UTC)
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
Subject: [PATCH 15/17] media: atomisp: Make atomisp_g_fmt_cap() default to YUV420
Date: Mon, 17 Oct 2022 10:50:55 +0200
Message-Id: <20221017085057.7483-16-hdegoede@redhat.com>
In-Reply-To: <20221017085057.7483-1-hdegoede@redhat.com>
References: <20221017085057.7483-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3

Make atomisp_g_fmt_cap() default to YUV420 so that it matches with what
atomisp_try_fmt_cap() and atomisp_queue_setup() do when they need to
pick a default pixelformat.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 149f7ebafb36..b8ec2b83a048 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -959,7 +959,7 @@ static int atomisp_g_fmt_cap(struct file *file, void *fh,
 	if (f->fmt.pix.sizeimage)
 		return 0;
 
-	f->fmt.pix.pixelformat = V4L2_PIX_FMT_YUYV;
+	f->fmt.pix.pixelformat = V4L2_PIX_FMT_YUV420;
 	f->fmt.pix.width = 10000;
 	f->fmt.pix.height = 10000;
 
-- 
2.37.3

