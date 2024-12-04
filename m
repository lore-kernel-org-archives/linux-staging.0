Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95A01BC9F0
	for <linux-staging@lists.linux.dev>; Wed,  4 Dec 2024 13:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733320077; cv=none; b=CBwGX7s4LWtHkGxteQrRRYs+aZ1e87oauqefNnaGyWkfm2gG/QdMGKPqZS5WTqJGJGmQvTPJLZSz3c0cxPa2qJq/FAOU2TJ2UeKkUfQ4OXT00Qj7uEc+hY2aD8QpBcZNa9274ZIdLBJlfgsmlw2L4+Fx91JE+DHjddYPzLiAYaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733320077; c=relaxed/simple;
	bh=N7/vkh77qk1fPHVjfiBISqmE4uv/JTxV7LgwE4hm2a0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s0n+ZyKq6prwK0MovNdSHzuynN/RQPWF8MzTE+KI09G00pM6aEo9fmmtX8b6YK7PIHMNXSZ6CtwUfSGVbs1dWaNrH0nS/GDERgVOn0x89d72UUsEZK3+bx7hBgIR9DyLT2Bg0t32MGpAWyg6n5vxxdqCojle+zPnXM+8hYdeiU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R3eA7I8o; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3eA7I8o"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-434a0fd9778so62838705e9.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Dec 2024 05:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733320073; x=1733924873; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7dkS0jxrNDHpGzyQIGNBb3o5Ra/IS2ul8BnWsJrSOvg=;
        b=R3eA7I8oohadoCtD9IBtCVJ8uaEDx7zSKzbn39mXR8yd/RplHk5EVwWahuyIJQp/TD
         JhkpZnBX3qQwcanJbT8UKt1G2ptXY55qhBmb8ylmFLWQfudWEV1Wf7bpidFFtOVNIYYr
         1xezCr0WR3mojhM+h/imYjgRBCPo1CFvwJkPII2oUMlwyXIqq2DyJf16EtQd8iGszvUc
         /d0+tiZCuGz3MZXmWzmm95UUgO2kZmyw1EBB7ShGNmq/4BPV0Bf1qr5RaULDN9deJ0gI
         /PhvvvPwNCP4s2pQIsbt39/+aV65aRKu8C60KcJ7fO2PzYo/JrJIEvG/U485owew/Nfa
         abJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733320073; x=1733924873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7dkS0jxrNDHpGzyQIGNBb3o5Ra/IS2ul8BnWsJrSOvg=;
        b=d90hPIiyJVmAZ7BizyBd/n5YZX8n1GhvxRAoTnoULGYC1iogjkf4nwntz5WzZPCi6N
         gO1Kzjyt7k0fZeUj86MKEIYAA07RCogIH/xhn1QKrsz64+nLSHUVyTfBjic3teLHe425
         zHh9vFjkHSmcKAAmDSVpgc8nNuR39e3ir53Z0QGCtAixkyjlFbep3GIpQTU0isw7qgsY
         h+tRlKaR9ysCYQomsl54jkk7IQYDwgEbjldftfJOmFbUy24poze4nb8ngOx7Gg33lnD2
         OkMGykMB3K8P4jBelZ44UQ6fGZfQsk4VMQ9vBSJmDp+9sBAiCKJn+bqdUbAGwBG9+VL2
         3MGA==
X-Forwarded-Encrypted: i=1; AJvYcCUQNr5ist7OBbAIJa1xRC5Kaqk46FZwo673MJuHVmW/mmi7MpbdiunL8fEKzRzaCLMGAMbmpbUZCMaq1o8I@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4oJo+AkF13AC4d2yGfu6vSO+mmkKH2wy1SD9HtRPDu44hBYV/
	C34vKlPqT/DxLDgM7lT84Axc7xPLMmf+7niWKhpDovaSKVd2t0iwQK5LHsgr
X-Gm-Gg: ASbGncvjxx1EDp2nEaOQzCYlcM0CoLllJglrb1cXfVwEgTI8np3vKqySd7KfsaPcUSI
	N/2cJa0cw5mwGzcYTSAnisQuX8WfsM4dyxaTOB42QLpQu7H1PFUEmtUWODZf9CIQzOCMw/K+iRn
	Amk/BR/AGWFhY2aCMB8CCjI2trYXjyy+qnUYA6i5jc+yS/WAsoLHCp4zFMB4WuTcNZzgztyiZxC
	nheX/RMNsBqVfkO2Zcdkq2eNZDlz36OCPY/GZlWqA+9DSuYlw4C59ibH6Y85+z719k9acCJNPrk
	WNdXflRK9g==
X-Google-Smtp-Source: AGHT+IEERzG3Y2W6qTUJPL9AaT3DvYbYKP20IfUHmhXP+mAbXsk1BfF07T4abHbvNiGofdVOsKIM8A==
X-Received: by 2002:a05:6000:1fa5:b0:382:47d0:64be with SMTP id ffacd0b85a97d-385fd3ec1c0mr5280390f8f.29.1733320072859;
        Wed, 04 Dec 2024 05:47:52 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385deeb6acdsm15939891f8f.81.2024.12.04.05.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 05:47:52 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: sfr@canb.auug.org.au,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH] staging: gpib: Workaround for ppc build failure
Date: Wed,  4 Dec 2024 14:47:36 +0100
Message-ID: <20241204134736.6660-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make GPIB_FMH depend on !PPC

Reported_by: Stephen Rothwell <sfr@canb.auug.org.au>
Link: https://lore.kernel.org/all/20241015165538.634707e5@canb.auug.org.au/

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/Kconfig b/drivers/staging/gpib/Kconfig
index 95308d15a555..a9b811165f6b 100644
--- a/drivers/staging/gpib/Kconfig
+++ b/drivers/staging/gpib/Kconfig
@@ -128,7 +128,7 @@ config GPIB_FMH
        tristate "FMH FPGA based devices"
        select GPIB_COMMON
        select GPIB_NEC7210
-       depends on BROKEN
+       depends on !PPC
        depends on OF && PCI
        help
          GPIB driver for fmhess FPGA based devices
-- 
2.47.1

