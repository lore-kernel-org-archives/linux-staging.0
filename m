Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EF548B379
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119866; cv=none; b=nBkTfrN20QYxr0aSkVq0DUvnEbPt5fQxGW/F/hF7uIxt1FK3OqyKbEIXsLvt1Jlep3OZ2inQJrf56hTIc6CiK+LAbtGPVXNYDPoOP8I0cgOJkyxqJeOQ7YHEqGEv6E4eLzGgJWsu+fHeh+FnsgRW4OgGJOZ+RxVfEg98bFH/5uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119866; c=relaxed/simple;
	bh=liJqa2gKzGBuo6lpJB3X0tG+AmpdAvgJqYlmJgVVIn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N4QSWN0QJUGi9uLtFMxffT4EfiEwl32ruGqf9AuXKEjvs/084V8mgFnJ4H8IEQWWFh3PlOisOyWRUrkcPbnNy7lcvBjNYtKZCYyfjd+z9BzdhAZlbFowp+ActaB2I9wn6fCY1aWZNnYrzVLMM8jz1xMwspR32NeHte39s6dLphw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qlrocsdy; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qlrocsdy"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aeba09900bso1548514e87.2
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119852; x=1784724652; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u0Mk5tzrjHYYy4SGPBdnNN8CoOej7gvf7wUIp89O/Vs=;
        b=qlrocsdyHsHvAb4+83ftNgisLh7ZBd+qnpD2KHVwO2P6GkZHOhpwmQEAU0ADe7UCgu
         baiafdit24UlWilyUXCOVyaZqvr7HYyAVVWH45E0gIzqaRm+fIB23eDNR08QDnneFbc7
         iJ9qjBHzvjt3NYX5Df0VKzsaPwDBM3SelvHpr/hsB9CXlxBJE4or9N3uKFpIH1bM6swK
         xmsZLCu0zNBW5UmihM0x+85Q6sqgTbyVbMUrvhMUDO6F/8BsY21fxBSu1OwIkGfk6/MJ
         KwV5+lJX2ziYE6hS4tgs/bQeU88M+N4lFrZSAcL7nBF5RdFf5RmmrKliQq6cpYy0b7DV
         UsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119852; x=1784724652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u0Mk5tzrjHYYy4SGPBdnNN8CoOej7gvf7wUIp89O/Vs=;
        b=cATOvwiEyypBihD4RhcsmhioOU31we8NrH02j2nP8dU8iiUolrqnYlKhJhcPTkffYx
         NebMvcgzemgTOydemv9d1/IhTVqt+GRdyVq4zjT+UvRFDViCAyL2DNfvyV470KIrxwkW
         ZbfMxr473SjJgGbUo77KUzZpLq+4zQyli1f1wAIefKTKhVJqO+mjn7UfNUz6Ty08p+KH
         r1ESzfqqcXtmeDq99Fsm2AEktxxu+nFUHLEATWQ/dRiobbZLKyTzJAD95jG6WD9gLbUc
         Y9EdmPw8O0cWLvHV6SkyRk5lONiboii3YRXeb+RxZXMYnUFCeVVoZhdZtoTbK7qAfEam
         lI/Q==
X-Gm-Message-State: AOJu0YyMpDk90u/JCdyEuNAHDXkosweRk/f7vlIr4XkLKV7k0yESrCbo
	j69JIDddwO92AChzMQoyMp7csbE0OcYG2aUtWOqEFfRK5KapTco6lY/0UqDOB5Pd3p8=
X-Gm-Gg: AfdE7cnQFGnudxp7qw76c7lC7xxVI6Pqk+JCw3i+cMSV7lPvKlavyHds4XmtmdlCIoW
	dOXaBQ9/24ewkoIan96c/0LhiDpJy/AHY70+gIhxL2u000RZH96WJaKqpdKysgXTkOs0hSoJwr5
	z+WGh25FPhiRripdT6J1VngsFzEJT4j+faNnsS1d56P7t0iE6bNqvVIBuOI19Sa0pjpaDHRP5oJ
	pm6im8hyDgSLBnvLMpBRiUWyT5eDakc1QxQWkTWDyu4pQ3ujHQx8o7SortA7u0Ie4ltkUOUAkZl
	yEE+RbLs7XuBfzaceAN92k7F1vKSfoxSq9zEMmsiqoTqRtAt3xHKXFPvseZU/ycxUKV9p/kCAUr
	NOcC10wjWSRME1OYZh8RyhOuDXpXSsTJimJaI3xq2WXypUxaCb8JM/H6jd5fJkCgZvCFcVHVW3V
	b83lWocIC2sz4m6BSnHBD0N90uYObv6qAdA7WsVZHOvrXrqgrXOvaQik8rZF+/5NV41lvopHZCS
	C+11GjFZ3os+Q==
X-Received: by 2002:ac2:51ce:0:b0:5ae:c22e:a12 with SMTP id 2adb3069b0e04-5b0236be738mr4149530e87.65.1784119851479;
        Wed, 15 Jul 2026 05:50:51 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:51 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 45/61] staging: rtl8723bs: remove c2h_evt_clear wrapper
Date: Wed, 15 Jul 2026 19:48:13 +0700
Message-ID: <20260715124829.90290-46-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the single-line helper function c2h_evt_clear. Call rtw_write8
directly with REG_C2HEVT_CLEAR and C2H_EVT_HOST_CLOSE arguments
instead to eliminate an unnecessary function call layer.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c    |  2 +-
 drivers/staging/rtl8723bs/hal/hal_com.c     | 12 +-----------
 drivers/staging/rtl8723bs/include/hal_com.h |  1 -
 3 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 01f8b378e..c2944a1c7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1694,7 +1694,7 @@ static void c2h_wk_callback(struct work_struct *work)
 		c2h_evt = (u8 *)rtw_cbuf_pop(evtpriv->c2h_queue);
 		if (c2h_evt) {
 			/* This C2H event is read, clear it */
-			c2h_evt_clear(adapter);
+			rtw_write8(adapter, REG_C2HEVT_CLEAR, C2H_EVT_HOST_CLOSE);
 		} else {
 			c2h_evt = kmalloc(16, GFP_ATOMIC);
 			if (c2h_evt) {
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 638d598e4..b357c5145 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -420,16 +420,6 @@ bool Hal_MappingOutPipe(struct adapter *padapter, u8 NumOutPipe)
 
 }
 
-/*
- * C2H event format:
- * Field	 TRIGGER		CONTENT	   CMD_SEQ	CMD_LEN		 CMD_ID
- * BITS	 [127:120]	[119:16]      [15:8]		  [7:4]		   [3:0]
- */
-
-void c2h_evt_clear(struct adapter *adapter)
-{
-	rtw_write8(adapter, REG_C2HEVT_CLEAR, C2H_EVT_HOST_CLOSE);
-}
 
 /*
  * C2H event format:
@@ -472,7 +462,7 @@ s32 c2h_evt_read_88xx(struct adapter *adapter, u8 *buf)
 	 * Clear event to notify FW we have read the command.
 	 * If this field isn't clear, the FW won't update the next command message.
 	 */
-	c2h_evt_clear(adapter);
+	rtw_write8(adapter, REG_C2HEVT_CLEAR, C2H_EVT_HOST_CLOSE);
 exit:
 	return ret;
 }
diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index e6d32cf53..0a43655f7 100644
--- a/drivers/staging/rtl8723bs/include/hal_com.h
+++ b/drivers/staging/rtl8723bs/include/hal_com.h
@@ -124,7 +124,6 @@ u8 NumOutPipe
 
 
 
-void c2h_evt_clear(struct adapter *adapter);
 s32 c2h_evt_read_88xx(struct adapter *adapter, u8 *buf);
 
 u8 rtw_get_mgntframe_raid(struct adapter *adapter, unsigned char network_type);
-- 
2.55.0

