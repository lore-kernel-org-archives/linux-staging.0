Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4CF8BE5
	for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 10:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687171941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oJzbySpxHI1OX7uElkdSfOccFY/zZ/4OxZh0D81v/nY=;
	b=LE1VMKqYuin0KdoF9TEX5pHhM2IdQj6u61iuZcFU8I2isrB4wOz8y98PvpFnlooB/I+2MJ
	rR9iLms81iWGrjmPmwDZ2IgLLJEEwBaf4ft0XkaMOtQVECNyTCMvoq4HWXgW9ime0h/LXP
	DOVVW6oAJ1naJXACnyRVb70MNq63Eq4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-dlgHnvzMO4icVYUaibeujg-1; Mon, 19 Jun 2023 06:52:19 -0400
X-MC-Unique: dlgHnvzMO4icVYUaibeujg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 517BB185A78E;
	Mon, 19 Jun 2023 10:52:19 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B398D112132C;
	Mon, 19 Jun 2023 10:52:17 +0000 (UTC)
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
Subject: [PATCH 3/7] media: atomisp: Clamp width to max 1920 pixels when in ATOMISP_RUN_MODE_PREVIEW
Date: Mon, 19 Jun 2023 12:52:08 +0200
Message-Id: <20230619105212.303653-3-hdegoede@redhat.com>
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

The pipeline firmware-binaries used in previed mode have
ia_css_binary_xinfo.output.max_width set to 1920.

This causes ia_css_binary_find() to fail when trying to set a higher
resolution resulting in the dump_stack() call in ia_css_binary_find()
triggering and resulting in the try_fmt() or set_fmt() IOCTL failing.

Fix this by clamping the width to max 1920 when in preview mode.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index cbbf6f728f57..64456aedbf00 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3808,6 +3808,10 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 			return -EINVAL;
 	}
 
+	/* The preview pipeline does not support width > 1920 */
+	if (asd->run_mode->val == ATOMISP_RUN_MODE_PREVIEW)
+		f->width = min_t(u32, f->width, 1920);
+
 	/*
 	 * atomisp_set_fmt() will set the sensor resolution to the requested
 	 * resolution + padding. Add padding here and remove it again after
-- 
2.40.1

