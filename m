Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC7F274B46
	for <linux-staging@lists.linux.dev>; Mon, 19 Jan 2026 08:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768809991; cv=none; b=Dpx5PsNB1uYMstfbw2+1j0a7qo/lgIamXVEcV2AvCpBbFoVmVcGd3IAYk8KBr4j9D4qmrAjl1kYotdHVRzARdMoT2+yPwNS7QgJ2wpFqb+nK/pGMGGFV2Vs/Eo6AJkZTU1MbCRbjKzPreMi5O6Jj61Pfu/CTTtJ+BnOcsIJsIIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768809991; c=relaxed/simple;
	bh=9rt+9J7wtoR5DH5u++XH2JJq0GHOAFIvoksZsE0moUc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K4H6rpwPFBFYYp3QaZY7tL+OLr8Z1T2EBFgECq2Py0rA2sv1D9fn3Dxr5qKPfoFgyP3wBjsiG9R32Uof5RJeojmpAZiu40Ad8HASW+b8QDIodhIdZyWaWpo3tkPCzCh93sxvV84bL+2WTiZ9oKXwFS+4G71qk2mGHFBEF/6W6dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ycu.edu.cn; spf=pass smtp.mailfrom=ycu.edu.cn; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ycu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ycu.edu.cn
X-QQ-mid: zesmtpsz6t1768809972tb118fa56
X-QQ-Originating-IP: kbhX/aR0WGN6IRVh01eAHnUXYWavqUznD2U4pJtpLCs=
Received: from cjz-VMware-Virtual-Platform.loc ( [36.98.110.57])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 Jan 2026 16:06:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13520527682795301019
EX-QQ-RecipientCnt: 5
From: 2023060904@ycu.edu.cn
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	2023060904@ycu.edu.cn,
	guagua210311@qq.com
Subject: [PATCH] [rtl8723bs] Remove unnecessary atomic operations for continual_io_error
Date: Mon, 19 Jan 2026 16:06:06 +0800
Message-ID: <30BAC49CD5860042+20260119080606.189297-1-2023060904@ycu.edu.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:ycu.edu.cn:qybglogicsvrgz:qybglogicsvrgz7b-one-0
X-QQ-XMAILINFO: NSXtYWcyD5KOIzoCaaGh8kf20pswqh+EDjv0nJr3BuP1e3S49VO5Y5QH
	sdJaDTGVT/nQL2yivbypCWNUwexVxbAL3w8/L2uRrJcZRtorZ7HVbN0GhTyzYSNN+7jYD8S
	7keNtbQ72FAmnqoCuEsMbsMm49Lwe74vxIFd6KrUuv9x0W8senjCMAH3G9mKmjh9JQuvYWA
	V2VmMdEmGZuePCbcj4+n6ThZqEcr+DPAyTCVyAHvobEMta2M5H271nvhTUdW638v68eaA69
	Ue2OVitKyI9r7KGGVJnIQ612LdCXVOfV6mnkqYK7KQ42gaj0awBo8Rp0TmHdvjZRZcq6qPy
	TsWcNB13WeclFlvSXgD0sK6F0A2s2ukc9ra5dNLarlROG87giYLkOEbB3p2ovdNwtwoT6Vl
	e0Kk7f3h6L7nYcGRFcsl10WSn5GdTns7nN48ArTdnJkLVWKJArelxr4kKJQZgbPYyPV/uek
	+uxMS8toxf4OQA5tOrAoFBTNAMPiyGxq37mJdNvjPt11rYI9dLJkofMCMh3Lp0IwS8v/4VD
	zQX2M1vMT2Iy4Yl5+y/KkR3/fFd/6c4gmpmEoOozMNKNTvHXEZiYhQQy7K09x3TQ78M99WF
	gGHUt1N/yBJu0MLSRF01iuJ+dHdGnI5YbChHmSM6YfHAntg1EAp9u1eJzjEno5R3erl8GQz
	NuGXc+Qei3u6fZeN+Z97NJ/Q8L4W98kOtu/smLAJ8d7RY7EhAUQoITffDazqf1d/tVza2iI
	T07prtN10q1FYmZeGa8iqwhPpu6PwEe9LFvX7CPlhlHcPi33jG9Z8mnl6+0u9zbWTxVvX6j
	Xo4MV4dMvxv5meTx+Sp7vqVm5TiD0PfI7oqNWjRsQRlfZiktxZo0zkmNN9jNK5DkSn8tutg
	4JyJ0+uSfJkb7Y95a380+ZRZzxPAEKqjX8O42mB25REbN0E7+hE8OofwnXIqDqis9Nvp3O/
	+x6Y=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

From: Changjun Zheng <guagua210311@qq.com>

continual_io_error is only accessed in SDIO IO single execution flow,
no multi-thread race condition exists, so atomic operations are redundant.
Change atomic_t to s32 and replace atomic_inc_return/atomic_set with normal ops.

Signed-off-by: Changjun Zheng <guagua210311@qq.com>
---
 drivers/staging/rtl8723bs/core/rtw_io.c       | 16 ++++++++++++----
 drivers/staging/rtl8723bs/include/drv_types.h |  2 +-
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index fe9f94001eed..95d42025807e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -135,11 +135,15 @@ int rtw_init_io_priv(struct adapter *padapter, void (*set_intf_ops)(struct adapt
 /*
  * Increase and check if the continual_io_error of this @param dvobjprive is larger than MAX_CONTINUAL_IO_ERR
  * @return true:
- * @return false:
+ * @return false:
+
+ * Note: Original implementation used atomic_inc_return for atomic increment.
+ * Reason for change: continual_io_error is only accessed in SDIO IO single execution flow,
+ * no race condition, so normal increment is safe (remove redundant atomic operation).
  */
 int rtw_inc_and_chk_continual_io_error(struct dvobj_priv *dvobj)
 {
-	int error_count = atomic_inc_return(&dvobj->continual_io_error);
+	s32 error_count = ++dvobj->continual_io_error;
 
 	if (error_count > MAX_CONTINUAL_IO_ERR)
 		return true;
@@ -147,8 +151,12 @@ int rtw_inc_and_chk_continual_io_error(struct dvobj_priv *dvobj)
 	return false;
 }
 
-/* Set the continual_io_error of this @param dvobjprive to 0 */
+/* Set the continual_io_error of this @param dvobjprive to 0
+ * Note: Original implementation used atomic_set for atomic assignment.
+ * Reason for change: continual_io_error is only accessed in SDIO IO single execution flow,
+ * no race condition, so normal assignment is safe (remove redundant atomic operation).
+ */
 void rtw_reset_continual_io_error(struct dvobj_priv *dvobj)
 {
-	atomic_set(&dvobj->continual_io_error, 0);
+	dvobj->continual_io_error = 0;
 }
diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index f86180dc350c..9112ee5f80ca 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -279,7 +279,7 @@ struct dvobj_priv {
 	u8 Queue2Pipe[HW_QUEUE_ENTRY];/* for out pipe mapping */
 
 	u8 irq_alloc;
-	atomic_t continual_io_error;
+	s32 continual_io_error;
 
 	atomic_t disable_func;
 
-- 
2.43.0

