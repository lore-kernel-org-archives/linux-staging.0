Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B86670
	for <linux-staging@lists.linux.dev>; Thu,  5 Aug 2021 18:37:32 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id h63-20020a9d14450000b02904ce97efee36so6147587oth.7
        for <linux-staging@lists.linux.dev>; Thu, 05 Aug 2021 11:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QvrxKZYRMUNaIM73Q8/hmJCyEJRyuiPhNen0QxFebio=;
        b=JoqrEDdRhsXgSLt7gGqPtrE4wBhOEPH1YlruY4CLD5KKsG2IEYBCzZKlvYWiJgzxxU
         t7cytlDSCjYrv5sFHQXJ24hDadvHMQlbfT0tOXmcO6qB7zKwCofPGRJbqeDz8nJzsR2k
         owcz66lAB2XiLCfhtHXove2fCReEBkEgPOh6A8ADkrxEaGdXVzTDGOaoX02JAd+1W8nd
         LrJfaWHTql1O8R3p56QbnMnd1REyvK1pqMxH9qpSxzxnGtysP5IJxlZ7whwCgSYeIu4A
         2VuVyFI6CutYSv6d5R1CpVOLnddW2NfP3fY+2vQEzUMI1J6eyGwCjNibuVciQzqcEfkH
         4xVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=QvrxKZYRMUNaIM73Q8/hmJCyEJRyuiPhNen0QxFebio=;
        b=LQo8CRVNAuG2s3s13aiJ2em4bvsuALlWzNFFBvGoASM8e5gj9H0qOP/LwxvRgPNxzV
         U5sOW1SnjFaqJCWqlbDzu5aANrJcrdmShN7Oo5KT65QiY6d58/p9KIxVzyPHb7XchuxI
         j1D9Fda6nbGcwQkP1gelnU3L4dqC3ppFEeYxMfIiN1Vhz8UP1fs8x4SQmNQfZko+fcZ/
         LhAhB10OmBPxODDwNKRCfnNIFcVudEijOdeU5HKealB8Kq636LDO7CE3sT98rg13It7l
         oqeRDGStUHHNqEjwn7W+VcUzudkMTtcbzc19ytz/duc+uAwByYKNM33coJbSUMXnkUiI
         snAA==
X-Gm-Message-State: AOAM533+j0kFa9QD74CFNPOWvUmP2Kq5orF15vP9ns9S6jzoujYcTrlQ
	gOP33RRNWkn1hci9mwvpQyM=
X-Google-Smtp-Source: ABdhPJyAz5rGwFqmcIDM9ag05G5hLjx+WnSupeEdTUi7d282tKZ9S70iLrJy/787kqNrhfJNdyg1bQ==
X-Received: by 2002:a9d:7a52:: with SMTP id z18mr4793067otm.299.1628188651446;
        Thu, 05 Aug 2021 11:37:31 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-1016.res6.spectrum.com.com (2603-8090-2005-39b3-0000-0000-0000-1016.res6.spectrum.com. [2603:8090:2005:39b3::1016])
        by smtp.gmail.com with ESMTPSA id q32sm1156726oiw.37.2021.08.05.11.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 11:37:30 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
To: gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>
Subject: [PATCH 4/5] staging: r8188eu: Remove more empty routines
Date: Thu,  5 Aug 2021 13:37:16 -0500
Message-Id: <20210805183717.23007-5-Larry.Finger@lwfinger.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210805183717.23007-1-Larry.Finger@lwfinger.net>
References: <20210805183717.23007-1-Larry.Finger@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After removing some empty routines in os_dep/osdep_service.c, new routines
become empty. These include rtw_mfree_stainfo(),
_rtw_free_sta_xmit_priv_lock(), and rtw_mfree_recv_priv_lock.

Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
---
 drivers/staging/r8188eu/core/rtw_recv.c    |  6 ------
 drivers/staging/r8188eu/core/rtw_sta_mgt.c | 18 ------------------
 2 files changed, 24 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 47e19c506584..aef32f029537 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -96,18 +96,12 @@ int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter)
 	return res;
 }
 
-static void rtw_mfree_recv_priv_lock(struct recv_priv *precvpriv)
-{
-}
-
 void _rtw_free_recv_priv (struct recv_priv *precvpriv)
 {
 	struct adapter	*padapter = precvpriv->adapter;
 
 	rtw_free_uc_swdec_pending_queue(padapter);
 
-	rtw_mfree_recv_priv_lock(precvpriv);
-
 	rtw_os_recv_resource_free(precvpriv);
 
 	vfree(precvpriv->pallocated_frame_buf);
diff --git a/drivers/staging/r8188eu/core/rtw_sta_mgt.c b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
index b7c39d5e316c..fc963bee37be 100644
--- a/drivers/staging/r8188eu/core/rtw_sta_mgt.c
+++ b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
@@ -127,24 +127,6 @@ inline struct sta_info *rtw_get_stainfo_by_offset(struct sta_priv *stapriv, int
 	return (struct sta_info *)(stapriv->pstainfo_buf + offset * sizeof(struct sta_info));
 }
 
-void	_rtw_free_sta_xmit_priv_lock(struct sta_xmit_priv *psta_xmitpriv);
-void	_rtw_free_sta_xmit_priv_lock(struct sta_xmit_priv *psta_xmitpriv)
-{
-}
-
-static void	_rtw_free_sta_recv_priv_lock(struct sta_recv_priv *psta_recvpriv)
-{
-}
-
-void rtw_mfree_stainfo(struct sta_info *psta);
-void rtw_mfree_stainfo(struct sta_info *psta)
-{
-
-	_rtw_free_sta_xmit_priv_lock(&psta->sta_xmitpriv);
-	_rtw_free_sta_recv_priv_lock(&psta->sta_recvpriv);
-
-}
-
 static void rtw_mfree_sta_priv_lock(struct sta_priv *pstapriv)
 {
 #ifdef CONFIG_88EU_AP_MODE
-- 
2.32.0

