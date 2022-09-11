Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FEE7F
	for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 17:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662916625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VkVzUPZeLYVbRuHXy+FUce2DnuAZCG9GJqs3yy61WU0=;
	b=Ea3lnSKyuLxi3fVg0pVjiZXP+o6bwbrkF/K6H7LtXXxNPpZONQmV65fr6a7YmuCLPeGk7O
	u/tYFhzefCzx/grucqpBZ14DpnG2LHwH7aYZdu165hn320gEV/vjCrvYgequRaoyf88dYG
	fFHWhzl3OQIJCIkGgea9NkWc9ChBKUY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-xptvEMAcMSSk1TK88Z4ydA-1; Sun, 11 Sep 2022 13:17:01 -0400
X-MC-Unique: xptvEMAcMSSk1TK88Z4ydA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1EF7A3C025B6;
	Sun, 11 Sep 2022 17:17:01 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.10])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9C298492C3B;
	Sun, 11 Sep 2022 17:16:59 +0000 (UTC)
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
Subject: [PATCH 02/17] media: atomisp: Remove unused lock member from struct atomisp_sub_device
Date: Sun, 11 Sep 2022 19:16:38 +0200
Message-Id: <20220911171653.568932-3-hdegoede@redhat.com>
In-Reply-To: <20220911171653.568932-1-hdegoede@redhat.com>
References: <20220911171653.568932-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10

The spin-lock embedded in struct atomisp_sub_device is not used anywhere,
remove it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_subdev.c | 1 -
 drivers/staging/media/atomisp/pci/atomisp_subdev.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 047e2e9d63d7..4a4367701509 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -1356,7 +1356,6 @@ int atomisp_subdev_init(struct atomisp_device *isp)
 		return -ENOMEM;
 	for (i = 0; i < isp->num_of_streams; i++) {
 		asd = &isp->asd[i];
-		spin_lock_init(&asd->lock);
 		asd->isp = isp;
 		isp_subdev_init_params(asd);
 		asd->index = i;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index d8b2dd00a792..eaf767880407 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -272,7 +272,6 @@ struct atomisp_sub_device {
 	/* video pipe main output */
 	struct atomisp_video_pipe video_out_video_capture;
 	/* struct isp_subdev_params params; */
-	spinlock_t lock;
 	struct atomisp_device *isp;
 	struct v4l2_ctrl_handler ctrl_handler;
 	struct v4l2_ctrl *fmt_auto;
-- 
2.37.3

