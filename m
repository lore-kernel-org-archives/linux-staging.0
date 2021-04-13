Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64EF72
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 05:15:55 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id h20so7579336plr.4
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 22:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2G4Sv3LtujgUMx6LivaQKJ/nSswqoSp68oTOL36KfQ0=;
        b=SbpjChqFW20CKXahZ4POV1UtDvN7EZHMcmjhnHloxYsyR9lJ3s8QXqewGgXPFGTcKg
         +0B9v1kXbFTIae1pT4fHRcvXs4MS4eujiUV4EsTbVtmvbsGQ65OWuvgr9FtahOrEJnbC
         yzp41Uclbm1fFxCh1sZov1+durPRBitaXYMna7CSlenHsftbO1k/vU6AqULm3VyOIBi4
         esUBbj91i9MiaGAxcsdtI1K+a/5LbAEbD2PI0E4Vaem062urKOYMjevZY2RXrJ8skcjl
         5r///uzZvmhm5aunneiZHzMHljieZWEe2/mvkKN1RUC1h+vX7dsl4C/9U6yUl2G8s9m3
         7MZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2G4Sv3LtujgUMx6LivaQKJ/nSswqoSp68oTOL36KfQ0=;
        b=V1bFe6ECCxIzXEe22rS9049lry/cWPURjPEz77gQjZQDQ8Etz7qLDVNWD/63wYrMXv
         xlZs2CNPhatOepe7bxRdmHC4B20fxeVUhqcXGmpQjWytzKYo4h2Sb+VIlzl0PJMdxn9t
         RiZtvdqcEKkPwAKtt/NJqWL6toAun6SdArLgjCkN8Wq1w0DbIugmhoRmegETCXCWETeT
         ZbA8OebKriAFllJp1BxRpeEy5Y5Nv6jffIjLUYnThKBRi88jcCtADyLLwTmCshRp8VyG
         +dX5bDFCCJ81ii2/BSMASRCsdl/HxXKDhf7RTP62AqH5d2GdW35UICPpUkoEfuovlPDN
         tnCw==
X-Gm-Message-State: AOAM532uLawt8+GCJetbToSCVMzVzyUMHYIDiV8Wc9vYKbEjhXKh92CP
	kmcAi+9bFT7VwVcgRNDVjiI=
X-Google-Smtp-Source: ABdhPJwoufieI9ztKXZhb4CBfUZbEHz9dA2hQ2t84hQOzdQtm3BMRBsq/rlzV34tIcmsBgEBPXjdFQ==
X-Received: by 2002:a17:90b:a0c:: with SMTP id gg12mr2889193pjb.184.1618290955215;
        Mon, 12 Apr 2021 22:15:55 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id 19sm1833627pfy.77.2021.04.12.22.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 22:15:54 -0700 (PDT)
Date: Tue, 13 Apr 2021 10:45:46 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
	tian.shu.qiu@intel.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: [PATCH v2 2/4] staging: media: intel-ipu3: reduce length of line
Message-ID: <a374da6b8cce637dea5a2f2677b70abbd9a87118.1618289130.git.mitaliborkar810@gmail.com>
References: <cover.1618289130.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618289130.git.mitaliborkar810@gmail.com>

Reduced length of line as it was exceeding 100 characters by removing
comments from same line and adding it to previous line. This makes code
neater, and meets linux kernel coding style.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 
Changes from v1:- No changes.

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

