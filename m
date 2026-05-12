Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895022DFA25
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 01:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778550307; cv=none; b=F4kTBZRHkB7Df03PdySBknsHu+H4VI0N+FjzTRxL2bROwQP1I+Oi/FlFEYRmU0bjY4Cb2qpP8Pi4Z4/ddBsdo8eikeXbE2qVEsXNrofyCO0+7zHVlnOCE2XtMQOGwT2LlsOb8sSHkV0S0ibpNZbB7UE28J3zgQqIO/VxtN2e1e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778550307; c=relaxed/simple;
	bh=KqTQRneBMfvDtD0NGh/qnie7L+jkNNCpExxYKyw+jhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P8/MWtggBONt/h5wrkECwYGFJBbzbpwbxXVtBkquu+BzmEFtTqXV9al9F6d65sEuu9y/Q537NVCC2Tmkurz8DfvkNgtnSp3Vf1Sn0qWWhM/BG7EATHA4WPkA9WME/b8LIqdf7vNZTZ2A3XzqoKdQI0X83lKHFfZPPiZqoiKQTqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mPM6N9xN; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mPM6N9xN"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2f36da5c8fbso4880889eec.0
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 18:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778550303; x=1779155103; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yt10RUM2UXri9I9UIGCyRKsgv2xs4QwM0yEoyhATCiU=;
        b=mPM6N9xNQR6tZjE1WKObTQfCKiQE53PL7RrBqy/Q03ilN9mdBQqZUCkBWQrXb6+ML/
         /q5WPQVk2WCX4+p5UqOaO5BMrE4aKOd/gwPMHSCmn0PWZg2cPXj2itTlwkRj2fYRFQ8u
         dSzcohahIr/bpFYG4SRQ7kcaQEzFLtgpJSthUD09CCDrtRMF/RBax4cr3obxpc23Ubbs
         P/DEUZqtLogTbQNt6zwIPqPwj0MnkF43KSKHDlJ/gjzso2TCTJilsUDvfoxZiyq1QnMa
         wI/7h8JM40t3lpRsMa2OA/29Ot8YxZqI2MCQY399xYApFKs5Col6ePDsu2PfVxi51mhS
         07GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778550303; x=1779155103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yt10RUM2UXri9I9UIGCyRKsgv2xs4QwM0yEoyhATCiU=;
        b=jnEUG5m6Xjos5PmtX7qHXPhBn3aiVu6O70aGZxs/3SplEX11sdwtLqRneePnLmQ0Ag
         IPgd5I7MGyATc/AepVC/bYP89Ig+OhGof5Bv7b+m9yh9+s+Ztfh9Hpl1JqHxAKtAV24R
         SF9SLDc4QcYZlNQkIE1YDAJ7KtnkviCrBaLW3meXfZBQewmhRhO3+uUSmxGb7D+THV5W
         TbGCch9OSsFjsVXBpwve/8kCY66mu3H6TWp1KT0FXIffo2kcYUFYcSPEYgJNagHucZv3
         Xax7JBq/dvBq7hA0BFtezBVWQWN9uYN69R9MR2L4FrBYYmgcU/HaHGOHaxzxAP5dVwja
         8oZg==
X-Gm-Message-State: AOJu0Yya5RGkvhjZx+wn2XirdrOcMX1Fho77tWs8Oi1eaGBXulUG3QRF
	xsz4BKSGPskcwhXrNg/HskBKqFZPF8NMapXSKNkFTq7wOcR2RFcNZwBI
X-Gm-Gg: Acq92OGKnwsmv+Wu+Ud7l0nYVQrPrlOYBotWaJSj64M8E+vpXPU5GvEivJhkKq0+7lR
	7U1g18WkRqWl3rPgvXgpjNgQ0o/dRpMpVQNgu/rWGIz+VEK3NcFoom7GjAPza0w87o1eqoRzQJp
	JT0i6v0YfSZZFOnOIBYaCDPlXkbZcJHfzYkaMh2aGro/sj+P8lTJaNugAUsPEGyUs08ZF/+qudt
	Y7luh6qJmpC8812mqyBUmfnQGK/+/jkIt7MzfpN0WmuXtV060eDy9pFxIWhoAruIItLDXS8uJHr
	fbpawmLJWOhM0HcDZhp6wE1/X7cWkpXfMwugh31yQx4Jc22YGSVYJBpUdM6jYeHmEXk/0E7q54r
	0uPLyxQLPgS5wOOaxHO5o0P1hfRwJNukihSjT7zbgwxsn+z2RVoxcIUgFfbL0NayMkhhEv8n5LS
	RJ8a1WtIaI9SKfdA1zpbJiRqiu6eHgPBmjpA826D5njVUT9ogOyFqVWf1sGkiE/ymdY9fPq/bZW
	eCKuHo=
X-Received: by 2002:a05:7301:1f18:b0:2d2:c60d:4fe5 with SMTP id 5a478bee46e88-2fb4b92173amr5138362eec.6.1778550303413;
        Mon, 11 May 2026 18:45:03 -0700 (PDT)
Received: from localhost.localdomain ([50.231.3.67])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e4016asm15816499eec.28.2026.05.11.18.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 18:45:02 -0700 (PDT)
From: Shayaun Nejad <snejad123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Shayaun Nejad <snejad123@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: bound SUPP_RATES IE length in rtw_check_beacon_data
Date: Mon, 11 May 2026 18:44:56 -0700
Message-ID: <a56d8fa71dc6843e5096ce69d4c216c0ca99a7de.1778550157.git.snejad123@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1778550157.git.snejad123@gmail.com>
References: <cover.1778550157.git.snejad123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_check_beacon_data() copies SUPP_RATES and EXT_SUPP_RATES IE
payloads into a 16-byte support_rate[] buffer.

The IE lengths are used directly, so oversized rate IEs can overflow the
stack buffer.

Clamp the supported rates copy and the combined extended supported rates
copy to NDIS_802_11_LENGTH_RATES_EX.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Shayaun Nejad <snejad123@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 4b40124110..363ecb02b5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -873,6 +873,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		       &ie_len,
 		       (pbss_network->ie_length - _BEACON_IE_OFFSET_));
 	if (p) {
+		ie_len = min_t(uint, ie_len, NDIS_802_11_LENGTH_RATES_EX);
 		memcpy(support_rate, p + 2, ie_len);
 		support_rate_num = ie_len;
 	}
@@ -882,8 +883,11 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		       WLAN_EID_EXT_SUPP_RATES,
 		       &ie_len,
 		       pbss_network->ie_length - _BEACON_IE_OFFSET_);
-	if (p)
+	if (p && support_rate_num < NDIS_802_11_LENGTH_RATES_EX) {
+		ie_len = min_t(uint, ie_len,
+			       NDIS_802_11_LENGTH_RATES_EX - support_rate_num);
 		memcpy(support_rate + support_rate_num, p + 2, ie_len);
+	}
 
 	network_type = rtw_check_network_type(support_rate, channel);
 
-- 
2.43.0

