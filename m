Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2393F72
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 23:09:48 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id k8so7947899pgf.4
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 16:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8OUqAAQgCtzhtMv9ajuHg08CbUTBgd3fERbur7EHzCw=;
        b=W73cwcS+VWrXZZ4KOKu2Bw4BGTDn0MVmJa9oBAomrRDoLeVpssJreOmZeCxVhTPqw1
         CQbJ8SGoH+EvAqpk017cg4WmUaS0+fS4aU+i6JXudL6JWhVxYGBSpJAKRDgndOU2j+Ay
         oy+5ZIdKs5kb1rH7XL9Ld8ZDGQl6rHMN6dES28cwReC5nDKd95Qzh7pv6K6XXuO/t45p
         9296FfauwtVI12XW0ma0gR3hhI7f9qAy2rIUDnMbBEf+1aHLNHKt4UuTKwVq9/l17fVE
         qBCUSzYFsZo5Gz6+NG0ZSIKgdgdsbqy8xIGjeT850i/7ga48SOCmXh/GQMHhDckSsvQH
         JEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8OUqAAQgCtzhtMv9ajuHg08CbUTBgd3fERbur7EHzCw=;
        b=WFEU4oTXE1bSR0XzUhbrR7V+J87mLj6FdrOPNWdFX9rCVUtQWckmWvc4kdmMEu+GRv
         31ZanWVVdBxg42U7badpQvTVBVlQnVqz3et+aOucQOmNsXtQQDqSS/FgyxBWxYemxrRi
         EDun6uf/kH2WYimRHh6+qg8pZwNMLvaRgTZ0PvdWMJAeMG0y2CWn8C/CY1N9nGTos+VS
         K+vP9bXQY5raXVSydkIqyZXHzM8zJUhkITvl2cGYX81b+qUwu0pRp3bUDAq9aaVDmNmt
         kEU0rM65Qw/WXQxHI+74mxEo23KjrK0YcfkA5esJtLDdzIZYluHn6BXvmHop73BEQuxu
         3OUQ==
X-Gm-Message-State: AOAM5304eT+G0Buw6jJbRTGpdPCuYhjeF0Wlu5WfJ5r6c4a+yLq44E7O
	Hg12snf+HyRv2FBjGS9efbo=
X-Google-Smtp-Source: ABdhPJw8GTywRCiLjrQt+OiIitDpXfdPfl30wJv04hvK2WC4ezW4xD8tpm6puXi77C6RxBg80O7xZQ==
X-Received: by 2002:a63:3047:: with SMTP id w68mr4002681pgw.94.1618182587651;
        Sun, 11 Apr 2021 16:09:47 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id c14sm7918082pfj.46.2021.04.11.16.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 16:09:47 -0700 (PDT)
Date: Mon, 12 Apr 2021 04:39:39 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
	tian.shu.qiu@intel.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: [PATCH 4/6] staging: media: intel-ipu3: reduce length of line
Message-ID: <a374da6b8cce637dea5a2f2677b70abbd9a87118.1618180660.git.mitaliborkar810@gmail.com>
References: <cover.1618180659.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618180659.git.mitaliborkar810@gmail.com>

Reduced length of line as it was exceeding 100 characters by removing
comments from same line and adding it to previous line. This makes code
neater, and meets linux kernel coding style.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/media/ipu3/include/intel-ipu3.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
index 335522e7fc08..53f8e5dec8f5 100644
--- a/drivers/staging/media/ipu3/include/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
@@ -10,8 +10,10 @@
 /* from /drivers/staging/media/ipu3/include/videodev2.h */
 
 /* Vendor specific - used for IPU3 camera sub-system */
-#define V4L2_META_FMT_IPU3_PARAMS	v4l2_fourcc('i', 'p', '3', 'p') /* IPU3 processing parameters */
-#define V4L2_META_FMT_IPU3_STAT_3A	v4l2_fourcc('i', 'p', '3', 's') /* IPU3 3A statistics */
+/* IPU3 processing parameters */
+#define V4L2_META_FMT_IPU3_PARAMS	v4l2_fourcc('i', 'p', '3', 'p')
+/* IPU3 3A statistics */
+#define V4L2_META_FMT_IPU3_STAT_3A	v4l2_fourcc('i', 'p', '3', 's')
 
 /* from include/uapi/linux/v4l2-controls.h */
 #define V4L2_CID_INTEL_IPU3_BASE	(V4L2_CID_USER_BASE + 0x10c0)
-- 
2.30.2

