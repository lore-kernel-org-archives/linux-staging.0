Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E37D52F84
	for <linux-staging@lists.linux.dev>; Sun, 28 Jan 2024 22:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706482388; cv=none; b=jjE2kOSgzf3nZFqg1jNMfLukM7E4drW01pBGR428OWmrFI9WYR+EtrYHjNIyX2q1P3rl/yCaIltMmJExuVd1ytGEDRR4vFg0r3P1SJasV4oo98Mc0FbHaAHDoIuR1Map2rJKR9X7k1XSCvIVGQzO2jr638NEW6e/3f7wZy97Y4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706482388; c=relaxed/simple;
	bh=w3X5ynGmtXaOeXoU0AhqBVrv6QF8ibOUb17yYFx8ZB4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KWBur0u279ffSrhO0dGZ926+D/FmHKxjHM2HPwfDoVzFPFhJDbtQCgvZQQUQ/rxpffXYZyoXSietjrmIdpF4+Qiyu3o+c8Zpi6MmTqKgPwERw/6r1eCEX4FNZ7XvKWDjUZrvwdzykUdld0Sat/S1YKD2e9iWUG0pnzGOtfGXtug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmyYnJSZ; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmyYnJSZ"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-783d4b3a00bso221641885a.3
        for <linux-staging@lists.linux.dev>; Sun, 28 Jan 2024 14:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706482385; x=1707087185; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SHEJz7lhB+IAerhrVnhDVBAqG+Jxmcd4Fdf1GvCvEOA=;
        b=bmyYnJSZuPmTXxt4KLqQgwaAV6PFn1pJzOyxEKjm6aYks3Ku2vPhPTP+w38VMzi8SE
         jF7D41hN67b7wS9nnd6hJjCtY2jdMQtdhN1Kt9TpCLk2JOXJ5FZKmM8yqNqriGGDrCfv
         L7tkplHDn6hwBLoH8g21VNPon4Y4o/1P8AC893p3+Bl0skJNbZuPZzKew101po0fCah7
         2H+5z3e/XLsJoXcgcDVfqxepJDvagKxmqPTZfL14miKh0tCEVJm8s1+ywIbSSttYIgov
         iT3jcjwZLMW+JYxygmad1fFuVqMoMO+eiYzDdSlVj9pUD63AFwEWgiV4xvVlh9+bPQ9+
         vy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706482385; x=1707087185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SHEJz7lhB+IAerhrVnhDVBAqG+Jxmcd4Fdf1GvCvEOA=;
        b=OAM5AJzeGiT38ayYBQKD+foEo2Q830Aeu7avRRiFGBEisLVUURaDiJpsYJpKJEXtfS
         saLR9OLTfH/M//tFVy7TafC2KAa6AsY4arMtsUZcyv2deD6gQIDXG2ywIDj9h3C5nefS
         /OHaH4QoCoCuz53rGaOwaUl87xpLw67LzxNnck3vyegIsy8FYsUV6CiFSLIaWJyaDR6P
         ZJc5lzJ+7Rgi3K27UTDYpBBLqW5HBQ/J8n89GijwZD6DpH3Wy9ESgv+RBraJnm2ez3cs
         2X/8M6D/T1vt4vDmiRXxIKKFfrzehM30RBgHZRqt2NENPoFXK6b4KAlbDIDKUzgyT8ON
         Oz6Q==
X-Gm-Message-State: AOJu0Yyoi46xEc9F9p93QLZEaPj/ne2uKxAYyd2WV3gAVvdh5RgYg6za
	/a65QulplPkYw2RbRRGpvxArWsHYuVaPL16a3JWEJrDET8bSo93O
X-Google-Smtp-Source: AGHT+IEdTY/eWJZvlD4EQYw6AswvY87543msgJIyxR6XRvQcfJ+yyYdFG/GfF+lCqFI7CXkglqnhMQ==
X-Received: by 2002:a05:620a:4013:b0:783:fe00:950e with SMTP id h19-20020a05620a401300b00783fe00950emr1254567qko.148.1706482385079;
        Sun, 28 Jan 2024 14:53:05 -0800 (PST)
Received: from kohshi54-ThinkCentre-M715q.. ([2404:7a80:c880:6500:7f79:d78c:e8ac:f086])
        by smtp.gmail.com with ESMTPSA id y2-20020a1709027c8200b001d7726c4a40sm4069560pll.277.2024.01.28.14.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jan 2024 14:53:04 -0800 (PST)
From: Kohshi Yamaguchi <kohshi54.yam@gmail.com>
To: sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com,
	tian.shu.qiu@intel.com
Cc: Kohshi Yamaguchi <kohshi54.yam@gmail.com>,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCH] doc: ipu3: Fix UAPI header doc warnings
Date: Mon, 29 Jan 2024 07:52:58 +0900
Message-Id: <20240128225258.50375-1-kohshi54.yam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ipu3_uapi_acc_param struct in the IPU3 UAPI header mentioned
reserved1 and reserved2 fields, which are absent in the actual
structure definition. This mismatch led to Sphinx build warnings
due to inconsistencies between the documentation and the code.

This patch removes these non-existent reserved field references
from the documentation, resolving the Sphinx build warnings and
ensuring the UAPI header is accurately documented.

Signed-off-by: Kohshi Yamaguchi <kohshi54.yam@gmail.com>
---
 drivers/staging/media/ipu3/include/uapi/intel-ipu3.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
index caa358e0bae4..926fcf84e33c 100644
--- a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
@@ -2485,11 +2485,9 @@ struct ipu3_uapi_anr_config {
  *		&ipu3_uapi_yuvp1_y_ee_nr_config
  * @yds:	y down scaler config. See &ipu3_uapi_yuvp1_yds_config
  * @chnr:	chroma noise reduction config. See &ipu3_uapi_yuvp1_chnr_config
- * @reserved1: reserved
  * @yds2:	y channel down scaler config. See &ipu3_uapi_yuvp1_yds_config
  * @tcc:	total color correction config as defined in struct
  *		&ipu3_uapi_yuvp2_tcc_static_config
- * @reserved2: reserved
  * @anr:	advanced noise reduction config.See &ipu3_uapi_anr_config
  * @awb_fr:	AWB filter response config. See ipu3_uapi_awb_fr_config
  * @ae:	auto exposure config  As specified by &ipu3_uapi_ae_config
-- 
2.34.1

