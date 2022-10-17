Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F0B10F9
	for <linux-staging@lists.linux.dev>; Mon, 17 Oct 2022 08:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665996676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ih1fLJDty9tJEpj13ee4LV7nQlVfKVmChokICFtDDZI=;
	b=Hb+Vf3vcr20e/4SdJCKNWYuFI70scrl79PIrTLrPl3ivUNksqoi1MBrDyP3JLI58F1y5au
	lqLT6C6dmQ8U/2SOs21pTV3qK5ithlkmuoeHcwo/ZbJy99zrEJ/kUUWBxjC6We/rDhVwN5
	nOf1UvoJNxKArb/JgbujbOzzQkMIHWE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-yBYYeqFXNf6R8JbfO0YQVQ-1; Mon, 17 Oct 2022 04:51:10 -0400
X-MC-Unique: yBYYeqFXNf6R8JbfO0YQVQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C100A811E67;
	Mon, 17 Oct 2022 08:51:09 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7543810A58CE;
	Mon, 17 Oct 2022 08:51:07 +0000 (UTC)
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
Subject: [PATCH 03/17] media: atomisp: Make atomisp_q_video_buffers_to_css() static
Date: Mon, 17 Oct 2022 10:50:43 +0200
Message-Id: <20221017085057.7483-4-hdegoede@redhat.com>
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

atomisp_q_video_buffers_to_css() is only used insidd atomisp_fops.c, make
it static.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_fops.c | 10 +++++-----
 drivers/staging/media/atomisp/pci/atomisp_fops.h |  6 ------
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 84a84e0cdeef..d47b7f19125f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -206,11 +206,11 @@ static int atomisp_q_one_dis_buffer(struct atomisp_sub_device *asd,
 	return 0;
 }
 
-int atomisp_q_video_buffers_to_css(struct atomisp_sub_device *asd,
-				   struct atomisp_video_pipe *pipe,
-				   enum atomisp_input_stream_id stream_id,
-				   enum ia_css_buffer_type css_buf_type,
-				   enum ia_css_pipe_id css_pipe_id)
+static int atomisp_q_video_buffers_to_css(struct atomisp_sub_device *asd,
+					  struct atomisp_video_pipe *pipe,
+					  enum atomisp_input_stream_id stream_id,
+					  enum ia_css_buffer_type css_buf_type,
+					  enum ia_css_pipe_id css_pipe_id)
 {
 	struct videobuf_vmalloc_memory *vm_mem;
 	struct atomisp_css_params_with_list *param;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.h b/drivers/staging/media/atomisp/pci/atomisp_fops.h
index 3f1e442ba782..8d3ea33a7d9a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.h
@@ -22,12 +22,6 @@
 #define	__ATOMISP_FOPS_H__
 #include "atomisp_subdev.h"
 
-int atomisp_q_video_buffers_to_css(struct atomisp_sub_device *asd,
-				   struct atomisp_video_pipe *pipe,
-				   enum atomisp_input_stream_id stream_id,
-				   enum ia_css_buffer_type css_buf_type,
-				   enum ia_css_pipe_id css_pipe_id);
-
 unsigned int atomisp_dev_users(struct atomisp_device *isp);
 unsigned int atomisp_sub_dev_users(struct atomisp_sub_device *asd);
 
-- 
2.37.3

