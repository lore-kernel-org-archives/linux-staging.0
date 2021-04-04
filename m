Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF126D00
	for <linux-staging@lists.linux.dev>; Sun,  4 Apr 2021 20:51:56 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id b14so14744054lfv.8
        for <linux-staging@lists.linux.dev>; Sun, 04 Apr 2021 13:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QzV++jhT27uc2t1qnJFUNLJDodKEuAS8LLzpt9xx8wo=;
        b=K6VyeHCogGvRhUaBohFgBjE1xxM8DQJuwnJ23Z2pijJO/xgS37x+tTOGtC3Z9xV7T/
         cOpn9Ov3F7KQG5/+OCGXCn2DZrOJ0EReKDuF3JSaB31CwGDT+sLhVy21/wvK202leU8m
         qOdQNWyNi1GaCb3Otgmy2a48vcKqBdmaJ2iCX0gygSx2LC6qpwD1YPVrR2FQym0+WLz2
         uTkkEcJU+wdTHu4xs65+dG/dNIbujWo/sVUzEpcr/9YuL9Qze+2N9CkMk3BfdkvDncxS
         am1C8UEXo+/6X1+lWYSVqfXTEeOvYDXsxYG9pg3lncbRTdJZyEiF/+4uFRnyIKCLbc/g
         ZJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QzV++jhT27uc2t1qnJFUNLJDodKEuAS8LLzpt9xx8wo=;
        b=lf+NDYUX8Dw8Mf1Y8HiD0K5Z/kb+T5dB58br/mg6bl5Yq/IFrlwOQKE0f6++smQ5eZ
         sVPtJ4E5ctoAlb+wg4Pg+hV/9iU+vvI68Ez61E4Sl21uFEXZ2nqnFpBc4iAV7uhjoeYx
         pcJVw4EFv68KqDXsz9z5+Jc+Hw4ln5q+1vEV9FVJ6lGhhXVWzaEtnYf3DIE4DwMAhZSB
         vnWoCg8GgAy2aUPG+PbM2uq3QBI278Jwa1cMU046rzTPLQm1ZiP512doFcmGaQCFLN7H
         ybsEqZN5vVlTsK0QeZ8xtQAUwDORejMAjZxqlNcBWywgBRJ00WTUr7UN1EpWD44BHffZ
         tJTw==
X-Gm-Message-State: AOAM533KmFvmcddCD1+skDw5Z9r88UKm83KMM0DQytrnnwmIaWMwfK+X
	55eQnd1nyMCwD3oUAdZS4N4Otv8x9YeIpdfg
X-Google-Smtp-Source: ABdhPJybCeIuCQ/d7Jozd1PGm1So8NTlkYU4ZevulfXxDK3NY/5AaUh1u9+go2wmcGVncLtnukVXFQ==
X-Received: by 2002:ac2:53a7:: with SMTP id j7mr16793134lfh.305.1617569515361;
        Sun, 04 Apr 2021 13:51:55 -0700 (PDT)
Received: from zhans ([37.151.32.231])
        by smtp.gmail.com with ESMTPSA id y23sm1657365ljm.53.2021.04.04.13.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 13:51:55 -0700 (PDT)
Date: Mon, 5 Apr 2021 02:51:54 +0600
From: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Subject: [PATCH 2/2] staging: rtl8712: remove extra blank lines
Message-ID: <d56183614a04590bdf3a6280b7f23664a5bb394c.1617568354.git.zhansayabagdaulet@gmail.com>
References: <cover.1617568354.git.zhansayabagdaulet@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617568354.git.zhansayabagdaulet@gmail.com>

Remove extra blank lines to adhere to Linux kernel coding style.
Reported by checkpatch.

Signed-off-by: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
---
 drivers/staging/rtl8712/rtl8712_recv.h    | 1 -
 drivers/staging/rtl8712/rtl871x_mlme.c    | 3 ---
 drivers/staging/rtl8712/rtl871x_pwrctrl.h | 3 ---
 drivers/staging/rtl8712/rtl871x_recv.h    | 1 -
 4 files changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl8712_recv.h b/drivers/staging/rtl8712/rtl8712_recv.h
index c70b37ff554e..f4d20b0efd4e 100644
--- a/drivers/staging/rtl8712/rtl8712_recv.h
+++ b/drivers/staging/rtl8712/rtl8712_recv.h
@@ -85,7 +85,6 @@ union recvstat {
 	unsigned int value[RXDESC_SIZE>>2];
 };
 
-
 struct recv_buf {
 	struct list_head list;
 	spinlock_t recvbuf_lock;
diff --git a/drivers/staging/rtl8712/rtl871x_mlme.c b/drivers/staging/rtl8712/rtl871x_mlme.c
index f5886b39b3b5..8a97307fbbd6 100644
--- a/drivers/staging/rtl8712/rtl871x_mlme.c
+++ b/drivers/staging/rtl8712/rtl871x_mlme.c
@@ -124,7 +124,6 @@ static void free_network_nolock(struct mlme_priv *pmlmepriv,
 	pmlmepriv->num_of_scanned--;
 }
 
-
 /* return the wlan_network with the matching addr
  * Shall be called under atomic context...
  * to avoid possible racing condition...
@@ -358,7 +357,6 @@ static void update_scanned_network(struct _adapter *adapter,
 		plist = plist->next;
 	}
 
-
 	/* If we didn't find a match, then get a new network slot to initialize
 	 * with this beacon's information
 	 */
@@ -621,7 +619,6 @@ void r8712_indicate_connect(struct _adapter *padapter)
 			  jiffies + msecs_to_jiffies(60000));
 }
 
-
 /*
  * r8712_ind_disconnect: the caller has to lock pmlmepriv->lock
  */
diff --git a/drivers/staging/rtl8712/rtl871x_pwrctrl.h b/drivers/staging/rtl8712/rtl871x_pwrctrl.h
index dd5a79f90b1a..bf6623cfaf27 100644
--- a/drivers/staging/rtl8712/rtl871x_pwrctrl.h
+++ b/drivers/staging/rtl8712/rtl871x_pwrctrl.h
@@ -17,7 +17,6 @@
 #include "osdep_service.h"
 #include "drv_types.h"
 
-
 #define CMD_ALIVE	BIT(2)
 
 enum Power_Mgnt {
@@ -63,12 +62,10 @@ enum Power_Mgnt {
 #define		PS_STATE_S3		(PS_ALL_ON)
 #define	PS_STATE_S4		((PS_ST_ACTIVE) | (PS_ALL_ON))
 
-
 #define		PS_IS_RF_ON(x)		((x) & (PS_ALL_ON))
 #define		PS_IS_ACTIVE(x)		((x) & (PS_ST_ACTIVE))
 #define		CLR_PS_STATE(x)	((x) = ((x) & (0xF0)))
 
-
 struct reportpwrstate_parm {
 	unsigned char mode;
 	unsigned char state; /* the CPWM value */
diff --git a/drivers/staging/rtl8712/rtl871x_recv.h b/drivers/staging/rtl8712/rtl871x_recv.h
index e83c256e1474..7c9995060a6f 100644
--- a/drivers/staging/rtl8712/rtl871x_recv.h
+++ b/drivers/staging/rtl8712/rtl871x_recv.h
@@ -29,7 +29,6 @@ struct	stainfo_rxcache	{
 #define		PHY_RSSI_SLID_WIN_MAX			100
 #define		PHY_LINKQUALITY_SLID_WIN_MAX		20
 
-
 struct smooth_rssi_data {
 	u32	elements[100];	/* array to store values */
 	u32	index;		/* index to current array to store */
-- 
2.25.1

