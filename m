Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38058350D41
	for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 18:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768156633; cv=none; b=f/b/F7VIAInCMBIlnRp7oy7NEKGu11gF9/+DqFEXRgJit7FShJq4ddvSZHZr3y9vW/80/LB9RfBB7l8ozbCbDY6iPdLm5KgAeN3DJLU+y7NSD/2XQ7it733lzfsYpX6hy/MBEEMrimpwyrIZSWiya3qG9ilhqVWas6y3xbifCKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768156633; c=relaxed/simple;
	bh=1w8rbuilqcZz4xJsF1OtzNeoricMeFQjDbNpafii61o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XDI/etStxuL77KC5t2+J8qLUpKb0aFK9crTv6Oi14tCuR5eeC85/XnYlV2zzi8JFHH4uLhpu7xC4cIEeP9zdpyZGAIssflz+6IFJq86qfb+2rUdA5bTduLxutjislnFC+GATDIHVRXmeh2vBSwp6Rnjwsz/djvfHqOiNph48meA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dRhZ1gaY; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dRhZ1gaY"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2a110548cdeso40411595ad.0
        for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 10:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768156631; x=1768761431; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQ0f+RLTwflfmfQxVO5jGTci6f7c5EC6D5hyMz+jnOg=;
        b=dRhZ1gaY5S6wJIeur1ftxMzWoyjGREd2IHsOqhbQgfgQi+CtmL5jvnoNtTMNF/Fk3d
         hUVg5g1CD961OtetliBbWgRNKoDKwPwveofDTk/SL7lGSGjztkwkZwdY9s0gboSBCHQ7
         VuQ3q+Uk6y8hUOOV+WOQrRtWyEhYiBB0xQgWxIxAv15waLHddofS3TepUID8wiOzFv9G
         +554u2dqvYzAH1bhXwnBM+jXEAjFLJx0HBAUrAMxmzAuey2QmLvUrJXF1NxKwUSZdPag
         Z+HcvA9nbNaw2JLvn3lV/cCWarvK0AG0ZHOYNIXxEwbSmiFrz0P4nMgAuuDl4DPTJOgv
         vt+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768156631; x=1768761431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hQ0f+RLTwflfmfQxVO5jGTci6f7c5EC6D5hyMz+jnOg=;
        b=PRxcVSBxsjMTTZxDLOweQhc3z2MnYTtjvmzumHfDJaU7PSVy6kKXiT38zQOVcddb12
         2YUUbofTTXO9GJiRhOnZR0VKgQWxH8/CYq7IWt7UDtjl12GjHKH0za4v/6JYb131OAW8
         Do6UipuGCqghCyAjjrbTM3uNTZY+JrVLgJh4bD0AhUHSDsXOCFMXIFHGltWLkEJV9mYR
         qCDWhRp37YvQxsBBMjEzkl92nEHEP3DsLWM0P0b4ifkVV9aULBTDnHf1ztZ4yQxUUDYR
         OC5ncXjBPy3grh089u40pgLcRQ9cVmV5kUUGUPzVReZvnsAcIeYayiMh6XeXJsdDClx1
         bjUw==
X-Forwarded-Encrypted: i=1; AJvYcCWA+aA+gtQp9SWXaIgoChMegPTyUGSWjfy3HGNGeGDNECCd+jGJfdwWKHKYg6RICbDifzjV8qzwjKcBEZbp@lists.linux.dev
X-Gm-Message-State: AOJu0Yzqo4L7hJMIz3caIhkUktXb7aqUFBmcwaYbjv9FMJ2fLy8+dDOs
	AbymW++l4lO/QRNtGc7AiEnOT4ZeBHsuHV5BxQtX1IeoRr1w+E8GRsI3
X-Gm-Gg: AY/fxX7sxWLUDJVW1xy+MwQeenE+0L+NmLhljYAZlNdNZ8oFTeKNEPI05j1qFxmDBvN
	eLqoM8eKRH6C5s9if05Wh9Vl+LGaRozblyyGZinkMp6cZN+QqaAfd+xea0ut1I4AQOvjg/2fA3z
	ZqXZryps2llDXh0snJZZakOjtUePIqTYn483LkMmCbBCdPO0vx5H4kOEGQPjI7m5+6zm5LnpEeK
	+1CU+Uiq89IZuc9vMnnFaj0GlM4R6XSRCRD2EKOQrfxlNQtAAbJ6G01yrbI7hklNIWYRtL9Jvwf
	PLZv4bf4KjRfwv5Hl7UO8xK3DBUnAnE7TU3z9VpD5UoC6PtN5AfF3iaNrV6cJIb807u9rUy0TmI
	3cnU8UvXySyiqnaZr6/q9HuWNRBe0OOz0fCe4euJGnmTa1XjuCtON2ir7b/qTXHTl1RSD+6L3ap
	JmURUtLdsLFXBIz5A0gM2pmYF/
X-Google-Smtp-Source: AGHT+IG/MXJ3d2Wm9exETKgL5vgeolbnIBkSjXEDW/nhmfwrAYj0wcoR2DW6fzBnna5Vk76CGaVJfA==
X-Received: by 2002:a17:903:178b:b0:295:fc0:5a32 with SMTP id d9443c01a7336-2a3ee438532mr146354355ad.3.1768156631499;
        Sun, 11 Jan 2026 10:37:11 -0800 (PST)
Received: from snowman.bbrouter ([43.241.121.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd2953sm152220415ad.86.2026.01.11.10.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 10:37:11 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH 5/9] staging: rtl8723bs: split chained assignments
Date: Mon, 12 Jan 2026 00:06:26 +0530
Message-ID: <20260111183630.12816-6-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260111183630.12816-1-khushalchitturi@gmail.com>
References: <20260111183630.12816-1-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split chained assignments in rtw_xmit.c into separate statements
to improve readability and comply with the kernel coding style.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 3767302362d2..fd25289111e3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -137,7 +137,8 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		pxmitbuf->phead = pxmitbuf->pbuf;
 		pxmitbuf->pend = pxmitbuf->pbuf + MAX_XMITBUF_SZ;
 		pxmitbuf->len = 0;
-		pxmitbuf->pdata = pxmitbuf->ptail = pxmitbuf->phead;
+		pxmitbuf->pdata = pxmitbuf->phead;
+		pxmitbuf->ptail = pxmitbuf->phead;
 
 		pxmitbuf->flags = XMIT_VO_QUEUE;
 
@@ -217,7 +218,8 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		pxmitbuf->phead = pxmitbuf->pbuf;
 		pxmitbuf->pend = pxmitbuf->pbuf + MAX_XMIT_EXTBUF_SZ;
 		pxmitbuf->len = 0;
-		pxmitbuf->pdata = pxmitbuf->ptail = pxmitbuf->phead;
+		pxmitbuf->pdata = pxmitbuf->phead;
+		pxmitbuf->ptail = pxmitbuf->phead;
 
 		list_add_tail(&pxmitbuf->list,
 			      &pxmitpriv->free_xmit_extbuf_queue.queue);
@@ -247,7 +249,8 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 			pxmitbuf->phead = pxmitbuf->pbuf;
 			pxmitbuf->pend = pxmitbuf->pbuf + MAX_CMDBUF_SZ;
 			pxmitbuf->len = 0;
-			pxmitbuf->pdata = pxmitbuf->ptail = pxmitbuf->phead;
+			pxmitbuf->pdata = pxmitbuf->phead;
+			pxmitbuf->ptail = pxmitbuf->phead;
 			pxmitbuf->alloc_sz = MAX_CMDBUF_SZ + XMITBUF_ALIGN_SZ;
 		}
 	}
@@ -1155,11 +1158,13 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 	u8 MME[_MME_IE_LENGTH_];
 	u32 ori_len;
 
-	mem_start = pframe = (u8 *)(pxmitframe->buf_addr) + TXDESC_OFFSET;
+	mem_start = (u8 *)(pxmitframe->buf_addr) + TXDESC_OFFSET;
+	pframe = (u8 *)(pxmitframe->buf_addr) + TXDESC_OFFSET;
 	pwlanhdr = (struct ieee80211_hdr *)pframe;
 
 	ori_len = BIP_AAD_SIZE + pattrib->pktlen;
-	tmp_buf = BIP_AAD = rtw_zmalloc(ori_len);
+	tmp_buf = rtw_zmalloc(ori_len);
+	BIP_AAD = rtw_zmalloc(ori_len);
 	subtype = GetFrameSubType(pframe); /* bit(7)~bit(2) */
 
 	if (!BIP_AAD)
@@ -1405,7 +1410,8 @@ static struct xmit_buf *__rtw_alloc_cmd_xmitbuf(struct xmit_priv *pxmitpriv,
 		pxmitbuf->priv_data = NULL;
 
 		pxmitbuf->len = 0;
-		pxmitbuf->pdata = pxmitbuf->ptail = pxmitbuf->phead;
+		pxmitbuf->pdata = pxmitbuf->phead;
+		pxmitbuf->ptail = pxmitbuf->phead;
 		pxmitbuf->agg_num = 0;
 		pxmitbuf->pg_num = 0;
 
-- 
2.52.0

