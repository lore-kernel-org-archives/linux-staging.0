Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64E13A1E6E
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 10:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772100282; cv=none; b=SoobAZrXjqlscczTMa9Lb8KyBNNf5VrKuL0Fm5duzDyiw8JZprsv49TPEHmXY6gbADOLE7PXSo2f3OzhZf3IGrpzZGA4zz+bAMlJJiaB3kiKKLtkz+k9feK13PbfdP2ZrNK80j89qseOORDunkWy/ZUFN9b0Mz+hwwM0CIT7jp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772100282; c=relaxed/simple;
	bh=/SZ7TqkJNnXb9HCDfDqMYUOiB//YyPI2lYyHMbMTDlM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UdVdDzm2G0K7DqltThxoYykuCoCAKseJ5d5av7jeEEhy1QarhrR9JFWv88hJZoB9AfuZ7mFXn3svz8JrCHwcjqEjO4dI6/Dn2v9VM3zxIea6e/ge99PECOozx5BqSAc2pMROY9tcXboYc9EdGZxXOLdc8s1af0FQsR/ywKWT8Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNMUDpPS; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNMUDpPS"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43985ddb926so38468f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 02:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772100276; x=1772705076; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4o6oSMnuuESU2OX7qJER0/PavXfFgjnccue0zgkFS4Y=;
        b=LNMUDpPSNYsxFvyMPqOwwH0sAh3zZ0c1l/hVpACcshb7I9EtGI7/pWLmOBryhd/Eac
         blgOiRQWT95ejrocpoS5KpY1aA+z1tC2E9tf3h5QXnl9fh1kl2lngQ17j9de5wFbyGSS
         ZB2TQ36Ei8tJ50QFG/jrpTHSqjne2y0R0UB2wUOdOXAYsNaFGUFYp6hV4k1Kt4i2dseb
         pEQ/KtpwOLZQzlwmLEAAc8jNPQwUN4nr6F4qy9wfh2YgAqcHwgdSAZypr7CkOwgdMH+7
         3o8jq+Rngp9S/T/OiVdWJmgpjgMvkqfGZOzL0xrlugWk660d8DwL1l3/qsoQAGIKMg1r
         rsag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772100276; x=1772705076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4o6oSMnuuESU2OX7qJER0/PavXfFgjnccue0zgkFS4Y=;
        b=TBhKfC1O8lscem9L+6sKKL8hPFNZgXJFZD76Wcv3GvaF23GqFAu/sWVfbABpYVgk0F
         IopS2Lw8NbCAI0I4TltjmxbuvVgQpN69ECyIiWm2WDPb0IDHaky6cwRYvNsL60O74oKz
         92BW2nW8DCyszY0Zdva3NVXCjwCQhHIYnXifuMWHOJj7eWY6uF46o/5PT9rXJH0rTuwu
         FJSw+a3l2ulAQYOCTJj5tJv468BOTJXy6DMysp5tpgpQwFyZPLPv7yMUO2K93cGzCJ5L
         V2xqczqhR9+NRQx8KX+VZGJlSUJcu5NNv5xkr+z8HFTyxT4LBzmvwImbh0o8BWx9XmSR
         6+zg==
X-Gm-Message-State: AOJu0YzbCMaHY4yefGUgaQeCel15WyItcWrgqa0xjd/jGuSYZv2ccDgr
	qX8VOueCLGiHjwWnfyzIYex62c0jMs+7R7w8nagA/c+nFjKozX3VLvvB
X-Gm-Gg: ATEYQzwWSH3yj5CDWx2ODeEmTYKXhT9KJRZFydbu8JWq3xcnUvPE3IT2lIYfYsYyK6P
	89M/gSf/HHgeceXnDlH5PcEsDoUZ5ZsVXTpyDE78W/Qr/pBy5M0TRiCB6F/Okp99FY3PDUQD9rr
	JNsHk31w3r95GC/wqUldNuzzObvfdqe7AzqDXeeLTw2Ni9sTSpZEBBiF41V8vevvvRxmtbCVDqN
	exhyfTnLoycNLp4c0yY4o2aa4kZ23fK3w4b/uMqJviRE0V2xzfcJNaOaI/xnjKgA0oTdpCgMubZ
	emaczcCYKD6usRkCUYxVHwxnpQ1g8oD9Fqn11qB0H50KyyaTxhASQu8WVFVBLF13mym4vKehbS0
	7IMW4yaoPFpMOLH6QofrpZIVVa/5tbrFVdmUydTvG5Q6qOXwIWKuQmJHzgGOEz4E9cnZN/BbfqE
	vBMGoa3DPk7dcaiP5xkrpe8Y9wF1uwiOcEsDDzW6DJsYuGtSmYQsNUTcjsdAXTcv+U6ppRxcrZx
	/4ADPD0tCJzCKv/xICd18EwO+YXhwS/60I/7Ja8lBJFVov1B3sN
X-Received: by 2002:a05:6000:24c4:b0:431:6ba:38a9 with SMTP id ffacd0b85a97d-4396f193fc5mr18704330f8f.4.1772100276007;
        Thu, 26 Feb 2026 02:04:36 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43994da2584sm7127026f8f.12.2026.02.26.02.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 02:04:35 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH 10/12] staging: rtl8723bs: remove unnecessary casts in rtl8723b_cmd.c
Date: Thu, 26 Feb 2026 14:02:54 +0400
Message-ID: <20260226100255.167059-12-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary pointer casts in memset(), memcpy(), and memcmp()
calls. These functions accept void * arguments, so explicit casts
are not needed.

No functional change. Object code verified identical before and after.

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index af6cdda8238d..32a0e90a90cd 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -78,7 +78,7 @@ s32 FillH2CCmd8723B(struct adapter *padapter, u8 ElementID, u32 CmdLen, u8 *pCmd
 			memcpy((u8 *)(&h2c_cmd)+1, pCmdBuffer, CmdLen);
 		else {
 			memcpy((u8 *)(&h2c_cmd)+1, pCmdBuffer, 3);
-			memcpy((u8 *)(&h2c_cmd_ex), pCmdBuffer+3, CmdLen-3);
+			memcpy(&h2c_cmd_ex, pCmdBuffer + 3, CmdLen - 3);
 /* 			*(u8 *)(&h2c_cmd) |= BIT(7); */
 		}
 
@@ -133,13 +133,13 @@ static void ConstructBeacon(struct adapter *padapter, u8 *pframe, u32 *pLength)
 	pktlen += 8;
 
 	/*  beacon interval: 2 bytes */
-	memcpy(pframe, (unsigned char *)(rtw_get_beacon_interval_from_ie(cur_network->ies)), 2);
+	memcpy(pframe, rtw_get_beacon_interval_from_ie(cur_network->ies), 2);
 
 	pframe += 2;
 	pktlen += 2;
 
 	/*  capability info: 2 bytes */
-	memcpy(pframe, (unsigned char *)(rtw_get_capability_from_ie(cur_network->ies)), 2);
+	memcpy(pframe, rtw_get_capability_from_ie(cur_network->ies), 2);
 
 	pframe += 2;
 	pktlen += 2;
-- 
2.52.0

