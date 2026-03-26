Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1813D3B5821
	for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 08:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774513004; cv=none; b=tt99/zuwe0tn50M1V4H68XeaiEg8qpiYRjLCjqRUjAVex2BlSdIz16T2maRVjBKtEUQYI+SMBu/44cbXujgIoZ2mQ1K7LfOEgNQBd+2GnETkyxPhRWLL+xaQC9Qio+JlVbNlwdDSZtzhJdKS7viP+yQvW+BuirFdr8hWZ3aMaW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774513004; c=relaxed/simple;
	bh=mMeeJuaZNxecKvFROX7Q1UPzFZzGa8Hph6hnSmJw7K0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kY3eS/Hs9LoS9Ua9PajhdHZoeICOcOTOhcQ2SiGJVPgygrcgKxBV+TOND4XfmHdGydbNnSaPve5EZUf81pGZnUEkvu9OPgLlR/o+our3KslYEb5wYGPDaWT0nkZphHM7+G4Gf+QGGUI5ZsPlUDMxmqhp8JbnwoouV1wgw66Vkzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rfaclyna; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rfaclyna"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-486b96760easo6978425e9.2
        for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 01:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774513001; x=1775117801; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9cHpCwLSJWHYVjnLpxFvTWscwNHAujvygDF0mECPT4=;
        b=RfaclynameZ7pZS9cCzv2BZuDoH9DvVru0TWseLTv00N4VWsLDCWz42nv/H834RQcu
         UcUVTeJOTnmP1wWGaVHoXLKYZG6sNiUfzvdbfFXADqhPSErgtqUYQL+9e5eK5hqr86Ta
         U/3RKc67jtSQAAj+j2zZSaslf1VVn/wlcn7x5bF5Wx6Yl7jtGfpxBKAFkQ68BxyhodrU
         ItzoB+wkG/Ida0TjvgIuncOTA3lTu7SgP8xtV+AfLj1ZJxXws2tYj0biKxbg2tfBPOsK
         xYiRSWQFZw87tq/+3C7XKMOpBp8Sf7E9tYJwKCGEkNmxsUOHwovMBDknZsJQVBo7RztE
         45hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774513001; x=1775117801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l9cHpCwLSJWHYVjnLpxFvTWscwNHAujvygDF0mECPT4=;
        b=sBtm2do1taB6vxYYkXugT7EZOYB+rRNW2P9jLVln77DQwVEQPl8zjKJvrxgX0t0NFa
         /9DABXupwjqJ8sQfbbNrkcVVSzAcysyMDbhAKSS2qr0igE2o9JYgKF6EJIuP2IJwRsRE
         EW/pHcbrJe4o/CAotQ9njj0/U3Rnt+mK0+RnDP0eiwHYSIYIW1W7f0pG8pUCReAafvJV
         vpA9puYlc5e/EktYrdDQbzGj/lFgf+36Ej008wqZ/7+K2YOUBef0E0R6Jt5Kay/ZlvK3
         72kqbNbNDULgjcy3b7UTrOC/Ja3hNNnbY6GRa7PJuZcv/s2JIvdC8wuHk0Ck3VfQUFNr
         nvIg==
X-Gm-Message-State: AOJu0YxeOmyQ4qOdcYhzknRBrNFZLmSxosleop6Z8XJxeZieY6KBak3E
	/TNC1fp7LPQGZ23NYWJQ6J/NpVd/kTNql6WY6vrJAnPnMDWY68IAOrpqn/5l86jO
X-Gm-Gg: ATEYQzycuZBCXspxHeKNmZA4nmQ1ipd8sMvutT0aJGBCKAJB0Kc8EZEkkt3z4HziYZO
	Lg8iqydYeAHOLylv3B6f1okEG5D3S92Qryz9LxgTUyrMEz1kkn4iB9/37GFOd/qY5fZyTeKSHF3
	MdI59pvhmfZXhZa8d8Yu0jBTNjebySk6XG94obfkd3tTbQyiS29wZUAaozHhqSEqrqyebaGESpn
	NBzT5Unk57Tq0V1qBC5rkEQl7o19CWKv9MHzQWxB53c1fEv1R9FcmVXKd6zQ9ysTXvoIGoeYbKB
	SH5eExf0UH1OqVkGu3a5pmxIZGCf+2yETKNUBkNBLi/bAgHtbzLPsXOxipNzTgAMBn2Pd/kBGgO
	qZRl+WIMghNFMR6ZvLlUT3dyDg6e1EUMf6hvHuSMoA1FSnBmkPXDaHPgH7jZsQ1Wl9uxlptyEWr
	bLm+REYonCK7kUqwx9qB8XKaU=
X-Received: by 2002:a05:600c:8b18:b0:485:3b9e:caa7 with SMTP id 5b1f17b1804b1-4871606d79cmr93205225e9.23.1774513001429;
        Thu, 26 Mar 2026 01:16:41 -0700 (PDT)
Received: from potato ([31.176.167.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm32886045e9.2.2026.03.26.01.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:16:40 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH v3 4/4] staging: rtl8723bs: Choose slightly more readable error check
Date: Thu, 26 Mar 2026 09:16:26 +0100
Message-ID: <20260326081627.5841-5-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260326081627.5841-1-omer.e.idrissi@gmail.com>
References: <20260324220453.47406-1-omer.e.idrissi@gmail.com>
 <20260326081627.5841-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let sdio_dvobj_init use a slightly more readable and conventional
error check for sdio_init().

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 01b5d8a70072..d0feb28b7043 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -155,6 +155,7 @@ static struct dvobj_priv *sdio_dvobj_init(struct sdio_func *func)
 {
 	struct dvobj_priv *dvobj = NULL;
 	struct sdio_data *psdio;
+	int ret;
 
 	dvobj = devobj_init();
 	if (!dvobj)
@@ -165,7 +166,8 @@ static struct dvobj_priv *sdio_dvobj_init(struct sdio_func *func)
 	psdio = &dvobj->intf_data;
 	psdio->func = func;
 
-	if (sdio_init(dvobj) != _SUCCESS)
+	ret = sdio_init(dvobj);
+	if (ret)
 		goto free_dvobj;
 
 	rtw_reset_continual_io_error(dvobj);
-- 
2.51.0

