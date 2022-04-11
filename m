Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3571363
	for <linux-staging@lists.linux.dev>; Mon, 11 Apr 2022 10:22:13 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id j8so13425693pll.11
        for <linux-staging@lists.linux.dev>; Mon, 11 Apr 2022 03:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u0Zrucn+WwL2muTuZbK71MP5TYNDykrOeiAojxdU0WI=;
        b=Ch7QdJknQqzcOMoV8qxSf6WOdf7BNtp+gc2rzVO0jw+mSNFxtNzmw/zu72/nAI7tbw
         u84t7t6no98vZm/up1Z8bUEbzFlFfeRkYmRPlwKjT+cscsV9eEHUZKNnBiuXUf3WhiT4
         yPeU1K1tv8EeDkfGOupRpLBLT5r3GAPx9tkcLat/RfuI+z1KHRLY5mP3sBnpPbY5vGzV
         ChatEL3m4Iv7smjU4LZfDieL8WwozJFtKPBJ53+kk4lVstpqd9bhbnUlPZBXGGVoKRHA
         vS8onxkLGq1yq67MU22cpGaXBel69FYTvpn+BrITDN2uXhqbUtpOR2xOYOoCVC7saFlA
         Xgjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u0Zrucn+WwL2muTuZbK71MP5TYNDykrOeiAojxdU0WI=;
        b=xe5e3ixSXZyJ2uISh5pOl5Jk4HpC1Z8l6e8mo3+v6OhsXU/ZAtN4enAWNDh4B+kL8U
         uuxyJEpDHZJ4mV2Iil8Mql7njB9IaErNJhviZzZWYp8ZJDDOcIgZuO8kOEsVTdg0KJbp
         bE37BSJk6x5jxRPQSK1GdAxajeH3v6R5jWJBn7T+wqESd5LDRM3381vFNWttOX7SZse7
         1EgH/bw8LfoXGL1JxWpC/ODTx41YFMTt8W1limQ0b1FFqeruHRXbk4Ln8M2Gdbv8HHHs
         RJSt2VXevQ8D8AbPWJVc0QBlkNjTKvKEpuVZAUoTLf02ITHhYrKDMQQI2xbj01rJpLcz
         yzDQ==
X-Gm-Message-State: AOAM53082czibI69PuheGlLJHTtuS3y/hMqroVPRF+lb0i0rVBI1K5mP
	JJ6NETLfLXeHzBoIH0Sg0cU=
X-Google-Smtp-Source: ABdhPJxYWMg1MZfRhJeYN5uUBu1QegtEZehtCCABl6fPidSMXprTMg1jnpqCwnjSCiprkDJGzgMJQA==
X-Received: by 2002:a17:90b:4c92:b0:1c7:a9a3:6274 with SMTP id my18-20020a17090b4c9200b001c7a9a36274mr35551149pjb.148.1649672532937;
        Mon, 11 Apr 2022 03:22:12 -0700 (PDT)
Received: from makvihas.localhost.com ([2405:201:202b:15:4376:c658:ae1e:1781])
        by smtp.gmail.com with ESMTPSA id z14-20020a17090a170e00b001cb7e69ee5csm4886318pjd.54.2022.04.11.03.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 03:22:12 -0700 (PDT)
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
Subject: [PATCH v2 5/7] staging: r8188eu: drop unnecessary wrapper _rtw_free_mlme_priv
Date: Mon, 11 Apr 2022 15:51:34 +0530
Message-Id: <20220411102136.14937-6-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220411102136.14937-1-makvihas@gmail.com>
References: <20220411102136.14937-1-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop unnecessary wrapper _rtw_free_mlme_priv and move its logic to
rtw_free_mlme_priv.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c    | 17 +++++------------
 drivers/staging/r8188eu/include/rtw_mlme.h |  2 --
 2 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 6b8c80fe9..5584e1b84 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -53,17 +53,6 @@ void rtw_free_mlme_priv_ie_data(struct mlme_priv *pmlmepriv)
 	rtw_free_mlme_ie_data(&pmlmepriv->p2p_assoc_req_ie, &pmlmepriv->p2p_assoc_req_ie_len);
 }
 
-void _rtw_free_mlme_priv(struct mlme_priv *pmlmepriv)
-{
-
-	rtw_free_mlme_priv_ie_data(pmlmepriv);
-
-	if (pmlmepriv) {
-		vfree(pmlmepriv->free_bss_buf);
-	}
-
-}
-
 struct	wlan_network *_rtw_alloc_network(struct	mlme_priv *pmlmepriv)/* _queue *free_queue) */
 {
 	struct	wlan_network	*pnetwork;
@@ -290,7 +279,11 @@ int rtw_init_mlme_priv(struct adapter *padapter)/* struct	mlme_priv *pmlmepriv)
 
 void rtw_free_mlme_priv(struct mlme_priv *pmlmepriv)
 {
-	_rtw_free_mlme_priv(pmlmepriv);
+	rtw_free_mlme_priv_ie_data(pmlmepriv);
+
+	if (pmlmepriv) {
+		vfree(pmlmepriv->free_bss_buf);
+	}
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

