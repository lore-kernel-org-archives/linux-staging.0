Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB962568
	for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 21:25:20 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id x5so31922785edd.11
        for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 13:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hRNEJYkXr+PwSGSW5oI3rp0CXIsPeHFtIOlhCAUsWYo=;
        b=Og3vrovv6LTZwDBZk1v459NGVWUMEHl6mUBfs/6JKezdMuBldc2tHbo614J6H/39ec
         m8W+9YGfXZnCZ9xoYRGIBDqEBeJ8q90A8Vzgtxq2nqLgDwrBaitIZboNLsV9ks8mpR3z
         lfxw5Q3lJHJboK8Eu8qQC/G6BnSkJeWDayF3anq2zCAcDW2Gyv72QW+tAurVtle++97c
         4q98CoxPo2dW6A9FHJSJqmDCVGO3K/A4tBsnjElGHbeK3kTBn41nhOc4pe6zDz4MIMk8
         hV00lF7vi5VupVJYx5NUJzZpqjhydSagD1oCi8l/9ItkcEywO5SoibblZaL6GOJCwUDU
         dcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hRNEJYkXr+PwSGSW5oI3rp0CXIsPeHFtIOlhCAUsWYo=;
        b=STPrhTcm0WYlwM7RZWZNscGGA74GOsF6lRqpYDOy/wzvtIdva1DoGfln6DZpDOQ/ER
         NDqxS3/8yEipliMtTlO1pzrHNzwdQ525qhVC7ajkuwBjsbZ9Kwi3UMrkIQCvTUq2Cfaj
         VnMF4aQP2Fh5N6XjJxaMvHB2yoCTavvb7yOKW4tFQ54z6mmG+ChKco1fLRTeeaWlCa3M
         3vSf0sHlGcC2mXu6sSUPy2PvAypuavMI9vyvGNR63gZFMB69IEjEIdVFdDep+08QEEGi
         ixSWDUBc0RIFnPWbaZ5CBbpZIzJtd7n2OsnPEta8CGdgmG4q5kRey6u0ip3KXmawHINX
         5Pug==
X-Gm-Message-State: AOAM5317uvkkstqkHW36RkUKhJaxRNhQU8ft4EUIP6ghPJnJpZTMI2S8
	PGrecnefCSDBT+tzxXt31vlfJmrlfAc=
X-Google-Smtp-Source: ABdhPJzmtpRHxuS6X84WUIbiaEuDt83WewKyJDe0iPuKShXYAJZWJN9IGS53x868g7pBjR4OsBHlkw==
X-Received: by 2002:a05:6402:5209:b0:412:7cd8:a8fc with SMTP id s9-20020a056402520900b004127cd8a8fcmr23392496edd.51.1645478718822;
        Mon, 21 Feb 2022 13:25:18 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935aa6.dip0.t-ipconnect.de. [87.147.90.166])
        by smtp.gmail.com with ESMTPSA id ho34sm1660725ejc.122.2022.02.21.13.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:25:18 -0800 (PST)
Date: Mon, 21 Feb 2022 22:25:16 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] staging: vt6656: Change macro to function and moved
 to better file
Message-ID: <fa37dde640cfe5093ff23ca0881aba4673751a49.1645477326.git.philipp.g.hortmann@gmail.com>
References: <cover.1645477326.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1645477326.git.philipp.g.hortmann@gmail.com>

This patch fixes the checkpatch.pl warning like:
- CHECK: Macro argument reuse 'uVar' - possible side-effects?
Moved the only twice used function to the file where it is used.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1 -> V2: Devided patch into three
---
 drivers/staging/vt6656/device.h |  7 -------
 drivers/staging/vt6656/wcmd.c   | 13 +++++++++++--
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/vt6656/device.h b/drivers/staging/vt6656/device.h
index 0ab2d60204e8..ca974d61d3f4 100644
--- a/drivers/staging/vt6656/device.h
+++ b/drivers/staging/vt6656/device.h
@@ -381,13 +381,6 @@ struct vnt_private {
 	struct ieee80211_low_level_stats low_stats;
 };
 
-#define ADD_ONE_WITH_WRAP_AROUND(var, modulo) {	\
-	if ((var) >= ((modulo) - 1))			\
-		(var) = 0;				\
-	else						\
-		(var)++;				\
-}
-
 int vnt_init(struct vnt_private *priv);
 
 #endif
diff --git a/drivers/staging/vt6656/wcmd.c b/drivers/staging/vt6656/wcmd.c
index e8ee2fbee76c..14b8aa587119 100644
--- a/drivers/staging/vt6656/wcmd.c
+++ b/drivers/staging/vt6656/wcmd.c
@@ -31,6 +31,15 @@ static void vnt_cmd_timer_wait(struct vnt_private *priv, unsigned long msecs)
 	schedule_delayed_work(&priv->run_command_work, msecs_to_jiffies(msecs));
 }
 
+static u32 add_one_with_wrap_around(u32 var, u8 modulo)
+{
+	if (var >= (modulo - 1))
+		var = 0;
+	else
+		var++;
+	return var;
+}
+
 static int vnt_cmd_complete(struct vnt_private *priv)
 {
 	priv->command_state = WLAN_CMD_IDLE;
@@ -42,7 +51,7 @@ static int vnt_cmd_complete(struct vnt_private *priv)
 
 	priv->command = priv->cmd_queue[priv->cmd_dequeue_idx];
 
-	ADD_ONE_WITH_WRAP_AROUND(priv->cmd_dequeue_idx, CMD_Q_SIZE);
+	priv->cmd_dequeue_idx = add_one_with_wrap_around(priv->cmd_dequeue_idx, CMD_Q_SIZE);
 	priv->free_cmd_queue++;
 	priv->cmd_running = true;
 
@@ -157,7 +166,7 @@ int vnt_schedule_command(struct vnt_private *priv, enum vnt_cmd command)
 
 	priv->cmd_queue[priv->cmd_enqueue_idx] = command;
 
-	ADD_ONE_WITH_WRAP_AROUND(priv->cmd_enqueue_idx, CMD_Q_SIZE);
+	priv->cmd_enqueue_idx = add_one_with_wrap_around(priv->cmd_enqueue_idx, CMD_Q_SIZE);
 	priv->free_cmd_queue--;
 
 	if (!priv->cmd_running)
-- 
2.25.1

