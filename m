Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1647C36C9D9
	for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 03:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776569245; cv=none; b=Q1PAvHxglrNObib4X3pO5Qt2sZQzceLXd512bGbjJgmpibNXVkWVtAY4ifakhE0oskbjAtycDXIXrxJeUFZdBKXOjIQttyYEXF42c2jeATmoIFNNR86QTUJdB0BHu6zdxnSK1Y5ByDwuYsT++sxAXPbT+El25Fe1au1aQDYT37A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776569245; c=relaxed/simple;
	bh=sxyPbdnKee1O0+Y6CSiwsqaNHXus8cYPJ3uN1OWCzJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ucrJUrpO3S6i23QPIWM27eVddkbRKGmhI8Sr1TPA1fFd5u83eX/GGjuLxzcrgPwDI1sNjPflO9oJNxxgmAE3chMQ8mi5Pmxb7K7bEZxHsyT7bbIXZw86Y9UqricaiBnw4ie2ip1+ILjxLBENY76Q2/tWg/TguljcIEGCVIiaJgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BsCUhhwk; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsCUhhwk"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2aaf43014d0so11852265ad.2
        for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 20:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776569232; x=1777174032; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FpvRvMQTPx9sUe9bSbatRTALRpCc/0zQhkXDO/h/Er0=;
        b=BsCUhhwkoNSsXmWJr4RD4h2+lmkdCoM1PWb0CDEOD+3C9spoerguApvQE21CH/ljNY
         ugb/lbDCeTujgoIRkIEj8k7zICxrhI04BjW9yMV5aWzf7raDLf7rcQnr9oSwvqZ+3ALW
         TXmguGiw5jVA4MvcO69l+UfUSmIAUZBO3bqFhwJLPPVPh/lBTPXvlL4RaJ88EzycsnvA
         cjVOGnlfzV+rSNgan8NVLeurgamLDVXq4icxqWwAgJFJ0NVz6CfWCbT9vSGYWy+eexVd
         79+ydabajdA2y08dPZOzzcUaCJ1xJCfDiw3+vukmqRqoPSJWK/7IJFzqZy3OcGO7Oxpa
         JiSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776569232; x=1777174032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpvRvMQTPx9sUe9bSbatRTALRpCc/0zQhkXDO/h/Er0=;
        b=PbH6w9Tx7jWSyRllvJ36ZhlQFgbitaKqRd2SvbenQW27p7C9vytiAwflkmtEbHnRrR
         nt2ZZ3DlJ26dU4KQm4PCkjuTLqSKj0CEzcXgYaUFnc/SnFMw4zJYfja4zGRf7LQTQbGO
         oxR+AoMNXGIyIDFKVC+XnwZ0uZVY3RFTnhN7/ZW01t5+zpXHiny+Cpso6KoClc4Akxe2
         fItwBJ4+l0XDEuBbXeaG+P5jX3zgsD2eOTHL76EwD4zZxbYEuNmrx1K8vnW1KfuV76Nn
         Dc47uEIoHn1Tn2MtSmbJffEfXeVs3vrzhA+7YhdMwKD+7EaG//PD/5NsUVWLh1lGtPHy
         TiLw==
X-Forwarded-Encrypted: i=1; AFNElJ9rYLhzLRb8vj9i9KpQHC7LEURgFKvEs2TTTCSatyzTZsEO5e7AiCo70lraucp4Lo4yVU+clRp/LPKK/rkH@lists.linux.dev
X-Gm-Message-State: AOJu0Yyf4wIgeVi1gd+XGUT1FH2Ts5eETCA1Q6YVfKiInC2A2THYCkTD
	t+s51kjWr9YmCwq0YSLRsNVNQ9y2Zg4xHhjpuX/S8298ZjC1c03McJgd
X-Gm-Gg: AeBDiev1XfoV4pbDl5VVue6ki101xppm8UCyyH10mk9/zRhapv1vDNZksqT0eFjQhR3
	nKi0T8UAkqg9d1V7PLBhs2rTouzxjKREzAM9jOMJx47GjI3tqq4iv+2pEMCS+B5d5H/cUk+TsCa
	6R6FKGX8FYFQr5zc26x/rdq0dMHPfOTMOudpjDZ4a0ixgweTvBIOiyIQ+GjvvWwjkC8I3tBRbEi
	CJE1fx2zHr5+kqKNGuStXr3mwWsjnm7T7DklkoEqizxafctvR1xYR+OlUeJ+1Hwnhc1MUTC1AQN
	1tqpnmsXfJmKwmChBc+rcMRu4BDp1WyVwyHMLwM3jDgU4iDl6yTa0z0oqoQlqVBtt7q7FeVcCTG
	Bcc68zMz4ZYiO3W2G3A+Kd0QILHWraN8c1Ytapg9A2wKQyBKFvYA93ViXhHLARGGuJ/B59tcyxF
	Xl1n50gVS45yCVpV6/1iLmmHo/oYO0AQ6G70BMv6NU3zdn5hTio1Cu
X-Received: by 2002:a17:902:e184:b0:2b4:5931:bc4c with SMTP id d9443c01a7336-2b5f9ecd237mr64143525ad.15.1776569231931;
        Sat, 18 Apr 2026 20:27:11 -0700 (PDT)
Received: from arch.localdomain ([103.182.132.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cf3bsm74202655ad.44.2026.04.18.20.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 20:27:11 -0700 (PDT)
From: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
To: dtwlin@gmail.com
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	debjeetbanerjee48@gmail.com
Subject: [PATCH] staging: greybus: uart: document c_cflag handling in set_termios
Date: Sun, 19 Apr 2026 08:56:32 +0530
Message-ID: <20260419032632.35351-1-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gb_tty_set_termios() derives UART line configuration from a subset of
termios->c_cflag bits, namely CSIZE, CSTOPB, PARENB, PARODD, CMSPAR,
CRTSCTS, CLOCAL and CBAUD. Other c_cflag bits are not interpreted by
the driver and are not represented in the Greybus UART protocol
messages.

The existing FIXME suggests clearing unsupported bits from termios.
However, the driver already limits its behavior to the supported subset
when constructing line coding, and unused bits are effectively ignored.
No invalid or unsupported values are propagated to the hardware.

Replace the FIXME with a comment documenting which c_cflag bits are
consumed by the driver and clarifying that other bits are ignored.

No functional change intended.

Signed-off-by: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
---
 drivers/staging/greybus/uart.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 7d060b4cd33d..49d685a6ad8c 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -494,8 +494,20 @@ static void gb_tty_set_termios(struct tty_struct *tty,
 				(termios->c_cflag & CMSPAR ? 2 : 0) : 0;
 
 	newline.data_bits = tty_get_char_size(termios->c_cflag);
-
-	/* FIXME: needs to clear unsupported bits in the termios */
+	/*
+	 * The Greybus UART driver only interprets a subset of termios
+	 * c_cflag bits when configuring line settings:
+	 *
+	 *   - CSIZE via tty_get_char_size() for data bits
+	 *   - CSTOPB for stop-bit format
+	 *   - PARENB, PARODD, CMSPAR for parity encoding
+	 *   - CRTSCTS for hardware flow control
+	 *   - CLOCAL for modem control handling
+	 *   - CBAUD via C_BAUD() for baud rate and B0 semantics
+	 *
+	 * Other c_cflag bits are ignored as they are not represented in
+	 * the Greybus UART protocol.
+	 */
 	gb_tty->clocal = ((termios->c_cflag & CLOCAL) != 0);
 
 	if (C_BAUD(tty) == B0) {
-- 
2.53.0

