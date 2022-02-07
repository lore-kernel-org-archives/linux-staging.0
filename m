Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3312F2C
	for <linux-staging@lists.linux.dev>; Mon,  7 Feb 2022 23:42:41 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id ay7so4856250oib.8
        for <linux-staging@lists.linux.dev>; Mon, 07 Feb 2022 15:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X94FZ2c+7TUXwZqG/jE1cAOFdmfyxcJBnlGMdedsJC0=;
        b=EEKRZvEo5wj8N0q0UazmMypoDWIzYj1SS/fXmHO1sqtNkhMVbrCRUiMCrKYkMeCx/A
         P+XQa5R/00XOevC4mc/SJ8/E3zA9DemKHgMSzKxZHVE6hxcFvSWAFoW9ulhXxGeySoV0
         /65iUadXmZYasgRtATsjOhYWm7vsiO0Bzen5UU7clkaivpJwXqAZF0Fpz/StHIIsMLxV
         /qjBwGKsYY1VwF/rTtOhaZdwXGTjJV21S7sJAz3lEADVRCfouU6J1O1/BiF+O7MpBgVB
         WTtBz1CE9VWApuIMr8AHs4drbcqBr0k5xEXn+QfhPKTPNdkpgj7v1GPtF+F6/5KNYsu7
         z7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X94FZ2c+7TUXwZqG/jE1cAOFdmfyxcJBnlGMdedsJC0=;
        b=akWrngiZjfPbzejqUJRhjoshOsLky3L5JWrLML3Gj0P5W+3KWd4WAusaBXDXpph+sA
         1Epjro+MbUFP8ayoZfahNcvTnDmRfU6Vwi8x1VQIxZwH/XpFRH8f1kL5pbabsk9t4OMy
         46tNbP49knpldakQ0bR58uHby9NmWp8CRn4MTIydZ2Hx4Q22uewdvQRT2HRiMihguhf2
         LpGTWgwmD8ujANbKTqbPoLTNAfvM780JbNgi2HFqwYFnSzIbTa8z2tpamzOiNDFLvp0X
         HTXL1tjR3ZN91gr3dPp2MBU7U1EdQYg6u6OJ0o2MZrncOH8fT/NLZMICpRYFDLD0Dro8
         0tVg==
X-Gm-Message-State: AOAM533AWJcUfD1ljtOIRSMVrlZZ/i8xM8MLAjeoRNB4/nOrw8a2u9WJ
	CNtZXi+/DFqQ6t06AzUUlLq8YNxSa5qe3Q3U
X-Google-Smtp-Source: ABdhPJwex7LwSxsPOqDgiTeSbxDjuSKwRYmdSxhr9EFfsRIDBn7ix6ZU0W0bEvpF5TJxPYOnGM5Pdg==
X-Received: by 2002:a05:6808:2188:: with SMTP id be8mr620443oib.63.1644277360326;
        Mon, 07 Feb 2022 15:42:40 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:4cd8:12bf:4134:806a:5a4a:2a88])
        by smtp.gmail.com with ESMTPSA id w20sm4590903ooe.3.2022.02.07.15.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 15:42:39 -0800 (PST)
From: Leonardo Araujo <leonardo.aa88@gmail.com>
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Leonardo Araujo <leonardo.aa88@gmail.com>
Subject: [PATCH] Staging: r8188eu: core: 'associcated' may be misspelled - perhaps 'associated'?
Date: Mon,  7 Feb 2022 20:42:10 -0300
Message-Id: <20220207234210.26097-1-leonardo.aa88@gmail.com>
X-Mailer: git-send-email 2.29.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the following checkpatch.pl warning:

CHECK: 'associcated' may be misspelled - perhaps 'associated'?

Signed-off-by: Leonardo Araujo <leonardo.aa88@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ap.c b/drivers/staging/r8188eu/core/rtw_ap.c
index 1675e2e8439c..e02dd8e11c95 100644
--- a/drivers/staging/r8188eu/core/rtw_ap.c
+++ b/drivers/staging/r8188eu/core/rtw_ap.c
@@ -819,7 +819,7 @@ static int rtw_ht_operation_update(struct adapter *padapter)
 
 void associated_clients_update(struct adapter *padapter, u8 updated)
 {
-	/* update associcated stations cap. */
+	/* update associated stations cap. */
 	if (updated) {
 		struct list_head *phead, *plist;
 		struct sta_info *psta = NULL;
@@ -972,7 +972,7 @@ void bss_cap_update_on_sta_join(struct adapter *padapter, struct sta_info *psta)
 		update_beacon(padapter, _HT_ADD_INFO_IE_, NULL, true);
 	}
 
-	/* update associcated stations cap. */
+	/* update associated stations cap. */
 	associated_clients_update(padapter,  beacon_updated);
 
 	DBG_88E("%s, updated =%d\n", __func__, beacon_updated);
@@ -1036,7 +1036,7 @@ u8 bss_cap_update_on_sta_leave(struct adapter *padapter, struct sta_info *psta)
 		update_beacon(padapter, _HT_ADD_INFO_IE_, NULL, true);
 	}
 
-	/* update associcated stations cap. */
+	/* update associated stations cap. */
 
 	DBG_88E("%s, updated =%d\n", __func__, beacon_updated);
 
-- 
2.29.0

