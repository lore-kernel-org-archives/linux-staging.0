Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6E33C10
	for <linux-staging@lists.linux.dev>; Tue, 13 Sep 2022 16:25:40 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id h188so11774485pgc.12
        for <linux-staging@lists.linux.dev>; Tue, 13 Sep 2022 09:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=YKe2aPIRHlELBgCAh/e8x9Sg2/IQQ2R9v1nQ8CxU+K4=;
        b=b9ZsSBzbAxAob/FepIx3Y+rrLmB1bbZWlXuXAqSO0zDqLX/rB/vMPqhLeQBqIFdpMM
         bqx7cUHh4E+q9j8DtT7hVtzcfDp38SXDZZ128meCA96mawgSesnkYov+jK+TprAWXk86
         YHly8G2bLXXppADje+bynQFgLzHkyIN3cYt/woIw038We4BPoRtxEnV2nyKwpwQDA1c0
         b+aDE/7oFyBo8ppJVXG4vJAWY55yd2jgsd3JDUUrhu4rSwGLZdycj94z9UZ9chdIUGfW
         sSkJpZ6dERDxSDgDaH1HGbSpfRQzTuIy+aF+ltPhgPdl8lPs8+sIPOD8q1U9cktXr/rS
         pljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=YKe2aPIRHlELBgCAh/e8x9Sg2/IQQ2R9v1nQ8CxU+K4=;
        b=4fP4x0IVYBLVMWkDNqWo6ZbHTt8Dme7yezBkwcN1zJKZJ/lDJsWGo9EMSiY0ABfzMW
         0ZdGk3u1lG0x6SzG/7HiwuPwjfSqlMIKn1luvOUEjBM9t5AG0IRP/XnGIfyy1JPYh7DD
         6pKAVbk4EiKD9yErQ3rFNHmSR2oqisaZx620mSMr3G+spfTq3jnFe4tDLsuV05TOUzp4
         YjfE68XHLYQ3BVsMjZozc3Y/zPa91i/CEGvUJWtM6vYm7DtrVJs5YRo3Dfz1nmPj+9iU
         ZKEtSEF823GJXdQrXse7Pk2/gwrUMJKlJu89hp+DAv8Qh0P3qLZXf+gzuIUjNHXnHozP
         gO7g==
X-Gm-Message-State: ACgBeo1qrt4/dpJPSnM/F1mKNX5UcVv6Pj48udTu+X1wrYpAoebnoPa0
	PCnGJ6+midTs8cAjgF3LP94=
X-Google-Smtp-Source: AA6agR7G8zcuXHB16XpAA1h0v6znUwFvhUtcFMCvxGct+pF5sN32WhKqtY5BMb4zIKxFMlRETlQ0Jw==
X-Received: by 2002:a63:2cd2:0:b0:41c:5901:67d8 with SMTP id s201-20020a632cd2000000b0041c590167d8mr28286514pgs.365.1663086339453;
        Tue, 13 Sep 2022 09:25:39 -0700 (PDT)
Received: from uftrace.. ([14.5.161.231])
        by smtp.gmail.com with ESMTPSA id 17-20020a630d51000000b0042fe1914e26sm8023544pgn.37.2022.09.13.09.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 09:25:39 -0700 (PDT)
From: Kang Minchul <tegongkang@gmail.com>
To: gregkh@linuxfoundation.org,
	hdegoede@redhat.com
Cc: linux-staging@lists.linux.dev,
	Kang Minchul <tegongkang@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: remove braces in single statement blocks
Date: Wed, 14 Sep 2022 01:25:10 +0900
Message-Id: <20220913162510.3134430-1-tegongkang@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <6cb85919-878a-73a5-0f2a-669d6062727b@redhat.com>
References: <6cb85919-878a-73a5-0f2a-669d6062727b@redhat.com>
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
Reverted erased code which invokes error.

 drivers/staging/rtl8723bs/core/rtw_recv.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index d8d394b67eeb..f360c7c631cb 100644
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
@@ -2084,10 +2080,8 @@ s32 rtw_recv_entry(union recv_frame *precvframe)
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

