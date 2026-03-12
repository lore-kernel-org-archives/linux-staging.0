Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8AB3BA24C
	for <linux-staging@lists.linux.dev>; Thu, 12 Mar 2026 21:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773349925; cv=none; b=Dm2++s86XRA68LBMFHL8xPXc0KiwRpaSdInoNXc1GBFpZb5x57a4Ap7OdbiX7qvT5eklB23c3Gt3cixc5/MLc0gtDT+FNL1JFjiPA4aTvircDvuWHXXuyVZ5xNCAn72f6Quldxs1f7t3jeCxhdUHfMWQImHNnZ76e7FcPMi2+Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773349925; c=relaxed/simple;
	bh=dgXz+tf8jQBXnsNFeJqpbH2JGsjkuDwJsNvfitrPXiU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iD9CI1IOvuYMWRf2n2a295C6SCMhoKIQSiuUxPGZVqscat19zKBhobvMxJ2IkZor7AKmP8lnEtW9XNa2FydTVWTTgK4DbJ1iiLFpxgji6nxibjQg311jmCI2smOSmA4yJzhIxQoiaN6MvHLrHoDCkI/aaiTG56fLlomsqiWwmuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iHgnSPGO; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iHgnSPGO"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2be1ab1fa7dso1095090eec.0
        for <linux-staging@lists.linux.dev>; Thu, 12 Mar 2026 14:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773349918; x=1773954718; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XjwmZwRJZQP1Vyn8dYEBv1tFqAl5zM4GfXI60msFcQw=;
        b=iHgnSPGOgE0hxS58l56ikYv74E1gK9Y9CrT5sccozs0a5zacxuIUGP6rZB5weHPKFi
         EiFzX9dmnQxQ+gYImQ0/M1fTy2eyGgusekEQQuQD6cUdjFczctNJXHaM7Sb/27ROb2hJ
         II7JMHOzlvt9e8Rb2noEGeydJ1+oZ7qIgGC2NJKPsbcKdEdMGb1SSGn8xL3l0dxYlezD
         tl8hLpLIUhHBg7Cu7WQ4jcZay9Y7yD7kQdlvqMHkf405Ne1lAbLCX0IGsCRQxi94fyf/
         Cuw75WdYjdiBI6veQwwCzWo33b+/IgHl9RiF2zNGi1N2SymBrVO5QVm6D/PfgyHSOGMZ
         ilzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773349918; x=1773954718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjwmZwRJZQP1Vyn8dYEBv1tFqAl5zM4GfXI60msFcQw=;
        b=W0SkNoO+KVo7gugB0KB+vbmwcAtkc8Pbqlnj61yNAufuAg8wOw58ivxatyZgQBB9C3
         lo9m+z/h0gBOVlfbDMaD+TZK04kn26Bdg310WNyiPRafLH/E/5QAJOglwNfluPbG3bPW
         xtM6fbZ1jwqpWQSza5ePGVooHt/LaHYhz2HAQhXqJfaiqYNMPPKvD4jJpruNdch71V7j
         RMdhSIKL1cPh+6SZXL2d9cmEfAxpIlDSAW8zTiu2+BZqK0IqIMKMMjmAB+mkR5iwUfXc
         xZJ4jIJazt2rHjdvj3Tj81LBSe7AVFGIQH2dG0Buec2RBPJLjP6uhevSv+Iir0+hwDDo
         q+Xw==
X-Gm-Message-State: AOJu0YzrtjBzO1LGHiyd+CZZc83PbUmST8MVG74rH2fj+8lAgT8mc/qS
	MQcwMgiltCDjLo5vv9RHo3v8uGbPah2mJdmEHkLhRLfxTNNDpq/183e/
X-Gm-Gg: ATEYQzy0KwpdwXlJpWjnh0qhEuPjV3hOTfHLKPzrk9dZp+ZYvPi/7Kz3GVD5N+XYL2F
	GRkdFTUVwbGmYAxVU32PtnoxBSBARpyFV+RuejwrrpGfvEa+TLf79Hy0+0GD+282udSxLv1ug1f
	rOsL/UjNDj8aDwpgOd8oWUyqGrL4sdAdzIDSI2J8SP7AyFk6+oim+6wgwA0qiaff97aIoq7Qjkn
	1igri6iQFEr52KCnySAPHW03h+4TjkkpR8rcqbinGBZKho3lAHlVQdQPXd39O4jDNWJm/NRPm/l
	t/Jeu2JRBedL0bQTKqK/CTmcVJoczCpF4xJw3CibFJPV/pLnCPFagcKBpD/onZYcDXlihXVAN+A
	jfrweunNHiiojiTLYP0h162zk6kVmWOSvnkI75VEOozS8u3euuE6nfSvN3yy50/g+EXYjRiZhW3
	4BmV2r+rzgE9+YVVcWBMzEUwhlAk91AEPx/q/hPgjqsA4=
X-Received: by 2002:a05:7300:6ca0:b0:2b8:6a22:6d52 with SMTP id 5a478bee46e88-2bea55e3b11mr614037eec.33.1773349918532;
        Thu, 12 Mar 2026 14:11:58 -0700 (PDT)
Received: from localhost.localdomain ([2804:d59:7f1c:1e00:6632:a8ff:fea4:c8d3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be8a83514asm8422272eec.4.2026.03.12.14.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 14:11:58 -0700 (PDT)
From: Gustavo Arantes <dev.gustavoa@gmail.com>
To: gregkh@linuxfoundation.org,
	marvin24@gmx.de
Cc: linux-staging@lists.linux.dev,
	ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dev.gustavoa@gmail.com
Subject: [PATCH 0/2] staging: nvec_power: quiesce EC queries for system suspend
Date: Thu, 12 Mar 2026 18:11:49 -0300
Message-ID: <20260312211151.85379-1-dev.gustavoa@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nvec_power still issues EC queries asynchronously and keeps work queued
across system sleep. This series first serializes the driver's EC
requests, then adds PM hooks so the remaining work items are quiesced
while the parent NVEC controller is suspended.

Patch 1 exports a small core parser helper, moves the battery metadata
queries into a worker, and switches nvec_power over to synchronous EC
requests.

Patch 2 tracks the suspend state per instance, prevents new work from
being queued during suspend, and restarts the polling and metadata work
on resume.

Gustavo Arantes (2):
  staging: nvec_power: make EC queries synchronous
  staging: nvec_power: stop EC queries during system suspend

 drivers/staging/nvec/nvec.c       |   7 +-
 drivers/staging/nvec/nvec.h       |   2 +
 drivers/staging/nvec/nvec_power.c | 122 +++++++++++++++++++++++++-----
 3 files changed, 111 insertions(+), 20 deletions(-)


base-commit: ad6bb64332bb4297110950769ad5af52791e33a2
-- 
2.53.0
