Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0779481A9D
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119845; cv=none; b=IKTlBmHnIvu5DKpvA8q6GAUHA2DcAWvRARQL44Y34XzTd9Qf2dwIVI7BYvyEg0cuGJfsfjZvwbjpmZN71+npzmbBXO9A8uLVfBBSmrbBI/0EwgNEs9drozKuJFB5gVa4r6cCRNJGIemjB4tJViCVDy7BcxwJqUWIOJ2opfoH9KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119845; c=relaxed/simple;
	bh=cPk5o9xZQlZRpoDRRXFcK94zW/JW9mx4H5C7vF0GpXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kljk911GCHU63CmpqFaZqaxTzLxB/2heOvXep4SEYRenseZnUVeQmOROBWMdZ0uWpcgUc0qhaVVRYE/s4LehPss/C40WeyZNJ3wDGqd2GOh05Dim4tmTNFF+f2tisQ0mm1wnH7Y7/LiFTFvxKEg9kBaJsfH+m5PcvZEldv91GQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1VTmYM1; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1VTmYM1"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so7804266e87.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119838; x=1784724638; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nnEmABn36nReF54sXLFaE23DbbF9DMEhTK4qKYnVCLM=;
        b=V1VTmYM1KXL1Hf+tnVfG/W3N+BQWF+cITUkyrBHmxfCno/uh4rMqMRqDdRV8p3knpu
         N0c3yLaSyub/PuD/r1jQ6KsIlc7p5GcQBtxTwsWbp4AQJD2e1PofGkc9TiTYAqi3KQOS
         n3sjx7rT+0aIVQKymAJxZF/RTMxkd/tAaWKEK+JpRIAFYty1h0F1AYBWQRwKenh12zqZ
         tu2t6bApuHVf9rOnsMCs28tr90dIhnd8cj9tgJ77NguDsnumXIYUXMudv5nyNiuDjCOV
         sTya+Ntg6A7VH2+roDzE96ybHGgGwMG2p5r5k3T65oGlJUxLcrsMeCDr4TyV5Ke3z2NK
         9+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119838; x=1784724638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nnEmABn36nReF54sXLFaE23DbbF9DMEhTK4qKYnVCLM=;
        b=kkKhzxFVwwoYdbt3YmwpfzPU9j1Ojw2vKxqBaVm8NXxTM5pvhx0dN8v9sgBBHogYbM
         KWh0M5g+CrKR17z7l6Hv+CIXi0jUX3Ec8m72G+T3GCPcrEEFxeEjd4YwvO+EIchBimOY
         T2a6Gi01m+VTsL2Ps2Nlv5JgPAKd54negnTEIMMrnlOMsn+FMtGj2FBb3dMs9DmI9ykN
         psdoHH6Ac7K+DZD2rbfA+IaHWz7ahSF6R7ILi9FLgj7xPdnVhObWHlsRsWJGuaa/+9Zg
         JY0mJQN//52nt9XpFNLDYhXq96ZlGaN3qmEoDvXAsYipleNuZ3GE9Zp7lxn5Dq4mcdLI
         MRVg==
X-Gm-Message-State: AOJu0YxqEfGN/oQzOlE7xXZ2TrUpL0IFskxP9VxHACRUfU85dHne2E82
	0sn8DBeOLO2O6epsEUX17+2rv2BEPmXfq4m2ltK4Rnf+RPq0AGjyJEdm
X-Gm-Gg: AfdE7ckvueJNX05yv5JtGS78DyozHsZWk67WS+yS015WPXXwThOhgeO+0zuoDwL9MHb
	PcuQh02qRTe9iYjXf00c+/EImAd6xukDfF5myMJHbFgZIm/GklkcnSBlRVXdXbgwTapSq+0eWgt
	KvhFsrE/dsnxn9ekSuQjDdS3KlAeuSlUu3VJ6pyUIkzeVg0xWL/ocYv7I8yCDCn44npYRNouL27
	PwaphPDTgi82pN9S9482yesZRb/sLvYILB1WSi3JQL0hqN+e5qog8NRiz6WycMTYArJe+AIq7lY
	ym0aLzNAfb11uM7VXJ4ff9nJR0AhPUDqpW7zpqGNI/PGCd6B+ti4svgjbetZAWwVnPx39ppLUWQ
	+3wEzi6EMqCdCspwgfr5N3+o6cpY/E5ca/OmfCLRQ4mZ2diO8m+H7VTJE5B+ZcIW6U2Ab5+3SfG
	X1SiVns/6zikAI26U/gS9i7I2MXYhQszDL+nsCTOx3cy2XDAhs/DjiHx4gNKEKNJUe1Nc5UDvBy
	eTQZmNNFrGG0w==
X-Received: by 2002:ac2:47ec:0:b0:5b0:15b1:3d4b with SMTP id 2adb3069b0e04-5b1582a34bfmr1173162e87.37.1784119837670;
        Wed, 15 Jul 2026 05:50:37 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:37 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 28/61] staging: rtl8723bs: inline single-use _clear_cam_entry helper
Date: Wed, 15 Jul 2026 19:47:56 +0700
Message-ID: <20260715124829.90290-29-ulijg308@gmail.com>
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

Remove the _clear_cam_entry() helper function since it has only a
single call site across the driver.

Inline its logic directly into the sole invocation site and modernize
the array declarations. Replace the verbose 'unsigned char' types with
the standard kernel 'u8' type, and swap the explicit hexadecimal zero
sequences for clean, fixed-size bounds with zero-initializers ({0}).

This eliminates an unnecessary abstraction layer, reduces visual noise,
and cleans up the driver's CAM management path.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c   | 13 ++++---------
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h |  1 -
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 053861f29..c85055687 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -423,14 +423,6 @@ void _write_cam(struct adapter *padapter, u8 entry, u16 ctrl, u8 *mac, u8 *key)
 	}
 }
 
-void _clear_cam_entry(struct adapter *padapter, u8 entry)
-{
-	unsigned char null_sta[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
-	unsigned char null_key[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
-
-	_write_cam(padapter, entry, 0, null_sta, null_key);
-}
-
 inline void write_cam(struct adapter *adapter, u8 id, u16 ctrl, u8 *mac, u8 *key)
 {
 	_write_cam(adapter, id, ctrl, mac, key);
@@ -439,7 +431,10 @@ inline void write_cam(struct adapter *adapter, u8 id, u16 ctrl, u8 *mac, u8 *key
 
 inline void clear_cam_entry(struct adapter *adapter, u8 id)
 {
-	_clear_cam_entry(adapter, id);
+	u8 null_sta[6] = {0};
+	u8 null_key[16] = {0};
+
+	_write_cam(adapter, id, 0, null_sta, null_key);
 	clear_cam_cache(adapter, id);
 }
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 4b05779f2..2b8df2bdb 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -449,7 +449,6 @@ unsigned int decide_wait_for_beacon_timeout(unsigned int bcn_interval);
 
 /* modify HW only */
 void _write_cam(struct adapter *padapter, u8 entry, u16 ctrl, u8 *mac, u8 *key);
-void _clear_cam_entry(struct adapter *padapter, u8 entry);
 
 /* modify both HW and cache */
 void write_cam(struct adapter *padapter, u8 id, u16 ctrl, u8 *mac, u8 *key);
-- 
2.55.0

