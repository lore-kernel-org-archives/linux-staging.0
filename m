Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE1171
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 09:49:23 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id t5-20020a1c77050000b029010e62cea9deso2664181wmi.0
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 02:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0UFdP1R33F+nbgEZYNFoUDrhXnsfxX1nwM1SbveKev8=;
        b=Q5s4QlsAC5OvvMCYx1m98XX1lgKn448QqTHtHFJ8gOz0L9ee5ZpHRLPPYPNSPk2J/G
         og1GLThfJdjfAFgHOu+I/Y4/4wGMxLC0yiS1tD+B9xe8WkgQpk6ZxFQktqHewUdov1GO
         dwcWQDh2SkN/ltfvMkzrIiwwpCvUKVYElrrnqiqeCJ9WbsuS7/golq3zsdkzX2zsh3N2
         /wL2ZH4X4yYVJzDuoETj5H6mImU4Lt/ag9XN8gvdvC+u5yO2hOWTgD/AEpcip7uXg4dZ
         /NeWUsJrn2aQF0YKupAzRED5ke9F6OQ4UORKNyMrB8X4K2knjAMEJ4GW5v5N7auTbuuU
         P31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0UFdP1R33F+nbgEZYNFoUDrhXnsfxX1nwM1SbveKev8=;
        b=mB4isyXlXMYMoshW87Mz28KSe8Wg79rv7/8HWkf8oxOEv7VE0EKSRlP/MG7doRrWON
         Sm5Oi+oP4h2rdCGfR36wiDXnvbMPbuIA4c5XYsBVLhbW/fzFqErNiX+g+wTT/VWj3vWk
         L8GaE5XvK3BabYG+LUfYaVe/HYjCzFWjcAvhmw2RBkCvdzOIrRRKeD+OxmwcRZQ4zYtm
         lYhSi7tl54i4/bZ+Q/bokc3rIqyf2vEreMBd1M4zqqLWIUiURRabNv9sCRnmh4tXCoD8
         ixinHocOJ404B+HlSbJigEBw7sMJzCBwgd+gWf1PRm37o9LkklQBRoj83ZSOR4ngod9i
         hI3w==
X-Gm-Message-State: AOAM531N0ET/+m8bq0eRgNRXd0T3zoNe9eqFMbnnS6qEL/ZOw7g7VygF
	9S0s2nZssDFyso0n9FJdQHk=
X-Google-Smtp-Source: ABdhPJzrh6tJd9bZKrAh5Cfgu+tuXoT2VED6HB7tPxpShxdKwfB5ShlEmcSGnsfvP9ze9PvRIae3GQ==
X-Received: by 2002:a7b:c186:: with SMTP id y6mr12417103wmi.84.1616752162022;
        Fri, 26 Mar 2021 02:49:22 -0700 (PDT)
Received: from lorien (home.raoult.com. [78.214.78.108])
        by smtp.gmail.com with ESMTPSA id h13sm9063461wmq.29.2021.03.26.02.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 02:49:21 -0700 (PDT)
Received: by lorien (Postfix, from userid 1000)
	id 125611402F9; Fri, 26 Mar 2021 10:49:19 +0100 (CET)
From: Bruno Raoult <braoult@gmail.com>
To: gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	zhaoxiao@uniontech.com,
	dan.carpenter@oracle.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bruno Raoult <braoult@gmail.com>
Subject: [PATCH 2/5] r8192U_wx.c: style: spaces preferred around operators
Date: Fri, 26 Mar 2021 10:48:32 +0100
Message-Id: <e7298c14538ad7a58720585d019a70f637e0cdb1.1616748922.git.braoult@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1616748922.git.braoult@gmail.com>
References: <cover.1616748922.git.braoult@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix checkpatch.pl check:

CHECK: spaces required around that <op>
in drivers/staging/rtl8192u/r8192U_wx.c

Signed-off-by: Bruno Raoult <braoult@gmail.com>
---
 drivers/staging/rtl8192u/r8192U_wx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192u/r8192U_wx.c b/drivers/staging/rtl8192u/r8192U_wx.c
index 3ff6da837ac1..039471bcd5b1 100644
--- a/drivers/staging/rtl8192u/r8192U_wx.c
+++ b/drivers/staging/rtl8192u/r8192U_wx.c
@@ -294,7 +294,7 @@ static int rtl8180_wx_get_range(struct net_device *dev,
 
 	for (i = 0, val = 0; i < 14; i++) {
 		/* Include only legal frequencies for some countries */
-		if ((GET_DOT11D_INFO(priv->ieee80211)->channel_map)[i+1]) {
+		if ((GET_DOT11D_INFO(priv->ieee80211)->channel_map)[i + 1]) {
 			range->freq[val].i = i + 1;
 			range->freq[val].m = ieee80211_wlan_frequencies[i] * 100000;
 			range->freq[val].e = 1;
@@ -309,8 +309,8 @@ static int rtl8180_wx_get_range(struct net_device *dev,
 	}
 	range->num_frequency = val;
 	range->num_channels = val;
-	range->enc_capa = IW_ENC_CAPA_WPA|IW_ENC_CAPA_WPA2|
-			  IW_ENC_CAPA_CIPHER_TKIP|IW_ENC_CAPA_CIPHER_CCMP;
+	range->enc_capa = IW_ENC_CAPA_WPA | IW_ENC_CAPA_WPA2 |
+			  IW_ENC_CAPA_CIPHER_TKIP | IW_ENC_CAPA_CIPHER_CCMP;
 	tmp->scan_capa = 0x01;
 	return 0;
 }
@@ -722,7 +722,7 @@ static int r8192_wx_set_enc_ext(struct net_device *dev,
 			goto end_hw_sec;
 
 		/* as IW_ENCODE_ALG_CCMP is defined to be 3 and KEY_TYPE_CCMP is defined to 4; */
-		alg =  (ext->alg == IW_ENCODE_ALG_CCMP)?KEY_TYPE_CCMP:ext->alg;
+		alg =  (ext->alg == IW_ENCODE_ALG_CCMP) ? KEY_TYPE_CCMP : ext->alg;
 		idx = encoding->flags & IW_ENCODE_INDEX;
 		if (idx)
 			idx--;
-- 
2.27.0

