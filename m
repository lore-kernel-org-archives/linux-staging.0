Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519E13A1A21
	for <linux-staging@lists.linux.dev>; Sat,  4 Jul 2026 08:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783153899; cv=none; b=Tap6yLAyKxoUvaVjqvR5ldi5PWsTwkUD8vn9wFzaxzr0cvG4nqLTfLLFKrEwbIFAPwIn7apV+mZVOPcYKWHMggEjTjqOk+Wd4VU9Y3TyuEAkOeAo48CbsE081tu6fwyzhr560etVQJgR8a+n1movbY5Hs7vPDnWDNFoDVgc56y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783153899; c=relaxed/simple;
	bh=IDcWe0Sc23uefwW1HiMKBM3xmZ8nWcKhwHtBhX1Ea6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k7PsjkhhPoRhIz2bNfZwkCw8jKfgTpzltZm/8StsJD8YOQmuj+HydcEY5vxJQLB5sQ9wK1cxDxQXgg3mg8KO9epTGhCDAX8bW99jPepbKoe737JjMomgwq4PYAYwkAVi31/H+A5z0J2MyLbDrkDbF2evdXAgYDkM4ea05c5vano=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjXrZOjF; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjXrZOjF"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-37f816d01e3so1391275a91.2
        for <linux-staging@lists.linux.dev>; Sat, 04 Jul 2026 01:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783153885; x=1783758685; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KudER35PZQPKqHPhc4tPwVxdReZyP68MavvqUny2wC8=;
        b=UjXrZOjFTm/NrctaYwu1oxH3QIBcs1cIQpZEFlEEU979gW9aec4nmAFTQUlgSmpFwa
         zIqgKr+dNMyQ76orAiQChRLOXy80GvDKU5tbH0rL2O7UDkQF2lTyg8mYXMfw3GbacrY3
         4A25lMhUdE1M1OYsudXG66xm8L+5MDnNxozikTLpfD5YgK7yD2iIwQRNtKK3WkcDEpC4
         cFoufn+d4XyNWlINi7XZJH8WyUJoZIMCvcPjhGd5NO50ToGBKFClPz6fYzWoMH8Suwuo
         cATapCu+sHpcQO+tNIoG9YC7lp8LXtfKohOeUQsS4mXbNKkwLLB9cGOOopjyhwvuOJaH
         VCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783153885; x=1783758685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KudER35PZQPKqHPhc4tPwVxdReZyP68MavvqUny2wC8=;
        b=lo8LLqJjjcspe9XKN7IxgHG51hw6sxstBl1oqSKnQBoZpskGGB/LB8E3LhA3JIUtDN
         e2kQ0Z2YZrKmocb1szMH8eKL11HNyC54c6Dr2dIlhucHbeTPl7r5e6BuK7sKRmOC6I48
         WGvNDf75UvoguNelvxahiGXHOdnqsJFIkppxkDEDPwWT174VlGt1DwaGQ1foJ6lPmv34
         zpGkbTrKMMpTCVjqKrejsbIgSNUtBmgWspDggrWrSQXFASVl+BiRg3Rj8rLQ28riziX7
         ef1ev1neE7h2TnJXzBxUPrRrUu07Ay423MBE9WeXYFMg21OBe/dc9N6VSA+FrnojR3nj
         MYQg==
X-Forwarded-Encrypted: i=1; AHgh+RqSUtvl7meTbJ7RWneCF7sok5L4j6q4zgyvhu2Hi1rslmgducvXY/jEoje5N21Yf6SyhCm5XlSD/fF1dDML@lists.linux.dev
X-Gm-Message-State: AOJu0YwjwBzamvJGZuEP7PPC8oeaiUHdMWhO7LYDMEtZ6zYhGArxfOpa
	R6JkyMDFE/uJ+KQhbvDnlrBtNXDBiBqotcVTlP8SJw9NqedvTiFN+BpG
X-Gm-Gg: AfdE7cn0YiWguxuNas+6EoBiT2JOOhmR6DY5fgcFIP/QcHpPqc5pLTT4iHWev6epBv4
	hYQdgWfCLaBoNX/vtE8DHONivSIWcLjcSmfPA0lBoUC8Q4jijxnnVjp6uaHt61VGRdPVgWdI/zW
	s/JtD/kKUeVK4Rq3u5z00D63UIMNW0eBwSDscSoV6A1kREr3OsiDR+mRhevGp/cI7wFMBtXshAe
	sFOqsMTpU4gzUqbm59pu5mQB1ICeRZ77Des7FVoao/WfXEBkf50Mqn+NEoaLXV5B0AobHOAEjnz
	HrBoR6NMZrz4jnbIXhdV6tbrCm1UsXDa20SJBmM5Zx1SS57TsxIEXmR9ulbPEuuxRt+MvnhhMcB
	1DSo6W3sxklnoHKmOtK7PqHWRJmUMnF3je2z3Huo6OKyKiQcA1blELQ0r0eV+xTq9zIPVyFi80l
	HgDxSrUxWK4aQRHsYzuyInmGn74yHUrZ1UZlewk8t9goEvyhmdEI9W
X-Received: by 2002:a17:90b:4a46:b0:37f:f89a:a1e6 with SMTP id 98e67ed59e1d1-3825c50b0aamr3180063a91.0.1783153884951;
        Sat, 04 Jul 2026 01:31:24 -0700 (PDT)
Received: from primary ([223.181.23.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f376bf710sm10074745eec.6.2026.07.04.01.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 01:31:24 -0700 (PDT)
From: Vidhu Sarwal <vidhu.linux@gmail.com>
To: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org
Cc: bingbu.cao@intel.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	kernel-mentees@lists.linuxfoundation.org,
	Vidhu Sarwal <vidhu.linux@gmail.com>
Subject: [PATCH 1/2] staging: media: ipu7: fix pm_runtime refcount leak in ipu7_init_fw_code_region_by_sys()
Date: Sat,  4 Jul 2026 14:00:30 +0530
Message-ID: <20260704083031.8524-2-vidhu.linux@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260704083031.8524-1-vidhu.linux@gmail.com>
References: <20260704083031.8524-1-vidhu.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ipu7_init_fw_code_region_by_sys() calls pm_runtime_get_sync() before
accessing the firmware code region. If resuming the device fails,
pm_runtime_get_sync() leaves the runtime PM usage count incremented,
but the error path returns without dropping the reference.

Use pm_runtime_resume_and_get() instead, which balances the usage count
automatically on failure and avoids the leak.

The ipu6 driver uses pm_runtime_resume_and_get() in the equivalent
location.

Fixes: b7fe4c0019b1 ("media: staging/ipu7: add Intel IPU7 PCI device driver")
Signed-off-by: Vidhu Sarwal <vidhu.linux@gmail.com>
---
 drivers/staging/media/ipu7/ipu7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
index 310e3f24e571..056af3a07507 100644
--- a/drivers/staging/media/ipu7/ipu7.c
+++ b/drivers/staging/media/ipu7/ipu7.c
@@ -2343,7 +2343,7 @@ static int ipu7_init_fw_code_region_by_sys(struct ipu7_bus_device *sys,
 		return ret;
 	}
 
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0) {
 		dev_err(dev, "Failed to get runtime PM\n");
 		return ret;
-- 
2.53.0

