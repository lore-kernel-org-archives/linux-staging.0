Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DB23B42FF
	for <linux-staging@lists.linux.dev>; Thu,  8 Oct 2026 18:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791485665; cv=none; b=mde04XaQkZfRI7QrxBSMXMuhYGT4UEWGro0YFg8/OrZo7k9zIje/99n0eb5RBdIwSfs0Lm2MHhjPvW1BGRAVbl+pKxzocqfCAeKV7YnbQR2n+VW/iwJ1laj/WxS53/GGaSfBTLguPuI7OlOPvllyCfrGdLpppnlHwihyClPyadU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791485665; c=relaxed/simple;
	bh=dScB5kQlzL/CW/ZTxaxFKpVoMU2t0vgIhtiYhu3M5+4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nanTzI34/kyhOV4n94BAkZp9y3T9nPgxZ7emnIbX7seL5Uia90nq5HLwWfoHtqNr+yHhIQh2A4NEDv7Dj6Ei1pnR+2nj/I34BYaRwLE+m96Fcsd/qRQL4cRio4gikGihGtyN22Dh6y2tzDU2siidTIwaJnYFHE1S0e5U8vf4m4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XSkhUWXZ; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XSkhUWXZ"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33e6279a1d7so3195598eec.1
        for <linux-staging@lists.linux.dev>; Thu, 08 Oct 2026 11:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791485662; x=1792090462; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R3zjl68lSt8FVrEOS06TJ0yAg1TocKM0nu0BnQmOWjM=;
        b=XSkhUWXZXyN2bicVzMJGhDi9wWSS3L/eqYMHH1tSjp2Sw8n0dZgpeRtU6+tXXdJsov
         e1iFFSvMEWO7hv/o0cVBnwosZ3Gi+qGCv5YCGoArH3gEDWh9MO2UJCG/c3FQkBNlwYHf
         oS0RnHB5noSMUqD/rbil+/mDrRFGlQJEdD8pk7K/PhFaOPq4Li28llsXSmbhji4X24gn
         oKmBdyZFO7PcGu9ciZbCeiOBnBT4/FjA8mW43hVhBVg6j1os++xTNK6w3jaH6larVRGj
         WUbJcnG1LfzVp5yNcIpAqDJrFNgJSr5tY4xWep/CR6JA6xZbzOPoDyVNcRd8mYd+1OPj
         dRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791485662; x=1792090462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R3zjl68lSt8FVrEOS06TJ0yAg1TocKM0nu0BnQmOWjM=;
        b=AmcmD+3IN4eeqvwojEi7jBf96EyUosxTlQiD/CJl7uq/ka/dOHY4p0PsQRVEdUihS5
         y0T2zsUqzkdFmpFI7E8TVRCAoY299IMoadtrZMrj2tJqe3wFPkawkG4grOMde3cYxAXm
         ZqECqoW+j8AZjurGbs3eAGP9mFtr2jV2THSNXScyH5LgNziywd/Sfj9zYHli2H+mN9ny
         ypevi6hQNztwXpVYWaCB4uSRylprbvydhfssDybdD+OwqerZceO/8BhjoctuKJzMYr//
         RGIIyWj8z8FV/KjFK/PGGmleLoti5tqKcaQNARLVKtcbFfIoxq9xiCE4jScqV2/OZUby
         Kduw==
X-Gm-Message-State: AFuF++nXEA7pnEZMy7n++6BQ4dIXfkMg7IHgOPpDvX+B6FaS6I2il8vk
	LObzyJKrfSLN4qjT4K/TyB5OxslN76jHC7ugF1yfSI0YjZGnpBKHCDU013fQsg==
X-Gm-Gg: AYBFou3iTjLwnv4EFOi0rUKB8YNV3vYMZmytK1KzHITaTKI+aEBZgL3cnquW077H7oi
	jKWTPnDdxJqZ3v9+HNYgGbeMibeh4kfPxM7o1HmIjnodT7O+w7KQupTOuuKr3cgvkxvKoqjgtKS
	BPNkIYmdT02PIihWJOprI4DEIsY8/PlCDDsCiGYCgdKGBnKthDy+gWzLSA7irQVhCQF+2pPRCMv
	d2esZOlmwTDv+1GN6wD9j2aaccN4ygOio7H3Ng+BX7wMH+tVVbCiRGdGiO6XYrVyuIY9RnG+l+h
	bwO1S6fao5IZAiM4CcYfXfFcLINbqpANwoB0tr5qSRHcSgZIXenl3Ekh0aqQqmiB5meKzQyiBpy
	vIbyicVaVxceUR5luahRhbLXk3zuHpVG4qoh0UJ/sMDhIDFN6bCEb86tvDO85ilsK7gvPVUJkSw
	uQ11wjPH0MMUkrmYoFxa3ceWBkSTOEyO3osN/cpPyMmBpBNwYvAyxrzTQfP6a4HaXM2LjcgFPAt
	tpdjKtm3Z0PEqBFWcB+b6abPse4vb3p+C1tvj/SMEQ+rQ+3zSBi5cVS5b3ADF+0Ftk=
X-Received: by 2002:a05:693c:2418:b0:353:5d25:1de2 with SMTP id 5a478bee46e88-3535d252434mr829490eec.18.1791485661829;
        Thu, 08 Oct 2026 11:54:21 -0700 (PDT)
Received: from sohail.tailed9083.ts.net ([2401:4900:88f5:9a17:907:5511:a10:cf56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537b3f9588sm332288eec.14.2026.10.08.11.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 11:54:21 -0700 (PDT)
From: Mohammed Sohail <mohd.sohail.biz@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mohammed Sohail <mohd.sohail.biz@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove extern from recv and sta_info prototypes
Date: Fri,  9 Oct 2026 00:24:14 +0530
Message-ID: <20261008185414.160922-1-mohd.sohail.biz@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function declarations in header files are implicitly extern, so the
keyword is redundant. Remove it from the prototypes in rtw_recv.h and
sta_info.h to follow the kernel coding style.

There is no functional change.

Signed-off-by: Mohammed Sohail <mohd.sohail.biz@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_recv.h | 16 ++++++++--------
 drivers/staging/rtl8723bs/include/sta_info.h | 18 +++++++++---------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_recv.h b/drivers/staging/rtl8723bs/include/rtw_recv.h
index b2a863e4d6ce..27d480f58516 100644
--- a/drivers/staging/rtl8723bs/include/rtw_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtw_recv.h
@@ -307,14 +307,14 @@ enum {
 	C2H_PACKET
 };
 
-extern union recv_frame *_rtw_alloc_recvframe(struct __queue *pfree_recv_queue);  /* get a free recv_frame from pfree_recv_queue */
-extern union recv_frame *rtw_alloc_recvframe(struct __queue *pfree_recv_queue);  /* get a free recv_frame from pfree_recv_queue */
-extern int rtw_free_recvframe(union recv_frame *precvframe, struct __queue *pfree_recv_queue);
+union recv_frame *_rtw_alloc_recvframe(struct __queue *pfree_recv_queue);  /* get a free recv_frame from pfree_recv_queue */
+union recv_frame *rtw_alloc_recvframe(struct __queue *pfree_recv_queue);  /* get a free recv_frame from pfree_recv_queue */
+int rtw_free_recvframe(union recv_frame *precvframe, struct __queue *pfree_recv_queue);
 
-extern int _rtw_enqueue_recvframe(union recv_frame *precvframe, struct __queue *queue);
-extern int rtw_enqueue_recvframe(union recv_frame *precvframe, struct __queue *queue);
+int _rtw_enqueue_recvframe(union recv_frame *precvframe, struct __queue *queue);
+int rtw_enqueue_recvframe(union recv_frame *precvframe, struct __queue *queue);
 
-extern void rtw_free_recvframe_queue(struct __queue *pframequeue,  struct __queue *pfree_recv_queue);
+void rtw_free_recvframe_queue(struct __queue *pframequeue,  struct __queue *pfree_recv_queue);
 u32 rtw_free_uc_swdec_pending_queue(struct adapter *adapter);
 
 signed int rtw_enqueue_recvbuf_to_head(struct recv_buf *precvbuf, struct __queue *queue);
@@ -431,8 +431,8 @@ static inline s32 translate_percentage_to_dbm(u32 SignalStrengthIndex)
 
 struct sta_info;
 
-extern void _rtw_init_sta_recv_priv(struct sta_recv_priv *psta_recvpriv);
+void _rtw_init_sta_recv_priv(struct sta_recv_priv *psta_recvpriv);
 
-extern void mgt_dispatcher(struct adapter *padapter, union recv_frame *precv_frame);
+void mgt_dispatcher(struct adapter *padapter, union recv_frame *precv_frame);
 
 #endif
diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/staging/rtl8723bs/include/sta_info.h
index 21a4ca841e6e..8a873e7d799c 100644
--- a/drivers/staging/rtl8723bs/include/sta_info.h
+++ b/drivers/staging/rtl8723bs/include/sta_info.h
@@ -304,19 +304,19 @@ static inline u32 wifi_mac_hash(u8 *mac)
 }
 
 
-extern u32 _rtw_init_sta_priv(struct sta_priv *pstapriv);
-extern u32 _rtw_free_sta_priv(struct sta_priv *pstapriv);
+u32 _rtw_init_sta_priv(struct sta_priv *pstapriv);
+u32 _rtw_free_sta_priv(struct sta_priv *pstapriv);
 
 #define stainfo_offset_valid(offset) (offset < NUM_STA && offset >= 0)
 int rtw_stainfo_offset(struct sta_priv *stapriv, struct sta_info *sta);
 struct sta_info *rtw_get_stainfo_by_offset(struct sta_priv *stapriv, int offset);
 
-extern struct sta_info *rtw_alloc_stainfo(struct sta_priv *pstapriv, u8 *hwaddr);
-extern u32 rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta);
-extern void rtw_free_all_stainfo(struct adapter *padapter);
-extern struct sta_info *rtw_get_stainfo(struct sta_priv *pstapriv, u8 *hwaddr);
-extern u32 rtw_init_bcmc_stainfo(struct adapter *padapter);
-extern struct sta_info *rtw_get_bcmc_stainfo(struct adapter *padapter);
-extern u8 rtw_access_ctrl(struct adapter *padapter, u8 *mac_addr);
+struct sta_info *rtw_alloc_stainfo(struct sta_priv *pstapriv, u8 *hwaddr);
+u32 rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta);
+void rtw_free_all_stainfo(struct adapter *padapter);
+struct sta_info *rtw_get_stainfo(struct sta_priv *pstapriv, u8 *hwaddr);
+u32 rtw_init_bcmc_stainfo(struct adapter *padapter);
+struct sta_info *rtw_get_bcmc_stainfo(struct adapter *padapter);
+u8 rtw_access_ctrl(struct adapter *padapter, u8 *mac_addr);
 
 #endif /* _STA_INFO_H_ */
-- 
2.55.0

