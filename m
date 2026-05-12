Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D533C76BD
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 16:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778601652; cv=none; b=IduU5p6CZkFI5JyC4xcm1JVoShhMSYWuuCcPf3aHYJwZAh6zKelUc0R8HmlkdSoLJ1GnGpVl3f0McKM/XnAET+tDXXdspq1sqkm4y37rbpiI8UTRalPQHw2wrXhxAWtntilNmZhX0vYp+gAjQ1LizBrXE1kGRGu188Eng5VfVD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778601652; c=relaxed/simple;
	bh=Id45XUOa6S2dbfNW2jLkWU05ffPEwFtY274qsN6pa0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dBj5cZPMyfjBblP0ppsgxemQtf+Pv87nHzaJKzNjpMVSmG1hFcIaK3OW+tCQ0qWA2QSchhfH5ukUBayNf1r08w91CgLv9hMSgyS70/kmKcIMo3MNdEHoYGH67GyYqDrInDDWDXVMAshxHYg+g6fy5UH+JgKTjHOTogPl0cKjk9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZIdt0MA; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZIdt0MA"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7c0de780bf1so29206937b3.2
        for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 09:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778601650; x=1779206450; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnVEUtUhGiK4kfbEp0rV+Xz0ZGIBClwaC2NA9dsm3uU=;
        b=ZZIdt0MAcDp1WCwpXy6W8i1mNC5Knst2DlibYQ6MLH2Of+x/Ufj1I3ooH44+WzaRFJ
         zhjMMOBE+YKyG7dxCig6kHpfYvsBzWhUlpOw4tF1kcDVp5sOvz/4zQ6Gze9jdU6jXUjo
         Izx16gpCQBUDZJkke24Q2ASc+31uKjC5l+CSRcfML5bphUhWupqkZUHYTAx9gMKhRnCY
         dCLqri9YGZfp9A6LsOyyMfleUggb2jrLUl71QMNWy80ovIALNmsUB5qT2sONNqMGM0TB
         YZ8oMmxXbd9NrZhH7ek+vCqysqVPiQr38XEueN70VZtpAl+l75lmr3ZXTUjsASL0hUn3
         RAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778601650; x=1779206450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mnVEUtUhGiK4kfbEp0rV+Xz0ZGIBClwaC2NA9dsm3uU=;
        b=Ix5Q9kjeTHUbC32/mgdBS+CYgbOhL/47/iLBXkGU6u1h1e1IyeYP73amu/zFv8haUh
         VddlCuZ2XYVO4RXAljcz6wWDmiF0g74ov/we2Gq7dJFrdCUi+Wd4pinAptV8kPMxG1qo
         j4RqB7Vk8W+LjzZ+ILg+inOfh84y9Hsv5WLRaHMIggY2CGakVsUkSpOeTxijw+uI2EJT
         klB7nv0ODbgcPA59BpnRrsshf7cltZt54Gb0+sULCKJI8NhmrGTSrcK5BqMVOXrwMS6E
         D2cY4ruUOyfb7HuJGW5lcg6fI8Xn7IlR0ca1YErP4zxjCSUkYnlHA5QsuYjcmtZaoURx
         XHaA==
X-Forwarded-Encrypted: i=1; AFNElJ8tcNUM78BP0sXWoZ9RoeSmo7uBR4YuQJ4ZhqKGDKWFK6Hm0eSPBRh3HO28rE9DByGNk4Hk7DXRkodBbyYp@lists.linux.dev
X-Gm-Message-State: AOJu0YySQ7VjBEPlQiyl9g6rorSgaLWYzBlq337w9vGVmcOpAGDNl6Lr
	hH+Oq+xR5Ox5pRnmwvL0DzEWIt0b8EE6lYSxGNRs6R2Ta4OOFazTTycv
X-Gm-Gg: Acq92OGBwRHJGr9lO8tqhjRIIutcNzfNnSJ24FIPE1q/1YhomWuTrhqEQf9vlUjbgJW
	ZO+N85/T2sD6wo2nl0HMk8NELQkUM4FCMql6M5loJTvGCM6Ei2o5w6o1Hp7C5Y146U61KrP5d4Q
	jCp7PPe8CxcskFm5SdauW++fTL5KZfoqs3G9h5FuszBfEVvouxF0PO4CqUwomLS/7LeeYBr4izA
	CN8E6mG+elQn6d1wRghP92tDC4qXEj/Npe/1c/bSUkox7QRPPyZ2eamYnaQP5Z+CYXT9dyjeBL0
	c6x5csPa5nMfiAln/w6+SEUgCXE4QB0265BRb0Njsl+ArymRW/B+srUB7ykrSeOecwOES/0lw19
	PQxiOhRSH2PsyjR8ZeBMS3NNVwJin4u2/DKjU8WX+ua7Aq0DDLS/I+R3AqKL9xHxY+Op1P6xg+S
	42KGpUl0iuIRtGbCVbY/mNru579MQGYD+RFUYknDs2t9Yw1VJ9w9f14hG7tcy0BojTff/NYOdtl
	p8tpKA7aUUjbgyo2e2oYfakqw5yWGhenw93MdzM31V+fVyxHVT7MWbF1HPUndGGemDYjfnpV/aH
	c+rV
X-Received: by 2002:a05:690c:498e:b0:7bf:27e:66ae with SMTP id 00721157ae682-7c56306d88bmr32069707b3.30.1778601649435;
        Tue, 12 May 2026 09:00:49 -0700 (PDT)
Received: from noahzen.tailef97f4.ts.net (host-119-66.flgaliv.gainesville.fl.us.clients.pavlovmedia.net. [153.33.119.66])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6654cc7csm171300107b3.13.2026.05.12.09.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 09:00:49 -0700 (PDT)
From: Noah Techoueyres <noahtechoueyres@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: dan.carpenter@linaro.org,
	nikolayof23@gmail.com,
	linux-kernel@vger.kernel.org,
	Noah Techoueyres <noahtechoueyres@gmail.com>
Subject: [PATCH v3 2/2] staging: rtl8723bs: resolve 100-column limit with intermediate pointer
Date: Tue, 12 May 2026 11:57:12 -0400
Message-ID: <20260512155712.6998-2-noahtechoueyres@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260512155712.6998-1-noahtechoueyres@gmail.com>
References: <20260512155712.6998-1-noahtechoueyres@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 26 ++++++++++++------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 067b54c6111e..abf2a9d01706 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1105,25 +1105,25 @@ u8 rtw_dynamic_chk_wk_cmd(struct adapter *padapter)
 static void collect_traffic_statistics(struct adapter *padapter)
 {
 	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(padapter);
+	struct rtw_traffic_statistics *stat = &pdvobjpriv->traffic_stat;
 
 	/*  Tx */
-	pdvobjpriv->traffic_stat.tx_bytes = padapter->xmitpriv.tx_bytes;
-	pdvobjpriv->traffic_stat.tx_pkts = padapter->xmitpriv.tx_pkts;
-	pdvobjpriv->traffic_stat.tx_drop = padapter->xmitpriv.tx_drop;
+	stat->tx_bytes = padapter->xmitpriv.tx_bytes;
+	stat->tx_pkts = padapter->xmitpriv.tx_pkts;
+	stat->tx_drop = padapter->xmitpriv.tx_drop;
 
 	/*  Rx */
-	pdvobjpriv->traffic_stat.rx_bytes = padapter->recvpriv.rx_bytes;
-	pdvobjpriv->traffic_stat.rx_pkts = padapter->recvpriv.rx_pkts;
-	pdvobjpriv->traffic_stat.rx_drop = padapter->recvpriv.rx_drop;
+	stat->rx_bytes = padapter->recvpriv.rx_bytes;
+	stat->rx_pkts = padapter->recvpriv.rx_pkts;
+	stat->rx_drop = padapter->recvpriv.rx_drop;
 
 	/*  Calculate throughput in last interval */
-	pdvobjpriv->traffic_stat.cur_tx_bytes = pdvobjpriv->traffic_stat.tx_bytes - pdvobjpriv->traffic_stat.last_tx_bytes;
-	pdvobjpriv->traffic_stat.cur_rx_bytes = pdvobjpriv->traffic_stat.rx_bytes - pdvobjpriv->traffic_stat.last_rx_bytes;
-	pdvobjpriv->traffic_stat.last_tx_bytes = pdvobjpriv->traffic_stat.tx_bytes;
-	pdvobjpriv->traffic_stat.last_rx_bytes = pdvobjpriv->traffic_stat.rx_bytes;
-
-	pdvobjpriv->traffic_stat.cur_tx_tp = (u32)(pdvobjpriv->traffic_stat.cur_tx_bytes * 8 / 2 / 1024 / 1024);
-	pdvobjpriv->traffic_stat.cur_rx_tp = (u32)(pdvobjpriv->traffic_stat.cur_rx_bytes * 8 / 2 / 1024 / 1024);
+	stat->cur_tx_bytes = stat->tx_bytes - stat->last_tx_bytes;
+	stat->cur_rx_bytes = stat->rx_bytes - stat->last_rx_bytes;
+	stat->last_tx_bytes = stat->tx_bytes;
+	stat->last_rx_bytes = stat->rx_bytes;
+	stat->cur_tx_tp = (u32)(stat->cur_tx_bytes * 8 / 2 / 1024 / 1024);
+	stat->cur_rx_tp = (u32)(stat->cur_rx_bytes * 8 / 2 / 1024 / 1024);
 }
 
 bool traffic_status_watchdog(struct adapter *padapter, bool from_timer)
-- 
2.53.0

