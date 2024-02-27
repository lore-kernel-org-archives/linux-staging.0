Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9294153BEB
	for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 22:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709071853; cv=none; b=pSELAoFPbHNNLmyIvc24rP5sWL0pqxOj/hc0yqo9JqnNAPAe//YMp4PsN4sYxIGhSEcmABiaJO2uxNOItokJsZKPAbShBGIwD8JGFx1HvDtBDGhcWpNtlxmVNSkEuerhi86nMH+qmWKIFcY/bRZaFQ0vAsWoRaZvgSniShdKoOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709071853; c=relaxed/simple;
	bh=sD4PGbM5HqA6toI1/CAMqbYx9lSjxRaalfZB/ur59io=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dms4OWsPJLlt6MMiYrOtPXIUCVhKJ/3HRGViwQFQDEodRXC2g2i0G8INFhqpTiMr8+8sPRM/wlCfrxyF1xx0Phx8WuaKEat2aQrS3iv49P00kYI7Jj6uWTeyzzg1pz149YOc5cMQQFFyGhD5K8OKTcuHSAbBIMmjdTCDmYOJOiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gPjICsKr; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gPjICsKr"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33dcad9e3a2so1706071f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 14:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709071850; x=1709676650; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ieLYzymPNePmb67aE/EpZNATNNR4k3uKBe/0iiseYBc=;
        b=gPjICsKrNiOQq4TGusk/HJLXgPREu7IqAnqJlmo2uITgngQam1wgl/txcWCahQNjFr
         C+K/PuZ1mHKWduVyzJIUVThCKrhceYVIKJ7V4GQ/qyULfhiDkmiulNj5FZ7odtxZ9xrM
         DKRmuj9wNyBq7OcELxFfonvhixYM8MpCu/5d0/IgReDiJl0dT91qF6PL2W++Hg9PJqAm
         Qnn6hw3BAQEuGrrJ8GR7dkKcWXYL7LtD/lzAHHV7CMZ7hlZT4RqWspfVbJAn9EBzbG7o
         HOI7GEAI3ohMB0JFHEb6busz1SIyBqg0H8I3r/62xDykKbA4/zrTsj0jjlyfslccGrnq
         mkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071850; x=1709676650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ieLYzymPNePmb67aE/EpZNATNNR4k3uKBe/0iiseYBc=;
        b=upsJo+jTx2HsGmCN0MiV9iuRoweBFDynoyhEgUKUjLV2/mxSMmRxozcpTafI987d4Y
         AMB0kcFfpIdmTA2MKvO5wEguwOIVrZCCVOaDDKeSkKEtmePdwi7HfpukiWfsPpTAsFI8
         /WNWGO77CEOgEGsxXrvGgIzZmqL1zPF3bwNMZhmwYN/UqnvbxPv+hsdMmDN48Zu3nZSF
         qjY+s9tj9BGnwdGHRsqJZnH3PwGzcbXD9uKCW79moYql6yZrh+hyFqoZih0AGwuY81Qa
         pnMt3nuay9m9xf8mEGYMsNubcGXB0Dj3giSIQwit4WElAsr04hhVjugeMIPy1raDIlGZ
         v5iQ==
X-Gm-Message-State: AOJu0YxJxViKLEv/n57/4ONzD116hm0asmhjMIbJrSm5WbPP9raoK/ze
	k20/Nf8pn/HgFT0j5r4mFW+Pa9w6YhBPRWwuCoPj+fVZobA02PlZ
X-Google-Smtp-Source: AGHT+IGYtdr+FWlrBEQO3ynd5gZ/hRpOp74coj4n9RGoOw6Ao9Edw8bpDsgv1AZ56mQhX/jHXfSCNQ==
X-Received: by 2002:a5d:468a:0:b0:33d:50cd:4672 with SMTP id u10-20020a5d468a000000b0033d50cd4672mr6627351wrq.21.1709071850411;
        Tue, 27 Feb 2024 14:10:50 -0800 (PST)
Received: from YOGA.local ([2a06:c701:736b:f200:73a5:2235:8954:9b7c])
        by smtp.gmail.com with ESMTPSA id q2-20020adfab02000000b0033cf5094fcesm12562384wrc.36.2024.02.27.14.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 14:10:49 -0800 (PST)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	luca.ceresoli@bootlin.com,
	benjamin.tissoires@redhat.com,
	elder@linaro.org,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] staging: pi433: Redefine F_OSC using units.h macro
Date: Wed, 28 Feb 2024 00:10:41 +0200
Message-Id: <20240227221043.532938-4-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227221043.532938-1-ikobh7@gmail.com>
References: <20240227221043.532938-1-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use HZ_PER_MHZ for a more robust definition.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
---
 drivers/staging/pi433/rf69.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index b3b8d1abd3eb..5a1c362badb6 100644
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -8,11 +8,12 @@
 
 #include <linux/types.h>
 #include <linux/spi/spi.h>
+#include <linux/units.h>
 
 #include "rf69.h"
 #include "rf69_registers.h"
 
-#define F_OSC	  32000000 /* in Hz */
+#define F_OSC (32 * HZ_PER_MHZ)
 
 /*-------------------------------------------------------------------------*/
 
-- 
2.34.1

