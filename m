Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F71B6D0E
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 00:16:09 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id r19so282937qvw.5
        for <linux-staging@lists.linux.dev>; Mon, 14 Jun 2021 17:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LDmOsYVaCzlk9qYppvZ+JP5Z48gdrmbK+dHMmlrX/Bo=;
        b=Q/mUaH+SEMTpbDavzaI68D7WdRy0KDfidEPATNMqNkRSsd/vOkRbBag/MizNQdDouJ
         SM7XVtFE0ROiOLl62pmi8Wc3UR/fXJ32pvj78xyHya5YEKuDvxeLZqdt1F0rbZ/Ubftw
         bmrKsK1Ai6ho4blVIMTqtk7FPUYX6HVgd1ba2873nzoHHiH53wMFQRjMiXZq2rxNZIRx
         eHH4eH7kyzGXBaQioqPeWhlxaG1wuztzQpGXG/gPlceYb3Yx3krUJu+oYlz0bQvgrOiq
         C/+GKIjOxsRA8y8EkSpM8mll8yKEVrCeVNb1Xzd30nrXAvnpIetAcIxalN90LN1wEcSu
         TiRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LDmOsYVaCzlk9qYppvZ+JP5Z48gdrmbK+dHMmlrX/Bo=;
        b=DxC/+XLQ4Izp7UC0qW726Ag0IKvqizFHqOC61VXrc0NHu8QOWtXpmYEjcS6ZdURwlz
         HrBsOagKsmT6w2B5ea0Bje9J43BZAWsCQ3FhkLlbmQzXStQDHOe00zTa/yO7FCdKS4tY
         zIz2k5tvspQCeulQHto6De+zuVIMwo2GRvPfyt+3DPaPqpbrg9ZrMjXRbtbkObs98dcF
         Iv5QrO+ecKeCoKTHjy8BQ5gv/xAMU+zKTaATRoc/fQjjpjkHhe2p1KxgHhft3MlkMhi9
         JcoV4spmrviyOrZLvGfGn/D0HDHcZRWOKsMrDVLL+d/BRS9jGVfC1DHh7oWsdcfLVj1V
         s/rw==
X-Gm-Message-State: AOAM530eocd16+trJzx3bs7CY/XF3xs+bDb0tMFZOU13IhvPWFLLhb1O
	JpKn9anwe1mONAlwngQaFP5ClpImsjzKH956
X-Google-Smtp-Source: ABdhPJyVS1d6pWlw7K3ltUTuHI7A4IE3bYFHqbQP16ufFau5xMsOmyMGSqUMsiSG18+/5ZjxM/WxzA==
X-Received: by 2002:a05:6214:f2f:: with SMTP id iw15mr259837qvb.33.1623716168739;
        Mon, 14 Jun 2021 17:16:08 -0700 (PDT)
Received: from localhost.localdomain (5.d.e.a.c.b.a.1.5.0.9.4.d.7.7.d.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:d77d:4905:1abc:aed5])
        by smtp.gmail.com with ESMTPSA id m199sm11244248qke.71.2021.06.14.17.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 17:16:08 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 15/28] staging: rtl8188eu: remove all DBG_88E calls from os_dep/xmit_linux.c
Date: Tue, 15 Jun 2021 01:14:54 +0100
Message-Id: <20210615001507.1171-16-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615001507.1171-1-phil@philpotter.co.uk>
References: <20210615001507.1171-1-phil@philpotter.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all DBG_88E calls from os_dep/xmit_linux.c as this macro is
unnecessary, and many of these calls are dubious in terms of necessity.
Removing all calls will ultimately allow the removal of the macro
itself.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/os_dep/xmit_linux.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/xmit_linux.c b/drivers/staging/rtl8188eu/os_dep/xmit_linux.c
index 6935bdb2d7d2..c73f94651e93 100644
--- a/drivers/staging/rtl8188eu/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8188eu/os_dep/xmit_linux.c
@@ -26,10 +26,8 @@ int rtw_os_xmit_resource_alloc(struct xmit_buf *pxmitbuf, u32 alloc_sz)
 
 	for (i = 0; i < 8; i++) {
 		pxmitbuf->pxmit_urb[i] = usb_alloc_urb(0, GFP_KERNEL);
-		if (!pxmitbuf->pxmit_urb[i]) {
-			DBG_88E("pxmitbuf->pxmit_urb[i]==NULL");
+		if (!pxmitbuf->pxmit_urb[i])
 			return _FAIL;
-		}
 	}
 	return _SUCCESS;
 }
@@ -132,16 +130,12 @@ static int rtw_mlcst2unicst(struct adapter *padapter, struct sk_buff *skb)
 			memcpy(newskb->data, psta->hwaddr, 6);
 			res = rtw_xmit(padapter, &newskb);
 			if (res < 0) {
-				DBG_88E("%s()-%d: rtw_xmit() return error!\n",
-					__func__, __LINE__);
 				pxmitpriv->tx_drop++;
 				dev_kfree_skb_any(newskb);
 			} else {
 				pxmitpriv->tx_pkts++;
 			}
 		} else {
-			DBG_88E("%s-%d: skb_copy() failed!\n",
-				__func__, __LINE__);
 			pxmitpriv->tx_drop++;
 
 			spin_unlock_bh(&pstapriv->asoc_list_lock);
-- 
2.30.2

