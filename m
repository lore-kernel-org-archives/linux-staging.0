Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EB04F0546
	for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 13:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897364; cv=none; b=iAt0/mM0RxzpvIfo0J+8soRTyk2KeMDp8BrSXVL8gN701xKhTerrqJnEwn3Oz9pduQfjvhigs9TlMNQQ4Qz/UyddKXPDRt+SYOvzKU6p98U5PWSgadWGufTHvlQ9Mi9E100dm4Kj3OxZun8M8zeKPXC30l/ICQ7Cbv+sEj5qnbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897364; c=relaxed/simple;
	bh=KYNq+5UASvVLUUueo5+fWrGKvfr+e6x8JGly1DJBrfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mS0k7F1899Q7lACSORXGoXvIOo0TBwC2inVGqJ6b0N8pd/fk/3t152pDV7T3BWxx7bJD6KgwSYP9zXAKXoIG9i7FDc+2l4FcVcdS12PeQQwU15W8Db2ZCVhPHjwn6zdfTya+uRuSxRKKnpnHtv+Cro65bUIdIz2/fafkz4rZRAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu; spf=pass smtp.mailfrom=wetterwald.eu; dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.b=rO+uDpEH; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.b="rO+uDpEH"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso26249305e9.0
        for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 06:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1791897359; x=1792502159; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ig0Y0bs9FN6Dhfi95iv4Xq2tV5MXRKRrxHG4lzB5XTM=;
        b=rO+uDpEHImSw9FP3tZvTrtubwORcUNZEARbY/7LnUrcn7IDpX+/jBqyOpy5Voen8Jo
         +vsnPXlTGABtdcBHs/cSh4gsAjTU0ZrlyToqjHCpAYkb4xo3QUW74hxxedtetKrmFNA1
         HrkMatrO8MDgcQ9G52xaD2+fKfJAXtH8K+LF8mrADTzVIZBXEBynM7pmhfKQECPL9Rfe
         axq7j2eGhILKPrlYZaacV/lVG8m1YLxbdwJzR+hliPGaDjo5Cq2eTbIvp5jA4OBn5EGe
         W41/vnTbmMFlYnjrb2NMGsljsBUzwRdbDJ1tBRcOV958TgTmuizj+WO2ilBWI2SGYZyv
         bSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791897359; x=1792502159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ig0Y0bs9FN6Dhfi95iv4Xq2tV5MXRKRrxHG4lzB5XTM=;
        b=GkM5pUMeAXnV3DbnUAuLaA+A3/aIK1FOhwwnWKtsfIwmLSjLz+G+uQrkzk2URGkYU4
         ZF7Lu7cBZdetbDG853ytzTjskaSn5qLyhQyVuhjLG2L4PIxvlTl60b6TbKN1nv9Sdzcg
         pTQcy7A58VIO69bClVXSiejWptLfD9y6xwFUzfSCX8ulUBFXldzcP8Ce7AhzPJyznUyR
         rIbVSy8CI8FhpeGDFarbDMj6xm1MflzqdbxGUJrRfo0rg3v2blmAZ3XD8gg7d0lLOD4Y
         pN9DArv22U+wpW9bs6gDeFGVkD0E/VBDqH8ggcVbMUc7MiYF1x6DUfJpChcOVfTSBjMY
         /uAA==
X-Forwarded-Encrypted: i=1; AKwUvBzTcA4lV3BscLBYQZeqOK2zdIWdsQaChVyRWRkmQTbsmsjGtaAWNeJoSFJaLFnxEd6S/A5ZwI9AgMQ69ZtQ@lists.linux.dev
X-Gm-Message-State: AFq9FYKok0gRrT5a0JFmsvwsA2bQ7YGE7df+41aT05mDWCkKGc9BjtYZ
	Nz5E4OwKCmv/axBBz4D58w8Z0acEDHw2DwX4rzF/Y9dIuqxd/ZBIAfrRCwOceHM0V6g=
X-Gm-Gg: AYBFou2S/gvBbfgYq+oO5pE1ojPc3crWnPjcMilxUPoTGfzIRH1MlYcEDJqKAhDd5Ts
	z9Umot6Qv5jnD6mrxmWBkd1uOluhhNGbzkoithW5IMerOhuxAnp5v+GPXS9pmUUIq8WoAoI29fh
	dLlCLJHsnpXon0tbfKk1zuT3Iy1SoLfFbpxkONr7r98i4oLuFLu5sd3WW1d5IBXi8pY1nkmHxhk
	CfjJT2DI81GOD3a2uzkIyCedreNFQY8/HecFhHqZjUDRdCzN5qWiQd29Kcg8D2JfDTm/r7fl8b0
	xYMMSGiH7+i01hSX32KYEEjCJNMNNMFzKXeirdfuKKdxZHBpfkm3UU497VWbLthujulBSQGIbZ5
	BCYh/nrnz+CG6fGeGtAFv35YWFV09EK6nX2HFI2wDf7dbnssEmYVrpVFs3I3RhDXMHtvMlG2YJL
	ZFzLGc8e2JfrfwufnDGU5lx2Pf5KlLYv5jdYdxqlUrC72QJZHIk2ux2wWs9MSrDSzSAQ==
X-Received: by 2002:a05:600c:3512:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a18e4913c3mr213743705e9.8.1791897359239;
        Tue, 13 Oct 2026 06:15:59 -0700 (PDT)
Received: from Halley ([2a01:e0a:dcd:52a0:bf8b:5759:6fe4:3105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be96549sm520141515e9.6.2026.10.13.06.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:15:58 -0700 (PDT)
From: Martin Wetterwald <martin@wetterwald.eu>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <uajain@igalia.com>,
	Kees Cook <kees@kernel.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Martin Wetterwald <martin@wetterwald.eu>
Subject: [PATCH] platform/raspberrypi: vchiq: register bus at subsys_initcall
Date: Tue, 13 Oct 2026 15:14:35 +0200
Message-ID: <20261013131435.1454019-1-martin@wetterwald.eu>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the VCHIQ interface was moved out of staging, its bus is no longer
guaranteed to be registered before its client drivers. bcm2835-audio,
still in drivers/staging, registers at device_initcall level and now
runs first:

  Driver 'bcm2835-audio' was unable to register with bus_type
  'vchiq-bus' because the bus was not initialized.

Register the bus and the platform driver at subsys_initcall so the bus
exists before any client driver, independently of link order. The
platform driver probe already returns -EPROBE_DEFER while the firmware
is not ready, so probing earlier is safe. When built as modules, this is
equivalent to module_init() and nothing changes.

Tested on Raspberry Pi 1B rev2, 1B+, 2B, 3B and 4B with VCHIQ and
bcm2835-audio both builtin and both as modules.

Fixes: aa125180c673 ("platform/raspberrypi: Destage VCHIQ interface")
Reported-by: Martin Wetterwald <martin@wetterwald.eu>
Link: https://lore.kernel.org/r/CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com/
Closes: https://lore.kernel.org/r/CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com/
Signed-off-by: Martin Wetterwald <martin@wetterwald.eu>
---
 drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
index e78641703252..d35f5ac5c2e2 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
@@ -1462,7 +1462,7 @@ static int __init vchiq_driver_init(void)
 
 	return ret;
 }
-module_init(vchiq_driver_init);
+subsys_initcall(vchiq_driver_init);
 
 static void __exit vchiq_driver_exit(void)
 {
-- 
2.55.0

