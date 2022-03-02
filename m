Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB4F6136
	for <linux-staging@lists.linux.dev>; Wed,  2 Mar 2022 20:48:38 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id u16so2938667pfg.12
        for <linux-staging@lists.linux.dev>; Wed, 02 Mar 2022 12:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qqbW4mdqciy+82dvr9Ujq0D1mLaRlfhiMe48ZVZg+Ds=;
        b=JJ6JYyQE/5/9vxeTZIIdWgeBM/zmg+L98MNjcZd0o2zhHMBTDjYcxsp/LuqCKUuFsJ
         viLEUxdLWN1Kg1SWyfTYIBNpl2ih0WB7MwW1HJCHhDisEU7cBvdIPoSrykrsH/5DW6x9
         yYLtqtF2CdidfNOlAaKFnU1+UKtH6gIttB4IkwstNnOtF8ogVfZTTX5KSPJUHPFz41Zp
         1fc4X7h72QUp2ryaurEPId7wNP673kqBCSebYIzwgaPKPEaVxyea2ZtuuvJ4++wHhHux
         EoT1F/hTytT+15sSnDJf8tkkHK3wY/oJcpwROOl3TvQ4gatqRJ89ZFt7htd7sCVKI2rf
         2vPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qqbW4mdqciy+82dvr9Ujq0D1mLaRlfhiMe48ZVZg+Ds=;
        b=t5IoPtVCSORXz4t0dWzq5IVHt2DAJXL6fQ72GYCNXmX9senqZ6z0zMgOGInPlF7Rg8
         SfTov3ST0FBruo5lMW0LrxIYbzNRVRhTZ+6sYqqcTz0Is1ZxxSa6bA/uYgn9TpI7KytS
         gpPZGCmuGHoxDh49tkv8ptZ5szYXw00so5wTgHKsZOcxupI4E0VJTfIEtKN4JSCuGp5c
         3tpPBdXJBipPwpEaHIqSlPNmahVB3fZoo1DumH9P3N49vlpvuAZXrX9Qsi4as2bu3ED2
         DWN8dn9hqC71I2L/zXo0nF+6KPSR+lxASNKKNPMqdN7IEcfaYBWh99O630BKiZaRG1co
         i4PA==
X-Gm-Message-State: AOAM533Ev8VBHvIJMwq7G1CIdxy+jqnf3tC1oOcn5mOE75eiErYm3zaW
	K+a0j/dMIoBaxt2a4s9JXKA=
X-Google-Smtp-Source: ABdhPJxPv4BnSvxVWj8xRhjbwT5XPOZlzy7nsDZ/fonBx/0aZNrIynaWFG7cZ+7WPnnjhQt35h/xtA==
X-Received: by 2002:a05:6a00:248c:b0:4e1:4b53:18f1 with SMTP id c12-20020a056a00248c00b004e14b5318f1mr35078186pfv.79.1646254117836;
        Wed, 02 Mar 2022 12:48:37 -0800 (PST)
Received: from localhost.localdomain ([103.161.98.179])
        by smtp.gmail.com with ESMTPSA id bh11-20020a056a00308b00b004f40144cf76sm50905pfb.142.2022.03.02.12.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 12:48:37 -0800 (PST)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH 11/16] staging: r8188eu: mark is_ap_in_tkip as bool
Date: Thu,  3 Mar 2022 02:17:32 +0530
Message-Id: <20220302204737.49056-12-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220302204737.49056-1-makvihas@gmail.com>
References: <20220302204737.49056-1-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mark is_ap_in_tkip as bool as it returns true/false.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_wlan_util.c   | 2 +-
 drivers/staging/r8188eu/include/rtw_mlme_ext.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index 8e8a82a1e..665b07719 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -1013,7 +1013,7 @@ void update_beacon_info(struct adapter *padapter, u8 *pframe, uint pkt_len, stru
 	}
 }
 
-unsigned int is_ap_in_tkip(struct adapter *padapter)
+bool is_ap_in_tkip(struct adapter *padapter)
 {
 	u32 i;
 	struct ndis_802_11_var_ie *pIE;
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index cf397ac68..0c555ea67 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -508,7 +508,7 @@ unsigned int receive_disconnect(struct adapter *padapter,
 
 unsigned char get_highest_rate_idx(u32 mask);
 int support_short_GI(struct adapter *padapter, struct HT_caps_element *caps);
-unsigned int is_ap_in_tkip(struct adapter *padapter);
+bool is_ap_in_tkip(struct adapter *padapter);
 
 void report_join_res(struct adapter *padapter, int res);
 void report_survey_event(struct adapter *padapter, struct recv_frame *precv_frame);
-- 
2.30.2

