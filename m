Received: from mail-dy2-f2.google.com (mail-dy2-f2.google.com [74.125.229.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA633DD523
	for <linux-staging@lists.linux.dev>; Sat, 26 Sep 2026 11:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790421105; cv=none; b=tXcsBTWR2Z5jII0taNHbSXIcPjHvtU6p9JjCiPA/6F+K3rwM061YbLjsuP4bgnp+8FBBo8rnZtYoXdJK6xL+qWMYkCC3ke8t0Ny8Rt9EaUaCXxzA0WB6pftE9wcDy/k2vVGtDeOP/H0XnFchlsy7L5sNs4R8Nwo3Prsv8tNrVKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790421105; c=relaxed/simple;
	bh=NJBQm6zagioYvPgW0XSHj8Mraan5Bc0gw6weCSNPbr8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b4STutjsniY/ycrIZQnG6KNAxWuwiCoGdRFILwaeQlYZNW1RkBGySSYkMCth4/phzN08ybMQjNU7EOEH2rVp6Y4vp4RK9MmhhalnxuHfO03fc0ZJEhBlRXQGwG0d2rYmEcTqtG4QxdZTKEmxA1gewzNobbGU8MH4HNo7/Knn7HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qukhuHTA; arc=none smtp.client-ip=74.125.229.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qukhuHTA"
Received: by mail-dy2-f2.google.com with SMTP id 5a478bee46e88-327b1d5824fso1395905eec.1
        for <linux-staging@lists.linux.dev>; Sat, 26 Sep 2026 04:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790421103; x=1791025903; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wdMjwYCO7mF7SqKO3qtA1ll+suwFYRULwWKy0mpRVLs=;
        b=qukhuHTA3z5YozqxmgBIFdS4Z59K6dLAc553uOtv+Vl6fN1ttwrHIVkwLCAFznsdtm
         rYqYT8Kv5LIhzXW2OlBi+C0eADjuCVeh6jILI6biJiiXBD4I35B/ckdGwbZw24E+N9k6
         St/LILEhEr/vrpQMv6qVYZUFQ8iAO6ULUmwl4otH6ZrVR8I6QW+LK1EluANPk4a6VtAX
         ps3nEnwURqgapMjsxzJGhnxM758Qj2RSfEoC25zfKkq/YqRDULu96+RriiabULM42G16
         QMKCOiG7EILDW7angI/6a7INFMPkCKhM4owCqtaVqF6tw8qlCPyjJ4mtScOL7dmBEuDZ
         C6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790421103; x=1791025903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wdMjwYCO7mF7SqKO3qtA1ll+suwFYRULwWKy0mpRVLs=;
        b=H2TZ3qSf5dNTQp5dsXoWm0c4pSmfMZAtw6aEYxxAfwvLiYkIlNflJpQWBCyKkYVUWh
         XSPjtGwLZ/sYUpjwkgxeGUTjPSwG16EyLNwF8+QVs0QY+1z9/0g/kPNDQ6UM/HIa4n4Z
         pB3jEUS3Vc0eHrNQrWdd/KPdPSaH3P/Xntn+wcWqn5cySN2l4Wyi1Li46JYEZykuxZf/
         yyjqq1Qqck5nAD0K0sG3YQMz83L5YuG6CU6Dn7k3AwecM+J0QwE0MZVUpJGBlX3ZgDUV
         BcTIGw2apnqBvTpwCwOmKFlaKNvOFuK6x02Cf+rGr0c1sPqHdbz7m8UT59GsqkIMM+vq
         4msQ==
X-Gm-Message-State: AFq9FYLkhK0P9RILl899m2wL4fdloUOd4xKYzU/hdCey4dEe3gVrSloL
	eMNweIdt3jZw0lX0LM9f1rUpbeiMd0B/heFt+eK9Q0bCf3/2e0MLBQBqXMS0fi1ik/M=
X-Gm-Gg: AYBFou1IMjVkx6SSHwSk2fzovKLbOxWvp+Ipr2bxiqDk4Jzgbvf6LRZrKFrmDPN4dG1
	nJjL3/+P52CxKyWWtbysR1OK8VufBmzqvHDspB2yEZdXK9wvIHdC0ONd3Es+XzakpDeUrWEEXIT
	AbCP/HX/Tyf/olXigBzrrT2UlR3MTf6ZRIIz9lyE502SoqdWa6F6ardNM9LN69XG0aTIcA+rTtf
	YhqOfTwibAPz6ryo3sguv4haIMMnCYrnmCcPTZ8zfAFLXoczIQl988sRoew6OKrMpp8Dxhmavyj
	tizQbajq2RlYaCxO+IQstIRPiSK0mj7i4LJU7/jeShWr+FD8RSe3b5eF3XE1uItKEEo/8sQDOHU
	fNIrQ1B6gvBhr/dl/2j3eqCEO9a5lKRQsvAJljTHmxQdDSdiHLTJhm99H/ssAiLhiPdQJuowyor
	VtcmJaGfvVlACvn+1DDIBeLWMfRKVf2/AlLNved4bXVafJ8Dy8JvRS49jZO5g41Bn2mnep7/csM
	MYSIyyp2hcvI8OQXuHZB95UmBx3XRNb6gCl7w==
X-Received: by 2002:a05:7300:a987:b0:333:fe81:85dd with SMTP id 5a478bee46e88-3426fbbe744mr3803231eec.3.1790421101911;
        Sat, 26 Sep 2026 04:11:41 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141d2fe4bsm14596365eec.4.2026.09.26.04.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 04:11:41 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] staging: rtl8723bs: make rtw_register_tx_alive() return bool
Date: Sat, 26 Sep 2026 11:11:25 +0000
Message-ID: <20260926111125.5036-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_register_tx_alive() only reports whether the transmit path can
continue, and its only caller treats the return value as a boolean.

Change the return type to bool and replace _SUCCESS and _FAIL with true
and false. Update the caller accordingly.

No functional change.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c    | 12 ++++++------
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c  |  4 +---
 drivers/staging/rtl8723bs/include/rtw_pwrctrl.h |  2 +-
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 448611ad8237..007ead477a51 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -771,13 +771,13 @@ void rtw_unregister_task_alive(struct adapter *padapter, u32 task)
  * _SUCCESS	rtw_xmit_thread can write fifo/txcmd afterwards.
  * _FAIL		rtw_xmit_thread can not do anything.
  */
-s32 rtw_register_tx_alive(struct adapter *padapter)
+bool rtw_register_tx_alive(struct adapter *padapter)
 {
-	s32 res;
+	bool res;
 	struct pwrctrl_priv *pwrctrl;
 	u8 pslv;
 
-	res = _SUCCESS;
+	res = true;
 	pwrctrl = adapter_to_pwrctl(padapter);
 	pslv = PS_STATE_S2;
 
@@ -788,7 +788,7 @@ s32 rtw_register_tx_alive(struct adapter *padapter)
 	if (pwrctrl->fw_current_in_ps_mode) {
 		if (pwrctrl->cpwm < pslv) {
 			if (pwrctrl->cpwm < PS_STATE_S2)
-				res = _FAIL;
+				res = false;
 			if (pwrctrl->rpwm < pslv)
 				rtw_set_rpwm(padapter, pslv);
 		}
@@ -796,9 +796,9 @@ s32 rtw_register_tx_alive(struct adapter *padapter)
 
 	mutex_unlock(&pwrctrl->lock);
 
-	if (res == _FAIL)
+	if (!res)
 		if (pwrctrl->cpwm >= PS_STATE_S2)
-			res = _SUCCESS;
+			res = true;
 
 	return res;
 }
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 0441e84ea87d..e4d216924262 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -139,10 +139,8 @@ s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
 	if (!queue_pending)
 		return _SUCCESS;
 
-	ret = rtw_register_tx_alive(padapter);
-	if (ret != _SUCCESS) {
+	if (!rtw_register_tx_alive(padapter))
 		return _SUCCESS;
-	}
 
 	do {
 		queue_empty = rtl8723_dequeue_writeport(padapter);
diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index 49f19b6ee329..1605d32c8bf8 100644
--- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
@@ -217,7 +217,7 @@ void rtw_free_pwrctrl_priv(struct adapter *adapter);
 
 s32 rtw_register_task_alive(struct adapter *adapter, u32 task);
 void rtw_unregister_task_alive(struct adapter *adapter, u32 task);
-s32 rtw_register_tx_alive(struct adapter *padapter);
+bool rtw_register_tx_alive(struct adapter *padapter);
 void rtw_unregister_tx_alive(struct adapter *padapter);
 s32 rtw_register_cmd_alive(struct adapter *padapter);
 void rtw_unregister_cmd_alive(struct adapter *padapter);
-- 
2.43.0

