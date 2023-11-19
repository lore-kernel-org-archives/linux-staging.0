Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4054311CB7
	for <linux-staging@lists.linux.dev>; Sun, 19 Nov 2023 22:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJ/IK6S7"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-408434ce195so10205335e9.0
        for <linux-staging@lists.linux.dev>; Sun, 19 Nov 2023 14:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700432112; x=1701036912; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FBjgqP02grvuhK+DBWx2eCwwUqM0RvQ4/hJhGy33ZEM=;
        b=HJ/IK6S7aZuo5RECIvRpPThx012Sfp8g6CuFsjVZanWoAEIsD6IC4ryHU70eHMPgam
         hPoTibyqhWFjTshpmqfZ5v3qgzRYSMZVMwjibHcD4K+6ynZ2rW9HrxOa4zRLGcA+f2sc
         8RocgOZNLmag3tF09GoBnPXIfE/KKf8+rhiE7na9GIFrAkWKGnNdKqZihpaaaDY5ALOk
         AmybEYwa0GYAaZR7AdqLyE8E9bB5Achb2lSUisK/TlbocSqAsfM3wK9PvJlTFuVLfeAM
         p5iCF5f73pBWS7vVkEc5BCgQO3pcqfO+VLqKlk+LxUj5U4Oms5GefzIiwLK48u5UxYmV
         nsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700432112; x=1701036912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBjgqP02grvuhK+DBWx2eCwwUqM0RvQ4/hJhGy33ZEM=;
        b=hOBzQKIt6RM6QHDxJ17Iqzamh8nhq2ki/bUCeF6yvkCoxlQ7+yIUfRV46UfH9F9uX+
         uDzPG/aIT4X3ZHQawMd6MapRq1Xmac9WBeda2M0muzy5/TeSTp2Wn8i5oghMfWgF0L4d
         e2YzPbk6yB9c5kGbKF31mud3RTk7kD+ONf58VTNBlz7hbPlFhAufu7+MOVi4eUXuPi5x
         LEKDTUth1DXQIYhM/vSdpgOarlAQIqTnL9aj1Qyraccc7zDWG5L9Hhp2nPPNudFBfH+C
         6kohB/Cbac8AkSMGzcwvc4uflgAmL/QsVMlGjIx1jR0pcy8I95VrCE5CO7rpM/UjvN6U
         2Qrg==
X-Gm-Message-State: AOJu0YygmvlUN4t203oZiGgK2CXlv3L/EQ931akQtjjnwjjgpYeZ0gVb
	ioWpVV8ZrVqUEKkIuxSbCjo=
X-Google-Smtp-Source: AGHT+IE2p6BOd31Q9tTqJcohhMYsWkZHaI6dEiTvJ2SqrnQkH+c3ZKtU4Yx8vMMvQEDSp5zmb4RR2Q==
X-Received: by 2002:a5d:5588:0:b0:32f:820c:44b0 with SMTP id i8-20020a5d5588000000b0032f820c44b0mr4468016wrv.0.1700432112255;
        Sun, 19 Nov 2023 14:15:12 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id s5-20020adfdb05000000b0032d8eecf901sm9221008wri.3.2023.11.19.14.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 14:15:12 -0800 (PST)
Date: Sun, 19 Nov 2023 23:15:10 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 06/14] staging: rtl8192e: Remove unused macros
 IS_EQUAL_CIE_SRC and friends
Message-ID: <6d514e946983fb8ef4a3d7d3cb2774261a593d2f.1700431464.git.philipp.g.hortmann@gmail.com>
References: <cover.1700431464.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1700431464.git.philipp.g.hortmann@gmail.com>

Remove unused macros IS_EQUAL_CIE_SRC, UPDATE_CIE_WATCHDOG,
UPDATE_CIE_SRC and IS_COUNTRY_IE_VALID.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/dot11d.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/staging/rtl8192e/dot11d.h b/drivers/staging/rtl8192e/dot11d.h
index 0ca803be3965..fd0a2df189bf 100644
--- a/drivers/staging/rtl8192e/dot11d.h
+++ b/drivers/staging/rtl8192e/dot11d.h
@@ -52,15 +52,6 @@ static inline void copy_mac_addr(unsigned char *des, unsigned char *src)
 #define GET_DOT11D_INFO(__ieee_dev)			\
 	 ((struct rt_dot11d_info *)((__ieee_dev)->dot11d_info))
 
-#define IS_COUNTRY_IE_VALID(__ieee_dev)			\
-	(GET_DOT11D_INFO(__ieee_dev)->country_len > 0)
-
-#define IS_EQUAL_CIE_SRC(__ieee_dev, __address)		\
-	 ether_addr_equal_unaligned( \
-		GET_DOT11D_INFO(__ieee_dev)->country_src_addr, __address)
-#define UPDATE_CIE_SRC(__ieee_dev, __address)		\
-	copy_mac_addr(GET_DOT11D_INFO(__ieee_dev)->country_src_addr, __address)
-
 #define GET_CIE_WATCHDOG(__ieee_dev)				\
 	 (GET_DOT11D_INFO(__ieee_dev)->country_watchdog)
 static inline void RESET_CIE_WATCHDOG(struct rtllib_device *__ieee_dev)
@@ -68,8 +59,6 @@ static inline void RESET_CIE_WATCHDOG(struct rtllib_device *__ieee_dev)
 	GET_CIE_WATCHDOG(__ieee_dev) = 0;
 }
 
-#define UPDATE_CIE_WATCHDOG(__ieee_dev) (++GET_CIE_WATCHDOG(__ieee_dev))
-
 void dot11d_init(struct rtllib_device *dev);
 void dot11d_channel_map(struct rtllib_device *ieee);
 
-- 
2.42.0

