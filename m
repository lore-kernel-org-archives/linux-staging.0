Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7ACD2CA0
	for <linux-staging@lists.linux.dev>; Wed, 22 Dec 2021 21:56:21 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id t123so3482846pfc.13
        for <linux-staging@lists.linux.dev>; Wed, 22 Dec 2021 13:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=fg3NXf4aMybvSkS7vjMPN+wZx+JFIELE7ph0rrmV6RM=;
        b=WySwE+D7rji1QAyKHmxqQopkxTr7kevnL5hu+Zf92KAiYD7K4JSL2xQFojKFXRuwpu
         I/HtTrzwYiyNNL1TDQsloyS6NB86J0erSP3dC2/kYJlxgPXhHxrEMDLO3s8P2ni2vuQk
         5E5quaR6CjAZHIpm/Z6uO4ugGQFc5Ve4MuBrxeCYX9j2phaFFfS2bP1K8AA6P9RxdQ0n
         IbCa/pzUJg8AmfKauOOwLoJe96cO1Rx8WaK6eN6fqCmCiZNPyJs3ZdC4tnCJfdKTIqLx
         9Qeb7wONv7S1Z5doc388huy4STozwUcp/cjCKuf4RsaVwjIltAQLjdI3sJZOGf5l1lT3
         KtWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=fg3NXf4aMybvSkS7vjMPN+wZx+JFIELE7ph0rrmV6RM=;
        b=DF1CfT8jxDS4P0wmScUeYFBO2nYucZCweSh8w0yQFbziyKPmzZX4MxS53TgXsFtSbn
         GOboZEjd1cEWL7dgGIl1vSDId+yAiWlMC0ZBvUsnfrdiJ+DsMM43vYIm6Ut/eQ0O03p7
         OEUadhpdAYEaextLmEOIruNvSrX/fH1gkoI99uGQVde7pcWOVSpPQTiwDJ8bgzc9zjHH
         hT1utiQj+72LY9EcvjZ/g7G6ZMaYhu8IelDeiFVR3F1gI+Jn+HutG+vUKTAhLXcUi3Pm
         r9cLluhZyA/tEdUbsTsFGpVxxMBC2x9MUEdBoL+2bQTD97+Y5z1Ynl3Ga5y2TwfnZvIK
         UkmA==
X-Gm-Message-State: AOAM531eZaPomrgo0BPa4ZKRnCSRkSRMdD1F8GAoB7aYeAk6gd2ThXqi
	6bntqfQnIMSMpKjM09ubDqY=
X-Google-Smtp-Source: ABdhPJxkzNfh5PA82UTFvidcysmONwwTxue3M8ha9Q7mjXujUtl/IrDgSdGqA+7ekXiRuHC1TfMpgA==
X-Received: by 2002:a05:6a00:2304:b0:4ba:4cbb:8289 with SMTP id h4-20020a056a00230400b004ba4cbb8289mr4719468pfh.79.1640210181423;
        Wed, 22 Dec 2021 13:56:21 -0800 (PST)
Received: from localhost.localdomain (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id g11sm2926130pgn.26.2021.12.22.13.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 13:56:20 -0800 (PST)
Date: Thu, 23 Dec 2021 10:56:15 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: gregkh@linuxfoundation.org, realwakka@gmail.com,
	paulo.miguel.almeida.rodenas@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: pi433: add comment to rx_lock mutex definition
Message-ID: <20211222215615.GA9361@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Checkpatch reports: CHECK: struct mutex definition without comment.
Fix this by documenting what rx_mutex struct is used for in pi433 driver.

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
v2: ellaborate on reasons why the mutex lock is used in the driver (Req: Greg k-h)
v1: https://lore.kernel.org/lkml/20211222093626.GA13332@localhost.localdomain/
---
 drivers/staging/pi433/pi433_if.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 29bd37669059..1cd3d5f2df2a 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -92,6 +92,17 @@ struct pi433_device {
 	u32			rx_bytes_to_drop;
 	u32			rx_bytes_dropped;
 	unsigned int		rx_position;
+	/*
+	 * rx_lock is used to avoid race-conditions that can be triggered from userspace.
+	 *
+	 * For instance, if a program in userspace is reading the char device
+	 * allocated in this module then another program won't be able to change RX
+	 * configuration of the RF69 hardware module via ioctl and vice versa.
+	 *
+	 * utilization summary:
+	 *  - pi433_read: blocks are read until rx read something (up to the buffer size)
+	 *  - pi433_ioctl: during pending read request, change of config not allowed
+	 */
 	struct mutex		rx_lock;
 	wait_queue_head_t	rx_wait_queue;
 
-- 
2.25.4

