Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56A653A7
	for <linux-staging@lists.linux.dev>; Wed, 18 Jan 2023 19:59:25 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id q10so15779391wrs.2
        for <linux-staging@lists.linux.dev>; Wed, 18 Jan 2023 11:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gL1FkEaorEI3622tNzniLT0WZMhnZ6o6rTarBUJjzLE=;
        b=IdJGfjvtx9jkeYj6ysFX/AYke3km1XDMH2XmccyjMDhQhnvhIrkNgm7/rd0DrfbLJ3
         rBdIANhozdVkIcM4Tc7CRNQjEuujpoNrmBNwRlRYLjc50UgE5vADHeoqcgemUeVf/l88
         7FMwaHSk5qmaxM9REC+0Tya9xw7XMPBF5YCW96eXIkGdllLHBqDowFifin/iH+CJg3El
         2ip8hBUtXQAcxms/Uz6QvY901W4Xnx2GizIHiSK0x9R9Xl5mGyvrpSYngehofTs1BLKz
         efmL2uV7D/Dr46mC12zYP+MKcQOZKC0GyaJTPenmcOn5rgoHmOmJrQerc7yB8qtU9qFd
         blAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gL1FkEaorEI3622tNzniLT0WZMhnZ6o6rTarBUJjzLE=;
        b=wkYJ177dGbBvmTNmwJ/MZpBB7buqC9EJ5vkd77OmHSOx9TR8zXmcVbw1i1zYAc6iAf
         ZjytrnjceZs+b3tPq1EZaEvxN7lKIyoyRR21cIaky1vRw1Q2GT438eOutw6FILaUfMmG
         DDhTJK/VS/bzJFb097b2cHg5kQQU2IZcrDFSsVPzJgI99F3A9nlP+XxjwezxEdoJk1by
         oBXEnh9eNX8n3Uu59RfRDDfJR691QouvN6caKapYiEPjbJWArWKDpiPfLYeIEEsrgxFH
         b6OvY8DNMA4D0dA8iN9D1bad/SYYJuKyFHdPQvreeWc1MyuZptn2zl6JiOjz3dpO/lu7
         TJkw==
X-Gm-Message-State: AFqh2ko2z3QkLN4pxQbrxxpAw66Ap1HZFzzUZGoT9TJ051TqEPRhFS21
	Vkkg9NQPMQWpno4q3twn50sJhYhCmo4=
X-Google-Smtp-Source: AMrXdXvDmPzN4UrOogPUAFH0CxrWLe7guNnTBNpBV1/tfUDZ5nX4DJojhor1KyUakXs14ri9w2FExg==
X-Received: by 2002:adf:dec3:0:b0:2be:110d:5d4d with SMTP id i3-20020adfdec3000000b002be110d5d4dmr1387304wrn.7.1674071964123;
        Wed, 18 Jan 2023 11:59:24 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id c18-20020adffb52000000b0025e86026866sm37913858wrs.0.2023.01.18.11.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 11:59:23 -0800 (PST)
Date: Wed, 18 Jan 2023 20:59:21 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] staging: rtl8192e: Remove unused variable framesyncC34
Message-ID: <e641717f1b89dd9bba99a0f14fc2c24996cb6bd7.1674071236.git.philipp.g.hortmann@gmail.com>
References: <cover.1674071236.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1674071236.git.philipp.g.hortmann@gmail.com>

framesyncC34 is written and then never evaluated. Remove resulting dead
code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index ed27bdbb8fb9..aafe39e50bd9 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -580,7 +580,6 @@ void rtl92e_get_tx_power(struct net_device *dev)
 	priv->def_initial_gain[3] = rtl92e_readb(dev, rOFDM0_XDAGCCore1);
 
 	priv->framesync = rtl92e_readb(dev, rOFDM0_RxDetector3);
-	priv->framesyncC34 = rtl92e_readl(dev, rOFDM0_RxDetector2);
 }
 
 void rtl92e_set_tx_power(struct net_device *dev, u8 channel)
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index feb48ee35110..626a2bc48969 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -513,7 +513,6 @@ struct r8192_priv {
 	u32		continue_diff_count;
 	bool		bswitch_fsync;
 	u8		framesync;
-	u32		framesyncC34;
 	u8		frame_sync_monitor;
 
 	u32		reset_count;
-- 
2.39.0

