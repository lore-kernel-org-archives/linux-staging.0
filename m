Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92ED733DA
	for <linux-staging@lists.linux.dev>; Tue, 13 Sep 2022 13:07:31 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id t3so11769939ply.2
        for <linux-staging@lists.linux.dev>; Tue, 13 Sep 2022 06:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=W0MVw7iis32cymhaAWLxGOKQ+ymbCabzJQfhDWhu2RE=;
        b=TvlCC6EpJpCwaXpeBNU0k70paSiu0/Inli6R5YhMPqoW2ZbLSiZi9y02GC2LOWn50j
         STos3AAira24qrc6yD2A7rDfCAipR25Bn4grv0kybtbG3ndBIpAllhh2U3eywYUKjfef
         NnQwT6VykQCrV1gnZF5v718fPlNi2m/idZhVEuIL9hUoMx9YagmRSDLr9iLE1PLujP+n
         opORGbq5HIl36CbtwbjL5r3ExmPqc3sfUv09lES+vY3IZoVP2IWdabMue7est04/GeZb
         6GMd4pjWcwHeaKS9uE+Ev6tNW6ssruTERoclylcObXO2fZGeN4/gvcK9yVjMeBvkPY6z
         LKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=W0MVw7iis32cymhaAWLxGOKQ+ymbCabzJQfhDWhu2RE=;
        b=nM6s08nYFCLRXOH2Q9kBH1Eru+2XrIMa9iihGAJnuOQegWZ8VFZr07AinNhia4g+Ix
         bA+38McFPXRzNynhoZ6A2x1MVUfCFGhiwd1KifRIvyyGEV1e6CPjNJ0o0vuGHn6w3B5w
         ZbfDnNpNszRBd3vVSSTiurZE6POsn0SC+qRpz2wpL1rwo/1PtE1bJFlZsjTHAzBSHdhH
         EwalzRKhVizhG3O379/cPmzOSwa8ZqAPv/f0nS5wQueqsSN9zey8cHfKYUV7DdyjIt+e
         +DPALdCfTnzvbQTHxRqlKGmsTEEeUEA5M6s8K09u9FKANJgzpqESnXpaWlZ/OOblHjjg
         pBuQ==
X-Gm-Message-State: ACgBeo1D8RiponofwhCM61tpSVAZ0US+yRM+Xvl4H33Rz11iZcnn3F5k
	7/rn3TUkfl8/KjFeremjMgQ=
X-Google-Smtp-Source: AA6agR6dcZLwwFBPoYe/sQHDEazPD/ATOGV8C5UgTW+741eRH0D1CEAXbaFydPTM0Qj33dmQi7EVOg==
X-Received: by 2002:a17:90a:4496:b0:1fa:bbb5:7000 with SMTP id t22-20020a17090a449600b001fabbb57000mr3950985pjg.218.1663074450919;
        Tue, 13 Sep 2022 06:07:30 -0700 (PDT)
Received: from uftrace.. ([14.5.161.231])
        by smtp.gmail.com with ESMTPSA id ik21-20020a170902ab1500b00172d0c7edf4sm8312622plb.106.2022.09.13.06.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 06:07:30 -0700 (PDT)
From: Kang Minchul <tegongkang@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	linux-staging@lists.linux.dev,
	Kang Minchul <tegongkang@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove braces in single statement blocks
Date: Tue, 13 Sep 2022 22:06:48 +0900
Message-Id: <20220913130648.3116032-1-tegongkang@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit cleans up checkpatch warning as follows:
WARNING: braces {} are not necessary for single statement blocks

Signed-off-by: Kang Minchul <tegongkang@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index d8d394b67eeb..f20eba7fa471 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1374,9 +1374,8 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
 			/* actual management data frame body */
 			data_len = pattrib->pkt_len - pattrib->hdrlen - pattrib->iv_len - pattrib->icv_len;
 			mgmt_DATA = rtw_zmalloc(data_len);
-			if (!mgmt_DATA) {
+			if (!mgmt_DATA)
 				goto validate_80211w_fail;
-			}
 			precv_frame = decryptor(adapter, precv_frame);
 			/* save actual management data frame body */
 			memcpy(mgmt_DATA, ptr+pattrib->hdrlen+pattrib->iv_len, data_len);
@@ -1385,9 +1384,8 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
 			/* remove the iv and icv length */
 			pattrib->pkt_len = pattrib->pkt_len - pattrib->iv_len - pattrib->icv_len;
 			kfree(mgmt_DATA);
-			if (!precv_frame) {
+			if (!precv_frame)
 				goto validate_80211w_fail;
-			}
 		} else if (IS_MCAST(GetAddr1Ptr(ptr)) &&
 			(subtype == WIFI_DEAUTH || subtype == WIFI_DISASSOC)) {
 			signed int BIP_ret = _SUCCESS;
@@ -1651,14 +1649,12 @@ static int check_indicate_seq(struct recv_reorder_ctrl *preorder_ctrl, u16 seq_n
 	u16 wend = (preorder_ctrl->indicate_seq + wsize - 1) & 0xFFF;/*  4096; */
 
 	/*  Rx Reorder initialize condition. */
-	if (preorder_ctrl->indicate_seq == 0xFFFF) {
+	if (preorder_ctrl->indicate_seq == 0xFFFF)
 		preorder_ctrl->indicate_seq = seq_num;
-	}
 
 	/*  Drop out the packet which SeqNum is smaller than WinStart */
-	if (SN_LESS(seq_num, preorder_ctrl->indicate_seq)) {
+	if (SN_LESS(seq_num, preorder_ctrl->indicate_seq))
 		return false;
-	}
 
 	/*  */
 	/*  Sliding window manipulation. Conditions includes: */
@@ -1862,8 +1858,7 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 
 			preorder_ctrl->indicate_seq = (preorder_ctrl->indicate_seq + 1)%4096;
 
-			if (retval != _SUCCESS) {
-			}
+			if (retval != _SUCCESS)
 
 			return retval;
 		}
@@ -2084,10 +2079,8 @@ s32 rtw_recv_entry(union recv_frame *precvframe)
 	precvpriv = &padapter->recvpriv;
 
 	ret = recv_func(padapter, precvframe);
-	if (ret == _FAIL) {
+	if (ret == _FAIL)
 		goto _recv_entry_drop;
-	}
-
 
 	precvpriv->rx_pkts++;
 
-- 
2.34.1

