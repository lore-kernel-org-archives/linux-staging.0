Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A407733123C
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 15:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769702241; cv=none; b=BY+dzo0QW3Bl544ZQERFgsl/lyW50Y0WNZrxlTUfd24AZBUbC3OLfR04gdnSjY0DSSUBhnaz9w4I7JVCxBoWbTutI0dvkJl9tUOoGIx7z2XXgP+uScwE/9LPqFZlrUYuJzhIibTmyhtD0IBFTPWvM+pPUOWPz1YG6E/YD1meDd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769702241; c=relaxed/simple;
	bh=anusSg+ei2G8pY99kSNGBiFGkxTuVaDv4F/ejqaSEKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mR3yocOJPvBA35qVl8CvJxVWzggBUSa6nDAMAOQrRb+/7pdggIWYDWuPwYNxSZ8BcFLa5zWmkVs9g0GP6tJ+JRt31rMfoF89QXAPe7zcWHUIC1e2oltJXDBU0+8rAwDvTidFoLs+E5J3FYf7d8HWSrT7jNjE0k9SDrYl//kwOXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VVimizGV; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VVimizGV"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-481188b7760so6774435e9.0
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 07:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769702238; x=1770307038; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YkmQJfRqTQzrHHgjjnSwxvqZrCWnUDQPc30Wk1HVPk4=;
        b=VVimizGVDrk0JYEAmmmnxZ65u49xfe2iX+iu9HMKOsvgB9o0TOinBxASPrZqQ5Ou3g
         JF/FsIMQ5Sxk4pqnO+/u6sC+yr4+DZ6c4u3++R6zYuBCzc7nrgNMboZ/3jTEkZnWFNKc
         kACGp3AOKWb7pO0OGKlHlVjD5PntfZ08qNwGSSOXSA2CgP+CVmtUeBDHLP9oh68SZls7
         ro3WxKbK8EVT4PxBvRZpF2Y7061MUl0DjNzeoh30bUYXonlobbdcAbSz2pYpg196dzMT
         DpdpfaD4eyN9UcHS744Lwq5BWSI8QxkTZu5qY3pQvQcGIke0SjH04KwFI6Xm4zy/Sn8G
         sbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769702238; x=1770307038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YkmQJfRqTQzrHHgjjnSwxvqZrCWnUDQPc30Wk1HVPk4=;
        b=RHoh/Gjf8swppSlOxs7yV3KkF0vB6oXMPLrktpybrQjHZygqo8ZE0sON1cmP7bXjMt
         fWr5H5npX1rVZzC36nsXp1Od7Kc2PC1FuC8hhAOh00mKZzBpI5qw06gcSfaUr03B6Wl0
         +Fi7kJkK7O9/piRqcDrSBf05k/tAjkr0pC7NgEH/NoLWa6aeM8Ibgux+E84P7FUMFvd5
         4j9/dk6Z7HbFF3MZMmWciSwIha4jUHUNfnUsNzE950eeTD0wZvS4Qn0WCvrjaparewku
         +U8rPzAJlfcKomvlYk5aMo9sQ4VM7kw4Et3ZDzE1CGdUUoRoXELAO+ynOJRYTRNh3HZu
         yB3A==
X-Forwarded-Encrypted: i=1; AJvYcCXWekitEFUEbT/ROO9dP78dkfYVP9aDx+qvr/10eSGw35hgZyztqoyuNF4G+yqEIi3nfwtFihIJWqWKwI7m@lists.linux.dev
X-Gm-Message-State: AOJu0Yzz81OvdDXqxxvcZLo62YCFORRuw4T5qY4BWZ5Cgrt8LwfLtnR9
	xWXLYsg25WrI5LPOqt6RNQ6JFY5DyWHnDmP/KKhsnhzM1MiBrUlm8Dk=
X-Gm-Gg: AZuq6aITxhA2RRDIvbEui5I+Vs8DMDg+gW17DNCxyLkPzmIGoDy5TA7Sj86j2sjmKUs
	T5y1iGYS1KWn4sCbSu8te5pPwtglVc3r3vn2bUQsdK0n3tC/vfoS2AdXyIHJ84COehw5d1MqoDE
	aJxdj8+dSTkqf4SSE5CuaMrb8oYA5ObsW3LZM35dSBQCOecyu208uXk5+JRQ3YCWFEeo7YBJYGy
	WUhopqhz+PpYHIWWB84WUSeBfBO3qPLj8BtHo3igWAAddi9QaaP2yfPiY+BHtV2qgPoyXIRim/M
	+HneZg9VELfJzbBnkWpta2qggoq9uY2OSVPI8Z1xNVxQs2At/PiCcdjARM7lVpx3BapmpxUg/n+
	TeP3qoVnQjqLNmCF480IwVR6BlchEuMkGkVlUpsWQzegi2WE2MG3GjyFgH7TWMP6/jSOSCitEv5
	m4ZG8xWT/hR88=
X-Received: by 2002:a05:6000:2c04:b0:431:5ca:c1a9 with SMTP id ffacd0b85a97d-435f3a8b7bcmr106781f8f.23.1769702237655;
        Thu, 29 Jan 2026 07:57:17 -0800 (PST)
Received: from LGPC ([31.223.131.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee078sm15749231f8f.16.2026.01.29.07.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 07:57:16 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/5] staging: rtl8723bs: fix potential out-of-bounds read in rtw_restruct_wmm_ie
Date: Thu, 29 Jan 2026 16:56:50 +0100
Message-ID: <20260129155654.5565-2-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129155654.5565-1-lukagejak5@gmail.com>
References: <20260129155654.5565-1-lukagejak5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current code checks 'i + 5 < in_len' at the end of
the if statement.
However, it accesses 'in_ie[i + 5]' before that check,
which can lead to an out-of-bounds read.

Move the length check to the beginning of the conditional
to ensure the index is within bounds before accessing the array.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")

Cc: stable@vger.kernel.org

Signed-off-by: Luka Gejak <lukagejak5@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 98704179ad35..7dfc2678924e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2000,7 +2000,10 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 	while (i < in_len) {
 		ielength = initial_out_len;
 
-		if (in_ie[i] == 0xDD && in_ie[i+2] == 0x00 && in_ie[i+3] == 0x50  && in_ie[i+4] == 0xF2 && in_ie[i+5] == 0x02 && i+5 < in_len) { /* WMM element ID and OUI */
+		if (i + 5 < in_len &&
+		    in_ie[i] == 0xDD && in_ie[i + 2] == 0x00 &&
+		    in_ie[i + 3] == 0x50 && in_ie[i + 4] == 0xF2 &&
+		    in_ie[i + 5] == 0x02) {
 			for (j = i; j < i + 9; j++) {
 				out_ie[ielength] = in_ie[j];
 				ielength++;
-- 
2.52.0

