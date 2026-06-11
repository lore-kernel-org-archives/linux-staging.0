Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B219F36DA1B
	for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 07:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781163986; cv=none; b=AwWfUKzz7+NxUs2rp/IvG6i9Y8FUMQ0wQijCKcETZkRRw58FnNFGPAUKqX08HvPoeCVqtqNvicpKfbt3U56dHJYkaVbXkNh/x8bPY1cxF5nMblPGIlkx70SkKGcHYQJOgbyPwvvVP4PfsPX7wgixg68ohzVq0/9rR2Opi32BsS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781163986; c=relaxed/simple;
	bh=5lwxE1eiQ8BdMzV1W3JSnu+vT9WqfqvAXh+SRR0c6ns=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=smxBgm7Q8/Kjlkrw4munjC6hoeslEruuZ2XGuxxEs3aNSAjy7s+EIgI2MKyCD9MRhEKDRxLcs3hmlKcxhMpqHuJ+lYtptJHUgXSESiYB28E/NIsUo2J3RDyqUs0X1BB0O6R4y9zSHlp6yb/6mIznMp+PdOwIpwBGrk3RnHsHpMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PEhv5wJU; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PEhv5wJU"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84237a0fd84so265740b3a.2
        for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 00:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781163983; x=1781768783; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lc700vchgjw3eA+L9PLOMFS3yoggGFBOrwECyM3kaKw=;
        b=PEhv5wJU5AYfrelIw+Lk4GuP1GIboRZzVgAMRG7FR17wKD8rsxbpp60mqQzjYENGCh
         yl31S6aviLbaQ2q7wwKdjzsZBXhOTp/zGINWlGpEM+uSCjo5O0bWKz4j//0MIfs4RXzI
         iZ1H3H70vVVzTobM8DEdFoOSsORXnJUBJpN91LozQp+kUHGjJcrXeO/L+Klh8df09WI2
         pBPXgLkEH4GCJrpdof7UjM2W+tyKwTQDT8yG/9C7YJ4lxvnc7TI+EKMqMl3wgW68SH1G
         rcF8si6xNS7uoVUOAxb3+Wkz/fZ2RvjVR4Olth4u8sR8IRO5LHQWi6dT5PEoTzoUyGc4
         5S3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781163983; x=1781768783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lc700vchgjw3eA+L9PLOMFS3yoggGFBOrwECyM3kaKw=;
        b=mUIfi8S2z6GAgzq3QOl8B6V4uDcI0THu02C0Aoz1Dt79aR9xgCs9hB4+FhnEU0y4fi
         V/0ES3j7J0wwDgaf26NmCGBsBYHoWseSC8WfBsDV1dvdsP1TMggeAtmuozuVeM5KG+Jt
         /EO7AftQNfpANsa3pJ96/mr7q7oBXRSOakqC9OlwRZKyiYHuCPP4LUlayUaNOSbDELfS
         ovw7BExuQS9BRkqSDMCYjdwRNApMCKKNc0r+G/pjoVUMgfnWrisCqhVSccWrFAYGqdWX
         ZjSJ4h6B8nOLEUHqZWI2sPxcslss4FtBCzdG2O6I9jWFUhXM7+YByPsYsGdkpLL0R75C
         IpUQ==
X-Forwarded-Encrypted: i=1; AFNElJ+9dRazc8k36uU4RAP4Aljl7daJwDawP5xew8K2WJI471L77D/c4PyXjZfHBHrK7z0hKZw1HuDciqY3HBVw@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+3Gillnmznzd6QLBKmPpTkx6+Uu6PaICfSyoM4MiN7s7GzUsk
	KM5MlnH76yZ3nkOTQmbMq3Vy/dtB2fgGaFB6xiRzhH4rk+5GrhoTm+Yg
X-Gm-Gg: Acq92OHvf+DkM+TIxAxMKfdUwXrUQidWeebuVhTbeELe1wmJHKSN/Yfbj1waDZT7zIn
	WeNDYrMcf+/QnrZ9a9GTPXAn4aNgW10kE0ssdAiXz+pHV5MZ7+/FsiyQKnL7vMA0cO5Xgh51L/h
	3KpR5nuF2/eo3LDGgmMI6ESSQCSbTApKCArZytz1Txxc4gOjgMdX2VEl+AtwDpDwf3g6eTSU10x
	G8Umh05fBS1hJkcsSpIf3cFwCiN7vR1PVYRWmgz2Vd2poV+1bmso1sP4v+eXsxre08O/D4UCl+L
	RjjaZSyTnTY2ozU5UkvKrwKpkj2nIDBGYFlxGFj9oSoZ4bfGFB8tBXzASbFWtsJjDaJ8mx7KwYm
	a3nM698z49X8+oYp3tuV2/gjGSyZNOZJcY+Q0VgkA9AhtjStNcJPGZKjQShmxf7NmP5blpwKhsf
	nNFCp+fCm6z8qO6DWL9MtovOCVG/qVE0qO5qfclg==
X-Received: by 2002:a05:6a00:12c5:b0:82f:99c5:868d with SMTP id d2e1a72fcca58-84336a51af2mr1013368b3a.4.1781163983093;
        Thu, 11 Jun 2026 00:46:23 -0700 (PDT)
Received: from chenyou.. ([140.116.226.142])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337b916cesm1318446b3a.8.2026.06.11.00.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 00:46:22 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrei Khomenkov <khomenkov@mailbox.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unused netdev format/arg macros
Date: Thu, 11 Jun 2026 15:46:13 +0800
Message-ID: <20260611074613.1550984-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NDEV_ARG, FUNC_NDEV_FMT and FUNC_NDEV_ARG are defined but never
used anywhere in the driver. Remove them.

This also fixes a checkpatch error:
ERROR: Macros with complex values should be enclosed in parentheses

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 drivers/staging/rtl8723bs/include/osdep_service_linux.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_service_linux.h b/drivers/staging/rtl8723bs/include/osdep_service_linux.h
index 2ec54f9e1..c8274da94 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service_linux.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service_linux.h
@@ -98,10 +98,7 @@ static inline void rtw_netif_stop_queue(struct net_device *pnetdev)
 
 #define rtw_signal_process(pid, sig) kill_pid(find_vpid((pid)), (sig), 1)
 
-#define NDEV_ARG(ndev) ndev->name
 #define ADPT_ARG(adapter) adapter->pnetdev->name
-#define FUNC_NDEV_FMT "%s(%s)"
-#define FUNC_NDEV_ARG(ndev) __func__, ndev->name
 #define FUNC_ADPT_FMT "%s(%s)"
 #define FUNC_ADPT_ARG(adapter) __func__, adapter->pnetdev->name
 
-- 
2.43.0

