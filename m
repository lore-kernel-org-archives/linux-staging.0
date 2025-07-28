Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46A879DA
	for <linux-staging@lists.linux.dev>; Mon, 28 Jul 2025 04:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753677086; cv=none; b=M4+04a0RU72I2qC8Y3BIrs723oAYI5HU2Uyb1eBQYA2UkZk/Z+HyNnKmki2MTmYqWCs4eM8kxae1rvH6G2yW5INW9EVkFBepqV15hPQ9xUjeXkzwB5D3GJndUXBjHcd9CQnUYw43wEimvScuFtssLAl0QHQHpc+Q6OKSIad71K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753677086; c=relaxed/simple;
	bh=tDWQTnaOByEBiSkO3FvdLGPrQKPyATsUtvQ/bjuirZE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nos9Az+C6Gn75RwMm2ffdLMCwIwRXInXgeKIF67J42zahgubi03BP6exW7cWmYwk5T/XA4vNm+KCPZPHfnabcuucb4WSQvAJLbXdc3DavOYXwu4m6msDKZaSim8ycTYxlM8jA+g5Vq0CyCIevACQoO9rP6M8v1mIdAOjaPzlsJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vb0nu99/; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vb0nu99/"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4ab6e66ea68so46541271cf.1
        for <linux-staging@lists.linux.dev>; Sun, 27 Jul 2025 21:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753677084; x=1754281884; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vXztVcGyYhcXEUuh9ymdxD2mjy3D+/Xbd03h6w6BTCI=;
        b=Vb0nu99/k1ds1NDk1TdaZ+AUdEkR0e8GR8ngQx8ra6ODrWb+P72ve2JPFGLeu5WeQD
         7/40XOy0XWs52rdE8TihuD2sgclUDQTr6L6/SvaFB7PjmeTPEzgJ4VV3KfCJThdwixq2
         BKsUaWyTNpXJUqPyza2htTL8GKOd5HwtXUjIshRggtnmtie1GaLxHxHpFhKeBGSHCCuk
         XhdFJIIJvKU7ofmKzaAjQODVFR4AhYZfr+8IV1mcAHnIp9/OgmlczET8OoJdb0sBXQTm
         MmcW3wPh6Ae62FgjmbZIhg3WW+QeDh0HggKMwzM8wpoAGC5CJGWMU17ZmMFk62LHsM/S
         X6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753677084; x=1754281884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vXztVcGyYhcXEUuh9ymdxD2mjy3D+/Xbd03h6w6BTCI=;
        b=ukF80/L67hmk0zwbBeXnG6vPfvEdl5T3EZoIQ4ss8udibf+1TFmbYuzTNmx0+Nslfl
         v2opSklrBe+SqyyFDLzZ6mMFyIRGgKQR0lNqDpjAxbQNi2iNBFhnF2Rg144cSHB6uy2u
         hz1CbMxInfmJf992jdtTRlv7ExSZuBWLJy80+cSP4mkZNnjIC4xL7GFCGiIvxHrHEPmP
         qzSR6JVtU2nOk2p3vGB1S8LWvCFiGR0TiKb2KdMTOMIn9OG04us5gMWhZhG8OeqnDw7y
         UaQnLy4v+yp6yqf+PpQLFVL24gzc+YCxyD4EzfPC6rj1D5tD3RnVcKp2QD6j2HAi1j0g
         Qo8g==
X-Gm-Message-State: AOJu0YzXUU+XiVd5Vk5Nks1NlnpnYQMYCX6pJtPWY+BztPPx4xJ+UR3a
	LA2b7BWeQRwVvKoUijxSD9Dqz5LoSuvn8wtRImG76qO03P6t0ri5CTD/
X-Gm-Gg: ASbGnct4m+N1wig4zPIz3wPyskjZegKk291hnbJad+Z9QrTIOowDj/jmYe/yWnBZTJE
	7aWUMNQomxs1v6JJSjAKRg32niKBTZV85kDfX7ZShqD7s8gVf72H9d0XrIJnvz3Bn8cdz3wHUiX
	CdTfoZn17N0yWinQtWnXRf4Z8icZ5/JSg3BNOwepQwY3dFIp8Lnx3C5JuNZhB5fU2rzhTaAJzBS
	EMrcdzp0jftAfNe3lDxTTLe8Q5EaHnXgKRhEyLB8g+KBf1y/2sXzy1hqWPkF8jI1mVzXOkTVR5v
	pSoqhuvjdeH9LBQbeuz7LWvIZwuAnhWVAPIPzkXShSOhvuJw2lMdWfPl4/jEfEkf9ukFGW5A5lg
	2nj+0KM462MbF05j+Fvh9kgPjDmTQchpSnwkGK11Gn96Fuj282Lo=
X-Google-Smtp-Source: AGHT+IEuaj/hPi4fHDRk7jCauFbtFmTNDcAzE+XKZj1VAfzLfZ0YnCWDMLexJ4CVO8K3LbusoaxMXQ==
X-Received: by 2002:ac8:5ac2:0:b0:4ab:83e5:f2a5 with SMTP id d75a77b69052e-4ae8ee0ee5bmr124885601cf.6.1753677083436;
        Sun, 27 Jul 2025 21:31:23 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ae9963b704sm29720841cf.34.2025.07.27.21.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 21:31:23 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH v1 03/20] staging: rtl8723bs: add blank line between rtw_roaming() and _rtw_roaming()
Date: Mon, 28 Jul 2025 04:30:55 +0000
Message-Id: <20250728043055.421820-1-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a blank line after the definition of rtw_roaming() to separate it from
the following function (_rtw_roaming()), improving readability and matching
kernel coding style guidelines.

No functional changes.

Identified using checkpatch.pl.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>

v1: Addressed review comments from Markus Elfring on changing the 
    description of the patch regarding readability and separation between 
    function definitions.
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 24e505111f1f..b1a427a655ef 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2449,6 +2449,7 @@ void rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 	_rtw_roaming(padapter, tgt_network);
 	spin_unlock_bh(&pmlmepriv->lock);
 }
+
 void _rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-- 
2.39.5

