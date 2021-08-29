Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7E472
	for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 09:25:27 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id u14so23968378ejf.13
        for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 02:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y/vLiAJAaLirA4avCZmKDO9X3ZYIarkhOAplTyeTCuQ=;
        b=Qr1Vu7B/4dGm3jo/y7RSWSg2knbJ+HvFnc1LNyTB5MqJfVz1+bH3pl4YrrAQKQFz9E
         8adHx89CHjAw7IcQvSOP7QVo4K8kfCP9WtLak2g05CIj4J89LMzz20ondNdV0Ro4Dt0Q
         vMDaJL00H/7LbJrEhHt31JQit3aFXs0ApjtgmdfLBwIrJkhhj3niXuFOvzl7VnB8MPb+
         qUc0aAmiXCNgLdTEfmIjh5xSwXOzO6dKaQVEIcrJeYHlTQY0jpKfnrMesrryjBWL8/h7
         WbQa+3Q9pOvMBk1WQPQzZfGA4q8zXJyPI8tyLZca3oHExyE0spoLmbG9kb2/Fe1Fwvbm
         M8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y/vLiAJAaLirA4avCZmKDO9X3ZYIarkhOAplTyeTCuQ=;
        b=WFci/vjBqbJjqvumblmVhvSY5TaVzc55mGhW472kqe15Pv55d4Kqxle8paEfiSEViN
         nxhFYOUvls1FTXqqw4/b5XGkFfCD+LkNfL+f0bPY7CmAFpoKP2dnp1R3FEddybRmCpSP
         YiV/S6agOmp/Qr9bysVfA2kl6mk1Znw0u3CQ8/Fhw1EbxJlISiApQoPh3B3dAiCsmVun
         S7yy7N+0VX0h2NWQSSvbkSHCMCI4pmbIQhYJnPvD2IhHhw2u/+r4K8Fa5CJ0QtFCcqLR
         VQZrbAiCS0FbqrAUbHmOzmplZevi0YzsP2Cr+jIp9q6KHZdENA2wGjX0J+lsgQsCOn5d
         Ivnw==
X-Gm-Message-State: AOAM532quh9irSBV3YTl9UGcCj8v+zk0VXJVeUEuqOLWa3lTtVp9LlxO
	CmTwnpXjQpC1xmJEE1I11oE=
X-Google-Smtp-Source: ABdhPJxikWcghIcWhGlR1xactSOdoCHE1XbeAujWmVrTeKRwpMF9J6c5zpFfY+BMadydR8ycLEgvIw==
X-Received: by 2002:a17:906:c249:: with SMTP id bl9mr19266425ejb.225.1630229126040;
        Sun, 29 Aug 2021 02:25:26 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::16fa])
        by smtp.gmail.com with ESMTPSA id d23sm5814414edt.39.2021.08.29.02.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 02:25:25 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 5/6] staging: r8188eu: remove is_ap_in_wep()
Date: Sun, 29 Aug 2021 11:25:01 +0200
Message-Id: <20210829092502.3658-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210829092502.3658-1-straube.linux@gmail.com>
References: <20210829092502.3658-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function is_ap_in_wep() is unused, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_wlan_util.c  | 30 -------------------
 .../staging/r8188eu/include/rtw_mlme_ext.h    |  1 -
 2 files changed, 31 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index ddc84f6b74e2..8491d82f4a70 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -1134,36 +1134,6 @@ unsigned int should_forbid_n_rate(struct adapter *padapter)
 	}
 }
 
-unsigned int is_ap_in_wep(struct adapter *padapter)
-{
-	u32 i;
-	struct ndis_802_11_var_ie *pIE;
-	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
-	struct wlan_bssid_ex		*cur_network = &pmlmeinfo->network;
-
-	if (rtw_get_capability((struct wlan_bssid_ex *)cur_network) & WLAN_CAPABILITY_PRIVACY) {
-		for (i = sizeof(struct ndis_802_11_fixed_ie); i < pmlmeinfo->network.IELength;) {
-			pIE = (struct ndis_802_11_var_ie *)(pmlmeinfo->network.IEs + i);
-
-			switch (pIE->ElementID) {
-			case _VENDOR_SPECIFIC_IE_:
-				if (!memcmp(pIE->data, RTW_WPA_OUI, 4))
-					return false;
-				break;
-			case _RSN_IE_2_:
-				return false;
-			default:
-				break;
-			}
-			i += (pIE->Length + 2);
-		}
-		return true;
-	} else {
-		return false;
-	}
-}
-
 int wifirate2_ratetbl_inx(unsigned char rate)
 {
 	int	inx = 0;
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index 01f770d02e5f..1695a9695ddf 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -516,7 +516,6 @@ unsigned int receive_disconnect(struct adapter *padapter,
 unsigned char get_highest_rate_idx(u32 mask);
 int support_short_GI(struct adapter *padapter, struct HT_caps_element *caps);
 unsigned int is_ap_in_tkip(struct adapter *padapter);
-unsigned int is_ap_in_wep(struct adapter *padapter);
 unsigned int should_forbid_n_rate(struct adapter *padapter);
 
 void report_join_res(struct adapter *padapter, int res);
-- 
2.32.0

