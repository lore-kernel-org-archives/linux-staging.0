Received: from mail-lr2-f1.google.com (mail-lr2-f1.google.com [74.125.230.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEC74071CD
	for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 13:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739127; cv=none; b=OC3GezAM7ybnWrztjq9kXOKmjPbui3qZ6DVDlJjKe82dJyRmswnmfiixjY3M6iX57ynA4oYolLZqAzgXRki2J3vPBlLULw7A30tHh+0jSw69mp/ehwtgbTzfIpVZGRF38m/8WEJ+49K7YXUuAkL2ndLvrEn9J7yQ2ysyEqcY3lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739127; c=relaxed/simple;
	bh=M7AauoXEVwuC3Lukp3fA2/xLMeC6I1sQqkrm5YpiQCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BGdxIEAndr/T/1De+rFrtMe3d4Gk/uT31SClB7QPoumdhEM8wdpwbFUHh7Sx2ezSHDwjvyZsjVveGfoIBWuIx+/QBCfRAgoauw6OGjz/ys+cQ/9/7QTFso/gV8n2d0oEJZXalfpAVtpJmI64DS5MJFsO2KT1kok1NmYi8WRldCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bTs3hVj6; arc=none smtp.client-ip=74.125.230.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bTs3hVj6"
Received: by mail-lr2-f1.google.com with SMTP id 38308e7fff4ca-39ad25b0973so5206171fa.1
        for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 06:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782739124; x=1783343924; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PGBbXGXf2xdB7l7IbM42KgLZD4bcK+S8nJ9GBzQ3KDo=;
        b=bTs3hVj6bFmMlk7QdnM3zMAxdxr30vlUqbOIqKpiiv43vTdIhE8eH0qeMT+L2P5cZa
         gzoUrHrWxJXsT6a6WQxe3ehI80x2mhzI6x5u/Ip3BaO6u6nDPnxmM8dh6lU86loDtyZq
         wQl49j2U+cI7Ql/XT9prPZKxc2Ejrwd1rjGV1crXnSolUg84IFOWTPZ6mIoyFJRZ+fdu
         5uvO0saJRtxdFQs/MPqJL4vPWNqmnO8bmoV/N3HbfU76T13/dnc8k1BtOJ3LivjrT1jR
         3DAR6cl7E5g0H5Rd0Qa3ldC6bS8gjID557JYXWsqAjMuvOF9KnSiuP6TSWkUzix+IjDX
         ybWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782739124; x=1783343924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGBbXGXf2xdB7l7IbM42KgLZD4bcK+S8nJ9GBzQ3KDo=;
        b=YzxXaNhGGSZiqAF+Ki7dXmsH1hunC+cC1G3iAbZyhi4kPiWiXYZoiMTgwmuZ4oESWV
         pJiSbvBn4fYJJlLYLzvBzdvE89++/JfvFheO9sgjRL9sqmh8SIZlStW+HVijvLPkSIpg
         AgcgloyCjaLYOBJ4puWME/X0wprd0SDPeVp/W4nf7yeMsmAJ4eW63qs0ujljzCIumrvI
         uwKE5m6r982bXi3QAXaJrxUcUUDguPh7/WB0pmsQnEEtJpxXx7/AF6ftKh/iGV2lPXG4
         HkeO58vA7gDnE+hJv5EB9xqj9J/f4F2RRr1+tRKijg/LcspyH1D3c7pPvO85aCgTLXri
         Cx6w==
X-Gm-Message-State: AOJu0YwVnrsK0b0mFEFef6c8ftlo/UsfaaV+S1JEffZO6RGeyX7+dq7/
	FkqO2qiCHCrohMDg8YIJ3zhoGr3/qFA8iaWg8nOmJsxZOrRQfDBfxhnycI9BpyZ9qgKGlw==
X-Gm-Gg: AfdE7cm8fvWLkK6v55F/XoBMyzGKGmwoZXY69K2yYkifAF0cf0HTlDdarehWdW+gk/7
	+bjdNRn/gAS8R0IRFV7+W9dcLOi64aBx5sRV07uN4HepVPvFGhsZdaulxaHexQP0CUYdM4Y0BsW
	GQ20vRmAnbVXCrYoYCMLeKYNWCBoSCR5ERM8dMa5xI/7qaIOngAdATnth3EkdYBki8jecF4y4WS
	bZIsO6AyqxCgpxNBDiavziiM4uon47oyTKbr35QGlKUhUAB/aeZ1y66RV9H7Bb1vqIgLyEjnnAe
	DjazfMFvZOqL15WuiF7MfsnE/MjIk3CqcAmv6NBRUwufnj3NGoNwUQrRTlWzijCr/INe/+MT3NV
	e1R67BQKzkbCebvtJHyC30PXHJ8E8sLp2Hayfia52KAVY8n6YyXGb7SQdtyG/aMw07YviYE9PUS
	l1m9t80Q==
X-Received: by 2002:a05:6512:a344:b0:5ae:a500:e368 with SMTP id 2adb3069b0e04-5aea500e6acmr2416528e87.3.1782739123704;
        Mon, 29 Jun 2026 06:18:43 -0700 (PDT)
Received: from myhost.localdomain ([89.253.23.109])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad69580f96sm5828232e87.62.2026.06.29.06.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:18:43 -0700 (PDT)
From: Ruziev Miraly <miraly.dev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev
Subject: [PATCH] staging: rtl8723bs: clean up style in core files
Date: Mon, 29 Jun 2026 18:18:31 +0500
Message-ID: <20260629131831.106937-1-miraly.dev@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary braces from a single statement block in rtw_wlan_util.c.
Additionally, remove an redundant NULL check before kfree() in rtw_xmit.c,
as kfree() is completely safe to be called with a NULL pointer.

Signed-off-by: Ruziev Miraly <miraly.dev@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 3 +--
 drivers/staging/rtl8723bs/core/rtw_xmit.c      | 5 +----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 1d37c2d5b..cc05decd4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -256,9 +256,8 @@ inline void rtw_set_oper_ch(struct adapter *adapter, u8 ch)
 {
 	struct dvobj_priv *dvobj = adapter_to_dvobj(adapter);
 
-	if (dvobj->oper_channel != ch) {
+	if (dvobj->oper_channel != ch)
 		dvobj->on_oper_ch_time = jiffies;
-	}
 
 	dvobj->oper_channel = ch;
 }
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 444966c0d..3dd08bad3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1768,10 +1768,7 @@ s32 rtw_free_xmitframe(struct xmit_priv *pxmitpriv, struct xmit_frame *pxmitfram
 		pxmitframe->pkt = NULL;
 	}
 
-	if (pxmitframe->alloc_addr) {
-		kfree(pxmitframe->alloc_addr);
-		goto check_pkt_complete;
-	}
+	kfree(pxmitframe->alloc_addr);
 
 	if (pxmitframe->ext_tag == 0)
 		queue = &pxmitpriv->free_xmit_queue;
-- 
2.54.0

