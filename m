Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE0272
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 10:12:47 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id x4so8414575pgh.1
        for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 03:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=wi+p9bw6dkKYhPSdA0Q7/4wAJUQFVkCW+fYz4vuAze0=;
        b=KXAHjkJTYCeZAPn0OJx/05v5ZeIkUqqxbr0h06fKBo27oeTTJowIQxcNIllg4PpN02
         x4jP36Vp6lRFFuqbMFmRmtGkWntyI6mVJXds+chIMJmfrK4+UqSTtR5VKuzPckK5PCpW
         DzqBAaPOOrfwxQsB5xN0yU4RORw1DMLI5T8CRXYNVfFch/HYIr+VrPsPFPLBgR09TWqz
         KwNv/3OZl6DEduS53hfQdol2pXe6jP7CQSqelpYAifh+/2po6o0zruagTMAhNMsULO6b
         C+elwnPzPaBVe9EZMnof6T5UgvuIfwSsDM88CaCM2mnf08dQso+lrUsAnLE+bZMYQY5h
         ahdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=wi+p9bw6dkKYhPSdA0Q7/4wAJUQFVkCW+fYz4vuAze0=;
        b=J0IYoRb0snWFvVpJeD/Sp7fccP7uF57hXqOFchJevTJss1oMGHZy//YQ/n4bwZAXwj
         4IzHYrRFW0QZoUpcfaDX1ZrD4P5/+YP4onfw9e/CSw4u59QtWl1B5xwhacIel1VOrKEc
         HrBWGOlQNVZTphXRJ8mLqu3uLKLYKWjP5tvLWIy8yZ0r4oNtfd4mYdxsxFC8M4bG0s5k
         I8s6dIgeNBJtWxHVP1x32a8js4kzkPkODBX+vUBe3W1HkNGiM2quV0exbXn959nCLcUJ
         TCcUZUQ3/ihdcFFg7PNIbUDGB+ZIyUww+6W4iNRTEnNBkHI/5AESjhaBFzpp+dGUEyfZ
         7Tzg==
X-Gm-Message-State: AOAM531cs4nPef35RIJzGnou6YgKipNND97S0s/hok/8BgQoqpPjnWdh
	NBBGGoYHxPKCgxstibFF0XY=
X-Google-Smtp-Source: ABdhPJysTnh/XCpUc5ceFM2NQuwvu+94lLUqryPPA7I8CZ303wQJJHizo+E/ShhRsW6vEriBoOV4rQ==
X-Received: by 2002:a65:6213:: with SMTP id d19mr11476237pgv.110.1630145567331;
        Sat, 28 Aug 2021 03:12:47 -0700 (PDT)
Received: from localhost.localdomain (125-237-24-95-adsl.sparkbb.co.nz. [125.237.24.95])
        by smtp.gmail.com with ESMTPSA id k22sm8561874pff.154.2021.08.28.03.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 03:12:46 -0700 (PDT)
Date: Sat, 28 Aug 2021 22:12:42 +1200
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hello@bryanbrattlof.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: pi433: fix docs typos and references to previous
 struct names
Message-ID: <20210828101242.GA6841@localhost.localdomain>
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

