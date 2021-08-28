Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AD62FB2
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 00:08:46 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id x16so3310566pll.2
        for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 17:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=V1Phuwg9S10P3UrzzO2JJiE8SFms1OaLW24U0NiZUw0=;
        b=bmt9FXUTZo3GZkAW150BsedhnBTrgDULwpKB1Ck67Nbv/cKpyasz68SYaJSq2jY3f6
         dlO3swB5SNRbC3gwcd+sfM7pvSHTdLSwzu/vJHSlJ2jfRxy577fRxe28HRHOnnUXfVxK
         siX8kBXx9Y5rYqVMrx2jl+J5n3Xe2Hl9gnfPkpIIfPsyY4hANCueRNOoB0HiF6LYq6QP
         CT4h0DMCiMsuZMu+seNgn5rQ43M3Ic+aITRrvZsw6ZPVxI7lqOHJkbeOMnpNMb6tNXVY
         FCN6W9LgKmA4JwW/E6fFmKevhhrfjufB7lkQ0L0WHODkWmZ1Me7USZRFEhapoSn94UHR
         /HBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=V1Phuwg9S10P3UrzzO2JJiE8SFms1OaLW24U0NiZUw0=;
        b=HDUZlidZPw0olmzoTwOs6Chg+ovLfRFH9fr54R7BfpqPHpKwElrVlHLIYfW1SvqItZ
         ni/irmGb9PYntyjqsjeinM5Cvrv/NuATIVHsojL/mN0MnDgumVzr3OJA4r3Y94dVnnZL
         6GAPokdsP8GDfM1wfSByE3ZtFvvaQJyfPF3snodE03atFUCDyVShTvneOKx2eTbZTFxE
         QrsZcZqEgxG3GvjDu9vbZ/VICnzJMil/bqyJ7yv926ANLplqgnjRtC7aw69j7nTUPlNi
         txZmkOoitHEUJ34GyS2uhqBtKUJso4s4UdcNv+p5CrzNkZBP2xF4tnW1yf8wdNBey2sk
         UYng==
X-Gm-Message-State: AOAM530Itim0IhSW6/ZfdswvkL3+w3IOlJy0FOyWTFNCorfWPH/yiJSB
	PNTrBzRffZEvuw8ALOgmc0DLNhK1jMM/cQ==
X-Google-Smtp-Source: ABdhPJxNj0eC9DJ3kkfn0E5168iWGGL0MpSq1fA91RsXa67fr3+MfNIPPFQ//+vv/jocozwnvSJbhg==
X-Received: by 2002:a17:902:7611:b029:12b:e55e:6ee8 with SMTP id k17-20020a1709027611b029012be55e6ee8mr11167180pll.4.1630109326490;
        Fri, 27 Aug 2021 17:08:46 -0700 (PDT)
Received: from localhost.localdomain (125-237-24-95-adsl.sparkbb.co.nz. [125.237.24.95])
        by smtp.gmail.com with ESMTPSA id u2sm132807pjv.10.2021.08.27.17.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 17:08:46 -0700 (PDT)
Date: Sat, 28 Aug 2021 12:08:36 +1200
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: gregkh@linuxfoundation.org, hello@bryanbrattlof.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: pi433: fix docs typos and references to previous
 struct names
Message-ID: <20210828000836.GA10188@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In the comments there where some grammar mistakes and references to
struct names that have gotten renamed over time but not reflected
in the comments.

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
 drivers/staging/pi433/pi433_if.h | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/pi433/pi433_if.h b/drivers/staging/pi433/pi433_if.h
index d5c1521192c1..1fae62c40661 100644
--- a/drivers/staging/pi433/pi433_if.h
+++ b/drivers/staging/pi433/pi433_if.h
@@ -5,16 +5,15 @@
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
- *	Marcus Wolf <linux@wolf-entwicklungen.de>
+ * Marcus Wolf <linux@wolf-entwicklungen.de>
  */
 
 #ifndef PI433_H
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

