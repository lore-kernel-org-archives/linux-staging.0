Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C2137BE8B
	for <linux-staging@lists.linux.dev>; Mon,  9 Feb 2026 18:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770660209; cv=none; b=UUYNraML5JGCCMBHgR8PP45dNqzHBMuEoG5sgKdllhwJeFiQmzz1RnxLiiRjbWvfOlKVefceTo5j8r7A3Fh0duqAzhXCWPmxBghJ1JLlicqoh2DJLGFHNnk5SZ8+KPOyWePteWSXi6QwaMy7LR1KUeBgI67f0s4q8MXiru4kep0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770660209; c=relaxed/simple;
	bh=+PW0OeUG8Cp4fA30EGFLbXr8drXs02kHNiEwkSlVDEs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UxzASdrFC4ttgW5cIOFinVb+iZjzKEg4wkkhUdTWtDMGZ6ZrDPBXz+soxnZyWwrNL8ZH4kWekChyAdCvEguLojzSIAS2reCdEinw4Ae+ira/Y4hLlW8+4J6V3Aa1/c0sKyv86zUgl8g+60OMry6Wp4ywAmf7aQn0Vux/RFfyZUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UBXDQdUk; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UBXDQdUk"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-435f177a8f7so3314720f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 10:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770660207; x=1771265007; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qhAR0C1p85PGgiHDXEQkZjLSuP0iVkdjBe3Xl3SDzww=;
        b=UBXDQdUkmsTrFwRU7NN40cynu6XaYYVaP3sAMTIybtTIdOhHHxRCUojAJStu9FOO8t
         JGsh9TYYi4t56OS+fXfkesnPCMyX982LmqZd6kEmOWAS5Ov6hpKXhArnN0PNU4EszPbT
         q99LCh0ctETr2h7w9ZLPvxUKYgz9APsKtF/9bsGfdE+z2ULwlaO3lYmq7aFkVeY7Vg0b
         GBVnq04Ju4Cu2rpPO+P9G61XoULl3Fu3zx4yWZ+sOFF9zM/owYzZWKEIqm+0Sw+OUxPi
         U8tZ1fzC8acWzw2ty3/MhvJSRQRT8UzhO3ewerWGRNqCBtxK4oXcuOcJnY/Hiwf7E1Uq
         4gtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770660207; x=1771265007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhAR0C1p85PGgiHDXEQkZjLSuP0iVkdjBe3Xl3SDzww=;
        b=siwdSAWRQrQ8I2xDQ9Fv94oEovpERxxYLA/OedrBG4cUwqkX/LMrLEc7xgv5QsmtDa
         xh6ml+Xt+B0sm6ezhVqkWrXBDuIqMdqNAl1TZYbbb8hRy5bfwpUceqvAzjCG2/xwO5lA
         PDVIbtDLdDmhMXH+ok+SRK+jg8yoEfKjxEEV1seyRO/OOQEV12VKk4PBt2R3Aj/Q2atA
         Lj49zNTrNCrbC6iUSMFQL7BmqJtyQAaOF6GC+AMWN+0fxL2PTjAvWqSEQl5z57+wMKJ0
         aZpF+8vD4wea1eBWi+0VU64SaXs5m86zgEQbOLooF033cvaNI/dM2lXXuT/lKmkPpuJU
         sGEA==
X-Gm-Message-State: AOJu0Yxx8U+dz+A/rOKkrrUj35MyVsz+EKihEs/L5VdytyZZAdcxaZYb
	mx2JJsptZRdfanxt99hWGs3/BO+P1hxXagQg/S7nHP95EZKBJY3S8Icf
X-Gm-Gg: AZuq6aIfoLfH8L+oe5xBJPEaQRdS/l24/9VeGEfDGvfwG4HHePl514m4ef0PeeoKHHV
	lV90ZcmyMoHVADVndM+dg+vR5HJbZOrTJA0U5gJuqbf0zTbC7JCZ5gLcj3sY0CJ2q3rpRU9+e9q
	vqGc6skWDQB0+dI/4FdGDMJpaK3SwdDLrVxiXvKwQ8EGukZxs37rX/a3w4/rkRNsBn8hYkuxdZv
	a6Y3oUPLWTYViXL278rw3aCsf5PQc3onZJ6Yyd6OFEfoOHmtzeFa85ShT3+twmbJTs4aqYuF2IJ
	ecGZBpQb8HN7iom5MYr5jDljwgQEAqxLANvXRBOgdRbJ8c7pOERU4vQLaodfzK4FfTFfmE08zV3
	6OOtCpiYbMYnY+SnaInrDgMPlnfyOgeMwS8a8wvm3RCSxBCSQqyKZTUQGM1hW23w79NNI20fIht
	QNfpkoDYIxo+fjbGNwXaQoe6XbdS0us628njsojag0PqoTVpMBp8m5JEgYhLVVHw==
X-Received: by 2002:a05:6000:240e:b0:436:1517:aeca with SMTP id ffacd0b85a97d-43629341e78mr19848821f8f.15.1770660207039;
        Mon, 09 Feb 2026 10:03:27 -0800 (PST)
Received: from localhost.localdomain (95.59.121.114.dynamic.telecom.kz. [95.59.121.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376d3a32basm11539133f8f.14.2026.02.09.10.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 10:03:26 -0800 (PST)
From: Azamat Rakhim <azamatrakhim8@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Azamat Rakhim <azamatrakhim8@gmail.com>
Subject: [PATCH] staging: rtl8723bs: use u8 instead of unsigned char in get_rate_set()
Date: Mon,  9 Feb 2026 23:03:03 +0500
Message-ID: <20260209180303.53957-1-azamatrakhim8@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace "unsigned char" with "u8" to address the driver's TODO.

Signed-off-by: Azamat Rakhim <azamatrakhim8@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 5ffefa50699e..3ad1c10e5073 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -159,9 +159,9 @@ unsigned int ratetbl2rateset(struct adapter *padapter, unsigned char *rateset)
 	return len;
 }
 
-void get_rate_set(struct adapter *padapter, unsigned char *pbssrate, int *bssrate_len)
+void get_rate_set(struct adapter *padapter, u8 *pbssrate, int *bssrate_len)
 {
-	unsigned char supportedrates[NumRates];
+	u8 supportedrates[NumRates];
 
 	memset(supportedrates, 0, NumRates);
 	*bssrate_len = ratetbl2rateset(padapter, supportedrates);
-- 
2.43.0

