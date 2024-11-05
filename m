Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B291FF7CA
	for <linux-staging@lists.linux.dev>; Tue,  5 Nov 2024 05:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730786137; cv=none; b=kgCHBw9XkQCKtxw7YJnkn4qg4+UfXFJWaHrPFa7f/4Il9xYpX/sqHWORJDYzdKVCQfDX0GZnwJYn+3igVzlgTcD4rTdgJXd0tq9j487cuf7zAoZ4WO0+thuj5yV7Wn68Zi+snfoaD0rm+qrL/gkng8R/OhDKfRzy/z+VAsbYJkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730786137; c=relaxed/simple;
	bh=HglkhNzncWm++cDmzY1QBdFTq/C3UWh00tiePddknxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nDHY87kGzg7OzY6y3rhZhZgWwWnPIMJGwokNPlz5gnf73ztWfN4DTBJEhUqgZWl+sMWlkiyucHugzokA4hRxdb6zlaBvFBEiEWHeSEYOKT3dAOvnCxEY4i82u+7Ja5NPMnm0bdC4/5xMQ/jyQV4z+EZaOQazC2WNIBzSfacTIes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hP6qePlv; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hP6qePlv"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5ceccffadfdso2817284a12.2
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 21:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730786133; x=1731390933; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5c9Awi4gQwnX479vvOPVy/wJUH9Kd2C6R7oi7odwG+U=;
        b=hP6qePlv+fSwQ7MBtvjbmffIrdV7vD3NNBoDfr6ciVcLvZkOmttz2Jo8Ld57nkCh+0
         MV61iaOkx6jHnypZicXyNqrUmFEwRk6gPLsZ9RxkcFVTxvsgaIlpj3/wuYbQpYFimzrV
         PSIX/LGwEDnr27j/tkAp+XJxhkd87h1rANSpOvSI3m0A00P9OGzsaX/hBSYgUZ2WC71r
         vHThQEWeCq7N6+WZ4HZcEeD+MXmfPz0XEJ3WOBWnrppakhpfmm50qjXHoBetRXzN8uJF
         m8O+yD92mHxsQrD1qvQL4/353DCXVa1ZIStT3El2nGNfm5JuGagkg/h+ZEYiTKQw5Xmj
         aG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730786133; x=1731390933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5c9Awi4gQwnX479vvOPVy/wJUH9Kd2C6R7oi7odwG+U=;
        b=ebZfNdwdPZ7gc1CTWebm6ywLqyY0xH6Uxh7949TH8CAXORwTn29krORxJjalJ3oEDJ
         x2ERG22KP6vWLAAzgG7NrgLjAoqgyXXrZAZbx8w+2byX5V9U/S4XN4HDq9zQBvNPWn4C
         qIPDEOOJ1e3SAkj4L1weYpCbCsdRcUCpCdFhocIUp84CpaBDOeePbTzSj09wXSQ9JwHM
         Qp9eRd92CKodveJES9XqapuiKBNk4m9iZNGoXV1Lt8bgrQifPahZxn7sS9eMoqsJv416
         lx226RC6WqtUmOTt0OMh8xCBV/PxgdyEdqbZzpofdr8ZzwJktt2h9ob99CbuQ1nTPgju
         o6XQ==
X-Forwarded-Encrypted: i=1; AJvYcCWR1FujsHqqJvVUgr5obkJVwOCdJ5FTnJ1IgtEvqI8A0FgFP4iGmhKbV1scGa4UmdNlrMhfGNk6/mcmxhWA@lists.linux.dev
X-Gm-Message-State: AOJu0Ywr3Y/wRY2BLna3qN1GWB6o/n2K1ybqgfjxEbvT+W5+3BpckaUF
	hKrQfIi6t5P3Kff/uRIqvhPjhSupYwgvSh0LbbGUUosuq8FcTpbt
X-Google-Smtp-Source: AGHT+IHutIpV9r6Mt+L/j/kjgTDJPTDItX13wBgylN1fVRc0YUZpR3UiBzS/+X6QOnu5NIfPd9P13g==
X-Received: by 2002:a17:906:561a:b0:a9e:8522:ba01 with SMTP id a640c23a62f3a-a9e8522ba90mr777118966b.39.1730786133173;
        Mon, 04 Nov 2024 21:55:33 -0800 (PST)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb181451bsm78775466b.201.2024.11.04.21.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 21:55:32 -0800 (PST)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 10/16] staging: rtl8723bs: Remove function pointer cancel_thread
Date: Tue,  5 Nov 2024 06:54:57 +0100
Message-ID: <e4fdff174a8ddc6cd62232e0aac8e23f4f34b1b9.1730749680.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1730749680.git.philipp.g.hortmann@gmail.com>
References: <cover.1730749680.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function pointer cancel_thread and use rtl8723b_stop_thread
directly to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c          | 3 +--
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 --
 drivers/staging/rtl8723bs/include/hal_intf.h      | 2 --
 3 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 28d15536abbb..22c41e4deae4 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -238,8 +238,7 @@ void rtw_hal_start_thread(struct adapter *padapter)
 /*Start specifical interface thread		*/
 void rtw_hal_stop_thread(struct adapter *padapter)
 {
-	if (padapter->HalFunc.cancel_thread)
-		padapter->HalFunc.cancel_thread(padapter);
+	rtl8723b_stop_thread(padapter);
 }
 
 u32 rtw_hal_read_bbreg(struct adapter *padapter, u32 RegAddr, u32 BitMask)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 8d8270d85f96..d23e4b1c36b6 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1744,8 +1744,6 @@ void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 
 void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 {
-	pHalFunc->cancel_thread = &rtl8723b_stop_thread;
-
 	pHalFunc->read_bbreg = &PHY_QueryBBReg_8723B;
 	pHalFunc->write_bbreg = &PHY_SetBBReg_8723B;
 	pHalFunc->read_rfreg = &PHY_QueryRFReg_8723B;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 3306c26ed2a4..02b31c142b9a 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -164,8 +164,6 @@ typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 struct hal_ops {
 	void (*SetHalODMVarHandler)(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet);
 
-	void (*cancel_thread)(struct adapter *padapter);
-
 	u32 (*read_bbreg)(struct adapter *padapter, u32 RegAddr, u32 BitMask);
 	void (*write_bbreg)(struct adapter *padapter, u32 RegAddr, u32 BitMask, u32 Data);
 	u32 (*read_rfreg)(struct adapter *padapter, u8 eRFPath, u32 RegAddr, u32 BitMask);
-- 
2.43.0

