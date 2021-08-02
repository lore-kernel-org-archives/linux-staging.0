Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B4F72
	for <linux-staging@lists.linux.dev>; Mon,  2 Aug 2021 15:16:06 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id h63-20020a9d14450000b02904ce97efee36so7115746oth.7
        for <linux-staging@lists.linux.dev>; Mon, 02 Aug 2021 08:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L80kxPSCz+iPLuADD+IF4KRlVaopc/FeUDt8owBw1dk=;
        b=Oy2abKPhiydhwt7e1IBCyi9g5ehrpK9774K5C/4XtafZz/y/QnYb1KlkOdJkxFXSC6
         9CzvyDeajdmFEUcZSwJ7sV8HvE9TkaV3/uR6talp7hnGdY820XaHoOQ2UTIhhm210OhU
         hl0JsteJINzprcggkUEsSv7Awgi7ATX2qCpr9GpyVQurL35mZYCAEzEvVM0rrM7t4EVZ
         PaqeWD4Nn/b9TTfKLAT5ROtQBibldjwDn9YJYC9QHCmOVXa5yDlaRXLhURX3OGOs2BsO
         BM0KiEZG5m7azyCNWP0R0/4EbvTNxtbIxNghzRjDlVBRIbbyJQB8sTAP9aahCmkqbZGn
         ZDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=L80kxPSCz+iPLuADD+IF4KRlVaopc/FeUDt8owBw1dk=;
        b=eR/fTrASz3ssxFJB3FfL7AYqmoLGLxXbNxuke5m7HFnSbVakkjKeJ/m3ukHfTMde9F
         xAX+aIv3nn7yx6vKT7KKBANp8kOgmswdYwV7cc+y1ntuiKQvtkbuBz8NQTsK+/jDHO1b
         +sJMguLP99xLdNR4iodbd9rioucEzqSa+ZB1BDtNKAhyhJ7uto39fRaoXwXaNno9ly+Q
         n9SPxR426CG5FIZ49hyVWwpv5G0T7lLZYE4raB8snDZIWsdpUCvnzOEAPFhNqOv7VljG
         pQYOPe6WeMwgwl1bbFgdC6MNS5RT2BqJwHIVpQHGbu9Y+cb6oHtkktNnXDJGNMqQhNdZ
         Y+JA==
X-Gm-Message-State: AOAM531LuA20MV1OmG4j1WCuyIcmWgNroCK1BHdrqy2H1NZg4t7MF10W
	pPV19nMD/PXuG5uwcZjDfEtkP9Oz5gI=
X-Google-Smtp-Source: ABdhPJyXcXmWCXRKrPZSprzEYe6D4/rHlsZ/deF6yKzKon9vSNqSO/adCVYhAuG+zSiEzXWuIzqYEA==
X-Received: by 2002:a05:6830:33c9:: with SMTP id q9mr6748281ott.170.1627917365325;
        Mon, 02 Aug 2021 08:16:05 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com.com (2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com. [2603:8090:2005:39b3::100a])
        by smtp.gmail.com with ESMTPSA id w16sm1807034oiv.15.2021.08.02.08.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 08:16:04 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
To: gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>
Subject: [PATCH 6/6] staging: r8188eu: Remove more empty routines
Date: Mon,  2 Aug 2021 10:15:46 -0500
Message-Id: <20210802151546.31797-7-Larry.Finger@lwfinger.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802151546.31797-1-Larry.Finger@lwfinger.net>
References: <20210802151546.31797-1-Larry.Finger@lwfinger.net>
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
index a4cb08d41b8c..7f12b494b949 100644
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
index 29df34fd74f1..f60cd4420ea4 100644
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
 /*  this function is used to free the memory of lock || sema for all stainfos */
 void rtw_mfree_all_stainfo(struct sta_priv *pstapriv);
 void rtw_mfree_all_stainfo(struct sta_priv *pstapriv)
-- 
2.32.0

