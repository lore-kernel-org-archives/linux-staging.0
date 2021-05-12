Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DBC71
	for <linux-staging@lists.linux.dev>; Wed, 12 May 2021 15:32:14 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id r11so3545567edt.13
        for <linux-staging@lists.linux.dev>; Wed, 12 May 2021 08:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q9xyIoE6CrjZqQcs86QMTM/B4ykQ6IuUZXiQ0CWZo0U=;
        b=pQlMk9VnhDTBGRLs8hPH0QQpSihJHLzY2vQCZyNMjS5cpYFqwn1j+EnmAjBAcF59i5
         FGyMzxEou7ykJLKPytdLn1UiRt3CFxQa3yVd9h468K5RJVcnUHDnwMHDYuyuaNzQGQgW
         RkDgp0K9iG5ty9tPbEuolzRPvZOOQ9sDZeguUFKDndQF75kmb5m6iiknGdWpN4HUR4P5
         tlxcu8FxavibfMAhQkTuL9vplOZsC24UYSY1PFx48HZr8xJ8ogTrPj+V1mr8G4yTd2Gm
         EDDxjAIl3PilQlVp0Z2yotpR1xq0VyWdbswTEHOKDTqygB5VFDQw2Do0tJua0rD1hLd3
         Gphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q9xyIoE6CrjZqQcs86QMTM/B4ykQ6IuUZXiQ0CWZo0U=;
        b=Tqxmz9cAg4+GV5VvLKmtaFq1RFY0yUO7q1lpolHxEhBSnOBV5uoRf+ISs+IjhhEY35
         Exh9wTRau53npZ9ctm4TLI2VfWHk+8WXB8ym7ysvb6rKYRr9ECgnTcSseIZFb/9D9ZvZ
         MjI137jtQrTOF/zlTNkgCyLS/kBwZGOsZ7QS4QV8Zr/8blufpt2CgjUV3HqGr3Fy21mX
         IGIhPJFVPpu+vhknNi5BOWyI8Mk8osQQjRpajSEvfdC4eJE51KfskH/wM5eCYrIW0wOO
         rFnoyxXxjpA2wqCnPr7zAJkng++Lq/+CvfYbF/maCXEJa8aKdEbg2n5DgDaGs6J04bsy
         zYkw==
X-Gm-Message-State: AOAM53295rZPr8g+wC24AaIT1sCvnou0QM2UqAgh5bTgKfA2qWTukU30
	NjII2OrFh0CjObzwqnjOW7w=
X-Google-Smtp-Source: ABdhPJyTOS3XGFR8y61FuIO8viOKx45YtC+kDNjtdX3dmmSVuFgqv9yPETZmKdBZ0PgAWb7XbQrfrA==
X-Received: by 2002:a05:6402:1807:: with SMTP id g7mr43524931edy.335.1620833532671;
        Wed, 12 May 2021 08:32:12 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it. [79.52.107.152])
        by smtp.gmail.com with ESMTPSA id q25sm28866ejd.9.2021.05.12.08.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 08:32:12 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: rtl8723bs: core: Remove unnecessary lines of code
Date: Wed, 12 May 2021 17:32:08 +0200
Message-Id: <20210512153208.9584-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed unnecessary lines of code inside an "else if" block.
That code acquires a spinlock and iterates over each item in
a linked list for no purpose.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 20 +------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index c5430e737bb1..74cfc7b0a5a2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -5125,23 +5125,9 @@ void _linked_info_dump(struct adapter *padapter)
 
 	if (padapter->bLinkInfoDump) {
 
-		if ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE) {
+		if ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE)
 			rtw_hal_get_def_var(padapter, HAL_DEF_UNDERCORATEDSMOOTHEDPWDB, &UndecoratedSmoothedPWDB);
-		} else if ((pmlmeinfo->state&0x03) == _HW_STATE_AP_) {
-			struct list_head	*phead, *plist;
 
-			struct sta_info *psta = NULL;
-			struct sta_priv *pstapriv = &padapter->stapriv;
-
-			spin_lock_bh(&pstapriv->asoc_list_lock);
-			phead = &pstapriv->asoc_list;
-			list_for_each(plist, phead) {
-				psta = list_entry(plist, struct sta_info,
-						  asoc_list);
-			}
-			spin_unlock_bh(&pstapriv->asoc_list_lock);
-
-		}
 		for (i = 0; i < NUM_STA; i++) {
 			if (pdvobj->macid[i]) {
 				if (i != 1) /* skip bc/mc sta */
@@ -5150,11 +5136,7 @@ void _linked_info_dump(struct adapter *padapter)
 			}
 		}
 		rtw_hal_set_def_var(padapter, HAL_DEF_DBG_RX_INFO_DUMP, NULL);
-
-
 	}
-
-
 }
 
 static u8 chk_ap_is_alive(struct adapter *padapter, struct sta_info *psta)
-- 
2.31.1

