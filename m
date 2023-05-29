Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2963F3D99
	for <linux-staging@lists.linux.dev>; Mon, 29 May 2023 10:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685356722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z/Bd+GvKJqHkpo+bXUx4YJtorppITHEcs9Qdi9q35D8=;
	b=dOvmbK6EIgw1tUnjtYEYpmvu+b4toFeitznDTexBqFiru8pBuk88D9hXt2YoaBQ7aRKAoZ
	IkOlOdpeaa7l6YFQgePB8qaTyPOmY4xNERySW9dPbvTC4HqlTip1PlQzBZrsUEvfrRvY3j
	9mDrbFCH3vrfJMF28TNe2YfX1QmFRIo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-3-6EFketMxONH8ZN3dYhrA-1; Mon, 29 May 2023 06:38:38 -0400
X-MC-Unique: 3-6EFketMxONH8ZN3dYhrA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5503638184E0;
	Mon, 29 May 2023 10:38:38 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.96])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C4D342166B2B;
	Mon, 29 May 2023 10:38:36 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 10/21] media: atomisp: Add target validation to atomisp_subdev_set_selection()
Date: Mon, 29 May 2023 12:37:30 +0200
Message-Id: <20230529103741.11904-11-hdegoede@redhat.com>
In-Reply-To: <20230529103741.11904-1-hdegoede@redhat.com>
References: <20230529103741.11904-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6

As the 2 comments in the function already say both the sink and the source
pads only support setting the selection for 1 target:

		/* Only crop target supported on sink pad. */
		/* Only compose target is supported on source pads. */

Validate that the passed in target actually matches these expectations.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_subdev.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 7985a0319a39..04e257ede7d4 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -360,6 +360,10 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 	unsigned int padding_w = pad_w;
 	unsigned int padding_h = pad_h;
 
+	if ((pad == ATOMISP_SUBDEV_PAD_SINK && target != V4L2_SEL_TGT_CROP) ||
+	    (pad == ATOMISP_SUBDEV_PAD_SOURCE && target != V4L2_SEL_TGT_COMPOSE))
+		return -EINVAL;
+
 	isp_get_fmt_rect(sd, sd_state, which, ffmt, crop, comp);
 
 	dev_dbg(isp->dev,
-- 
2.40.1

