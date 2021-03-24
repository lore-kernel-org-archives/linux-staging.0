Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1C06E
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 18:38:40 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id o16so25497358wrn.0
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 11:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0WV7hJCkwDNUW3Sk9azilbM6DPflOTQN8kctr+65Mcc=;
        b=L1Id035rKFBkqEzGaGqoltxbRZuQ1s94lGwpLn7cXVJ/M2W7RLkIZu8hhhJxU/Zynn
         HzKfJKgdRJvoAarOx7peGsM6i2RtYFu2qqi2L2MJZygiZ9gDwQUxCmg1JBak6217uhe5
         ony2VuVG82N+XEZL0K0chlfZFzboxU5AdRZoiSR7zLost9t9nk99g8VEbpeDYsoSXvZo
         F6VRNcXknYsBNmhH9bl7mwVyxPoA7KpxnygUx1BZrWm3jdtvFZjBTrSoDxNAJyIccuw+
         gjaXeQHIsI16lCqs+sGnwh5EbO8R0nO2D9VDGGwRWBZIn9NilbIKYYIzsVxah2851GnV
         knEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0WV7hJCkwDNUW3Sk9azilbM6DPflOTQN8kctr+65Mcc=;
        b=OOfTKLZ8jAVJXbvgcwimRWQi1InVJhQvjYZ30WrhAzvH47z6+Qx90hHZonoFMTasJD
         LHswjlXTXxF+OmK37Buyi3Pu4Tdqcr4UnsqgYsiHKZrRYEr+Lfz5rYOnTCJtsk3q4iRy
         wz/EECHLb1twcX4huLtDZnQlLnOfomi9x/N8p0H9sxyFRR4+zIkakaajSfvRv1+4K4pp
         h8CcmBgnDzX/X8MKONeI/Awf2tc0lonh3vnmvftxp8pjxB+6Sb6uhN/HZiiPOgnxsRk9
         PIXy5lX54Y4zTGzul9JhewAJPVxJqyzMAvRz/qZvjAYjIkqLG5hR7+U9LqxTfofmTE80
         Vo7Q==
X-Gm-Message-State: AOAM531T0D0dzuZZq6xqL9H0tC3D8i/HUlHWKNQj9hCwP/6JnMqkXkOH
	r/LGWMZ2tUzI89Bha03Ykik=
X-Google-Smtp-Source: ABdhPJxvPVr6DFJW29zSmr8rHjeNTJLfeMpBJdvYekmMnrid9XnXv8y8YXdkSJZszbGzo4F0hEHWIA==
X-Received: by 2002:a05:6000:2c8:: with SMTP id o8mr4934625wry.407.1616611119319;
        Wed, 24 Mar 2021 11:38:39 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id z2sm4358040wrm.0.2021.03.24.11.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 11:38:39 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 01/21] Staging: rtl8723bs: remove enums in rtw_mlme.h
Date: Wed, 24 Mar 2021 19:38:27 +0100
Message-Id: <20210324183847.5595-2-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324183847.5595-1-marcocesati@gmail.com>
References: <20210324183847.5595-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum definitions in
include/rtw_mlme.h:

	enum DriverInterface
	enum scan_result_type

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_mlme.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 25cfb4cc021b..f70c6da12d5d 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -96,18 +96,6 @@ enum  _band {
 
 #define rtw_band_valid(band) ((band) >= GHZ24_50 && (band) < GHZ_MAX)
 
-enum DriverInterface {
-	DRIVER_WEXT =  1,
-	DRIVER_CFG80211 = 2
-};
-
-enum scan_result_type {
-	SCAN_RESULT_P2P_ONLY = 0,		/* 	Will return all the P2P devices. */
-	SCAN_RESULT_ALL = 1,			/* 	Will return all the scanned device, include AP. */
-	SCAN_RESULT_WFD_TYPE = 2		/* 	Will just return the correct WFD device. */
-									/* 	If this device is Miracast sink device, it will just return all the Miracast source devices. */
-};
-
 /*
 
 there are several "locks" in mlme_priv,
-- 
2.30.2

