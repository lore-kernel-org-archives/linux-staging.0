Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEFB36B07C
	for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 16:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783702364; cv=none; b=gGpT+HsxSozFFy6IXTg9d+WWChwUoxWRWbDGPuNy/giW532kTmHB77DnviWMWhA2nS+wM7ypnRm3vJTlebEKJhLGahBdrsgKNy5/lKrG6Pm9GJfJp+PCRhQDlnHwjf+8NHUPaJQsvTSCphPrrzV62Ax2sHS+PlOPa7iodVr751w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783702364; c=relaxed/simple;
	bh=8pyUv25zKE7S2uFOSY/2t1zvSarYNAWhIdkAGjwvkTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k2aPJdwz8S/8OFY3adw2Ljipnkeuy4OYvhzXtaZ3CzkBYLhmEjNQyFZeGzMmsJbi3C6R5ZtMvewZ94mZ55uzjGHyVbxCxGsiT/QboIbbMfJ8Ku2UsGMD6DO0i6PXklStnZPPMWisUKNCpdc73t7Itpfx09ZnML4p0ohCkAo2aoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RG6oTd+k; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RG6oTd+k"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c15b33f7b23so157215866b.3
        for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 09:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783702361; x=1784307161; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GjvNb+SuLQU+k4gQh/DGVZjULka+FHKmKmkfJgWo8eU=;
        b=RG6oTd+k3suwPmRIgazqnAkiTyEsXA539wEASjMgOKGQ37vij10klNoreIfi8yuvcO
         mtvLXyaZtt6HZPAIfHLI8DEtrs4zAIxrOCDOFi+qAGOooK4VKgPnIVknDE8JgFKScimr
         RiIaoqrxL5Hr1Sx3Zcks1Std+C5TvsNHsSNZ4wZCdmsUVNDqlF7qtWlI0d+Ilz93l+ml
         BFuKD6EylvJWv14c74MJTGUG3hL9tCKeIfhw+Qmn4TCkjZggh3eCS5fv7Yd/hIEfBEpT
         eU+WG9/948DR5iiH1NpAoKJe048mzCzoHPIYDNPwKR4NWK+BKBY9A98q80t4+UUTNbuf
         38FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783702361; x=1784307161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GjvNb+SuLQU+k4gQh/DGVZjULka+FHKmKmkfJgWo8eU=;
        b=FlzH8VDqn/AqWpBjxsIounLyXnARV+qjcwfXlUciH1Sc0v6YsrZd40HDi7eKFuUQt/
         UxdeqUmo2qYTwbhdaxhYGAdrPMO2Zt6uCQIvXa3nBx5uCvYGg2GuiggyL2gcaACeJ96c
         psn36h5MPYuRN8t0e3U9k1blX36EPtB67uckzga3tTVVb+TugQqFD7GRRxSH3znMzmjd
         fYUk120I/pWbBpVtfqLEyPJD9V+4rxf9YWUNn3my78PiBw67KIA7f3zqp9B8y9I/sIQe
         3oNgoYL6L/9EHzrMsjV8s/okfXAKeKDs0MRAap5lQcS1ec6Gvf80rkDI4ghJeJwHbVJu
         ccBg==
X-Gm-Message-State: AOJu0Yw9udDNF/xdWePTpqwYor7zQb46FtQquUSpQSYvCua/7ww7aPXf
	593JJEQMLgMpOIXPDL9I9bnaa2PkPlvnj+JPv7X6SON5zkb1otguTKILLcz7DQ==
X-Gm-Gg: AfdE7ckHhF4VZ7PrDptfSX4AjACeJPALEb4KB5JzwbUIzxJsJQnTKE+a12uAc5p190L
	NRUcnIEl0rvdg/TfFmQjg5k57LSj8XBghVsB/rU9i6bnUUnqxa6gY0oBO9td+WGZy/2B3ufDBJw
	z5ua9VaXkCkugMt+jI2LUKFShEYnkh3DtNOon3DJNkhkWnNN55zXMU0l56EmWyE/5r5ziYtbj4t
	V5kDIZhfXZaMGm29LYBD4ngPzZ+Xg2mIcBkTU45AwqIm3MqOBnAy29gID/fwjRzbuv9dxS/vaVS
	haDcoZNNP3aIvDCAn9tvMG1vw31+9lnQv98rrxYAm+ANToESAL5gLqq0z+0RxJDVZn7EXQHxWMi
	8Y+8wxomzxRSgVG5DBLYG4ee5bI0PteVoD/gUl/CfXMxa2yFxvpxuFp6YZoQaNsFVwISFG9l7Yc
	BvpCzzYRMr4w==
X-Received: by 2002:a17:907:3d12:b0:c12:979c:5a5e with SMTP id a640c23a62f3a-c15cda428admr599042566b.0.1783702361422;
        Fri, 10 Jul 2026 09:52:41 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad694736sm643050266b.0.2026.07.10.09.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:52:41 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2 5/5] staging: rtl8723bs: remove unused 'bTXPowerDataReadFromEEPORM'
Date: Fri, 10 Jul 2026 19:51:12 +0300
Message-ID: <20260710165220.68599-6-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260710165220.68599-1-nikolayof23@gmail.com>
References: <20260710165220.68599-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'bTXPowerDataReadFromEEPORM' field of the struct hal_com_data is set
but never used; remove it.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 3 ---
 drivers/staging/rtl8723bs/include/hal_data.h      | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index a4149ba47069..3dac9a8fe5d8 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1182,7 +1182,6 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 	bool AutoLoadFail
 )
 {
-	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
 	u32 rfPath, eeAddr = EEPROM_TX_PWR_INX_8723B, group, TxCount = 0;
 
 	memset(pwrInfo24G, 0, sizeof(struct TxPowerInfo24G));
@@ -1214,8 +1213,6 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 		return;
 	}
 
-	pHalData->bTXPowerDataReadFromEEPORM = true;		/* YJ, move, 120316 */
-
 	for (rfPath = 0; rfPath < MAX_RF_PATH; rfPath++) {
 		/* 2 2.4G default value */
 		for (group = 0; group < MAX_CHNL_GROUP_24G; group++) {
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index f4d4127ed5a1..df0c3248a4e1 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -165,7 +165,6 @@ struct hal_com_data {
 	u8 EEPROMThermalMeter;
 	u8 EEPROMBluetoothCoexist;
 	u8 EEPROMBluetoothAntNum;
-	u8 bTXPowerDataReadFromEEPORM;
 	u8 bDisableSWChannelPlan; /*  flag of disable software change channel plan */
 
 	bool		EepromOrEfuse;
-- 
2.54.0

