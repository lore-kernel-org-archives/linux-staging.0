Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43712F25
	for <linux-staging@lists.linux.dev>; Fri, 22 Apr 2022 19:32:51 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id n18so12989561plg.5
        for <linux-staging@lists.linux.dev>; Fri, 22 Apr 2022 12:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7IQD1XVsVgNtpnSIJlyB1Igy1Zt/tIoNBydvA5N9QY8=;
        b=lMzILyzVY4s6HqsqcMbieRZUuzRhTfhOR3I/bs3u5XTfI/8c0Q8csI4tw+7aSR7FzJ
         lZhHjenfud/GLz8MrvPhRok6un812iDrEpnDXIce7PSTQcfKM42NahuNIBku3irxgGlg
         Hg/x7ZvBxQ51J9+vnDV5d3QrkFrWDo0liJh1zQU3Vr39aVF6R2+KylmIF46tvPc20lEP
         aLnEykbAWUoE4X1f15OOk4c6l67AOSi3PXp0Z+4g6QXXEeSCFhZh4mTcTDUzB8X4hgWr
         BbqhFW3WwnAPLzKmTZHmDPu3QQvaHfYT3z+DxUBp4jT8SabsJ0r9b2pID7g+W5c4yY1Q
         Q2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7IQD1XVsVgNtpnSIJlyB1Igy1Zt/tIoNBydvA5N9QY8=;
        b=AKnJanXAeWdkdn9efpX0eq3Nhfq3m2OLKqx262a4o6N3xfMIjdPdDo+oKVZ8+WkUdv
         Vvr5Iy0pVpXIQHQD5+r9io4sp16IGxUyEYRUpmAwCi2zmXiA75veYUDb5IQMvZ38BL4Z
         3H4Jy3zHslK300GA1TmUzYsr31jfHXib4fWvqs0RI0QL91T2wldb7QG70FE9GH2yQCXh
         xmLtJfRpf+ztmCPP/cBURC05cguTOdSLXrxtBPLi8KKdwQZOmuMOgDqXVI+XT44rxvR6
         2OiEw0jpgTP7LeBLFD9xcAd8lGQUmadlh78CxeDdJqqPGKodPSdXc7swBwsLtPvd3Aa4
         cazA==
X-Gm-Message-State: AOAM530DaVOxyWYJPb1t7CKHiAFzAl1zy/Btv7QeGbbdfxId1WvBS9qs
	Hda+7Ilz1UxSpZ73T1O5fII=
X-Google-Smtp-Source: ABdhPJwck26beUm/r/6Y9AyQaLFefvEwf0yPOn/B0kTV9OwEcXXwd2UxbZV63DbOsNL6PH9M1hnwbw==
X-Received: by 2002:a17:902:b106:b0:159:5c6:cb53 with SMTP id q6-20020a170902b10600b0015905c6cb53mr6148972plr.99.1650655971280;
        Fri, 22 Apr 2022 12:32:51 -0700 (PDT)
Received: from makvihas.localhost.com ([2405:201:202b:15:bfe0:e8c0:bea6:ee63])
        by smtp.gmail.com with ESMTPSA id z5-20020a056a00240500b004e15d39f15fsm3518932pfh.83.2022.04.22.12.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 12:32:50 -0700 (PDT)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH v3 5/7] staging: r8188eu: drop unnecessary wrapper _rtw_free_mlme_priv
Date: Sat, 23 Apr 2022 01:02:21 +0530
Message-Id: <20220422193223.11948-6-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220422193223.11948-1-makvihas@gmail.com>
References: <20220422193223.11948-1-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop unnecessary wrapper _rtw_free_mlme_priv and move its logic to
rtw_free_mlme_priv.

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c    | 15 ++++-----------
 drivers/staging/r8188eu/include/rtw_mlme.h |  2 --
 2 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 50a65a4e2..fb64954a0 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -53,16 +53,6 @@ void rtw_free_mlme_priv_ie_data(struct mlme_priv *pmlmepriv)
 	rtw_free_mlme_ie_data(&pmlmepriv->p2p_assoc_req_ie, &pmlmepriv->p2p_assoc_req_ie_len);
 }
 
-void _rtw_free_mlme_priv(struct mlme_priv *pmlmepriv)
-{
-
-	rtw_free_mlme_priv_ie_data(pmlmepriv);
-
-	if (pmlmepriv)
-		vfree(pmlmepriv->free_bss_buf);
-
-}
-
 struct	wlan_network *_rtw_alloc_network(struct	mlme_priv *pmlmepriv)/* _queue *free_queue) */
 {
 	struct	wlan_network	*pnetwork;
@@ -289,7 +279,10 @@ int rtw_init_mlme_priv(struct adapter *padapter)/* struct	mlme_priv *pmlmepriv)
 
 void rtw_free_mlme_priv(struct mlme_priv *pmlmepriv)
 {
-	_rtw_free_mlme_priv(pmlmepriv);
+	rtw_free_mlme_priv_ie_data(pmlmepriv);
+
+	if (pmlmepriv)
+		vfree(pmlmepriv->free_bss_buf);
 }
 
 static struct wlan_network *rtw_alloc_network(struct mlme_priv *pmlmepriv)
diff --git a/drivers/staging/r8188eu/include/rtw_mlme.h b/drivers/staging/r8188eu/include/rtw_mlme.h
index 1dc1fbf04..fc30793f4 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme.h
@@ -560,8 +560,6 @@ void rtw_scan_timeout_handler(struct adapter *adapter);
 
 void rtw_free_mlme_priv_ie_data(struct mlme_priv *pmlmepriv);
 
-void _rtw_free_mlme_priv(struct mlme_priv *pmlmepriv);
-
  struct wlan_network *_rtw_alloc_network(struct mlme_priv *pmlmepriv);
 
 void _rtw_free_network(struct mlme_priv *pmlmepriv,
-- 
2.30.2

