Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE7E37F8DA
	for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 20:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776027172; cv=none; b=NztCCg0JFI9Iw/pShCAL7IgAnc3QiAw+y93H3w6i6Lpi/cFCmU9i8EarSU9SmvmGLTfDzuam1HwzYimJoCCZVmyYpCioxsMvPMBzDnGZ4+QvX+972qV99hC+xpqkvXNY2wII2UYjiYFtBPISYXzK3ML9+tEWL+05gZ6c/04YZw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776027172; c=relaxed/simple;
	bh=V3bsKhIGaACHg6eM2xcGs/HQit58c7w+q2E2j1CAkeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OliD1Iwa58KBHaJHiKb0AIGSVcS0my0L2dlRnPvx1aJPNbJnyzBTmR1nVYA1O25FQAjFtbvmtT0zlwEcOjYMaJWUJUhrIArlXw6+hNbUlvbubfhLFpAXC7R+UY19iltaLyj0VtoWK/CswKV4HyIoGzRlac0J7e4DFJjI8jKGiKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L8hMQZ1k; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L8hMQZ1k"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9825ba7e8dso532079566b.3
        for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 13:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776027169; x=1776631969; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZsyBN8eqgGgLu6vT6sEQv8tzWdzbqq6eDTPaal4nWic=;
        b=L8hMQZ1kcllg7DHZBYRx1L6hT8A1Bn06Yq5xWwDjFztUfzS6IaLrYp8b2mJWuqCY1E
         ssR0VdW62kvDD/s9y6xAhlI013cMktdRcV1WQNILOZdWnQBZP9ClGx5Uy7A5sieGWhXK
         GekeYthRMm4F6T18IsOmaPpoCeoyLRWXehXFPwUcFUGzMQeWxDMcr0ljitBcboJEChRA
         VCUevk2rJ0xpldn+gfPqN+CjbwufxH2R3XzHm5iYb1QddLz0FGuM+D3HeQpMOL/nzIfI
         mcayw7sBnKrqqHqNMl/PnOMejg0dqo3PR39qrokbhoG0+oRkyjsB7CCdspeJF0cUaYD6
         FoCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776027169; x=1776631969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZsyBN8eqgGgLu6vT6sEQv8tzWdzbqq6eDTPaal4nWic=;
        b=Ko0urJsnLo5P7sob1kS7v3C5LQ9XfHN0rRJQntlbMnAWj/sOuZMYGMZ7f9TtbBiISv
         sAMtztdbWJfBS+LH6uDNm8iMRXNnJ7cZkm3c5e9kjUcxLXGqZ1CrzMSHBZAovZBeqpYd
         hU0so6XT66lB7heWXjJFU+s82VTrWjBx/5Do9ycM14PGurhqkJEQItiM+5DZtWfVM5zt
         +rhvVeavtSqq/ywqUc67PiwGHaGQg6dYjuytLVRSzfFT7ukeWtJJBzpXH9oYz5f8cjf1
         5lZcVEpgn0+OprLLKlGTvdBKdPsI6SOWBfKm/fXdexztWprUvVSfACjc61k3R1K7EvBP
         MvtA==
X-Forwarded-Encrypted: i=1; AFNElJ/g9ruUvU9bA2kXLvIWf2BnpPJexov7tOUK8aXD2Kfx/3DD3C6ZNUfum8YDnTO+tjnXsAsuRKkEv+8q5oz5@lists.linux.dev
X-Gm-Message-State: AOJu0YzwcAPgOTqqHvId9Y8HxDwv7Db7Ga148P43skI9ysHYtgu98uaN
	tD0TwpXm5C1HJYTp+s2erQPoLlWMi/lF8DBGxrvTCFETJs/5KAexC2qE
X-Gm-Gg: AeBDies9m2OdL9w70bdEgzTtSRiR0NaitRyWJZ54lMgtRpijy4nT4JsJ9CQQfvt7HfB
	oO91ASIrPqV5Fn5RUOfBiUOwweOOLSmQ0/rwDt4udyiockNObal8UtESa4vrujbyvSrotmaVTqu
	5gTIyizOTHmTdclNbZKeYxR3TdL45W0TNyyMLJ++EYSyDOvSaRX1bE/FPlLM1u8Z1m0PouYSYsl
	iRk0GR/cuhEdb3nPXxMmlxqzLpN0nf4mGx5kVvJkh5cHCZe52LQ3waiq4ze47PukdjUn3qN64A2
	9TuA5goR0Yp6AcKdWNn0m2fHTMYlNXaUx+3Sz1hCqiDENfebY61n2Ekzi6trAcpxoguIwPgECfB
	SIddDtQtXNqub6EJKJmbcOITDJfgu3rhNeYogB8WkVjEqKmtt6jdg1dZ2nVdcCYozBD0o49mu87
	SGppf90XyA/lL/V8ZD2i4MrTEInvFhorJ7BF4/gLaxkbDRK9pT6Yn+uKn+jnZll25SnrCRqy1/e
	CdJ59CcuGkFf3K+il/Qjy0I58SRwmLiV2oLa5iLT5bCRrENZENgQwiHPOAEfJcC3UHlzasPJY43
	QJv97Q==
X-Received: by 2002:a17:907:a603:b0:b97:c5e2:d7c9 with SMTP id a640c23a62f3a-b9d729bd51dmr596748166b.44.1776027168505;
        Sun, 12 Apr 2026 13:52:48 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd78f6sm263126266b.26.2026.04.12.13.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 13:52:47 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: linux-tegra@vger.kernel.org
Cc: marvin24@gmx.de,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH 4/5] staging: nvec: fix pm_power_off teardown in tegra_nvec_remove()
Date: Sun, 12 Apr 2026 22:51:17 +0200
Message-ID: <20260412205117.387125-2-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260412205117.387125-1-hossu.alexandru@gmail.com>
References: <20260412205117.387125-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The remove() function unconditionally sets pm_power_off to NULL regardless
of whether this driver instance was the one that set it. There is even a
FIXME comment acknowledging this. Additionally, nvec_power_handle is never
cleared on removal, leaving a dangling pointer to freed device data.

Fix both issues: check that pm_power_off still points to nvec_power_off
before clearing it, and also clear nvec_power_handle at the same time.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/nvec/nvec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 75877038847f..9fe9b7a3491d 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -907,8 +907,10 @@ static void tegra_nvec_remove(struct platform_device *pdev)
 	nvec_unregister_notifier(nvec, &nvec->nvec_status_notifier);
 	cancel_work_sync(&nvec->rx_work);
 	cancel_work_sync(&nvec->tx_work);
-	/* FIXME: needs check whether nvec is responsible for power off */
-	pm_power_off = NULL;
+	if (pm_power_off == nvec_power_off) {
+		pm_power_off = NULL;
+		nvec_power_handle = NULL;
+	}
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.53.0

