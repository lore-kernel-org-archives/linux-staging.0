Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE74ECF
	for <linux-staging@lists.linux.dev>; Thu,  1 Sep 2022 09:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662025637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BBZNQN20GJ5gJTsV+zOCii6EVt4/u4E3xjRjECI9efQ=;
	b=XQzs47dY2Y5Z9ukNu3LcFjsse/LG1+8ZKYQArUlcEP3WnKlVQv9pRHkCTOLvhlubZZckVf
	J7krD2YANKMkB7RcmJ232YacMIcc3wMaJZZEan8H7JZYsXS6Vub/ArVIo7UG7mvQxqRJ2t
	IZJBDfISF7lVSqP04N2Zf72wAE8PN88=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-r6uzPst8N5qj6zp0u4cMMQ-1; Thu, 01 Sep 2022 05:47:14 -0400
X-MC-Unique: r6uzPst8N5qj6zp0u4cMMQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E6452803BC9;
	Thu,  1 Sep 2022 09:47:02 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.90])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CF896403344;
	Thu,  1 Sep 2022 09:47:00 +0000 (UTC)
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
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 14/14] media: atomisp: prevent integer overflow in sh_css_set_black_frame()
Date: Thu,  1 Sep 2022 11:46:26 +0200
Message-Id: <20220901094626.11513-15-hdegoede@redhat.com>
In-Reply-To: <20220901094626.11513-1-hdegoede@redhat.com>
References: <20220901094626.11513-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10

From: Dan Carpenter <dan.carpenter@oracle.com>

The "height" and "width" values come from the user so the "height * width"
multiplication can overflow.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Link: https://lore.kernel.org/r/YxBBCRnm3mmvaiuR@kili
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/sh_css_params.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 0e7c38b2bfe3..67915d76a87f 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -950,8 +950,8 @@ sh_css_set_black_frame(struct ia_css_stream *stream,
 		params->fpn_config.data = NULL;
 	}
 	if (!params->fpn_config.data) {
-		params->fpn_config.data = kvmalloc(height * width *
-						   sizeof(short), GFP_KERNEL);
+		params->fpn_config.data = kvmalloc(array3_size(height, width, sizeof(short)),
+						   GFP_KERNEL);
 		if (!params->fpn_config.data) {
 			IA_CSS_ERROR("out of memory");
 			IA_CSS_LEAVE_ERR_PRIVATE(-ENOMEM);
-- 
2.37.2

