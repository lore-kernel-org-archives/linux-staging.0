Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B61481220
	for <linux-staging@lists.linux.dev>; Fri, 14 Aug 2026 15:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786720294; cv=none; b=lRtoCvLLUm2Q/z/4QbeMNMb0SWy2w0tFtHH3na7bi6I7jREyW79yvb9Ot0nLPPGxPqvDTAfN5XrQ86hWjTspN/1BVrK0dReEHqODj44FsexPNtB5dW2oH1rIwDM206hk+yVGDFd8Aa+/8xAgssNBEerYHrEdrAZJH8KKkJOaiyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786720294; c=relaxed/simple;
	bh=Av4Txgg7GubX1fn2pw6x+d0xJpGMl6ZoRGhGWtZseLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TDAtGsRNz6kKI19X/PiYWjUC8GdZji0Su6xd40WoPvLfb/CNsu5AthVxMWBBE5FOuZeD7kO0U2vH92GPW0UnB3OAjH52EY4e3oLb03t6BAp1WSXZipPTWZJo/rLunPhSkkr9gDV+Q7TE8pzXx98q7jC122RQ5rpyzOl3g257toY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yk2f/Z4l; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yk2f/Z4l"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39c7ed5410bso6404151fa.0
        for <linux-staging@lists.linux.dev>; Fri, 14 Aug 2026 08:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786720291; x=1787325091; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wc6Ml7BNAlh0t75KbKQHb44jExGL01omSop7wpIJVpw=;
        b=Yk2f/Z4l9b5aVVm2tuNRzbgjFJoA+G+cSMmKa2L34iCCcAuo5vWlGrz+uid6I9x5Dj
         0lJnPMMgZ+z/S+lXr2Gcnje+oAoUs3jVtrd2LZMIZoEsSbGDEPMkngAp3CIpJN8hyC/b
         22TU+BvgVkZPDDNtgsXQ+QmfC43YuXSR5XdI0uqRTIIiqT2xxkQ1xuWYY/WbvjV/K6Ow
         BM8qQaD4JD5EF23LjSXKs35qUvjS/QpTQqJVlL3CpcJf7kQ9ZCNF0uyhSRILVdvtyNuP
         xdF5xrjvpA7gvYDac0c8Ltz/XXT9tDfGw75bJnd6T72VEP2Q1nV4VIfdLqAtfU09QrgQ
         lgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786720291; x=1787325091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wc6Ml7BNAlh0t75KbKQHb44jExGL01omSop7wpIJVpw=;
        b=CYUrUxJEIPzNCa3uis2QMeeTbE+t1EL7a/DfLjYk8ktk7T6pTwRwN75gkefqwB3xCg
         5DwxT4mw/OJgLDlD2mY+D+7TeR8P/oOANU6FiyxcabZfMamSbqqNRNPLSvNP35GNVKwW
         S7SBm+PAxxYxZKrWj/uk6LOzeqDuPPpQ5+//NUJUKpN7EVRgEG6fSCMrm9tvu6TUarp7
         3MThbYItAHFPG4X+3i51RG3CGRleKOQQj4iO7End04t8of754fWfpLbubJW5avDZ7U9a
         jNBnoC+rZFVl1BAIxHnXo/XfBgBoXXvMhJHSwbaUE9P6bsQfjSF13OJizUasx8hJZWav
         Q5KQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+UXLcJj+CqU/VhW6zhOO4Vohy+mxJFUAkLLoIMMhEjmcg3ftq0+7aXHwEHfs+A21bxBliXYaGfpK4rHp2@lists.linux.dev
X-Gm-Message-State: AOJu0YwPQHW2lgNWbdROGnlX6HtzhiMwqHwGOPLLS26EbEjQfGEfss8f
	+DKU93tEHEd1tCTJQeQiSZBOCHAC/XbU0QRs+lBKTdyGlhy5XeAACxml
X-Gm-Gg: AR+sD11gby8739A7h8JwQgTCI/TiuW5BOaeNDXfgTBdzO11G3L5l01NMkB12UNFQ0yU
	RF44PtQn8pvg0UsvU61gShPf8H/FeTCSyU+h5UOj15RYxitjSi6smONxswFRw5nSOrRmZNYYXr9
	OxU+rmOpdSNT4CujtDXBDeNbrJmFzjC0sp9sgIakRc5Qam2RVpCJ79lGQwkPkS/cZnsXYfGHuvn
	VMF8mz4p5pfJPQl2z+PngamymdcR8P+PrWBPBa1DIqfvMnTaqyML50lPfdY/Us8U1kOlHmpeWxY
	B6u9RcE6KFrzSXTLtDb5K6oHasMAdWJHmHGKo5aKv6zDr50HxmRo1kH538xs+YFXC2GFfptUd/t
	WM+HAhgRsKfIWqKEMqErP3ZvutDsYicWWyrT3xmKVA6sNPlFp2wdtq4wVbDQyRnDvIeB+jFA5BV
	PIG2xyylqIMalWYMA/+8LtD+WhtEuzesojp5unQbPbb5ImLWpngHmDa1nVsWY039k/S6SkrOR90
	xnh0dzT
X-Received: by 2002:a05:651c:b0a:b0:39b:53f:bf64 with SMTP id 38308e7fff4ca-3a1323a68fbmr7660081fa.2.1786720290746;
        Fri, 14 Aug 2026 08:11:30 -0700 (PDT)
Received: from [192.168.243.250] ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a130d204b2sm7138251fa.41.2026.08.14.08.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 08:11:30 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
Date: Fri, 14 Aug 2026 18:10:11 +0300
Subject: [PATCH v4 4/5] staging: media: atomisp: inline the
 var_equal_return*() macros
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-atomisp_remove_hmm-v4-4-c3c954a12b51@gmail.com>
References: <20260814-atomisp_remove_hmm-v4-0-c3c954a12b51@gmail.com>
In-Reply-To: <20260814-atomisp_remove_hmm-v4-0-c3c954a12b51@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, Nikolay Kulikov <nikolayof23@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786720280; l=1906;
 i=nikolayof23@gmail.com; s=20260402; h=from:subject:message-id;
 bh=Av4Txgg7GubX1fn2pw6x+d0xJpGMl6ZoRGhGWtZseLI=;
 b=dE9wd7JjpTCgCPbE5Hj+FvHlcNkTySdIW9izprGGUKKEdgLxzPRdBMizV/HzFcszENHedCJVU
 FQCPt8RmfzpBWyJFa7WIWkO8mSqnnftYgzGe+Yz5iPyhygRothC/ll7
X-Developer-Key: i=nikolayof23@gmail.com; a=ed25519;
 pk=2GWUU1isl5NJpkwSCQ4OG80EinZ3EUZXlrgAg6Pz5zI=

These macros check the passed variables for equality, hiding the 'if'
and 'return' statements; replace them with a standard conditional to
simplify the code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 .../staging/media/atomisp/include/hmm/hmm_common.h   | 20 --------------------
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c       |  6 ++++--
 2 files changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_common.h b/drivers/staging/media/atomisp/include/hmm/hmm_common.h
index c406fe8b1345..029620347302 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_common.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_common.h
@@ -12,25 +12,5 @@
 
 #define	HMM_BO_NAME	"HMM"
 
-/*
- * some common use micros
- */
-#define	var_equal_return(var1, var2, exp, fmt, arg ...)	\
-	do { \
-		if ((var1) == (var2)) { \
-			dev_err(atomisp_dev, \
-			fmt, ## arg); \
-			return exp;\
-		} \
-	} while (0)
-
-#define	var_equal_return_void(var1, var2, fmt, arg ...)	\
-	do { \
-		if ((var1) == (var2)) { \
-			dev_err(atomisp_dev, \
-			fmt, ## arg); \
-			return;\
-		} \
-	} while (0)
 
 #endif
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 46ee077026b3..7d0ef0f9eec8 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -396,8 +396,10 @@ struct hmm_buffer_object *hmm_bo_alloc(struct hmm_bo_device *bdev,
 	}
 
 	root = &bdev->free_rbtree;
-	var_equal_return(hmm_bo_device_inited(bdev), 0, NULL,
-			 "hmm_bo_device not inited yet.\n");
+	if (!hmm_bo_device_inited(bdev)) {
+		dev_err(atomisp_dev, "hmm_bo_device not inited yet.\n");
+		return NULL;
+	}
 
 	if (pgnr == 0) {
 		dev_err(atomisp_dev, "0 size buffer is not allowed.\n");

-- 
2.55.0

