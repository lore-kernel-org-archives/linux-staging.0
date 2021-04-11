Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEB872
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 23:09:28 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id h25so7946888pgm.3
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 16:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TMplUBdDdPxuSIZsBm3m2+MMOTC46FBVLik1YxyG7nI=;
        b=NMmNEDdajLxowNhnm8F753vA1wuuG2UM8b2mp/9Bv/VxwQ/wkw4by+7wcSJtQJyXfA
         eak4V3YQrbFquPuJd8wKblNdpy2mWEPTF5++Rtvlq7CQiMUMiYTY4cNt0mh5O+Di7zYX
         O/rMn0Z4VpBG4Q/lMKLz20PglnyXsMZj8v+hG1WQwMC2WAPRfj8MzHE/QzPLP2zyuEFY
         ua7L3I5607LQilgMgRYkkVEoynsI3fHKNWjMCgbSMRQYUAqVY3S2PV0lN38PcxpozTpd
         aLzaRo9pYkiPvwDI8QQ7DmO7th6Dr/Ynu6NJcE7+N8Cc2/dpG6El5TYbus6EzL3GOhOU
         7sUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TMplUBdDdPxuSIZsBm3m2+MMOTC46FBVLik1YxyG7nI=;
        b=ESoTAEt0XOUFwnPRgUKSdFsrzz4VfCH5+RltNA9tnb7mEcetPIFGuSqt8/jSuIiSz2
         h6cWMnhkTh9oDg2NCSHalwJjagGr1slsZWwd6znIxNwn+3xD02Nu38VkflrrxLsQSTZ2
         mpl6ihBUeS0c+8bbBvBFVCvPtMEzjcqJ7nk2L4NGS5hSOhoF6DUD95Qal+m+Inuk4xa5
         EyQbZent9rEJ402d/ylhYai05rV3ga0ztwhPo3JzInTGA7jt4XNX7d43+87Ypy2xIA58
         beC104uNswRQUKg9UUhQwGwnWQKvCn07QWJSJcRBspQS6S4GOXvcD5rYWo0vYmUboPwK
         TYVg==
X-Gm-Message-State: AOAM530V5RK0yz6esJCpNoKE787BYAfVE8PPHeqgZsYQszxt6v81S+7o
	dLx5KFFbYjbpBP89VtQumRE=
X-Google-Smtp-Source: ABdhPJzRc+Wnr3AZCUqGiznejYUw5xfMAGnyzNKwkEZipynwSzGxDBGLv4w9hye3Ao43p8bVKH305w==
X-Received: by 2002:a62:8c13:0:b029:241:db2a:11b6 with SMTP id m19-20020a628c130000b0290241db2a11b6mr22533133pfd.74.1618182568196;
        Sun, 11 Apr 2021 16:09:28 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id a13sm9339796pgm.43.2021.04.11.16.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 16:09:27 -0700 (PDT)
Date: Mon, 12 Apr 2021 04:39:19 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
	tian.shu.qiu@intel.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: [PATCH 3/6] staging: media: intel-ipu3: remove unnecessary blank line
Message-ID: <79b543d96fa0bd613090984b98c5665344b4dddf.1618180660.git.mitaliborkar810@gmail.com>
References: <cover.1618180659.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618180659.git.mitaliborkar810@gmail.com>

Removed an unnecessary blank line to meet linux kernel coding style.
Reported by checkpatch.pl

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/media/ipu3/include/intel-ipu3.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
index d95ca9ebfafb..335522e7fc08 100644
--- a/drivers/staging/media/ipu3/include/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
@@ -75,7 +75,6 @@ struct ipu3_uapi_grid_config {
 	(IPU3_UAPI_AWB_MAX_SETS * \
 	 (IPU3_UAPI_AWB_SET_SIZE + IPU3_UAPI_AWB_SPARE_FOR_BUBBLES))
 
-
 /**
  * struct ipu3_uapi_awb_raw_buffer - AWB raw buffer
  *
-- 
2.30.2

