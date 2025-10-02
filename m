Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5833E27603C
	for <linux-staging@lists.linux.dev>; Thu,  2 Oct 2025 17:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759425844; cv=none; b=kso2HOUoQCEfutMjsbKQE/2w/3rQ68z3FpKxPKNGtzLCxLGFOe4w6gA3T9iZiXcGJm+z1U1P7FNrSdZ+lF18pg99IyvCJrUbyCjIT9RysRehUkwoe4F7Asc2ZBE5KHKxNMSxiJxrwMrBmuCdqZ+bZSTykSaUvp9rTGWDExYY+J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759425844; c=relaxed/simple;
	bh=Xq5inIJK2vQ2shTwCNZCBfAF6a8VsTm/tnUso0yKW4o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qy8oh7u3Lc69WIb5ywqW7UptVhKjUZTfR7D+kVbdFuHAMrBihScX2bODr4e2ShX4/ug2ebhTnSUmdFK1EvzA3wjFHg0GzcQjPaUD5ueRI3D7X+Hu0xoIUK9eR/tOTQIl31FGA+x/qQMYNcoV3i2y3kHB08IjQNloG1DX6s1osV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WSGMKuJZ; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WSGMKuJZ"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4e4d9fc4316so15596521cf.2
        for <linux-staging@lists.linux.dev>; Thu, 02 Oct 2025 10:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759425842; x=1760030642; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQfGyuA4h2BhdbRuM3F0j8bEgiT9wVaAoWNs8W+J4yM=;
        b=WSGMKuJZmdT9cB3hkuFVTXpkITpauo4qp/57l17D8COJttnfZ7kznajE3ELutWmr1a
         65LT4panLx8Cdsuk5n0tr2nol9Vvkt1CQUfLxoZ/YZNbb4K6RLU9K2VZ8MbhGj2KT3VX
         dMObraoHru7nZHZ9gDmbN2b+XWcgZlxOtK/cpYk7S7MY7g+YfjJcv+udL4PtOq4j1tT3
         ewoMsaCnyLkQtkQAdQHsmGRQ2zu+mtAYC57uGX3My94OA+smEmGzR8zYFD/PFKqSVhxb
         JcZ3MINjLrnxHixUrKSio7DQZ0uOYqs4e9yX2g2wz64yKyPe6TjhXhxCp+T/m4Mf7eY/
         zEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759425842; x=1760030642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQfGyuA4h2BhdbRuM3F0j8bEgiT9wVaAoWNs8W+J4yM=;
        b=UrXK7MSc0gLl5nZ0ENZ2waCd7Pn9eyMPK0BA8j3NE0JFD32ev7fAhJj54Q1wTXUF4i
         sxao1HXXgHzgq8TbgrfyzPoX++wqaKhRCazc/EchDP9/ZH7sRBvZEl4pcvCKueuvIeLq
         xYccMuFUs1vzejWB0MN/J66i3PxH+y5JDzowhGZyXne+PHosczvwf5Hf93sL745d7A4/
         mxTHCrEWQctkAA2R0PQatKuovl2hk1UVDYgB8YMqIYzv+gw4pFnOXzEJqBaX/p+ZC0ME
         Vzuoynizn02MnREZqp+3wIxqePhvRVp0b/DNvdNbkl1eZp+KpnagQlx6Krr6f/loUWev
         nyeg==
X-Gm-Message-State: AOJu0YweT8fw+vv1heMi2AXrCtqzmAQsrgqi4z42+FHZ8BCjWQwMtx61
	wDoPdSCdQxEqqO9+LCMzbTWF2+gShQyOraN/U/N03qjGygukqqPnBt9QkOY7Dw==
X-Gm-Gg: ASbGncv86uS8FbUbumMb4EnMFZ99XophVrVXnEPyGhF/OHfWnM5DbfGOetgl4W3feGz
	MW4hlY2Ryup28s1v74Z6EFXX51CnGCtD1ihjPLpu1j7vs1Ow4zmPtgnCplSr5RVsHdvpxuppF9c
	PAA5bY2ljAIFFxFB4yOuwJD29uqgVooYq7yrc2rQkKRc2KSQJfe1NXAcvWcOurhAkVDWItsK5Tj
	1RKXZ+M2+MnbDbxvB6mP02ao0THBKXjw2AmY/HRLdgtGWl4Q5qCRfnD7P2M8R3PMJerpsAHJlnN
	QbaAACtHgtVqrW4v5NEtJACGeOTpXLkbqtI5efOTTe+iz2JX09ckdluNoFs5QPntlFIF+nTtJyH
	qqcI8f4QC2GUvYtsUGQh3liXN/7zXf4tirJOQdA7v0mYwyjwt5fAjBFjm1Z/Nk/AfgBqASiXjxM
	0=
X-Google-Smtp-Source: AGHT+IGApgHMJg/nrekY9eF/PTEqYvnnAf1jYL5BRf5oau9AzMrpvcTid3LZDrvVzOuMkpUxqAR3sw==
X-Received: by 2002:ac8:7d0a:0:b0:4e0:b72b:7f6d with SMTP id d75a77b69052e-4e576a7df6emr1384981cf.29.1759425842128;
        Thu, 02 Oct 2025 10:24:02 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55cbd3d9fsm24504971cf.32.2025.10.02.10.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 10:24:01 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH v4 08/16] staging: rtl8723bs: remove space before semicolon
Date: Thu,  2 Oct 2025 17:22:56 +0000
Message-Id: <20251002172304.1083601-9-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251002172304.1083601-1-vivek.balachandhar@gmail.com>
References: <20251002172304.1083601-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary space before semicolon

Drop the extra space before a semicolon to comply with kernel
coding style. This change affects a single line.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index ac313ec06587..5d31684c7cf3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2236,7 +2236,7 @@ void rtw_update_registrypriv_dev_network(struct adapter *adapter)
 	struct	wlan_network	*cur_network = &adapter->mlmepriv.cur_network;
 
 	/*  adhoc no 802.1x */
-	pdev_network->privacy = (psecuritypriv->dot11PrivacyAlgrthm > 0 ? 1 : 0) ;
+	pdev_network->privacy = (psecuritypriv->dot11PrivacyAlgrthm > 0 ? 1 : 0);
 
 	pdev_network->rssi = 0;
 
-- 
2.39.5

