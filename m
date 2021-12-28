Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC80B2CA4
	for <linux-staging@lists.linux.dev>; Tue, 28 Dec 2021 10:11:51 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id q16so37389689wrg.7
        for <linux-staging@lists.linux.dev>; Tue, 28 Dec 2021 02:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oY9hSfkqZTFPqAFtoGBpdMUae0krMzwYjwLMqlw8+0I=;
        b=JHfloE24oleodZ3g+wWzd3v/hSXxLN6jmrsVGqZ/iN4MQYQsax2gGyFoQDuOrFUfyc
         Ft99f3nus0fTrbAguzYnQvwxtOluL5tSq3Hj+LRYnDQfk/ocIj+AO8z6hQ0KwLNQAtWA
         v7u38tHMUdHUHj2p8v1BbVBA5jkgsJnJ1tFYGJLfevlvQhkl2D7qi23VLPuXOouqYPaP
         Hf6LPMQL3kcQ3H/wA60+mrwaE84eIUS7XTZYY/C5SQSuPGM2xDk3PMXDI2rWKApidx9w
         MwXH47DYQoXWpzqNuN1hXSgw3JYWIGy9LkbMsqrtdTXaoyPx6S+gMvGL+mJra0aW3tyK
         ZsNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oY9hSfkqZTFPqAFtoGBpdMUae0krMzwYjwLMqlw8+0I=;
        b=X4ionPSHYLBRuTVUOIhIsMWCePQUTbLX2xBcsDShHBRRDBHXYyqp9OjHZKBDMpxPpT
         Ui0H5t/PtNLjc9GJTbdLGB9JP/ZpTZ6bFWIzDWBzBOlFa5pExQzLSYEo/1jzXJtYGjMH
         h8iD1gNVVB9Xzho2A2W8dkdKj/YE/QtMXLZ9CrKzRDJbW2aKCjqgiJeJ9OkSxsa38x0b
         UZ8l6pYx1qFxVnDfW+OcX8JO+Ee80bDs9qNMhHqQAb2VTTQmW0QVQjMBoS9qyst5LlTA
         /PMrwJWRz/gaaOo8qa1XgqicUnXvLNYDfs2CqC+Sv8+4tElbqtK4Gg14QHrsk7PkTKuk
         Zd1w==
X-Gm-Message-State: AOAM532DNeeblV5R77cwXglVY14Rwsthps25smlw9s/qrk05cBZTLNHh
	TeYa1j8p6POOA55NABUVqvE=
X-Google-Smtp-Source: ABdhPJzNxtaG7srAogqMjSOtL5UgMh5WTzO8tfE7aTZKkZe08FODYcEuoKfzyHp5COgFsW/IaSs14Q==
X-Received: by 2002:a05:6000:2a9:: with SMTP id l9mr15786747wry.185.1640686310321;
        Tue, 28 Dec 2021 02:11:50 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id d62sm21160984wmd.3.2021.12.28.02.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Dec 2021 02:11:50 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 10/10] staging: r8188eu: merge _ReadLEDSetting() into ReadAdapterInfo8188EU()
Date: Tue, 28 Dec 2021 11:11:20 +0100
Message-Id: <20211228101120.9120-11-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211228101120.9120-1-straube.linux@gmail.com>
References: <20211228101120.9120-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function _ReadLEDSetting() sets only a single variable and the only
user is ReadAdapterInfo8188EU(). Remove _ReadLEDSetting() and set the
variable in ReadAdapterInfo8188EU() directly.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_halinit.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 9edde72aebb2..b362c622ea8a 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -914,12 +914,6 @@ unsigned int rtl8188eu_inirp_init(struct adapter *Adapter)
 /*	EEPROM/EFUSE Content Parsing */
 /*  */
 /*  */
-static void _ReadLEDSetting(struct adapter *Adapter, u8 *PROMContent, bool AutoloadFail)
-{
-	struct led_priv *pledpriv = &Adapter->ledpriv;
-
-	pledpriv->bRegUseLed = true;
-}
 
 static void Hal_EfuseParseMACAddr_8188EU(struct adapter *adapt, u8 *hwinfo, bool AutoLoadFail)
 {
@@ -939,6 +933,7 @@ static void Hal_EfuseParseMACAddr_8188EU(struct adapter *adapt, u8 *hwinfo, bool
 void ReadAdapterInfo8188EU(struct adapter *Adapter)
 {
 	struct eeprom_priv *eeprom = &Adapter->eeprompriv;
+	struct led_priv *ledpriv = &Adapter->ledpriv;
 	u8 eeValue;
 
 	/*  Read EEPROM size before call any EEPROM function */
@@ -966,7 +961,7 @@ void ReadAdapterInfo8188EU(struct adapter *Adapter)
 	Hal_ReadAntennaDiversity88E(Adapter, eeprom->efuse_eeprom_data, eeprom->bautoload_fail_flag);
 	Hal_ReadThermalMeter_88E(Adapter, eeprom->efuse_eeprom_data, eeprom->bautoload_fail_flag);
 
-	_ReadLEDSetting(Adapter, eeprom->efuse_eeprom_data, eeprom->bautoload_fail_flag);
+	ledpriv->bRegUseLed = true;
 }
 
 static void ResumeTxBeacon(struct adapter *adapt)
-- 
2.34.1

