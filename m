Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A257ED
	for <linux-staging@lists.linux.dev>; Mon, 24 Oct 2022 08:49:43 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id b11so1510888pjp.2
        for <linux-staging@lists.linux.dev>; Mon, 24 Oct 2022 01:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLIdpQp6TVzjpS8r5yHeQWkGEgLDOWAXXPd+wr6BFps=;
        b=NbR/+wMAJQsAS4ZCKdqO+slx+4imwFJZNzwyLXfJPz7S5F4F9AHmCKCAvC3992TKJX
         P2VXGagRVkNQeqtFAu6h6GthBQLnzJgNUWB0h56lDk7XG9kwO7rqtmaBdNZHPITemAUW
         KcBl2uajkOEBlYyKbmFR84ceoVP7ZG8RhljhE/ici8ifbk6yZ8uxZqXX+PlkVxS8s2Ol
         LLrP1D+kjozTtOCtb4AKBErS9WgINjkGJ91XSI6x3em6bzYruThflg9sLZmsWr+1kV7f
         xBiTCdrWAThidPtDmU9M4vnlzNuXk+/vdolKTJ0WRW3GP2DbJPATiM2fLgGviDcEfBNv
         lOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLIdpQp6TVzjpS8r5yHeQWkGEgLDOWAXXPd+wr6BFps=;
        b=c16c0F2v2q9LfSOrIgM6bNlB4JpNRhlM3oNeGXuFYI4uw8y9ephPug19rgO+S4Ku3a
         qR+qb4catmc/Bch+tlEAjHViJVY7jJg3RYRdPVUU6gIE8GjudUvGPgCKGZqQDNgwakk6
         l95RapUqU3cMIdt1FL+jMahqRS5ZZtx4bht9JOCRt8v9JXYHp33VRYU9OckHXKs1aZPj
         P6nkWQrgh/GWYCUV05Ly0iixeiNtZgigvetS+0CexPNYT87QH2HfKNk71OzzbunW6upD
         G/CpY+8354d1hG55Td0SOykuzKUYXj4o5jAgUqnDJZ++HKKnxhtnmLXi8G3lxsm7Dv0F
         CuAQ==
X-Gm-Message-State: ACrzQf1rzSlaXQwcFmDFKKbR3yadgMtrpLj3Ea6EJB0YEeukliBevZVE
	LH7laDdEeKvwWzw87HhM8l0=
X-Google-Smtp-Source: AMsMyM7ZLCkRXSidqosRcQ06v3NCGHk+w05g/OrqK02EJHcJm83MwhUE1n8FqFuDno4QHlKchkDGqQ==
X-Received: by 2002:a17:902:8490:b0:186:a7f8:63b5 with SMTP id c16-20020a170902849000b00186a7f863b5mr4498076plo.57.1666601383534;
        Mon, 24 Oct 2022 01:49:43 -0700 (PDT)
Received: from uftrace.. ([14.5.161.231])
        by smtp.gmail.com with ESMTPSA id r2-20020a63a542000000b00434e1d3b2ecsm17245124pgu.79.2022.10.24.01.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 01:49:43 -0700 (PDT)
From: Kang Minchul <tegongkang@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kang Minchul <tegongkang@gmail.com>
Subject: [PATCH v2 4/4] staging: r8188eu: remove unnecessary variable in rtw_ap
Date: Mon, 24 Oct 2022 17:49:25 +0900
Message-Id: <20221024084925.262289-5-tegongkang@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024084925.262289-1-tegongkang@gmail.com>
References: <20221024084925.262289-1-tegongkang@gmail.com>
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

