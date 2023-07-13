Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D9B101CF
	for <linux-staging@lists.linux.dev>; Thu, 13 Jul 2023 10:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689242648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rOVJDTFrcAstOS0UfsxYlchXQfmdDZV7WwXYoUlB40Q=;
	b=Sjs3H44nTb6FCpHBTiOZ/5DkWfK/YurSS8H5tToL++Xd8PV+EKuXlk8ssVZjkq5et3SkHd
	glE5gUaWIvqdAUfd41NpkM9U/+2W8mMVj/6vxnIZYK8zO3q8kjHUGZobeBtQvsXK4fs9hq
	B09mPvtjona+XLDHLK0X6flebt3P1C0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-B3Q0_ON5MWSItB7fqeENUQ-1; Thu, 13 Jul 2023 06:04:03 -0400
X-MC-Unique: B3Q0_ON5MWSItB7fqeENUQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92BEB104458C;
	Thu, 13 Jul 2023 10:04:02 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.111])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 765CA1120ABB;
	Thu, 13 Jul 2023 10:03:58 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 07/11] media: atomisp: pipeline: Removed #if defined(ISP2401) to make driver generic
Date: Thu, 13 Jul 2023 18:02:27 +0800
Message-ID: <20230713100231.308923-8-hpa@redhat.com>
In-Reply-To: <20230713100231.308923-1-hpa@redhat.com>
References: <20230713100231.308923-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3

Removed #if defined(ISP2401) to make driver generic.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 .../atomisp/pci/runtime/pipeline/interface/ia_css_pipeline.h    | 2 --
 .../staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c   | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline.h b/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline.h
index 222c381ff3b9..5f5dab7252aa 100644
--- a/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline.h
+++ b/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline.h
@@ -241,7 +241,6 @@ bool ia_css_pipeline_uses_params(struct ia_css_pipeline *pipeline);
  */
 bool ia_css_pipeline_get_sp_thread_id(unsigned int key, unsigned int *val);
 
-#if defined(ISP2401)
 /**
  * @brief Get the pipeline io status
  *
@@ -250,7 +249,6 @@ bool ia_css_pipeline_get_sp_thread_id(unsigned int key, unsigned int *val);
  *	Pointer to pipe_io_status
  */
 struct sh_css_sp_pipeline_io_status *ia_css_pipeline_get_pipe_io_status(void);
-#endif
 
 /**
  * @brief Map an SP thread to this pipeline
diff --git a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
index e9e187649a65..3d8741e7d5ca 100644
--- a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
+++ b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
@@ -454,12 +454,10 @@ bool ia_css_pipeline_has_stopped(struct ia_css_pipeline *pipeline)
 	return sp_group.pipe[thread_id].num_stages == 0;
 }
 
-#if defined(ISP2401)
 struct sh_css_sp_pipeline_io_status *ia_css_pipeline_get_pipe_io_status(void)
 {
 	return(&sh_css_sp_group.pipe_io_status);
 }
-#endif
 
 bool ia_css_pipeline_is_mapped(unsigned int key)
 {
-- 
2.41.0

