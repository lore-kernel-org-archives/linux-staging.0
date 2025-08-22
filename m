Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B182FFDE1
	for <linux-staging@lists.linux.dev>; Fri, 22 Aug 2025 13:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755870915; cv=none; b=bvcXt0PQ+jemNfz6OX6FWzGfYSxYP0mjO8aH1tvvdEgM8i+Fna4G3xkor9Zz84BstBUPjHG7dtNuQ3rbsDnR2TttVc32wKIXyYQbvIKnVJ/2UPZC8D/isATxBql8vWt5IE7hNsWFhylqaUiB5OkHN1MJp/vOuuF57lcrYi7cER0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755870915; c=relaxed/simple;
	bh=qEMTQ7BwzQKKJKm/in7cpQ+FIJlvxR9+nq5zPPYuprY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SXKdIGP/WsnfNHIOEShLWohR9JHVych/2zIjJ2/+3KRlabSXnERngRNFVMKtWgsspY2qP2fbflFul571Gr8FSctwdVnYiUP1isot6iVUShOvCwPu3jVjipVF3K0OUa0gJTgM+jdYw4yw1RzLtvrm3YrzH3jIUBtGFgkZ/HMWxfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R4NkyBbF; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R4NkyBbF"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb78c66dcso311953366b.1
        for <linux-staging@lists.linux.dev>; Fri, 22 Aug 2025 06:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755870912; x=1756475712; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AM2JMmm71pxr/epSkhEc3LPiDJ1HkmLM8QNr1GJ9Iyw=;
        b=R4NkyBbFI0hN3BgUTE1lThUZ1FPY+qkjbxNgVZXH+mxj0EYrA3F9jlgyZpRBF5MzYZ
         jceyKbZPsj61SumP0gKB+sdngDaeCSdE+Bd20JVlIeAteCGkclb/Q46D0MOdNueFHYFv
         LHlqb1HL+fDCOH8quwztQewPfYGmiOMY+zgXi8vSHtAOgPZdk4cgI2NVXsTge0HpEd9I
         6TG5p5Ye5lz+099e6HKxr7KOje5k3QE4H2a+PDfQmhEfeW/47yKAl7sDGBJTiixAHQx+
         hRoeAun5zs0CipwDo2SyW1yHvTTuY8amu4sRP6m1rsjyzyx4NMz4tNWpKlt+l3d+ug0g
         X5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755870912; x=1756475712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AM2JMmm71pxr/epSkhEc3LPiDJ1HkmLM8QNr1GJ9Iyw=;
        b=AtAMYXM/U7BEyTh+9+MCNdbAASb6AfN4uL1RHdXKtu16MJmbrUNzPuWLtxrh3J7I6d
         9+waXf6pzLFKHUTxOQ5d7Ou0vH02l2aRnFEMw1YS5DfkX10/afGHptzpQHZZ71D7ue/3
         n/Jmw+GS+BeYEGFpeiu6W3g9I2DKxrbsLYH7zX+AAjsK7hr2sAB2UNjx707oZ2BdyETM
         hJ2PKz3VoknnUDvU35jKjBLbiYEPFiG1NLmCr3fmsD1Ibt/qBulIFB4tD3QFwrxFh9jO
         cmdoSuzVM418Vgc6NslYrYQVXZAM+jXybBgswSzXctPJ2cPQ+AuYdExw9fxMRf1M2Pi5
         t/Og==
X-Forwarded-Encrypted: i=1; AJvYcCUH9PM1/+OyV3qPnjX2Ue7CAuW9mMcQh3fBUXUALxqKM7+kChi3rkAPn3a8LMi134BWMn5xbNwW5ifw+iu4@lists.linux.dev
X-Gm-Message-State: AOJu0YzDxQYcYwikyV3+kf3+ZU72rHJ7z8neCiV/2evCNQDIVYE1Tkon
	5iU6uXv0Z1TrGOdP8dplX56Tki0kCwJuDKD0dYn84NM6qw75tr+kU3O6
X-Gm-Gg: ASbGncs7ljBZkhNUy167Qf2CDRRgPpYk8B3j6HTYMUf3I/b4UTi3gJEJe9eZTy5JIUR
	pXKpjwT/ELBga3J3lNsHaKBSeK/t5DOKUpzaNYFNg9XjK/ARXkZ/78/USpDsXsAaqUklsA0iAQ+
	OkEePIf16Jt9X3qoDaKXB1ch7foDX+8vS+2hLCJLk1cAUm+qKoV3WegGpc/Ds4HGnYJg4SRREA7
	0jaIue8ykd04dpbJLipiG2zZP+VBQVcVSSnXT7swh3aVyURwi1y4qKct+xx+FPZecIdt8e5LP2V
	YoIvFhFrmdjn9jV79bVkdtCSO30Uv371xfNtuFGcucEvYJQY4tzugvQzcQU7YlfSmaRXIH6MWhh
	lGRN8MTqCvmmA3CJ3APmtXRs3QQ==
X-Google-Smtp-Source: AGHT+IHgnI/TofS0DsDhvzg0AC50pj1wISl9vOYQKx4U9jJWqrdOxleAfjNAOx3JDMFkMBkO7ACRFQ==
X-Received: by 2002:a17:907:7ea4:b0:ae3:74be:49ab with SMTP id a640c23a62f3a-afe28ec6bd9mr295580066b.10.1755870911644;
        Fri, 22 Aug 2025 06:55:11 -0700 (PDT)
Received: from tumbleweed ([95.90.184.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded307138sm612353866b.45.2025.08.22.06.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:55:11 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 02/13] staging: rtl8723bs: move rtw_recv_indicatepkt to rtw_recv.c
Date: Fri, 22 Aug 2025 15:54:07 +0200
Message-ID: <20250822135418.118115-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250822135418.118115-1-straube.linux@gmail.com>
References: <20250822135418.118115-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the function rtw_recv_indicatepkt from os_dep/recv_linux.c to
core/rtw_recv.c to reduce code in the os_dep directory.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 37 +++++++++++++++++++
 .../staging/rtl8723bs/include/recv_osdep.h    |  1 -
 drivers/staging/rtl8723bs/os_dep/recv_linux.c | 37 -------------------
 3 files changed, 37 insertions(+), 38 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 8ae527b6e0d6..bc34cac8dabe 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1725,6 +1725,43 @@ static void recv_indicatepkts_pkt_loss_cnt(struct debug_priv *pdbgpriv, u64 prev
 
 }
 
+static int rtw_recv_indicatepkt(struct adapter *padapter, union recv_frame *precv_frame)
+{
+	struct recv_priv *precvpriv;
+	struct __queue	*pfree_recv_queue;
+	struct sk_buff *skb;
+	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
+
+	precvpriv = &(padapter->recvpriv);
+	pfree_recv_queue = &(precvpriv->free_recv_queue);
+
+	skb = precv_frame->u.hdr.pkt;
+	if (!skb)
+		goto _recv_indicatepkt_drop;
+
+	skb->data = precv_frame->u.hdr.rx_data;
+
+	skb_set_tail_pointer(skb, precv_frame->u.hdr.len);
+
+	skb->len = precv_frame->u.hdr.len;
+
+	rtw_os_recv_indicate_pkt(padapter, skb, pattrib);
+
+	/* pointers to NULL before rtw_free_recvframe() */
+	precv_frame->u.hdr.pkt = NULL;
+
+	rtw_free_recvframe(precv_frame, pfree_recv_queue);
+
+	return _SUCCESS;
+
+_recv_indicatepkt_drop:
+
+	/* enqueue back to free_recv_queue */
+	rtw_free_recvframe(precv_frame, pfree_recv_queue);
+
+	return _FAIL;
+}
+
 static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reorder_ctrl *preorder_ctrl, int bforced)
 {
 	struct list_head	*phead, *plist;
diff --git a/drivers/staging/rtl8723bs/include/recv_osdep.h b/drivers/staging/rtl8723bs/include/recv_osdep.h
index ea0b58aa0ba0..f31c87b21206 100644
--- a/drivers/staging/rtl8723bs/include/recv_osdep.h
+++ b/drivers/staging/rtl8723bs/include/recv_osdep.h
@@ -13,7 +13,6 @@ extern void _rtw_free_recv_priv(struct recv_priv *precvpriv);
 
 
 extern s32  rtw_recv_entry(union recv_frame *precv_frame);
-extern int rtw_recv_indicatepkt(struct adapter *adapter, union recv_frame *precv_frame);
 extern void rtw_recv_returnpacket(struct net_device *cnxt, struct sk_buff *preturnedpkt);
 
 extern void rtw_handle_tkip_mic_err(struct adapter *padapter, u8 bgroup);
diff --git a/drivers/staging/rtl8723bs/os_dep/recv_linux.c b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
index a507a29686bd..ae396ccfd830 100644
--- a/drivers/staging/rtl8723bs/os_dep/recv_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
@@ -179,40 +179,3 @@ void rtw_handle_tkip_mic_err(struct adapter *padapter, u8 bgroup)
 	memset(&wrqu, 0x00, sizeof(wrqu));
 	wrqu.data.length = sizeof(ev);
 }
-
-int rtw_recv_indicatepkt(struct adapter *padapter, union recv_frame *precv_frame)
-{
-	struct recv_priv *precvpriv;
-	struct __queue	*pfree_recv_queue;
-	struct sk_buff *skb;
-	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
-
-	precvpriv = &(padapter->recvpriv);
-	pfree_recv_queue = &(precvpriv->free_recv_queue);
-
-	skb = precv_frame->u.hdr.pkt;
-	if (!skb)
-		goto _recv_indicatepkt_drop;
-
-	skb->data = precv_frame->u.hdr.rx_data;
-
-	skb_set_tail_pointer(skb, precv_frame->u.hdr.len);
-
-	skb->len = precv_frame->u.hdr.len;
-
-	rtw_os_recv_indicate_pkt(padapter, skb, pattrib);
-
-	/* pointers to NULL before rtw_free_recvframe() */
-	precv_frame->u.hdr.pkt = NULL;
-
-	rtw_free_recvframe(precv_frame, pfree_recv_queue);
-
-	return _SUCCESS;
-
-_recv_indicatepkt_drop:
-
-	/* enqueue back to free_recv_queue */
-	rtw_free_recvframe(precv_frame, pfree_recv_queue);
-
-	return _FAIL;
-}
-- 
2.51.0

