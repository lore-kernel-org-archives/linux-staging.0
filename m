Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDE71FA6
	for <linux-staging@lists.linux.dev>; Thu, 23 Jun 2022 19:26:05 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id c205so499519pfc.7
        for <linux-staging@lists.linux.dev>; Thu, 23 Jun 2022 12:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=+Po9Dm3vumEX9STq43cTmihX9SdOY+/mYJ+qc0yciOo=;
        b=bBvetAlvQSFJqUHyoHFMLObjAkxYwCOWk7SUZA9+FyXom0bnGD+vm5wi3dWjwWhUaE
         tV44/Nh2FFX8fm5diVPbVRDknW2jx19rgYpxqCmahw6r2Inh/RJ7pgplqfkRSbZvYxOW
         3caeYt3vL1MsPm2o/X5X8IiAiiNR7kJGiVuMlrt5jJu5xXntowtdHZVhRFjkjA8lb44U
         00y0Bi/g1bYFS0PLddK75f9tKEnhpso7fQilLFo1jJrTLv/SySCmJVz9Gh2m5eo9kM/S
         UAfEA1g7S+8WhF/ivvzVkf3fPXqE8he393xKJwf/+GlSnfiqd0yD/XaLgKS8bUUSTISu
         XSiA==
X-Gm-Message-State: AJIora9sPpA5LdJFEfyKFdxZtPPyAp2B2EeldY1Oe41l5wq4qhg7UsVE
	+FeIt1Busa/5dJlupKuJ2w4=
X-Google-Smtp-Source: AGRyM1uTX4ESJ0tw80Aa81RBvBg4Pcvvf5BGyKGi9W8AIdbExQbAaHbhTGHrArxaF0w8Iu1c5l0S6Q==
X-Received: by 2002:a05:6a00:24cc:b0:50d:58bf:5104 with SMTP id d12-20020a056a0024cc00b0050d58bf5104mr42316787pfv.36.1656012364666;
        Thu, 23 Jun 2022 12:26:04 -0700 (PDT)
Received: from karthik-strix-linux.karthek.com ([117.208.185.194])
        by smtp.gmail.com with ESMTPSA id h11-20020a63b00b000000b0040c99f8bcb7sm10095771pgf.58.2022.06.23.12.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 12:26:04 -0700 (PDT)
Date: Fri, 24 Jun 2022 00:55:58 +0530
From: Karthik Alapati <mail@karthek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tsuchiya Yuto <kitakar@gmail.com>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media/atomisp: don't use index pointer for debug
 messages
Message-ID: <YrS+RmnyusG6JOTU@karthik-strix-linux.karthek.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

there are some debug messages which use index pointer of
list which may not always point to the right entry as in
the case where the required entry is not found and the
list traversal completes with index pointer pointing
to the last entry

Signed-off-by: Karthik Alapati <mail@karthek.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 97d5a528969b..ec030e3aeae5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -956,7 +956,7 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 		asd->s3a_bufs_in_css[css_pipe_id]--;
 		atomisp_3a_stats_ready_event(asd, buffer.css_buffer.exp_id);
 		dev_dbg(isp->dev, "%s: s3a stat with exp_id %d is ready\n",
-			__func__, s3a_buf->s3a_data->exp_id);
+			__func__, buffer.css_buffer.exp_id);
 		break;
 	case IA_CSS_BUFFER_TYPE_METADATA:
 		if (error)
@@ -976,7 +976,7 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 		asd->metadata_bufs_in_css[stream_id][css_pipe_id]--;
 		atomisp_metadata_ready_event(asd, md_type);
 		dev_dbg(isp->dev, "%s: metadata with exp_id %d is ready\n",
-			__func__, md_buf->metadata->exp_id);
+			__func__, buffer.css_buffer.exp_id);
 		break;
 	case IA_CSS_BUFFER_TYPE_DIS_STATISTICS:
 		list_for_each_entry_safe(dis_buf, _dis_buf_tmp,
@@ -995,7 +995,7 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 		}
 		asd->dis_bufs_in_css--;
 		dev_dbg(isp->dev, "%s: dis stat with exp_id %d is ready\n",
-			__func__, dis_buf->dis_data->exp_id);
+			__func__, buffer.css_buffer.exp_id);
 		break;
 	case IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME:
 	case IA_CSS_BUFFER_TYPE_SEC_VF_OUTPUT_FRAME:
-- 
2.36.1

