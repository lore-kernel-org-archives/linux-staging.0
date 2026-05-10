Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B646E23D291
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 17:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778435557; cv=none; b=lDMzNeGpfzyFRfwuK9LQxD9+vmIqW04K8E1ecDCnmrNM1OZy2655YPHqeYOTo5VcMXxgU+z78p8JLgkixgT9nX0l6r7AFZRZRj7/Nk0EztjQzzyorpldG28BXiYKJYFFKClHbH/5RDOLCuLrVIEMOmXeFRwjeMlO1MQvuFkZwFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778435557; c=relaxed/simple;
	bh=kU1WaxUYcVMPN2tBEUgNGp0D9YCL1SNdaxgoeZoDD5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YAg/E13JNaj+aHph6Ff8YN+yAhFZWn9VAy+EZ/Qrnvx4uRC/4oT7ZrNVoTzTUdBlRFzm6MAj5VPT2oO2dr3MN7j/6e7q2K8ymXKBX4ggUWSbGJkCxNugBzjpXrYBx4kxCuCVYCRHEoisaHD7tpYuJb8AjQvo1Tc7Aa7/g7NpYgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=spz2JMWw; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="spz2JMWw"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ba21d32776so23690205ad.2
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 10:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778435556; x=1779040356; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okh4eo6znFLOQUpPXAgrPoqPQVtF+aQI1lY1E27JBJs=;
        b=spz2JMWwtC9uV9GUfoyD8B3NhQQaWhgakcPhNDsyU/ExP92fBMDactlff9Y0G2J6OH
         sM74lk6os0KfA9oRvGgCXho2Yi80VaBKM1C9qh6ApHvXDrpG/69qpendk4HvDui3znJT
         qYcI5Xj0ZZC6TVbh6rlWaawqQJgJuF5tk+AShBmkchnojcILj52ZbHJasllZE2Z1agu2
         3Z/s+7miAMnBYYsA0xgMjoAmYs2AyEUO9/8SA7dOISxeMMnp+J7cQxPVnIgUVFUAzHcg
         gB6cKvAf2ZGtxn/vpqtHRY13/UB/d5WID1gBA3OtIoy1amwOrK8fC0uqlzXEnMzRPFgZ
         oelg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778435556; x=1779040356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=okh4eo6znFLOQUpPXAgrPoqPQVtF+aQI1lY1E27JBJs=;
        b=raI2gFD6yZ3LIlF4k7f9fQqg7AMax1KU7Fi5WnoCXMONq59guydrtoe5eMHkeXPjJc
         KKpOT1muRZ8nA5TN7jTZrfxzcTbAYayweJSbzstvInXNCF+iShFXN1ph1ZlTOpB0AQPu
         IeEK5KP5Fzyy64WJJyON4poTEgcX1lFuDIP9FPl+hLyrMz+dhbT9cmR8irkA0h0bC+JK
         P3rC7slRLqBC6MbfndKngxCX7hMz6zkH0VDkmwc5UeSUD6toWv4q8L3TURbL/c7fKqdg
         S4y/oIKHN+hN/k1d7KWQWt5cd2CKYkYchbuS5O5qo1ap1CzhJgpktDhmV0PuAGKbRwTN
         Fp8w==
X-Gm-Message-State: AOJu0Yw0nOY8o2xcFw4omna6EMMAHeeP5OJfO8SzyJH52Y71Ke/Y8XHv
	yA3M29ZFD6hWgLYz0tns2y8rsE4U/NAHhCqs2Ni7xgkTnXe9gLP5mnAr16QAjziWgsDui8AL
X-Gm-Gg: Acq92OEQajy0ZSODpcw7hPkkIfxwE9cnnKrAqElqYnDquxhP6GyEi4wlAj97TfLhas1
	FFGK5AbchjwmQSd7ayDbqN3jr0ryY8J9jD3e+qyWvyjFNZvC+OY6kxHlJ2OyqXWlBvrXaDpf97E
	2xXEVItePNXmSTyj6IkLAhpPz8ud7oEwWWO60HmFZVLvVWTomFUr6Nb86KoO9D4EElLVvFMsRn+
	J4l1VSOZFQ+Xr/6PU7K16h59D8b17Ls/oToHNTfS1cRwClDufahopj+MjuOH5nHOvR+eBRb4/ek
	4/tv3akB7N5WzWt1i+A3zn8roZ1Wu53LmipYvKcv7RnL9Bz7mRl5C+0WejbIqr4Ayc8XzGHME6Q
	SdyuOzDrfGN1lo1TpnWVgmfOxD1vHQTFkhOugOLGxYXC4dRBFXiAnurT/FoQrPmmD407w4asxFN
	gFTDk9SFF1NUNxDhzr8F3m0ly3xZSpD8bLhsXmUGFI
X-Received: by 2002:a17:903:2b04:b0:2b2:5491:e32f with SMTP id d9443c01a7336-2ba78e4267cmr244520105ad.16.1778435556136;
        Sun, 10 May 2026 10:52:36 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d008:80b:a00:27ff:feb6:42dd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e374besm83169715ad.47.2026.05.10.10.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 10:52:35 -0700 (PDT)
From: Pramod Maurya <pramod.nexgen@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nikolayof23@gmail.com,
	Pramod Maurya <pramod.nexgen@gmail.com>
Subject: [PATCH v2 1/4] staging: rtl8723bs: Replace __attribute__((packed)) with __packed in ieee80211.h
Date: Sun, 10 May 2026 13:52:04 -0400
Message-ID: <20260510175207.563378-2-pramod.nexgen@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260510175207.563378-1-pramod.nexgen@gmail.com>
References: <20260510175207.563378-1-pramod.nexgen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the verbose __attribute__ ((packed)) with the preferred
kernel shorthand __packed in struct eapol and struct ieee80211_snap_hdr.

Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
---
 drivers/staging/rtl8723bs/include/ieee80211.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index fbb12fe31a6c..7a3609d019aa 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -231,7 +231,7 @@ struct eapol {
 	u8 version;
 	u8 type;
 	u16 length;
-} __attribute__ ((packed));
+} __packed;
 
 #define IEEE80211_FCS_LEN    4
 
@@ -274,7 +274,7 @@ struct ieee80211_snap_hdr {
 	u8    ssap;   /* always 0xAA */
 	u8    ctrl;   /* always 0x03 */
 	u8    oui[P80211_OUI_LEN];    /* organizational universal id */
-} __attribute__ ((packed));
+} __packed;
 
 #define SNAP_SIZE sizeof(struct ieee80211_snap_hdr)
 
-- 
2.52.0

