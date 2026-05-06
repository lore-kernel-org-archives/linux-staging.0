Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DECE3E025E
	for <linux-staging@lists.linux.dev>; Wed,  6 May 2026 07:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778054286; cv=none; b=S+/vrplccwe7lFDOlKVfbxzg1cNZiY0RkLEQgkvv1fAX6w59CQJ7PWwz+RLNB2VfC1eIdVkUgDCdHnuE0h1DHJ+1PmgTM4UqjEbjRp7n/Rshdkwh3Dc1+ScWCmJBFMWm90Rkd7OJE0pxzqL7u7XHhOU1CFFbUx93lEe+YM0oozA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778054286; c=relaxed/simple;
	bh=xR1RM3RWJW47Z9xeWRrmmEaNfsdqusccHbBUDCDmcQg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GHslEojD4+AeSn5gA6FsaLcIc01Yr1xUUFga+HK5Vgn7XZ2eox+kJfOFlCRQZCHUkeAP1vWTZqzOxB2n2KfwgX65CahiDyoh6HbkfNNwlaLjVmtY2nr0LpPhV12P9olycv6Zde8J6+O8hiH/UuQbKZiSV5J0bSbwHo5j5dT3Zng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h28leHhN; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h28leHhN"
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso486165eec.0
        for <linux-staging@lists.linux.dev>; Wed, 06 May 2026 00:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778054283; x=1778659083; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=97mCRoyN7YDaEeJKPq2/ZEaKlSBE3boJ8GScN+I6XWA=;
        b=h28leHhNVYX+O++xDU0XLJD34KdtTr4vPRk88REz3bcM1iJ5K+RowNTcQFtm/Sm2b5
         0ess7s+T1EU5t55MPoedRfC25c1XzXxtI1aW65DBPrl22iiWY6roh3vEWo1+Dz3k6I4B
         d2mCv+cdv4y0q1XmHeueYQ4dz1RRHPQal+D7I9Rv9HvnnXWaf4WkELB5fDxwkSeoAGXH
         Zm5G5zsng6cQu/1bu0vL7BnsLW6CgoWajnY14cLpNc/DJK3VwRv8Tr2np0AiqBOUFOm7
         /a7NrGIhXzKQuyPByHD8mAcJBebwuf+ycOuedajtm+4WPvENExE3LWdmMg60Oo3dZz6/
         ONdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778054283; x=1778659083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97mCRoyN7YDaEeJKPq2/ZEaKlSBE3boJ8GScN+I6XWA=;
        b=VWO9xGywr1VDxDmcrq3Z49dI+lJrHnojeiktZyFVw7sTM2zgNOT/Nhyqy92ec2dsfz
         nOZyigVf/EilG+cMurSG7UE7HVS5I+vZXCOXrqvTo5Ek6yPKsYhQX3o6Qs9u+6O7H4Kr
         BTc5qs0QWh6Pi+uEVfS21zx5zCsSLVG7bOt+yl65hxPNaqB0AuIbUc07Ma72BTd81VML
         LLgMW2yLHyfu/1Bh0ZkgOffuRsncveNm2Q/hAzgY8+N+ZSMwYUQ7j0zP40+ZCgoOyav3
         BPQyI3unZxahacwn509Ihf4cLNxdZ2wF3qDD+P111yiDwgKrxXJ0CFezAkNaj+tIbZg2
         M5Qg==
X-Forwarded-Encrypted: i=1; AFNElJ+jPpV7cTuJXswP5mriZk2K0kv4OsJLNM6o0nv9ghncLBcTIch3Pol44ALRhRKSOJh1Vn1YhBEEaN1cr8CM@lists.linux.dev
X-Gm-Message-State: AOJu0YyNpeeUT/fX6YL5Jwsr3MxMCV2oCciRdAqAWJZ4GTdMDsdMbN2l
	qblH2Itpm3i1OH7+lLOEh600UOAS/1f+QnsDEiNlSCMO71cBygsWdZ81
X-Gm-Gg: AeBDiet5hkabS0UvMtUfygdi65ItzIbghGIFMeiXBslMnaNtKyAxewXJJVdb7gTr/NL
	PY0t4iJRXh7s5aCi4tQJqHiHREUDKhQtEIiAo4HJKrDkf6upd8OHZi5NJv92f9JPlD1LgaVa6RL
	NcOil91jrQjIfySxzwiQVEK3AKngP3TBpIEHtKJMX4qQnw3DUYTgCzZbZZjyyUSetOoQ6B1UuCF
	Kvkg0HKRXMJPLiEt5k6gSq8QxS8lqgDT+B9Z0gsB42C/e8TED+vH+9IbB14Xa4iRNoB5+sObLdw
	k+8KxBuerb5P0CLRHrjh2X/suHSek2F8iAYbuAfBSYy1nRofQGFMWXrJm2HzvmyBi4TdY/o1JGG
	UyZ8RlOyZojXQsDVoQ9KfWNp59pIWBdiUde/PfQSZnEnxd8BU36E8DB4mMMW/35ta/zIIXUPVUS
	/eob8r1/cj1ZHplk2rh86KX36YR6JlrcZmGINSCEI3vlEeILSNteAjmYzXW6HIMo/2plIQTgo4H
	OVx
X-Received: by 2002:a05:7300:ec08:b0:2f0:ee2:f6c6 with SMTP id 5a478bee46e88-2f3d19ce4a7mr2903276eec.19.1778054282508;
        Wed, 06 May 2026 00:58:02 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56d4cf2fdsm2416561eec.8.2026.05.06.00.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 00:58:01 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: thierry.reding@kernel.org,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: hverkuil+cisco@kernel.org,
	dan.carpenter@linaro.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2 0/1] media: tegra-video: vi: fix invalid u32 return value in format lookup
Date: Wed,  6 May 2026 07:57:44 +0000
Message-Id: <20260506075745.28574-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:
- Follow Hans Verkuil's suggestion to use WARN_ON_ONCE()
  and return the first available format (index 0) as a safe fallback.

Hungyu Lin (1):
  media: tegra-video: vi: fix invalid u32 return value in format lookup

 drivers/staging/media/tegra-video/vi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1

