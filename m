Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C4870
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 15:29:41 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id k8so12188009pgf.4
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 08:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1fCrfrmJZI3X6ymxjhobx0T/1lZLGKuT5ZcshF1fEYk=;
        b=mH0tMSNTz8SyU5qkYvK2u80gaZ8Gn4PLz0ULcefgOuEGJGR/lC596O1HMIV6cBuRV1
         OohY8hKnIWlihH3zWuGeDQK6QP8zgy01Ay640QVAPvCkS5/S9nBgr9AS5k8gm/sOcHeo
         HQA5ZKC07UCEJqwmChMrgoYCbZezZWx72sk69xjcCpTUcndCujYXZeIzdRmXhp86WHGR
         HnYaO/dYPOTs+1FVMNhqq34HqQVX2fIhX4iDHI9MLx04F91xxWzwiU+dRn6X16qr3U7T
         4At2K3yP2/5cYkKE+89I/MjbXiKKw75kFWr2n8KXeqdjjyhFCL8ozg9REVAFIUR1g3RD
         YdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1fCrfrmJZI3X6ymxjhobx0T/1lZLGKuT5ZcshF1fEYk=;
        b=jBBHEHr97QTcgdNWznV31jOmUQtdNCfwD6vPj9u1GxPn3I0EUUkHuTwYSulE5qS6Tr
         m3XeKh8ksOm+mLQ4C/W44kOK21dp3LrehAMBSqj/wyYztSKX9k1WCg2HwFKwIQWKQbmh
         kFkybiXYbOiin8L4Pp29fI1t/sVk60FlJDbPpFFlYd8PR2hxefkq/TsmKNS2xk/7814O
         Bl/o8ki4vuCkotokTWtqO2rGOhRRA5PLnQBuf49csxwwhJtz+a2/s7d8tmhgpFShFZgM
         JQNS3xh7GTFHz3hSVc1+HD89+pMn0dybmmEW8uV9dgfsH1sd1J7QYQ+ZNZmlsHpjzAJp
         5RPA==
X-Gm-Message-State: AOAM5337zrg6DdHyr+O5IqY7LiDEqFlRElkjm7HC0l6mHbghghQz73zT
	Ymefpcv/722rUjVzMmitYIw=
X-Google-Smtp-Source: ABdhPJxv2qIxd3BmFH494be85112Fgi5uFlFYGcsGUPFg9ZqQQFlxDKZmmHuVdIocsgMLRqXfNZdVA==
X-Received: by 2002:a62:e70e:0:b029:245:3a00:5720 with SMTP id s14-20020a62e70e0000b02902453a005720mr25036334pfh.0.1618327781360;
        Tue, 13 Apr 2021 08:29:41 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id c15sm12892707pfi.207.2021.04.13.08.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 08:29:41 -0700 (PDT)
Date: Tue, 13 Apr 2021 20:59:34 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
	tian.shu.qiu@intel.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: [PATCH v3 4/4] staging: media: intel-ipu3: remove space before tabs
Message-ID: <01ad7ff353f805dfc48e7bcc26ed974e7bb5ef9f.1618326535.git.mitaliborkar810@gmail.com>
References: <cover.1618326535.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618326535.git.mitaliborkar810@gmail.com>

Removed unnecessary space before tabs to adhere to linux kernel coding
style.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 
Changes from v2:- No changes.
Changes from v1:- No changes.

 drivers/staging/media/ipu3/include/intel-ipu3.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
index 47e98979683c..42edac5ee4e4 100644
--- a/drivers/staging/media/ipu3/include/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
@@ -633,7 +633,7 @@ struct ipu3_uapi_bnr_static_config_wb_gains_thr_config {
  * @cg:	Gain coefficient for threshold calculation, [0, 31], default 8.
  * @ci:	Intensity coefficient for threshold calculation. range [0, 0x1f]
  *	default 6.
- * 	format: u3.2 (3 most significant bits represent whole number,
+ *format: u3.2 (3 most significant bits represent whole number,
  *	2 least significant bits represent the fractional part
  *	with each count representing 0.25)
  *	e.g. 6 in binary format is 00110, that translates to 1.5
-- 
2.30.2

