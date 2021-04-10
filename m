Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8234070
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 00:12:17 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id m18so1306632plc.13
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 17:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=2lxfN5ByZEbEMKEjmWp1Q7WunCY5qRG4cae/+TcjBiw=;
        b=nNLrhJg01t54nH/nElkvEhcvw2owYft633IxmHULTyL9BdkUnROR8QFoRypeZfkKRa
         etaDJ1PEK3ghpeEaXfO1legoCBaVQ55m9elz9GtyRAmCBd7hD2+jsvZZG16od8vZSaOp
         fcgc85nlx9VDpTU0rudcm/NrKKvTVpBZ+tZbsAFLbN6do8LQlndorth2PBAssBTrH0+o
         IR4LXu56UUnTb4W5dqCF4cc2PHfq4eP+ENoIMaa9BaZ6WQJZTgK30qXW98ydovS+xffZ
         pGoeIIpXDxzVuErKvFY1ebqZIcEUp/eY+S29dW7kQaTVz1fUVYVvGdus9WhMMpSrPxtU
         GdVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=2lxfN5ByZEbEMKEjmWp1Q7WunCY5qRG4cae/+TcjBiw=;
        b=ol6Gs4j+AVFzNB1fKo0gp0hTXTw0VoJRKpsuKkkqbK+c6hmPBZouXGVE2yt0b6Lcyc
         sAHiKMCA6YZ/wTNlVv4EIRAD7D0h4wRXHc3lAddoqyXodscGVcSScDUVzgS/Koq/Lc2s
         i7wmhzy52ftA5Y4Xo+D/hP0zyvIDXFr4IFudC39GizGe+fHIEPpM1qL6u0mWq8KUMy1q
         fkCVZmMyL7IcsaiyHaKzEvdWgwMbJc8C/m+S0zwJFjHevW6i8HK5lnN8IT8KWxeTaGwO
         A05AE4tI0pIVPGLAhrXfw/4hehaJdzfVnQH7uFqzOOKZyBivrvOivMACOHb4DdH5QdI5
         aZYw==
X-Gm-Message-State: AOAM533Ohs/T23qyqcYMvV36DpfFEcPWaN3P3Z6HOSDxqASGFIew2ntV
	DiiEaBEv3hL9AwvidxXumQ4=
X-Google-Smtp-Source: ABdhPJz2YsGjbI6FPzSN5p2ywTltyFXdJSttu1EElON6QcZ8OoXr2NIz9jI033O5O+SKRvfsoeN8yw==
X-Received: by 2002:a17:90a:2bc4:: with SMTP id n4mr5147236pje.52.1618013536891;
        Fri, 09 Apr 2021 17:12:16 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id s19sm3203011pfh.168.2021.04.09.17.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 17:12:16 -0700 (PDT)
Date: Sat, 10 Apr 2021 05:42:10 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH] staging: rtl8192e: remove unnecesasry f-trace like logging
Message-ID: <YHDtWizzh5EVLL4/@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed Check: Remove unnecessary f-trace like logging by simply deleting
that statement as we have other modes of logging like ftrace.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 476875125e87..4457c1acfbf6 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -136,7 +136,6 @@ void TSInitialize(struct rtllib_device *ieee)
 	struct rx_reorder_entry *pRxReorderEntry = ieee->RxReorderEntry;
 	u8				count = 0;
 
-	netdev_vdbg(ieee->dev, "%s()\n", __func__);
 	INIT_LIST_HEAD(&ieee->Tx_TS_Admit_List);
 	INIT_LIST_HEAD(&ieee->Tx_TS_Pending_List);
 	INIT_LIST_HEAD(&ieee->Tx_TS_Unused_List);
-- 
2.30.2

