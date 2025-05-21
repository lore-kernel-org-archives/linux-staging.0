Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DB1199EAF
	for <linux-staging@lists.linux.dev>; Wed, 21 May 2025 07:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747814330; cv=none; b=SrLrHeQbZUFeKZY8UqfnDJgoHfpSS141/KcNWZCx1pZjuUNKoAzwh7/1mOlgYtPRwUssx5m3vxXOntPrJ6UhIj9FQEpXAG3+wAtAb7RrPBpQuORUiI1Fskaw4u2Oqe2FVvCHJJh7tThDYsY1kxEi/pZx8+KanxQE04T9EeNfTig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747814330; c=relaxed/simple;
	bh=Wz/HeTweJzE1PPZQSv30vAtsIJTG7FjXNnXa5xhsZmw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TSNrkQ3FWyH87nm+/yKtbipJBhBGj/HiF+EhVTfjfJxk/KvD6DVpHTluIce4bN+ep+OV1omIvFGAs5HGTucBNqv/YL9MaNIxipCzY0Wmn5eNlZ0fnxrmJwJvowszaoN5uW9zlfhXx6+wRE3p5Q6wU4L+0l9Zrt0snWmrahv3vzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h0mpx3XD; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h0mpx3XD"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5290be1aedcso5124362e0c.1
        for <linux-staging@lists.linux.dev>; Wed, 21 May 2025 00:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747814327; x=1748419127; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kaQHQDFj7zVBURXI2K41vAHsKHuwZeCUeX0z/tFbjH8=;
        b=h0mpx3XDIIGjL2xuyjkoWaTLHlYdMSwa6G/auO76p2FAzAJ7wVvSVIA8CTanDuEKSw
         S3/80jwqEV0Eu25ESSbUsBMg3jBTn6ctNITV8oWTuqkoha6SbocolDYCB5pjiI7Ge7dy
         OAl4S4kS4o4RcGiGvQLokHA3NPnScVjnslTsyH2z3pjjMHTW/7ALI7S5mNLNMSnSmK68
         F7JHSF7+i0JidPOQOpol5qq+i4XYymPKuprkRWC+eypO5tC2SFSw9aA/1gQckBFrtgKR
         4cOnnaOITC3NZxllJswwTelqSc7MqH+Ggbwx1fzidnEUeedKR81mGvZZWkqMi/uAQ3Y2
         bHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747814327; x=1748419127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kaQHQDFj7zVBURXI2K41vAHsKHuwZeCUeX0z/tFbjH8=;
        b=q3/Eu8QOVmMGZmUc4Yqn9JqqU0CdvnbwYY2ZNHfrCgOjSv+hYabLvrfTT7IVQV7wsG
         7r3ao0WqkBGc78Ixi8a3EvoDVMi7tBnDkQadeqd9E9uNuDhXlVYQwRmXv2sPvdsBs4Sa
         YP2ddYUGG/x5VMtQ+EvOuLrENObYKpYo3ASOIXI6I0lWvhvJFk/ApkTLuoCBEWPHhQN9
         Ta4kHJQTWDkFJznbRDIg4DqRfxcQEzI5gh/mGWNf7PPvePLX7yp0o9WCEaEgBEU3mR20
         UfdImVHcpQcTUReXYV25b5EZX0x1It2YmNNn9k4+WNebo5q/whI3AKU+te9qp3zP8Cfa
         ItTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWc0NZVpMa5vhzuZ9KX2Qxwo9eL2o1csEMyoz6u2JzlMbq7skaFVgKxA3Rbws4gKR3pBdmnQTx/dXIYrvmp@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8Fvg/e/yMOe9fht65OjjfPV/+UKrPl2GIYVzMGTpBtWHtuHZD
	Bujfh+G5proLXWuXbzFpsePfyMbRJR8pD+k6w8vGkbJ8KU+JzNJ7+LwfzS76uqDNQfQ=
X-Gm-Gg: ASbGncuUrLOEiEfjRj3sXV2c2zM+NntW1CLS2CS8io22/jNgcsnEEUsUJFl7+u8qTm2
	Mr0QwnipntiLmz6rkYkSltxom+AvMnLgYl9WwtTYvjSac3sob5Iz0Z+K7gkkcm1Gk33gw0QShF9
	A+45vZXaFYkQyKgPwby3MevwdFDsCPlD0vWHvo4C88WfVK4y8Vb4G6HhAf9t3xXqd07EokpK+9n
	1a1rqutIaoVdjIOs3SbaHXhNLGbhXScDS2MLGw3p8lGy7I67eFY+AnfwUX+cj6yhJKkBBcEGC0M
	kVGt0MasYlhYyVgoV4nz88rZA8ldlG6/KtP+bnNlgzgMCX+Y0BkYApJdtqQcDHaq5ov7iUYC
X-Google-Smtp-Source: AGHT+IF0STG6uMamOgsqgjaRlbu8+bqgdX9UiaP1jm8xcBXSOyL+SDKR01WZEkU62t0tLVnmgrT0rw==
X-Received: by 2002:a05:6122:1e08:b0:51f:a02b:45d4 with SMTP id 71dfb90a1353d-52dbb4307aemr18070232e0c.1.1747814326824;
        Wed, 21 May 2025 00:58:46 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a8c3:4a97:a731:9f98:5e35:f7f4])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dba96b12dsm9943892e0c.27.2025.05.21.00.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 00:58:46 -0700 (PDT)
From: David Tadokoro <davidbtadokoro@gmail.com>
To: gregkh@linuxfoundation.org
Cc: David Tadokoro <davidbtadokoro@usp.br>,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces for single statement blocks
Date: Wed, 21 May 2025 04:58:31 -0300
Message-ID: <20250521075831.485199-1-davidbtadokoro@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Tadokoro <davidbtadokoro@usp.br>

Remove all unnecessary braces for single-statement blocks in
`os_dep/recv_linux.c` to conform to code style rules.

Warnings reported by checkpatch.pl:

* WARNING: braces {} are not necessary for single statement blocks
* WARNING: braces {} are not necessary for any arm of this statement

Signed-off-by: David Tadokoro <davidbtadokoro@usp.br>
---
 drivers/staging/rtl8723bs/os_dep/recv_linux.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/recv_linux.c b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
index ca808ded61ac..98d3e4777210 100644
--- a/drivers/staging/rtl8723bs/os_dep/recv_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
@@ -45,9 +45,8 @@ void rtw_os_recv_resource_free(struct recv_priv *precvpriv)
 /* free os related resource in struct recv_buf */
 void rtw_os_recvbuf_resource_free(struct adapter *padapter, struct recv_buf *precvbuf)
 {
-	if (precvbuf->pskb) {
+	if (precvbuf->pskb)
 		dev_kfree_skb_any(precvbuf->pskb);
-	}
 }
 
 struct sk_buff *rtw_os_alloc_msdu_pkt(union recv_frame *prframe, u16 nSubframe_Length, u8 *pdata)
@@ -160,21 +159,19 @@ void rtw_handle_tkip_mic_err(struct adapter *padapter, u8 bgroup)
 		}
 	}
 
-	if (bgroup) {
+	if (bgroup)
 		key_type |= NL80211_KEYTYPE_GROUP;
-	} else {
+	else
 		key_type |= NL80211_KEYTYPE_PAIRWISE;
-	}
 
 	cfg80211_michael_mic_failure(padapter->pnetdev, (u8 *)&pmlmepriv->assoc_bssid[0], key_type, -1,
 		NULL, GFP_ATOMIC);
 
 	memset(&ev, 0x00, sizeof(ev));
-	if (bgroup) {
+	if (bgroup)
 		ev.flags |= IW_MICFAILURE_GROUP;
-	} else {
+	else
 		ev.flags |= IW_MICFAILURE_PAIRWISE;
-	}
 
 	ev.src_addr.sa_family = ARPHRD_ETHER;
 	memcpy(ev.src_addr.sa_data, &pmlmepriv->assoc_bssid[0], ETH_ALEN);
-- 
2.49.0

