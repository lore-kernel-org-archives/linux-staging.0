Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AAC10FF
	for <linux-staging@lists.linux.dev>; Wed, 22 Jun 2022 04:53:16 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id g8so14363590plt.8
        for <linux-staging@lists.linux.dev>; Tue, 21 Jun 2022 21:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Oisc3ypggyVnyacN2ACuhTwt037Hx2/ibOP/qwTmzmU=;
        b=PVrUG220AsrmlyFyxNgPrSWgswrgOZf8ZNb+VHT7wS+RW3rSrqHyF+DlzZyDveDd4Q
         SSI23m2ke1gsb3DASZa1iSCbcnJ9GFgDgX98JSmWHsEJ4ePFxVLHljwGvchcvH8zQ3it
         /R7kWJ4qmFb1QV7ceejbyMy3OuPXpQA7pZeu7zc2sGkLBVZY3kyQga2RLvGhG4G4spih
         tiuwlezt2jbeffgfiMtQ2TMvOFIm8RGZ5QD4q7SvAddNrdFj8xigbauGk7WaroEqyLNf
         w5NFce1bAzLgjtUrHqP0SwnsvEC8dt16DPPIHqwjRF4fDaS0bEGPKF0igtW6PFLKFzLk
         xGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Oisc3ypggyVnyacN2ACuhTwt037Hx2/ibOP/qwTmzmU=;
        b=gFtYnCubQzJrSpTPqccqNP5WuaWpJJ3+NTTQlMAr898pE9hqgbTYMKpTNfKby2bfwY
         rajXroR8ba759UP4s1HXmN0D8RbzaIa83fV0tkO5A7E9lTKOJhhQwrYtsTC5bn5MjNbV
         /HYqB1t35DuXqJJw8SHFuqVZzCYgxouAUBEq0F/4yShS7TPVA8nkQHmWaTbddBGoXjl4
         lI4uaztiGxuYNzDD4W0Fk6QlHAkdvt1E4HlZY34iYmqKJnzT/YHCECiWxLUwdtq1wEFn
         S37Z1e288pcjY1ScwW1bEMoPBXpQhKiQtpLzhd1zQeePgQxB9aWyB+01yaOyviBGV2OO
         OR+A==
X-Gm-Message-State: AJIora9qFMDVLfwJTMhzhuz3Wz5nenLp5h8zIZbQ9vlbAqJTk2dFCLLa
	YiaYbiFhj7Z10YYyw0XxZWg=
X-Google-Smtp-Source: AGRyM1tT/GLbMa+q3rLUJIL3USM5y4dOGHfH6GxOWQWV4OcuSThJ7MBwIuWxdOMNMuE693UmFNU6iQ==
X-Received: by 2002:a17:902:d504:b0:16a:4846:3f46 with SMTP id b4-20020a170902d50400b0016a48463f46mr1596164plg.159.1655873595633;
        Tue, 21 Jun 2022 21:53:15 -0700 (PDT)
Received: from localhost (c-67-180-87-133.hsd1.ca.comcast.net. [67.180.87.133])
        by smtp.gmail.com with ESMTPSA id j1-20020a170903028100b0015e8d4eb24fsm11542908plr.153.2022.06.21.21.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 21:53:15 -0700 (PDT)
From: Chang Yu <marcus.yu.56@gmail.com>
To: Larry.Finger@lwfinger.net
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chang Yu <marcus.yu.56@gmail.com>
Subject: [PATCH 5/5] staging: r8188eu: Fixed some blank line coding style issues
Date: Tue, 21 Jun 2022 21:52:34 -0700
Message-Id: <cf4d4f7a58c9ba4510bed6748f78491c91e3e6f3.1655872968.git.marcus.yu.56@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1655872968.git.marcus.yu.56@gmail.com>
References: <cover.1655872968.git.marcus.yu.56@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added blank lines after variable declarations as per checkpatch.pl

Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 14dd2344fa4b..cc91638a085d 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -237,6 +237,7 @@ u32 rtw_free_uc_swdec_pending_queue(struct adapter *adapter)
 {
 	u32 cnt = 0;
 	struct recv_frame *pending_frame;
+
 	while ((pending_frame = rtw_alloc_recvframe(&adapter->recvpriv.uc_swdec_pending_queue))) {
 		rtw_free_recvframe(pending_frame, &adapter->recvpriv.free_recv_queue);
 		cnt++;
@@ -327,6 +328,7 @@ static struct recv_frame *decryptor(struct adapter *padapter, struct recv_frame
 
 	if (prxattrib->encrypt > 0) {
 		u8 *iv = precv_frame->rx_data + prxattrib->hdrlen;
+
 		prxattrib->key_index = (((iv[3]) >> 6) & 0x3);
 
 		if (prxattrib->key_index > WEP_KEYS) {
@@ -777,6 +779,7 @@ static int sta2ap_data_frame(struct adapter *adapter,
 		}
 	} else {
 		u8 *myhwaddr = myid(&adapter->eeprompriv);
+
 		if (memcmp(pattrib->ra, myhwaddr, ETH_ALEN)) {
 			ret = RTW_RX_HANDLED;
 			goto exit;
@@ -1022,6 +1025,7 @@ static int validate_recv_frame(struct adapter *adapter, struct recv_frame *precv
 
 	if (pmlmeext->sitesurvey_res.state == SCAN_PROCESS) {
 		int ch_set_idx = rtw_ch_set_search_ch(pmlmeext->channel_set, rtw_get_oper_ch(adapter));
+
 		if (ch_set_idx >= 0)
 			pmlmeext->channel_set[ch_set_idx].rx_count++;
 	}
@@ -1049,6 +1053,7 @@ static int validate_recv_frame(struct adapter *adapter, struct recv_frame *precv
 		retval = validate_recv_data_frame(adapter, precv_frame);
 		if (retval == _FAIL) {
 			struct recv_priv *precvpriv = &adapter->recvpriv;
+
 			precvpriv->rx_drop++;
 		}
 	}
@@ -1312,9 +1317,11 @@ static int amsdu_to_msdu(struct adapter *padapter, struct recv_frame *prframe)
 	struct rx_pkt_attrib *pattrib;
 	unsigned char *data_ptr;
 	struct sk_buff *sub_skb, *subframes[MAX_SUBFRAME_COUNT];
+
 	struct recv_priv *precvpriv = &padapter->recvpriv;
 	struct __queue *pfree_recv_queue = &precvpriv->free_recv_queue;
 	int	ret = _SUCCESS;
+
 	nr_subframes = 0;
 
 	pattrib = &prframe->attrib;
-- 
2.36.1

