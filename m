Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097193;
	b=VsG4jxNr+a+SgNDv9rsxIIpKt1Snq+HTUyU8VXtl0bbl8UoB3DhLizdOWbCOMzsPZl/R
	 qe2LNCYRT5Azuj2qEIcXtE/kJNZDCJDhBSJDbrOuF/v2f5VVVXehT6BmlEukWvNS5oFTa
	 6DtMq8eNwIotJxKtiVyUEzsBDz6SN+p4/ykLnMNrfsPwTZEOtoszc691XvvYqXCQrPK6Q
	 tweHmH8clQKiPJTRTfJU+GMNI6T0hR8mcu4HDTvcKcG2bk4coK6EVCq/o9xlGhc2SSloT
	 UzbkfW0ShsZGKVK4/34s2EjYmuEydBJlHz9ufky96Ia661e0/WAVLZ6JyeUJe51FqVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097193;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=sp4rvbDM8GISTutprCtHpY1FubOH5yKlYsRY2NVBflw=;
	b=uC6aF3/qZKKK6M4t7E0B5oGAe2+QXKp8leplb9mNzy0n3aOvv3tFXLllNRoKyu4ZXBRg
	 VIYK1AxatLZePQ1XFmvLgS8VMi92Fc+FD8HZk9BXNudt/AJflRGUXakCyHipvsMNCeZkf
	 HdfUkDOeHvulcKsb4mjnbacRUrOD8y96Nkp0OGGXlaDSy+Fnrdr0xpzc5g13JWiGc8cqe
	 5CM+TUHM6RtE8/POsd+KUwY5vRxGChpgt14nFa48C9bk9lZeEFcGZXddoenrnjVzsr6RH
	 CPQzW7WkIbGI5YJzx6dvqFTZ+bmm9/QiA2LrkUOreLFQKhSSkiLJup362iuK1A1nIXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=UeT1tk7M;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D6B606A324
	for <linux-staging@lists.linux.dev>; Thu, 19 Nov 2026 14:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02D6B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=UeT1tk7M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=sp
	4rvbDM8GISTutprCtHpY1FubOH5yKlYsRY2NVBflw=; b=UeT1tk7MLiS3d2L2nk
	8A+cvM4gZLWGGtVZpFm0i0QG8OnnRpvbYTZFQ9kYxfyjDkulA1FLT+ZMvjyJrigl
	+mT7HD91I7U+ziIOZWBOAcqmSCINdRA43JQnR6QWlIPCq+4GwV0r1qzsQ36c44cS
	sLCzUAMIWzyYeJkvfNHJx7BjY=
Received: from Ubuntu26.04LTS (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDnb6hdAv9qLxZ+Gw--.50288S3;
	Thu, 19 Nov 2026 22:06:22 +0800 (CST)
From: Jiaqi Shi <shijiaqi_develop@163.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiaqi Shi <shijiaqi_develop@163.com>
Subject: [PATCH 1/3] staging: sm750fb: remove unused MHZ macro
Date: Thu, 19 Nov 2026 22:06:18 +0800
Message-ID: <20261119140620.169368-2-shijiaqi_develop@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119140620.169368-1-shijiaqi_develop@163.com>
References: <20261119140620.169368-1-shijiaqi_develop@163.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgDnb6hdAv9qLxZ+Gw--.50288S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjTR-BMAUUUUU
X-CM-SenderInfo: xvklyxpdtlsvxhyhz0rs6rljoofrz/xtbCzh4yhWr-Al44eQAA3v

The MHZ(x) macro has no users in the driver. Remove it.

Signed-off-by: Jiaqi Shi <shijiaqi_develop@163.com>
---
 drivers/staging/sm750fb/sm750.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index fd1cf9eb5797..7511fab2e0e3 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -5,8 +5,6 @@
 
 #define FB_ACCEL_SMI 0xab
 
-#define MHZ(x) ((x) * 1000000)
-
 #define DEFAULT_SM750_CHIP_CLOCK	290
 #define DEFAULT_SM750LE_CHIP_CLOCK	333
 #ifndef SM750LE_REVISION_ID
-- 
2.53.0

