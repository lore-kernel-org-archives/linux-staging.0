Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81562FAE
	for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 19:09:31 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id t18so20222565wrb.0
        for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 12:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MzoxEizOiKTdQlbLPE4ISoR0sksiFjl8q0469VNUERA=;
        b=dWSh5qJhBHwoX9NwQwCb3+Bh6jDWCO1pxtusyfD+8TEmS/gFJ0JCsDRjX86GC4RjEM
         hUopXF2eJchTP/XvO/K4CTB8fchzccjrHsaFjPPCwNLBGYRO61Y54hkIs+pHiAq3P/kd
         f8ZAIgn5dVHLDjQlTCzY20ORCcqxDFJ+L7xXjDitIfle2nRD96pJRbOd0HBreHmLlVSx
         zht2d4OzJSzOv9qcAoVfe/MI3ZA8ENKDJJp2jJ12vAMVsY8qRSxPkANyvQHjOmnnO6t9
         juj0fUlXhC8div7y9CZIigFcFENE/DXCCWqMoe/sZcXA8UAbjOw87eRJ2/8/n5/pOuQT
         9RXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MzoxEizOiKTdQlbLPE4ISoR0sksiFjl8q0469VNUERA=;
        b=OlAFtyfUSsKYh4LqwiLlHqzcvpBoWNuGVFGF1XtTAqciyqiBdrajMggxvixC7NFjxl
         B0cr/mtBk4ncJIGohpmx3ETWcKtOUc5SgiydqjYKFnesFxOwHmhnjI3KFXAfe6KU5Q1n
         w/m83yzz3m4eTyyYBkpoWyU2hNP5ZWHm2v5PprKj1ZI/5YsgLzIqZbcdSOMabVYU2vaP
         a9m2K7orCV3GWQd31Z4PoXHUnPN4sB0Q9iZts0YIyaRRQyDc0sxdR8O+Gy2anjF70g5J
         q9gNhkaGTghThd7oqi9KkO8RacM0s4QPj3HYBrZND7X/F67KchdYeggh0ISfCxaDFSFm
         CXiA==
X-Gm-Message-State: AOAM531NuaTDDc0/DkxqQwIRe+qT2136bvTd41voV6o4JArciv+S2VGc
	yVEhZUmyR8Dtc+h0zmMaR3Y=
X-Google-Smtp-Source: ABdhPJzpulFnnGvLbveJzQLXFpfK1GSDsWZayohOh2WgxjEhzbRkydD79ZVPSCL9usr5LYseYSogkw==
X-Received: by 2002:a5d:5684:: with SMTP id f4mr7217444wrv.148.1632424170103;
        Thu, 23 Sep 2021 12:09:30 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cad])
        by smtp.gmail.com with ESMTPSA id e28sm6323591wrc.10.2021.09.23.12.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 12:09:29 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 01/17] staging: r8188eu: remove rtw_cmd_clr_isr()
Date: Thu, 23 Sep 2021 21:09:04 +0200
Message-Id: <20210923190920.3580-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210923190920.3580-1-straube.linux@gmail.com>
References: <20210923190920.3580-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_cmd_clr_isr() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c    | 8 --------
 drivers/staging/r8188eu/include/rtw_cmd.h | 1 -
 2 files changed, 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 3a70776f3304..4b149425cff7 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -213,14 +213,6 @@ struct	cmd_obj	*rtw_dequeue_cmd(struct cmd_priv *pcmdpriv)
 	return cmd_obj;
 }
 
-void rtw_cmd_clr_isr(struct	cmd_priv *pcmdpriv)
-{
-
-	pcmdpriv->cmd_done_cnt++;
-	/* up(&(pcmdpriv->cmd_done_sema)); */
-
-}
-
 void rtw_free_cmd_obj(struct cmd_obj *pcmd)
 {
 
diff --git a/drivers/staging/r8188eu/include/rtw_cmd.h b/drivers/staging/r8188eu/include/rtw_cmd.h
index 90ebe1eca896..7923749ae7bd 100644
--- a/drivers/staging/r8188eu/include/rtw_cmd.h
+++ b/drivers/staging/r8188eu/include/rtw_cmd.h
@@ -89,7 +89,6 @@ void rtw_free_cmd_priv(struct cmd_priv *pcmdpriv);
 
 u32 rtw_init_evt_priv(struct evt_priv *pevtpriv);
 void rtw_free_evt_priv(struct evt_priv *pevtpriv);
-void rtw_cmd_clr_isr(struct cmd_priv *pcmdpriv);
 void rtw_evt_notify_isr(struct evt_priv *pevtpriv);
 u8 p2p_protocol_wk_cmd(struct adapter *padapter, int intCmdType);
 
-- 
2.33.0

