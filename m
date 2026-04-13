Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D222288CB
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 20:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776110614; cv=none; b=cIGW1XcV7yWVWvxOR/PALN7kl025tE2vZdHwvFD7fl+urPSpzMT4K9/u9244LSn3LvBxu6B//IzjquLq6EalwgTky0ndFQtyci3FwVk1puHXDjeVufk3W2cXiccVmkZtrKs6dsnGO1yPp2wk6aWTps0Kf99CDAdBEdLqcjO7Lyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776110614; c=relaxed/simple;
	bh=RK80ZR7zAHH9D/WmR/NT9hIJNikhZi7aebHrs+pDa/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qHCiUGM3/+WQXuThZpkJuUJ92/mZD8egfVZIKluRqPA5KI4+2HKedjxyoZdgY/1mrvgUnC6lL+L8CrIfML20uRl2Z5fD826u/hk2UQI0sZtzUzUKCg38PTj4VwtJEWjM9NBCD9sPtiOOWE534RlTMo4XHHIBWKif0v47Pz1LL7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtzWd3gg; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtzWd3gg"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8d7f22d405so727325666b.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 13:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776110612; x=1776715412; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNtc76u4jCO4flvAdHAjEbdUTCZm4fC6HRp33lJMzlE=;
        b=QtzWd3gg8QfGPyBrvH+wAcVISEN5QtMIYGWX3ROSMvQIMrq2fkmNA0IwCOeTak7BiQ
         5aN17pBHBQK+D3enL2IQrCCEtIwj2WSBfW08ADeVwM2lIzWLUcqhPWsEFLYFK3Rz/Jen
         yVJKMovT1taUxXU9b5oDgzogsBhXQoKLObTDnsUHN4cJFgeG2xw/Ahz+GF4qxnUvFz6b
         3HXd6h0WDh8p6T8uePfkyobeF1LO0VV7NIiX1StwdmgXi7JrfAO0gNpNg1QkqGno7Jtt
         701fRumxLAcrLQu90RonV4UM1rBUNc7soyPQhGp3CJKTL7s3V7ZPP0IZ2gvfjCyyEHQC
         hBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776110612; x=1776715412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fNtc76u4jCO4flvAdHAjEbdUTCZm4fC6HRp33lJMzlE=;
        b=UYzexFqpwjmv2cdLGmpyVP3bcm0GHnmfwulxDfWuNymim8ym9zXmW1YxqpG1BIGnSn
         LQegsLXkselfHosiZ8nescpp6miLlq7gyo2noy032lzIeZMwKU1ZgykrR9XqSAuCimNq
         yjTyfxy4vp1S++myrdV1tNaa1aMz/SxD4LdyCi+dmvk8LTvlCasugrcoGvP0q5kCl0Ng
         bq3msDGeQsq2uS95CHQVVy2FdJgviLW5dXhI0JLElah/ajOTms75XwHkvxSL71SabGLq
         M5byLE3DWPeG9b3Robz3BEZ/pcrgYKMsDjOxEmZx7eeJVsPg7+qs/Zr3jyG/iHGTPFuh
         dn7Q==
X-Gm-Message-State: AOJu0YyskrG8x9pu1vptQ5L8obt/jxYlHFfOLpFIP/jptdCITujpIW8A
	6duCeJiRD0RMVROYkMcDWYXczQV4gZ14iGWrIRTi+Yej//qHSdTUj26/JninMaaznIABLw==
X-Gm-Gg: AeBDietFVgX7JWHG8vrD/IsX7BGiSo+yKH8oQyTNKOcJjd5fnGt6uuCQoVMURIxlGVq
	KbC42quqHYWz5PRhDX6CzeGDmB5KGTMAauMjlPrRk7wTAWyXU1V0n16HT5tRj3GCpbZFN4Wyv+l
	keBlhmDwT6njxTRLlF3+86nbglJJiRBcasGCw2zx8poyZ8aHkCgJeJ1KHp0PlJZ0ZWS0cJ4x2nN
	tdNWpbGgBEdgCRfoq/nHemB9du3MyQtB+W0KSa7XY7teD+x+Q24YzOPtrA68apRuely0YgPh3Q7
	akawiqPDFpsGyyBBCYlwiXVoq1iTkNMTu2fkcJwkelEZIgnzTd/PugsdGfyZGRtf5mXUqatxn7/
	gRq4eertNiA6WY0Z9tRLMdZkIAstZIzzvDGS+F/zXqFuMVRclR6gqxGkqh1LHnNGgdDcB2h1aHr
	tcrYBdXXMhHFRuK12trtziQo8qqI8iC+l6/cbv55nkH51cFtVWQbhXZ9Kzg4bmKSC7CJA2sJEtD
	ADLmf0t/k5/19l7/DSbp37abs1EYaS7XUyBYmhMv29FQk+gLtjZZLepjFAWt5JhnBXvbxGkcWE4
	jA21jg==
X-Received: by 2002:a17:907:c80e:b0:b96:f863:deba with SMTP id a640c23a62f3a-b9d7298089dmr856237066b.32.1776110611361;
        Mon, 13 Apr 2026 13:03:31 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd76b8sm339842166b.20.2026.04.13.13.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 13:03:30 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	linux-tegra@vger.kernel.org,
	marvin24@gmx.de,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH v3] staging: nvec: fix unconditional pm_power_off teardown
Date: Mon, 13 Apr 2026 22:02:03 +0200
Message-ID: <20260413200203.726726-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413151236.612404-1-hossu.alexandru@gmail.com>
References: <20260413151236.612404-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_nvec_remove() unconditionally sets pm_power_off = NULL, even if
nvec was not the one that registered it. This breaks any other driver
that may have set pm_power_off to its own handler.

Replace the unconditional assignment with a guarded check so that
pm_power_off is only cleared if nvec was the one that set it.

Also remove the stale FIXME comment, as the guard addresses exactly
what it was asking for.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
v3:
 - Drop incorrect Fixes tag

v2:
 - Drop nvec_power_handle = NULL; after pm_power_off is cleared,
   nvec_power_off() is unreachable via pm_power_off so there is no
   dangling-pointer risk (Dan Carpenter)

 drivers/staging/nvec/nvec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 2a3499dd4d63..88c416ee0381 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -906,8 +906,8 @@ static void tegra_nvec_remove(struct platform_device *pdev)
 	nvec_unregister_notifier(nvec, &nvec->nvec_status_notifier);
 	cancel_work_sync(&nvec->rx_work);
 	cancel_work_sync(&nvec->tx_work);
-	/* FIXME: needs check whether nvec is responsible for power off */
-	pm_power_off = NULL;
+	if (pm_power_off == nvec_power_off)
+		pm_power_off = NULL;
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.53.0

