Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC632C86
	for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 08:47:34 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id g10so3945176edj.1
        for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 01:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4LeBk9mKvA7THBr02ThBK2DGWw4nA3oZq6PqI9mSeIo=;
        b=LGSEergeG/fObDf4CwCzPxECyDmdvD8gofl19vP0jL8SnWpqBpiziyPqqAQ3gsqyRU
         yUo2PR2ACCTPhcC24i0ypHCmUY7tng9AO1pBbq7i6YvQ2Bz9C9RFOJBYNyyYsPqfdDYD
         G8//euFK2h2TN7Hie3bwal/n+XhjXs8XAwvovImWGa7eMI6PGfnHNhbobBhF+MTTceWa
         OUk8yGQTa7cmK47bS3AG9nGGHBaEwlK1Zkv2DS3pIjgq/kgm2kzB2fhsfbvlIj6dsXO+
         WlJNqcMRl465tjj7LFcs4pvrI3p+n03QszONrBS2UlTe1JSM/JxQ6aL2dn83zYD7++Jf
         teVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4LeBk9mKvA7THBr02ThBK2DGWw4nA3oZq6PqI9mSeIo=;
        b=SUQgOrzZZ+szEbVsUOyVAx/jStSUwFDJBYvLC26OZ9IBMHZLKSOGRQSYSeD1D9xr+/
         FZ8UVtOYSAFN9UCMGLAHb2r7drGFEFmkeWB0AfwF/QPaI9inY1TdKd3TXyg3ODAxxKrD
         ZyQ6FFrNHk6vRN+b0f7GcvK/VLvr8QsWsvst0ZeNKokINCRyZN7/XvdwoG+JBHRfSg3U
         uyIDxHFEU6rkSZLBZKR17Y/6cRaqd413Nxezin8eDNiBgMZP5UjRgcL9br/rJp7rorY3
         8g9uK85yKxLuuT/9XXylaB1z4RVRCmdyifC4lMKlgHAD5wpWAhqLTFcl0SWcnekRLEVV
         6AFw==
X-Gm-Message-State: AOAM532l7Hpw7lX01u1ZYHf4Nvhrq++mmIUvUsEGpxtCZ9n/wkVSF2nU
	QuYmJeIL/p+eTNE+Kd6qams=
X-Google-Smtp-Source: ABdhPJz6Ei1KJbqXS1wHRN2XAgKoCsdqBZ6ci1rm13UDEz6V9atRhADpWrNgNr1q0VAq2cAUWGJLTw==
X-Received: by 2002:a05:6402:4315:: with SMTP id m21mr15210326edc.277.1634892452793;
        Fri, 22 Oct 2021 01:47:32 -0700 (PDT)
Received: from localhost.localdomain (host-80-181-148-119.pool80181.interbusiness.it. [80.181.148.119])
        by smtp.gmail.com with ESMTPSA id au26sm3446979ejc.53.2021.10.22.01.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 01:47:32 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH 1/2] staging: r8188eu: Remove initialized but unused semaphore
Date: Fri, 22 Oct 2021 10:47:26 +0200
Message-Id: <20211022084727.28035-2-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211022084727.28035-1-fmdefrancesco@gmail.com>
References: <20211022084727.28035-1-fmdefrancesco@gmail.com>
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

