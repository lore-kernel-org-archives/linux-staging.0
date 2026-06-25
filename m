Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0A23CF02E
	for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 10:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782383466; cv=none; b=P8AkXb9EvxQL6+nyOTmKbdxAA1toQpcc6TaPpVbBEeNGHPfVimgixTkNUeuzYGytwTvGDm3MsgrlQPBZxDop/1+aEb4TWKLJgJCQJ9FsHnEqMbgwgUHbJ5eKea+avWw2Kk3rnBEJ7pqla8C7nEvy6iwiE4bXL1eYwGRgSYCjT0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782383466; c=relaxed/simple;
	bh=MC81b1n8cWE023+2RKmMuPWPjQOWGqTfXMyWCkJ8a/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KWRdwU+BPejbjdXHNbccCwNaH1speXH2cycaiHWhtf1oFVpvfWcuyCQAS2JL/TG+wNJF7w23vjnpnNlRmjFzSw//ZQzgW19M6xQmR4PImhu+Usghg+EVrqDrCXV7fJuUGGlouD4Ml/pyt7m68BIBJasUnl5VSrtqU8nambyVPO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r923K3o3; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r923K3o3"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30c09f29b64so627864eec.0
        for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 03:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782383465; x=1782988265; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TKJsVWDIVCaWALiuCSmxIi+GmrzYP0RWrh9s3UMN5KM=;
        b=r923K3o3KJcvrHaHevn1Gnz18Y+D5NZ/zlIZWahkuFDH9r2aoub3mUA2+eZAr8uiI7
         NdqmVA+wFc/TaqoD91d+YX0UfjhsOvXHY8C/pai2/y5rZp4SczMmnz6Gyyn5exoMDZGY
         pF20NSpCfx+QUL0Px1cG4iZeaZHk/3B1bQ/Dt12mUub8qqmsoV30ytJGlZN6RVbgnNyZ
         Gb8F91GpQBm/BIA3r65RWNsH2DubHdbIGSHqSjwHtwI58bBUySIDfUxo6G65fzXs85WZ
         Z2dTD4mxg99isxvgbou/9nS/4wnqou2OmLjb5Q6CzBihwUgrXbahMr1SxRo5d/IdURMs
         FwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782383465; x=1782988265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TKJsVWDIVCaWALiuCSmxIi+GmrzYP0RWrh9s3UMN5KM=;
        b=XaOliV2t/zArhIyh/PZLlrxFtviMH9Oz5TgeijYa2UbryxKXeEd2aIhiAKBv7vPzMP
         ZhRbYBo1ZPtLq65EkRa15kRYqe9cYyFa4OQwyGBffbZ/acZz7BjlqTvxF4/8S+iEtdH3
         g/6FKL4seYHDxMi/C2dUcnvtoGhKmUg2JLWp50hGseGVaiNQdH/tjfwdNWCK5lveEs+i
         yvmzORuFH5Bhfu5aNZzHV5I894+Iq3k5c8cZ7dhWv1Dr2zy4HmaGlEHtm3V5wO/Rqd+6
         kFuGpHYHDWG5CQszjhurgeJnj79iEBtTxG7NPxWJ7L3k/YP8drASBJNPIKeLFpb0qMYw
         dK0Q==
X-Forwarded-Encrypted: i=1; AHgh+RpNIKClVdEsYw68fqDb7DsrQmzpY2WMZPPP+jSTUQKEzNA60iHJzBulwfWRYoZA2xowNiAi3+5Oq8GeMr/3@lists.linux.dev
X-Gm-Message-State: AOJu0YzhGLGPzBnVZ1JxkngthEtS1a7yLBo9j7yJNbOUxnmNvNl4zGBN
	DVXpJUxkLJv6NqYiaNe5bsHBSd7vICbUxu9AShbx2vSJnpTlSe+noLap
X-Gm-Gg: AfdE7ckzTvCrahRZxV4FL2tg+jQTdfnYuN1x5rgH7sucCDvdeLU+j5BVd9SPPv8smrj
	GLMSQ9PQddQebWIrZpOYGcxD9SHl0UTVxhNV4nM662ZxkAVVRtFiR7muY4ibHA+xUy/iXHpTGJE
	EX0JQ5u40VgRYo4WJRIlhcsIpwhwSlgP7sDMD5TlE/eLmZV61i4jnVVm9kwQ2v6vcD8LJ7s9Rfv
	Dlso6XzEW6u2pHA0rK/qZlWIOtKlxdxsN1DDDTUYgu0c6T+3LnDGveLr3afq6TgrInRDp2edg+z
	UgtRP6sK/SMKuBZevl8cNjf35CRZhIATRspnj/JYJAdi1njkBKsvceMZulhZ1VyhwNIsjDeSKE2
	Xemtfy41Ua2YJCWVQ/k0/emXsTLyVbzBuSd1/pawiNxcR+4LkhUbbpgSQA+y8mEBIkf8UFPWn7l
	6XGuGiojzOz1kDWUqFcrxiVIIMTFvM+01/mA==
X-Received: by 2002:a05:7300:a485:b0:30b:8878:9c8e with SMTP id 5a478bee46e88-30c85468412mr1914301eec.2.1782383464754;
        Thu, 25 Jun 2026 03:31:04 -0700 (PDT)
Received: from 10-86-27-11.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7ca5e601sm7458658eec.25.2026.06.25.03.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:31:04 -0700 (PDT)
From: suryasaimadhu <suryasaimadhu369@gmail.com>
To: andy@kernel.org
Cc: gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	suryasaimadhu <suryasaimadhu369@gmail.com>
Subject: [PATCH] staging: fbtft: fix unaligned access and buffer size when startbyte is used
Date: Thu, 25 Jun 2026 18:30:41 +0800
Message-ID: <20260625103041.281190-1-suryasaimadhu369@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When par->startbyte is non-zero, buf is advanced by one byte creating
an unaligned pointer for 16-bit types (u16, __be16). Dereferencing this
unaligned pointer can cause a kernel panic on strict-alignment
architectures.

Fix by using put_unaligned() instead of direct pointer dereference.

Also fix incorrect buffer size calculation in fbtft_write_buf_dc() call:
  len * (sizeof(data_type) + offset)  /* wrong: multiplies offset by len */
  len * sizeof(data_type) + offset    /* correct: one startbyte +
                                         len items */

Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 2169f8d1d..cfcf4d7e7 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -4,6 +4,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/spi/spi.h>
 #include "fbtft.h"
+#include <linux/unaligned.h>
 
 /*****************************************************************************
  *
@@ -40,7 +41,7 @@ void func(struct fbtft_par *par, int len, ...)                                \
 		offset = 1;                                                   \
 	}                                                                     \
 									      \
-	*buf = modifier((data_type)va_arg(args, unsigned int));               \
+	put_unaligned(modifier((data_type)va_arg(args, unsigned int)), buf);  \
 	ret = fbtft_write_buf_dc(par, par->buf, sizeof(data_type) + offset,   \
 				 0);                                          \
 	if (ret < 0)							      \
@@ -52,11 +53,13 @@ void func(struct fbtft_par *par, int len, ...)                                \
 									      \
 	if (len) {                                                            \
 		i = len;                                                      \
-		while (i--)						      \
-			*buf++ = modifier((data_type)va_arg(args,             \
-							    unsigned int));   \
+		while (i--) {                                                 \
+			put_unaligned(modifier((data_type)va_arg(args,        \
+					       unsigned int)), buf);          \
+			buf++;                                                \
+		}                                                             \
 		fbtft_write_buf_dc(par, par->buf,			      \
-				   len * (sizeof(data_type) + offset), 1);    \
+				   len * sizeof(data_type) + offset, 1);      \
 	}                                                                     \
 out:									      \
 	va_end(args);                                                         \
-- 
2.47.3

