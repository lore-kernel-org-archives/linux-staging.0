Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3822E5F
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:22:36 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id j3so1134820edp.11
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UBiqXm6cwJ7LWWqnMz3cZaa8qrYLYBPI/KRdxCadpa4=;
        b=QHlklOPvTuHZmcv2dl4QgZKmKsckjPlbd4XvViIh4sCYoodKS4yqhv6rZvm/Wd33iv
         X/Lc32VSGMSpn/Uf/IBHGoJDA8PSyh+/VxTVLwVSbYBv1YhGHCNPRLzFEO9olLegcf+H
         xuz/72Ogx9HnB5pnSsmzPsUsxO0mNpHhks1VAWb+9OR6NSqIMDPp2pM210/9sz1Ci/Ee
         6+9YNLwqQb9t+GLG2UOUjy5gzAd3rMkA/V+sED1koSn1NLGC8v/JrmxYVLRnH9kHrxR3
         4mkICfS49iebpB3/1irDw3Rxgnwkjk2HGCrt2Kd36BKXOOusR/kXfiWaQpi1RujjfHRE
         rozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UBiqXm6cwJ7LWWqnMz3cZaa8qrYLYBPI/KRdxCadpa4=;
        b=ou07+a/BUimMcp4wY+pe/44Tdkb/w/mG3z+LectbI/5T651RnC2YL266G79ndRNhAN
         pTMIxmMYaQeJzq7WFV04wd4Pc2h+Jnw7gVj8ezGmnp+Bo28B8UkTNWAxfEhae8HWuTLP
         ZIkUhgX+CTNiKYtcg6AQPqpPAtFMYrhwCKtxZek/qfC9EzbEEubRNHkgPjw3YzTjB3Ci
         lU7XYQV6V/OPnSIDmHIHUd2T2xAn/BYNJHejXzWRBTp595Vn2MNodMI8SVMwa7pxHT07
         54AR+1VMamlyrdW9wQnxv57wl3LQWEWOq9upIKszjlLvK9Q69zqZ3MqQUQHTQuJAo50Z
         Uavg==
X-Gm-Message-State: AOAM533aWKxcwzU0mcQHjqhPgYC8zSF++ShbjTaXDoQBts3DnwbEArJF
	yLS6RYbwT0EiNqdesq/ZaJA=
X-Google-Smtp-Source: ABdhPJyXfHEcxqO7VCbik/mZSwglEiKiyxg6nDyl2BGoG23CgHXXtll50pP0vjGhOD3v5S6vgeO1Yg==
X-Received: by 2002:a50:bb47:: with SMTP id y65mr8883592ede.305.1617268954785;
        Thu, 01 Apr 2021 02:22:34 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id gz20sm2517539ejc.25.2021.04.01.02.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:22:34 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 44/49] staging: rtl8723bs: remove RT_TRACE logs in os_dep/recv_linux.c
Date: Thu,  1 Apr 2021 11:21:14 +0200
Message-Id: <5038103639bc55ffb6bd8d0b8acbebe55d273ef7.1617268327.git.fabioaiuto83@gmail.com>
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
 drivers/staging/rtl8723bs/os_dep/recv_linux.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/recv_linux.c b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
index fbdbcd04d44a..a2a28803c8d9 100644
--- a/drivers/staging/rtl8723bs/os_dep/recv_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
@@ -202,22 +202,15 @@ int rtw_recv_indicatepkt(struct adapter *padapter, union recv_frame *precv_frame
 
 	skb = precv_frame->u.hdr.pkt;
 	if (skb == NULL) {
-		RT_TRACE(_module_recv_osdep_c_, _drv_err_, ("rtw_recv_indicatepkt():skb == NULL something wrong!!!!\n"));
 		goto _recv_indicatepkt_drop;
 	}
 
-	RT_TRACE(_module_recv_osdep_c_, _drv_info_, ("rtw_recv_indicatepkt():skb != NULL !!!\n"));
-	RT_TRACE(_module_recv_osdep_c_, _drv_info_, ("rtw_recv_indicatepkt():precv_frame->u.hdr.rx_head =%p  precv_frame->hdr.rx_data =%p\n", precv_frame->u.hdr.rx_head, precv_frame->u.hdr.rx_data));
-	RT_TRACE(_module_recv_osdep_c_, _drv_info_, ("precv_frame->hdr.rx_tail =%p precv_frame->u.hdr.rx_end =%p precv_frame->hdr.len =%d\n", precv_frame->u.hdr.rx_tail, precv_frame->u.hdr.rx_end, precv_frame->u.hdr.len));
-
 	skb->data = precv_frame->u.hdr.rx_data;
 
 	skb_set_tail_pointer(skb, precv_frame->u.hdr.len);
 
 	skb->len = precv_frame->u.hdr.len;
 
-	RT_TRACE(_module_recv_osdep_c_, _drv_info_, ("\n skb->head =%p skb->data =%p skb->tail =%p skb->end =%p skb->len =%d\n", skb->head, skb->data, skb_tail_pointer(skb), skb_end_pointer(skb), skb->len));
-
 	rtw_os_recv_indicate_pkt(padapter, skb, pattrib);
 
 	/* pointers to NULL before rtw_free_recvframe() */
@@ -225,8 +218,6 @@ int rtw_recv_indicatepkt(struct adapter *padapter, union recv_frame *precv_frame
 
 	rtw_free_recvframe(precv_frame, pfree_recv_queue);
 
-	RT_TRACE(_module_recv_osdep_c_, _drv_info_, ("\n rtw_recv_indicatepkt :after rtw_os_recv_indicate_pkt!!!!\n"));
-
 	return _SUCCESS;
 
 _recv_indicatepkt_drop:
-- 
2.20.1

