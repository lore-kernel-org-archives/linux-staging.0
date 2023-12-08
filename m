Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7932541C87
	for <linux-staging@lists.linux.dev>; Fri,  8 Dec 2023 18:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bltxZn9y"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2c9f8456a06so6504481fa.0
        for <linux-staging@lists.linux.dev>; Fri, 08 Dec 2023 10:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702059587; x=1702664387; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hOrnZdekpeAnHe7xn8UUPJWAs5TkKWMYRyhQfSDptvQ=;
        b=bltxZn9ymQGYBaI4LrO41gTxgjLc2yyRRQNgBRIDlAJ24bFHoLYYQPe+AyxHn/G4xv
         FWb8+E6pcfum6Y+BU20G+KFIKH4gLelovpgNKrhboPQZzWEj8kmHSEyJtdAldOxzh6vY
         N/u+72Dsd+/y5CwThXd/NMgNh4EcAidPvbpH8xd97hhcsI8xan3IviMkG7AJWwYYCPrb
         1gsroZl6x6m8/wdo5gSfm6ZOxYDSiHCCYLKFc7nf0oiEc7vsUJC4zjFOh/vTFYObVeH8
         b5i+tIy5RESKO7cbPrX3tZQfYZoQ5O8QH/g8/5LDF3ozkyw/+NS53cRH9LT/UM9zW0F0
         VaRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702059587; x=1702664387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOrnZdekpeAnHe7xn8UUPJWAs5TkKWMYRyhQfSDptvQ=;
        b=T47hNdc5tdg3t1Jtdl7cI4DBXZFcZyteFRam2eLiuFtdMSDH81xAMFW/o5Uuqc3VsW
         Mblwt+osTGAiPhJHqkM2rlRuPTt4s1/1OhFP1EGDEHwa/WG41iq/z8ilOfEd4A9nDAL6
         fbvVrCqoBWtXChm5LbOkIhXjWVnoDcHARwZX5Du1TQ0Fo8r+/TPROIC/lMdttpgouA45
         DhrIhQ1pYIOVX9uwHkN9ZPYfqAaqurKYwnxzGUOI0k5BlmNjNzgxueP3xo8rbAuxbON/
         vMvM0nUeX2Ld0Wj0ieACEczj56NdB9m+j/xCyoIT0Wjc7gdASh1GHz00GFu2h3arQsKl
         fHAg==
X-Gm-Message-State: AOJu0YxjGOtg796EET6v7tgyGVWiZQzNJ+s4eYjoLmXWvE00Kob923Zb
	pxidBbKe733L+aMl69lBTDU=
X-Google-Smtp-Source: AGHT+IEEMuA8qPG84k8dFSXpZgNwYxw8lx2Nozdz1oeVgXDapu7AXQsf4jIMKJRYMkMTlkdoqyeqig==
X-Received: by 2002:a2e:bc02:0:b0:2ca:143:a52f with SMTP id b2-20020a2ebc02000000b002ca0143a52fmr458391ljf.2.1702059587157;
        Fri, 08 Dec 2023 10:19:47 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id ts4-20020a170907c5c400b00a1cc1be1158sm1277639ejc.165.2023.12.08.10.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 10:19:46 -0800 (PST)
Date: Fri, 8 Dec 2023 19:19:45 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] staging: rtl8192e: Remove variable channel_map
Message-ID: <19ca762b4b9d5a3e857b31c22f0688324ca3bd9d.1701989555.git.philipp.g.hortmann@gmail.com>
References: <cover.1701989555.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1701989555.git.philipp.g.hortmann@gmail.com>

Remove variable channel_map as it is initialized but not used. Remove
channel_array as well as it is without channel_map unused.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/dot11d.c | 10 ----------
 drivers/staging/rtl8192e/dot11d.h |  1 -
 2 files changed, 11 deletions(-)

diff --git a/drivers/staging/rtl8192e/dot11d.c b/drivers/staging/rtl8192e/dot11d.c
index d51d4afff61e..c44ff26e8d61 100644
--- a/drivers/staging/rtl8192e/dot11d.c
+++ b/drivers/staging/rtl8192e/dot11d.c
@@ -12,18 +12,8 @@ struct channel_list {
 	u8      len;
 };
 
-static struct channel_list channel_array = {{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}, 13};
-
 void dot11d_channel_map(struct rtllib_device *ieee)
 {
-	int i;
-
-	memset(GET_DOT11D_INFO(ieee)->channel_map, 0,
-	       sizeof(GET_DOT11D_INFO(ieee)->channel_map));
-	for (i = 0; i < channel_array.len; i++)
-		GET_DOT11D_INFO(ieee)->channel_map[channel_array.channel[i]] = 1;
 
-	for (i = 12; i <= 13; i++)
-		GET_DOT11D_INFO(ieee)->channel_map[i] = 2;
 }
 EXPORT_SYMBOL(dot11d_channel_map);
diff --git a/drivers/staging/rtl8192e/dot11d.h b/drivers/staging/rtl8192e/dot11d.h
index 5c02e51c39cd..d047283f2ceb 100644
--- a/drivers/staging/rtl8192e/dot11d.h
+++ b/drivers/staging/rtl8192e/dot11d.h
@@ -19,7 +19,6 @@
  */
 
 struct rt_dot11d_info {
-	u8  channel_map[MAX_CHANNEL_NUMBER + 1];
 };
 
 #define GET_DOT11D_INFO(__ieee_dev)			\
-- 
2.43.0

