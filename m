Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051E3D535
	for <linux-staging@lists.linux.dev>; Sun, 30 Jul 2023 15:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690731232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UwGbEbUvdNxTFWaVM2fPNOI2OVAY9HbN99EWxlqWR54=;
	b=Ul64Ccn48UX3aukJpetJIkE8Sp3pskAsYKBX7RBgE2IGqgghIG1lw0XtPDvsuB4cdyziwJ
	A+ooFRIH9XER+9mNGfCIZD4pJrJ28kGB36+AZtvRlwOt64pmsVsATT05wcgTE6Pb4NdGjA
	nTtB9uaHF9QjjeMlwhxTps9mkHXwAxo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-_1crPeA9Mjmjhd6BxsHj6Q-1; Sun, 30 Jul 2023 11:33:48 -0400
X-MC-Unique: _1crPeA9Mjmjhd6BxsHj6Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A582800159;
	Sun, 30 Jul 2023 15:33:48 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ABDDBC57964;
	Sun, 30 Jul 2023 15:33:46 +0000 (UTC)
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
	linux-staging@lists.linux.dev,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH v2 2/2] media: atomisp: Fix me->stages error checking in sh_css_sp_init_pipeline()
Date: Sun, 30 Jul 2023 17:33:43 +0200
Message-ID: <20230730153343.22033-2-hdegoede@redhat.com>
In-Reply-To: <20230730153343.22033-1-hdegoede@redhat.com>
References: <20230730153343.22033-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8

The current error-checking of me->stages in sh_css_sp_init_pipeline()
has some issues / weirdness:

1. It is checked at the top of the function, but only using the atomisp
   custom assert() macro which e.g. smatch does not recognize

2. It is first dereferenced in "first_binary = me->stages->binary", but
   outside of the assert it is checked much later, triggering the following
   smatch warning:

drivers/staging/media/atomisp/pci/sh_css_sp.c:1255 sh_css_sp_init_pipeline()
warn: variable dereferenced before check 'me->stages' (see line 1224)

Drop the custom assert() calls (note 'me' is never NULL) and instead add
a regular check for me->stages not being set.

Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
Closes: https://lore.kernel.org/linux-media/7c8fc5b4-280e-844e-cdf5-b6ec2a1616aa@xs4all.nl/
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/sh_css_sp.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 4ef1c9e61ea8..eba70d4800a1 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -51,6 +51,7 @@
 #include "ia_css_event.h"
 #include "mmu_device.h"
 #include "ia_css_spctrl.h"
+#include "atomisp_internal.h"
 
 #ifndef offsetof
 #define offsetof(T, x) ((unsigned int)&(((T *)0)->x))
@@ -1210,14 +1211,15 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 	struct ia_css_binary	     *first_binary = NULL;
 	struct ia_css_pipe *pipe = NULL;
 	unsigned int num;
-
 	enum ia_css_pipe_id pipe_id = id;
 	unsigned int thread_id;
 	u8 if_config_index, tmp_if_config_index;
 
-	assert(me);
-
-	assert(me->stages);
+	if (!me->stages) {
+		dev_err(atomisp_dev, "%s called on a pipeline without stages\n",
+			__func__);
+		return; /* FIXME should be able to return an error */
+	}
 
 	first_binary = me->stages->binary;
 
@@ -1250,8 +1252,8 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 	} /* if (first_binary != NULL) */
 
 	/* Signal the host immediately after start for SP_ISYS_COPY only */
-	if ((me->num_stages == 1) && me->stages &&
-	    (me->stages->sp_func == IA_CSS_PIPELINE_ISYS_COPY))
+	if (me->num_stages == 1 &&
+	    me->stages->sp_func == IA_CSS_PIPELINE_ISYS_COPY)
 		sh_css_sp_group.config.no_isp_sync = true;
 
 	/* Init stage data */
-- 
2.41.0

