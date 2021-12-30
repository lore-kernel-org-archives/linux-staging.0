Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645652C82
	for <linux-staging@lists.linux.dev>; Thu, 30 Dec 2021 15:29:37 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id gj24so21507527pjb.0
        for <linux-staging@lists.linux.dev>; Thu, 30 Dec 2021 07:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=DfKSM4slpHzll8KI1SeyD0sbe9XXp4yDafX/XdIzOm4=;
        b=L5aB5CptZtyhJNX7xwv2wp+8LqN6wgd1jvWHBbMxeoMBA/QOmbvxc8GiDnFy1b6F15
         Qli5IaOsPC9ScPzMpQ5yBfTe1eQHVAbO+7o5QG74twFAvh2FNo/2I45NsSxgawom2vzN
         08HQ33qmA8nIgJyVG1vtijj0aN3azjgs18IIROMskrlYPIzVRO0kXIGTLjWGIoHue9Q4
         s15zQxglXgAIRUOvChlfOgtFA6n4jCWYccUbb8SWAGFcdsttq616eBlHq0S5a1Cp1TXq
         CrV/4dkMBBD4+8YQmd3iBBX0Mdv1tfzH4KtpKMD9f0Oo/l+C/8KmaQcXesbGzgUZt1Oq
         wcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=DfKSM4slpHzll8KI1SeyD0sbe9XXp4yDafX/XdIzOm4=;
        b=nZIpsHsjY/WbJJhdGIdIVVTZKMCuaJGgVuoVjQa9hxWqolf7x33HVspcM36GFWdOCg
         UmjcZY445lw+Ut94o13DBAwknDkWhvIIdJDBzhMaRWKC4Av9158WO4/znxN0ZBPmfjBe
         AsnuW9MRjT6otiRvs/O0ECAqVPtrk5v5GASXrYDvI/qYaTK2K3A+ZolA7/oggTZ96FPF
         QlaZFeGlTOF1s8PtTrLAB1d8zk8ZWpoDqMkMchCXL1zJ0KJ7dVY7XODACpTCY/XKaISA
         1v86NKa5CR33DcE/JkUdyCzNz/DrWeCxkSmaOQdajyl5FPM/MWAPZZNcArroM/zTmtdr
         qwXw==
X-Gm-Message-State: AOAM533zacOeFCBBOdJWiSiKwV9y5ZvX7WvNGftyuH1SaCBnCHccbsyL
	yo1nIXx59mGl3nmZBQ656Sh7GYWhTrax/A==
X-Google-Smtp-Source: ABdhPJy18VHoyexWgS3Rlc3AmrkMTPwrHjuL1y6L904p+94Om3PReo8J+N0VFuR+KDy5SoqJUtunQg==
X-Received: by 2002:a17:90a:a60d:: with SMTP id c13mr18232470pjq.72.1640878176839;
        Thu, 30 Dec 2021 07:29:36 -0800 (PST)
Received: from localhost.localdomain (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id h2sm26080085pfh.55.2021.12.30.07.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Dec 2021 07:29:36 -0800 (PST)
Date: Fri, 31 Dec 2021 04:29:31 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: gregkh@linuxfoundation.org, realwakka@gmail.com,
	paulo.miguel.almeida.rodenas@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: pi433: add comment to rx_lock mutex definition
Message-ID: <20211230152931.GA6157@localhost.localdomain>
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
v3: wrote a more succinct desc so it doesn't become out-of-date (Req: Greg k-h) 
v2: ellaborate on reasons why the mutex lock is used in the driver (Req: Greg k-h)
v1: https://lore.kernel.org/lkml/20211222093626.GA13332@localhost.localdomain/

---
 drivers/staging/pi433/pi433_if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 29bd37669059..68c09fa016ed 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -92,7 +92,7 @@ struct pi433_device {
 	u32			rx_bytes_to_drop;
 	u32			rx_bytes_dropped;
 	unsigned int		rx_position;
-	struct mutex		rx_lock;
+	struct mutex		rx_lock; /* protects rx_* variable accesses */
 	wait_queue_head_t	rx_wait_queue;
 
 	/* fifo wait queue */
-- 
2.25.4

