Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7443D74
	for <linux-staging@lists.linux.dev>; Sat, 17 Sep 2022 18:16:31 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id d24so1201212pls.4
        for <linux-staging@lists.linux.dev>; Sat, 17 Sep 2022 11:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=RM/MaJxI7eoH4wnvJNEXDmXgONuOyNDJ2jEkwiNVsis=;
        b=A4FYl4GBOaQ5yCxsCOp1T3po6mv1ywVbb5AmOO9sgSOAqbsQr2gCiLAKvEYgDXS/75
         VlIVzpT00T2nd97MCukyNWNNeibQwGwlK1EEhg/hyVHqITP0LqD35Dge+9qWCQ+ztbij
         WU1NxEvBADx4x9+5I+s5jstOJY+3eua/9XVU1NvB9Ci4mvCku8WKVj8IyBNjvMeL0yH8
         gN1zTAICvaAVAQFeUP+4Ld7gk9LOLApzjottHsz51HogFOTxRrvmv7fmsbKNCn5TqSmK
         BmULaPrv6wIVXPIj89tnObunxSQpsHTttHq6GEl84kGtMp270lOPF+t/jcomrn4BZDql
         fI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=RM/MaJxI7eoH4wnvJNEXDmXgONuOyNDJ2jEkwiNVsis=;
        b=nGko4nG8nFl8fsVpy8mJRZOoUT3M0YLlzDt85r53RCGkVCxGm2gMvfJOg0xiA0Amb6
         M7gENrT6WjKxhSlEU40NQQy0KBtfii+HN01E+lH93rNd4FR0tVU6k7DF4eVy0fZG7E82
         Mmc3Sdhu1NgdAVNU3wkD6gwF3QmnxYW/Fw8S/BZDXEmZTLvjA5uRkB4ok2otZGsSNyc5
         8dBCab61vIWcMvJgC16PBYbGqORhSAGe/kjoN9xbCawioZfU9Fe43h/a8YuZ8J/zioWk
         R02W1tgYdcl3TQyLXCtnBD4xNojyYs6rTkfjkwOEt9uwJrgfzDjMUUojcv1uY0xr4Zre
         yi0Q==
X-Gm-Message-State: ACgBeo2g7Rbfng24ezdAxIlB9ixqJaXenuaPZIRSYiWsRFhlhU0YSumF
	/X9LGZTQiTDzt/rtdFkRn9U=
X-Google-Smtp-Source: AA6agR53kLzr7bxkOBBiiDIlpEtJBfGaqh5yhB60T36B+kwycRbKy4uSe/Zv9cuSgpbnv8+utox4Ew==
X-Received: by 2002:a17:90a:203:b0:200:8df6:84c with SMTP id c3-20020a17090a020300b002008df6084cmr21985905pjc.24.1663438590753;
        Sat, 17 Sep 2022 11:16:30 -0700 (PDT)
Received: from uftrace.. ([14.5.161.231])
        by smtp.gmail.com with ESMTPSA id lj12-20020a17090b344c00b001fd9c63e56bsm3529678pjb.32.2022.09.17.11.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Sep 2022 11:16:30 -0700 (PDT)
From: Kang Minchul <tegongkang@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>,
	Kees Cook <keescook@chromium.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kang Minchul <tegongkang@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: Insert blank line after declarations
Date: Sun, 18 Sep 2022 03:16:20 +0900
Message-Id: <20220917181620.3237192-1-tegongkang@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes checkpatch warning as follows:

  WARNING: Missing a blank line after declarations

Signed-off-by: Kang Minchul <tegongkang@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index ad6fb6c3d1f0..dade4d07662b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -245,6 +245,7 @@ u32 rtw_free_uc_swdec_pending_queue(struct adapter *adapter)
 {
 	u32 cnt = 0;
 	union recv_frame *pending_frame;
+
 	while ((pending_frame = rtw_alloc_recvframe(&adapter->recvpriv.uc_swdec_pending_queue))) {
 		rtw_free_recvframe(pending_frame, &adapter->recvpriv.free_recv_queue);
 		cnt++;
@@ -397,6 +398,7 @@ static union recv_frame *decryptor(struct adapter *padapter, union recv_frame *p
 
 	if (prxattrib->encrypt > 0) {
 		u8 *iv = precv_frame->u.hdr.rx_data+prxattrib->hdrlen;
+
 		prxattrib->key_index = (((iv[3])>>6)&0x3);
 
 		if (prxattrib->key_index > WEP_KEYS) {
@@ -882,6 +884,7 @@ static signed int sta2ap_data_frame(struct adapter *adapter, union recv_frame *p
 		}
 	} else {
 		u8 *myhwaddr = myid(&adapter->eeprompriv);
+
 		if (memcmp(pattrib->ra, myhwaddr, ETH_ALEN)) {
 			ret = RTW_RX_HANDLED;
 			goto exit;
@@ -1125,6 +1128,7 @@ static union recv_frame *recvframe_chk_defrag(struct adapter *padapter, union re
 	psta = rtw_get_stainfo(pstapriv, psta_addr);
 	if (!psta) {
 		u8 type = GetFrameType(pfhdr->rx_data);
+
 		if (type != WIFI_DATA_TYPE) {
 			psta = rtw_get_bcmc_stainfo(padapter);
 			pdefrag_q = &psta->sta_recvpriv.defrag_q;
@@ -1207,6 +1211,7 @@ static signed int validate_recv_mgnt_frame(struct adapter *padapter, union recv_
 	{
 		/* for rx pkt statistics */
 		struct sta_info *psta = rtw_get_stainfo(&padapter->stapriv, GetAddr2Ptr(precv_frame->u.hdr.rx_data));
+
 		if (psta) {
 			psta->sta_stats.rx_mgnt_pkts++;
 			if (GetFrameSubType(precv_frame->u.hdr.rx_data) == WIFI_BEACON)
@@ -1480,6 +1485,7 @@ static signed int validate_recv_frame(struct adapter *adapter, union recv_frame
 		retval = validate_recv_data_frame(adapter, precv_frame);
 		if (retval == _FAIL) {
 			struct recv_priv *precvpriv = &adapter->recvpriv;
+
 			precvpriv->rx_drop++;
 		} else if (retval == _SUCCESS) {
 #ifdef DBG_RX_DUMP_EAP
-- 
2.34.1

