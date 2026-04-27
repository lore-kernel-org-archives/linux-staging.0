Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F0439A800
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 08:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777277943; cv=none; b=lOWhEaoSNt6q6iNjQEfpNrt3YCVe5+taQcSdjrZcU0Mu387SCGIuqJ1Kn+gAKEd/chyihf0CAXBLMfqanqh3GPm2QcUi4xjufL54m1ZJRfKd1rdEhijW1d5sBPfKuINV6cSsUkK0gbitnOXaeikMdAb1fX4bSpvVJeRSqqx1ihg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777277943; c=relaxed/simple;
	bh=THkvd2xg4OaS55Hsbf7hoATE329XQJwwwcT/zqhgWtI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mnUyZfIgYWLI7I7lqKWf+fh06kbsii90qBeUuu4ymy9SwAO3XytPgoWjXZR1ch1a9wjx9mjlUpNL1N6N12OilXBB/Mz9DkOXjk8NoLkR7L1VCeyhYd44aXJFK4TAOhpVHHu6kxoGPa12HVds3TMWiu1zRS5FpRWGL9oVxYKgTYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5VMRC4c; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5VMRC4c"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d734223e4so6727751f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 01:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777277940; x=1777882740; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kG/U8gUtyi4vRCmib+owYIy2NRNfDYiG7cZGNbkj1RQ=;
        b=B5VMRC4c+jRTZwWjBl52aSDAZfNawKUFih7gDJzqfgRcKswRqnJ9dgx+dxEDhJ4EZ3
         w4nwWZkRFGCbVYJiSw/S92TS0AKQIkKlEOiSXB6Po9CwskHfDx0GsRwGw+9EAFhGpvA8
         TUcevJJE/mGq3NYuBKnQ5YS9ZmwFWVbcsxXpP5lJV2AMtRCRLGEext8TW8Jvwnz2x8Gi
         7Mv0DoDBuUm1uFdhPsIMSkcjQQ695tVR+qisyZedDbXbXxCiVob5bcGCpcZBo36DVbFL
         dsixvJbhiu7LHtoE0BEvD6sTIVgZvdeNiRSKGBYRO1XH+H7KJRrxUEGTwT0nVniDJBGP
         r6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777277940; x=1777882740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kG/U8gUtyi4vRCmib+owYIy2NRNfDYiG7cZGNbkj1RQ=;
        b=ED+WTf1qUfqh7jZifYDXsvBX8CufJG0B20JolGLtI5bGE8K/1qd9FyYAN46uZeW602
         DcagOCG7TjHZil9tI9ExzZj4BMgkPIh/B7BiJDSyr39Q0j272oOn4x0gHYhOVoHKLDdn
         CdR08K1f9Ame+e1IRLQMB6omMciWFjm76Jp8GpVXoAGO+r/m9SzIseNXgCLmdByhb7hm
         zxOG6QxEAj9g4L1PK+Jw2PtIRyjhWFMFpHHlebo7VqDtq2WCXlkusw6Yrijx5GV1aGef
         Fwp8xR3AlZpRoH7K7vtLAIrmbzGOQdkU96+LHXIb1irn53Q3OFIlLC+pgiym0LFd6xkc
         Nutg==
X-Forwarded-Encrypted: i=1; AFNElJ84gfWcprReYUWiHY3GVs1kKbCAUtP36ZBJjLr2ZlOePSjL1suBi6erAAdARImSV48oj0dIha6V++mfrl8Z@lists.linux.dev
X-Gm-Message-State: AOJu0YzlQJDrARnSAFAOLBaqi/SFZDf3nOaZFXIthR9YKVpWeolwbgbG
	yo4w7j4/QLO2twJi1CcBmHJ8lMzuVgqhi7aS7Xl1YIT2ObNvhtsBVm/u
X-Gm-Gg: AeBDiev8TccmpGWJ2IPQoE37MVpals3Lsa+jrxj0C3KPwgfhK1NaX5z0bz4J+MQwnOm
	Mo88jVWrSBLTfiy8oJrc6HXS/PS8K6eqKei2z3dMO5V35+NUFhbX/GcxCcod7brn36kB6YN5pQO
	sYTQiu/57ttc432ch85EnhyBLO8SQSMOIQgDTnCUalKpGXkvKTiSVl+SqoIoJ1dJYRHKhrt8KsK
	owo3J/A09DuVJRxHTvq3CAV9veBG/mOQ+8hhK+sq7tX3LS9CaQD0C8E1dyJoWonA4RQ9rSO+qXg
	NlvSuCL3ZdLm7gBtSdUd6HuqP8T2sfBMLxsjI7Goz9u71RjFTRFa8mK4/CfsSMnR4Ml1Hb86/oO
	5hO7C6xAo/TlWm5hWKq+TaH6toMMKoIKmXHmfe9H+wD4tZ4lZw8M4N6DLJJIREC34NfWE99zAKj
	Tza5qoLJH5ShCwYJJj1XCvwsmFjWIHNpsQatEjG+NhYhZAqd0gYsF7niUHVv5FvhWuN5A9QCgN5
	sprI4J+cwDA2cqFXb85hWlU7FTtKidk2v3a8jYZKTzbnvlazxErFC5CZvOsLw/uYLaZsTM=
X-Received: by 2002:a05:6000:290c:b0:43d:772d:2b61 with SMTP id ffacd0b85a97d-43fe4073831mr61766799f8f.15.1777277940421;
        Mon, 27 Apr 2026 01:19:00 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc375dsm69920019f8f.14.2026.04.27.01.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 01:18:59 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Cc: marvin24@gmx.de,
	error27@gmail.com,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH v4 0/2] staging: nvec: fix use-after-free and pm_power_off teardown
Date: Mon, 27 Apr 2026 10:17:11 +0200
Message-ID: <20260427081713.3401874-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v4, full series as Greg requested. In v3 I resent only 2/2 as a
standalone without including 1/2 — my mistake, sorry for the noise.

Changes from v2/v3:
 - 1/2 is unchanged from v2
 - 2/2: drop incorrect Fixes: tag (already dropped in v3)
 - 2/2: carry forward Dan's Reviewed-by from v2

Alexandru Hossu (2):
  staging: nvec: fix use-after-free in nvec_rx_completed()
  staging: nvec: fix unconditional pm_power_off teardown

 drivers/staging/nvec/nvec.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
2.53.0

