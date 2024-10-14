Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59383155757
	for <linux-staging@lists.linux.dev>; Mon, 14 Oct 2024 08:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728896214; cv=none; b=SNCgOM5c49sqank2iNOGIhWn4iKapD9QDfBqHHxapj+W4tz/2Kpy6i1mNnu65QAlyaqmgF+lEuiFjQlSB7XMnt5WrtmoI7vk3Y0VOnuABc8z0KwdvHfy2C52vve/XwCt1lrhadiX7CzPlwOtpWJ6i+JNfun04gfL+fo6wk/F5Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728896214; c=relaxed/simple;
	bh=deoA6W7KISJU4Lqs4NPTSSLQ+sPbpJvu3bhsGmcntkY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DGIcu6UJdPyk60bwNQhd2IyTgUhBJaHwsnSFsBNeHwLvy7Ef476j9caGoapeW2vZK9PLOYDHkvo0RbgO44G35yVYYpHrXNrzfKbo6DS/gj0lqgWPfe2s0e79eH8zKmKQyjkuhDACEonapQYjgtHv1NbtoYOnJJmXqJoE0XdAc34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5KeHkDh; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5KeHkDh"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c9625cfe4dso2507705a12.0
        for <linux-staging@lists.linux.dev>; Mon, 14 Oct 2024 01:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728896211; x=1729501011; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bka1XtdhEywlqdYAZ4vAB5CJJ60IdylXCrsQgeEz6GI=;
        b=Y5KeHkDh6YIgTvwyvCGonfN2gatbJ+EgNUgry5vG83I+2Bvz4GFLqzbiQ9JlRDsRUL
         cl+ubu2QD92KYkwV5pHr/O51LhrcQrQG/FE52ycgrAF/A/nGE27yDiGaB9MFS/ijP86a
         E4rjCrzG10+N/8KDLEN3rPaXkyBPpKKW6yQTwtbQhygEmjnxHYneQBQxFMnXBOEcVG3q
         PIXLYu1N4TLneojPRqtuKTe+1V+j3m+IVGnI8qJFty9EqheK0mbqQfZl2OUQ4Xe1cNBQ
         V8KFGu06gFLu03oS2vUyj/g5zV8ZecfN+h8Z+SlhHd6ZjWJlkLBsPUmP9ZRF/+KZoe/c
         Km4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728896211; x=1729501011;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bka1XtdhEywlqdYAZ4vAB5CJJ60IdylXCrsQgeEz6GI=;
        b=mX6d6hfwaxULZtAqcy79Ac2PwUHeB1aeGP+xHYm865aPbHWFE/ckWKphY5xmxPRTiP
         uQdDrO3XXwtjKAEww41TK5KlHGdwoHZKgioLeRLN/BkMZIk5KC54RO4K5pOFCsx5Tv1O
         B9MNHR5XvCMQR3lPDmDNBvmBMJnFnetvbRrvScli9M923u+F6aS8nvm4okIymBmCgp77
         g1D5d7LE3fuWtj1JKtaisk23m25g2YOv555NqLSoL9SV3W52Q67f1poR6zT6iS208Xd8
         1Fj+3GY1DJIdEB93UM5bZ3UVe/TyUvu1YsC5D520A0zpHJB0ARBchq+KOxWbdzoRPSfx
         Ie4A==
X-Forwarded-Encrypted: i=1; AJvYcCWGmLJwfKQ1jGr6Eyw6gKcxCUm7CIl1TA2CPnlBjFR4ejDwa7Q6a2kV83y3IABnEHgjCOwyyoabKf918skE@lists.linux.dev
X-Gm-Message-State: AOJu0YyoyWBaKihglxL0a0tEsUiAGYjvizVsep09blS5x2LNeH/Y0fQJ
	flLH1FGU40qcgIziBzq5KQyOt/boHkc+Nc2HJaEORx2cm6RTWIU6
X-Google-Smtp-Source: AGHT+IGDJQrFJVmLNzaOGm//MX2LnTO5StHI/IaPJSK+vM3ey2DDnOs01a7EiS7Ktr8Rdy6PAFN7xg==
X-Received: by 2002:a05:6402:354b:b0:5c9:488b:1dd9 with SMTP id 4fb4d7f45d1cf-5c95ac416b3mr4767381a12.24.1728896210311;
        Mon, 14 Oct 2024 01:56:50 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c9370d2296sm4635091a12.15.2024.10.14.01.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 01:56:48 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH v2 0/2] staging: vchiq_arm: Fix missing refcount decrement
 in error path for fw_node
Date: Mon, 14 Oct 2024 10:56:35 +0200
Message-Id: <20241014-vchiq_arm-of_node_put-v2-0-cafe0a4c2666@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMPcDGcC/4WNQQ6CMBBFr0JmbU1bERJX3sOQZqRTmEQotthoS
 O9u5QIu30v++xtECkwRLtUGgRJH9nMBfaigH3EeSLAtDFrqWkl1Eqkf+WkwTMI7M3tLZnmtopF
 4JkR0tpVQtksgx++9e+sKjxxXHz77TVI/+6+YlFDCtfqusaG6tfI6TMiPY+8n6HLOX5kF3Ou6A
 AAA
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Stefan Wahren <wahrenst@gmx.net>, Umang Jain <umang.jain@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728896207; l=961;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=deoA6W7KISJU4Lqs4NPTSSLQ+sPbpJvu3bhsGmcntkY=;
 b=ziGzncipHzJsiNZ8mCCJaD/J81b7kY8naAZ9Qg/cp3Ux6cTrCppMq5petwUtH9bPQ44NEESyJ
 KiKLKjJ7rhRDIKMtTtOTTTMGWfjbCpneZwkkSC2TLJ4z0EnR3mYoK0H
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

This series refactors some useless goto instructions as a preparation
for the fix of a missing of_node_put() by means of the cleanup
attribute.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Changes in v2:
- Refactor vchiq_probe() to remove goto instructions.
- Declare and initialize the node right before its first usage.
- Link to v1: https://lore.kernel.org/r/20241013-vchiq_arm-of_node_put-v1-1-f72b2a6e47d0@gmail.com

---
Javier Carrasco (2):
      staging: vchiq_arm: refactor goto instructions in vchiq_probe()
      staging: vchiq_arm: Fix missing refcount decrement in error path for fw_node

 .../vc04_services/interface/vchiq_arm/vchiq_arm.c     | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)
---
base-commit: d61a00525464bfc5fe92c6ad713350988e492b88
change-id: 20241013-vchiq_arm-of_node_put-60a5eaaafd70

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

