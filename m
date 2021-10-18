Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B751E2C88
	for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 16:20:29 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id y30so937472edi.0
        for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 09:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S1TymLQzs85RWsteQyxCWHUBdjbBqj0+p83DBGcUbRA=;
        b=OyOST35KhcFKGAdczMUOLR7Vq/TRywGXqrHTO64yHl8hZjUjJz7s8XSBtRegZ+1+u0
         eCkb/6QiZ2ZcEuOBqVq/opHNYX6f1KsHOuZlKMfr3KM9KM87/5u2F89L73ZQkt6qWLYZ
         M8hATyiPpwfE1zMLf2d3tElFMYBsf7ycx5dC/XA0KzMLLQ57O9ejBjGqMNm0/ZeRMe/l
         epGQGzmkuKSrGTxOI5GFOxD73SaDjj9RBy5Mf8yJWUNIkJliVjM0XMEdjHGuN2lrYj8g
         2/GJ6Uxse4t9MYIOOM+QGgWil80SkCHGBYOFIqBoa5TTOIddnnOaS8lUG30JI9pcNMFi
         p4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S1TymLQzs85RWsteQyxCWHUBdjbBqj0+p83DBGcUbRA=;
        b=b484fGVdOGnkMsjRYEH/CmSEbEBOZK9kvRqWyky+v8Vo7mtJCBK8qwCSrzL82wQJwz
         NHQSKpUQrRQQnPzqljzJTDUZmM4qJHGpiFeVHUR86eBPbTX7jKFm+FcdJxoqcyp090+w
         OTeufK2GtTbM9/7fRTXtGcQI2QRreexTy//LKR8xhTEhZgX9tW7kMegBySXegeN1LIby
         hNpO6N7qjbkIcsORLKYSfK65ZDhsQTX6EJ9Zyt3FTFhzeGU1VISl9cPNIYOZMr/q/jzE
         9mZGx5we//kpHt//mWoSbSmnKJPM4CNpMzlPOwpDlIcy1CJgf2MMQyJfyrh8CwW+6Sl0
         WSvQ==
X-Gm-Message-State: AOAM5305e2lHzlijiObvSbPOcSsUe5cBOyP4mrf9m1JHzxEA2NdYcXvw
	uXF6fFZcGIlTuE4LGMSxFos=
X-Google-Smtp-Source: ABdhPJzle8YS2LF0YCPa8fswLODhY44Jm6caxbNENXJnNWbWD4SUc+wwGqHCh2ZHepvLrZm1igHUkg==
X-Received: by 2002:a17:907:6010:: with SMTP id fs16mr30691838ejc.266.1634574014361;
        Mon, 18 Oct 2021 09:20:14 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-180.retail.telecomitalia.it. [79.47.104.180])
        by smtp.gmail.com with ESMTPSA id p7sm10045791edr.6.2021.10.18.09.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 09:20:13 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Martin Kaiser <martin@kaiser.cx>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v3 3/3] staging: r8188eu: Remove redundant 'if' statement
Date: Mon, 18 Oct 2021 18:20:06 +0200
Message-Id: <20211018162006.5527-4-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211018162006.5527-1-fmdefrancesco@gmail.com>
References: <20211018162006.5527-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the redundant first 'if' statement of two identical ones.

In rtw_cmd_thread() there are two identical 'if' statement, one
immediately after the other. They check whether or not the device is
removed or the driver is stopped and, if true, they break a 'while'
loop.

The only noteworthy context difference is that the second statement is
within a block labelled "_next". The code has a 'goto' to the "_next"
label so that the checking is performed each time the above directive
is encountered. Instead, the first 'if' is before the "_next" label.

One of the two must be removed and that it must be the one before the
label because "bSurpriseRemoved" as well as "bDriverStopped" may be
changed asynchronously by other code of the driver and so they should be
checked at each jump to "_next".

Tested with "ASUSTek Computer, Inc. Realtek 8188EUS [USB-N10 Nano]".

Acked-by: Martin Kaiser <martin@kaiser.cx>
Acked-by: Phillip Potter <phil@philpotter.co.uk>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 3b07328704bb..5d5f25364b2f 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -252,12 +252,6 @@ int rtw_cmd_thread(void *context)
 	while (1) {
 		wait_for_completion(&pcmdpriv->enqueue_cmd);
 
-		if (padapter->bDriverStopped ||
-		    padapter->bSurpriseRemoved) {
-			DBG_88E("%s: DriverStopped(%d) SurpriseRemoved(%d) break at line %d\n",
-				__func__, padapter->bDriverStopped, padapter->bSurpriseRemoved, __LINE__);
-			break;
-		}
 _next:
 		if (padapter->bDriverStopped ||
 		    padapter->bSurpriseRemoved) {
-- 
2.33.0

