Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD00839FD4
	for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 00:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775952187; cv=none; b=K8u41KvRr+anKf1/SWQvAKOO6XtUQCMuf/XsfAzHGyhUWcROzovwmEE7f30siB+GI0S45YBrx8ly069boNwrzU+dCDzPpHzF3Nz0t1fCRNZfswUIu3yjdwwwFZVru9RmOHsCwf2lDSGbu659k1BT+mZH8P2yXMCnObytyT22mBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775952187; c=relaxed/simple;
	bh=H//2RBqD3WBB5ha0Q2X9zhRNzK+9XRRvdFwiR+MPoFE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RcPFQiZ8ZKHI6JzeTupNPQhCC54/qEWFAxOcIHFOlbEHivg+rm8+0Pf2y7Y9uGX7dZBtB6fjQWlA0wpr2csfYVmLgNWorabmklw0/I8uDM2/t69JvfZfhHdAJ6oYHRppyqP6smZ1zyb/00+BhZ6cCbFVfBZu9Kq+jhuK6pVu6Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kNKR3/iv; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kNKR3/iv"
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-126ea4b77adso11330584c88.1
        for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 17:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775952185; x=1776556985; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mVmZj6L7AHZTeBNmui9Ed1IC2BesOOnfHMRwlcLz8TM=;
        b=kNKR3/ivgHJS7sevGTVqNZhqWYTlEF6a/7zo0rd3HmWxK6bXCmsr2LKN874fFVTTe8
         SsQbbdIJ7qwPZDTuKv8ENRqmRAbOx9j1TqIxt6fqHVrmQdj4VQdgcrXbV2hHTwTf4gn9
         z4XMcPmWcc6QNFV6sBZDYCrmcTlEXmTtyc0zHzSPscA8eCc6jTgMo20j58+dkMoTyHTw
         a+wvNSvmH2E31SJzInPFTAD0eqZYlRCxpDxQNiLcyBsWSw1tzr9qeT0GVMaq3nOTpVh5
         QmE7w08jFSf7teTMKPkLG2lT2fZpeCoADO4MFfIMcJDhMafYDEsovKlOZX4tbx405sG8
         ASSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775952185; x=1776556985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVmZj6L7AHZTeBNmui9Ed1IC2BesOOnfHMRwlcLz8TM=;
        b=PXFon7QyvPOtmtdMPHQzBEUD/8/bHea7nzoZ3WGJKhtrxO5kpAF4lNd8BInI5RA/aE
         c5vMFwxKHYUUmLEyyqwVMOnEj+lhZOMjynqCNBXMdSbPKS8zzNbQOhfro0ROnai6xNW8
         ynIapchgupuJnIeIc3KMJwnQBgsvIar4PL642FejkK2Vx4idTrVfWlvG0avC2qKjqWm+
         2sUvoEeiO052AghfBi5fUkFG/LdV1+aWCRpM+Z+RUD5Cr/zP9wWBYc0NAFXiDLqasBkH
         erAHPeAQX8gn+2F0wpRM96E4eMj5Ng84UDvS5+Y2+jzdAxDo9al0bdf9JDELfuAndJUk
         LJMg==
X-Forwarded-Encrypted: i=1; AJvYcCW3t/AaHsLv4MAE+3dgLHq6NjwGTxDfp/0vLUHpcvNaUokt7c4Vg61hAtUOxXe1Thy66GRaizR/suNSiyq7@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2P1gdQYKiq30su9qQ6gN4uH8zrTnEe6jnAZU4ympMvcBu+SGG
	n6g+ZJ8EqyCGeoRzm1N32YgzXwfPKHsOgOtddCThvkz+cUssfa/tcEP6
X-Gm-Gg: AeBDiev2pLUi70+yaJ828SA8wrbhbPECLWkDSzv9vm/+Z1BgaZ7rFZmxEUBWrESEAL7
	nKqDm9ah1jp08Z7PlJodTHNvy2pqKwCIbeoUoDf/voPxTMECdcBTp2YEuENHlkJYTQx1WgHG2l7
	aZlT04Q0pxl+9u+5XD0wqx+A5+DL4twazlPFWup53S0bqxOdMllGuP6/H4eHwvPUCvdQ2E4H/3n
	qlISE/h77okV+ie8tmNGreGaXZmBziijxgHiGXi8ToEREWtGTk1brg+i33FpUNkBFG27TWJsLCW
	4yb87itC5DKak2Yaq6caW9RH4DMGTRJYpYh8CIDx4npqOqYvH1vD90jSTK1+NDGXrGp77JyUpnV
	oKR+nRHyQQPlKRhch1HZo/OYCTJ0UQBwqVklHw/Qy6IxhLpqOBzNnRGflfA1pARTO5mlY+Az7LA
	40C9xeBuiljcKnnZUJuA6adKlT/WfX2vFwkicWx4Mw5Qbpq0ZegLdAAkg=
X-Received: by 2002:a05:7022:23a8:b0:119:e56c:18b3 with SMTP id a92af1059eb24-12c34eeb7b9mr4215099c88.27.1775952184827;
        Sat, 11 Apr 2026 17:03:04 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c3459f7ffsm8609844c88.3.2026.04.11.17.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 17:03:04 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] media: tegra-video: vi: fix invalid u32 return value in format lookup
Date: Sun, 12 Apr 2026 00:02:45 +0000
Message-Id: <20260412000245.26696-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_get_format_fourcc_by_idx() returns a u32 but uses -EINVAL
to signal an out-of-bounds index. This results in a large unsigned
value being returned, which may be interpreted as a valid fourcc.

Return 0 instead to indicate an invalid format.

Callers assign the return value directly to pixelformat, so returning
an error code encoded in u32 is unsafe.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 9c0b38585d63..966792a6ec19 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -81,7 +81,7 @@ static u32 tegra_get_format_fourcc_by_idx(struct tegra_vi *vi,
 					  unsigned int index)
 {
 	if (index >= vi->soc->nformats)
-		return -EINVAL;
+		return 0;
 
 	return vi->soc->video_formats[index].fourcc;
 }
-- 
2.34.1

