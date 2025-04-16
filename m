Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FA624C096
	for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 20:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836144; cv=none; b=rCe4FtNqiCHS+GJ6aNbEXsOzu4Y/5jCIeqaUSaOsRpK/CdAF7xXl7kbDXwvOns+PcQWX2waL2dVREYWHhpvj2un/VjqJ70sRZmQXO+Dk4j4piTQPBSDFTw3mBZG/0xJCacELK4FzcZQQd2DLcsF5GoO5Lk72DF4HKdwYzpAshVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836144; c=relaxed/simple;
	bh=Dsmp5RsheRWvvCg8XuqH/IOyChdJsfIjOoakpD6hyQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nk0065zHruXTz1QxWL736iiOwb8IfJJVceWUX70XXfl+hs5ZV5YFM01fKq/lDdpAFN6CVfz+wMosNtcUS8SCPE46e8ArT/inCmBWG0OsY+jajCWwhBUxBlDSxRWL3iEqsMXEwe5mri5AKExSxeE8PCGEf5/vLhsMnFZEPyKkKFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=nEaCQyj3; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="nEaCQyj3"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3081fe5987eso13334a91.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 13:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836143; x=1745440943; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41DhzRK3ONBBmT2sJGJwKrMcn46yaTakFIeFswWFnds=;
        b=nEaCQyj3ouY9vMY6F7GJBA0SulHQ1OOv8x3dccbBg4esDqYbp2FW2ZQ0mJ4zb5fKRP
         Fe48R8jpC34TCSkHWJ1stLectsbJCoPoRsv5h3kAV0mjDI5xmEyIUybnqpDL0pLxHzDo
         jWdU0NJqOvm54/YgxklonNwJ6ikptjayApf2efldIRBgEDf8iT4dFlPALTAE4efUXV2t
         1EhmGWqEQo2M+KBwaEhpEZ78NUJGF8A2K5M38Xa1nd5VKBgy/ty1ADr8Lpkj4t0v4RYY
         QxTbWoRy/gn4H2qfby3lkN4q/Qm1BwC5B5bJ5+2IXxYBVtt4p2edJSIMILD1fDHjHRNG
         GyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836143; x=1745440943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41DhzRK3ONBBmT2sJGJwKrMcn46yaTakFIeFswWFnds=;
        b=CS+1NiRwkD5HgEM+OwXG28Ra8ejB1sCUyMsecEovoct0yBwGzXLoYvVxCqVAbnJO7f
         B9F8dmW45/43V0mO+Jx+2rCmhcXkqWBGmcwhVjVP4zLhs1NcI6f4jYbd+B47q8fvOEFo
         P5BzMxul96wHmgY1uQ0PJVxWoBreMU2NWg9COR5QaQYjGOsxkumJyYVbheXh1GYpVWHL
         5K4Qsj+RlDH/JDFksp4YVXGIbyn0/07FGk6pJir4HEaWuhJ6yCnwnzEInlaybr11u8rh
         8oiQ0aI2h9yUmhLNJJE5QUnzFSDa7T5+B+9+pNX9btzRnFnx0Otp9w2/QDWswz7TyYmy
         xlxw==
X-Gm-Message-State: AOJu0YwLscFeovAkDNVmzyuStkUiBT/rL2+9KBaa7Tmah8Ky6AvbRtkv
	/ljca/WxUjCqwGM+1J0MLop+YTU4xBihhdV67YfNNpbJ2glxH6EpFOje/E/96g==
X-Gm-Gg: ASbGncsblDxv1bqFU+PUnjnBCwFc8DBTYMXpd4KgfBI7yNFnptxfLbYAv0x+izAhVlQ
	xhtoNnxyI1JpEfhylAA64swrw7/mHNub7aek2IcRT6+7n+S0KZ3KbahZcqlIWp8dOzJtlVOD71k
	6ZIT9ukIAAhANtm3TXfV7bwMTXlpQ7fD6MhBVWe+xPg+snPqgTDHEB8oMLHp560uG8SDu/7C98Z
	qS0qSNYl9uDX97hXDg/YVMsF2CU3r4U37mhXP0dwicugaUPH+rH3oXA/hXonDTaSxjbULl+MbnO
	wH+eq7dL1BAMoK4s/Xv/FC/6XtNbAdUQ/PUwspGa4soet4HhzarzKBj+C5rhaEBzPdWwIiT35sJ
	nBYZDDw==
X-Google-Smtp-Source: AGHT+IFXDX7qzzgAc+ruTnxmUO6FrKtnEQRt0vgqXwdJF79eAqjrLA9y3UAj94msFcZ2u+zXUxCwNw==
X-Received: by 2002:a17:90b:514c:b0:301:cba1:7ada with SMTP id 98e67ed59e1d1-30863d257f2mr5314960a91.1.1744836142895;
        Wed, 16 Apr 2025 13:42:22 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308613b2ff9sm2093453a91.30.2025.04.16.13.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:22 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 13/18] staging: gpib: ines: struct gpib_interface
Date: Wed, 16 Apr 2025 20:41:59 +0000
Message-ID: <20250416204204.8009-14-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416204204.8009-1-matchstick@neverthere.org>
References: <20250416204204.8009-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/ines/ines_gpib.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 2d98c571a4b1..bf830defcad3 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -539,7 +539,7 @@ void ines_return_to_local(struct gpib_board *board)
 	nec7210_return_to_local(board, &priv->nec7210_priv);
 }
 
-static gpib_interface_t ines_pci_unaccel_interface = {
+static struct gpib_interface ines_pci_unaccel_interface = {
 	.name = "ines_pci_unaccel",
 	.attach = ines_pci_attach,
 	.detach = ines_pci_detach,
@@ -567,7 +567,7 @@ static gpib_interface_t ines_pci_unaccel_interface = {
 	.return_to_local = ines_return_to_local,
 };
 
-static gpib_interface_t ines_pci_interface = {
+static struct gpib_interface ines_pci_interface = {
 	.name = "ines_pci",
 	.attach = ines_pci_accel_attach,
 	.detach = ines_pci_detach,
@@ -595,7 +595,7 @@ static gpib_interface_t ines_pci_interface = {
 	.return_to_local = ines_return_to_local,
 };
 
-static gpib_interface_t ines_pci_accel_interface = {
+static struct gpib_interface ines_pci_accel_interface = {
 	.name = "ines_pci_accel",
 	.attach = ines_pci_accel_attach,
 	.detach = ines_pci_detach,
@@ -623,7 +623,7 @@ static gpib_interface_t ines_pci_accel_interface = {
 	.return_to_local = ines_return_to_local,
 };
 
-static gpib_interface_t ines_isa_interface = {
+static struct gpib_interface ines_isa_interface = {
 	.name = "ines_isa",
 	.attach = ines_isa_attach,
 	.detach = ines_isa_detach,
@@ -1218,7 +1218,7 @@ void ines_pcmcia_cleanup_module(void)
 	pcmcia_unregister_driver(&ines_gpib_cs_driver);
 }
 
-static gpib_interface_t ines_pcmcia_unaccel_interface = {
+static struct gpib_interface ines_pcmcia_unaccel_interface = {
 	.name = "ines_pcmcia_unaccel",
 	.attach = ines_pcmcia_attach,
 	.detach = ines_pcmcia_detach,
@@ -1246,7 +1246,7 @@ static gpib_interface_t ines_pcmcia_unaccel_interface = {
 	.return_to_local = ines_return_to_local,
 };
 
-static gpib_interface_t ines_pcmcia_accel_interface = {
+static struct gpib_interface ines_pcmcia_accel_interface = {
 	.name = "ines_pcmcia_accel",
 	.attach = ines_pcmcia_accel_attach,
 	.detach = ines_pcmcia_detach,
@@ -1274,7 +1274,7 @@ static gpib_interface_t ines_pcmcia_accel_interface = {
 	.return_to_local = ines_return_to_local,
 };
 
-static gpib_interface_t ines_pcmcia_interface = {
+static struct gpib_interface ines_pcmcia_interface = {
 	.name = "ines_pcmcia",
 	.attach = ines_pcmcia_accel_attach,
 	.detach = ines_pcmcia_detach,
-- 
2.43.0

