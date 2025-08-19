Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B54621ADCB
	for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 19:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755632714; cv=none; b=bmQqpoyvKg5v/OiBgD1U5IoGbPv3OC57GD+V7yYlKA/1spQOWcBDS0YVi6NfmdbbONna59YqbpQKT1CjV1YqThfQwnupuhR5AlzYP+lLVFaXvjRnqo5jXtPJBFo8+8Oti0+IK3cKOyMvtj4qCmXeu/YSBBvXeIS/235yBsrEf5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755632714; c=relaxed/simple;
	bh=7hYcoDZzopVr3IFH6fDdSM89T0PNbMOEudRMR0Xt7Eo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p9dLxeaJCJshAkdj3Vtr95ZwqDaHhuif2IaYvXgk1cVrBYwVyvKYRK5q98Tsn0aDqpyG2Q69I2ft4+lLoOvKVC3Lr4nn78xxHZ+uD7wUMeCpVjbzzIv6EV/0OfMrYb9NpR6oBDmfuoOpJepsfIM6D6V5Dkw+M/QjRkeJ6sEIJzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S66Ivw29; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S66Ivw29"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45a1b065d58so43440535e9.1
        for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 12:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755632711; x=1756237511; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=80FfVf7cUzwUy7tgcn/X288yxUMH5V6Bpw69CJ451WU=;
        b=S66Ivw29ArUyAon0t7qCJ2jQuV4hlaS3+ZnWU3Ittd/CIEHJPIflNGNpxIookRaD+j
         8dd3fvyb64Un6rx7ZQEJV+mIgwprNxHWyCtgLlwt9RiknIP8/xqmwCTinC3681g3SfdI
         WR00gaqzBBxmH1DSlD+0lSzmWQkf0pPpZcDWeRSl0+LirbgFKfHQM2UeldLwaq+1fX84
         ifN68Fu2VKU1eozYbA1Rs82HHeDERMLPISXWQ56c80Cn4ztMYblvVwI5L7lzFnN3s0se
         dNzsuhSEtidrDleVFOagVsgdKCiSFE20QrWEz/qbMvx/xxz9/ge9ZweRD9weOvlKSzTe
         J0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755632711; x=1756237511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=80FfVf7cUzwUy7tgcn/X288yxUMH5V6Bpw69CJ451WU=;
        b=iCtGZihDm8UL7h4DhJC1ohZicM1Qa6iw5uEhbF29W26jDMmSbdjHn091/GtIwl2z8F
         ejxy7CVTywotrn95KLSPc9lSK8HX30tSJjoeXxkqKxCocsS/10BmJL4Ah8bmjbpPRBqe
         /6rIphCyjpzOUfK4Lwx4nWs3GYMBVIdqGkD5UdvuEOYMpE7eE2pak0G9osebbWSHOL1E
         3KPMlIsIoiyifrQO81bUHHAfFmpLDYFXKibZPzYpTc8s1VxswSHFll+LTI0Y2DPeuEp5
         fWQlStP1tm1aURVkPz+4exM8r2Lzhb1ehh/UGPyuJZMeguYNlBynRlbo/NZCheiTI0mZ
         keDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF4uGPSoXemRzgOsKPxcw7cqJtAazfs5hnnmlUEvHGMYd5s8RmDk7E+UDxZ0DBvde4OLFzY3ohmReQ0QSP@lists.linux.dev
X-Gm-Message-State: AOJu0YxpDzcfSJz18hzHMpLdNCGAuSNxt98LZn88A0pm+tdAgB5yXmeL
	bm83qCDEoufDJXwDdO/f4DAr59jaiV5xduRRJInDCKGKUiS6o+NUdr5u
X-Gm-Gg: ASbGnctzRLDnzLIZn8A+0A4Lmc0GDjfn8sK3CgfBnCOkXSW0DwMayEN4U8UdXQJS84v
	rjO9lNpeZ1sBxNKOTkNwNIcBcnC/GB0ZpN1p5Y4QROsEtwohoAcSOSfFLgfy/kQcSwRnU21YkrC
	iCkOVLNJjvOpMZJZ7/jbVd9+hTOtwXOQwWJWaXyw4L4ALT1tItHTdPnF9xJQshfGuntjp1dxOLk
	TDFtUpHas0EKlif0rCZ/9H/gmxdpjaUmdUKZJfjJxc97++RKtjsrtJrwT7aPQKwCHQ9yMvNHPWk
	Iq4kmQ/mM0MS7rDIGcmkfIuh3tijDsCiUQgwhaIXFSgefsNUF99TQxGcV54Zeds8AnKO9RtpvsZ
	EWytvO2rsWdQnvUtcCR6q13UALxqmizL0MW3ydP5reZM4dLSGmnovlnvit0gUO/iMZPlExlm/jy
	uj7Qm5jpF+n1TKUYGJabHaqq8EOA==
X-Google-Smtp-Source: AGHT+IEvQoGlja9R+ZR7/ohI+yJpAG3IODPFFy8R3prK2DU3y+dW6LXDTltf0RGXTR9uOiKPhw/bnA==
X-Received: by 2002:a05:600c:3b84:b0:459:d3d0:650e with SMTP id 5b1f17b1804b1-45b479b57abmr1101635e9.13.1755632710303;
        Tue, 19 Aug 2025 12:45:10 -0700 (PDT)
Received: from simo-20nx006jmx (adsl196-216-195-217-196.adsl196-15.iam.net.ma. [196.217.195.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1cda0021sm221264235e9.13.2025.08.19.12.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 12:45:09 -0700 (PDT)
From: Mohammed Guermoud <mohammed.guermoud@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mohammed Guermoud <mohammed.guermoud@gmail.com>
Subject: [PATCH v3] staging: nvec: Remove unused NVEC_PHD macro
Date: Tue, 19 Aug 2025 20:44:30 +0100
Message-ID: <20250819194430.4525-1-mohammed.guermoud@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NVEC_PHD macro is a debugging helper that is only enabled when
NVEC_PS2_DEBUG is defined. As this flag is never defined in the kernel,
the macro and all of its call sites are dead code.

As suggested by Greg Kroah-Hartman, removing the code is the cleanest
solution.

Signed-off-by: Mohammed Guermoud <mohammed.guermoud@gmail.com>
---
v3: Fix commit message.
v2: version caused a build error.  It's better to just delete the
    code instead of trying to silence the warning.
	
 drivers/staging/nvec/nvec_ps2.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/staging/nvec/nvec_ps2.c b/drivers/staging/nvec/nvec_ps2.c
index 7accdcafeeac..2e36893e0008 100644
--- a/drivers/staging/nvec/nvec_ps2.c
+++ b/drivers/staging/nvec/nvec_ps2.c
@@ -23,14 +23,6 @@
 #define DISABLE_MOUSE	0xf5
 #define PSMOUSE_RST	0xff
 
-#ifdef NVEC_PS2_DEBUG
-#define NVEC_PHD(str, buf, len) \
-	print_hex_dump(KERN_DEBUG, str, DUMP_PREFIX_NONE, \
-			16, 1, buf, len, false)
-#else
-#define NVEC_PHD(str, buf, len) do { (void)str; (void)buf; (void)len; } while (0)
-#endif
-
 enum ps2_subcmds {
 	SEND_COMMAND = 1,
 	RECEIVE_N,
@@ -70,18 +62,13 @@ static int nvec_ps2_notifier(struct notifier_block *nb,
 	case NVEC_PS2_EVT:
 		for (i = 0; i < msg[1]; i++)
 			serio_interrupt(ps2_dev.ser_dev, msg[2 + i], 0);
-		NVEC_PHD("ps/2 mouse event: ", &msg[2], msg[1]);
 		return NOTIFY_STOP;
 
 	case NVEC_PS2:
 		if (msg[2] == 1) {
 			for (i = 0; i < (msg[1] - 2); i++)
 				serio_interrupt(ps2_dev.ser_dev, msg[i + 4], 0);
-			NVEC_PHD("ps/2 mouse reply: ", &msg[4], msg[1] - 2);
 		}
-
-		else if (msg[1] != 2) /* !ack */
-			NVEC_PHD("unhandled mouse event: ", msg, msg[1] + 2);
 		return NOTIFY_STOP;
 	}
 
-- 
2.50.1

