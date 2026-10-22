Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657808;
	b=cgvqQBxcqG/xqTonWZlAjhh+5rSBHrtCTVhK53HNQg5a/nZqn4qsoAYT2OqOqWb5M1Cr
	 VhlimqqNKJR+Zi6Np3AjskDDJOSKSiOZKKHWG0YAGGYVFBC1iFxKWnhhY6T9Mg3zwsVA5
	 Np6mnJ0QbWTUzxVb92IVQTRkRPKkB116BBJH5B7I60bjp4u0agtn3xclTcej/IU5yUhMg
	 ah/Ax2UYxtdWkQ8czpVUDHCzKMdeb8o295eNWKLbYQ8/rjdunjvdCElqxdqHcmstQEyiM
	 /724AWdYOLYAK53CQbEozt5Lxc9bhGX4O2QCsT42PvwTLcLp/mV9GUypdXQlqqZ58aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ov64R61JC1VLupte76D4hmlAMcowcOFiftvcocoORZM=;
	b=PvCDX/Df8WiYLf+Asa5WCNRTfwReTeQRecj3ih5M5UFMuqopFoFzBjxD13WGRhngijUY
	 CFztNPD2/YxizOkLnA/eN8045opAQ9dz2oyblJgojxM+LbjDckkn3KMsG2ZRRDp6Cyww7
	 i6IJEYxOIjg22rkm0nrE2BD13OuViivxYT/cadF82i+1uJdkpw+BKDcSbwzLUNhiZYzNX
	 NKOBF0vDmYc4vvv6HP2+Olthvvd2CZvjukAU3XhunYJ14ZNqIFJbhqN5L5MCLX4SSNLNg
	 duvXUwR74hop7v8SQR/OdXPuoxvy9IfzAROoRDrZw/2vZrYIr4KlySUGQPFfNF6PE6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=wetterwald.eu;
	spf=pass smtp.mailfrom=wetterwald.eu;
	dkim=pass header.d=wetterwald.eu header.i=@wetterwald.eu header.a=rsa-sha256 header.s=wetter header.b=RlBiK06+;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EFD606A321
	for <linux-staging@lists.linux.dev>; Thu, 22 Oct 2026 08:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50EFD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wetterwald.eu header.i=@wetterwald.eu header.a=rsa-sha256 header.s=wetter header.b=RlBiK06+
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so12587345e9.0
        for <linux-staging@lists.linux.dev>; Thu, 22 Oct 2026 01:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1792657805; x=1793262605; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ov64R61JC1VLupte76D4hmlAMcowcOFiftvcocoORZM=;
        b=RlBiK06+CK7VkcdLvh9FEjDoZOFr2qrAGsuPBrD1rQOPPl19X7XJ8+vUW5lVAVlGdz
         yZsCRFfEHwChpLdQcG53M3hdo2gwrAD+lyPdUtjkFUa3oDaaYtG83xRBHHr3KQ8fyUGe
         kSgMeA9nBgIGOmgQtMdCzcnKr8EtCL1miWOC32xrkx1nzuK/E/iraNXwNpyv92NciBI8
         5oa/zXwRQZKWrUZHDu9PJ/W3WCeGGxbFil79BWESfJmW4sDymtj+Hw/Fx4vpnKtLYy/L
         lidCOjcoc69bQmansydOeSSxFQiIZQAave+llpqnSaos3YZYO+6qr76SSJmcJEsWsjcc
         05OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792657805; x=1793262605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ov64R61JC1VLupte76D4hmlAMcowcOFiftvcocoORZM=;
        b=Otm3OX2zkB76eS0upavuf3IVux+4y8Gbn3JucUvOoC8AgTO6jj2Uz4CwiDxhOEmbX/
         dS6jksLiV3d9/qH3qsoaZgUYdKP6W66I1C1XxRMDLZhGaUCMtVQyw+ikutoVxSd4Kxpv
         V4XGs9GfkW64Ri1fC6F2IhifApnK0qCZM2MY0Ze7vsyEeE92lc0BUqVIL3DrakgorTHD
         D4j9Z7qIj3F6xuYlyeu4uBOjE5ffeCqsyAGOkOQdUHExQcgAFSUAaKbQWSxpPntjaijA
         Gssp6rPa6U4VUJ8RMd6VzrtDaXafZuEU6UxGnN4bWI8WZrpZf/d2At6dZzT30M4siJZQ
         74Kw==
X-Forwarded-Encrypted: i=1; AKwUvBwYl3C1T18qfdHGLa26UozNMxIx2SNQqwHevZy19/UMOexHZPFhT2aAZwTBMx7Q5mRhM/qbYdfkEHkFnlAX@lists.linux.dev
X-Gm-Message-State: AFq9FYIaNIXhhFu/JNgQTJSU1GtoXbZuRHuHBbZhRcwMmaV3Uaq+ArF9
	OldaFbTyijUkBFiZLtKJu6jWyjWNora1lokrv7ep7/SZiD7zPtMO8RU5SjmR4WPlgu4=
X-Gm-Gg: AYBFou2xGU31Gv9KU9MjyvrCW7C9IkmXd3E8gQo4I4cMwNsTs7A+MoXi7mhagkjfQIh
	zJ44UmNXi99bTYMEenycSDJ83eijO6hKIiE5CN/wxpryUH43Gk1wvGtd7r0dpbFlcU4VFfMem5H
	wI4CVUswGYwe1lbQQMFih2ZQ+XzlV49iU868biyQEbVcc4bNTULQUc+s4A8xqj6Cwl71LeoPBU8
	S3xJpwojX0tYnEhx1fBvIbkRoX9DzKFcyxeE9Ib/r67EHwr9QyxwIPCnIx1tgTnmz+5IQi39bsW
	zvTFsE7RZfn2VUquRzzOl9/hvomIixvEq+TGcBZZm8CfB1ETy0zh2Wep+FiRsVZ00VWUArrCKQY
	zeW7EfTJNwuw6jzXeyIsktb4HJtnJgDzziHkaAQySP7WSopO8PDYa1byWBJy2ZwYATrAeFpnK+T
	Yfm6Et3GSpp0VNhbNVdjwwyTBi9BRKFyz7tcx8eJhyPyYHUH+DFBD93CCgZuhUAXqj8HG9HEDyO
	OBXXh5JIX59NPYYK4R/WF4ZWi+yM44Ni0MGn8C8URNr/gTRS18wI/LpVtlfT+GBy0Y7jCyvGYsg
	8EQ5d3DSRWwDx8t2/MRbZLvj5pjXuG0R/ifX1mMNKyHaoZDPzcoO50n0ZJQ=
X-Received: by 2002:a05:600c:190f:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4a2001aa316mr79122885e9.0.1792657805302;
        Thu, 22 Oct 2026 01:30:05 -0700 (PDT)
Received: from localhost.localdomain (2a02-8429-85a0-b901-3ef0-11ff-fe45-70e0.rev.sfr.net. [2a02:8429:85a0:b901:3ef0:11ff:fe45:70e0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a62aaasm53713635e9.15.2026.10.22.01.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:30:04 -0700 (PDT)
From: Martin Wetterwald <martin@wetterwald.eu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Martin Wetterwald <martin@wetterwald.eu>,
	Gaston Gonzalez <gascoar@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <uajain@igalia.com>,
	Kees Cook <kees@kernel.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH v2] platform/raspberrypi: vchiq: register bus at subsys_initcall
Date: Thu, 22 Oct 2026 10:29:24 +0200
Message-ID: <20261022082927.59030-1-martin@wetterwald.eu>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since 6.19-rc1, with CONFIG_BCM2835_VCHIQ=y and CONFIG_SND_BCM2835=y
(both builtin), the sound cards bcm2835_headphones and bcm2835_hdmi are
not detected anymore (vc4-hdmi is not affected).

dmesg shows:

  Driver 'bcm2835-audio' was unable to register with bus_type
  'vchiq-bus' because the bus was not initialized.

Since the VCHIQ interface was moved out of staging, its bus is no longer
guaranteed to be registered before its client drivers. bcm2835-audio,
still in drivers/staging, registers at device_initcall level and now
runs first.

Register the bus and the platform driver at subsys_initcall so the bus
exists before any client driver, independently of link order. The
platform driver probe already returns -EPROBE_DEFER while the firmware
is not ready, so probing earlier is safe. When built as modules, this is
equivalent to module_init() and nothing changes.

Tested on Raspberry Pi 1B rev2, 1B+, 2B, 3B and 4B with VCHIQ and
bcm2835-audio both builtin and both as modules.

Cc: stable@vger.kernel.org
Fixes: aa125180c673 ("platform/raspberrypi: Destage VCHIQ interface")
Reported-by: Martin Wetterwald <martin@wetterwald.eu>
Closes: https://lore.kernel.org/r/CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com/
Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
Tested-by: Gaston Gonzalez <gascoar@gmail.com> # Raspberry Pi Zero
Signed-off-by: Martin Wetterwald <martin@wetterwald.eu>
---
Hi Greg,
this is a regression introduced by aa125180c673 (via your tree) in
6.19-rc1 and present in 6.19.y through 7.3.y. If the staging pull for
7.4-rc1 has not been sent yet, could you take it there? Otherwise,
staging-linus would be great. Thanks!

v2:
- Reword commit message with more precise description
- Add Cc: stable@vger.kernel.org
- Remove redundant Link: pointing to same report as Closes:
- Collect Tested-by and Reviewed-by tags from v1
- Link to v1: https://lore.kernel.org/all/20261013131435.1454019-1-martin@wetterwald.eu/
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
2.56.0

