Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54A63FC9
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 20:06:06 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id q26so10370527wrc.7
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F/iH+36SldsQBoDkg2Y4zZm5zAqT3XUaCffb3gcQJM8=;
        b=dF4GuDagkP7l0tztCZkm7IPpcUcbRWySAr/D8OpsxVo+YIHJwc2NEV6i1Wi5kT20QJ
         42aqPiwJWdNahxpc7VHFJN5161BxLqnCtTPMC0Z4AN76A4ItYjEWkLCWpEdEs2r3UC8a
         5mJVX95iC5IP9jVA7O7/7MEt98zqxQ5cxvfZ2ZY6uxdvW/vc+ygeuQlrMQdvr8yv+o0N
         MCk29azpPJJPbTXHw9LazBxWMg1Yo64zAGocIfxFCRTG2tChwVYNk7W+OJbRpaCXJTsZ
         NbloOw++ZvNkwbLOz2HZm61sw7aS/QsaMansLioQVIjJpQGamFfKM6FHLrdu+/LWkriS
         5/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F/iH+36SldsQBoDkg2Y4zZm5zAqT3XUaCffb3gcQJM8=;
        b=KNJzLn56QzbPl2DqF3kBhwdPPPZQASuxEX7OKzIcBi+0cSQhQX5V0P4wi0ssSFzlAx
         mIWYYMn5SCbGmv3xd3Rkap0YXSNne35nHP4NQu7B2S6xj5iShksbzRmA7nWi/0YfQyLB
         aJozw6DLaJD94XSeZwgeODsIE7gQKXsrBmqk+3BNNeUhQmkZQCQiIjw+hj/IzCl1lLgB
         kez56qPj368GkmuXeU6199tPz9xE1MmL/DDAC+H7HqiCPEGhYOUm9OryFN7HlMAyTyrR
         zLxDA0wXFgcs1E8jJrb6yXhEDEECVUNtQLUhrzg9Fjxm9R7lh1C2jumvahSyfnDE2uav
         GZ1Q==
X-Gm-Message-State: AOAM532Ib9Lqpc84ph2xhhLNWNZJxf/lZPpvBk2aDH1GoUCtdSJy3kap
	4sPQRoigiTtVxeO3zr4zFX0=
X-Google-Smtp-Source: ABdhPJwN4t7uhD3jXF3PhhZs1jrwCC80z0rQWgnIHnRz+zVrKqbj+1StIEGxNhBWRH6L/3IqoB89Mg==
X-Received: by 2002:a7b:c104:: with SMTP id w4mr860839wmi.160.1632341165104;
        Wed, 22 Sep 2021 13:06:05 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id e2sm3219761wra.40.2021.09.22.13.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:06:04 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 46/47] staging: r8188eu: remove rtw_calculate_wlan_pkt_size_by_attribue()
Date: Wed, 22 Sep 2021 22:04:19 +0200
Message-Id: <20210922200420.9693-47-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922200420.9693-1-straube.linux@gmail.com>
References: <20210922200420.9693-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_calculate_wlan_pkt_size_by_attribue() is not used,
remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_xmit.c    | 18 ------------------
 drivers/staging/r8188eu/include/rtw_xmit.h |  2 --
 2 files changed, 20 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index f9ae48f73cdf..6213244450e7 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -861,24 +861,6 @@ s32 rtw_txframes_sta_ac_pending(struct adapter *padapter, struct pkt_attrib *pat
 	return 0;
 }
 
-/*
- * Calculate wlan 802.11 packet MAX size from pkt_attrib
- * This function doesn't consider fragment case
- */
-u32 rtw_calculate_wlan_pkt_size_by_attribue(struct pkt_attrib *pattrib)
-{
-	u32	len = 0;
-
-	len = pattrib->hdrlen + pattrib->iv_len; /*  WLAN Header and IV */
-	len += SNAP_SIZE + sizeof(u16); /*  LLC */
-	len += pattrib->pktlen;
-	if (pattrib->encrypt == _TKIP_)
-		len += 8; /*  MIC */
-	len += ((pattrib->bswenc) ? pattrib->icv_len : 0); /*  ICV */
-
-	return len;
-}
-
 /*
 
 This sub-routine will perform all the following:
diff --git a/drivers/staging/r8188eu/include/rtw_xmit.h b/drivers/staging/r8188eu/include/rtw_xmit.h
index 1244545070c7..01e8b90becf5 100644
--- a/drivers/staging/r8188eu/include/rtw_xmit.h
+++ b/drivers/staging/r8188eu/include/rtw_xmit.h
@@ -333,8 +333,6 @@ struct xmit_frame *rtw_dequeue_xframe(struct xmit_priv *pxmitpriv,
 
 s32 rtw_xmit_classifier(struct adapter *padapter,
 			struct xmit_frame *pxmitframe);
-u32 rtw_calculate_wlan_pkt_size_by_attribue(struct pkt_attrib *pattrib);
-#define rtw_wlan_pkt_size(f) rtw_calculate_wlan_pkt_size_by_attribue(&f->attrib)
 s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt,
 			   struct xmit_frame *pxmitframe);
 s32 _rtw_init_hw_txqueue(struct hw_txqueue *phw_txqueue, u8 ac_tag);
-- 
2.33.0

