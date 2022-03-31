Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8447C
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 10:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1648724303;
	bh=aRr1Wo0noBzjmztVDr9o7+pq2OCjO4BIh16u58etZvc=;
	h=From:To:Cc:Subject:Date;
	b=INx6hhDgqJtMDj0LSjLyXEGASd+nTlbLDN6aRnOJQynM51jfBNL2DVmw/4ppoU8vC
	 Jy5LrGvbBj+gEbaDjDumsa1Rhn3SLfcFeFAsD+X7Y7/V69w4sEXZseihdZpXM7uOrc
	 /ieImb5vkp517RH/rqyzpTVXVx5sHRhbHNNjv2WM=
Received: from localhost.localdomain ([218.197.153.188])
	by newxmesmtplogicsvrszc7.qq.com (NewEsmtp) with SMTP
	id E4927E21; Thu, 31 Mar 2022 18:57:09 +0800
X-QQ-mid: xmsmtpt1648724229t58b97qig
Message-ID: <tencent_254AD0FF06201BCCF5B9911C6E142CE1F208@qq.com>
X-QQ-XMAILINFO: MmpliBmRb3iCCGP4N5Q8XMBn0Cixmk8hVKlkQwDgT2cAN7KG384+6dqFHqXzEW
	 ElbgUXl9mczuK6kltEVanL23xPmULJTX1NsGfReYVRbMjtYHPtQFAZ9k/2TyJwjTmAYBT7o8gTO8
	 uExXrZh6yZRkfVHJe6cWNntlKrLtIRhdrTjpDS5vzW6uBs7CxOc1t3jSVjPuN1hXFJ2HJRuj7QDj
	 jlhoQ48a3o8lH/DcZgnxf1E/tQIWH8MV/rhnZ2bpAE0Ucd1MJzdJRRkaoBzXWBxz68dPou2qGpCk
	 x1wmsU5jDIpMGqpqLs9+gUln30Db+2inOIwelRCaniPye1EQxFvVdzHbN7SdLFmebrOqYZTe2Utp
	 EwommJmxlmapRfBfFlVJKk0KB2ANZmy7GRckvbUTqLhBOHFex4R+tflQWR7Dd1Sp/Vf2D4OQa8Ue
	 +zsmc8fCjAOOx1zcrJ5Sr770KSmbUJYgqqnhLZmRZqv6KOEo51Y42GHHVCZ+QvAxTi/FtXZJIonF
	 4ppN73g7cPkOkqWCUQUuPSr+5topIcjkniZ3IYfj4CtXoRTBzn12A6xuKO8zs5NbR29Zm0gapL0j
	 dX9np/tg0jUrAOZRcMSkv4rwUEqpcKhR/4p51fQ/geFQvY4q1dny7CcGxh7aYCkMxDKRucaCXY1k
	 bU0GmPvmLPMS8C80sD+aEatwkh05bDgVYBjlYsO0LN0VVvjT6SIZi2CKxHLwNPy/9GZpz6j/fAjY
	 F80f/w738DVMxkLzjOAqFPsrBnA2fhHqJWsMxMQQ6U4p9MQNxt3wq0nhfHNcjW+p8iKx7eq26rf6
	 NLMmNLTeu9Kg+OaojNbouaU7zphheQ2CvA1Y9+H+3ZgRgEba7zZ8YcyB+ePDuc68Ki3D1NCvLas+
	 DsSAwmJLfbog9mzcMMqmodZl4iu0eOkTNeQH1a6lb1CxUMCzL5cTVx2Uy88LBOStJW5LL2enyXN8
	 8GVrIMcfI=
From: xkernel.wang@foxmail.com
To: gregkh@linuxfoundation.org,
	dan.carpenter@oracle.com
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH v2 1/2] staging: r8188eu: check the return of kzalloc()
Date: Thu, 31 Mar 2022 18:56:55 +0800
X-OQ-MSGID: <20220331105655.7958-1-xkernel.wang@foxmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xiaoke Wang <xkernel.wang@foxmail.com>

kzalloc() is a memory allocation function which can return NULL when
some internal memory errors happen. So it is better to handle the return
of it to prevent potential wrong memory access.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
Note: The subsequent patch is specific to properly release the
resources, while this one is just take aware of the validation for the
return of kzalloc().
ChangeLog:
v1->v2: optimize the style and seperate an another patch.
 drivers/staging/r8188eu/core/rtw_xmit.c    | 10 ++++++++--
 drivers/staging/r8188eu/include/rtw_xmit.h |  2 +-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 46fe62c..299fe26 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -179,7 +179,9 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 
 	pxmitpriv->free_xmit_extbuf_cnt = num_xmit_extbuf;
 
-	rtw_alloc_hwxmits(padapter);
+	res = rtw_alloc_hwxmits(padapter);
+	if (res == _FAIL)
+		goto exit;
 	rtw_init_hwxmits(pxmitpriv->hwxmits, pxmitpriv->hwxmit_entry);
 
 	for (i = 0; i < 4; i++)
@@ -1516,7 +1518,7 @@ s32 rtw_xmit_classifier(struct adapter *padapter, struct xmit_frame *pxmitframe)
 	return res;
 }
 
-void rtw_alloc_hwxmits(struct adapter *padapter)
+s32 rtw_alloc_hwxmits(struct adapter *padapter)
 {
 	struct hw_xmit *hwxmits;
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
@@ -1524,6 +1526,8 @@ void rtw_alloc_hwxmits(struct adapter *padapter)
 	pxmitpriv->hwxmit_entry = HWXMIT_ENTRY;
 
 	pxmitpriv->hwxmits = kzalloc(sizeof(struct hw_xmit) * pxmitpriv->hwxmit_entry, GFP_KERNEL);
+	if (!pxmitpriv->hwxmits)
+		return _FAIL;
 
 	hwxmits = pxmitpriv->hwxmits;
 
@@ -1540,6 +1544,8 @@ void rtw_alloc_hwxmits(struct adapter *padapter)
 		hwxmits[3] .sta_queue = &pxmitpriv->bk_pending;
 	} else {
 	}
+
+	return _SUCCESS;
 }
 
 void rtw_free_hwxmits(struct adapter *padapter)
diff --git a/drivers/staging/r8188eu/include/rtw_xmit.h b/drivers/staging/r8188eu/include/rtw_xmit.h
index 5f6e240..b45cd29 100644
--- a/drivers/staging/r8188eu/include/rtw_xmit.h
+++ b/drivers/staging/r8188eu/include/rtw_xmit.h
@@ -345,7 +345,7 @@ s32 rtw_txframes_sta_ac_pending(struct adapter *padapter,
 void rtw_init_hwxmits(struct hw_xmit *phwxmit, int entry);
 s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter);
 void _rtw_free_xmit_priv(struct xmit_priv *pxmitpriv);
-void rtw_alloc_hwxmits(struct adapter *padapter);
+s32 rtw_alloc_hwxmits(struct adapter *padapter);
 void rtw_free_hwxmits(struct adapter *padapter);
 s32 rtw_xmit(struct adapter *padapter, struct sk_buff **pkt);
 
-- 
