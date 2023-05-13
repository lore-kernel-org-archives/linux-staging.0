Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579C54C6A
	for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 12:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683981172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=anGzYC1DEhyiHrDoAn21j4plLcVJ8KGFmYUFh/69x+0=;
	b=Cpn9gGpBH+oemrb+eOHTgTlWhK9PLPDILfEI9ao6ZA3p8G1cqq8D83f+mWry4cWxosK2Hb
	4BxjrI2rkVWLgnF4g8tJzKZ+KVbzaNxCajt9CfccCjikurL19CeHRu97MK7wetM2stf5WL
	3y1O3dvI92MeOaLvN5Z0YNQOOeM+rjg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-vfeAA_M9PCKC6jWcMA7oFQ-1; Sat, 13 May 2023 08:32:48 -0400
X-MC-Unique: vfeAA_M9PCKC6jWcMA7oFQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39C20185A790;
	Sat, 13 May 2023 12:32:48 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A925040C2076;
	Sat, 13 May 2023 12:32:46 +0000 (UTC)
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
Subject: [PATCH 26/30] media: atomisp: Remove atomisp_[sub]dev_users()
Date: Sat, 13 May 2023 14:31:55 +0200
Message-Id: <20230513123159.33234-27-hdegoede@redhat.com>
In-Reply-To: <20230513123159.33234-1-hdegoede@redhat.com>
References: <20230513123159.33234-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1

The atomisp_[sub]dev_users() functions are not used anymore,
remove them.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_fops.c | 10 ----------
 drivers/staging/media/atomisp/pci/atomisp_fops.h |  3 ---
 2 files changed, 13 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 223c5be072cc..179c23ea7700 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -489,16 +489,6 @@ static void atomisp_subdev_init_struct(struct atomisp_sub_device *asd)
 /*
  * file operation functions
  */
-static unsigned int atomisp_subdev_users(struct atomisp_sub_device *asd)
-{
-	return asd->video_out.users;
-}
-
-unsigned int atomisp_dev_users(struct atomisp_device *isp)
-{
-	return atomisp_subdev_users(&isp->asd);
-}
-
 static int atomisp_open(struct file *file)
 {
 	struct video_device *vdev = video_devdata(file);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.h b/drivers/staging/media/atomisp/pci/atomisp_fops.h
index 883c1851c1c9..ad1cb1ac8aa4 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.h
@@ -22,9 +22,6 @@
 #define	__ATOMISP_FOPS_H__
 #include "atomisp_subdev.h"
 
-unsigned int atomisp_dev_users(struct atomisp_device *isp);
-unsigned int atomisp_sub_dev_users(struct atomisp_sub_device *asd);
-
 /*
  * Memory help functions for image frame and private parameters
  */
-- 
2.40.1

