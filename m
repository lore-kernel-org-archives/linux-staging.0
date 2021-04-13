Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAB970
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 15:28:49 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id t22so8087115ply.1
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 08:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DMFAeenJ3GJ+5amHPUt1V5Y4xL6+ih6uNBQOPdmIYsg=;
        b=Gfkv9H97ywR0e8+JktIS1lDOavqudu48crr8IGSjJbYInXDhgnAM5u4/PL8WyD+ujT
         7CKNooUstm/+3/wsG6PmF7FlvG3rUU9kkEwm3HcZNXLwPWkRaJusS/K8U9biX86xBjQO
         1VR09KCvDeC17reiaz4DEzaLCIdTbSOmw0wZau+UsYArwNUg1WOG4dw/WDafSgOvdj93
         tTIWI3WYn9EM73kSbLYmt5tzzmapPIUjYgr9r6wr89opIq5cDSiiWMX6OBU0n+3kNGx1
         uQ7S7Bh/NOuxqmnn60s93qJQEu6nn2S/GFT6Tr8jTwL7DkgX2HzuopAcUxJ6chmFdPEx
         pxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DMFAeenJ3GJ+5amHPUt1V5Y4xL6+ih6uNBQOPdmIYsg=;
        b=Pg7zqnJXVJlP4U/FR872cU4JnZznfqjWAlSFhWA6K2pBUy5fVC7Ez0ZeiYTQQjD6Ox
         TBZGGZnFsGPkAFgGF1a1LiUmR7MxeCUqGE4yE6unUrTU5WCpCl5rT59NG5vePyehyn+R
         QLgiQyMkaF14RUXTIgWImknhQrfh/fK7Iylv9DbBsPwtycLpcgeZ6uxkWGSp2ralurXO
         Vka3ipoVseCMWtYTEx7z8R5FWJaocnPQHEjdiAteNIaf7b0o+wkgrH9BDfv4bQKBKJIo
         s8L4atV699C0g/Cb5aqnhx0L/GO3BdWCGxzwQ2w6+ZXEWp7nMicTpJPGkC6kFu9pwCqK
         Q/BQ==
X-Gm-Message-State: AOAM533oXQgl6M24RkR9W5NrDYz334lauKCRhDg34jfnTe3OB5Ah/kkd
	Xkp/0uRVSN3ukDsqsluzh1Q=
X-Google-Smtp-Source: ABdhPJx3o94YoWme6YyVTOpvbjkkCt/MmDEmmSKzgtL/jjiK62HXJj2Jp+0GLXbVgQe8ht2L7IEr2Q==
X-Received: by 2002:a17:90a:5413:: with SMTP id z19mr558107pjh.137.1618327729168;
        Tue, 13 Apr 2021 08:28:49 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id a3sm2492213pjq.36.2021.04.13.08.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 08:28:48 -0700 (PDT)
Date: Tue, 13 Apr 2021 20:58:39 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
	tian.shu.qiu@intel.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: [PATCH v3 1/4] staging: media: intel-ipu3: remove unnecessary blank
 line
Message-ID: <352ce300cfb744262bd30aa78e77b99bb28065dc.1618326535.git.mitaliborkar810@gmail.com>
References: <cover.1618326535.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618326535.git.mitaliborkar810@gmail.com>

Removed an unnecessary blank line to meet linux kernel coding style.
Reported by checkpatch.pl

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
Changes from v2:- No changes.
Changes from v1:- NO changes.

 drivers/staging/media/ipu3/include/intel-ipu3.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
index edd8edda0647..438ec3ed7b6b 100644
--- a/drivers/staging/media/ipu3/include/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
@@ -74,7 +74,6 @@ struct ipu3_uapi_grid_config {
 	(IPU3_UAPI_AWB_MAX_SETS * \
 	 (IPU3_UAPI_AWB_SET_SIZE + IPU3_UAPI_AWB_SPARE_FOR_BUBBLES))
 
-
 /**
  * struct ipu3_uapi_awb_raw_buffer - AWB raw buffer
  *
-- 
2.30.2

