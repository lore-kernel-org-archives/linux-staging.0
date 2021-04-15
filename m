Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151646D32
	for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 17:08:23 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id i6so9101051qti.10
        for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 10:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=uf0ZGB2uqUBLy2FnRQ3C5Lz7GzWpWAMQjMxZozUcp5k=;
        b=bCFCUHYUlz/cSCkhPoAYlnGHW0yxm8SgH5bZ5/zjQtgK7Kxi38yQcZrE45PiIq9++i
         xLpAMGedcKXZ/+0ypaMlt++xi274dslp6FLpKeAWMyg87OSpAm4DK3YCa9xLgXkDNj5q
         p+DzbHChR/QXglUAbTI5KDmu+Njim/jkpMOGYGkNuN/A03NemlZHcW0+jerzkCkBfwJC
         ymtkwf/UazsBelMfqPl49R2CBpvooC9426pVHPnN8qnvWkpew0xt7mQY4dSeYGy1R+w9
         EDFLtq73zm/SdAdNPmrN7vZTv7a9RCSENBJ0KgKAOwesML6nk6fFTzfY7+fzTj1l1QSY
         exFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=uf0ZGB2uqUBLy2FnRQ3C5Lz7GzWpWAMQjMxZozUcp5k=;
        b=aAyREIWl3KVQjA3dh/P59aR/2dBMvtYnQcvEbFh9zomG5nLYnh2AZLRQsJriqNBXZg
         2gpLMFx7dSGMcGGGBjHwV/nEP7F8ZEOTB4Hjfos9+59BakW/XPbJaqCWNXmvEnHVxlLD
         ygi4kekMzCtj+4C9Lh18BFpiMNXmRqqijArmr/YLYOG4pUYi3uj8j56bFHTKgNTvnwvn
         8UlxZLHjXMJ4fQGS3eP+Cq6pSzaz4hbHutKfTDj70XQGqSiVC5ULM9SkCzk52uQ2q7sv
         KrAJld7rWnSGZx5pRjLTaBu1TvXCvYICuJ7tjn2ysKl9xEQ7ksVdSWnnsA/n1bhdRZH/
         T2AQ==
X-Gm-Message-State: AOAM530/kVITC+O7pE+3P8hfcodZt5l9u30ixDbhXI6Ai23DcY/OMujt
	29xcS1e0D3iNYCHPhV6uZrw=
X-Google-Smtp-Source: ABdhPJzOeRFjoO9OHsiSE+7RSGeSUAWJh1ZYOuV+qhCuDn5eN6OwJWeKdgkT+p9hZWQfsORQj2wICg==
X-Received: by 2002:ac8:7dc5:: with SMTP id c5mr3948348qte.270.1618506502022;
        Thu, 15 Apr 2021 10:08:22 -0700 (PDT)
Received: from focaruja ([138.204.24.234])
        by smtp.gmail.com with ESMTPSA id d10sm2022151qtn.34.2021.04.15.10.08.21
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 15 Apr 2021 10:08:21 -0700 (PDT)
Date: Thu, 15 Apr 2021 14:08:19 -0300
From: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH v2] staging: media: atomisp: pci: Change line break to avoid
 an open parenthesis at the end of the line
Message-ID: <20210415170819.GA17534@focaruja>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)

Change line break to avoid an open parenthesis at the end of the line.
It consequently removed spaces at the start of the subsequent line.
Both issues detected by checkpatch.pl.

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---

Changes since v1:
 - Keep the * with the function return type 
   instead of left it with the function name

 drivers/staging/media/atomisp/pci/atomisp_cmd.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index 1c0d464..e2b36fa 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -75,8 +75,8 @@ void atomisp_wdt(struct timer_list *t);
 void atomisp_setup_flash(struct atomisp_sub_device *asd);
 irqreturn_t atomisp_isr(int irq, void *dev);
 irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr);
-const struct atomisp_format_bridge *get_atomisp_format_bridge_from_mbus(
-    u32 mbus_code);
+const struct atomisp_format_bridge*
+get_atomisp_format_bridge_from_mbus(u32 mbus_code);
 bool atomisp_is_mbuscode_raw(uint32_t code);
 int atomisp_get_frame_pgnr(struct atomisp_device *isp,
 			   const struct ia_css_frame *frame, u32 *p_pgnr);
@@ -381,9 +381,9 @@ enum mipi_port_id __get_mipi_port(struct atomisp_device *isp,
 
 bool atomisp_is_vf_pipe(struct atomisp_video_pipe *pipe);
 
-void atomisp_apply_css_parameters(
-    struct atomisp_sub_device *asd,
-    struct atomisp_css_params *css_param);
+void atomisp_apply_css_parameters(struct atomisp_sub_device *asd,
+				  struct atomisp_css_params *css_param);
+
 void atomisp_free_css_parameters(struct atomisp_css_params *css_param);
 
 void atomisp_handle_parameter_and_buffer(struct atomisp_video_pipe *pipe);
-- 
2.7.4

