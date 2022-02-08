Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559DE2F27
	for <linux-staging@lists.linux.dev>; Tue,  8 Feb 2022 19:25:56 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id s24so117372oic.6
        for <linux-staging@lists.linux.dev>; Tue, 08 Feb 2022 11:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o4fQscmZkT+if4EO2KKC4BHgRmaa2ZCGZYHdDINn6rg=;
        b=PdWrfXkIjt3VIfc2e4P3VaMlTO+XvE8D+4A1D4ulpwJs9IBNLMMWxt6+uPc+oeTfYb
         y108pvUNFvPJHS1PghA3SqZAxRa4XpmMNt4NMk6aefrv6XovDvjZEQ7TpcitL1lGJM/4
         OEFNgjYVU2rP458YVct8kg44N9jwLgS3IDuEUah8NFdRmFmx7f2IUSUH/D/kLeGYRu3f
         d5muvbwtnipYwVrA07PjIm2Vy0pG1QT6RTcfisVq/qoWJFisE29K8F8sjZAtvMs6TMFP
         tWKmlMjY+XgaLzAPBLOiV6FeJMyhFnBZQi1sGb3asKOBxxQ8LvpYXa4uQWCBBzm7cr15
         sGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o4fQscmZkT+if4EO2KKC4BHgRmaa2ZCGZYHdDINn6rg=;
        b=1bWN26PW2LqzLvRV/VjGlDYvAExhck7CfLyaaBeqWuXoVpT6onPk2R9FsfdDR4PISW
         OxoJMDMKY5JzPNo/agOcXfoHeodHcjeAlFYak8UFJPMdzckp/SyCs+duWFi7GRbc3Xyr
         ZT4HjrRZBgTNcDNpy8csrZN7hTvnKjr85oEoEW856/quYUPaRrTorNsEnXYbyWwVaqFp
         80lEg1Ph/gY6u8D9Hp7GK/RPutW9Vxjl2B5XeIKp3KzK1dwdgCD8ILqsH7noPaFT3Nfy
         7URTeI80mdeSys0c07oPj7PhuMwNtBP87hS97yW63UkgDnKGtpNCISuI0+MbMZffLK2f
         9Tyg==
X-Gm-Message-State: AOAM532dR1vI9mdSOAPvhWq+TuF61QLcrgthq+ZThInGdvZZrCize7w+
	pjOM4ZLC5oC5KLneJ2Zfk5M=
X-Google-Smtp-Source: ABdhPJwUhfUqWe+1ZtTYdnp1bQhJpEvnHbut3RIb8QPNR7nD0ROTEdtPAvr95qASDuj8bjX+HKwvJQ==
X-Received: by 2002:a05:6808:481:: with SMTP id z1mr1214409oid.197.1644348355377;
        Tue, 08 Feb 2022 11:25:55 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:4cd8:12bf:fde8:3cda:d976:7f4e])
        by smtp.gmail.com with ESMTPSA id k10sm5772649oou.26.2022.02.08.11.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 11:25:54 -0800 (PST)
From: Leonardo Araujo <leonardo.aa88@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Leonardo Araujo <leonardo.aa88@gmail.com>
Subject: [PATCH] Staging: r8188eu: core: Blank lines aren't necessary before a close brace '}'
Date: Tue,  8 Feb 2022 16:25:29 -0300
Message-Id: <20220208192529.19774-1-leonardo.aa88@gmail.com>
X-Mailer: git-send-email 2.29.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed a coding style issue.

Signed-off-by: Leonardo Araujo <leonardo.aa88@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index c7e8602d2097..5fdac6f8f717 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -1424,7 +1424,6 @@ void rtw_survey_cmd_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
 
 	/*  free cmd */
 	rtw_free_cmd_obj(pcmd);
-
 }
 void rtw_disassoc_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
 {
@@ -1483,7 +1482,6 @@ void rtw_createbss_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
 
 		rtw_indicate_connect(padapter);
 	} else {
-
 		pwlan = _rtw_alloc_network(pmlmepriv);
 		spin_lock_bh(&pmlmepriv->scanned_queue.lock);
 		if (!pwlan) {
@@ -1513,7 +1511,6 @@ void rtw_createbss_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
 	spin_unlock_bh(&pmlmepriv->lock);
 
 	rtw_free_cmd_obj(pcmd);
-
 }
 
 void rtw_setstaKey_cmdrsp_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
@@ -1526,7 +1523,6 @@ void rtw_setstaKey_cmdrsp_callback(struct adapter *padapter,  struct cmd_obj *pc
 		goto exit;
 exit:
 	rtw_free_cmd_obj(pcmd);
-
 }
 
 void rtw_setassocsta_cmdrsp_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
@@ -1553,5 +1549,4 @@ void rtw_setassocsta_cmdrsp_callback(struct adapter *padapter,  struct cmd_obj *
 
 exit:
 	rtw_free_cmd_obj(pcmd);
-
 }
-- 
2.29.0

