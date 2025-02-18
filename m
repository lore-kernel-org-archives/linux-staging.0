Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E87749C
	for <linux-staging@lists.linux.dev>; Tue, 18 Feb 2025 02:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739845096; cv=none; b=ACLWqEiLWAVKIydikb0AP5w0cUSJLPARYoiBp0su8nMCQzZb75/chhV9nBcSCHNBDKDbWk4+iRw1s5e48kuhm/9y+ydLa5lbEJCSLC5oMIBVTzBBcWQr/yg2O/YEsSVnyAeakGk3kO3DHPFi86ppGoOkG4G2EPesidXnRMzPx0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739845096; c=relaxed/simple;
	bh=+jEY5OlHpGV5AFb5jQJZTXbAEgNw9EbpnYJ/UillEZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p+JbfMiu5OcJJfhaZuBBnUKmnhbV0XgcBP9KUdFcIyKVhRnl9MH4FfvydyezsVsEC6PTeskl5r2Vg2nCcW6pQX31jm40DtPm4rO97NBqpBGSr7b8/tDXyWZtpWBkkEvyY29B9DnSnui5vzZt6CHJJL9v1Rxk5guw1l3UHdxPN5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jyF1r4Il; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jyF1r4Il"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-8691b23d129so511625241.3
        for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 18:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739845094; x=1740449894; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ex8hRFxXF1hvUhKpWOLQdGJNKmMLwROp1AmH4qR9WH8=;
        b=jyF1r4IlaxT9yeGpqroJ+iqiOy21aV5rFufiwtg2mVT3SRvIPqWVQi8fQoKGP/Bvai
         qSz2Y1+VgF+7DQVj6cRjAoaG5G73HlTY+7SMmsjWF1VScI2VgjoPlr4ScBwvUgXmuu9N
         0Gpxzk7O+JC19KKFxf/9PdMXKxuAYLQLCaDdG3Hc5Twh3d8tyqgYaouicOwNVLqhRSs6
         +75Axv9qphwKsytDv5F3/K1RZUehqFqUDfeHPfOkZVMpWu0j+I11q6lMBv37nqdFAnZL
         7j7tI38ho5eTEyLYGvlN/VVMXaIwqyNovhluvHIyZ4acq8RQrfl0gzJJtaZvoSHf9nve
         Ad6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739845094; x=1740449894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ex8hRFxXF1hvUhKpWOLQdGJNKmMLwROp1AmH4qR9WH8=;
        b=PFNF1E843wL8i8EAMBifKgArSOri90wDsiQcUfFmaqyH0HF393U9262eXQyEJMTIrc
         lIIrthu/lhesLcR8v+ti0cDcMrDEnBXsHtLgxGY2eH6IRFBPkQwWvQv/kID5ygW7exUm
         p1CgFpYBIwzCzLG4sRo7QNoaWXAzx0NjzNBzR5SxLud4ndiZ60tmRH1jL4oJmFSp50X0
         oyjZSEv2ewDPrDFEslVGz2B2f+7xrG6M+j+p10yG+kKrRLEMBg4p13WNh6nlEuz3jW19
         CUrV/sowVikGTmQ2RQnXVw9hzdWsK5/mwFYq3ok1llMp4WbFaJ3RQcvEoY+oFdJ2kJCG
         Uhbw==
X-Forwarded-Encrypted: i=1; AJvYcCVcYPlP/2PWgI+bD5CojtZOpfzMU13mq7iDhhZPDlreVTAQw0tYr+a1onCX9dvwCwsNuSUZsFpwwdXO8K33@lists.linux.dev
X-Gm-Message-State: AOJu0YxqE4QWj6dbZWPwht350ulDISwf35zAKmDzzyvhpKyc5bci+Q46
	2W+zGsyt6Iejw4FywKD0oUOHTIFpJGn6TTD/ryoS/dZFNWvl57n+lFAmuWQo
X-Gm-Gg: ASbGnct0Hlf5dMyNI08z/Nxc9yg/QRFY/9A4TG1RC0MWCjjo+O471n6y3EheZcEvfZ6
	8WPhs3fcuhKooUMMf9kyuGX2i765c4hr2yhcAgfUKd+A+1Z9xS7cenhJtHio0hCHDECt5lNt4V1
	O2FXqL0w64k16DkVl9WNj4z2hgAGsPAcrOrklw/dgQ4SrGjBprhb00yX4T6HzIDu4/tCt3tL05e
	vyYxct5JD45CG1TSmwimjsCq93uTxZRjzfhT0UIn0ICiCRJAkHrkSQ/plHLViebmH/x0VDLdn51
	OyA4rj1+5jgRr7p7ybKlvWpSuItCtyGOmWhsFuE=
X-Google-Smtp-Source: AGHT+IEWBVXA5aZcjaHpcLCYzlvIDfq0n1svbTL5IKiMjYjqGlIVwe2jXVab+cTcFyRkPjsDS+uxOA==
X-Received: by 2002:a05:6102:2c83:b0:4ba:9923:fa57 with SMTP id ada2fe7eead31-4bd3fcf55a2mr6741803137.15.1739845093572;
        Mon, 17 Feb 2025 18:18:13 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:7409:107a:a63b:a3da])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-868e8546dd7sm2209594241.7.2025.02.17.18.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 18:18:13 -0800 (PST)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org,
	dpenkler@gmail.com
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: gpib: change return type of t1_delay function to report errors
Date: Mon, 17 Feb 2025 23:12:54 -0300
Message-ID: <20250218021804.29016-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current code returns "unsigned int" and it doesn't handle errors
correctly if it happens during ioctl call for t1 delay configuration.

The ni_usb_t1_delay(), from NI, is the only function returning -1
at this point. The caller, t1_delay_ioctl(), doesn't check for errors
and sets board->t1_nano_sec to -1 and returns success.
The board->t1_nano_sec value is also used in ni_usb_setup_t1_delay()
besides the ioctl call and a value of -1 is treated as being above 1100ns.
It may or may not have a noticeable effect, but it's obviously not right
considering the content of ni_usb_setup_t1_delay().

Typical delays are in the 200-2000 range, but definitely not more
than INT_MAX so we can fix this code by changing the return type to int
and adding a check for errors. While we're at it, lets change the error
code in ni_usb_t1_delay() from -1 and instead propagate the error from
ni_usb_write_registers().

Fixes: 4e127de14fa7 ("staging: gpib: Add National Instruments USB GPIB driver")
Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
Changelog:
v2: merge patchset into one commit; 
    minor change at return statement;
	improve commit msg as suggested by Dan;
v1: https://lore.kernel.org/linux-staging/20250212024247.176572-1-rodrigo.gobbi.7@gmail.com/
---
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 2 +-
 drivers/staging/gpib/agilent_82357a/agilent_82357a.c | 2 +-
 drivers/staging/gpib/cb7210/cb7210.c                 | 2 +-
 drivers/staging/gpib/cec/cec_gpib.c                  | 2 +-
 drivers/staging/gpib/common/gpib_os.c                | 5 ++++-
 drivers/staging/gpib/eastwood/fluke_gpib.c           | 2 +-
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c             | 2 +-
 drivers/staging/gpib/gpio/gpib_bitbang.c             | 2 +-
 drivers/staging/gpib/hp_82335/hp82335.c              | 2 +-
 drivers/staging/gpib/hp_82341/hp_82341.c             | 2 +-
 drivers/staging/gpib/include/gpib_types.h            | 2 +-
 drivers/staging/gpib/include/nec7210.h               | 4 ++--
 drivers/staging/gpib/ines/ines.h                     | 2 +-
 drivers/staging/gpib/ines/ines_gpib.c                | 2 +-
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c   | 3 +--
 drivers/staging/gpib/nec7210/nec7210.c               | 4 ++--
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c            | 4 ++--
 drivers/staging/gpib/pc2/pc2_gpib.c                  | 2 +-
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c          | 2 +-
 19 files changed, 25 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 5c62ec24fced..d3635d283234 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -475,7 +475,7 @@ static int agilent_82350b_line_status(const gpib_board_t *board)
 	return tms9914_line_status(board, &priv->tms9914_priv);
 }
 
-static unsigned int agilent_82350b_t1_delay(gpib_board_t *board, unsigned int nanosec)
+static int agilent_82350b_t1_delay(gpib_board_t *board, unsigned int nanosec)
 {
 	struct agilent_82350b_priv *a_priv = board->private_data;
 	static const int nanosec_per_clock = 30;
diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index 69f0e490d401..f081bbbda54c 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -1044,7 +1044,7 @@ static unsigned short nanosec_to_fast_talker_bits(unsigned int *nanosec)
 	return bits;
 }
 
-static unsigned int agilent_82357a_t1_delay(gpib_board_t *board, unsigned int nanosec)
+static int agilent_82357a_t1_delay(gpib_board_t *board, unsigned int nanosec)
 {
 	struct agilent_82357a_priv *a_priv = board->private_data;
 	struct usb_device *usb_dev = interface_to_usbdev(a_priv->bus_interface);
diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index 381c508f62eb..e2e90dd11f0b 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -410,7 +410,7 @@ static int cb7210_line_status(const gpib_board_t *board)
 	return status;
 }
 
-static unsigned int cb7210_t1_delay(gpib_board_t *board, unsigned int nano_sec)
+static int cb7210_t1_delay(gpib_board_t *board, unsigned int nano_sec)
 {
 	struct cb7210_priv *cb_priv = board->private_data;
 	struct nec7210_priv *nec_priv = &cb_priv->nec7210_priv;
diff --git a/drivers/staging/gpib/cec/cec_gpib.c b/drivers/staging/gpib/cec/cec_gpib.c
index 18933223711e..801f041def99 100644
--- a/drivers/staging/gpib/cec/cec_gpib.c
+++ b/drivers/staging/gpib/cec/cec_gpib.c
@@ -169,7 +169,7 @@ static uint8_t cec_serial_poll_status(gpib_board_t *board)
 	return nec7210_serial_poll_status(board, &priv->nec7210_priv);
 }
 
-static unsigned int cec_t1_delay(gpib_board_t *board, unsigned int nano_sec)
+static int cec_t1_delay(gpib_board_t *board, unsigned int nano_sec)
 {
 	struct cec_priv *priv = board->private_data;
 
diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 4901e660242e..321f93d926b6 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -2018,8 +2018,11 @@ static int t1_delay_ioctl(gpib_board_t *board, unsigned long arg)
 
 	delay = cmd;
 
-	board->t1_nano_sec = board->interface->t1_delay(board, delay);
+	retval = board->interface->t1_delay(board, delay);
+	if (retval < 0)
+		return retval;
 
+	board->t1_nano_sec = retval;
 	return 0;
 }
 
diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index d5b1a03abf11..77b912326018 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -221,7 +221,7 @@ static int fluke_line_status(const gpib_board_t *board)
 	return status;
 }
 
-static unsigned int fluke_t1_delay(gpib_board_t *board, unsigned int nano_sec)
+static int fluke_t1_delay(gpib_board_t *board, unsigned int nano_sec)
 {
 	struct fluke_priv *e_priv = board->private_data;
 	struct nec7210_priv *nec_priv = &e_priv->nec7210_priv;
diff --git a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
index f950e7cdd8f8..211807c25a6b 100644
--- a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
+++ b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
@@ -255,7 +255,7 @@ static int fmh_gpib_line_status(const gpib_board_t *board)
 	return status;
 }
 
-static unsigned int fmh_gpib_t1_delay(gpib_board_t *board, unsigned int nano_sec)
+static int fmh_gpib_t1_delay(gpib_board_t *board, unsigned int nano_sec)
 {
 	struct fmh_priv *e_priv = board->private_data;
 	struct nec7210_priv *nec_priv = &e_priv->nec7210_priv;
diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 828c99ea613f..23af35b96354 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -1012,7 +1012,7 @@ static uint8_t bb_serial_poll_status(gpib_board_t *board)
 	return 0; // -ENOSYS;
 }
 
-static unsigned int bb_t1_delay(gpib_board_t *board,  unsigned int nano_sec)
+static int bb_t1_delay(gpib_board_t *board,  unsigned int nano_sec)
 {
 	struct bb_priv *priv = board->private_data;
 
diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/staging/gpib/hp_82335/hp82335.c
index 451d5dc6d340..a1151ee8f373 100644
--- a/drivers/staging/gpib/hp_82335/hp82335.c
+++ b/drivers/staging/gpib/hp_82335/hp82335.c
@@ -161,7 +161,7 @@ static int hp82335_line_status(const gpib_board_t *board)
 	return tms9914_line_status(board, &priv->tms9914_priv);
 }
 
-static unsigned int hp82335_t1_delay(gpib_board_t *board, unsigned int nano_sec)
+static int hp82335_t1_delay(gpib_board_t *board, unsigned int nano_sec)
 {
 	struct hp82335_priv *priv = board->private_data;
 
diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
index 800f99c05566..aeca0013328f 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.c
+++ b/drivers/staging/gpib/hp_82341/hp_82341.c
@@ -397,7 +397,7 @@ static int hp_82341_line_status(const gpib_board_t *board)
 	return tms9914_line_status(board, &priv->tms9914_priv);
 }
 
-static unsigned int hp_82341_t1_delay(gpib_board_t *board, unsigned int nano_sec)
+static int hp_82341_t1_delay(gpib_board_t *board, unsigned int nano_sec)
 {
 	struct hp_82341_priv *priv = board->private_data;
 
diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index b41781a55a60..5ee72683b2e0 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -170,7 +170,7 @@ struct gpib_interface_struct {
 	 */
 	uint8_t (*serial_poll_status)(gpib_board_t *board);
 	/* adjust T1 delay */
-	unsigned int (*t1_delay)(gpib_board_t *board, unsigned int nano_sec);
+	int (*t1_delay)(gpib_board_t *board, unsigned int nano_sec);
 	/* go to local mode */
 	void (*return_to_local)(gpib_board_t *board);
 	/* board does not support 7 bit eos comparisons */
diff --git a/drivers/staging/gpib/include/nec7210.h b/drivers/staging/gpib/include/nec7210.h
index ca998c4a84bf..a9c6d1b3cb6a 100644
--- a/drivers/staging/gpib/include/nec7210.h
+++ b/drivers/staging/gpib/include/nec7210.h
@@ -108,8 +108,8 @@ void nec7210_parallel_poll_response(gpib_board_t *board,
 				    struct nec7210_priv *priv, int ist);
 uint8_t nec7210_serial_poll_status(gpib_board_t *board,
 				   struct nec7210_priv *priv);
-unsigned int nec7210_t1_delay(gpib_board_t *board,
-			      struct nec7210_priv *priv, unsigned int nano_sec);
+int nec7210_t1_delay(gpib_board_t *board,
+		     struct nec7210_priv *priv, unsigned int nano_sec);
 void nec7210_return_to_local(const gpib_board_t *board, struct nec7210_priv *priv);
 
 // utility functions
diff --git a/drivers/staging/gpib/ines/ines.h b/drivers/staging/gpib/ines/ines.h
index 3918737fa21a..57c3a4f8a546 100644
--- a/drivers/staging/gpib/ines/ines.h
+++ b/drivers/staging/gpib/ines/ines.h
@@ -60,7 +60,7 @@ void ines_parallel_poll_response(gpib_board_t *board, int ist);
 void ines_serial_poll_response(gpib_board_t *board, uint8_t status);
 uint8_t ines_serial_poll_status(gpib_board_t *board);
 int ines_line_status(const gpib_board_t *board);
-unsigned int ines_t1_delay(gpib_board_t *board, unsigned int nano_sec);
+int ines_t1_delay(gpib_board_t *board, unsigned int nano_sec);
 void ines_return_to_local(gpib_board_t *board);
 
 // interrupt service routines
diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 22a05a287bce..2aac58ca7ed4 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -63,7 +63,7 @@ void ines_set_xfer_counter(struct ines_priv *priv, unsigned int count)
 	ines_outb(priv, count & 0xff, XFER_COUNT_LOWER);
 }
 
-unsigned int ines_t1_delay(gpib_board_t *board, unsigned int nano_sec)
+int ines_t1_delay(gpib_board_t *board, unsigned int nano_sec)
 {
 	struct ines_priv *ines_priv = board->private_data;
 	struct nec7210_priv *nec_priv = &ines_priv->nec7210_priv;
diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 85322af62c23..84f9bde6f8d1 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -1120,8 +1120,7 @@ static uint8_t usb_gpib_serial_poll_status(gpib_board_t *board)
 }
 
 /* t1_delay */
-
-static unsigned int usb_gpib_t1_delay(gpib_board_t *board, unsigned int nano_sec)
+static int usb_gpib_t1_delay(gpib_board_t *board, unsigned int nano_sec)
 {
 	dev_alert(board->gpib_dev, "%s:%s - currently a NOP\n", NAME, __func__);
 	return 0;
diff --git a/drivers/staging/gpib/nec7210/nec7210.c b/drivers/staging/gpib/nec7210/nec7210.c
index c9a837fad96e..17c9c2571dbc 100644
--- a/drivers/staging/gpib/nec7210/nec7210.c
+++ b/drivers/staging/gpib/nec7210/nec7210.c
@@ -373,8 +373,8 @@ void nec7210_release_rfd_holdoff(gpib_board_t *board, struct nec7210_priv *priv)
 }
 EXPORT_SYMBOL(nec7210_release_rfd_holdoff);
 
-unsigned int nec7210_t1_delay(gpib_board_t *board, struct nec7210_priv *priv,
-			      unsigned int nano_sec)
+int nec7210_t1_delay(gpib_board_t *board, struct nec7210_priv *priv,
+		     unsigned int nano_sec)
 {
 	unsigned int retval;
 
diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index d0656dc520f5..5c2eec7a403d 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -1591,7 +1591,7 @@ static int ni_usb_setup_t1_delay(struct ni_usb_register *reg, unsigned int nano_
 	return i;
 }
 
-static unsigned int ni_usb_t1_delay(gpib_board_t *board, unsigned int nano_sec)
+static int ni_usb_t1_delay(gpib_board_t *board, unsigned int nano_sec)
 {
 	int retval;
 	struct ni_usb_priv *ni_priv = board->private_data;
@@ -1605,7 +1605,7 @@ static unsigned int ni_usb_t1_delay(gpib_board_t *board, unsigned int nano_sec)
 	retval = ni_usb_write_registers(ni_priv, writes, i, &ibsta);
 	if (retval < 0) {
 		dev_err(&usb_dev->dev, "%s: register write failed, retval=%i\n", __func__, retval);
-		return -1;	//FIXME should change return type to int for error reporting
+		return retval;
 	}
 	board->t1_nano_sec = actual_ns;
 	ni_usb_soft_update_status(board, ibsta, 0);
diff --git a/drivers/staging/gpib/pc2/pc2_gpib.c b/drivers/staging/gpib/pc2/pc2_gpib.c
index 3eccd4c54afa..863217aea818 100644
--- a/drivers/staging/gpib/pc2/pc2_gpib.c
+++ b/drivers/staging/gpib/pc2/pc2_gpib.c
@@ -215,7 +215,7 @@ static uint8_t pc2_serial_poll_status(gpib_board_t *board)
 	return nec7210_serial_poll_status(board, &priv->nec7210_priv);
 }
 
-static unsigned int pc2_t1_delay(gpib_board_t *board, unsigned int nano_sec)
+static int pc2_t1_delay(gpib_board_t *board, unsigned int nano_sec)
 {
 	struct pc2_priv *priv = board->private_data;
 
diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index 2e1c3cbebaca..924af43025ed 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -176,7 +176,7 @@ static int tnt4882_line_status(const gpib_board_t *board)
 	return status;
 }
 
-static unsigned int tnt4882_t1_delay(gpib_board_t *board, unsigned int nano_sec)
+static int tnt4882_t1_delay(gpib_board_t *board, unsigned int nano_sec)
 {
 	struct tnt4882_priv *tnt_priv = board->private_data;
 	struct nec7210_priv *nec_priv = &tnt_priv->nec7210_priv;
-- 
2.47.0

