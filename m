Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78FB43440B
	for <linux-staging@lists.linux.dev>; Tue, 25 Aug 2026 12:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661122; cv=none; b=d28vaj+Y8oXF5zEuNYUE4Qu1pb8zd8hEbvkQ3FCEG70tw/qn2NDFIpjOAMEPSA0Y7pxEqeotTPGAhkQkWOLoS/N7mTPEIugv1EsQnAZ6T8MQ4vaMQ3d2xwGVf/DHYbwAN1gKUFwVt304QIa0viDJsc9k38+lWNQb9k5b4E3d2aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661122; c=relaxed/simple;
	bh=Jcxrd/iXVPwyecVF1se9UGc0TEysG6O9FOu9LiKllaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TA8S4ndcdi4+wg6+XAMkkFYvVQesrVsDyl3XL6in7hVes7tzNsCYIxp/fwUTUjJo+l8Voimz72RJU297G4FGDSZiWj6XV9rAJ5Cy4aTIHyT/myH0hMMp021HEipF30ATxOJKiM7vxfbY26U8O3rLU2onv4OPad2GkRzKLIGlM64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/yV98bw; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/yV98bw"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39c9a3acd40so35725041fa.3
        for <linux-staging@lists.linux.dev>; Tue, 25 Aug 2026 05:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787661113; x=1788265913; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m+oeVPPiMqIeToCqTXVeJBfl/XNYe7bFkjVNCqDpVOQ=;
        b=Z/yV98bwPAxyPswOTagocYhyvve/M51WTaYwr3RpCiu08QCRangmRVWr1Fx72ayiI7
         KVdINNBcwuKW2xP8w0hP+n51Jj3f5MUXUobeGmf6Xc/iow3R4d4QTWRZyIUSbCiCcpMt
         dgiarfyVs8ma7V7X0qFEoxdK8B8MnNRBjJJy0BLuiih5QpviwqtIC8mCOoUlEa6/Droy
         C8nLo35PIshIJyz5KzkGfLdMV103jdlTfUG7Ig7RcFAM3wDqludCmeRxXYOoBKFBBNmA
         haKxOiNSkvaFLxe4awxfG9QZDfL6/B9a/gs0cqLxjfgzon6Y1FGAnQBU67eLh9uibSy5
         ApvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787661113; x=1788265913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m+oeVPPiMqIeToCqTXVeJBfl/XNYe7bFkjVNCqDpVOQ=;
        b=M/FWAk8j+h3GZq3KNKPyJANX9AJa7IZzRZQUUpar1DmB5lpX3L5jg3foPT1L6SmT6s
         /b4gqUPYw5rZtz6Fq6DyrwEBuwf7gK4J3VvP2R+pAO9tU0YxDglUEnGMl+22vhgVJhPh
         aQpLUKIQYrMm/hkNrHFrJtUZsZL5jgAGq0IOEddivTDmb3hzZfQ5/ek2IeCTvsGjCZ5F
         uYHRGNScL9GKeInXnhGc2VcPfemuKZWJ7opZoVw/JlIfXn3W4aywUswIGpuZABtUw8eG
         EiW4KV0883MLjAHdxOcy+t0uSFyO1QR9oSstSyoQjU00G+8pPcdZScJ8zJg6TBxcaw4n
         54Sg==
X-Gm-Message-State: AFuF++kWLyj7YLIi/GlcBmHr2vOqEcA2Xr0Tcie4ynbeoZd1QvhzIWj8
	fLFE++mdzTiC4V8mV5Zhn3anxdK18k80COS6WAHFFjN2b3cAgvDKJ4c7
X-Gm-Gg: AR+sD13AtKfjVlA8Q9bxIpIcKjM0zNXZCvb536CzQdyxa+GUNjJXeje55B1ua56Bdcg
	o89z0IxRiNE3yygAvD4bF2Ss5Z+syThT6aU8Kt3+d7ICpjfUaPbP7bBGQJhe09/15N0Y+c/zSa5
	/7zrEykVfy+/hXbN+XbS8F1OVRUI/KX35w6aE72sCUvyN4b5ZiEb8t2TkKeRRbCMUrXyXcMDpGn
	323jikCGgubUIA/hmz+Us6i11uEFa5zbQeKiTozm49paVSKIXUvD3y9dsaEmWGaNMfqXK0XyUK9
	AbLUHaryqCEBqsi1THSxoZXt94cXdA9ULAf7WGnyA0FgPTxPHNeQZQTgHGCZ+ny2uuLcrtEh1kg
	E492T/txmOsv1yKiBZDuKi4vBg7Gt5VI3BbRkPfNmfKUN1ygVO59Ss+VFy4fIA2YiOkU4lC2Jfg
	uQS9vzocb2ImX97SwG2kklJCxq5HdOZ8WcVQeR9Ge3mpe/LkBg7cFGLTKeuj9GyK8RaQ2UDb/8m
	GzhWxYe5yLClDcp
X-Received: by 2002:a05:651c:19a8:b0:3a1:980f:58e9 with SMTP id 38308e7fff4ca-3a1aeb5d31bmr86300071fa.1.1787661112650;
        Tue, 25 Aug 2026 05:31:52 -0700 (PDT)
Received: from localhost.localdomain ([94.240.188.176])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a1c2e5685fsm21140981fa.1.2026.08.25.05.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 05:31:51 -0700 (PDT)
From: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Remove unnecessary braces
Date: Tue, 25 Aug 2026 15:30:37 +0300
Message-ID: <20260825123037.11779-1-nsvatoslav515@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a checkpatch.pl warning by removing unnecessary braces around a single
statement block in the rtw_set_oper_ch() function.

Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index c614c0b4c792..d900b946908e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -256,9 +256,8 @@ inline void rtw_set_oper_ch(struct adapter *adapter, u8 ch)
 {
 	struct dvobj_priv *dvobj = adapter_to_dvobj(adapter);
 
-	if (dvobj->oper_channel != ch) {
+	if (dvobj->oper_channel != ch)
 		dvobj->on_oper_ch_time = jiffies;
-	}
 
 	dvobj->oper_channel = ch;
 }
-- 
2.47.3

