Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D9C657BE
	for <linux-staging@lists.linux.dev>; Sat, 17 Feb 2024 21:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708204410; cv=none; b=E24JHRoz/qkzwgk/1XKXnqkBQrwtbpo848w1xxHY3+5exzfbZGX+WVbeLgizIS5wIf7/e2RphESTRXBkzlQIhUzPt2KqAHTpeEMgTuf0zYoYgu1PMSZw7zYUIJb0RUnuO7NTlbQRCb7kZ/moj5UOLKp8pY/jwWGLwiZMjwUq/YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708204410; c=relaxed/simple;
	bh=fgLVkE2GXqizLVWyGzhJrb1Y0u81C/+bGZCwGZyhqjk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=onF7BKT4agOC1Ml6aghCLJ28gSrexRv4WDMKDUVj2HmDScl5gaAxqwGW6WEPgnxJeW3hfiMEpi1salRCBdYSE4t3Pf3HJoX86Ta0KPhmv/vHJGUaNz04V75XyYLJ/qQNFULNpmcEUq2uOD3hvTjTJG0igt9GiKPcfsinyD8dkXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NpwSWi7B; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NpwSWi7B"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d21e2b2245so20155601fa.0
        for <linux-staging@lists.linux.dev>; Sat, 17 Feb 2024 13:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708204407; x=1708809207; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X5KrHvRvX5NmJw1iIyLeL4nKWoIo2Stg2o/a0niAbAg=;
        b=NpwSWi7BPBc46LFBM7iOu+2vDUZCPNa0Dtm1+E64YvxCscm99dsH0aQFuSVy1qJNEQ
         0kj6UoDWq2UGkHvdkJva7YVVCGS/NfeqMzPwiY/1A46/t6d+uUhTs2Hs2GKNlBbXz8yC
         dsm02gz89+yjs2mb9bqRz7IacRAviBSEYXuUc7fB1luTRdiLmKWq5H3w3deOhj6JS7JI
         DAMXcG8aZ1mPxY1nWrjyHSaNFSHaoZ3qPoUerb8nHyalvw+BijuKy02NqmFZpJF/XAMc
         Cd9+uK4r1GWVMw5mnfHYKIiUXRtUZGNfwHSlduVeQbMcWmhxwWrC7UXpwu0wDT/yg1mD
         aFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708204407; x=1708809207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X5KrHvRvX5NmJw1iIyLeL4nKWoIo2Stg2o/a0niAbAg=;
        b=fxYRcPgM+RjP9/xFkfZcztDI0szOP7y5/3xKBzNVVwFdUL1xPA+BEp/Ti5EP4smA/7
         qMlyH7GOYS6ApwW1AmDv3bpm4d3kFISa//W1I1yc+cVCqz5npOIxcJSMMwUj4RjnaziF
         nVN1ZA57fUPatPoiQAAIPJPD2Vbq7rDL7yIV5PqmgMFQK6xHjONtVkpDAXatn14XWC7h
         vjtBl3tS9oCng5H33viY7qCx1XiF6VrMys2Ohh2FWme/XvmmfkQxlQ4dvVRWPIM0/iAB
         7DnbUwwPCqpttyUAR3fIy0skPPxsXF+/XQQ4O56n9lmr4uUXhyIavCIARwthUS8cGRcV
         1ArA==
X-Gm-Message-State: AOJu0YwGCCSDCrDmnRN/O8bI0qcHBd6WGK9K5JF+IH1adna1l8t49dvS
	nm7YfOgNJuFv4/4m4QBju2VgdVTykOOaVGiMcCEbLQnZj3CRYWlb
X-Google-Smtp-Source: AGHT+IGQW9t/Ign8tuIdpWBDnnpeicJVQEPwtk4gbl2C1sFXpO2TkTRg31490oUWRseCPX4oZ40PGA==
X-Received: by 2002:a2e:2c19:0:b0:2d0:ce72:570b with SMTP id s25-20020a2e2c19000000b002d0ce72570bmr5227109ljs.48.1708204406518;
        Sat, 17 Feb 2024 13:13:26 -0800 (PST)
Received: from pinguine.lan (ip-176-198-146-182.um43.pools.vodafone-ip.de. [176.198.146.182])
        by smtp.gmail.com with ESMTPSA id n3-20020a05640206c300b005644eca3befsm132087edy.85.2024.02.17.13.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 13:13:26 -0800 (PST)
From: "Moritz C. Weber" <mo.c.weber@gmail.com>
To: florian.fainelli@broadcom.com
Cc: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Moritz C. Weber" <mo.c.weber@gmail.com>
Subject: [PATCH v2 0/8] Staging: vc04_services: bcm2835-camera: Fix code style checks
Date: Sat, 17 Feb 2024 22:12:38 +0100
Message-Id: <20240217211246.28882-1-mo.c.weber@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resubmit these patches to fix multiple code style checks for better readability, consistency, and to address errors indicated by Gregs patch bot

Moritz C. Weber (8):
  Staging: vc04_services: bcm2835-camera: fix brace code style check
  Staging: vc04_services: bcm2835-camera: fix brace code style check
  Staging: vc04_services: bcm2835-camera: fix brace code style check
  Staging: vc04_services: bcm2835-camera: fix brace code style check
  Staging: vc04_services: bcm2835-camera: fix brace code style check
  Staging: vc04_services: bcm2835-camera: fix blank line style check
  Staging: vc04_services: bcm2835-camera: fix brace code style check
  Staging: vc04_services: bcm2835-camera: fix brace code style check

 .../bcm2835-camera/bcm2835-camera.c           | 61 +++++++++----------
 1 file changed, 28 insertions(+), 33 deletions(-)

-- 
2.30.2

