Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE0B21D590
	for <linux-staging@lists.linux.dev>; Sat, 26 Jul 2025 04:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753504450; cv=none; b=ZFa+ps+JOtV39lln6LQTiVnxd7s5u5O4e2jUqtrzjhHOA319xTz/pis5ewu4lMv0UmJWj/dCqCzYyVgp65Yi7s0XtHWdFbc+Mxko5VO9Os5HuMLTwrsrSPrWEJ0f+c2VpRwaTwd9Tinkoye51Q/3hM96N52gcesF5Q2up84FSsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753504450; c=relaxed/simple;
	bh=SD0zswV1u0CGmvyxeeBf8KvgCVotkDI4w0dpQTwrq4k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fw+6sb/Vchm2CxODMA0abMLW9VOWzl/qAW7TruZgj+mwk64KB+conKdWSxOdsNtd7+kzOug4V6UaKlj1QL+AqgPAF5t+sS96/oymPiElqk6E1BBo3CUKvWkfXQnZ2gQPIXD/t7D8jy5/d7+j55UpbUfruOfY8w6XGsJ4F7HAInY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jO33LItp; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jO33LItp"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7e6399d0656so142670285a.3
        for <linux-staging@lists.linux.dev>; Fri, 25 Jul 2025 21:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753504448; x=1754109248; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXnNS3kNW1BU5HzPFn0KRN0y0JHuPkxgBF0lcn+1alI=;
        b=jO33LItpcSuEKDuXYX5XjrYoc2twC5iGr/pAP6P3aMj13vnmYIDuGXZQ8BkRlHYkAf
         0N2mBzv+LjKQPA4RXbb7x/fq6RkgJS8bCyCMQhPZVsrbNgqs4RXFZToGwb42PrUwJH//
         0pGi/Y/wNlxisMuFrwEIDpuY8gu6U9bf+p+qFk+WhuuX8VE6FMUPc5q53+MvRqbTiWPT
         zv3KKlylESHxe2Cc6LE2dmUvHy6I6H36V/Asv44gm/SuaEfQKCy5Aj8x1c+gz808cklr
         eGiiMe+uTPyp4/LcUoSGNJLqoRV8rEdNS35CWkEq/cEQj8RJ3fLII4LV8LS+nXcMF2T9
         QE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753504448; x=1754109248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aXnNS3kNW1BU5HzPFn0KRN0y0JHuPkxgBF0lcn+1alI=;
        b=HGc5mAeFaOfyRxrXctTlZ/weivLdgptOHwGvfUTdOrrWc77ckqtwOnyae64/JCum67
         0c6lRi0H1mT0GDGSpy8tKuTSdr7JKtbnrkOyyfBy+m9CU8bKQ7cowDijVdMjS9oAoMr2
         GlGXy/68yqMO4HsdbReidUxDk9m6qfRM5WRNZpozCFbHfSxtYDK+X91XpvvMC6csV3PF
         nOOB1a1g1mZlnth5NUZkw6100MV3yTpLG0KLev0SWvlr8Ur2RZM22WqeWxJyQ6u/S+0T
         ERGrw47zpbLS79ec7vYkG81Vew9sO1bKK1784Ck10zQH5hBVx0J0dATHPjLu5tiq8MUz
         5Q1w==
X-Gm-Message-State: AOJu0YxB2Pf3eXbWP/g6tG29wmCjju4DEx1ZuZNtVCWSzoFcLpqX70+2
	Fq3j4kgPcxGTaiYzQzBzWM/0XPknpBRk2DdwPWhdpug7gIKY02Ss4w7r
X-Gm-Gg: ASbGncsaJ59aQ0UZrHCjKJ2mdXbAtbe2L982vzClCDaG4oP+DiKdnYk0M6KVBNRyWTf
	FSenCIv0DG7Thn+h0+rn+DSZYmXvokKgohjfKC9yq/KR/7WU5lrwwPFiv6h2OfRCBkq2E0Vkddh
	4i3mJyMFaXHNux6yvUV7q6kXOhaKa9r9tLltW+U5LAQT5o11AD1iqJ5FD1Bt8ir4IXDmRFfv49f
	Kgt++kGRhrUgyAxzamecvUNXsGl+0WaNH6HTrBL79tQnznDQlNJFt88EVgwZ1TLvScj8ePBZKzq
	OrX2a6U8d1KM9H5Zf55d+XTnpCInkIThQ+LKWpGE2QJVlhz9uJvSdVobPy39iFZecm2C028iPPm
	luzefh//owG1vFY1GcHMJ5X9udHewERgLZxhhQtW5Ge0u9Zt89Qw=
X-Google-Smtp-Source: AGHT+IEIljk5xUO365R10IAg9Spbt4O71JMQ50AM7dIBDTN/HgutLWOPav+9wvQdCMsgptojJINyRA==
X-Received: by 2002:a05:620a:25cb:b0:7d5:f350:e533 with SMTP id af79cd13be357-7e63c1be353mr449637585a.29.1753504447839;
        Fri, 25 Jul 2025 21:34:07 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e6432a885asm70322185a.36.2025.07.25.21.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 21:34:07 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH 17/20] staging: rtl8723bs: add blank line after variable declarations
Date: Sat, 26 Jul 2025 04:32:15 +0000
Message-Id: <20250726043218.386738-18-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250726043218.386738-1-vivek.balachandhar@gmail.com>
References: <20250726043218.386738-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added a blank line after variable declarations in one location to improve
code readability and follow kernel coding style guidelines.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 7552f7e4d14a..acacc2806dc9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1449,6 +1449,7 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 		if (adapter->stapriv.asoc_sta_count == 1) {
 			/* a sta + bc/mc_stainfo (not Ibss_stainfo) */
 			u8 ret = _SUCCESS;
+
 			spin_lock_bh(&pmlmepriv->scanned_queue.lock);
 			/* free old ibss network */
 			pwlan = rtw_find_network(&pmlmepriv->scanned_queue,
-- 
2.39.5

