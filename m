Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735E2322A
	for <linux-staging@lists.linux.dev>; Sun, 23 Oct 2022 20:06:05 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id l22-20020a17090a3f1600b00212fbbcfb78so1708874pjc.3
        for <linux-staging@lists.linux.dev>; Sun, 23 Oct 2022 13:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLIdpQp6TVzjpS8r5yHeQWkGEgLDOWAXXPd+wr6BFps=;
        b=W/zZcv3w/UDpaPdd/s8jBz2WkbIIeCIby8DcPlgihtqoFanbHmNb5C9SklB+vJ3ImT
         6bCBuTD7HnmvHz/Uy3ueZZOYPZ2xEXlXa6NTmtXoISttykHJJKbrl/3pIqsIpS9TPo7o
         WiCrPy613uZQtgr3+OgBmfx1n1IjPIslnIDHKMHREiWXsslm02lmKTe36WMQyJmi6p7D
         LdRrZEC+i9VnYwmbEM7HomFHI9SirmbEolrlLngZphlEF8I8rEddQtfVa96bwKLy6yRO
         gCnZXVqRYL/cgcudnEYN5+DtOtTH1k1x9aYY+bWk8VrqSiXV7IWpkpDTNszVGIf7Y+vq
         sFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLIdpQp6TVzjpS8r5yHeQWkGEgLDOWAXXPd+wr6BFps=;
        b=veB0LaBLOQSYPgGhvlvM96xEKuIE+a1sNhGWLb4scrUvosB3qUDE9W92J81YWf9FME
         BsHOIzaUxCBBIP0A+TxLHOL2RlUAfmVWI7hmudUAgJ38pm0geBLfb8bki1aWJpFZ8Ok7
         3ZNSGwn67T5jRZI6Zz2JBd0b46NzEg4War5NjUeHGei7ZcD9qb+oXiEZKUfswwSSQrBF
         Xh+/lQjoxHp+K1Hd5Es+/cS5kNMrhsqR3PaATg7/G/+ETNrgac14KEPfRt9rq6AJduOO
         YmLt0YOlyRDoOxQ3/4hIWYYR8vEvc4+We9zYKll6gbiX9qLxnQD2zk5o/UWhNcdGrlRE
         WQQg==
X-Gm-Message-State: ACrzQf3XxfYDwie1EGpLV/8GA0/0jL1pANVVJQbnIUKQ3mzJ1e5eAArb
	v6E+9ZyEM6rf2+RlBt7llOo=
X-Google-Smtp-Source: AMsMyM76z+ArrodjsY+vLZ+DlKBCAOY6y4xwBmftR2uiJlyzZscotR3jMfVyyrkzSRbKapgoB9B41A==
X-Received: by 2002:a17:902:ce86:b0:182:498f:afdb with SMTP id f6-20020a170902ce8600b00182498fafdbmr30602563plg.12.1666555564908;
        Sun, 23 Oct 2022 13:06:04 -0700 (PDT)
Received: from uftrace.. ([14.5.161.231])
        by smtp.gmail.com with ESMTPSA id e13-20020aa798cd000000b0056bc0578c7dsm1130649pfm.110.2022.10.23.13.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Oct 2022 13:06:04 -0700 (PDT)
From: Kang Minchul <tegongkang@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kang Minchul <tegongkang@gmail.com>
Subject: [PATCH 4/4] staging: r8188eu: remove unnecessary variable in rtw_ap
Date: Mon, 24 Oct 2022 05:05:32 +0900
Message-Id: <20221023200532.259276-5-tegongkang@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221023200532.259276-1-tegongkang@gmail.com>
References: <20221023200532.259276-1-tegongkang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Return 0 directly instead of storing it in a variable.
This can prevent cocci warning as follows:

  Unneeded variable: "ret". Return "0" on line 1031

Signed-off-by: Kang Minchul <tegongkang@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ap.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ap.c b/drivers/staging/r8188eu/core/rtw_ap.c
index 24eb8dce9bfe..9eaf345e6a00 100644
--- a/drivers/staging/r8188eu/core/rtw_ap.c
+++ b/drivers/staging/r8188eu/core/rtw_ap.c
@@ -1020,7 +1020,6 @@ u8 ap_free_sta(struct adapter *padapter, struct sta_info *psta,
 int rtw_sta_flush(struct adapter *padapter)
 {
 	struct list_head *phead, *plist;
-	int ret = 0;
 	struct sta_info *psta = NULL;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
@@ -1028,7 +1027,7 @@ int rtw_sta_flush(struct adapter *padapter)
 	u8 bc_addr[ETH_ALEN] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 
 	if ((pmlmeinfo->state & 0x03) != WIFI_FW_AP_STATE)
-		return ret;
+		return 0;
 
 	spin_lock_bh(&pstapriv->asoc_list_lock);
 	phead = &pstapriv->asoc_list;
@@ -1051,7 +1050,7 @@ int rtw_sta_flush(struct adapter *padapter)
 
 	associated_clients_update(padapter, true);
 
-	return ret;
+	return 0;
 }
 
 /* called > TSR LEVEL for USB or SDIO Interface*/
-- 
2.34.1

