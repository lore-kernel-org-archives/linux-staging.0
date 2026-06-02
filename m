Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34745279DB6
	for <linux-staging@lists.linux.dev>; Tue,  2 Jun 2026 20:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780433578; cv=none; b=sYMDKD7QaWRJu/uJK38sNoXRKdqueeMqNeOhWC201n8WSCgIQGX7Cn9w2Ply7TGyYMgBTLQkjzkKIjmWs5eR/dDGwXohrV0kAsfqWyMcj+gQpOtwVdWNflg4ZTgs/osCRgrYy9Owqk1/M4tG8a/CjooxUMp58f4xXTzqjwEdZRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780433578; c=relaxed/simple;
	bh=u0XBenZDhEBA+lykkfvF8anMyiXYW55djW8bkl4rbrw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Nm7Cm/8D49caaqsagubHWe7BG45DytkF2ngJOE9ZwmVMD50ck0eeQJs4d48kRmQc5bwCBYk2LfnNbtxX1WIdLIMjLhZjRpmlDw66zLA+wUxqs/OOMMRfYrV0+cj7uxvw5b04lat+Siiirk5hwLEOln/31GbVX1V+arUG8JEJgCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eki26OCA; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eki26OCA"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49068493267so69323635e9.1
        for <linux-staging@lists.linux.dev>; Tue, 02 Jun 2026 13:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780433575; x=1781038375; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vLEL1JuRFeBETZyRqV6G6esnhA5n8MET+Hx3SHXCdOg=;
        b=Eki26OCAjocgHzuNizDh3R7O6hqtNdDIWF5Xwvd3SdJ83Gr1RSLjfuOl19oO5HhFjP
         xbwbFCKVTj5lKHnEDMO6Q+KfA2Y9teT5MRn66uWRGXVn87K0FWyAJ+688CKYlxZ2VegU
         l0vXsoNYsjDu9KC8pa2C/BXvX7XcLX6YfKlrafj684tpWKm4Sk3lyn2ln24OeW0NiyTI
         yznmEOANeo9nBUKYesCOsaWKL/t+XQseXP4TkXa2S2pUhUWZ0zj+S0qvQUO+Td6JEU1v
         mETfpNaNJoN1HJcu6w/6A0ryll+5T/lf58l7SuYV8Fx9DBRdOhA+1hRTyMaCr+cGTliP
         7zPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780433575; x=1781038375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vLEL1JuRFeBETZyRqV6G6esnhA5n8MET+Hx3SHXCdOg=;
        b=YVdVCNr7jmbd8YmCwPywwTS6P98s70EMaUQa2XERkQQByT7r9U9hXH1b34gGhALcO6
         iEOjEmu6dRIf31gJCuS2V7Gbn8Rymz4Ud10olUDolaKGeSzzqViRaTsZtvTUH4qrfnJi
         E9UZpnw43xgDXQ4RAKZiunEg0QmogCyEmWcXrJkmuxpyDRbptzjDiM28tZ6oEkOQwY4K
         6tTxnsB+tXjRXa8qTxDY7Np0XUaPmvoVe5H29YOi6P/0VpFhY1O1cqUZuJyFkKllnlNo
         jl5sRX5qDBZtAvvDLMWbPnhXNgp57r4K35NCilX1f/RlegonSOp3cfoVJ20A0ikL3jbX
         c22g==
X-Gm-Message-State: AOJu0YzI19VKqYZN4lM7sBn6M9aIr1r4lklALYq/Q0YcPJP7xKt+SL3Q
	spL6bUSL7II9NUN88PGQJctDax6xfLMXSlLSm060q1vcHturMB1/BUF6
X-Gm-Gg: Acq92OEUpFfcld0aPLtQvVC23u2Olhlvfex9PtSsymuxBGj5OFdmUQMOHlOXTyZQgbD
	M6towgqjxKXzWwbcBESvk/b43A9PyiMLJ7CKwC0zB/MkilKU4sz3gt/p4xEZu/w9++EuDClPA7H
	9CEWhreRHzeg2Wf1XVIwJ45RCLsVX/QAeR4AYQslELYnPEimnvfUBVBXzV/OPQ09abwpYA1ppwQ
	Wp0ixcmHlbIiFcAY4tu/iuynS3jpFylCc+UOri3sBpROyBOdMYKx0P2zxpL3TVhgJAEJBHnucbn
	yEiffCKsCjMuHnmGqbokCgiVQKE75EzL9gMFQo3DmHF+qrcfJHV1v5aNQoHN+hIDKl2389SSM1l
	mzWfliPDp3p6KCTUE79rjV9uMY3WomMq1JPayU27P5sYovSIBKqTNQkcv3NMIAT9NEEGqxfj8fU
	MGytXWmEjUTl07UJFJHNDDDezSXGSqRctdtKQZ7Oh1rN2p8Uosh6jzYbSeNOvhPw6eg2CbBBkoy
	eIXmdF42g8=
X-Received: by 2002:a05:600c:3150:b0:490:3b87:be0e with SMTP id 5b1f17b1804b1-490b5fe7117mr6622595e9.29.1780433575448;
        Tue, 02 Jun 2026 13:52:55 -0700 (PDT)
Received: from MSI.lan (uch71-h01-176-129-204-49.dsl.sta.abo.bbox.fr. [176.129.204.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b615fb2bsm6399495e9.5.2026.06.02.13.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 13:52:55 -0700 (PDT)
From: Dorian Catric <dorian.catric@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	marvin24@gmx.de,
	Dorian Catric <dorian.catric@gmail.com>
Subject: [PATCH] staging: nvec: fix coding style issues in nvec.c
Date: Tue,  2 Jun 2026 22:52:52 +0200
Message-Id: <20260602205252.3336-1-dorian.catric@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix three coding style issues detected by checkpatch.pl:

- Fix typo in URL: 'lauchpad.net' -> 'launchpad.net' in the copyright
  header (nvec.h already has the correct spelling)
- Remove extra space in 'enum nvec_msg_category  {' declaration
- Convert EXPORT_SYMBOL() to EXPORT_SYMBOL_GPL() for nvec_write_async()
  and nvec_write_sync() to match the other exported symbols in this driver

Signed-off-by: Dorian Catric <dorian.catric@gmail.com>
---
 drivers/staging/nvec/nvec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 952c5a849a563..f14d9a1eb2ed5 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -2,7 +2,7 @@
 /*
  * NVEC: NVIDIA compliant embedded controller interface
  *
- * Copyright (C) 2011 The AC100 Kernel Team <ac100@lists.lauchpad.net>
+ * Copyright (C) 2011 The AC100 Kernel Team <ac100@lists.launchpad.net>
  *
  * Authors:  Pierre-Hugues Husson <phhusson@free.fr>
  *           Ilya Petrov <ilya.muromec@gmail.com>
@@ -57,7 +57,7 @@
  * @NVEC_MSG_RX: The message is an incoming message (from EC)
  * @NVEC_MSG_TX: The message is an outgoing message (to EC)
  */
-enum nvec_msg_category  {
+enum nvec_msg_category {
 	NVEC_MSG_RX,
 	NVEC_MSG_TX,
 };
@@ -275,7 +275,7 @@ int nvec_write_async(struct nvec_chip *nvec, const unsigned char *data,
 
 	return 0;
 }
-EXPORT_SYMBOL(nvec_write_async);
+EXPORT_SYMBOL_GPL(nvec_write_async);
 
 /**
  * nvec_write_sync - Write a message to nvec and read the response
@@ -331,7 +331,7 @@ int nvec_write_sync(struct nvec_chip *nvec,
 
 	return 0;
 }
-EXPORT_SYMBOL(nvec_write_sync);
+EXPORT_SYMBOL_GPL(nvec_write_sync);
 
 /**
  * nvec_toggle_global_events - enables or disables global event reporting
-- 
2.34.1

