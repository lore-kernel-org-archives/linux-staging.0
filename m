Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11BC399011
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 08:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777277959; cv=none; b=cISn0dtlbMwSzLg+lZcCYA/t5FqGw77gKS7zVzPpPmHdzYv52bGY4ojgwglgfg8psqlPNywR1wslVG0KwogjzLnABWAyxF8uJWPJWaRhuUm3AYSVBCbMPLNfUHYLc9fEdwHwYxNqI7YPp7s1Q/VU/6nFtbN8Xhh8OgPAAihHaGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777277959; c=relaxed/simple;
	bh=kA12S5ceLFq7aTYPKmMulJyt/Aty2VxK8Ge3SmlcZxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EFAceQsURNqiL4a/Zpg2HaW/LRoLL0JOtB3MdbwO1QIqedw6mw+RXda66iL63ptx4MUOxnBOLRwat6aSyqn86Qa0V99y9Ga/aXK0lJwxKgBlBfGI77gcI75OirFSNtpKgD7RBAH5LjFu7yvARh2hzrXa7/0Ni9mbq3soq+IHpNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZrOi1dgp; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZrOi1dgp"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43cf7683a28so6580658f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 01:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777277956; x=1777882756; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BKuYbRG/YW/8TeEIKBYjuEmOZ3fK4A9BxisB2qvbDhg=;
        b=ZrOi1dgpyQgNAEC1zrQnQGt5mulxKgPcsdVL4WMg9sqpND51F6+ye6QD5PpyV6rAT8
         ryRhuawgnGUFq189pXW3QLkXCjS/N6lz3qdEWc6Ah+HETs+H7qv9Pehte5Uqc26Nwves
         xUFZBeNgb/AAnMDICXlXKVPEmcgiLWv//PnXKVfQJaHFllTFQm0cK6UJTvUzvZZ6d/sJ
         /A5lQG4ml8BUvE0/PazVEKwBJqYzyp/jAtNTHan0PQZkZZTaOKWT3OVDCdherPBqRCsj
         xqGC0zH82SSockiEttfK52VlI6HkJkRNJwm15fT5YNPSfGdtr8/7A2EE1cES+Trc2BnY
         KNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777277956; x=1777882756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BKuYbRG/YW/8TeEIKBYjuEmOZ3fK4A9BxisB2qvbDhg=;
        b=gq1U+kIdDAQveiyj2RQ4lbpHRhf/SgkQ23Epr75v8tan+uNXV/X8/TX3fcu0pcfu2K
         khl++NeHXb84RvomMUCsqt+3fGYj4Z0jO2WBo2o8/SlL/Ql0H4+VaHqj5V6AFsHYrIgv
         9XUr0Gu1etS0DbQMhX5snxmC4Y2Tdwl1hmeTqFGdU5YG7e1+KHLBPQTofZlq7rIkOfpC
         RoNIft/3x91enRtTAoSfTCfHFgN66upM0ogSSHJHB7wUF3sLMbLrz0zvwZzCEb6A9VMZ
         JA7TAFRG9KqHBLy219C4QZ+A8rwxhXUhwyw/ru4I+6kLReoqsr6tPqhxo855WifUyfta
         xaAg==
X-Forwarded-Encrypted: i=1; AFNElJ91TT9BKUQ6NlTDn0VIsEh3dz2wMU17BlGrqUmsxZnKHJSUveMx6fUJHEwL/45R4f2z/oL023unVy/bIZBv@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8qtgxS0f3+hh5G1Ja3GaKwMDdiWDINo6hTPjw2KFNUW0926bz
	58UYQrzHejOnLs/t+534hn3E+h9aJgw/yYCXlO6k4ixoeNv24c2sAfi1
X-Gm-Gg: AeBDievOVWqfok0ToOLmCzEDAC76Avwbmp5CUpkJUxKGqLWKmyTEgZCp+6bYnzzdKZ2
	EoleNJlGwOPeDOybeSeYZwQzf6TVGHkM0dyJHtipLIIDn530Jk9y4aHNjvZCP0pbsQXozh6HKRr
	jarTT3Io6eX2Due53mlhuI4qQ+51b45nuJdeS9SX5tjE796vVTHoNZzTKAK0ewT0MiMFkYhHPmj
	JnHLOCfFkidSqY5hh5BBBhxJAwz2VMeouwYfrlYOJckA3mGcsAu2iV0D4DMjh7C1lZoUqQgj2h5
	idAm8CQvss4Vx1lspGUTpFBXcm9pIn8eFYK9b5S9FFZH0lAkAjAcOBQQ0ng2qaXdwnjfSNtnFjj
	EqJBeoPVEbu84M+jQgx5h311+/GNEbU6IfMOM+LMhqK4OTABeGrqVTGnEtaUWNkpXYaaQFzkCUr
	uMqv2cYvxBahzrJSaAkVBnwtNp8RwwK65qUGy81YGaP/TfHC7udTk8lo9FxXjwlRQDThwDHP0Ly
	YBZqRY3RROoQW2IEo/naI6wAuZDP625MDVyzOvsxizLHXV0F3QgZn2OYak5v2SbjQg2s80=
X-Received: by 2002:a05:6000:2dc4:b0:441:37b5:c2f6 with SMTP id ffacd0b85a97d-44137b5c365mr14126935f8f.23.1777277956084;
        Mon, 27 Apr 2026 01:19:16 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc375dsm69920019f8f.14.2026.04.27.01.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 01:19:15 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Cc: marvin24@gmx.de,
	error27@gmail.com,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH v4 2/2] staging: nvec: fix unconditional pm_power_off teardown
Date: Mon, 27 Apr 2026 10:17:13 +0200
Message-ID: <20260427081713.3401874-3-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260427081713.3401874-1-hossu.alexandru@gmail.com>
References: <20260427081713.3401874-1-hossu.alexandru@gmail.com>
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

Reviewed-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
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

