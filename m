Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BB4137775
	for <linux-staging@lists.linux.dev>; Sun,  9 Feb 2025 20:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739132281; cv=none; b=TDNyj28d25tnmt8RNo9zjrBAnN8Z7gCJWtZORxgBPY0VX92oqvoAnp9HNJVKRD4Z7/ymeqGV1tDGVWHTY/PneaB0QqtUSQOS67FTL2t8W0kEQreYL/SxLAbjByul/GuOvIjHFg8KYNgkNye0b/vOQZ44TTRyP/BYcOrN+UNGlDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739132281; c=relaxed/simple;
	bh=AQ6odMwswQpR/gW2O4CgljqqZuGXpqAtDTGJzvxVEog=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q03pBJ/1WApsU2wh+C1P+nwEi+v+p+/g5j1g0TFtrDnbGh6VG3/PSW8rdBzWbh8OgbgAM2Q8/BXQ3ZWFZmID4Qq2poIvYRyh0Bk5cpCYN82YB5SiWGXYUuMU8PxnMRnkOeee0LX27JiZohuqQTtmo3JFbuotjGClTqlMNelZSrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+rinUCo; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+rinUCo"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4394036c0efso2505395e9.2
        for <linux-staging@lists.linux.dev>; Sun, 09 Feb 2025 12:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739132276; x=1739737076; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dQ3FI5My26wmUFNBpTndGOfq2Fc/AOh4z7kKeSSxtxg=;
        b=i+rinUCoiBx9/Xym/JWz2j8ozn72Wb93d/ptXlceQrgwTidAeRiTHRYcl0ihHSUQa+
         IgCa+qEqOHTJlvSgnCMLHn+Einnvir9/r6F+UbEQ61X6BZ0DpjFsruXMV6L44qyf2t6S
         uo+dCiEJi1igPo+rKLGldqfmVAcWUzNHNp/uQAn/fU3xZuJxSfAY6FsLtKSp4hUKEyWK
         QlqbMU4R4ac8LA5raLiF+WNUXPHQPo+vrOGTDu7rjIWQIRMkBlrL1xhR17xPfbMVvz6U
         ggTfT/ZT3fYWQnk7X/ZCR1TdYat72dyx+3tWCOD8OnPVUPIIQFr4a9pydUuymeylyrMK
         kStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739132276; x=1739737076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQ3FI5My26wmUFNBpTndGOfq2Fc/AOh4z7kKeSSxtxg=;
        b=c60sIfI7ZdC1/Kr9It26W1T2R3q4OSB12DdEn8KKyL0nfE12pdKKCfNSI0bE2R2x+c
         XL5TghJhZx4fncfKWxIpqn+9s5Gg057jfhMdjndveftSfCZg1UjQ83d2sUgOtIWtMFeL
         x1UCRXEgiWDgGn30ObfuRj6f3IQWJbcRACRa1vNQ2C9EZvcKcPDw3ul10ttzsfYuKhQi
         8DMmbB3J/xM08Kv/tcOOdt6c+KFF4TonGqddU+DEoR1vyIGEpLS3uUUJCbMZn1IOsnOx
         3mzFTsgSr7aKh4S74K/zOuNtNFsbTFIIegwre/n9E0sbRAFngC1/i+SlT0Yhys1CX40b
         EA+w==
X-Forwarded-Encrypted: i=1; AJvYcCWlQKmecQycGtd8oNB0tqTZnJ9UxyCMDqkNCoBk7qnB7tZy2xtIDmA3l/K0F7VwbIKmD9A0aA+zqJ0Ib8Wt@lists.linux.dev
X-Gm-Message-State: AOJu0YwPiwhiBwhO8zC/qq9gc0t41arvBpEqkPufEUP3Ffn8C//8z0ba
	BDjmp6r8D0ilgsBV4cVZvJvdIrbJHEHzuU+OZ5MKDQ52NUqhX+BU
X-Gm-Gg: ASbGnctnum3h3gFw41ZZg016xF2KmB3fom75RvOfKG2iXk2G6CR8ksQMuDLVBV2ajrz
	asSMusqxj1MNiN8Lxd+1PFw/n3Uw50ucCwzM7PDkTXRqh1DSXBXZUQVNsEhfOPQeu+9ChR/9qb+
	PpaW/6l0AR8WsWBrY4GbEjeGs8Nkn18fZVI05N7qCXcssjue2+6jMEuVWP6YLpIuvODc7oDw95B
	s4sArMrJizg+gAyjKSiXZ3WcXxgXhskfzlKXk6cCTC1uzITTLqvqY8KUKBTpgyg14YkiRftOIUQ
	DP7RFyT3
X-Google-Smtp-Source: AGHT+IHEvCUgNCNgyOULla4EZmbXGcZ8ZSLL0zoyT1eX4sE+csy5GJlA5rQ1umLzw4s8iGEoZTjXeg==
X-Received: by 2002:a05:600c:3b20:b0:434:fec5:4ef5 with SMTP id 5b1f17b1804b1-4392498fe53mr89889705e9.14.1739132276364;
        Sun, 09 Feb 2025 12:17:56 -0800 (PST)
Received: from arch.. ([2a01:e0a:5eb:2a40:2ac5:d2ff:febd:46f1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfc8881sm122153605e9.28.2025.02.09.12.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 12:17:56 -0800 (PST)
From: Dima Volkovsk <s0ldw3ll@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org,
	ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dima Volkovsk <s0ldw3ll@gmail.com>
Subject: [PATCH] Staging: nvec: Fix pm_power_off reset condition in tegra_nvec_remove
Date: Sun,  9 Feb 2025 21:16:48 +0100
Message-ID: <20250209201752.66313-1-s0ldw3ll@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the current implementation of tegra_nvec_remove, the pm_power_off handler
is set to NULL without checking if it is actually set to nvec_power_off. This
change ensures that pm_power_off is only reset if it was previously set to
nvec_power_off, preventing unintended side effects when removing the device.

Signed-off-by: Dima Volkovsk <s0ldw3ll@gmail.com>
---
 drivers/staging/nvec/nvec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 263774e6a78c..9057f061e927 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -903,8 +903,10 @@ static void tegra_nvec_remove(struct platform_device *pdev)
 	nvec_unregister_notifier(nvec, &nvec->nvec_status_notifier);
 	cancel_work_sync(&nvec->rx_work);
 	cancel_work_sync(&nvec->tx_work);
-	/* FIXME: needs check whether nvec is responsible for power off */
-	pm_power_off = NULL;
+
+	/* only reset pm_power_off if it's our handler */
+	if (pm_power_off = nvec_power_off)
+		pm_power_off = NULL;
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.48.1

