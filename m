Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E251F5423
	for <linux-staging@lists.linux.dev>; Thu,  4 Sep 2025 02:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756952118; cv=none; b=mkB2m7VaYd9MW2//NX+kVns6xJSWwwO3Y0Owt2/elxkKg9WhDpkKKRLSdUWXCfsUbLhdHRclr32N/G8xTEV3lK8sFOcCBQBCHZYJiDQl+kkp7U/icBcmbH9DEsdTeJZGQ8Qd6g+0UH7CRjVjIahiHeZFDlw4aXuVhy+5taQiUZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756952118; c=relaxed/simple;
	bh=8er5g/JdtGmDLwAxnKtTLLBjMA31RvembXwPpxkN0eY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T1ntsjmThUdv6bx9CBQdkaTTxV424o8LGoWGIAHw/PK24Bl6D76Wbmn4L3Pc4vKnvHII1uc59PxY0DB01/Qyo+iTaBVACx2LSj0qbL0vEBmf9pAz46GBB4T+02zis23iD6HFXdmmjfRZIaOhP2iTcE3lUP5mj5rxjX3pJZfWiMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGrWHCfz; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGrWHCfz"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-724e9a1812bso4755126d6.0
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 19:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756952114; x=1757556914; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNzQSvDGcgGcsxPnJpDh3vO9RZGdTNfhmCnJqVlYiLo=;
        b=YGrWHCfzSdi9u7bL/Ocs1jHiaRuAyTk91sOCf3pdud6SuD4k4vJmkmX+fIOMB/9LF6
         GYoFvocBuq68nzkKVg5NBUYJ3VFGcqYO+dI+z8Y2R7u2WEHvU2vRzoSmpy+40A/x/7Qr
         A85mo6DRdAtvr/YvuO7Z9sMAk/2D3YvmY72XQYwy1vzaumcyCgzoFQvbBgOY+uctIYvb
         QYptDV7Ei5Wgl7B4n7E9xoi4c+at+xqqlRoQzd/QeMSUjoXk/Aaaj1EwhIOQNRYrPLRT
         uNInTni2rLPpFOXm8yjyN8bUhpzkt149GpDXKE61ZrLLzImIzZDs8cP0SyH5t6tXFYw9
         FOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756952114; x=1757556914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vNzQSvDGcgGcsxPnJpDh3vO9RZGdTNfhmCnJqVlYiLo=;
        b=xJJXIElVpQrS+Vyz0ZpOdiucjaFl4CG1flJKIQvHWoypVahKBOIAOrVYP9jLPzybBv
         uMGDyvcAk4msItb6By/14A9frIQBdwG1Ka5Xi+3MVCyb+AJ4FNcUuZH7/cP6+l69VQC0
         6SUsJXUpDOVC4XN7rwDhNjUUJkIELJkzAal8ibPN1ThNYF6WDgstDCWctnOIKwzEdMNI
         sySMPEI/LniASv7L3H3y7MS2z9k7y+YzozXAY8b0zwG6uUkYi4Ik+cwwsWF/bUXVk/c+
         6Sa2iXg4uyp7/cFAKuM0xMr3QBsuHWb5qy5Thh6c1mmqeGbpXhq+dAZ3GyH5pCv6BMU9
         UW3Q==
X-Gm-Message-State: AOJu0Yz0Fw0NRG2g+xSvCcST+/f6HAydnRSrpPboJ3VMeKE6Gr9ViodY
	Jh9FVdOPj3VjSJ9120kkGWRKdQ8xasB5WK3UaZstNzrPifTw10uy1ujH
X-Gm-Gg: ASbGncvQnhVdk1Y5HzwnZ1/TGUlS0xwUpvgqFqdubu9Kzypuv+PWePQ7sLDE9/A3yjw
	SAMQuziRZSIRL/wgmY8LWFASmV0ZOBnKwE5gJEJ8V3j7w9MPAtRF32e4LQoYr1rcqFkawgRL3pJ
	hmdc864N3GBAavOzNHokKyFaqArL0SwB2Z/LnnyoopgTZwkW/WJvCIkffq0dj8HvKHaesx6dxyZ
	ku+7A/Z2/4njsSLE5Ce4KPBlsJy96UjcWKacZ/XwDd2hUn714gKKVVxhCYYIoGE2Ird5hOauhAw
	N0ksJNzSK3nzpssxMd60MTPrKGm5sjvBALwM2XGYYh0ciijKVDoXxDJgOtjCfXdKpi999zpQs5B
	ZzAEc8p1BFhi+9k/ZYk1YVjRoh1DTaW7atqKD2HVm8i5epO4jsjU=
X-Google-Smtp-Source: AGHT+IHo7xXjUVODo9Ez10j7toTQhtdvMKS4OhVCgEvCdMIv8BCF0VAwky/AFMCNc4z/W12P3DF9sw==
X-Received: by 2002:ad4:5c63:0:b0:716:9f19:88f7 with SMTP id 6a1803df08f44-7169f199f20mr209931666d6.4.1756952113683;
        Wed, 03 Sep 2025 19:15:13 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720ad2cb78csm37714076d6.19.2025.09.03.19.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 19:15:13 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Subject: [PATCH v2 09/16] staging: rtl8723bs: fix excessive indentation in nested if statement
Date: Thu,  4 Sep 2025 02:14:41 +0000
Message-Id: <20250904021448.216461-10-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250904021448.216461-1-vivek.balachandhar@gmail.com>
References: <20250904021448.216461-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adjust indentation in a nested if-statement to match kernel coding
style and improve readability.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index d05ff073af2d..a2b1e34765ac 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1254,8 +1254,8 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 
 					ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, pnetwork->network.mac_address);
 					if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true) {
-						if (ptarget_wlan)
-							ptarget_wlan->fixed = true;
+					    if (ptarget_wlan)
+						ptarget_wlan->fixed = true;
 					}
 				}
 
-- 
2.39.5

