Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9EC23DA
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 12:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674478398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QPIEt4XoxUJhPGifff+vnGaEwfkXr7O5Vx+g3WMGvOM=;
	b=Ux/RUQgYhWYDKu6NNl45HKNzlL+ttFxKfUgBBTPiuZJkC7v+GyrKpa2SfPtr3Ur1tdQcDK
	nJTrgCKs4Glh1+HLsdGLclhl4wRtDnk3lno2Ynr8+O7fahPtbnQlIRu1z3j533lN4uWU3A
	+vssnL6iJ3nGbM5KGZC5UOMvZ/n2SgE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-DvZ5yzcGPyGnkvKM4MLlpw-1; Mon, 23 Jan 2023 07:53:15 -0500
X-MC-Unique: DvZ5yzcGPyGnkvKM4MLlpw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F0AF8828C2;
	Mon, 23 Jan 2023 12:53:14 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5C0D9C15BA0;
	Mon, 23 Jan 2023 12:53:12 +0000 (UTC)
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
Subject: [PATCH 23/57] media: atomisp: Fix WARN() when the vb2 start_streaming callback fails
Date: Mon, 23 Jan 2023 13:51:31 +0100
Message-Id: <20230123125205.622152-24-hdegoede@redhat.com>
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

The videobuf2-core expects buffers to be put back in the queued state
when the vb2 start_streaming callback fails. But the atomisp
atomisp_flush_video_pipe() would unconditionally return them to the core
in an error state.

This triggers the following warning in the videobuf2-core:

drivers/media/common/videobuf2/videobuf2-core.c:1652:
	/*
	 * If done_list is not empty, then start_streaming() didn't call
	 * vb2_buffer_done(vb, VB2_BUF_STATE_QUEUED) but STATE_ERROR or
	 * STATE_DONE.
	 */
	WARN_ON(!list_empty(&q->done_list));

Fix this by adding a state argument to atomisp_flush_video_pipe() and use
VB2_BUF_STATE_QUEUED as state when atomisp_start_streaming() fails.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 17 +++++++++--------
 drivers/staging/media/atomisp/pci/atomisp_cmd.h |  3 ++-
 .../staging/media/atomisp/pci/atomisp_ioctl.c   |  4 ++--
 3 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 01c9845b9f28..b9e7ad57040e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -679,7 +679,8 @@ void atomisp_buffer_done(struct ia_css_frame *frame, enum vb2_buffer_state state
 	vb2_buffer_done(&frame->vb.vb2_buf, state);
 }
 
-void atomisp_flush_video_pipe(struct atomisp_video_pipe *pipe, bool warn_on_css_frames)
+void atomisp_flush_video_pipe(struct atomisp_video_pipe *pipe, enum vb2_buffer_state state,
+			      bool warn_on_css_frames)
 {
 	struct ia_css_frame *frame, *_frame;
 	unsigned long irqflags;
@@ -689,15 +690,15 @@ void atomisp_flush_video_pipe(struct atomisp_video_pipe *pipe, bool warn_on_css_
 	list_for_each_entry_safe(frame, _frame, &pipe->buffers_in_css, queue) {
 		if (warn_on_css_frames)
 			dev_warn(pipe->isp->dev, "Warning: CSS frames queued on flush\n");
-		atomisp_buffer_done(frame, VB2_BUF_STATE_ERROR);
+		atomisp_buffer_done(frame, state);
 	}
 
 	list_for_each_entry_safe(frame, _frame, &pipe->activeq, queue)
-		atomisp_buffer_done(frame, VB2_BUF_STATE_ERROR);
+		atomisp_buffer_done(frame, state);
 
 	list_for_each_entry_safe(frame, _frame, &pipe->buffers_waiting_for_param, queue) {
 		pipe->frame_request_config_id[frame->vb.vb2_buf.index] = 0;
-		atomisp_buffer_done(frame, VB2_BUF_STATE_ERROR);
+		atomisp_buffer_done(frame, state);
 	}
 
 	spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
@@ -706,10 +707,10 @@ void atomisp_flush_video_pipe(struct atomisp_video_pipe *pipe, bool warn_on_css_
 /* Returns queued buffers back to video-core */
 void atomisp_flush_bufs_and_wakeup(struct atomisp_sub_device *asd)
 {
-	atomisp_flush_video_pipe(&asd->video_out_capture, false);
-	atomisp_flush_video_pipe(&asd->video_out_vf, false);
-	atomisp_flush_video_pipe(&asd->video_out_preview, false);
-	atomisp_flush_video_pipe(&asd->video_out_video_capture, false);
+	atomisp_flush_video_pipe(&asd->video_out_capture, VB2_BUF_STATE_ERROR, false);
+	atomisp_flush_video_pipe(&asd->video_out_vf, VB2_BUF_STATE_ERROR, false);
+	atomisp_flush_video_pipe(&asd->video_out_preview, VB2_BUF_STATE_ERROR, false);
+	atomisp_flush_video_pipe(&asd->video_out_video_capture, VB2_BUF_STATE_ERROR, false);
 }
 
 /* clean out the parameters that did not apply */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index a10577df10cb..733b9f8cd06f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -57,7 +57,8 @@ struct atomisp_video_pipe *atomisp_to_video_pipe(struct video_device *dev);
 int atomisp_reset(struct atomisp_device *isp);
 int atomisp_buffers_in_css(struct atomisp_video_pipe *pipe);
 void atomisp_buffer_done(struct ia_css_frame *frame, enum vb2_buffer_state state);
-void atomisp_flush_video_pipe(struct atomisp_video_pipe *pipe, bool warn_on_css_frames);
+void atomisp_flush_video_pipe(struct atomisp_video_pipe *pipe, enum vb2_buffer_state state,
+			      bool warn_on_css_frames);
 void atomisp_flush_bufs_and_wakeup(struct atomisp_sub_device *asd);
 void atomisp_clear_css_buffer_counters(struct atomisp_sub_device *asd);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 77856cbc5ba7..c15bb0b7458b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1339,7 +1339,7 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	ret = atomisp_css_start(asd, css_pipe_id, false);
 	if (ret) {
-		atomisp_flush_video_pipe(pipe, true);
+		atomisp_flush_video_pipe(pipe, VB2_BUF_STATE_QUEUED, true);
 		goto out_unlock;
 	}
 
@@ -1515,7 +1515,7 @@ void atomisp_stop_streaming(struct vb2_queue *vq)
 	css_pipe_id = atomisp_get_css_pipe_id(asd);
 	atomisp_css_stop(asd, css_pipe_id, false);
 
-	atomisp_flush_video_pipe(pipe, true);
+	atomisp_flush_video_pipe(pipe, VB2_BUF_STATE_ERROR, true);
 
 	atomisp_subdev_cleanup_pending_events(asd);
 stopsensor:
-- 
2.39.0

