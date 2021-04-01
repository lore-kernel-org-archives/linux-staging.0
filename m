Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7055F
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:22:39 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id u9so1839226ejj.7
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ijhL0ZsC+HjMH8jmoBDVbg5fT9sGzujqSvq84Y9LBBI=;
        b=dyl8Ob/U5haYMYgTFKBiF53CjK05Pfuo9b+BXQ4TWGyAF5HL2TyHeLdmxQ2cyyt6ax
         ZhSYkTZnFqaavAIolap7xzBBpqirfz+r04G6AGn8JsKsX600eWMz6du0BI/c4z4J66Ay
         r9IUAqtpomtZ+LRlQuZUKcIiyB2fZql4TnFHmxY4Xfj3+4JW8fz0ZUJIbXoh6rLkoXZ+
         lcOJBds+UbufzW9CnS9mnwbdgYBx8KJ7ip3XRy7ZdMf1mkZl+cJzopM9oVudkQQ7e/jg
         +jKJg/cjpthLausVjlREgu1AdImYg+yprqjH3QnGOaacCGriTUkPJIBUGMkdf1ZvR1LC
         u3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ijhL0ZsC+HjMH8jmoBDVbg5fT9sGzujqSvq84Y9LBBI=;
        b=JiVbg9RQzMmz5+BojHNp6A0Sz3RVja58AwxgrteaO4U6ddzKFqlXcynhWuI5QUq9I1
         7T5UJVH9ThNM47+h9Jc2KhBAnCxm67+p0Oh5E5dxbgEpKB7aX6Le5x7CA3npevhcHqBB
         TX3xXI8EbR8zHHkUAPjLXkfOoK+sUsl8y0oZZNBc//o6hfRk/MS26ISq9fMFRtBrDL1r
         yvChEi3I01VtPy+9SSZ8Nl2VNQqIRXTvn+jfXfPAkI5EgGPKiQwtDzS/r1jow1/8q78D
         BMwQ2Ioc43fEEFjpBdBBsgiaqvNpVCIf5T+iqEUwRk+wqSwNS9aE0ZyCgmJ93FuBN2Jy
         f7KQ==
X-Gm-Message-State: AOAM531GrdPcUPJV8N/kKDxwrZo+usSeEW8EoLxWgLdwt3xAIOwvw0KD
	rUXBb2GS4raAK4mbcPTzm3g=
X-Google-Smtp-Source: ABdhPJz720PFdZ/NBqwKB+rZQVebuG299JiphBXeuZpCysHELn1R0DFOEkA36pI9wZdKxRhYB9aEgw==
X-Received: by 2002:a17:906:1985:: with SMTP id g5mr8005338ejd.285.1617268958080;
        Thu, 01 Apr 2021 02:22:38 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id z17sm2582754eju.27.2021.04.01.02.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:22:37 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 46/49] staging: rtl8723bs: remove RT_TRACE logs in os_dep/xmit_linux.c
Date: Thu,  1 Apr 2021 11:21:16 +0200
Message-Id: <178753695fab9d51c45fc17022b77ddfc525044c.1617268327.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617268327.git.fabioaiuto83@gmail.com>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove RT_TRACE logs

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 216b2f62eefd..1dc0787a80da 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -196,10 +196,7 @@ int _rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	s32 res = 0;
 
-	RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_, ("+xmit_enry\n"));
-
 	if (rtw_if_up(padapter) == false) {
-		RT_TRACE(_module_xmit_osdep_c_, _drv_err_, ("rtw_xmit_entry: rtw_if_up fail\n"));
 		#ifdef DBG_TX_DROP_FRAME
 		DBG_871X("DBG_TX_DROP_FRAME %s if_up fail\n", __func__);
 		#endif
@@ -232,13 +229,11 @@ int _rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
 		goto drop_packet;
 	}
 
-	RT_TRACE(_module_xmit_osdep_c_, _drv_info_, ("rtw_xmit_entry: tx_pkts =%d\n", (u32)pxmitpriv->tx_pkts));
 	goto exit;
 
 drop_packet:
 	pxmitpriv->tx_drop++;
 	dev_kfree_skb_any(pkt);
-	RT_TRACE(_module_xmit_osdep_c_, _drv_notice_, ("rtw_xmit_entry: drop, tx_drop =%d\n", (u32)pxmitpriv->tx_drop));
 
 exit:
 	return 0;
-- 
2.20.1

