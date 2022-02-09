Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A952F23
	for <linux-staging@lists.linux.dev>; Wed,  9 Feb 2022 17:48:27 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id y18so2835945plb.11
        for <linux-staging@lists.linux.dev>; Wed, 09 Feb 2022 09:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F4NxIfE5pVavXfL1FvTbYlzlRXtKoW9v/Q8Zml6o1ow=;
        b=FnHlQw2mxdJHKxT0xdfJqo6x7F6mCMHP+mESAoq+Oa4dV2IB/I7ZUOQUZOw1FLno89
         9Dtdwba6ioD6tXAJAYWwXkBX5VQzA3nUPQnzMnFepNLmIiAGtgwsXirfDwNZiURC4XBE
         NaZF0Np4P5GAp4XynEqfImAOUC551BywtCm6Jb1/Bt5Ih6EtrI/9w0B+3lfcEYt5liFI
         wSMzY2wax+3G7vSc5A9QHVyf2tJU/Y8gqKtTWHfB2+InN/Giab3C36UCc39UBn3W6+ga
         +A/1CwVifby6nYBItpT9UhgoZmHIru6GUGmnFB40CGSnCwzPzfoO1Jw0MLf9fN7Vi2Nl
         hmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F4NxIfE5pVavXfL1FvTbYlzlRXtKoW9v/Q8Zml6o1ow=;
        b=SChAfPXhmBKfxDP2TzK9bK4U0fRbxXUxVyB4nGXMJN4bBH5+YYlm7Kb/1I9Bx9iObu
         NMvidxCwLZBCyhLK1NFi85DTLM0kprdhFkDGZ9tsmSz5ksewPnp8Bs9jhC1IqRS6waJ/
         pm1eapKI/rxIIQuuF2NTGJ6imghI9jTvosd/bAqFRTnlqwOw38Zp3oLIQg7/u8yVV/r8
         Hu3ZgI/99IyxKdTCyUqDOIqduYy7pSwuYtZqWErky+QFSS+vTpAcNRhH7AVCvqxognC9
         QuBN1z5VWkkCdVuiPutz03U5vVyo/oWKayxMI6s8Mq3CEggJFUCFIY8TBPNVQvw8u6jF
         R3GA==
X-Gm-Message-State: AOAM533yRtyBM4zas3wd4++mRTbe8UPjX/lCv/Umi0JwMOMsFE63R0lz
	z+CcFAYqMj8+IVwZ3TUaOr4=
X-Google-Smtp-Source: ABdhPJwnlnoPjrXv/TYJhYQI1J991VOpPfXmw8K6wxRRZH6kwpEpihX53uyGeXjWIgW3By2YdnafPQ==
X-Received: by 2002:a17:903:2083:: with SMTP id d3mr3235951plc.174.1644428907530;
        Wed, 09 Feb 2022 09:48:27 -0800 (PST)
Received: from localhost.localdomain ([103.81.93.149])
        by smtp.gmail.com with ESMTPSA id mw14sm7462786pjb.6.2022.02.09.09.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 09:48:27 -0800 (PST)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH] staging: r8188eu: keep the success path and error path separate
Date: Wed,  9 Feb 2022 23:18:19 +0530
Message-Id: <20220209174819.5068-1-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Keep the success path and error path separate in rtw_usb_if1_init() and
drop the "status" variable.
Also, remove do-nothing gotos.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/os_dep/usb_intf.c | 29 ++++++++++-------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index 10c33e2ae..4ddf3a95a 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -336,13 +336,13 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
 {
 	struct adapter *padapter = NULL;
 	struct net_device *pnetdev = NULL;
-	int status = _FAIL;
 	struct io_priv *piopriv;
 	struct intf_hdl *pintf;
 
 	padapter = vzalloc(sizeof(*padapter));
 	if (!padapter)
-		goto exit;
+		return NULL;
+
 	padapter->dvobj = dvobj;
 	dvobj->if1 = padapter;
 
@@ -421,25 +421,20 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
 		, padapter->hw_init_completed
 	);
 
-	status = _SUCCESS;
+	return padapter;
 
 free_drv_sw:
-	if (status != _SUCCESS) {
-		rtw_cancel_all_timer(padapter);
-		rtw_free_drv_sw(padapter);
-	}
+	rtw_cancel_all_timer(padapter);
+	rtw_free_drv_sw(padapter);
 handle_dualmac:
-	if (status != _SUCCESS)
-		rtw_handle_dualmac(padapter, 0);
+	rtw_handle_dualmac(padapter, 0);
 free_adapter:
-	if (status != _SUCCESS) {
-		if (pnetdev)
-			rtw_free_netdev(pnetdev);
-		else if (padapter)
-			vfree(padapter);
-		padapter = NULL;
-	}
-exit:
+	if (pnetdev)
+		rtw_free_netdev(pnetdev);
+	else if (padapter)
+		vfree(padapter);
+	padapter = NULL;
+
 	return padapter;
 }
 
-- 
2.30.2

