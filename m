Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2553270
	for <linux-staging@lists.linux.dev>; Tue,  3 Aug 2021 13:52:44 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id q6so28184914oiw.7
        for <linux-staging@lists.linux.dev>; Tue, 03 Aug 2021 06:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L80kxPSCz+iPLuADD+IF4KRlVaopc/FeUDt8owBw1dk=;
        b=b4jd37sK3QSJXYVpUbd5CiHH9nv8Ieg4a4ICWZs/Pog1vFZTYW1yGEN9MdAUAwKRDG
         8Fhct11jQftXBNtNRtt7nYXjHQjQsJC9GTxzEGCMYJNoVbWNu1izyurfHopwxzohTk3P
         HN17UjcvT035hCfkOplOYQ7OzKBftZcr8L7reCkTbxkng/FLAPCOd+QcpRRK2GCeh3mS
         G2ZY4nc2EStxUd/UmSh5ng/jNJQHjg9CSUhdQyxEG5yVyvjqnFn212m9cGT40fvez408
         q8tmZ7k7k2fvybXcmT3C46LWLOeb6mzNWKGBb/rBugo951TE2Nm6GKXnbjjNUgIcM+yl
         wQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=L80kxPSCz+iPLuADD+IF4KRlVaopc/FeUDt8owBw1dk=;
        b=GPLxCiP4aH45qqE6BrW06pP+fk3usq43Q5esRlWCZIRDXD1HujAgHf5KPbfAuK/sAy
         TMKWzz+iQIMvvEix7CRcK0izDADesaxgL0n67m55mAVdCvUk27UHHp8Z81u/ui2BhFEJ
         Jq5csi5yXJAqgZmhlhUNl7cLz5aFMDA+4Crp75AAyo8t68sSMR0cvscyeoUmq1c7STz0
         EOkASNHwv7b4BmSlGEeKwyIKRNLv1cJLp7xTS6feRFrylwDcvTcbE9GzS07Yfl6F5YJ0
         4ux2y7+6XguRVnqhDz6F8D6+w2jQWQhwuGJQWQtttdZCfRCRIjQHyiCVRgKMU9nlxx6N
         +5Gw==
X-Gm-Message-State: AOAM531E74fRyNrFshdKasPwnttZ64s6bHgpDKeg2dBucjUDSbzNydzT
	27D0A/syWuvhd7BddFDzr44=
X-Google-Smtp-Source: ABdhPJwBITUo7V3Gyk5Mtg+qLrb5CLOiANC2wyJilp5z27FM8mQaN0jhErEwqDm+I4KusMQXhY9tGA==
X-Received: by 2002:aca:90b:: with SMTP id 11mr14432911oij.152.1627998763511;
        Tue, 03 Aug 2021 06:52:43 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-1010.res6.spectrum.com.com (2603-8090-2005-39b3-0000-0000-0000-1010.res6.spectrum.com. [2603:8090:2005:39b3::1010])
        by smtp.gmail.com with ESMTPSA id y26sm2504106otq.23.2021.08.03.06.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 06:52:43 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
To: gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>
Subject: [PATCH 06/10] staging: r8188eu: Remove more empty routines
Date: Tue,  3 Aug 2021 08:52:19 -0500
Message-Id: <20210803135223.12543-7-Larry.Finger@lwfinger.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210803135223.12543-1-Larry.Finger@lwfinger.net>
References: <20210803135223.12543-1-Larry.Finger@lwfinger.net>
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

