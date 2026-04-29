Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1883933F390
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 17:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777485377; cv=none; b=YTOkf/+D57VDdCZut7lISPqxvOxuyEdno1TRgdZyn8r6ElVIzBwGVyQxf4fXIA9p6bYgX1D+EkCQwJpqJXlgqsGSyE9/C7s2Ocu5UlrlYMheVnlcvmZm8llfN41nhbftLnXJQzjG7X/vwb9ZjdOzVIvlMC3Qhv48jnxhZnyKyCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777485377; c=relaxed/simple;
	bh=GXDy2EPWSVIeOj61/oWjBf0bAkD5nNMFZ37O68A7Nfc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iTJZv1Z4tDgD4uje3VCM0nsRk5LvVK0GOm2wwetl/Vo/MlM7jxQI+WX9g5jxyAA2IIY5FrvFpnSc49mSOGK7i6KCLjtOMORwc/LagSDaj3h84/UmAvEni6nBoU00XbkI2kD5UWgmSn13b9dlGLWTIWQiTWPT6L9QNfJulR6/NfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LzgDiH5T; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LzgDiH5T"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8acb856a674so1291086d6.0
        for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 10:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777485375; x=1778090175; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2cs6IAugrzoJGGoa8oOAhhUyVMrU1DfkZ5ti3ubmr9E=;
        b=LzgDiH5TdEDPcU7Eu/w+nICiLsaUCIYzbPyjKBwcqbWNhr3wVXz2V0MAWrqAYajD7V
         M2Nly6UtFUAHgqA89EvbxU11YA7yzc796TBooWGAntCfIaoENkrdlHmvGwfXG85ukxAZ
         3L3hb2dP4BqFojV2C0Gef+LQpLhON+GMSYrcC4eflEKJoEmmdsNN0OKL3OdFvuodcRpq
         +m+JJrNQVm83G63YMJ7OSrNUZObMOtvfUPqZGv1WN4YeiSOc3bHsa5YdAzuPv4VxA78m
         TeE6j3uEf08knrsa8Q/u0wYD0Fcrkk3cXf9cyRAUeW6HeBfw8dcqC8FAWUOgrXaFOxax
         1l1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777485375; x=1778090175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cs6IAugrzoJGGoa8oOAhhUyVMrU1DfkZ5ti3ubmr9E=;
        b=aFHRJK1VJeEYupXlCVwB6k265NkDdjDsEA1nmeBaFz5BO64QUNweALTvfo7fBc82sK
         DUy0ouHHBV+HLpdD7Bhd51uPd7j5wbJ5/I2n+YOSdWBU286HQEl+SoBWp649Z9NWnB1I
         C2DTq0rAAfZjFW3usMJF+8+ohkPdPJEPgzqgXcSMwftB3ebP9c2dExq8DP2lBX92fX2x
         0x8BkuQZseog2oNU/KEGzsIleqC2myEQZWUG+uX1BDJ+yXmu8pM10ccves10jU7vmxQr
         z/VmJW07UH9Kitt34SJcpIwyMG6BgCmLaRR5FFTeM5bhGxmj7TknaCzq7F6TjZAq6zzo
         ZrTA==
X-Forwarded-Encrypted: i=1; AFNElJ84DT742EHsNBCFMYIX8TT6lazpYniNWT7BiXESfTsIS0cByxFtEDgtYp+2NHwoMW6ibz8pCNXrvr3PAVKH@lists.linux.dev
X-Gm-Message-State: AOJu0YzpmGoRUSxA9eqc0MmX+3tMFnVIcXmAn+msMi4g4vFQDD7B184F
	+WAzanZmCwDT+miP2EpC2Kmx9FYxa+MjNzaQkbNNaM2Q4Bh0xV8tLXSJ
X-Gm-Gg: AeBDiesMYmIcGyywXcLxS/9yWmklRFySoWaDOXnE8kz7xQv8GRzw9f8zDV0YfGFN/zY
	DjNMMuZ1WjnbjpzYFoPpf9fp48NC69L48tu0jkBI6M3b94tkJb+8i5APb4HgTJ/KipA0BeBdDuu
	oPIqQDoUmlodHneoI/7wjB+Y3sUR1GZHeunyRR9qgYrSE6npWuhXHveA8+ukQDZEnWZb0PJ5nIs
	+GUE5rmsUR5t49Q3mH20s0IpSu9Q6ValO28nrxaiUbXGcPyn4ptvX7DySf/p+b5dHhVdY8yN0v+
	VBUX0hFQuJodZGbo1/v34R+hkT9gZS5WjIntLGRG4URCCJUhjGP0JFw7zk6f2azTVOiGvMDYk4Q
	U5EVJhZAmlwxPqM75HdfG3kZ6nyGHxd20FbYWpqaCDhKvb+PeXihgnDKw63PeGNqA9gLak1OqM5
	5OYO094pVZ+JA3i4Joo6T6gqxN27Hzm/f9wUfCyqG4+F3Z6TecFrtalXR8FEXYQniSv/bxd/AQc
	FmIv9k=
X-Received: by 2002:a05:6214:3007:b0:8ac:aa89:6bb0 with SMTP id 6a1803df08f44-8b3ee990841mr57214366d6.11.1777485374954;
        Wed, 29 Apr 2026 10:56:14 -0700 (PDT)
Received: from House.mynetworksettings.com ([2600:4040:2afb:6400:cdc9:3f29:858c:a856])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ef8422a4sm29658796d6.41.2026.04.29.10.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 10:56:14 -0700 (PDT)
From: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	andy@kernel.org
Cc: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Subject: [PATCH] staging: media: sh_css_mmu: fix typo in sh_css_mmu.c
Date: Wed, 29 Apr 2026 13:55:09 -0400
Message-Id: <20260429175509.6306-1-mahamaryamjavaid@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling mistake: Suppres -> Suppress

Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mmu.c b/drivers/staging/media/atomisp/pci/sh_css_mmu.c
index f2a84c1d6e52..f2838e40617a 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mmu.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mmu.c
@@ -25,7 +25,7 @@ ia_css_mmu_invalidate_cache(void)
 	if (sh_css_sp_is_running()) {
 		HIVE_ADDR_ia_css_dmaproxy_sp_invalidate_tlb = fw->info.sp.invalidate_tlb;
 
-		(void)HIVE_ADDR_ia_css_dmaproxy_sp_invalidate_tlb; /* Suppres warnings in CRUN */
+		(void)HIVE_ADDR_ia_css_dmaproxy_sp_invalidate_tlb; /* Suppress warnings in CRUN */
 
 		sp_dmem_store_uint32(SP0_ID,
 				     (unsigned int)sp_address_of(ia_css_dmaproxy_sp_invalidate_tlb),
-- 
2.34.1

