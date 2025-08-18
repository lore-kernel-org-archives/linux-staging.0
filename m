Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF86C225414
	for <linux-staging@lists.linux.dev>; Mon, 18 Aug 2025 20:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755549554; cv=none; b=OIb7OJPBr4i16p0+iI1ST3pFkWbgyWtqLiHH3c64EIzg8yFqE9riZ7MttJxSwynsiMD90/d3TWU8C7/0KtWRpKKEs3ie0Ov1kfp7CVQxmhjMJzU65onJVl0GWsUVqV0C8K/3/ask/E7Evc6On+gMpwZVF2K34/d8pjw3Q4buezI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755549554; c=relaxed/simple;
	bh=UgzXDRPHCY+iSvediDp0yrz0486YqPoJsIGQAuwmtCM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jERZYGj9UvNzYQ+oyYVhePhMEvt1xd7tK5TVYF/VjmV95XhriCFw0y3DE0zE0fBw/Qidhxt0jn/We6xzGfpSkq1fR+vo00FwgDNj0puqJmj3nT4JzJEpZRU+GkHiLvWipDmSgEYN7x7uCFwJ5PRw/Cx6kp4wkgpsVRmq2SSxwJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rmn8OgzG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rmn8OgzG"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45a1b05ac1eso22326515e9.1
        for <linux-staging@lists.linux.dev>; Mon, 18 Aug 2025 13:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755549551; x=1756154351; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kQrccaRXBs1IVl7ydgWqPXcB0FTcYEexKWi9dkMZ1eY=;
        b=Rmn8OgzG61q/oKSuq+LyoKtpu+1eQkRI99wAX+O4G6n4eJBM4TuQyFHftIhIW1cqaP
         QRWo0R7BfXbJiXLVq12v/MS3nO1CWU1cpgduAyPmCliAap9vJerMcPX9zgV3JL6CO8Fy
         K8FS2ntH1/SPfDetvBLar3oScwD5vnqyCne4rnn/aD8PZDTGIrnRF+0169Kh8earmTpv
         EjkV3ZFgy6n6cmULOzg/yTzUCSajFkQvuEYY6i/PqVnWQhUgmgbSvqpS8wrVRrZIYdYs
         yKf6zNDjpEvK9KOjO/i+k2JC7v3Mos3n7bZlV2U3GtDWwmG9Y0oFud/65MHK4gPl+zCM
         EhTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755549551; x=1756154351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kQrccaRXBs1IVl7ydgWqPXcB0FTcYEexKWi9dkMZ1eY=;
        b=UuT2s2xvRtU0b9mijJP5564RpYKDn4oE1tSza272MiOxlmyGZ7Znz510+pVzbp/y/7
         QY7rfKKX78spbS3qJg5icYIhmdHUMrsfQ2KqBmZEm2EkuJ+ThOeMPayIag0NpbzkZSAJ
         y/XZC0m0Jf3QfkIKQAkXQpZ8TZGUSuNxCecRwjHICSMUlKgaMENzoG98OE7ebQgnHtLu
         omazN9UiJ47vf0ndjNq+wRo+vOTl1VHmqmC0cf5Y8fkRpb73hzV6Nifk/e685HA+uAcG
         6ZsAso1FvBuDPd2Sm5hRypXVuBqrihaapH7lghm0drdARvNsJGY4OY76To4qupdsU8Ws
         05Xw==
X-Forwarded-Encrypted: i=1; AJvYcCV/2ROIHjvUgjPYXDvptn0KUXSNUwwvAjVW8efILnkG5j1dVSOGXwtD/65k1NnEOvsozHGbNZamPQkXFAKz@lists.linux.dev
X-Gm-Message-State: AOJu0YwKAiZCV75y/NdSorh2KLjyanbYfI7+E+WBrH37nEuX8ATocbJJ
	CZiuitnVNwWq5/xNnHfOYFI8PqHj6c9Qp+IRlwKBVFK2nXZlOUCx35kA
X-Gm-Gg: ASbGncv6NHWemEHTPgoDrJHx1VJBfrsfxjC83F51InzBrJRP4V3/LqEfv4/HhMZoL/B
	HeHu0qSTZr9NDR2J2Q+JmP5pd6a73+LgXRnbSc/tePdTqcpCU8KYigSZQ3ndk8o07moccoZafxX
	ToRZFaiIj4dX+y7LxBSxu/5Ou/P3meFc4mpCg+pWuV/kCtBZYmv1995/KrkdRVMo4g/PXAN4fZC
	24UyzBHqfHpQDfmvxWfiirrpp9obvQQ0t/lqa2OV3hpHpNC/e9+t1x4osYoM1l+n2s3snkNgacA
	1UpC2dMyVO/ewpL4nTB/19/m28b2jUd/bHi8PF2ql7RFfy18VOIZGgRinxUWMZW56Xv15jDfLpp
	VvazyKERR/HH0m2ZNRQnfzqugauuKVtsH7+undw==
X-Google-Smtp-Source: AGHT+IF9VloGoXS4W+Ovzqx4/XtENldzlW4keJIOZcxpWYMhXaJGZR7c5xMhCCHCrd/WiBlGuPuENw==
X-Received: by 2002:a05:600c:4f51:b0:459:d709:e59f with SMTP id 5b1f17b1804b1-45b435a7475mr3839545e9.0.1755549550693;
        Mon, 18 Aug 2025 13:39:10 -0700 (PDT)
Received: from simo-20nx006jmx ([41.141.149.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a24e5562csm130648395e9.20.2025.08.18.13.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 13:39:10 -0700 (PDT)
From: Mohammed Guermoud <mohammed.guermoud@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mohammed Guermoud <mohammed.guermoud@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] staging: nvec: Remove unused NVEC_PHD macro
Date: Mon, 18 Aug 2025 21:38:55 +0100
Message-ID: <20250818203855.11914-1-mohammed.guermoud@gmail.com>
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
solution. This also fixes a build error discovered by the kernel test
robot after the v1 patch modified the macro's body.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508182005.4PiKxXcN-lkp@intel.com/
Signed-off-by: Mohammed Guermoud <mohammed.guermoud@gmail.com>
---
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

