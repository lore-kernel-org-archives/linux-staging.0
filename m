Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6511374;
	Tue, 19 Apr 2022 18:19:48 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id hh4so5477076qtb.10;
        Tue, 19 Apr 2022 11:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TsS6c/RnnW8N28Uqgbk6xNjG2rAtG4yyJqhZPCFyu68=;
        b=a0X4omet7ubwepI7Sjq1GKWazDAR1sokGbqsF2O9SYrR/5aybF/+dqcutAJ4hSLFDY
         bQ5EY2/ufswhxA8QIWGeRgngEYDAJuXeMOk2K09O7GN5G9sfoceLBhIac6OEnUv0xIbR
         jSqTQ8mdx2ehVp7LMxd9ir62r9npohwyda3GsBbiEjQ0icSm/UMTTMNLCDRos5YrCUWn
         9HcgWTPZ5l9e2dEAtLcB7fygjCtb5NVtnk+u44cwVTXiEqmB982JAZ0FxwPU4zuUMvFc
         nBBFMf8yrpBe/9pApKfrmZcMuKY0rPQ8TGDEL95ptt7rP2Mk7ZP0Hk/gtNveCte/P6C3
         a7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TsS6c/RnnW8N28Uqgbk6xNjG2rAtG4yyJqhZPCFyu68=;
        b=liL+XSDUZ3hxSlw4Y7gSwJkFq6yX51nhWwdRByz+71zDUNjxAsYe+ErZBHxiE89eJD
         I+CsJRv3CWuw7stGNzoq3Zc7C6PU8cH+leLPIHqzEC6dZ32SD6qEc8dA4QqNrP/9K7qF
         p/IEd6dXNs4IzcwkS4vqGe682Y8ZEW9bXCLLO0NDNQhk+sOViU9IoJ3ibMa4ZWYoT1HF
         q4pnmpdpdBsMe77FEaqV1BKAfl6LcrKcq/hylMMB9AXFXVr1gr/espOkmVErv38c2HEU
         d0ZlDFUpTqWD96q5i/tDheI+n1LhFhxnaWQ8pnL9P5oRMwt0Xbjwsk/MI9IJS7eSUb5k
         KRkA==
X-Gm-Message-State: AOAM533O6yMHysy5qFGS5K4XSKAxmSCk0TMWDWsOYrFOqICF1C0g+deE
	aoKXB2FcISkjcilTmCcXR7E=
X-Google-Smtp-Source: ABdhPJxrlyYuX/eLyo4aukz0bVgPyF+C57SnMVxkrDap85pqIY+pyePm5XZh0i/1LddBILjTx5eyLw==
X-Received: by 2002:a05:622a:1792:b0:2f3:3a82:b15e with SMTP id s18-20020a05622a179200b002f33a82b15emr2286518qtk.246.1650392387084;
        Tue, 19 Apr 2022 11:19:47 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.wework.com ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id e126-20020a376984000000b0069c86b28524sm373334qkc.19.2022.04.19.11.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 11:19:45 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	jhpark1013@gmail.com,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH v3 1/7] staging: r8188eu: remove unused member free_bss_buf
Date: Tue, 19 Apr 2022 14:19:32 -0400
Message-Id: <3c5a510938ac395a13bb09c0de1868cce8ca3dd8.1650392020.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650392020.git.jhpark1013@gmail.com>
References: <cover.1650392020.git.jhpark1013@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The free_bss_buf member of pmlmepriv is unused. Remove all related
lines.

Suggested-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
---
 drivers/staging/r8188eu/include/rtw_mlme.h |  1 -
 drivers/staging/r8188eu/core/rtw_mlme.c    | 21 +--------------------
 2 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_mlme.h b/drivers/staging/r8188eu/include/rtw_mlme.h
index 1dc1fbf049af..0f03ac43079c 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme.h
@@ -319,7 +319,6 @@ struct mlme_priv {
 	struct list_head *pscanned;
 	struct __queue free_bss_pool;
 	struct __queue scanned_queue;
-	u8 *free_bss_buf;
 	u8	key_mask; /* use to restore wep key after hal_init */
 	u32	num_of_scanned;
 
diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 3e9882f89f76..8af11626a3e7 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -33,8 +33,7 @@ u8 rtw_to_roaming(struct adapter *adapter)
 static int _rtw_init_mlme_priv(struct adapter *padapter)
 {
 	int	i;
-	u8	*pbuf;
-	struct wlan_network	*pnetwork;
+	struct wlan_network	*pnetwork = NULL;
 	struct mlme_priv		*pmlmepriv = &padapter->mlmepriv;
 	int	res = _SUCCESS;
 
@@ -55,16 +54,6 @@ static int _rtw_init_mlme_priv(struct adapter *padapter)
 
 	memset(&pmlmepriv->assoc_ssid, 0, sizeof(struct ndis_802_11_ssid));
 
-	pbuf = vzalloc(MAX_BSS_CNT * (sizeof(struct wlan_network)));
-
-	if (!pbuf) {
-		res = _FAIL;
-		goto exit;
-	}
-	pmlmepriv->free_bss_buf = pbuf;
-
-	pnetwork = (struct wlan_network *)pbuf;
-
 	for (i = 0; i < MAX_BSS_CNT; i++) {
 		INIT_LIST_HEAD(&pnetwork->list);
 
@@ -79,8 +68,6 @@ static int _rtw_init_mlme_priv(struct adapter *padapter)
 
 	rtw_init_mlme_timer(padapter);
 
-exit:
-
 	return res;
 }
 
@@ -109,13 +96,7 @@ void rtw_free_mlme_priv_ie_data(struct mlme_priv *pmlmepriv)
 
 void _rtw_free_mlme_priv(struct mlme_priv *pmlmepriv)
 {
-
 	rtw_free_mlme_priv_ie_data(pmlmepriv);
-
-	if (pmlmepriv) {
-		vfree(pmlmepriv->free_bss_buf);
-	}
-
 }
 
 struct	wlan_network *_rtw_alloc_network(struct	mlme_priv *pmlmepriv)/* _queue *free_queue) */
-- 
2.25.1

