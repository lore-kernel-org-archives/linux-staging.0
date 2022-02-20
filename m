Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765D25CA1
	for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 20:30:40 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id m17so25259641edc.13
        for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 12:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=M3kDsmJgJhsx/BhUSBxKGZ3EihcGTlnZeIezNsAFAOY=;
        b=lQheRnjSoixYPLG1T0TtX2WAKuabcn/5uNflh3mJIom7wOn+XmtH6cNrWYiYURQfvW
         fsz/KhJV736abErFOmT/dkn+mIp132/U1WuzER8aBs/ftVnTt58niL2PweIhJePrtlB3
         srFrjVouVnxtoD8KUpB7nNYW6McBjovvfCcPHVsUVE3wib0RErDFv86B1fslPRPwCK6W
         9FOkAW5hn0TVo0TyQR3OKOb7Cdx+otB3PncfOOqH8URsFFHAs3HHn7p4t00iD7cIEuIi
         T7cBzHkP3gGKrTdDUy4gMi/+Hw1E+YoBH8R4AeX2GiqWBbeV/0UTt6j1x6vYwM9P7nTb
         EwHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M3kDsmJgJhsx/BhUSBxKGZ3EihcGTlnZeIezNsAFAOY=;
        b=Fj8Vcyw5bzDjROWqozsJhqBAUAJDRjg7jJQ9UY61b90lbqbCYFDnLySpFP+IWyOoTG
         6coB1XfhrI0uO0NOMUEhIBfNzarmsfzThxL4DvReEz12IHnNh2Y6xKPFSuoPZndrcEmt
         Q9ZDN1nSAzJNXc9OM1zYgtD0TDYI3Et/yfvPJISKVL18VAxtcFKqy7o0aNbrq3LCr+ap
         2iJK14Lvv+mj6DbyB0K4QUHws8uiRAZWXyS0vNZf9AcJrqFkFrYvmf3j0EPh/p4SFzuf
         +xnFKj+8bKZMNk9TW6gP00KXbqHu0mKWh2tt+OvciR1+SxIsq1vow+pbusCwk4LzHg7T
         MSTQ==
X-Gm-Message-State: AOAM533fqZd9qQah0YBh9oNmuPi0KlZ/LRq8/2fnTaTmSXhhyoIwJyIe
	OfeYZeyE9HVyLObtFxdmxjU=
X-Google-Smtp-Source: ABdhPJyg2dUSIoT8ZcdvaDBMvkxd/zPwsTUJeAOAvD1jq0FKJDzSI1BlzAxKpFskkYtO4rGvzKtFaQ==
X-Received: by 2002:a05:6402:358c:b0:412:e44e:f62c with SMTP id y12-20020a056402358c00b00412e44ef62cmr7422797edc.206.1645389038839;
        Sun, 20 Feb 2022 12:30:38 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935aa6.dip0.t-ipconnect.de. [87.147.90.166])
        by smtp.gmail.com with ESMTPSA id u2sm4390282eje.119.2022.02.20.12.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 12:30:38 -0800 (PST)
Date: Sun, 20 Feb 2022 21:30:36 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] staging: vt6656: Add comment and change macro to function
Message-ID: <3eb14cfaa3f97695bd4db0dd75ac78408c557821.1645386791.git.philipp.g.hortmann@gmail.com>
References: <cover.1645386791.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1645386791.git.philipp.g.hortmann@gmail.com>

This patch fixes the checkpatch.pl warnings like:
- CHECK: spinlock_t definition without comment
- CHECK: Avoid CamelCase: <uVar>
- CHECK: Macro argument reuse 'uVar' - possible side-effects?
and moved the only twice used macro to a function in the file
where the function is used.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6656/device.h | 11 ++---------
 drivers/staging/vt6656/wcmd.c   | 13 +++++++++++--
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/vt6656/device.h b/drivers/staging/vt6656/device.h
index 8b6623a751f0..eb84590d5eeb 100644
--- a/drivers/staging/vt6656/device.h
+++ b/drivers/staging/vt6656/device.h
@@ -268,8 +268,8 @@ struct vnt_private {
 	u32 rx_buf_sz;
 	int mc_list_count;
 
-	spinlock_t lock;
-	struct mutex usb_lock;
+	spinlock_t lock;		/*prepare tx USB URB*/
+	struct mutex usb_lock;		/*USB control messages*/
 
 	unsigned long flags;
 
@@ -381,13 +381,6 @@ struct vnt_private {
 	struct ieee80211_low_level_stats low_stats;
 };
 
-#define ADD_ONE_WITH_WRAP_AROUND(uVar, uModulo) {	\
-	if ((uVar) >= ((uModulo) - 1))			\
-		(uVar) = 0;				\
-	else						\
-		(uVar)++;				\
-}
-
 int vnt_init(struct vnt_private *priv);
 
 #endif
diff --git a/drivers/staging/vt6656/wcmd.c b/drivers/staging/vt6656/wcmd.c
index e8ee2fbee76c..77c6d898f660 100644
--- a/drivers/staging/vt6656/wcmd.c
+++ b/drivers/staging/vt6656/wcmd.c
@@ -31,6 +31,15 @@ static void vnt_cmd_timer_wait(struct vnt_private *priv, unsigned long msecs)
 	schedule_delayed_work(&priv->run_command_work, msecs_to_jiffies(msecs));
 }
 
+static u32 add_one_with_wrap_around(u32 u_var, u8 u_modulo)
+{
+	if (u_var >= (u_modulo - 1))
+		u_var = 0;
+	else
+		u_var++;
+	return u_var;
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

