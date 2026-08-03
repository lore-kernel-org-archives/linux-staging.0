Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BAB436BE6
	for <linux-staging@lists.linux.dev>; Mon,  3 Aug 2026 18:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785780459; cv=none; b=eLGSdvor9lkAwHNhxXpuMMwKuItC7oBC5941Hg2wPS+KOlZDglc+HMNZ1ml72IcfKsLjGg1zGN32KwXFGViOGZ3y/I8WjUReqo6jO7A/QXu2w1AmpjhHzF2vNuIyv1UHcm8lCNS5/lCKLB9uKLwXG+/Dji0jgq/dAhSF1mk0pQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785780459; c=relaxed/simple;
	bh=ThD+P9qyB7OY60ZmZY9/ncBKucTYVoXFd7e/E8fiDI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gr8mkZT6fDsKce+NxPR2+kp4LcXDGKgQiQ6KEsedKwDpjHGi7cn89fpvgWqI4/ycKYIj16lBZbJFmkG9/MaMevYLPCbFYn/iTRtumjMTtnUeZ/0535/IhAptymil+4YZMGdGTns3GcbD6EDUrqD+3RewKKqbdFVxtSlcb5rLGZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fmaC0DLo; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fmaC0DLo"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so3251576a12.3
        for <linux-staging@lists.linux.dev>; Mon, 03 Aug 2026 11:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785780458; x=1786385258; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KTCn0Jr82Mg/B2iO/GPghHVILY1gFGfC6P6rv8l1E7w=;
        b=fmaC0DLoDupkwYvFwMqe1TNJep+1FrCj2uLOJXqH8dKHdXqoxGQ0kDWZIRoqVrATBX
         bjDnb7RVUE/m4+dGBge6mDyMhnrJqUqc1dcauSSqRv4YDGRL/VkTg7yf4alG/KJnnvnu
         hOaZhP2dRnvPhZxNaVCJmsNNLp23Y8miGrUYuq1J9mLqlbmYnc1lMK5wdWfjyXFP0cMq
         kOuTE8dmd+kFs2J6M76r7aBQpCcXZI270g02JKeEPv+MKzZTjSWWaffuRM3JwcfQHMKX
         8WF2oW4arymiPJlxZYrXThW1/BpJG9ZSpfPQvWTi+MEBGkdYauhfwKFxFbJ3bMfgYtPV
         14cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785780458; x=1786385258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KTCn0Jr82Mg/B2iO/GPghHVILY1gFGfC6P6rv8l1E7w=;
        b=V7teV/Q39xK2kZ/xrZIDV3O4PgMbuUptOiorspdU6Rl9bt6bj2F5DkkSRuvM5exDp0
         Xd+a9TTW751JgCTjTYWU8WDsYF6zQaBYEOCSHSFATZASmsMXdY4eGz08IDIuei0yG6/J
         os3gEqzxflJEuKPZf+ee5Cb0hXqjTcsILqp8RTCpenbK/5uyeRd5H+hfy8bVU2u8yf1D
         CYjpazpZYG1LW9a1XRTm2vuQU8e97ABzSe4YATfTbmWRIn20l4ehVKMKctpP8w+CoIbx
         64aoWLH85eMr8p3jy8qH9Y+magYvu+J1OXp2f7y15WqrfVMyCuVDbMC2mbjV2Ud5mjcx
         f+JA==
X-Gm-Message-State: AOJu0YysxOwaozsi4awaRQPQSOvZ6UHAeWTJjcHkZv8hoDA1Uci2E2D+
	hqQIl0I86XtztA0qvYjvsRiSz/laQnxOzym/Zqri+vu6YTg/KR9VH4Yk
X-Gm-Gg: AR+sD11aktKmWM4mrHWM1lVL+fVX1Vo5Yl4E+BzPErs/CuAjCo03gyh7TnKCeS0NQkP
	rag0FdXd7Heom1Zp3azAMldGBXk0/gAMFxEtwwVmaSpbLvUIVf7iEgm43gJFRONAeD3btKZlei9
	pBNYWUO1Q5nYg+gEIEQPhWtuSAPRKcGG8giM243MZPcGpp/ifn5OpdQfNA9SHyUiaRlh7ciHF6u
	sK6p8thQEP7nG7W1Jy9E2/+tpln16YBcbzQMOI+8VgSb6Quw55mNnvWI9hSocZbCxfIrbGVRbL9
	BCLS3gAebhR+NYHtR0kY45WOIp9SM/Uxcv/Xyc2qNnO1shZ9jiI3u3ajyf/sqlfy1CUd93IHqQj
	k/9PdCt7VAJciB19Lcf0HTsFXJa9parBgLXKujxYxFYx5DyOolxBjDRyUdbKPOAHaHRwnyefwFQ
	Ca0BPnr5928f9b9ixfApc3WZFO6F0/WnpwAQxn86AQhDNTj8K2VwKkoC7pZAOvTkoN4ldb0tCDa
	8nVI2Hux65C8wDPU+cG6ZEV
X-Received: by 2002:a05:6a20:4e92:b0:3c3:bb13:438 with SMTP id adf61e73a8af0-3c92a74cf9emr11526162637.32.1785780457502;
        Mon, 03 Aug 2026 11:07:37 -0700 (PDT)
Received: from Debian.tail44843d.ts.net ([183.82.161.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06f88fsm39086876eec.20.2026.08.03.11.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:07:37 -0700 (PDT)
From: Mirza Ishan Beg <seedandsyntax@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nikolayof23@gmail.com,
	seedandsyntax@gmail.com
Subject: [PATCH v3] staging: rtl8723bs: refactor traffic_stat access in collect_traffic_statistics
Date: Mon,  3 Aug 2026 23:33:29 +0530
Message-ID: <20260803180549.20859-1-seedandsyntax@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260803160055.18205-1-seedandsyntax@gmail.com>
References: <20260803160055.18205-1-seedandsyntax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace repetitive `pdvobjpriv->traffic_stat.` dereferencing with a local
pointer `ts` to improve readability and reduce line length. This resolves
multiple checkpatch line-length warnings without manual wrapping.

Suggested-by: Nikolay Kulikov <nikolayof23@gmail.com>
Signed-off-by: Mirza Ishan Beg <seedandsyntax@gmail.com>
Link: https://lore.kernel.org/linux-staging/agDaGJ5UKndFUNPY@archlinux/
---
Changes in v3:
  - Fix missing semicolon in pointer declaration

Changes in v2:
  - Added Link: tag with lore URL as suggested by Greg KH

 drivers/staging/rtl8723bs/core/rtw_cmd.c | 25 ++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index ce3dfa1fee26..4aa430284a59 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1109,25 +1109,26 @@ u8 rtw_dynamic_chk_wk_cmd(struct adapter *padapter)
 static void collect_traffic_statistics(struct adapter *padapter)
 {
 	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(padapter);
+	struct traffic_stat *ts = &pdvobjpriv->traffic_stat;
 
 	/*  Tx */
-	pdvobjpriv->traffic_stat.tx_bytes = padapter->xmitpriv.tx_bytes;
-	pdvobjpriv->traffic_stat.tx_pkts = padapter->xmitpriv.tx_pkts;
-	pdvobjpriv->traffic_stat.tx_drop = padapter->xmitpriv.tx_drop;
+	ts->tx_bytes = padapter->xmitpriv.tx_bytes;
+	ts->tx_pkts = padapter->xmitpriv.tx_pkts;
+	ts->tx_drop = padapter->xmitpriv.tx_drop;
 
 	/*  Rx */
-	pdvobjpriv->traffic_stat.rx_bytes = padapter->recvpriv.rx_bytes;
-	pdvobjpriv->traffic_stat.rx_pkts = padapter->recvpriv.rx_pkts;
-	pdvobjpriv->traffic_stat.rx_drop = padapter->recvpriv.rx_drop;
+	ts->rx_bytes = padapter->recvpriv.rx_bytes;
+	ts->rx_pkts = padapter->recvpriv.rx_pkts;
+	ts->rx_drop = padapter->recvpriv.rx_drop;
 
 	/*  Calculate throughput in last interval */
-	pdvobjpriv->traffic_stat.cur_tx_bytes = pdvobjpriv->traffic_stat.tx_bytes - pdvobjpriv->traffic_stat.last_tx_bytes;
-	pdvobjpriv->traffic_stat.cur_rx_bytes = pdvobjpriv->traffic_stat.rx_bytes - pdvobjpriv->traffic_stat.last_rx_bytes;
-	pdvobjpriv->traffic_stat.last_tx_bytes = pdvobjpriv->traffic_stat.tx_bytes;
-	pdvobjpriv->traffic_stat.last_rx_bytes = pdvobjpriv->traffic_stat.rx_bytes;
+	ts->cur_tx_bytes = ts->tx_bytes - ts->last_tx_bytes;
+	ts->cur_rx_bytes = ts->rx_bytes - ts->last_rx_bytes;
+	ts->last_tx_bytes = ts->tx_bytes;
+	ts->last_rx_bytes = ts->rx_bytes;
 
-	pdvobjpriv->traffic_stat.cur_tx_tp = (u32)(pdvobjpriv->traffic_stat.cur_tx_bytes * 8 / 2 / 1024 / 1024);
-	pdvobjpriv->traffic_stat.cur_rx_tp = (u32)(pdvobjpriv->traffic_stat.cur_rx_bytes * 8 / 2 / 1024 / 1024);
+	ts->cur_tx_tp = (u32)(ts->cur_tx_bytes * 8 / 2 / 1024 / 1024);
+	ts->cur_rx_tp = (u32)(ts->cur_rx_bytes * 8 / 2 / 1024 / 1024);
 }
 
 bool traffic_status_watchdog(struct adapter *padapter, bool from_timer)
-- 
2.47.3

