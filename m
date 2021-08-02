Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E6B2FB8
	for <linux-staging@lists.linux.dev>; Mon,  2 Aug 2021 19:27:39 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id q6so25344733oiw.7
        for <linux-staging@lists.linux.dev>; Mon, 02 Aug 2021 12:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QDVapNDbIFTOhd1dRUtCk+ZGWeywoaH6X/4Xc4mtgzk=;
        b=b7px10MbaKdwmQCaEHLBhpRD4ZWVd6Vh+mwNjq4aeWPuMkuuzhlQf5cZ4RPJLrIMjx
         mdK8snn9/M6l3sXQ891FtkVmAeAsk/mHSZ1nCejGxf7h9253l1Cj7TcOMYUHIZpa5owT
         b0BOn12IUvrshWfSX76A+g2bRNhOcGdjHQgm7uTtB8wAgTvcnnGRauNkfK4gZyTCUo/J
         g7CTWa8ulFLS4MQ38/JXhpK7wlCpmogxMXhABGW6mt1FgbGv2jt8Xx7PVgGYVPaw24SI
         yUHAYMYs//8VBjZGOXKv3Ph2Wmt9ISXRxcsXbL+TgHLlsYR7dWZQgbSSE04S7UpoWgnL
         A1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=QDVapNDbIFTOhd1dRUtCk+ZGWeywoaH6X/4Xc4mtgzk=;
        b=pNBE863+lUWnUEwtFZnP9HmeLdKpO/k/y0c5CDsaRpFQ77+e6KQoN+ZLqFfiYzG20M
         790kdNmUp0+OjUxsUltH3pLnPSw4TIx99RDa1Un7AybrpbyKfMkRGHt+rjVw6AQoR4OB
         i7jFt33VzcjjXkK8llTPNjqg+hhZ7nC+OKUgukproo3Mc8x0P2+cLpVKUVMU6UtYsn/e
         Nf58Spln0YV8w+KFcRNqzDoPbnKxrzbVvjD7U7yh1ouJTAeIXg06DhiQUIz5HdL16t0/
         v5ah69amz5u0q2zNmiWl2393/RoEVloKH25xqyvB5VHzc1UFRhQ4HU3ZoOfVMD7BWqfh
         YCMw==
X-Gm-Message-State: AOAM530S7+v+k+jrhXv8+kN6R9AEXQh33Noanp1XgSBZBJX04yPpXYMt
	CVJgzTi5IQTD0O1lHMyP8gE=
X-Google-Smtp-Source: ABdhPJxYQCR0xlT+r/Pro4CpThmarXmAAX0PzS9ocZdkkQepGr6D0yMKLnW+4CrskLuMq8qcwZb1mA==
X-Received: by 2002:a05:6808:1523:: with SMTP id u35mr11936947oiw.132.1627932458441;
        Mon, 02 Aug 2021 12:27:38 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com.com (2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com. [2603:8090:2005:39b3::100a])
        by smtp.gmail.com with ESMTPSA id i188sm1981035oih.7.2021.08.02.12.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 12:27:37 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
To: gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>
Subject: [PATCH v2 6/6] staging: r8188eu: Remove more empty routines
Date: Mon,  2 Aug 2021 14:27:21 -0500
Message-Id: <20210802192721.23110-7-Larry.Finger@lwfinger.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802192721.23110-1-Larry.Finger@lwfinger.net>
References: <20210802192721.23110-1-Larry.Finger@lwfinger.net>
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
v2 - no change
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

