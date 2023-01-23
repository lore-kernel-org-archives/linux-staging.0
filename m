Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0C52F2E
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 12:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674478471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OkAz12P7sXr4vhz81bkMIj+6/IOJGx/2R607w3VDgcg=;
	b=VS9jWynUdbfF4Hkb2KtzSlNG4P+oTI0H5ophL5ZIIgjgy3vUguTUzdH7q8qf7DwY1RlAqf
	eiS7pOkX2XkczHvUZ+nMkPIbPWpxY/ms6hRn/5ArrjpB4bEFduTNEoN1nZcAqxyQ1jBJ1I
	HrjdXB43YaNQ+v1cwqTiBSj+ZA6qOUg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483--KunIgOlPtijik6fxupV5A-1; Mon, 23 Jan 2023 07:54:25 -0500
X-MC-Unique: -KunIgOlPtijik6fxupV5A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E11893C0F223;
	Mon, 23 Jan 2023 12:54:24 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9804DC15BAD;
	Mon, 23 Jan 2023 12:54:22 +0000 (UTC)
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
Subject: [PATCH 45/57] media: atomisp: ov2680: Cleanup includes
Date: Mon, 23 Jan 2023 13:51:53 +0100
Message-Id: <20230123125205.622152-46-hdegoede@redhat.com>
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

Remove unused includes and sort the remaining ones alphabetically.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-ov2680.c        | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 994b6fe40069..1dc821ca4e68 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -15,27 +15,14 @@
  *
  */
 
-#include <asm/unaligned.h>
-
-#include <linux/module.h>
-#include <linux/types.h>
-#include <linux/kernel.h>
-#include <linux/mm.h>
-#include <linux/string.h>
-#include <linux/errno.h>
-#include <linux/init.h>
-#include <linux/kmod.h>
+#include <linux/acpi.h>
 #include <linux/device.h>
-#include <linux/delay.h>
-#include <linux/slab.h>
 #include <linux/i2c.h>
-#include <linux/moduleparam.h>
+#include <linux/module.h>
+#include <linux/types.h>
 #include <media/ovxxxx_16bit_addr_reg_helpers.h>
 #include <media/v4l2-device.h>
-#include <linux/io.h>
-#include <linux/acpi.h>
 #include "../include/linux/atomisp_gmin_platform.h"
-
 #include "ov2680.h"
 
 static enum atomisp_bayer_order ov2680_bayer_order_mapping[] = {
-- 
2.39.0

