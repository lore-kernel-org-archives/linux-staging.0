Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC44530AABC
	for <linux-staging@lists.linux.dev>; Fri, 22 Aug 2025 13:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755870923; cv=none; b=Miim3REYywUf5qnLu1SP7GNL4pAt/NFj5KIcE6sRlEiFQMDIRvcQMoK8VbEVbh55bQETHU6T43pCGH5E9j3hNa9/qzPSWdktbRHvSPzof6hH8u7LdxO5PR1nJeAnZxkuBxw1DhEfxdVsDyuBVTtcNiiu2WrxTt0/Y/T7lq2F7XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755870923; c=relaxed/simple;
	bh=bAWWYr7G0wEavsSSEbN4ZfueckmKJWlFmmKXRgGMffA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WfB6oj7gOzmtEjoKIUYyvWoGTsxFuLUpbnjK6+P1iRLPXYQ+RiFbN5sWRXztUD+6vBvOlVwBAh8vZfep8T7WPHJhw4nxKNiCEavqI//58bqZero8TIixjayUE2nxFPFILj2Na5IPPDHA087NAq6xnHoW6otSJMYZ65y03Xid2FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pqiqfvg/; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pqiqfvg/"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb7a0550cso351443766b.2
        for <linux-staging@lists.linux.dev>; Fri, 22 Aug 2025 06:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755870919; x=1756475719; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MriLCdOSPXFFmX+bYG2sehrfu/eciyiJysfVnIX8JBY=;
        b=Pqiqfvg/nAhNQLzPKPB5Xm47SBvgFv+P06qvp/yKv66fpITrGivqVTop79Qf177v5o
         Xgo9WIAGAwQMAdc9X4kypj18n53ptSUuR6Ii4b8YZ3QYRcjyORV3WWOf95l6p9G/uQTP
         N8brqYZabLA1T/3gbFXc0rNM/GTCbPT1KxC7iizM+g3xh9IAFXG8ARwIYTw8KesAWjzZ
         K2OBrslBvgljakO8f6SiW9Fe7QAslKFx1oCyoev2NthHJYpdFj3wR/0as0Wk53Uli0Hi
         7WlJRqjaoKOK167wgENOvvBBI8dmhexp0qvsdZqheyzHjoPT4RlLwCS+FWJOjVo6s4KR
         /ARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755870919; x=1756475719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MriLCdOSPXFFmX+bYG2sehrfu/eciyiJysfVnIX8JBY=;
        b=dzLxwEL7iJ6ko0E/BDRaWGwJ95CumvVAi6v/AaY9XVj5nRBZoDK49tcaeptGl8Hq9+
         EhpB53+q1e9J5EQZbGw8GN0PtK9EVbfnamZMOEmNRytO/6whkTRZMLMsyjYazdevuTge
         4cTKwUSw/o0+aANQkoA0TfjOBz/v+JcrWhKvCieAbs+nKTeT7O8EfGmAZnMqWJHVpmTI
         KiqJVAORznmS9iRldumo7+AYhzQiXwUyEE4ozHceAc1sxOJJrLWV3V1nXU+s2WsyfJpI
         EXn2oXG7hjAJPRQU17Bq9dcTXink246bGyOD5x+t+fBDdNn3Y0HBhASEpTHWUCQz6aLm
         hU+w==
X-Forwarded-Encrypted: i=1; AJvYcCX5ulDn9Mpzu6qMWejueJDWxPHHsKOoN60fwUhXmi9GwT6J/L0GtuwNSrJKi9uZdszrXUNOhMegoik2Zxc1@lists.linux.dev
X-Gm-Message-State: AOJu0YxgZMzyIOhSCxkpbn4IG3XcDjOQjOg8v8wOkz/jaUK1T7bRIROV
	0+e0B7r/6gYSyUmN2u7XaVHgR6g+dSFLr3CxJpgdfahTayVeFDPAJ4JB
X-Gm-Gg: ASbGncvR5zF4O6Z0af8uqGC+7YRwowOW6SDerdONQ+xtDtOhaaMBYLV6DFxTTH/PV7t
	OihWHEgGZOx9xksHEA4UX05O69TBOTu+nDiJNlUvMN637x9yGNDl+5whRyy9P0TxgidX2YUhG/+
	JrjOtv9g0ephtP6sRkQEY3JWFiRMFPBrVdqX4kx5wOiJhMTBXX1u2/rexNP/Z6ToBdCauVN8kM+
	ZFV4rHg7YtcL2vevKBmhE40TpVpvVJZx2zwtSNPKuO994k1fHd3WJyK0rBJehMzPg70Jb7nG6ao
	mBinejmYp6FefiUNlnEvZI2XdQD7tfIhvLPfxK7pmoqJoNlnmWgA2ocQAtgq/jjQa01tZq8aqcc
	9JOdToAZsRkO27bYO3mp3+29klQ==
X-Google-Smtp-Source: AGHT+IHIpHoFlT4DekRBl5w9SoEW/KPa+BrtCmGRAFzA38cXn3uIrIP9U3qCMOfb7i/PwhdId5s+yw==
X-Received: by 2002:a17:907:3f07:b0:ae3:f2a0:459f with SMTP id a640c23a62f3a-afe295a456amr305665066b.54.1755870918977;
        Fri, 22 Aug 2025 06:55:18 -0700 (PDT)
Received: from tumbleweed ([95.90.184.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded307138sm612353866b.45.2025.08.22.06.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:55:18 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 13/13] staging: rtl8723bs: remove include/recv_osdep.h
Date: Fri, 22 Aug 2025 15:54:18 +0200
Message-ID: <20250822135418.118115-14-straube.linux@gmail.com>
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

Move still needed function prototypes defined in the recv_osdep.h header
to rtw_recv.h and remove the now obsolete recv_osdep.h.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/include/drv_types.h |  1 -
 .../staging/rtl8723bs/include/recv_osdep.h    | 21 -------------------
 drivers/staging/rtl8723bs/include/rtw_recv.h  |  4 ++++
 3 files changed, 4 insertions(+), 22 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/include/recv_osdep.h

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index f1c16ddacc83..dd9018aa4ee5 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -33,7 +33,6 @@
 #include <xmit_osdep.h>
 #include <rtw_recv.h>
 
-#include <recv_osdep.h>
 #include <rtw_efuse.h>
 #include <hal_intf.h>
 #include <hal_com.h>
diff --git a/drivers/staging/rtl8723bs/include/recv_osdep.h b/drivers/staging/rtl8723bs/include/recv_osdep.h
deleted file mode 100644
index 20ce25132700..000000000000
--- a/drivers/staging/rtl8723bs/include/recv_osdep.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/******************************************************************************
- *
- * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
- *
- ******************************************************************************/
-#ifndef __RECV_OSDEP_H_
-#define __RECV_OSDEP_H_
-
-
-extern signed int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter);
-extern void _rtw_free_recv_priv(struct recv_priv *precvpriv);
-
-
-extern s32  rtw_recv_entry(union recv_frame *precv_frame);
-extern void rtw_recv_returnpacket(struct net_device *cnxt, struct sk_buff *preturnedpkt);
-
-int	rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter);
-void rtw_free_recv_priv(struct recv_priv *precvpriv);
-
-#endif /*  */
diff --git a/drivers/staging/rtl8723bs/include/rtw_recv.h b/drivers/staging/rtl8723bs/include/rtw_recv.h
index aa9f9d5ecd01..8e45871f07f0 100644
--- a/drivers/staging/rtl8723bs/include/rtw_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtw_recv.h
@@ -342,6 +342,10 @@ struct recv_buf *rtw_dequeue_recvbuf(struct __queue *queue);
 
 void rtw_reordering_ctrl_timeout_handler(struct timer_list *t);
 
+signed int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter);
+void _rtw_free_recv_priv(struct recv_priv *precvpriv);
+s32  rtw_recv_entry(union recv_frame *precv_frame);
+
 static inline u8 *get_rxmem(union recv_frame *precvframe)
 {
 	/* always return rx_head... */
-- 
2.51.0

