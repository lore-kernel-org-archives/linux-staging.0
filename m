Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5EC2FB2
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 15:01:46 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id q3so5934676plx.4
        for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 08:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=WIEbwTPNGyINv4c2BxfxTkde7Hw7bTwtcZ3eufbkcGo=;
        b=UuSraUPJnEvcAMQWsDKkRMsM/X0pa3alJ46CkqP5dFFSx4viOuClbQeq5JOhsDa+Ys
         tk8/32fp3qyGTXTvfJ6uQsSemfndO3+8C/dgFcka6AkBDdBTWko3wcAhuA/jEyhUExW9
         UBJ8lBuYDw56QBz6BD7pVxes56/Xrjd7Sdhd5b0dLzduUNdm2eeKn8Tw4t2QeuTid96r
         TvMkStaGiYwhZgj5axx+s08kl7QmjUSapYN8IB1NztQ/OgHoxUWrPB9YrIBOgI0qlxs7
         HAfvmNQBN8rbfPVhqt0N3dRWDhPg1rCoIxs/0rRows75ux1Tu3fkAx1uojjelTDIGsGH
         xOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=WIEbwTPNGyINv4c2BxfxTkde7Hw7bTwtcZ3eufbkcGo=;
        b=NCjOoBXTKfeKgrstUr02+7SC2IHvW6dKGP/EFo/WrbScfz5nCpTZSzzAmwSDd4e7YV
         haD+HTcsHCo/pkIdiCgxXzJkcNYFrPt4iCEq3tTgcqOLs4nPYNbd4ILQve3D3NX5vu8i
         i3ACkjfjiN0FMQ7enfIzg9y9cqXqSxztBEaddNWfP6Dx9xDr4dmi1cPx1KZCPkR/Y5bh
         SIOL4GrMME6fOdORcNu07kw9+/oNrsHntwDJQn1mO0rRwZQUR76W9T4sk7y2Vu7GAigG
         yVDqBykBw/NUEcCJ/Ma3+FBKOlMTZE46ekqupoSRJQUIX230KJkc9xDEnYRx9I6h0Adh
         B8Wg==
X-Gm-Message-State: AOAM531ghd5Awpx7aYqGBzCfS9bjKoPX+IZfozN5cQYjaZphMUTxpeWo
	5ldqIZWfDnjoqWdz36aHrl0=
X-Google-Smtp-Source: ABdhPJzIqD59aLCww6LPqrfSTdjFG8u00SEpeuQCYrcWXRAyFdFM8MDbqWdMf+RASpK0PoB2a1D7Bg==
X-Received: by 2002:a17:902:db0a:b0:138:7e3e:f71e with SMTP id m10-20020a170902db0a00b001387e3ef71emr13277162plx.0.1630162905679;
        Sat, 28 Aug 2021 08:01:45 -0700 (PDT)
Received: from user ([117.98.200.228])
        by smtp.gmail.com with ESMTPSA id c14sm12999451pjr.3.2021.08.28.08.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 08:01:45 -0700 (PDT)
Date: Sat, 28 Aug 2021 20:31:39 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, straube.linux@gmail.com,
	fmdefrancesco@gmail.com, saurav.girepunje@gmail.com,
	martin@kaiser.cx, linux-staging@lists.linux.dev
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: r8188eu: core: remove unused function
Message-ID: <YSpP0+aHdq3Roleo@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unused function proc_get_adapter_state() from rtw_debug.c file.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_debug.c    | 15 ---------------
 drivers/staging/r8188eu/include/rtw_debug.h |  4 ----
 2 files changed, 19 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_debug.c b/drivers/staging/r8188eu/core/rtw_debug.c
index 2ee64cef73f7..c5bb8b05b3c2 100644
--- a/drivers/staging/r8188eu/core/rtw_debug.c
+++ b/drivers/staging/r8188eu/core/rtw_debug.c
@@ -264,21 +264,6 @@ int proc_get_ap_info(char *page, char **start,
 	return len;
 }

-int proc_get_adapter_state(char *page, char **start,
-			  off_t offset, int count,
-			  int *eof, void *data)
-{
-	struct net_device *dev = data;
-	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
-	int len = 0;
-
-	len += snprintf(page + len, count - len, "bSurpriseRemoved=%d, bDriverStopped=%d\n",
-						padapter->bSurpriseRemoved, padapter->bDriverStopped);
-
-	*eof = 1;
-	return len;
-}
-
 int proc_get_trx_info(char *page, char **start,
 			  off_t offset, int count,
 			  int *eof, void *data)
diff --git a/drivers/staging/r8188eu/include/rtw_debug.h b/drivers/staging/r8188eu/include/rtw_debug.h
index 3c3bf2a4f30e..9de3a0ed12ba 100644
--- a/drivers/staging/r8188eu/include/rtw_debug.h
+++ b/drivers/staging/r8188eu/include/rtw_debug.h
@@ -112,10 +112,6 @@ int proc_get_ap_info(char *page, char **start,
 		     off_t offset, int count,
 		     int *eof, void *data);

-int proc_get_adapter_state(char *page, char **start,
-			   off_t offset, int count,
-			   int *eof, void *data);
-
 int proc_get_trx_info(char *page, char **start,
 		      off_t offset, int count,
 		      int *eof, void *data);
--
2.32.0

