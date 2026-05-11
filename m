Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7263AEF47
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 08:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486709; cv=none; b=VpnpIsYz/MPY0DyUOd32N+kznPsEe06eFasmh7X577bzKv0pqoSK8BWEMqfAyxO+pq7fLIBMiXfLIaXE7RxB1oDqo0TNnwgrWrejgPJKxHjKQjUt0NYGvF6nwj1usylX5TgE9RV9QlFbaFmtdlnQoWiDDfLIqJkvMN8yw485GEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486709; c=relaxed/simple;
	bh=6btdOh+Ymx7Fi9eWqoZ84Ho2X5z8MxyWov7Fg7VFicY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wr0q6mLVKBaLUpi1osUXr1JOzG/be6LtUIUzHon5hrlEAw1SCuHO8xw+nuva0xGbcKl9eSwoqSxHz9gIJfGGEFr4VFVuxkfOgwDTcHiVhSYt5WWe9X0JHaAdAQmMtp83Kbcmne7equm4F+t3hRVM9nQhjPTZ2wpzXhhunZe5sO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sjthF005; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sjthF005"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3660daea6a5so2000273a91.1
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 01:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778486690; x=1779091490; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vWzotrNiXDN2iHUoDxZ3LVF5cdMQ1a/bQT63YdR/f5k=;
        b=sjthF0057c6AeIf71/+9xW8rtKvZ14Ocld9fKPGOIfmEwwfTYn7ZsZeBrt7ujWQKiu
         UCkwtoddysHfn24thFZ16zI+GCH3oXRO/OpBIFpKz5B7+yVvl+oJz9aPcSpcvVSWuT+M
         zebMpnBa/p1Ts2+ihT40jzfaTW3DHGiLrTRPSgQwiuW4gx+ox0O4pxh1iPW4U5Oco5Zo
         4GwdB5WwbF30VT7YqF2M/tE5HqWTQPOaRR+FCfmgbpPnZUv85XUr8YdRNFxrGvWElsCn
         h6VWTWcQXGIxGDsEdU2z+QjAZeIJ2TBKLI46Cqa/WdObgobIQDD4FIfzYR6gflYExgNh
         RDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778486690; x=1779091490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vWzotrNiXDN2iHUoDxZ3LVF5cdMQ1a/bQT63YdR/f5k=;
        b=C8bdYTPh/pNxD0a9TsNuT7Iaz4UkOq1gONeh4PFVBN+274L4S2TmWXWkgBbvSjJC8j
         BmL6qAQ3qMDfU+ZkmAumkpNjtewwgqlOq7q99KNXBqQCX5F/qQETwZW/MPWjawdPAHbT
         CHJtQ5ZBO8C1m6bVabsD2SI+QeFzYuh9A6cGyJKVvOsj5JtA6F6AcjsY+gn+uW010r3r
         6MOL57qKGCvQJgRIV/g/am53Q90AGnbfAfq0z38R5b7+yk/0fkRPzkKW5JSfdlKTC4mr
         /qbt0GUYv+4wjpm6W9xUcq9DtjSnMGpl6SFA7ZUzosBWP8hcNj7FFjuFjd6oVs8hhLf9
         RjQQ==
X-Forwarded-Encrypted: i=1; AFNElJ/tjKonSe4GNgFFYRus8hjnh05NXrStIwBE6wTlpicyfEUxSJfcgDaM2Qjo+7+NuKtt63cUtxlX8baNY6nO@lists.linux.dev
X-Gm-Message-State: AOJu0YxVwMftSXfPlnCxC02qlb1KRMLvzC3CHug3a4+5GkoLu5KkGU7P
	amqm6nMFouqYYNFUZDV8Hnr+QgCXiZJqs9txfBFGoHG05y9aCEPjWWlU
X-Gm-Gg: Acq92OGINpNna3Noa+lAQrpYV1rwzlZgSQgVlf9aXNfGzVyn+ExR4+d7grCy2IIl8p/
	4CkYBKpQb2MZczb9iBGjSyIlm21xR/JyoWcb/eX2t/w3MyIE8xBsu0eZhR1bahAkHJJrEs1vMS/
	feVWYg/6PgWejQv56WAjrT49/iISIwQvjlMrb4i8t6jcWTN/aAHp930WgLQs0dOowSStIid/Sm1
	/xS6fmDKlIn1pLW+JBJaqS9py3Sa2BUuZWdw/FVzR23Ku81CSH2e0fEffr/EY3is1FE4ribMi31
	ede02hq6vxze+vk2XrHPhawcv6lltVGuS6TX1ISBIWi2LG2ITjy2d5LFBXB7X8n6FdPNrqngtcQ
	tIAXVYjjyguBW425Q3b5X7036fvbtYnT65QKV23ffFuQS/niXm+NC7Z1pLB9Igvvz4WL91w/O6k
	8bgqpOsFqsPRtZNMGp2w9ROaL9YGYj+oEicx93YIlI
X-Received: by 2002:a17:90b:2f03:b0:35f:c5cd:cc5 with SMTP id 98e67ed59e1d1-365ac76afffmr23482547a91.24.1778486690096;
        Mon, 11 May 2026 01:04:50 -0700 (PDT)
Received: from MAHADEV.localdomain ([103.211.132.226])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d687bedesm8565787a91.16.2026.05.11.01.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:04:49 -0700 (PDT)
From: Harshit Shaw <shawharshit116@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Harshit Shaw <shawharshit116@gmail.com>
Subject: [PATCH] staging: vme_user: fix lines exceeding 80 characters in vme_tsi148.c
Date: Mon, 11 May 2026 08:04:39 +0000
Message-ID: <20260511080439.3390-1-shawharshit116@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wrap two dev_err() calls that exceeded the 80 character
line limit as reported by checkpatch.pl.

No functional change.

Signed-off-by: Harshit Shaw <shawharshit116@gmail.com>
---
 drivers/staging/vme_user/vme_tsi148.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
index 4cf3486646ce..0e8a67fbf562 100644
--- a/drivers/staging/vme_user/vme_tsi148.c
+++ b/drivers/staging/vme_user/vme_tsi148.c
@@ -755,7 +755,8 @@ static int tsi148_alloc_resource(struct vme_master_resource *image,
 					size, 0x10000, PCIBIOS_MIN_MEM,
 					0, NULL, NULL);
 	if (retval) {
-		dev_err(tsi148_bridge->parent, "Failed to allocate mem resource for window %d size 0x%lx start 0x%lx\n",
+		dev_err(tsi148_bridge->parent,
+			"Failed to allocate mem resource for window %d size 0x%lx start 0x%lx\n",
 			image->number, (unsigned long)size,
 			(unsigned long)image->bus_resource.start);
 		goto err_resource;
@@ -2252,7 +2253,8 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct vme_lm_resource *lm;
 
 	if (geoid >= VME_MAX_SLOTS) {
-		dev_err(&pdev->dev, "VME geographical address must be between 0 and %d (exclusive), but got %d\n",
+		dev_err(&pdev->dev,
+			"VME geographical address must be between 0 and %d (exclusive), but got %d\n",
 			VME_MAX_SLOTS, geoid);
 		return -EINVAL;
 	}
-- 
2.53.0

