Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1D61D0DE9
	for <linux-staging@lists.linux.dev>; Sat, 14 Sep 2024 18:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726339788; cv=none; b=uZNL9aNYJPE5QM+k+Ztu9mASyBn7Irxf6DEC5q3T5KVjohzWbQh9HhMMUgv4lDTeag3mMJ5uJPOhJvikFnHKCh0ZiPX1zL3mi09vcXvqrlAcAys1R0UGvxxNyQEZtIGrzRQIEulA0IQo532IXafC2Y3RrSSmA9qyBzTv92ku8k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726339788; c=relaxed/simple;
	bh=e70E5Y91Jsny0whAyhew+r/g5VGp2qLMl59bQCj571w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nqw1vM8ha1r09pt1pxWYUqjT6jDa+hEjU3ZAbwzQP/ExzkcbSUUeXtBOQOTOu3F6un4E4Q5DZgkrOt33n8xbBpklG0H0DTBvx78SfUj0NcoLzi+aCmOQ+o3S8yfIM9zayqKnDMRWO8h59YSPB42hkYzYTdzJwFI+9PpruTMnyik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gpgsMiP/; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gpgsMiP/"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2d87a0bfaa7so1738867a91.2
        for <linux-staging@lists.linux.dev>; Sat, 14 Sep 2024 11:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726339786; x=1726944586; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TRV/D2yysUbqRudO1eZM7UervZe3Msap6RU661L548E=;
        b=gpgsMiP/58V95YAQEsILyMpvBDUhsVmdQz1KfHdqM7FeFoMuZ+gat4cZAeInhLLPl5
         FRIinhikmRMm/yRHjmf/A/fkshJ7KItzmW99QiusQBVn5DBC0eGSOwYzZ8vA97XouqxQ
         FyrFLbdWvfnDNCw2GhC3oOrazgQGF1jlKhf/g1jeOYOsRFd6J58v5gzDDphJ9XdiWTXK
         c0tO+hRTiK4X8FfGXuU0ERuVRITQVeH4lQlfKTbs6+7LeQqDtpb+zA2UuNJ9J4Ku8CY6
         jec6BcvG92GyBq6b6U2t62xpNkaAvld0heF3/P3665R56+37DqKArIJJzAOWOAXOvmYH
         7InQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726339786; x=1726944586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRV/D2yysUbqRudO1eZM7UervZe3Msap6RU661L548E=;
        b=Z3U5NxqSqN/eP2DeH8cNsWOM/HK/LN0yBWJOVCKYgpMemOJB9g3kij9i67rHB9yQ18
         iqa1+6G82cdEoxk/mE2zOnXoR/N7JLDf094vMEEadlSQY+B9KSNL9FpRXmcOu3eXUZOr
         UOIEOj438Y7yqx0Q5qPYJMFFZLqwQY5W59LS59snOObGlgXxM4xANN+s30YkT2hjA2xt
         gR/nYF19vZ08NXOQadl1gplJktiYS/wCi39HotNYTwlEj+Sf/UXFjX25UQNR3D7Jy6u6
         SqFxrrO95nHDevnP4yZ9IJXaRmk/PXopxOwl42gTLxn9MyxWiPN/3EGduSqXr8tKkz0x
         zw+Q==
X-Gm-Message-State: AOJu0YyHtH0kHPNdKw313FrLkEh4fp990h2RicSB84tvd1MD87zjJ3c+
	kBmY2+IgSq1Lodp56r+4w0znLzYJvyFk1XrdOEcSRfwMtWroZXnzl/WccCv5F4w=
X-Google-Smtp-Source: AGHT+IGG089sKirYuMOIPyg9jQWpJLf2jAJ1DKymjs53A5OLIf65r9pHbmzVbYI/wDkgKwg6PEo74A==
X-Received: by 2002:a17:90b:1c06:b0:2c9:1012:b323 with SMTP id 98e67ed59e1d1-2dbb9f3c96amr8589484a91.27.1726339786061;
        Sat, 14 Sep 2024 11:49:46 -0700 (PDT)
Received: from embed-PC.. ([106.222.229.152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dbb9d5c9dcsm3998170a91.43.2024.09.14.11.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 11:49:45 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v3] staging: octeon: Use new initialization api for tasklet
Date: Sun, 15 Sep 2024 00:19:35 +0530
Message-Id: <20240914184935.848999-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the new api DECLARE_TASKLET instead of DECLARE_TASKLET_OLD
introduced in commit 12cc923f1ccc ("tasklet: Introduce new
initialization API").

This change updates the tasklet initialization
process without introducing any functional changes,
ensuring the code aligns with the new API.

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
Changes in v3:
- Rephrased the commit message with the reason for the change.
Changes in v2:
- Fix build errors caused by initial[v1] patch submission.
- Update the cvm_oct_tx_do_cleanup function to accept a
  struct tasklet_struct * argument, required by the new API.
[v1]: https://lore.kernel.org/all/20240912172231.369566-1-abhishektamboli9@gmail.com/
[v2]: https://lore.kernel.org/all/20240913191734.805815-1-abhishektamboli9@gmail.com/

 drivers/staging/octeon/ethernet-tx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-tx.c b/drivers/staging/octeon/ethernet-tx.c
index bbf33b88bb7c..261f8dbdc382 100644
--- a/drivers/staging/octeon/ethernet-tx.c
+++ b/drivers/staging/octeon/ethernet-tx.c
@@ -40,8 +40,8 @@
 #define GET_SKBUFF_QOS(skb) 0
 #endif

-static void cvm_oct_tx_do_cleanup(unsigned long arg);
-static DECLARE_TASKLET_OLD(cvm_oct_tx_cleanup_tasklet, cvm_oct_tx_do_cleanup);
+static void cvm_oct_tx_do_cleanup(struct tasklet_struct *clean);
+static DECLARE_TASKLET(cvm_oct_tx_cleanup_tasklet, cvm_oct_tx_do_cleanup);

 /* Maximum number of SKBs to try to free per xmit packet. */
 #define MAX_SKB_TO_FREE (MAX_OUT_QUEUE_DEPTH * 2)
@@ -670,7 +670,7 @@ void cvm_oct_tx_shutdown_dev(struct net_device *dev)
 	}
 }

-static void cvm_oct_tx_do_cleanup(unsigned long arg)
+static void cvm_oct_tx_do_cleanup(struct tasklet_struct *clean)
 {
 	int port;

--
2.34.1

