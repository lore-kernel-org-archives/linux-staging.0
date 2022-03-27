Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91F617C0
	for <linux-staging@lists.linux.dev>; Sun, 27 Mar 2022 08:58:38 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id f3so8774032pfe.2
        for <linux-staging@lists.linux.dev>; Sun, 27 Mar 2022 01:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=7xvsh8FIV4X8qjBnU3ZR0V0Ttcm32tPDVRGj1HnLnug=;
        b=hXNdbJix4pJNIu2Zw42LECnSqu0TzyHbbcrJVKJZzn2sHuyavQZAd3cXnA00U+UeGu
         8cAgWYrQQda4AS1Cgmk/l1RzymnM4xhUv1nBxDK/55+xOYrquUXTY14E8jpgPIJyaY8l
         eHX8cvOvuRYXHwUTNMEYc8aTv5sPrIprkoKn7z8Nlyd5p5SwATk0GKOX6/ovt/aHDPOj
         RsH7T/N82Fly7SiP92iAFmcRt4+StxLYkg/DAYtphvqcv27J1/yYfFEUWpo1xn567qvf
         ER7UZ6PELw/ESZS08qkgsbt+WlKnvpjNS2p8Zh7ZCFI+QpNKotlXVAC1yqMu03FQssui
         ArWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=7xvsh8FIV4X8qjBnU3ZR0V0Ttcm32tPDVRGj1HnLnug=;
        b=6nFcN5rOiTPKTOBEgMjXbl/b+xV/FvuDHZUWk1UDolKe/z/w/hFxgrEXwO86sSC32q
         E3/uh3pW+rs+S1TEL4vpAdJ1Vqf6971NzD6/W2i9V0PM0sOVvmOkYkdcPGXqeVmLlkm3
         EYi7dj9hNkguLOIM+ptVMf98BzlzXnerIe/H+S/rw0OJmhlrW0Rk0/alWuGaf5ZSUuza
         tC+tT+77yY0s6Fa659HOP81QMoopOwfc75ySCmZn5XPq1Vu9cyPXOwKCgslsUbQcAifM
         leU1Yx16CJ+EG8PADYVMk3goIJpv1QU8GYd0Mq2GvCv7HmSCHZB97e4ST007zORc+YwN
         d3Pg==
X-Gm-Message-State: AOAM532JSQuvKQ5DF+UBbk6R3YHdb6LzgsNjcDV9lNnJqULBjs+6RVoy
	8URqqpWzlvzxDFms2KG9XGQ=
X-Google-Smtp-Source: ABdhPJwJbpivqpvlQVVZaanGQJI7qe/8a0VaU1hK1gJAWjlZGbY/NQWcPqZk9scKr+0fN97YM0BV9A==
X-Received: by 2002:a65:5a0d:0:b0:381:3c1e:9aca with SMTP id y13-20020a655a0d000000b003813c1e9acamr6080914pgs.562.1648371518258;
        Sun, 27 Mar 2022 01:58:38 -0700 (PDT)
Received: from localhost ([115.220.243.108])
        by smtp.gmail.com with ESMTPSA id u41-20020a056a0009a900b004fa831fb240sm12129339pfg.6.2022.03.27.01.58.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 27 Mar 2022 01:58:37 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	kitakar@gmail.com,
	alinesantanacordeiro@gmail.com,
	laurent.pinchart@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaomeng Tong <xiam0nd.tong@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] pci: atomisp_cmd: fix three missing checks on list iterator
Date: Sun, 27 Mar 2022 16:58:31 +0800
Message-Id: <20220327085831.14462-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The three bugs are here:
	__func__, s3a_buf->s3a_data->exp_id);
	__func__, md_buf->metadata->exp_id);
	__func__, dis_buf->dis_data->exp_id);

The list iterator 's3a_buf/md_buf/dis_buf' will point to a bogus
position containing HEAD if the list is empty or no element is found.
This case must be checked before any use of the iterator, otherwise
it will lead to a invalid memory access.

To fix this bug, add an check. Use a new variable '*_iter' as the
list iterator, while use the old variable '*_buf' as a dedicated
pointer to point to the found element.

Cc: stable@vger.kernel.org
Fixes: ad85094b293e4 ("Revert "media: staging: atomisp: Remove driver"")
Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 57 ++++++++++++-------
 1 file changed, 36 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 97d5a528969b..0da0b69a4637 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -901,9 +901,9 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 	int err;
 	unsigned long irqflags;
 	struct ia_css_frame *frame = NULL;
-	struct atomisp_s3a_buf *s3a_buf = NULL, *_s3a_buf_tmp;
-	struct atomisp_dis_buf *dis_buf = NULL, *_dis_buf_tmp;
-	struct atomisp_metadata_buf *md_buf = NULL, *_md_buf_tmp;
+	struct atomisp_s3a_buf *s3a_buf = NULL, *_s3a_buf_tmp, *s3a_iter;
+	struct atomisp_dis_buf *dis_buf = NULL, *_dis_buf_tmp, *dis_iter;
+	struct atomisp_metadata_buf *md_buf = NULL, *_md_buf_tmp, *md_iter;
 	enum atomisp_metadata_type md_type;
 	struct atomisp_device *isp = asd->isp;
 	struct v4l2_control ctrl;
@@ -942,60 +942,75 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 
 	switch (buf_type) {
 	case IA_CSS_BUFFER_TYPE_3A_STATISTICS:
-		list_for_each_entry_safe(s3a_buf, _s3a_buf_tmp,
+		list_for_each_entry_safe(s3a_iter, _s3a_buf_tmp,
 					 &asd->s3a_stats_in_css, list) {
-			if (s3a_buf->s3a_data ==
+			if (s3a_iter->s3a_data ==
 			    buffer.css_buffer.data.stats_3a) {
-				list_del_init(&s3a_buf->list);
-				list_add_tail(&s3a_buf->list,
+				list_del_init(&s3a_iter->list);
+				list_add_tail(&s3a_iter->list,
 					      &asd->s3a_stats_ready);
+				s3a_buf = s3a_iter;
 				break;
 			}
 		}
 
 		asd->s3a_bufs_in_css[css_pipe_id]--;
 		atomisp_3a_stats_ready_event(asd, buffer.css_buffer.exp_id);
-		dev_dbg(isp->dev, "%s: s3a stat with exp_id %d is ready\n",
-			__func__, s3a_buf->s3a_data->exp_id);
+		if (s3a_buf)
+			dev_dbg(isp->dev, "%s: s3a stat with exp_id %d is ready\n",
+				__func__, s3a_buf->s3a_data->exp_id);
+		else
+			dev_dbg(isp->dev, "%s: s3a stat is ready with no exp_id found\n",
+				__func__);
 		break;
 	case IA_CSS_BUFFER_TYPE_METADATA:
 		if (error)
 			break;
 
 		md_type = atomisp_get_metadata_type(asd, css_pipe_id);
-		list_for_each_entry_safe(md_buf, _md_buf_tmp,
+		list_for_each_entry_safe(md_iter, _md_buf_tmp,
 					 &asd->metadata_in_css[md_type], list) {
-			if (md_buf->metadata ==
+			if (md_iter->metadata ==
 			    buffer.css_buffer.data.metadata) {
-				list_del_init(&md_buf->list);
-				list_add_tail(&md_buf->list,
+				list_del_init(&md_iter->list);
+				list_add_tail(&md_iter->list,
 					      &asd->metadata_ready[md_type]);
+				md_buf = md_iter;
 				break;
 			}
 		}
 		asd->metadata_bufs_in_css[stream_id][css_pipe_id]--;
 		atomisp_metadata_ready_event(asd, md_type);
-		dev_dbg(isp->dev, "%s: metadata with exp_id %d is ready\n",
-			__func__, md_buf->metadata->exp_id);
+		if (md_buf)
+			dev_dbg(isp->dev, "%s: metadata with exp_id %d is ready\n",
+				__func__, md_buf->metadata->exp_id);
+		else
+			dev_dbg(isp->dev, "%s: metadata is ready with no exp_id found\n",
+				__func__);
 		break;
 	case IA_CSS_BUFFER_TYPE_DIS_STATISTICS:
-		list_for_each_entry_safe(dis_buf, _dis_buf_tmp,
+		list_for_each_entry_safe(dis_iter, _dis_buf_tmp,
 					 &asd->dis_stats_in_css, list) {
-			if (dis_buf->dis_data ==
+			if (dis_iter->dis_data ==
 			    buffer.css_buffer.data.stats_dvs) {
 				spin_lock_irqsave(&asd->dis_stats_lock,
 						  irqflags);
-				list_del_init(&dis_buf->list);
-				list_add(&dis_buf->list, &asd->dis_stats);
+				list_del_init(&dis_iter->list);
+				list_add(&dis_iter->list, &asd->dis_stats);
 				asd->params.dis_proj_data_valid = true;
 				spin_unlock_irqrestore(&asd->dis_stats_lock,
 						       irqflags);
+				dis_buf = dis_iter;
 				break;
 			}
 		}
 		asd->dis_bufs_in_css--;
-		dev_dbg(isp->dev, "%s: dis stat with exp_id %d is ready\n",
-			__func__, dis_buf->dis_data->exp_id);
+		if (dis_buf)
+			dev_dbg(isp->dev, "%s: dis stat with exp_id %d is ready\n",
+				__func__, dis_buf->dis_data->exp_id);
+		else
+			dev_dbg(isp->dev, "%s: dis stat is ready with no exp_id found\n",
+				__func__);
 		break;
 	case IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME:
 	case IA_CSS_BUFFER_TYPE_SEC_VF_OUTPUT_FRAME:
-- 
2.17.1

