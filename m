Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A16101C7
	for <linux-staging@lists.linux.dev>; Sat, 18 Nov 2023 08:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZmgdnxPj"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9c6f0530929so74972666b.1
        for <linux-staging@lists.linux.dev>; Sat, 18 Nov 2023 00:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700297530; x=1700902330; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gFd2CKAAw+CngGdGEaZh2Jv1ZJmAu581+YDJTtGJesA=;
        b=ZmgdnxPjBZiYO1iVoIHeP3bXN1k4dh++WDfdqLsI1i72nchW+/HE4lAZuXtFV89F5i
         y4MvwB3jDDFBKbm8Q3X85VyvpE9IbfgNlftNML8JlsLcTLg4C7F/mvBxXaPwHVPGCM8R
         WE7vWcHcsmr2CocBzyjksMDAOAiAHpgBDOl+O02tTOjlOMtLGlq7QqCw7ULzvxwcZc8M
         woaw4qan4GBaLpHPtAK9jLi0dDFEKpC63s1iDge49SyvKL71MXE3Dj2FMgx1c+BNgp69
         7/LvOSHQSCBoOW8qhNqAOU7bgPGvHrquxIDBnrzDZXBYR6rERRQeP5siQ7ezINjhc+tt
         bZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700297530; x=1700902330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFd2CKAAw+CngGdGEaZh2Jv1ZJmAu581+YDJTtGJesA=;
        b=vd7bSLEs0urPitO8n+35LTgrNhv2kY7Ti0PKL/iZFWEM/9yQPSVoB7Ud9WC9sOdCef
         EXiwRWAQ5Gir0v6Xqy6YH8iGDOQ6BiOncNx9VlsKD/kXE41fFlY0vpxVlYGOrIN5/OB9
         aceN2P+mL3evWqbkuXRIrWRPZH+i9y3V6BSBNyeZVt3fgLt+IfGzLY+HJNubHm6hqvjb
         Xo+4XBMl/Rc83WG2sOFTd419BH082tK4ii7aRqxtBNmXaXontlMIKowdwkq4giLW+VJK
         3FRwIqkqENmEnevrpfultFicVmpKXaRa9po/nMBO0beLT0bXOfb+WIy0WVNTCoa8pbSl
         EtWg==
X-Gm-Message-State: AOJu0YzwOHj/z44haJz9v7Iw+0lndhv904DtVZ7pC2iypofdTtztwvN+
	6vX7psBKgD9jDAxEvOpCbB4gGFH4Thw=
X-Google-Smtp-Source: AGHT+IGnryVDS7JHAkUlNiTu8DrhaiLJgOXSO9KK2u45C9vEI5TrtF4vuz+BwNel21wX6+3v7eGyCQ==
X-Received: by 2002:a17:906:10cf:b0:9cb:b737:e469 with SMTP id v15-20020a17090610cf00b009cbb737e469mr1213341ejv.4.1700297529807;
        Sat, 18 Nov 2023 00:52:09 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57ba2f20.dip0.t-ipconnect.de. [87.186.47.32])
        by smtp.gmail.com with ESMTPSA id r15-20020a1709067fcf00b00985ed2f1584sm1668337ejs.187.2023.11.18.00.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 00:52:09 -0800 (PST)
Date: Sat, 18 Nov 2023 09:52:08 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 10/10] staging: rtl8192e: Remove constant index from
 channel_array[]
Message-ID: <379293f2b48d176aaafb023d36aac9bb057f67c7.1700296319.git.philipp.g.hortmann@gmail.com>
References: <cover.1700296319.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1700296319.git.philipp.g.hortmann@gmail.com>

Used index of channel_array[] is always COUNTRY_CODE_WORLD_WIDE_13. Remove
index and store only used entry in channel_array. This shortens the code
and increases readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/dot11d.c            | 31 +++-----------------
 drivers/staging/rtl8192e/dot11d.h            |  2 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c |  2 +-
 3 files changed, 6 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/rtl8192e/dot11d.c b/drivers/staging/rtl8192e/dot11d.c
index 37106fd54f00..fdc39e6e7abb 100644
--- a/drivers/staging/rtl8192e/dot11d.c
+++ b/drivers/staging/rtl8192e/dot11d.c
@@ -12,28 +12,7 @@ struct channel_list {
 	u8      len;
 };
 
-static struct channel_list channel_array[] = {
-	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 36, 40, 44, 48, 52, 56, 60, 64,
-	  149, 153, 157, 161, 165}, 24},
-	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, 11},
-	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 36, 40, 44, 48, 52, 56,
-	  60, 64}, 21},
-	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}, 13},
-	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}, 13},
-	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 36, 40, 44, 48, 52,
-	  56, 60, 64}, 22},
-	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 36, 40, 44, 48, 52,
-	  56, 60, 64}, 22},
-	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}, 13},
-	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 36, 40, 44, 48, 52,
-	  56, 60, 64}, 22},
-	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 36, 40, 44, 48, 52,
-	 56, 60, 64}, 22},
-	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, 14},
-	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}, 13},
-	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 36, 40, 44, 48, 52,
-	  56, 60, 64}, 21}
-};
+static struct channel_list channel_array = {{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}, 13};
 
 void dot11d_init(struct rtllib_device *ieee)
 {
@@ -49,7 +28,7 @@ void dot11d_init(struct rtllib_device *ieee)
 }
 EXPORT_SYMBOL(dot11d_init);
 
-void dot11d_channel_map(u8 channel_plan, struct rtllib_device *ieee)
+void dot11d_channel_map(struct rtllib_device *ieee)
 {
 	int i;
 
@@ -57,10 +36,8 @@ void dot11d_channel_map(u8 channel_plan, struct rtllib_device *ieee)
 
 	memset(GET_DOT11D_INFO(ieee)->channel_map, 0,
 	       sizeof(GET_DOT11D_INFO(ieee)->channel_map));
-	for (i = 0; i < channel_array[channel_plan].len; i++) {
-		GET_DOT11D_INFO(ieee)->channel_map[channel_array
-				[channel_plan].channel[i]] = 1;
-	}
+	for (i = 0; i < channel_array.len; i++)
+		GET_DOT11D_INFO(ieee)->channel_map[channel_array.channel[i]] = 1;
 
 	for (i = 12; i <= 13; i++)
 		GET_DOT11D_INFO(ieee)->channel_map[i] = 2;
diff --git a/drivers/staging/rtl8192e/dot11d.h b/drivers/staging/rtl8192e/dot11d.h
index 6d2b93acfa43..78d1ca1e7743 100644
--- a/drivers/staging/rtl8192e/dot11d.h
+++ b/drivers/staging/rtl8192e/dot11d.h
@@ -75,7 +75,7 @@ static inline void RESET_CIE_WATCHDOG(struct rtllib_device *__ieee_dev)
 #define UPDATE_CIE_WATCHDOG(__ieee_dev) (++GET_CIE_WATCHDOG(__ieee_dev))
 
 void dot11d_init(struct rtllib_device *dev);
-void dot11d_channel_map(u8 channel_plan, struct rtllib_device *ieee);
+void dot11d_channel_map(struct rtllib_device *ieee);
 void dot11d_reset(struct rtllib_device *dev);
 void dot11d_update_country(struct rtllib_device *dev, u8 *address,
 			   u16 country_len, u8 *country);
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 68bd03500267..4b842a1789c2 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -796,7 +796,7 @@ static short _rtl92e_get_channel_map(struct net_device *dev)
 	struct r8192_priv *priv = rtllib_priv(dev);
 
 	dot11d_init(priv->rtllib);
-	dot11d_channel_map(COUNTRY_CODE_WORLD_WIDE_13, priv->rtllib);
+	dot11d_channel_map(priv->rtllib);
 	for (i = 1; i <= 11; i++)
 		(priv->rtllib->active_channel_map)[i] = 1;
 	(priv->rtllib->active_channel_map)[12] = 2;
-- 
2.42.0

