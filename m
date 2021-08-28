Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DE372
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 17:54:30 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id x4so9105685pgh.1
        for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 10:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=c1G2etAo7RXizmOfzbwL5cJQFEkKfK8BqKZoS+nPauQ=;
        b=E/R8t3XZI/5mgoy6q/2sninrfivvVRMNytclY5+w2rNZgcmetRzMO1rD8RoOQCvxFF
         OrpXRzpzT00CEvPGF94Dsxz8bjnl767jjxrchvSvs2GiyfBuS/UExPhBAZWRDtPOjtjF
         V2EqJ3NUmO1sYOHdHmBOVG/vCostMW+PdvdmxVQVKb3X/aWecNcvWyIt6AV2jYyE6HdS
         yzj7PhUuCh1j1VxjsYBQWQ18g/rDq4ButH7KGd+CbSBxULRR+Gotgf79qsHlr7Glbrad
         mdelxgUtaoyZCEIAwOumugPbwTMc6irrmtBOnGNCDYNCnWAXzVcRRTARWaXx5AHs/Gc4
         38+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=c1G2etAo7RXizmOfzbwL5cJQFEkKfK8BqKZoS+nPauQ=;
        b=IUrPEhz99NZhSbHgFqB8mEgdjDdD4QiJ7ZIGI3aC5dD26NIHVH8tiKUJGA+FoyMKLi
         HY18lLWMjNCbn4cv9JUl8jNqRQNlF9gAwF1btQgMw9hM6cYfrHqRYwCU1vdwy4TE6mtr
         siH4be59vzjt4sgZBJM+44RyeiB0NvDPV4t6OxDfz7jZ60QDtZkjdmZ0MKmWuPAYiCSG
         OQBoHrNf7z31EJ1fI1DD9mnDfBAOO7VbRDFfuhTtkcIr0wYa93jiXIR7ERkJjYT0UNSL
         aJzgBwXGT8ctQfgZLZPxkjY3cNkEnlZRjgbWTxtmMtHAz8SpR0J7SZ3HPS2OVj4hVYH4
         UTaw==
X-Gm-Message-State: AOAM530wWGicWQS0JPzdmrJ7iv8ULRSYtjaL48j97z3geFifHNd+vjuD
	wLkxDS05nvH+yVE7GnpJ6qc=
X-Google-Smtp-Source: ABdhPJxAMhP8rcvBotU/D99aaqe+WpNdcTMWDE9Rn228MIaSl7HZXjzVkvftav1zSuThaFKHsd1Ckw==
X-Received: by 2002:a65:5a8e:: with SMTP id c14mr13112527pgt.125.1630173270431;
        Sat, 28 Aug 2021 10:54:30 -0700 (PDT)
Received: from user ([117.98.200.228])
        by smtp.gmail.com with ESMTPSA id y140sm2294700pfc.139.2021.08.28.10.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 10:54:30 -0700 (PDT)
Date: Sat, 28 Aug 2021 23:24:24 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, fabioaiuto83@gmail.com,
	straube.linux@gmail.com, ross.schm.dev@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: r8188eu: core: remove null check before vfree
Message-ID: <YSp4UP1+HrhmDA3C@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove NULL check. NULL check before freeing function is not needed.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_sta_mgt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_sta_mgt.c b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
index f6dffed53a60..4726771a8403 100644
--- a/drivers/staging/r8188eu/core/rtw_sta_mgt.c
+++ b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
@@ -155,9 +155,7 @@ u32	_rtw_free_sta_priv(struct	sta_priv *pstapriv)
 		spin_unlock_bh(&pstapriv->sta_hash_lock);
 		/*===============================*/

-		if (pstapriv->pallocated_stainfo_buf)
-			vfree(pstapriv->pallocated_stainfo_buf);
-		}
+		vfree(pstapriv->pallocated_stainfo_buf);

 	return _SUCCESS;
 }
--
2.32.0

