Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157503FC3
	for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 15:37:40 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id w29so24132212wra.8
        for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 08:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qxOyobLZn5i5+ghXkOmiy23gp8zoW0xgzcmJjVSUJjc=;
        b=RDQXPy7kcxIwgzVAYeEmDc/Zr3Tsf0x7SowPNr9khcD6znlVcCST6QV6H4tvEnKWJz
         +NQqXXJ8Ng6Q92u7yL/9JQBMuP/ANsJx8pVubeMAcRCOdkiO/9XUuTHfi8p5PIs99L/K
         oiKavx6kNMdKvMQ3wu3PG57t6797nxD28mpMYgIfDefnxqyB5rZj7Zo0c2vq2BnYDJEO
         WEgOWztg98TPfrWTnJBWbBOKAxkxd+Lfrjda7t9TStVyWXQxU9CBP5T5VHBT4n71hNwc
         qGq4oc+k0NFl9yRZOO/AB0VTPIL1e9CrcSV3Vv93PZVraeAceWXKZB087rpAmrSiNdfP
         DX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qxOyobLZn5i5+ghXkOmiy23gp8zoW0xgzcmJjVSUJjc=;
        b=w6f0D7wl9rsjEmEzytLwVdF1Nys1olDxX7OIVRfGnX78rVzCtLVgvwptSJ2JWMUHCE
         Q57hFK7erct9L/oKGrL7jWpZutUxccQ6havcIISBhKhZPdy2YSP67Cebt+B2uDDdLGjt
         T2wBjyvNF+NhrU4ulJ15fjVRqdY8w2iwMSDtebpMyvZM1tUivdA4E7ifMIdzkN0oAlLM
         1Htdi1g/TH/0smzw0rX5NKjZXCVtGFIEngsSPp4HfHn4cfqJA/4yz1E1E8Xifm38cUdK
         BE4Caa64vFnuL/3cSJwYlL9+/+Ew+uQzIRlC1lmMWNW9VNAeF+/JmVbX/JxeMbQs+swu
         8yEQ==
X-Gm-Message-State: AOAM531CXZExkd6tN23lTTkW6w70LdftKWbRZUsQTYRFsIbtfUZ5Iwji
	fBjmtq+zgsFChzl3dlojkwE=
X-Google-Smtp-Source: ABdhPJxD8UjgldRY+3Q95jeOI/NWh949OBuYzQdHN0t8XX/Z+eZQS+cdb8qssFMaxcT4Nlf01by15Q==
X-Received: by 2002:adf:ce84:: with SMTP id r4mr23813135wrn.107.1632065858458;
        Sun, 19 Sep 2021 08:37:38 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id l15sm16614501wme.42.2021.09.19.08.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 08:37:38 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/6] staging: r8188eu: remove ap_sta_info_defer_update()
Date: Sun, 19 Sep 2021 17:36:54 +0200
Message-Id: <20210919153659.20826-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210919153659.20826-1-straube.linux@gmail.com>
References: <20210919153659.20826-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function ap_sta_info_defer_update() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ap.c    | 9 ---------
 drivers/staging/r8188eu/include/rtw_ap.h | 1 -
 2 files changed, 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ap.c b/drivers/staging/r8188eu/core/rtw_ap.c
index b265de3ff88d..49d65d5b3bac 100644
--- a/drivers/staging/r8188eu/core/rtw_ap.c
+++ b/drivers/staging/r8188eu/core/rtw_ap.c
@@ -1731,15 +1731,6 @@ void sta_info_update(struct adapter *padapter, struct sta_info *psta)
 	update_sta_info_apmode(padapter, psta);
 }
 
-/* called >= TSR LEVEL for USB or SDIO Interface*/
-void ap_sta_info_defer_update(struct adapter *padapter, struct sta_info *psta)
-{
-	if (psta->state & _FW_LINKED) {
-		/* add ratid */
-		add_RATid(padapter, psta, 0);/* DM_RATR_STA_INIT */
-	}
-}
-
 void start_ap_mode(struct adapter *padapter)
 {
 	int i;
diff --git a/drivers/staging/r8188eu/include/rtw_ap.h b/drivers/staging/r8188eu/include/rtw_ap.h
index c7cdab00538d..11e6f799d577 100644
--- a/drivers/staging/r8188eu/include/rtw_ap.h
+++ b/drivers/staging/r8188eu/include/rtw_ap.h
@@ -30,7 +30,6 @@ void associated_clients_update(struct adapter *padapter, u8 updated);
 void bss_cap_update_on_sta_join(struct adapter *padapter, struct sta_info *psta);
 u8 bss_cap_update_on_sta_leave(struct adapter *padapter, struct sta_info *psta);
 void sta_info_update(struct adapter *padapter, struct sta_info *psta);
-void ap_sta_info_defer_update(struct adapter *padapter, struct sta_info *psta);
 u8 ap_free_sta(struct adapter *padapter, struct sta_info *psta,
 	       bool active, u16 reason);
 int rtw_sta_flush(struct adapter *padapter);
-- 
2.33.0

