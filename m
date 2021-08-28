Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EE93FC1
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 10:56:39 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id c17so8492506pgc.0
        for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 03:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=sg5nAiaktCH38kYoHhjO0RsLxXlGtuWfNhh8m5dH40k=;
        b=vIGFq/nkRjCbY+xdM6fhuIyFFJR7xNAZQuNAe8vpgD2rGr0gDiJDw0CEV68KGs6v7a
         h9ZyirGIui/6a71WPUcq290J8Hs2UewJyXy2xZ2WwVWYENYmAIKpuXluqThrOFt5XSwG
         sc9paQuTPUvsGPFRy1GlVALaHkOpqStmUCOHErevzA170p8UEpap+8doeorOxuVdDL6s
         7uxQYjEEl1xxqh75HJizVBwyrOytqKs6g2uPD/yTu5TCiZyEcnybqYCiNpwRRG+tShfi
         q4z/w0DEBvNc3NBKB+geTNbEUPv1DloTMNT2GezPYFPmtJEiCPTK9fZlMyB0vBAQloWn
         oFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=sg5nAiaktCH38kYoHhjO0RsLxXlGtuWfNhh8m5dH40k=;
        b=JNTXQGNzLKMcY+ztjraLV5scF7AQZgTdnYkPX+90urklE4sCmguRzRN8RX8GOvY8Of
         nTeY6AU7lPB0ZuskroqtvZlc9O1LtcdCrioc4jZ0FxmAjV+lFGuxWBNv3zVCSVDaF1YT
         c97RdXzp6xDx4GQIjXBwvWuOzvEGBQMH88nR/EgHwzRfaYaNnc6YBkxOnp2i5NSX4bdz
         YgwDPpvZq2rbw9TTM9oNilPfsbJCshD13htld5qq3E9fL3c9Xb1/PiEe6kFvVQF4n3t0
         64xfu8YrIwIlE6UdPzkQSiYmJYF0moIcIEoziBzjGjCk3XYtLQ1PXVygB+w9JNOtDrYW
         CUEA==
X-Gm-Message-State: AOAM530vPlb3jir8DYl0JJ1HcBfK9FtnimkdJ1s6DUUCAWFhQWWo6LCO
	ko3oRYP2Qx+A6Djc2HvQeJpHL28eN1LtMw==
X-Google-Smtp-Source: ABdhPJwtVWlZgKQWyIWMN62OlqGOn+xHS6RFTqHwF3WuY/Tdqr3ODww0gmIOhF76b6eNtLiDn+/7MQ==
X-Received: by 2002:a65:6648:: with SMTP id z8mr11978095pgv.418.1630148198879;
        Sat, 28 Aug 2021 03:56:38 -0700 (PDT)
Received: from localhost.localdomain (125-237-24-95-adsl.sparkbb.co.nz. [125.237.24.95])
        by smtp.gmail.com with ESMTPSA id 10sm9616470pjc.41.2021.08.28.03.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 03:56:38 -0700 (PDT)
Date: Sat, 28 Aug 2021 22:56:33 +1200
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hello@bryanbrattlof.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: pi433: fix docs typos and references to previous
 struct names
Message-ID: <20210828105633.GA8421@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In the comments there where some grammar mistakes and references to
struct names that have gotten renamed over time but not updated
in the comments.

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
v2: revert identation that had been applied to the author's name (Req:
Greg k-h)
v1: https://lore.kernel.org/lkml/20210828000836.GA10188@localhost.localdomain/
---
 drivers/staging/pi433/pi433_if.h | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/pi433/pi433_if.h b/drivers/staging/pi433/pi433_if.h
index d5c1521192c1..855f0bebdc1c 100644
--- a/drivers/staging/pi433/pi433_if.h
+++ b/drivers/staging/pi433/pi433_if.h
@@ -5,14 +5,13 @@
  * userspace interface for pi433 radio module
  *
  * Pi433 is a 433MHz radio module for the Raspberry Pi.
- * It is based on the HopeRf Module RFM69CW. Therefore inside of this
- * driver, you'll find an abstraction of the rf69 chip.
+ * It is based on the HopeRf Module RFM69CW. Therefore, inside of this
+ * driver you'll find an abstraction of the rf69 chip.
  *
- * If needed, this driver could be extended, to also support other
- * devices, basing on HopeRfs rf69.
+ * If needed this driver could also be extended to support other
+ * devices based on HopeRf rf69 as well as HopeRf modules with a similar
+ * interface such as RFM69HCW, RFM12, RFM95 and so on.
  *
- * The driver can also be extended, to support other modules of
- * HopeRf with a similar interace - e. g. RFM69HCW, RFM12, RFM95, ...
  * Copyright (C) 2016 Wolf-Entwicklungen
  *	Marcus Wolf <linux@wolf-entwicklungen.de>
  */
@@ -33,8 +32,8 @@ enum option_on_off {
 /* IOCTL structs and commands */
 
 /**
- * struct pi433_tx_config
- * describes the configuration of the radio module for sending
+ * struct pi433_tx_cfg
+ * describes the configuration of the radio module for sending data
  * @frequency:
  * @bit_rate:
  * @modulation:
@@ -46,7 +45,7 @@ enum option_on_off {
  * @repetitions:
  *
  * ATTENTION:
- * If the contents of 'pi433_tx_config' ever change
+ * If the contents of 'pi433_tx_cfg' ever change
  * incompatibly, then the ioctl number (see define below) must change.
  *
  * NOTE: struct layout is the same in 64bit and 32bit userspace.
@@ -81,8 +80,8 @@ struct pi433_tx_cfg {
 };
 
 /**
- * struct pi433_rx_config
- * describes the configuration of the radio module for sending
+ * struct pi433_rx_cfg
+ * describes the configuration of the radio module for receiving data
  * @frequency:
  * @bit_rate:
  * @modulation:
@@ -94,7 +93,7 @@ struct pi433_tx_cfg {
  * @repetitions:
  *
  * ATTENTION:
- * If the contents of 'pi433_rx_config' ever change
+ * If the contents of 'pi433_rx_cfg' ever change
  * incompatibly, then the ioctl number (see define below) must change
  *
  * NOTE: struct layout is the same in 64bit and 32bit userspace.
-- 
2.25.4

