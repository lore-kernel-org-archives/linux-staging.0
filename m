Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270AB3B892D
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 15:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776093247; cv=none; b=DrGdsQIO6UaN4+DnINuTLYFLxzetX1477e3KwjAMWS/TfTU7ydg1gORZ5dIb26vCWvYbmBL1GeKZVtN2aNfvZvYnrkLOqjSpMuIH2ccZScR5kBnhza5pZOQRlSlhI2DYIL/mSY7iKxU6ttnlw+Yr0y/xMUdkyWG29b995TK8Sc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776093247; c=relaxed/simple;
	bh=yYSCKjNrdKF6XOjN4pyH1H1y9znVqww72twHt1El/xM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R0qpox8HVk1gg/CYNgoMBMlF8dXlsC+nUdG72MybzZUlh/Wn59t5cp/gauvoqV0tWmmcAKNU92WO1Dj/PpsUzQo3GfQOvl39sTgMJCyY55K7CAbq5a9FA8J3r5V7N5VH3tkb1XbDZrsSjCFr9erDE+84zHr9O/WZCfZbtJNwS9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LPHgJWHQ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LPHgJWHQ"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b8d7f22d405so676818766b.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 08:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776093244; x=1776698044; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PzbmkEy6yhVTosVDtwDWypWhUuRG6XqhGllWTUJpFmI=;
        b=LPHgJWHQnhEc5DO1bEJT4uUmzD1qOkkSu3NVZtMnB0yOE6iRaLnjHW9aw2AahLvWCx
         UGJh0GkGLuqjDV6ToYX2r/XTN6f/ui1+zz/mvpeX2Y1KYAsEzR9fXJBUWoMlL3hhTmOy
         9bpKcE13QnDDkfv0Q0fMzWvUPPB9Wu8U9KW3OwOpXin4Ufv97fEE1wtRA8NThkDAHYlN
         FzGdMi+jBbL+Rq/OB/Ad8h8sjb7fbrWd3ngWfZwmnky/+vPAhR6GBeAzsYuvUijnwkHw
         ilCZwWN2BUf6ULUtS5b34Vg1+bUt342wBh1cQ3SoURWC9s2lblfZFsLK6tw9wcpp79fP
         jt3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776093244; x=1776698044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PzbmkEy6yhVTosVDtwDWypWhUuRG6XqhGllWTUJpFmI=;
        b=gaeBLJ92SOnoKeOWjP11VTvA6MQkXj0tq5OkGQmO82Q8N8JLSdsrBFkXd99NON66VX
         PBtbb1VvpSKbdbkKJnUz5ZbUHZved77QU6xp31LpGeYxhIdl9mPZR52t1K4EpnsOMtzv
         hAInDcRCxGlhI+LHSdQQdh3ZuR4IAQyNoGnTHy2CQTKr26MA3y/z+/e5kJub1ovbU7Am
         LU9ovxygJBHnwN70SIevTfxkQOIs4b7TLFFiltfNkqR5ntP/rWDfxKa5J2yHCtOgcyuo
         kITbk/IpfhaloV28xgsTvB67FkWAhA5kos+UFZWrl+y1tx2D3R4Hr2s/pYlpzV4mxgLK
         q3yA==
X-Gm-Message-State: AOJu0YwuSr4WjT30D79rkBWlQ5JjV0bKt2wDW9Xa9X0uzcf3GQ9XQTOm
	VmnaQk8toAYOtE3+nMYYzZfJipAOO4LriMzdD6Em9tMWrgcQfVhzCcdOEU49xCkwyImoLA==
X-Gm-Gg: AeBDiev7en7Wvk2LeNkWcbl1RKE47IREA8ag7p15tiooXEYSbKrFDhWgleEJCr4jHgz
	hcMVmABBQoSe9ZahF9EU02cCTF7VbrOTSKzKhHW6QWo82Rsmrbpudg1M9RA6f78eu/Ee34HgDYY
	zJD1TVh2iroTvzsLGbv3vdy0mON0reZ+LI3Ee+a7GpvUEqgPHkNcuDrDxiYuYUSpqzaRX+7peXD
	zUUnh1jUu5mmwbWmJcoXFPsLPuZHckJTIHwXYH63K6ccSP8TNm/O6sJPJX28/w40dn42gpXRFP4
	KqzFzNrTFAsrKD1oWEqFkh9np2W8cNnYFe5wN+04Z5YpApJSOfFAySq7sYqujg7hSVfwFw3IJC6
	c2ItKXJco8xqLtueQT9oJfYzrdzNNKKVpxnzcyNm83Xe0MH0z7xHJpN/+hpUt/PRxvnmE9JFTKY
	tAm9x3pBngnlICiKdb1SCmGE9zE1JO2epl1a4Feke6EX7ff46wwQqvJnpUo/9lmBD9QBfwZ/lJI
	O3fWaP8y4dxhDvs4i5irvSvOoBRKNHXmEVEMdx4NR5asf7EXyl67TPm8hCiFI75/O87iHKOTfLb
	Kuw6xg==
X-Received: by 2002:a17:907:3e84:b0:b9b:6581:d8ea with SMTP id a640c23a62f3a-b9d7267a8abmr761820166b.4.1776093243852;
        Mon, 13 Apr 2026 08:14:03 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e5c56dfsm331085766b.37.2026.04.13.08.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 08:14:03 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH v2 2/2] staging: nvec: fix unconditional pm_power_off teardown
Date: Mon, 13 Apr 2026 17:12:36 +0200
Message-ID: <20260413151236.612404-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413151229.612301-1-hossu.alexandru@gmail.com>
References: <20260413151229.612301-1-hossu.alexandru@gmail.com>
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

Fixes: 3f8d52ba1c49 ("staging: nvec: Remove nvec_power module")
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
v2:
 - Drop nvec_power_handle = NULL; after pm_power_off = NULL is set,
   nvec_power_off() is unreachable via pm_power_off, so there is no
   dangling-pointer risk there (Dan Carpenter)

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

