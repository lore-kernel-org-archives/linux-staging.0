Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2F917A31C
	for <linux-staging@lists.linux.dev>; Sat, 14 Feb 2026 19:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771096283; cv=none; b=vCL8htQcoDOB6duTuja35OdsYieYaKV0NEHG7GmqdVaiiYecCdgNpbF1hTTj3zvHySX4tlQlzVfum5UQK+qSlkYobzMYQyHM7WPOAQAumtgmTxiFxr8+iCq2nKsKMDP4+d0asqVxXsWfpqmXoNYKdRqWkqz3y1QW1QXv73CRMRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771096283; c=relaxed/simple;
	bh=9B2Egbf7dtwqkIHtjljMMyLk7IUGw9TzHEH47vvOihQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OT6bxvdI9+UOiv42hhG4BQO+vN9WipRFBsRBkVTSnURKM04sWRzzNY5MLb/GWTZy8IZQUx4SuVZW0eVnYcItflJqEs+2RXkSSW6w5wWuINrmt58rZkir/HuCX0Mh4lnX1cokmdVncYoiBcRq7VtsqzSt8N3dlJnGdU9WZS92Rlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3qqur5F; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3qqur5F"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso14638295e9.0
        for <linux-staging@lists.linux.dev>; Sat, 14 Feb 2026 11:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771096280; x=1771701080; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZHkiJetbhp2ZuMvjE2YRQAndHJ88vRgBOSGUGX2bpo=;
        b=I3qqur5FdBRF1LkrHqGIqmgZve6VWiKeHVqFvheHpXJtS4Jv8afAuzb7LGDPZwPxtl
         2XHlxHwlOnKkAK8PvPHGQXjzUfG7TOBm+dFylBN0P5Rg8EamLvsXVxQge+FrH3EhGZwt
         YhUsmXmRCDBXlGfyoQBzO6F6ocCOGiX6CRyyNVzcCXtNSa9w4jJanI8MulfGcJJrNPsQ
         ReW8syR5lw4XbvDjDUdYQ3p4NofnDW1GsQ2ICGfIgHmgTSM9kFOjNbjwNEG9CINyzGAn
         5MB2SXbnEh8ru+rKz8jLxzy3rtgYBXTd0N4TKg1ohqKlRCspFnuHvPP3wa+RayRMkJZO
         Tr6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771096280; x=1771701080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rZHkiJetbhp2ZuMvjE2YRQAndHJ88vRgBOSGUGX2bpo=;
        b=tlM+aUL4Xe9CkK/vOlOwFP1eFCmCbupI1zFFNRAvDkIuHUBaQ2D1quSjG/mLFvge9L
         r+05khXQTBt2Fu2StXPBaFP8P8CYDnAGF3JGzKIKQNUoav9/h1hmu4rm6NfGlmNA9a5+
         BeLwodXqxU2y3vHrKOlta9FLnb8ypcG6TNKxZXrfdMj2OMV+gEWzw6U+45g/UrlI8kXz
         /tT6QnFQFyUY3Hh48Txona0LPA60OqCjkCfzz1ody9p9Yu3cx5ZtYcyAGSiORcSV6FkM
         N5wPmASfX38BhJG3x2rSELsTDBHV6RAgmZixNzylsayhNSq/eoO2xKfpzt25o7huZna9
         5OdA==
X-Gm-Message-State: AOJu0YwrbDkXftW2Lvq8cWgGgCOd0n6as5Uh1SGMIgaC+76Y6pG4HAMo
	JYpak7T0Jcfj/vQdssXJQNvMaqfuUYlK/uMyeL99DcuiEQYeejPexEER
X-Gm-Gg: AZuq6aLaCm0quaPe1MhlzCrfyVt5jD5Yx14L0wpfcC9lNO76foROg7/QBlv56axvDgr
	mxcUWlLbMiWeHZH3EkukjlsoNwoRkPoh+UYPVg8l2wDj09xGzZwu0TA6EZYoHjikBTOxOsxY4O6
	s4seD5wcOeImhoTA/lQIp4gjURXXEIlcPowbADuwERzU1V6sMUkNUGEPXD/s+uMgNFSODh2oJZz
	ouCDibvTT1/1mK+LM7Z8Cb/pdkWKnnmTwd+e7Xt5fzFklv6KucEfBF/c3s9zqfCxtSmW+kQQVdO
	4puatVnOt3dhPYMnujExxcEGPd68zV2JmuVt6f8vZR3xjJGAQqzd/vva/ddFZHP/A10bK4OyTH3
	l06FTemL9VbgIaZagHb+9v4L52Se3wX3fzvEXpV+IF51Qs2xQElZR/8fhWYuSTjvftF7y95cCuG
	qCuVtHgYJ8Jgb3OaKsnEeIL4P/KkE/Psx0
X-Received: by 2002:a05:600c:548c:b0:483:2c98:435e with SMTP id 5b1f17b1804b1-48373a782c2mr92977305e9.34.1771096280418;
        Sat, 14 Feb 2026 11:11:20 -0800 (PST)
Received: from archlinux ([93.186.111.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dcfafcdsm477210505e9.9.2026.02.14.11.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 11:11:20 -0800 (PST)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	ethantidmore06@gmail.com,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: remove unnecessary boolean comparison
Date: Sat, 14 Feb 2026 22:09:11 +0300
Message-ID: <20260214190958.68282-1-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260205224210.64920-1-nikolayof23@gmail.com>
References: <20260205224210.64920-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove explicit comparison to true in boolean expression to follow
Linux kernel coding style.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---

Changes in v2:
	- Fixed typo in commit message


 drivers/staging/rtl8723bs/core/rtw_ap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 67197c7d4a4d..e23b86e66cb5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1157,7 +1157,7 @@ int rtw_acl_add_sta(struct adapter *padapter, u8 *addr)
 		paclnode = list_entry(plist, struct rtw_wlan_acl_node, list);
 
 		if (!memcmp(paclnode->addr, addr, ETH_ALEN)) {
-			if (paclnode->valid == true) {
+			if (paclnode->valid) {
 				added = true;
 				break;
 			}
-- 
2.53.0

