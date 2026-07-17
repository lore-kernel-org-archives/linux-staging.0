Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2888390228
	for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 18:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784314474; cv=none; b=IEv5vBLhc1Qu+oXfxJeDFWxwPeFYpCubeJgOjCjkAnl+DUNC1HvfRySyCxAIajz1QmH1OPvbtLZ3Ahu6/jevsWa17nFqpImtGCDmep+vi3L2csuDHyn3ZH941+uON3iS7x9J/E2NqjWY7yOmXur3c21s6Riz0M+Lg6oozj6Xgp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784314474; c=relaxed/simple;
	bh=Tv8A0ox561VBzW5dTJ76zc+tCYrMT9xdXI9ZjignSY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=joU6A4y+u1P/s38IX2McJCOrmedNrXe6ctr1DI/pqB1Gjba5jzYIXEVlJPerla9ZYaItEvqUF/xRuZfEzaT/nSRfQEUf/vllKTZwzEbZOAv8BBkokEul9aMpeoNn9fJEyfEpcSUsVWvAhgW/4bWGq44x+pocDyduYJ6+pw0c/5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jsxvbjqv; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jsxvbjqv"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c1712a04ddaso183922366b.2
        for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 11:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784314471; x=1784919271; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PIUqqb29SY2d4YuZl89bgB1x3dnKXcj43DCwLRgHeZw=;
        b=Jsxvbjqvn3HNmfXHL8/fkZjQcbBTL3rL6kEo7RsrOK6YwZH7vcy+0dfkN0JV55SVGj
         dccS16RsjdbYKTbk8nyJYg5H+3+r5TEjXXyYK3ezU8JXIPQt6bpBfU1lcUEg4YMrPy1q
         wsKesLAcGqz6Ssk55u5UUGpIlXp0vpwqmwOkdcOubYuMNj3C6KdEvvdhSYfTVzC2GpXb
         bU5SIzE/IcYIfEr92xjkfEJYADG4YHw8FbES7gsa45UT114mTrdWxGuVENsj411xtjzf
         0lEGJ1O3x2DIrTfjLXu7JuKomTH62/3nTMpobtqipBep/ip6Dr30p8Hutl92QZysVkt/
         9QVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784314471; x=1784919271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PIUqqb29SY2d4YuZl89bgB1x3dnKXcj43DCwLRgHeZw=;
        b=ooxXC0zXxhYX4DB0iKmD48WGzxnnMGMaGVQmgoSKzi2N6JX7a8GVLWEQFhA1XraphR
         1CJlzVNQGAbA2v/9TJPaybVi6BLDGfwZYU7f43qHFZP4gInJk+L5VCs4NmRhVAfPFNHi
         QWnr8S8hhc0FCOP/NRN0xlJqtr6ufyARy6mc7Ixx7AokqRiAm/iWrATiPQbcPEpyt+7E
         UMMo5MrO/BjN9jPgjehzo9pgUJb20q/6VJpN7vNAKyuweMQKjgWdRXnTYKj1FZcc1trg
         SWmpk73sX0Stqj2ojHHH/3msiarrisACPoy4ielBrlErxh2Tv0YII6xn+Wtp72kRmQJl
         1x4g==
X-Gm-Message-State: AOJu0YyV8+VGkH7/vEg19dhaTB1tih9IpMTFcwtOG3/i78FiOuG/RDU5
	NaYKMOmaiFs02VfcF8gllAnwUeWamWqmyXmohNjEURNhkA9zozAwvQRB
X-Gm-Gg: AfdE7cmo+5EB0d94fPI2yTU62p4GEuiUpTGnaMQJSfialHRqiSmjabXh3Fej1KaX73Q
	XxBsTZaaigc3PngNX3xBqxVDZYwyDJq9epTQiR/Qvauc/5VtES1dVYQ5EY4SO0wvzXI17UzrUqY
	9muLJJY/pHqesKGggr4IvAqlTon5qRWyq3afRs2wIfm/ugdke/70/pFq9jGMJInvH8qCRAPnmEj
	os7PZ6qEXsPzcLmUbDEwm1o87qNLjYQsAwZ3bNBHhJQjd4u9i8kgdtKhgTg8mcRwHP35iyKiIxT
	0Adnu5ZQpHJwRrW9LQqjnumW6KOH5/5uLXAKIB3FEfBldZYH9yyakR2ANy28TfUWjEvm97rF4mf
	8Mlp56KcoOtKdmkC2RegHe0I3urYfOT3Dre8agylxaW8TtcUphim1b9g2/33ZlB9tbLQDiIKNmA
	nj
X-Received: by 2002:a17:907:e1ce:20b0:c19:4c2c:ac37 with SMTP id a640c23a62f3a-c194c2cbfcemr45199266b.58.1784314471076;
        Fri, 17 Jul 2026 11:54:31 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f8c5sm118622666b.34.2026.07.17.11.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 11:54:30 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 7/9] staging: rtl8723bs: remove unused spinlock 'SdioTxFIFOFreePageLock'
Date: Fri, 17 Jul 2026 21:52:06 +0300
Message-ID: <20260717185407.56513-8-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717185407.56513-1-nikolayof23@gmail.com>
References: <20260717185407.56513-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the 'SdioTxFIFOFreePageLock' spinlock from the struct
hal_com_data, since the only operation performed on it is
initialization, while the locking and unlocking calls are commented out.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_sdio.c       | 4 ----
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 1 -
 drivers/staging/rtl8723bs/include/hal_data.h   | 1 -
 3 files changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_sdio.c b/drivers/staging/rtl8723bs/hal/hal_sdio.c
index 1bd165a4573f..7cead9664c99 100644
--- a/drivers/staging/rtl8723bs/hal/hal_sdio.c
+++ b/drivers/staging/rtl8723bs/hal/hal_sdio.c
@@ -39,8 +39,6 @@ void rtw_hal_sdio_update_tx_freepage(
 	u8 RequiredPublicFreePgNum = 0;
 	/* _irqL irql; */
 
-	/* spin_lock_bh(&pHalData->SdioTxFIFOFreePageLock); */
-
 	DedicatedPgNum = pHalData->SdioTxFIFOFreePage[PageIdx];
 	if (RequiredPageNum <= DedicatedPgNum) {
 		pHalData->SdioTxFIFOFreePage[PageIdx] -= RequiredPageNum;
@@ -49,8 +47,6 @@ void rtw_hal_sdio_update_tx_freepage(
 		RequiredPublicFreePgNum = RequiredPageNum - DedicatedPgNum;
 		pHalData->SdioTxFIFOFreePage[PUBLIC_QUEUE_IDX] -= RequiredPublicFreePgNum;
 	}
-
-	/* spin_unlock_bh(&pHalData->SdioTxFIFOFreePageLock); */
 }
 
 void rtw_hal_set_sdio_tx_max_length(
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 79dbca1b5525..9119a292086b 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -529,7 +529,6 @@ s32 rtl8723bs_init_xmit_priv(struct adapter *padapter)
 
 	phal = GET_HAL_DATA(padapter);
 
-	spin_lock_init(&phal->SdioTxFIFOFreePageLock);
 	init_completion(&xmitpriv->SdioXmitStart);
 	init_completion(&xmitpriv->SdioXmitTerminate);
 
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index 8ec45ba0dd34..3f37d91ebf23 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -255,7 +255,6 @@ struct hal_com_data {
 	/*  SDIO Tx FIFO related. */
 	/*  HIQ, MID, LOW, PUB free pages; padapter->xmitpriv.free_txpg */
 	u8 	SdioTxFIFOFreePage[SDIO_TX_FREE_PG_QUEUE];
-	spinlock_t		SdioTxFIFOFreePageLock;
 	u8 	SdioTxOQTMaxFreeSpace;
 	u8 	SdioTxOQTFreeSpace;
 
-- 
2.55.0

