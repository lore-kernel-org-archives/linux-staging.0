Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F4B33F8B4
	for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 09:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517781; cv=none; b=OeOUOT8gnI89g2aCdYjD7Qnbo3dKZAAT+VPY1/gR1s59emtNYfoLQ6ja5/VGbUIUkZ61VEk4sp5DS3nj3nDZ77yL/YUQwugtoFsuVSahTYqzNTo9RR6GbuDAXtUxwuw0MmSiVaKXKJmaUUVVjZU88rp9lU6t0g3ulaE/Zo5Etpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517781; c=relaxed/simple;
	bh=MqMK9VUVSlSSc2e+r1jsvapXJDlKU7Fd8c54Oa8aqxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O+/bGEgZJF73n/xuefGHjNykAoVcK7i+eFV+pBoTgDIDp91/eNNPLY5mpzojpp6DONKTfSQJdo44MNUgKdPT6WmKohGKDTyrwkbz1EPzF+b9/EYokmn5+QlO523IbNYIA+KvQun0vvZvz6kzMDn5mXgQON0UXHSndrvUpQ4Difg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kR10aidZ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kR10aidZ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso5547495e9.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 02:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774517777; x=1775122577; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3poub8+Fh0OV92kTHtG954iIg2TQ9IULJ9dkSalWiIM=;
        b=kR10aidZNp/j3BWKDXx0zl6iMDpWgEHY2e4qfOOq0nYo3d3VXrkXzqgaKZUhiHUYFH
         mmU3iULlft+eAoqvEXitv+5SNFKulAFxUo4tavf6BPeoX9owHQ946kODlL9MWkeXHdlP
         RAnBcKYLn9y/KbMKHIFPA59y5J0diEh17AaKRsnrpTVhpnL8PQiQbDA+em3LsHZEsjHR
         aCG+19HPF43mQd9KmJRvKCDQqym0K7rQQxpHFiQutz3y0l3lCylvaxiMWbvx/4tXkc8P
         9cFHXGskjRFrQI5Mg5ta8irma5SbhFj+RjIOsBSdOYOHjOAk3QwTq59Gw8sH5FYI2Onv
         OgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774517777; x=1775122577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3poub8+Fh0OV92kTHtG954iIg2TQ9IULJ9dkSalWiIM=;
        b=hIbnKgrkfeEcurZ40Tty//5BeQi1N+L4KvbCSMHdt1E7E96AsGclTKkAPi9LVWAv2o
         b7zeFsOogiu9w1tmrczQvEN53A0HOadW4UmwKsrAql65rLdNlvF6nqvo3tcouL1mtlf5
         ANyEmxPbifFfYu/7YDFFM1ZEvdhJnYBrAYryBq45qJjruCbWayiR2j2PXPgARZwoYDyR
         kqlf2law7cZcS7hW2SDFl2INKN3WHhOC/CpVj8vLggpCpviosH4FqOSTupOqDho2Gm5N
         EW8YQVkHUcFV0nyvzhMRDXkO45dE7cBOI+HefwnXmF9sUAfekQBhoUJxIdMVvxW+VZ30
         2UvA==
X-Gm-Message-State: AOJu0YwGdu9vxRoH/HXxcH45p8nKlIYHHvwyJSLDzE+BE85f2amQMLju
	c9T6kOylA7Kju6a3e4D+7FCMLMhoxgcvGFSD0usuIV2FbvC8qBXgxJMk
X-Gm-Gg: ATEYQzwNiqlydpYDlPwRHEutNV+JMo5Oyrme8l1HJw0b6eOVc85VYXbgRjJRDwP/gjD
	ZAjPVQGsP16ZoAIpVMNHoCaRHMy4f+8fHcA4JMZp6Ly+JbsCKnCfYG2ygPYPg09+pBcgmCVoMqy
	3sxyZpsybn80PFh0u0orbZ4wisI2Lf11unTjmoLQXhHTAer5SNBxFfHpfJI5/0LIgZYwiwspXNW
	H3HVjQgbFf9Npxw9lzwNbw0jhdEIWQey4/HeQTeucyL5B8DyPp+P0Zstdcn1Ic2R8NOCGcYKv9V
	hhiBzpJrHmbs1xrcFMYXzfuGbXlpYzkSJwABu8ch4dNBJ9kSEiivDeqkd4DBwNcwh0JkVpb9TvU
	NmjmXDp6G5/NLQr7Wv1JUoqz43Qudl5K/yaJhYlQ8ASdAbWFxOZOdrWaaIplYuyYxptcpbvv5aC
	UX4lQ3Io/G6ElEiwCl4Ui/bjFBFv+QUXRifA==
X-Received: by 2002:a05:600c:4e12:b0:486:fe83:8621 with SMTP id 5b1f17b1804b1-48716056832mr99615075e9.23.1774517776502;
        Thu, 26 Mar 2026 02:36:16 -0700 (PDT)
Received: from potato ([31.176.167.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d236a9sm41224175e9.11.2026.03.26.02.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:36:15 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH v4 2/2] staging: rtl8723bs: cleanup return in sdio_init()
Date: Thu, 26 Mar 2026 10:36:07 +0100
Message-ID: <20260326093607.13011-3-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260326093607.13011-1-omer.e.idrissi@gmail.com>
References: <20260326093607.13011-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sdio_init() return errno from sdio_enable_func or
sdio_set_block_size instead of _SUCCESS/_FAIL vendor-defined
macros. Let rtw_resume_process_normal return errno returned by
sdio_init instead of -1. sdio_dvobj_init returns NULL on error
so leave that as is. Let sdio_dvobj_init use a slightly more
readable and conventional error check for sdio_init().

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c  | 8 ++++----
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 7ba689f2dfc8..e943dcea1a21 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -1135,10 +1135,10 @@ static int rtw_resume_process_normal(struct adapter *padapter)
 	pwrpriv = adapter_to_pwrctl(padapter);
 	pmlmepriv = &padapter->mlmepriv;
 	/*  interface init */
-	/* if (sdio_init(adapter_to_dvobj(padapter)) != _SUCCESS) */
-	if ((padapter->intf_init) && (padapter->intf_init(adapter_to_dvobj(padapter)) != _SUCCESS)) {
-		ret = -1;
-		goto exit;
+	if (padapter->intf_init) {
+		ret = padapter->intf_init(adapter_to_dvobj(padapter));
+		if (ret)
+			goto exit;
 	}
 	rtw_hal_disable_interrupt(padapter);
 	/* if (sdio_alloc_irq(adapter_to_dvobj(padapter)) != _SUCCESS) */
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 358eac0837cf..d0feb28b7043 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -131,9 +131,7 @@ static u32 sdio_init(struct dvobj_priv *dvobj)
 release:
 	sdio_release_host(func);
 
-	if (err)
-		return _FAIL;
-	return _SUCCESS;
+	return err;
 }
 
 static void sdio_deinit(struct dvobj_priv *dvobj)
@@ -157,6 +155,7 @@ static struct dvobj_priv *sdio_dvobj_init(struct sdio_func *func)
 {
 	struct dvobj_priv *dvobj = NULL;
 	struct sdio_data *psdio;
+	int ret;
 
 	dvobj = devobj_init();
 	if (!dvobj)
@@ -167,7 +166,8 @@ static struct dvobj_priv *sdio_dvobj_init(struct sdio_func *func)
 	psdio = &dvobj->intf_data;
 	psdio->func = func;
 
-	if (sdio_init(dvobj) != _SUCCESS)
+	ret = sdio_init(dvobj);
+	if (ret)
 		goto free_dvobj;
 
 	rtw_reset_continual_io_error(dvobj);
-- 
2.51.0

