Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0ED182;
	Fri, 15 Apr 2022 02:48:45 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id z19so5289918qtw.2;
        Thu, 14 Apr 2022 19:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fqkAa0xDrLSxFAeOhD4dr36p7/F0dV1HG8oV8HDPNB8=;
        b=WlMDhbSX4y+lb1Nsiiuf/Cuc2eHIAw+CSaCHR0Ri0OAHahn6QuwAhOjhaDnASaEIIw
         6Jpx7fOUliznPDroTk0iFfV5hbfPacaNZQHslC/57B1jP+yYfhv1/AvFp4d76PpPRgHQ
         D/O3ytuYuLIPFvuEN83kpzHh6ZCJ7Qg+1AOOwokcpEpY3+Bm7HTSyzkv4nu8dfNwIZ2S
         tp8V/F9bAU8CIkw3cXt5Jw8aEhbHZgNdBRGfgMyshZTVRS+axX72ZJ3nPnS0u8vzisxa
         rVQ5c7zhLZezX50SJy3xu6J3hfpOBO+qNuxip5pfM9rsKDgmOk+iJipQOrupJxtUXmBU
         0B1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fqkAa0xDrLSxFAeOhD4dr36p7/F0dV1HG8oV8HDPNB8=;
        b=oV+0vstTFwUEc7bNY0OnrWKoiNoscbXUnO44+PFUj3yVUlHaEq8PKtU2dpQ5JmB0Mz
         JcP4EOCWtsDfijkHzKCujg5PMtnKKWe5i3NKFUl2rfUbZjBLmI8s0y5LpE5UiuffUaaO
         FCr66Q423IeA1aJE6Er4J9w2WDPSsditLjJz0h2JPSPwPFLH8cGuVf5790quOAkqz+u5
         /YPEtkw5MO3Fc+Aw9tuwglCsJS5TKnJwQncRmWQqMAsXoJeGzA6TmguLBq97yeLo35h/
         TEt9hj8YYkg9WuDn9XoKgI5B1ltOhS7CkVLfKQapQ6tGKynBs4D3ZR0Qa57SLn+s5hIl
         baTw==
X-Gm-Message-State: AOAM532+XaT3yq2HFHS8G8i5uQlQwjkd0B4IQeXTt26G1w9T1PBncd7j
	21wKWxnzcSv97QtrUeZSuYE=
X-Google-Smtp-Source: ABdhPJwqZmj0qfgUb0PIyWQKSkAGo3aGIiwqrMOqrEBaiKBaOHLJA3RT1XS74B6DOSUOSsx4eSKqyA==
X-Received: by 2002:ac8:464e:0:b0:2f1:e40e:6e80 with SMTP id f14-20020ac8464e000000b002f1e40e6e80mr3452448qto.587.1649990924575;
        Thu, 14 Apr 2022 19:48:44 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.lan ([2607:fb90:1b7a:2349:50b1:5db4:a2d5:7054])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a22a700b0069c37e2c473sm1800085qkh.94.2022.04.14.19.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 19:48:43 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	jhpark1013@gmail.com,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH v2 1/6] staging: r8188eu: remove unused member free_bss_buf
Date: Thu, 14 Apr 2022 22:48:32 -0400
Message-Id: <e41e0d3b62395d04f41d6934074074c431e7aacc.1649990500.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649990500.git.jhpark1013@gmail.com>
References: <cover.1649990500.git.jhpark1013@gmail.com>
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
 drivers/staging/r8188eu/include/rtw_mlme.h | 1 -
 drivers/staging/r8188eu/core/rtw_mlme.c    | 7 -------
 2 files changed, 8 deletions(-)

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
index 3e9882f89f76..aed868d1d47b 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -61,7 +61,6 @@ static int _rtw_init_mlme_priv(struct adapter *padapter)
 		res = _FAIL;
 		goto exit;
 	}
-	pmlmepriv->free_bss_buf = pbuf;
 
 	pnetwork = (struct wlan_network *)pbuf;
 
@@ -109,13 +108,7 @@ void rtw_free_mlme_priv_ie_data(struct mlme_priv *pmlmepriv)
 
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

