Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3243ACA52
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 07:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486243; cv=none; b=MMrvVojH0LNR3eNO9Jgm4PHDQSz6xcwfwcmyp9DdOYycc6lWWqDrz6+JbLNIIQdcXoeCfQUvT7BNdi75OLLO92LePEcl4JpxAP8RwOovXJgL67I/GsDYWSJx89KxaywknTNbHF7+/XtZGIWnEvpaC5dCeVs9GQAC+geak6vGCs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486243; c=relaxed/simple;
	bh=AKGGCpuzZcoyg0/I1zsOm2jipH/8mNSK3tF5rxKWjxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rOSIWsUPWKQWvKqLTM2qTy6r0dNgMCsw6qisq+jm2XkvjJQrDAuUyDF82U8tKV4bZ3h4Un/ZhzfBNpcKzJ6evN/qmIc0ppMOv1gcFyEiCKNJRbZLyqLx1LChHxEPZvk2YsgqaqsDGf4Lihe8meHtixGF0KkKdx3Mpb4qKhyIf/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HmOfKdWA; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HmOfKdWA"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-393a49d2e5eso33713021fa.2
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 00:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778486227; x=1779091027; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5yYHhkRoOnRCrUtxTlsrMFZ21lAaIKtcu6+dAdwWsA=;
        b=HmOfKdWAl6kga05ObYiYatji2I9vzH+Mj1q3c9TQJQQC+7mmG6yg13cJXBI5+ruwSM
         KHKsjb24Rq0NRGQZz3Pn+Pg0G7Xbgx3negeK8dg84WXUILmMtJpJG+mhqUe6tFiDTHdu
         gNKlrAiPN5QxlE11fX6rVjVrVn5V0I5mRZ2hbAa7VZuVy8TMvj5E/kmND0gZNZKRqp6L
         qlxu+i4VuEC+1GfNAzbSaKdsEq7FOR5OoKYA9GCj32zdWROZo90NRRW2a8QwOKAx1KLa
         /RdkGmpL4LuwiSs8W7AMOh1zVLlclcHFz1m3BbYWFT57u4y39RNK7ApqYQE47BmFVffW
         6vbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778486227; x=1779091027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q5yYHhkRoOnRCrUtxTlsrMFZ21lAaIKtcu6+dAdwWsA=;
        b=mdilS8wBeOy1r5uZ9E54EkcIGSSChslW8VAHgJJO68bLsvhziLYpsBsl7DJBkuk5dX
         2bXSpS4L8R6HnqNHM6PovSPh0K/iytTDCT3UnmTBhA5CtncPbQZEQwQ7t2NACyTKIVfa
         5G3u0Q0XQBfGtDTgBs2LMUnldWDOITDDoVKXIRlKCzCuI+SuOAChZg/dxo1ogi5XWqPf
         x7gdzaFUD5+76B3wQab54t+5dvijWkSrnDB9NyXrJlxsY3fRxA7tNJPjyymxlUioyaWD
         oSctEnJ8gt0gNsiZSwW3MUfbcEDiSEy0Q+cKCUus0KuqER3q8iENB14N6hEAsq3G8Ivr
         Bq1Q==
X-Gm-Message-State: AOJu0Yz/1EJs1X64UxXNTHrbv+XqXaB17bs+3DyxPoIp3GH+utxIJW6O
	yabMtigIAis20Kyn8laNAhjfXaKLcKZwo5KyJXtbpJ+jrylnNuu+XS54+fOVgKTC
X-Gm-Gg: Acq92OE7cY2AH7Xs5Ujy4FbA7Td3HibRsxgh4nBbvYypzwOH0rFQQ2GqgjBpfaNHvtV
	q/A7kYdr9RZNsVx0a1Hq5xv2wGCYh1OsJZ5dzoLRG7f0SIAt/lqO856suGDMWMU0WIwdiq3cbJK
	DbqG5zs46+1utPKLLF+T8hZsTyyqVN7yFX7gC2gwgkClC0ZYM3wchdwtDK3y0giFw8W/jYsB74t
	a0wS1e17pojcw6XeRD0gEbJkHY2r4IL3uXbi2QSDozufqmSdKMixY6ItsM51Eg0AkJjngAeVwpt
	qzSHYAKtkPuXopNP23z8BDAfu3HdXVHRkjxP9K1gxN7HDn8ngjftZ7NYfhfh/zpK4Ta2EidSJOK
	wZbGeer4KmrgoCc0yg/E8stWftenAf+I+Me3htIJnupkIIHgPHjkOhhNfgNGI12FMGIv3HLkLBY
	wAuAo6uj97WB7023P9EyulGzbQ
X-Received: by 2002:a05:6512:118d:b0:5a8:6df4:6ad7 with SMTP id 2adb3069b0e04-5a887adfcacmr8618531e87.14.1778486227235;
        Mon, 11 May 2026 00:57:07 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d487sm2433861e87.24.2026.05.11.00.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:57:07 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 4/4] staging: rtl8723bs: remove unused SysIntrStatus from struct hal_com_data
Date: Mon, 11 May 2026 10:55:31 +0300
Message-ID: <20260511075651.11637-5-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511075651.11637-1-nikolayof23@gmail.com>
References: <20260511075651.11637-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This field has not been used anywhere since the driver was added, so
remove it to eliminate dead code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_data.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index 22c2bac3b80c..42e3892944a5 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -387,9 +387,6 @@ struct hal_com_data {
 	/*  For bluetooth co-existence */
 	struct bt_coexist		bt_coexist;
 
-	/*  Interrupt related register information. */
-	u32 		SysIntrStatus;
-
 	/* Chip version information */
 	bool chip_normal;	/* true - normal chip, false - test chip */
 };
-- 
2.54.0

