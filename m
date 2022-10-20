Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3A17E
	for <linux-staging@lists.linux.dev>; Thu, 20 Oct 2022 19:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666295748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ih1fLJDty9tJEpj13ee4LV7nQlVfKVmChokICFtDDZI=;
	b=G0tmBtpgKLSYLWa/8MjljtLKy+xEeizBce+hqCDKVx5d7ilQPE8/6u24h727CIr6DjOq/U
	V+iKHQoDIM9UOcEE2OsmTxVPfIxw8vBbyOZHTi/A8I5P5wjB0GeTgKRNTb+y6Tv56SnOrk
	xLXcUWBBi6oerZvgCF/L/yqlpoMDOqE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-231-kH1YFEUUOquxEQuSzVWgKg-1; Thu, 20 Oct 2022 15:55:46 -0400
X-MC-Unique: kH1YFEUUOquxEQuSzVWgKg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4215811E84;
	Thu, 20 Oct 2022 19:55:45 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.86])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4E31D40C6EC2;
	Thu, 20 Oct 2022 19:55:44 +0000 (UTC)
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
Subject: [PATCH v2 03/17] media: atomisp: Make atomisp_q_video_buffers_to_css() static
Date: Thu, 20 Oct 2022 21:55:19 +0200
Message-Id: <20221020195533.114049-4-hdegoede@redhat.com>
In-Reply-To: <20221020195533.114049-1-hdegoede@redhat.com>
References: <20221020195533.114049-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2

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

