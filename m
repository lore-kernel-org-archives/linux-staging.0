Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2106A42050
	for <linux-staging@lists.linux.dev>; Sun,  6 Sep 2026 13:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788700599; cv=none; b=QNTOet1kgBxsLFT20nfhf8OSo+4IHU7oAViXuuOFU93TLLPRj9xfzmjJCbrGeTYDGvVcdu9P9cfhYdEg+LSsGGDbPB6dKxofVo0ycmJQsi0wYtsL8qfxCKE4Dkxq4EVwD0rtMMDT35S1i+HJzIhaGAHrNNJCFLlpu6jwL38jWD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788700599; c=relaxed/simple;
	bh=E/IRwFRn51f4v9NPGY7W25i+STprd8eEIq1SkiAi3xA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VXhScWkerA1wxItrrCuGhaFLzXvWyG45rLBA0A3+G5YHSp3TgEe5UHz8tFMfsIYexZJlC4/o6CCQnRqWeeni0eqshIHtQZEqPKIrpw79YFYpVe7OBlnx03g211PK1d4mFDCw6IcbQZcpIbaKR4u6Np+FN71MMHsd5K9FhB7pQ9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qIYKbyTi; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qIYKbyTi"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso1888594b3a.0
        for <linux-staging@lists.linux.dev>; Sun, 06 Sep 2026 06:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788700597; x=1789305397; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rKCDTYeop/ZfF12Fo5a4rL8gHC3JidNUko0dh/DrcS0=;
        b=qIYKbyTildWAWOwEQn66e7d81e3Gcxu2K5lc04RDdVhlXxe94jyosH3jP6dY8HVzaB
         21rinqfv20HdwtJMv9Uwx0SfF/CY8Tlv50nds4GaxKwAxCUt6t9nS2iMFhXiuWTYOo00
         mkuUzHhqePAP5Ti6AUV0B9yt9Ih9OPiQDkZVSkWu3VbWAJdteq8933xH5cEZhTIw05Bu
         rQnfhdALdiC1Qo4cQ9gV99gqklDtrVqbHkER86vGvd3+0BCv0K6GN2RSStF4oSmlgxjl
         Zduj2+tbI85tKa2Gyx5KvNuVjg2DrEKxtMp1LBINMogS0jPF99CVyahmHdNCnXhRB7yA
         j0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788700597; x=1789305397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rKCDTYeop/ZfF12Fo5a4rL8gHC3JidNUko0dh/DrcS0=;
        b=kgxdNaBPgcPzkw5A+0EmMD0ksZCREL6CCP68doHau61jr5Z2D7NwXrW8eoJr7gFLHF
         itsoXy1buthuj/oHqWbSmZvFRrZsmASxc9QryoNE2dGpswGTaoaBivBcVSG9Tl6VWOps
         QcbZNRLU5jMgZxA8oEOBQEjeWfxNBalor6zdYKv7miq1WqZy+TZjY1Wfi7PhI2VvXkKg
         WYy4EgeaG80LLXJnjsbzP1LfSCeruTQCubxndsXaIe+XKFZtTtRvHxwWuJLlAJ+yWZ5I
         mEGE6D+2ePB/KnCctBQ8fbzclVN2V24HoJBDfRsXtRvdI+wX6Xlsu5LTtvkAs77dciEl
         f7Ew==
X-Forwarded-Encrypted: i=1; AKwUvBzaxJIgMrg8PJod4xlTlhooAPPmRMNYOIIPbvjNdsV24Y/HGAKNxmfXLsQlrozGUK5u2kBmNX3wjBzwA0LJ@lists.linux.dev
X-Gm-Message-State: AFuF++kKy8DOSBXRa7CVMYfrrSfkgTWjVOkLDv84gxA+9COJltmxm9ia
	LaNk6nFtVgIy636x6+l9udW9LCFXsjYQwRiPELosn6ldgAYjAsCguAEW
X-Gm-Gg: AYBFou1zwUgAVGx/ygvlelppZ+Ty2Q8pSJe8JDUctFO88phJYRlOgdvEgMdn+j/kZR/
	uuJKrjAk3PrZQLKHPumLCOL9y0Lc8F43ZAb7vE/ncFc3Vpp+YiNfBsre0FN28qemKtuiVyoy2ii
	1x6ZHKaALiADXCzSSL/S6OtqXA4DNCPxF9WpreQwpUVGSB1B/m0RqyF1jzswCJ6X6de1fvadv4M
	Jq7jgWDd3dVTnoMcBRuZitVHnvJgFV3/+55LKWik6KjOMKnuMk1DBkycBssn0jbaPggSZ5F0rOL
	5+eqfT9CTXQMotQ1eab2M3J+JCmKRQHaMoIrTasHsGTt3xsEnEAVnzKu4uxaPm05Yy87Zz7CHJ7
	G6wwgX+8awnB3/FKLRszQjzQ5FrLKcsW+B2+REjSxXfDz9Z9uz53/Nd6wt7n8HMo/i+Cw6sweXp
	jPyJkj7UggwVb7KB0bSnW6W6Ry3wrwDqLqWJSr4BJif/oLiafTdvsyfoihxj1CYyKDZissGUOnR
	oc+2La4arSAVTpkfTEQ50MbwbUKBxfzQiAW5fc=
X-Received: by 2002:a05:6a00:4145:b0:857:7384:b5f6 with SMTP id d2e1a72fcca58-8616908212emr25491708b3a.18.1788700597408;
        Sun, 06 Sep 2026 06:16:37 -0700 (PDT)
Received: from DESKTOP-PKFJL56.localdomain (36-234-53-90.dynamic-ip.hinet.net. [36.234.53.90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86153728c37sm3292257b3a.46.2026.09.06.06.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 06:16:36 -0700 (PDT)
From: Hank Yang <s950343@gmail.com>
To: marvin24@gmx.de
Cc: gregkh@linuxfoundation.org,
	ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Hank Yang <s950343@gmail.com>
Subject: [PATCH] staging: nvec: fix race between power-off callback and driver removal
Date: Sun,  6 Sep 2026 21:15:29 +0800
Message-ID: <20260906131529.11422-1-s950343@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_nvec_remove() checks pm_power_off against nvec_power_off and
then clears it in two separate steps:

	if (pm_power_off == nvec_power_off)
		pm_power_off = NULL;

If a shutdown is triggered between the check and the clear, the
system's power-off path can call nvec_power_off() while
tegra_nvec_remove() is concurrently tearing down the device (freeing
resources via mfd_remove_devices(), cancel_work_sync(), etc.),
leading to a use-after-free on nvec_power_handle.

Use cmpxchg() to make the check-and-clear atomic, closing this race
window.

Compile-tested (ARM, tegra_defconfig) only; I don't have access to
Tegra Paz00 hardware to test this at runtime.

Assisted-by: Claude:claude-sonnet-5

Signed-off-by: Hank Yang <s950343@gmail.com>
---
 drivers/staging/nvec/nvec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 41cbdfdc1da6..b9ebfdf46002 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -906,8 +906,7 @@ static void tegra_nvec_remove(struct platform_device *pdev)
 	nvec_unregister_notifier(nvec, &nvec->nvec_status_notifier);
 	cancel_work_sync(&nvec->rx_work);
 	cancel_work_sync(&nvec->tx_work);
-	if (pm_power_off == nvec_power_off)
-		pm_power_off = NULL;
+	cmpxchg(&pm_power_off, nvec_power_off, NULL);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.43.0

