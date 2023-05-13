Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12BF4C67
	for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 12:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683981174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xIgIUtVOUKj4gzOmyTofQHkveS/36aXeXqsulYFcutU=;
	b=IcMKeUQ/79gPobYVT5HobyBD4mtAXeohtiPeL2KyWJZMnaCh+t02ABN4VRdoIfJdmZM9Ut
	zocZrAxkrUyR8TGn8bCt1hfJq1UDdxQCRbccxGGiA8w43qXWPyI4DE09J1MhRU36fD7B+W
	PgaskVTPuVj4zDF//uHDNRonuwyy7ws=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-4uSMFXyTN5Wl7oNR9Sj4eA-1; Sat, 13 May 2023 08:32:52 -0400
X-MC-Unique: 4uSMFXyTN5Wl7oNR9Sj4eA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BAB9F380670C;
	Sat, 13 May 2023 12:32:51 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 36DFF40C2076;
	Sat, 13 May 2023 12:32:50 +0000 (UTC)
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
Subject: [PATCH 28/30] media: atomisp: Remove unused atomisp_get_css_pipe_id() function
Date: Sat, 13 May 2023 14:31:57 +0200
Message-Id: <20230513123159.33234-29-hdegoede@redhat.com>
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

Remove no longer user atomisp_get_css_pipe_id() function.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 28 -------------------
 .../staging/media/atomisp/pci/atomisp_ioctl.h |  3 --
 2 files changed, 31 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 6bae107682c1..1deeb7c28379 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1068,34 +1068,6 @@ static int atomisp_dqbuf_wrapper(struct file *file, void *fh, struct v4l2_buffer
 	return 0;
 }
 
-enum ia_css_pipe_id atomisp_get_css_pipe_id(struct atomisp_sub_device *asd)
-{
-	/*
-	 * Disable vf_pp and run CSS in video mode. This allows using ISP
-	 * scaling but it has one frame delay due to CSS internal buffering.
-	 */
-	if (asd->vfpp->val == ATOMISP_VFPP_DISABLE_SCALER)
-		return IA_CSS_PIPE_ID_VIDEO;
-
-	/*
-	 * Disable vf_pp and run CSS in still capture mode. In this mode
-	 * CSS does not cause extra latency with buffering, but scaling
-	 * is not available.
-	 */
-	if (asd->vfpp->val == ATOMISP_VFPP_DISABLE_LOWLAT)
-		return IA_CSS_PIPE_ID_CAPTURE;
-
-	switch (asd->run_mode->val) {
-	case ATOMISP_RUN_MODE_PREVIEW:
-		return IA_CSS_PIPE_ID_PREVIEW;
-	case ATOMISP_RUN_MODE_VIDEO:
-		return IA_CSS_PIPE_ID_VIDEO;
-	case ATOMISP_RUN_MODE_STILL_CAPTURE:
-	default:
-		return IA_CSS_PIPE_ID_CAPTURE;
-	}
-}
-
 /* Input system HW workaround */
 /* Input system address translation corrupts burst during */
 /* invalidate. SW workaround for this is to set burst length */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
index 997fa61589ab..56d3df86c706 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
@@ -42,9 +42,6 @@ int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
 int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count);
 void atomisp_stop_streaming(struct vb2_queue *vq);
 
-enum ia_css_pipe_id atomisp_get_css_pipe_id(struct atomisp_sub_device
-	*asd);
-
 extern const struct v4l2_ioctl_ops atomisp_ioctl_ops;
 
 /* compat_ioctl for 32bit userland app and 64bit kernel */
-- 
2.40.1

