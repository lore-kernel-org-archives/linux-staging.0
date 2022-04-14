Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C97315A7
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 04:14:23 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id mp16-20020a17090b191000b001cb5efbcab6so8165254pjb.4
        for <linux-staging@lists.linux.dev>; Wed, 13 Apr 2022 21:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=7xvsh8FIV4X8qjBnU3ZR0V0Ttcm32tPDVRGj1HnLnug=;
        b=E89ALyx87bCQ8IpKubE9AeNsXRZ411XlezFM4W5fiDZKVZ4w4pykmFUkDGWacK2hbJ
         Xq0fQp3dXMp0yoiQBlxPqfRkzaxLQeV+Ihw4ElMBlvyw3jQgivk9935i9kBYZTjOQx8q
         6+5w5iQBPoQkMKgU7ym3cLgcE/dASwNCo1E0wZKlztx7qDR6LQLkRngej9VkreaJKqCJ
         wyI6DB5wcr7KI9G2LRrfuO9ATQ8ST6dp8en/cNZJ9oYnWcAjNgKBtPLZOi6mph8b/srs
         EDqr9G0FYqshl/eoYPD3IeVqZiC15Iy3GIROwmIakH0E4qnyWYfDz4Q47p9YfLxGmwmc
         pa1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=7xvsh8FIV4X8qjBnU3ZR0V0Ttcm32tPDVRGj1HnLnug=;
        b=KbU4pIxZuSZH4mKUq2N/wO+iTEjDDloC+iotPT1qlmD2jgkJVWrRmhqztTo0Q7hq9H
         KW8mh/WvJ8f1K8gHltJ6QLDdQJAlif3KJXQBqwmPEls4GiiNUsUU7AOayD5AQ2nh4O1r
         z9EEyR0wH6Um7wArAGw6iekzWjyBqvvsh3PEeUvJsGbk6xf50DUuc3YmbpvHwIavdVgx
         xd43nBvHrT5mx0c4flLjlWyYIl9kFg2ZIuQDrXnmuAQsbyEt58R9XZ5JBoquYCidqn9i
         0GRMiBxsFm1raOkN4BArW9T7LgdJ1RH1+pESB9yIMXdP6Eptz3P5pssbCCzG4nGWV3PZ
         NxeQ==
X-Gm-Message-State: AOAM532KETeqGP/7xXW+jl+gh1xFYmGfUUI4DqcSv+0j4z2jMeJZ8NYo
	AmGFEfDVptaKB+zB9jOJa98=
X-Google-Smtp-Source: ABdhPJz9lB+Xbap0e7ZK9fszXctV0rAupUZ11RrUE/bqj22npChrIdnC8J5gS1Z9Gvxkg4ljoreZjg==
X-Received: by 2002:a17:90a:4e04:b0:1cb:a26f:70c2 with SMTP id n4-20020a17090a4e0400b001cba26f70c2mr1652843pjh.130.1649909662581;
        Wed, 13 Apr 2022 21:14:22 -0700 (PDT)
Received: from localhost.localdomain ([119.3.119.18])
        by smtp.googlemail.com with ESMTPSA id y13-20020a17090a154d00b001cb5f0b55cfsm562729pja.1.2022.04.13.21.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 21:14:22 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	kitakar@gmail.com,
	alinesantanacordeiro@gmail.com,
	laurent.pinchart@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaomeng Tong <xiam0nd.tong@gmail.com>,
	stable@vger.kernel.org
Subject: [RESEND][PATCH] pci: atomisp_cmd: fix three missing checks on list iterator
Date: Thu, 14 Apr 2022 12:14:15 +0800
Message-Id: <20220414041415.3342-1-xiam0nd.tong@gmail.com>
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

