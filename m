Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42DB72
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 23:08:24 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id d10so7923575pgf.12
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 16:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=y3OO3ieVmLEwl+ife04UOYUCAMow1hzkBN//gQUlMpA=;
        b=gZa1XQqOhnFshkh4twv2e6nHTxXyn50PCEHsmnHWoWb39ijE2/XeX619XzzQNi7wEU
         nnLei4oEl36w7mpVVVdvD4Cs5Iczg7ESkuWAsWpq1J6+0HoBrUjbsbmLsDZjPw7Z7waY
         2uJ79UX0oY8T32BCFUmRxsiTY7mY/+KsipeBnQHURXo2PVV2bUOOcHjBdM2mZ4VOEBOZ
         Wr6wFxtm1+xdcNC7P8hiG3HF+KLyk7NcSIfe+Am5FWYugGNtVmGwu/7OkLg3u2rZ9eKh
         xsmvg3a5ZhFato6XANJFOvF+snksG0vMWuy8mYpUr6UwTRdazoaMxhY27w/39lXCvKOs
         w90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=y3OO3ieVmLEwl+ife04UOYUCAMow1hzkBN//gQUlMpA=;
        b=PYh2AOHqBOUQuk+k0rb2+ig2kcPUvmZ2rJ8M8P7EJRBSj5AK3GZc+lzTooZ7+uBnec
         JpVSVQCrMXXu/MejHoDFx6Qf8mHzRg2vT1CbUGBR97vdj0xHAFp8BTVzQ15WD8ZfoONM
         rbBsd40PbKCAppUdxnCnlRmtVaMXGUU1ebBi3OuFt+5mxCAUMfLjchzV2DZDgX0ucxMl
         YAX+NtYubXnP9FX7yJ+XhhewqS5aAEBuKozwThNxnt3JBHjoemyTbPkZGIUs8xKJNNGr
         b0zca1kOmm67HQYFHHF6wqymhJ4JVM1JLb7KDP+MNizGfMLRC2HD0ZGknzKUq5UKJB5H
         WfeA==
X-Gm-Message-State: AOAM533VXcrtfC2rlKz5xjBrfe/ZxtKdDpDd6/ePhrurtxMAI6ymh9DT
	6u/FEZTBNGcNGWXc4DpgbKI=
X-Google-Smtp-Source: ABdhPJzSk70k6LM9VSsUsO9urpktgQ/uiFzNlIvQGx3TpOESw3ocvMlPyB6hVyVkuqDU/LIVc/QP3Q==
X-Received: by 2002:a63:f91e:: with SMTP id h30mr24117266pgi.117.1618182504181;
        Sun, 11 Apr 2021 16:08:24 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id m14sm7492873pfh.89.2021.04.11.16.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 16:08:23 -0700 (PDT)
Date: Mon, 12 Apr 2021 04:38:15 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
	tian.shu.qiu@intel.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: [PATCH 0/6] staging: media: intel-ipu3: cleanup patchset for style
 issues
Message-ID: <YHOBXzA0Dk/yLfJY@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tian.shu.qiu@intel.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH 0/6] cleanup patchset for style issues
Message-ID: <cover.1618180659.git.mitaliborkar810@gmail.com>

This pacthset fixes the style issues reported by checkpatch.pl

Mitali Borkar (6):
  staging: media: intel-ipu3: replace bit shifts with BIT() macro
  staging: media: intel-ipu3: preferred __aligned(size) over
    __attribute__aligned(size)
  staging: media: intel-ipu3: remove unnecessary blank line
  staging: media: intel-ipu3: reduce length of line
  staging: media: intel-ipu3: line should not end with '['
  staging: media: intel-ipu3: remove space before tabs

 .../staging/media/ipu3/include/intel-ipu3.h   | 91 ++++++++++---------
 1 file changed, 46 insertions(+), 45 deletions(-)

-- 
2.30.2

