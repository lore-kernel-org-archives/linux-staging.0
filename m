Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7558572
	for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 10:10:34 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id z20so221643edc.13
        for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 03:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4LeBk9mKvA7THBr02ThBK2DGWw4nA3oZq6PqI9mSeIo=;
        b=J80ueK4Od9w7JI2xbZ8DGcOB9hspdUoG9Px8+I5/33VSdRMOe1zNQfJlqL/d/Efvgz
         WBkVoehQyIFcE9zqz4Y656zxl9kFJUXTPuhWb3pkJqo5Lpdsea8izHBmpKe+xllNXvUN
         ymHjNMRCGjqq2s/48QXRn26znQxBoaQmo22MvZKHfIgPDS5ZDFSfWgVp44VUSAI6mvJS
         gfRZORMIsB7H07TGc+JCbEFUnrqc9c3PLWu9p9FJ1QpfPM+QITXqbTaZSUx0pJp1Wq14
         Yi8BMhaAXhkyuMb4ssak8/aTrlqtswMGDkh9sD0EY2lvTBxlL6PukMiS3s0P8GncEWcp
         pAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4LeBk9mKvA7THBr02ThBK2DGWw4nA3oZq6PqI9mSeIo=;
        b=nsXEE8yhJYDmLV3vvkF6K+aaOUGh/d8vJKQRaglecu8yc5vUZ6r53TbgO9J/gbLMM2
         CBBb9N8NUf0zpVozBOMSIY+JwFMs7b+rpsCp9lgDkBMe1mh3WvNC0hdjUwbnmKzRhfFQ
         vOzNftA99+FeZOdNYHj8mtrkCZTNo3oLK7fZqCyZsLyCqzHRnn19Rst4veekd0H1lDBD
         0a5QPWYKkHVuxwD9bsU+6mCWPt5hUp6rSppOYOGnDblIQtfOVDRPWPWZzW/rCrTpcLbP
         U7qlwr9AezQadmj8euuEM6vwJDyUeBIl3/f+gllkXUKvMO85i7/1XGSv/XVhX5K/n2sm
         cfOA==
X-Gm-Message-State: AOAM532jcAt7WBjhXrLJlSI+Vty2VDokG6CnQD3ip980FOFe/BYB/PCB
	h6tDfNKHa/PmhRBtqdb6vIA=
X-Google-Smtp-Source: ABdhPJyzVW7IMScoqeA0lti5W06Pk2xOMUTiDaed/DaUwwSt08cTQx/bnl+ixj84xxq0bLkBaLpC8g==
X-Received: by 2002:a17:906:6403:: with SMTP id d3mr13748443ejm.37.1634897432749;
        Fri, 22 Oct 2021 03:10:32 -0700 (PDT)
Received: from localhost.localdomain (host-80-181-148-119.retail.telecomitalia.it. [80.181.148.119])
        by smtp.gmail.com with ESMTPSA id j15sm4243446edl.34.2021.10.22.03.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 03:10:32 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v2 1/2] staging: r8188eu: Remove initialized but unused semaphore
Date: Fri, 22 Oct 2021 12:10:27 +0200
Message-Id: <20211022101028.30367-2-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211022101028.30367-1-fmdefrancesco@gmail.com>
References: <20211022101028.30367-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove semaphore "xmit_sema" from "struct adapter" because it is
initialized but never used.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_xmit.c    | 1 -
 drivers/staging/r8188eu/include/rtw_xmit.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 720e190a7436..0c033a077bf9 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -49,7 +49,6 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	/*  We don't need to memset padapter->XXX to zero, because adapter is allocated by vzalloc(). */
 
 	spin_lock_init(&pxmitpriv->lock);
-	sema_init(&pxmitpriv->xmit_sema, 0);
 	sema_init(&pxmitpriv->terminate_xmitthread_sema, 0);
 
 	/*
diff --git a/drivers/staging/r8188eu/include/rtw_xmit.h b/drivers/staging/r8188eu/include/rtw_xmit.h
index ea8e82e0b4be..b2df1480d66b 100644
--- a/drivers/staging/r8188eu/include/rtw_xmit.h
+++ b/drivers/staging/r8188eu/include/rtw_xmit.h
@@ -256,7 +256,6 @@ struct agg_pkt_info {
 
 struct	xmit_priv {
 	spinlock_t lock;
-	struct semaphore xmit_sema;
 	struct semaphore terminate_xmitthread_sema;
 	struct __queue be_pending;
 	struct __queue bk_pending;
-- 
2.33.1

