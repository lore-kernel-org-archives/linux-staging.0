Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6069270
	for <linux-staging@lists.linux.dev>; Fri, 25 Jun 2021 00:08:04 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id c23so17338525qkc.10
        for <linux-staging@lists.linux.dev>; Thu, 24 Jun 2021 17:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QAVtI3TmZGBz4TKF2WQd6Vlw5og75zQZSwwtht0RsNc=;
        b=G4E4sPQKCnOGakzcjvfMDLH/7uGZouuekAwIRAKy+U9aG2ahebnISUF9VAviIoBGzO
         p4Wdcx8dqxM8vpBvftmWfAjUrxS5zBTH3bRnb3fCWTv26qpWH7oEjvKsoPT7ZtqyRynh
         eUmAufoKo3agTZ+si+XVvbebTyhZX/fO66kl29Ccvmq71z4bKxD7zuwWPo08GZtg7wSO
         +WB85MZfnpafhieLIt8Neyf2jWloBfkwhLgqLYsYYpKEBcyWCSj0x/CJSJIvMTtJuIZe
         ePZE8tnlCS5dhzIw8fzQYkjiSGy/3zlYzJASXxaH/beWPHhGuHZsKo3B0Pw3kQhMNeZD
         +TLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QAVtI3TmZGBz4TKF2WQd6Vlw5og75zQZSwwtht0RsNc=;
        b=D31Y/8nkME+eFLbOQ7icKqk2SJFavo3NfdVZpDpx3cXOJOFYAQGtyvsv67xCIXYHcQ
         +7NKzg+yaQ7JMJHEHkKeeQ7ZVlfhQea4Ecw9SUOkrN8brIjL8QMG+oVgX+JOuw5IxuNX
         hUFpgGzm7XSI0LkAizaITfNRUhhqeTb4XN64wf02X00vlQdpiRkrZeFdwe3giYcA0pLp
         aVQOivxmtmklagg0mMRnIl7PCLbBEiuac4fXsDn9/fLq4fgg4dfm7nbEaghnHy7V+y9k
         E8lbIauyMrxZwC+Xg9TTmmtnkC/fEiohJubjFtlVuF+MxB2LolFEKDmz4uLajOEb3T2E
         qwhw==
X-Gm-Message-State: AOAM532ZbLnCnJxBne1zadgHNDzwTYkg8m3LDUepGMTfYW1xC32khNOy
	Oyqp323YGDHAjNJnMh9yGx3LNw==
X-Google-Smtp-Source: ABdhPJzjlEc9ss4MQB4Giv/5BPEZDiOMSNaerqC4FG29gG2NZK08HYLptoUVnQQNeIekkEuPW4vhiQ==
X-Received: by 2002:a37:6002:: with SMTP id u2mr8810566qkb.1.1624579683599;
        Thu, 24 Jun 2021 17:08:03 -0700 (PDT)
Received: from kerneldevvm.. (5.6.a.8.a.a.b.f.c.9.4.c.a.9.a.a.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:aa9a:c49c:fbaa:8a65])
        by smtp.gmail.com with ESMTPSA id m187sm3629014qkd.131.2021.06.24.17.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 17:08:03 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 02/23] staging: rtl8188eu: remove all RT_TRACE calls from os_dep/xmit_linux.c
Date: Fri, 25 Jun 2021 01:07:35 +0100
Message-Id: <20210625000756.6313-3-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625000756.6313-1-phil@philpotter.co.uk>
References: <20210625000756.6313-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all RT_TRACE calls from os_dep/xmit_linux.c as this macro is
unnecessary, and these calls are dubious in terms of necessity.
Removing all calls will ultimately allow the removal of the macro
itself.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/os_dep/xmit_linux.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/xmit_linux.c b/drivers/staging/rtl8188eu/os_dep/xmit_linux.c
index c73f94651e93..1b5776ae8eba 100644
--- a/drivers/staging/rtl8188eu/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8188eu/os_dep/xmit_linux.c
@@ -159,13 +159,8 @@ int rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	s32 res = 0;
 
-	RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_, ("+xmit_enry\n"));
-
-	if (!rtw_if_up(padapter)) {
-		RT_TRACE(_module_xmit_osdep_c_, _drv_err_,
-			 ("%s: rtw_if_up fail\n", __func__));
+	if (!rtw_if_up(padapter))
 		goto drop_packet;
-	}
 
 	rtw_check_xmit_resource(padapter, pkt);
 
@@ -184,16 +179,11 @@ int rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
 		goto drop_packet;
 
 	pxmitpriv->tx_pkts++;
-	RT_TRACE(_module_xmit_osdep_c_, _drv_info_,
-		 ("%s: tx_pkts=%d\n", __func__, (u32)pxmitpriv->tx_pkts));
 	goto exit;
 
 drop_packet:
 	pxmitpriv->tx_drop++;
 	dev_kfree_skb_any(pkt);
-	RT_TRACE(_module_xmit_osdep_c_, _drv_notice_,
-		 ("%s: drop, tx_drop=%d\n", __func__, (u32)pxmitpriv->tx_drop));
-
 exit:
 	return NETDEV_TX_OK;
 }
-- 
2.31.1

