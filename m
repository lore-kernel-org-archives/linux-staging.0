Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB40DDA0
	for <linux-staging@lists.linux.dev>; Sat, 23 Dec 2023 14:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHEszSuv"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6d7750e2265so1447973b3a.3
        for <linux-staging@lists.linux.dev>; Sat, 23 Dec 2023 06:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703340727; x=1703945527; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RcWAiO/J2RUT1lMSrBsyv6HQ++CXdRmemGMqnXk/qZ0=;
        b=LHEszSuvETaE8vQOaOf5jSVz+xpHueJyS+cuBquhl4KV3N/d9J41Rx42YHQDPKRUNk
         vUeBDd4GP7UQJQ1Dh/xy+MuQ+V1EizARiMqzm/04kVtnp9J2DSEJx3yPbBq7ujcd0bPI
         +BArzIvDTFA7X12kmgGOEvqFqkbzEw0XZjdtbZwkaJxlNm4aoUzsbKoB0XzdCMI2Gu0c
         +Xu0MBc3A4iGo0gei/m0bLcTtYAUguMZzzpBErDvh+xksDlCRVxJrEJlZKeDqsgSGDBz
         c1f/mxLfLU5HSLpPrcc/0VgjwpYtbjCsjAnt+GfcNbTH39ooIHPcO3Z78EDqn5lwps/1
         42KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703340727; x=1703945527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RcWAiO/J2RUT1lMSrBsyv6HQ++CXdRmemGMqnXk/qZ0=;
        b=DIS0ACfywdWa/FTJ1a6UQGipunBv1JfzE2uLDRJNitLn+JZR/b/UePBqeiYNMbTPmk
         YINAoeOLyUw7kABRgGEbh9la387QJ1t+D1cwGG61dkA0o/jbUwQpfU3xhC2Y3Kf8Y4UA
         VxgAmWZcCflBdrRZJXe/N0U1k2PAblFiKFuj/3ecWg1kqxwhQKYNBijRzElmYjaRnx2L
         PdC4/Po2sgTrxpiP0NzNP/nGZzVa89sX9dcUj61xzQBJrN2gFLQKzO6+TBK5Rj/w5h/l
         07clHYPOJ7e3+VLdGnjKnwH72ev0B29N4wJUA2O4xerZzhtBa0okLDun64sSLaB9jNwS
         WPOA==
X-Gm-Message-State: AOJu0YwmnpAZSN+O5jhOe/Ec7sLNEKP31y2N7d0y35PcZQtWw6A4TOZQ
	TDtdwKMqvM4qOJJIZplFo5M=
X-Google-Smtp-Source: AGHT+IFYeAJzjCtGqN8pOQ6BiQqvnuF6hC6mBzUQbrAwNGmTM/JKG4w2VvmT8t710VhK8KX2XEIbCg==
X-Received: by 2002:a05:6a20:4c92:b0:18f:cc29:3d9e with SMTP id fq18-20020a056a204c9200b0018fcc293d9emr1513778pzb.119.1703340727582;
        Sat, 23 Dec 2023 06:12:07 -0800 (PST)
Received: from localhost.localdomain ([2400:1a00:b060:2b26:f462:e3d9:c28:4c99])
        by smtp.gmail.com with ESMTPSA id f17-20020aa79d91000000b006d9accac5c4sm260594pfq.35.2023.12.23.06.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Dec 2023 06:12:07 -0800 (PST)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	hpa@redhat.com
Cc: Dipendra Khadka <kdipendra88@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v3] staging: media: atomisp: pci: Fix spelling mistake in ia_css_acc_types.h
Date: Sat, 23 Dec 2023 19:56:57 +0545
Message-Id: <20231223141157.95501-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codespell reported spelling mistakes in
ia_css_acc_types.h as below:

'''
ia_css_acc_types.h:87: cummulative ==> cumulative
ia_css_acc_types.h:411: descibes ==> describes
'''

This patch fixes these spelling mistakes.
Word "cummulative" is changed to "accumulation"
and "descibes" to "describes".

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
v3:
 - Changed "cummulative" to "accumulation" as suggested by Randy.
v2: https://lore.kernel.org/lkml/20231223051108.74711-1-kdipendra88@gmail.com/
 - Previously only corrected spelling  mistake reported by checkpatch.pl.
 - All spelling mistakes reported by codespell are fixed.
v1: https://lore.kernel.org/lkml/20231222200350.2024-1-kdipendra88@gmail.com/

 drivers/staging/media/atomisp/pci/ia_css_acc_types.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
index d6e52b4971d6..f6838a8fc9d5 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
@@ -84,7 +84,7 @@ struct ia_css_blob_info {
 		memory_offsets;  /** offset wrt hdr in bytes */
 	u32 prog_name_offset;  /** offset wrt hdr in bytes */
 	u32 size;			/** Size of blob */
-	u32 padding_size;	/** total cummulative of bytes added due to section alignment */
+	u32 padding_size;	/** total accumulation of bytes added due to section alignment */
 	u32 icache_source;	/** Position of icache in blob */
 	u32 icache_size;	/** Size of icache section */
 	u32 icache_padding;/** bytes added due to icache section alignment */
@@ -408,7 +408,7 @@ struct ia_css_acc_sp {
 };
 
 /* Acceleration firmware descriptor.
-  * This descriptor descibes either SP code (stand-alone), or
+  * This descriptor describes either SP code (stand-alone), or
   * ISP code (a separate pipeline stage).
   */
 struct ia_css_acc_fw_hdr {
-- 
2.39.2 (Apple Git-143)

