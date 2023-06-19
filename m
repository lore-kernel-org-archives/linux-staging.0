Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299F7AD26
	for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 10:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687171952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rocdS1G7kg2dzftmRc7177VXemHXk6WwFOcw3sbeAgo=;
	b=cCaowl32il8UAQ7Cz27c9W/sPzzY3VuN1iQ/4INYZ0msg79pitM8HXYbg0xPmMYpMEl7Cw
	thozGEkqW4M+doiTyjzR4zsXqq+qB1Tf2ASKA0ZA9flxueSrLwIHWcBRK7zAudDQ78lThH
	UfngghSum/8iVdeM8GJhawmjhpIDFD4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-Mck3YCOEPlGymSYRi3FGJA-1; Mon, 19 Jun 2023 06:52:27 -0400
X-MC-Unique: Mck3YCOEPlGymSYRi3FGJA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3F36380671B;
	Mon, 19 Jun 2023 10:52:26 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3D453112132C;
	Mon, 19 Jun 2023 10:52:25 +0000 (UTC)
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
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 7/7] media: atomisp: Remove v4l2_ctrl_s_ctrl(asd->run_mode) calls from atomisp_open()
Date: Mon, 19 Jun 2023 12:52:12 +0200
Message-Id: <20230619105212.303653-7-hdegoede@redhat.com>
In-Reply-To: <20230619105212.303653-1-hdegoede@redhat.com>
References: <20230619105212.303653-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3

The v4l2_ctrl_s_ctrl(asd->run_mode) call in atomisp_subdev_init_struct()
gets immediately overridden by a second call directly after
atomisp_subdev_init_struct() is called.

And the second call in atomisp_open() also is not helpful.
ATOMISP_RUN_MODE_PREVIEW is the default and if changed controls
are supposed to stay changed over an open/close of the /dev/video#
node. So drop both calls.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_fops.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index a09087dccbcb..4dba6120af39 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -460,7 +460,6 @@ static void atomisp_dev_init_struct(struct atomisp_device *isp)
 
 static void atomisp_subdev_init_struct(struct atomisp_sub_device *asd)
 {
-	v4l2_ctrl_s_ctrl(asd->run_mode, ATOMISP_RUN_MODE_STILL_CAPTURE);
 	memset(&asd->params.css_param, 0, sizeof(asd->params.css_param));
 	asd->params.color_effect = V4L2_COLORFX_NONE;
 	asd->params.bad_pixel_en = true;
@@ -533,8 +532,6 @@ static int atomisp_open(struct file *file)
 	}
 
 	atomisp_subdev_init_struct(asd);
-	/* Ensure that a mode is set */
-	v4l2_ctrl_s_ctrl(asd->run_mode, ATOMISP_RUN_MODE_PREVIEW);
 
 	pipe->users++;
 	mutex_unlock(&isp->mutex);
-- 
2.40.1

