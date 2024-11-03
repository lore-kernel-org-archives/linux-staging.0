Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430D517A597
	for <linux-staging@lists.linux.dev>; Sun,  3 Nov 2024 08:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730621702; cv=none; b=p2+Q8EOqQ0GeHWXbU+ptIefrXi6eCT1iyxagVVb7NCAtl9MJ8Rzqml3C04YYYveQsPJy+WHnDtg0jrbjet6Md5QuDJ+EwMTgyPWk0RUkVsIw6Q86+ZIiHnQ+nYwdWBzBuvpQJs178hXGUj9Pg7jggAmvUPAOqkKLEF5Y0tJx8QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730621702; c=relaxed/simple;
	bh=ZUHmg1t1sdjL0rwN8lgvvUeLmAvJpXjUgQkUh98C/dY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=as+WEOfKYdXa3Ie6d2H+DwqdlmTScCr88StTPk2EEe8qq+dKovqy7YmaErd+xVQm6XGb8VuWUcmOEbIg3nwZClAjyj/wKvSZ/F6UVMfoss6TuWWTQqZmAazgZUTLpliws9msXBRg8jwUnZXX0P9SzQdfNm/3bOnFBcZgFVLRRmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/HQ5151; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/HQ5151"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c9634c9160so3764209a12.2
        for <linux-staging@lists.linux.dev>; Sun, 03 Nov 2024 01:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730621698; x=1731226498; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yutS8FymNTV5ezMq6BbpbrCC9fB498yl7otFEg03rmA=;
        b=A/HQ5151dODXFHw+OqvrGiPwE/v/NmmoWCs6vgvtDeveTWLWUBWP+ycYfVAFOh2IO6
         7vM1Zsnwy2Asxjtr4DsqoUD62lfB4+mIzJQ8zaLI6S9kotxEKNdtCrz9L7KMojR83PrE
         5kMBUJTMmcTzMH7EBTz6VjRqFhSXGooyO/5MGNleLZCdLlCyOEYq/51WxTlIE8zdMj3L
         1FTPPoEMcvLJsHFRCem3E1j6HVWz81XjNOV1Jfda5aDEbBF6NAFhkMZVFhx3suyGUkxC
         p3knCR7lrms0VdMl7sqxQxlr3fTag6Bjv+M/gRzeboj/dODgTBtccqt8PeHzdJaj9SQY
         NHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730621698; x=1731226498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yutS8FymNTV5ezMq6BbpbrCC9fB498yl7otFEg03rmA=;
        b=cuxRbWfGycSPcOx+ELgjlLco1YvgHdPyPhZur4+GsYyhQBlGZfPxHjkoLJX6hSHacn
         AA/oaOxmoRUxpBO+OXy6f7X7lcZUcoaa9lOen7eNauohjivhyU1x2yDmcR7W+SoSr33j
         2oVjhwCe+/cQyrwxHqQGIxgs5/jY6lnciVkXLn2Pwa0f4t02DChD1CECGPLUE3wbK68A
         KgoCcfnI+nFfqwb5cOiu7hxpI51w4Tke1eyTTZm1MQfbPszPZ/r36v2NLBkrQ70loImh
         A54YKmqZSkRuFyQSG05yve/FoDlknKraWYib9JqseysYGlh29WCmSB8ro5tQhYiwQbe3
         Iaug==
X-Forwarded-Encrypted: i=1; AJvYcCWl0JbRXCLGXo0p3Nr941zV0FLE3UyoRROAyaIPveYL2p7Hv5OX+3Qhx00hzx02nfSSbB8N2YVZgASm1cZW@lists.linux.dev
X-Gm-Message-State: AOJu0YxbV3DbLypccjIfH6oWQtd2V5SDv988f9RlNyrCWpDlfH0Ofmk4
	I+x3DblBUxPLWfRPriCCBgFXlTyedousS2YhI8UoJFIVESYxHb7OiwQAWw==
X-Google-Smtp-Source: AGHT+IGAavjs6n08K+rKhBuGeAYl7JC3gaA1uuJISRnq0n/PI7gHwkPTiaQMeYSgovWc2IOJCUFEQA==
X-Received: by 2002:a05:6402:1eca:b0:5cb:69de:2bca with SMTP id 4fb4d7f45d1cf-5cbbf7295b7mr22286929a12.0.1730621698441;
        Sun, 03 Nov 2024 01:14:58 -0700 (PDT)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac789152sm3097882a12.43.2024.11.03.01.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 01:14:58 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 11/13] staging: rtl8723bs: Remove function pointer hal_xmit
Date: Sun,  3 Nov 2024 09:14:32 +0100
Message-ID: <db4f4a699847209e4a577ebfbea82b87c571e6d1.1730619982.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1730619982.git.philipp.g.hortmann@gmail.com>
References: <cover.1730619982.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function pointer hal_xmit and use rtl8723bs_hal_xmit directly to
increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     | 5 +----
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 1 -
 drivers/staging/rtl8723bs/include/hal_intf.h | 1 -
 3 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index d45dfa8e638e..914d4b24d49d 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -162,10 +162,7 @@ s32	rtw_hal_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmit
 
 s32	rtw_hal_xmit(struct adapter *padapter, struct xmit_frame *pxmitframe)
 {
-	if (padapter->HalFunc.hal_xmit)
-		return padapter->HalFunc.hal_xmit(padapter, pxmitframe);
-
-	return false;
+	return rtl8723bs_hal_xmit(padapter, pxmitframe);
 }
 
 /*
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index ccf1e9727846..563ebf8e7fdb 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -1258,7 +1258,6 @@ void rtl8723bs_set_hal_ops(struct adapter *padapter)
 
 	rtl8723b_set_hal_ops(pHalFunc);
 
-	pHalFunc->hal_xmit = &rtl8723bs_hal_xmit;
 	pHalFunc->mgnt_xmit = &rtl8723bs_mgnt_xmit;
 	pHalFunc->hal_xmitframe_enqueue = &rtl8723bs_hal_xmitframe_enqueue;
 }
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index b69d201b6826..dfb973018e4e 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -180,7 +180,6 @@ struct hal_ops {
 	void (*run_thread)(struct adapter *padapter);
 	void (*cancel_thread)(struct adapter *padapter);
 
-	s32	(*hal_xmit)(struct adapter *padapter, struct xmit_frame *pxmitframe);
 	/*
 	 * mgnt_xmit should be implemented to run in interrupt context
 	 */
-- 
2.43.0

