Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1166923A980;
	Wed,  2 Apr 2025 12:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598087; cv=none; b=Oa9s80/PWNbHKejud/KaRpuxgRsqWd8y32LMJLPnd8erf9UKJzzWTSH/9gHomEaZYx4hjHjc/6FxuwzUI7WuJk/9BJ8IWrPf2Mda1EQm9lawttPfsB/So6iB5cKjEzkBmsIjRvUQBTgb/jlMWLZiI8xWAE2AW6JAAAyYcWlukK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598087; c=relaxed/simple;
	bh=nMKV+kr2cpsUbh2qAhXcIt216L96PZ43/QpfJ/+7WUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s/IgLe5FN5+1F9wxi/npNJGLOx4h3rHj/vAIDRJjMkB+Zpl+Iw/HLm16/xLU8OTxAE52dzV7LklfTJR0kIhpV6KXXxSZO3LTvm083zEshFWQn0OJnnMIC5u+vP2IYrCUkCcu+KGIys9I8bsCglkTC22GFL09E6SpJPPvACNZKTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJ/cScWg; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJ/cScWg"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso50332765e9.3;
        Wed, 02 Apr 2025 05:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743598084; x=1744202884; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wet2FeYdwiKMwNMUdVcyeTpKdpWV/zoxt59GzOkUOvI=;
        b=eJ/cScWg69VDXKIz4lHX1ApL7nobyH+jM+DVKnx0m+C7FZeFMG9R08MJaao/y23HMF
         Dy+sIM+ihwBzen74vp3sZ6ZteWbLI3oRTtjCFmhOtg2winFmKdlv4mn89g312dhz7d39
         RcMnc6zm9V8tMJ0rRYCPPC5JsmOfOV7MCWdn0WYs3uOJtCbk0uYw23CsEtanX9JrwtQa
         yYfgvzGcOwxcffEWJHY4xM1g189JPJxS+pVAv4xm4GLIdmQ972DkoSpGlvVa8xhggwqh
         6Mzliinn+pVW/XeJP8O2y98CqEjnI63UEz9NIH+jY4JVIT7VeCxk7Yj0qLYih3uZ3aMF
         QwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743598084; x=1744202884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wet2FeYdwiKMwNMUdVcyeTpKdpWV/zoxt59GzOkUOvI=;
        b=U/WMu9xOSatHii58FqTyQZcYBO9m9LFA8DSRo0gmPZrrGp+kvZAT302IOwXdsi22W8
         TnnIgipPyPLxlFA8U87y8YRF+UVOcZLWm2uXdDufWPOrbww523+jq7+p4Zg55oUR93WC
         T3uDsc8UiSjUuRX04/Rz6tHU7nEU2V0M71eoLBJ+Mr427hx1k1DbTBRNBX33FZepctc8
         2Kne4Pj2YZX8nPMl+EGit/m2Dk3X0HzOyhYsv1NdY4fkKdksbzntczwDnrUFtkTI36N7
         BffSDoS1SHZTt4YDQ37vwFRsnKHFj1sAd+Yrfg2W4hZapP0rt22zEuePOrymayMM0uhd
         ADaA==
X-Forwarded-Encrypted: i=1; AJvYcCUvg3ANSH8ih+p7q+l8+QmYw6nAZG8I3xc8PKNbtPBZKWhXqVDz1S00wB59uf8+Rnv3JE1wgNdTCHvE@lists.linux.dev, AJvYcCW3HOLPTks6w575SoOO4hqIVrUX/ljm2iTDAf7wda9caFgwTaCapgB7vdzgAvJSugi26rHOqTcdTTksjl2m@lists.linux.dev
X-Gm-Message-State: AOJu0YzU2t2CRH/sT/d2m7Za9Masda3NGQBvlB911LnDjbyj688dxc7a
	di1HoOvHfgwdfYF75ZO2Mcs3u3Kj8K5oU1FMfj3fUX6uQ1Wr4YGu
X-Gm-Gg: ASbGncuCfDL9cFhwb+4MhoPtWnQEl6Pl8OdRJofSS53gJPsk9U/JD1sq70SnzEzXfRA
	sRWRfzu1CXD1ZyPBoZcLHZEOelVKQl4rTq0w51qiRbID3S77pbXNv+D7FFMcyng6fcq3/F3g+PK
	GhW768EuXH0Cm9i5FllgNOJI5nfnLDZBW+0q0sSVv5pQjwewa43cBwpZpwd/zeTceY+VLcjOfbV
	ePxlMyceigafcYG8E85C0g2rZTeUrzEG6w8MAruia8hwBK89Ru93+S936A4IAxpnNt8Sl80jNr4
	5opk0KMusNwnOjUAv9HtdWWP//sHZIDDilAFQdML3Rg+BkGLEzNd
X-Google-Smtp-Source: AGHT+IHlWBrnUKthpg0J7fPqgoIaRxSRyaQtDJqUlOyupRqtjyvSz7tzgOJJVgRLPScsMZIJ7FswCg==
X-Received: by 2002:a05:600c:444d:b0:43c:f85d:1245 with SMTP id 5b1f17b1804b1-43db6249f80mr142390905e9.17.1743598084244;
        Wed, 02 Apr 2025 05:48:04 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb61b6cd2sm19675985e9.39.2025.04.02.05.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 05:48:03 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] staging: rtl8723bs: Use true/false instead of 1/0
Date: Wed,  2 Apr 2025 15:47:42 +0300
Message-ID: <eca5a63d92f5bbbecb642d324a5e0641f697d0bf.1743596287.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743596287.git.karanja99erick@gmail.com>
References: <cover.1743596287.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Standardize boolean representation by replacing 1/0
with true/false in cases where boolean logic is implied.
This improves code clarity and aligns with the kernel’s bool type usage.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 952ce6dd5af9..8f2c9c3e853c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1173,7 +1173,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 
 	/*  check if there is WMM IE & support WWM-PS */
 	pstat->flags &= ~WLAN_STA_WME;
-	pstat->qos_option = 0;
+	pstat->qos_option = false;
 	pstat->qos_info = 0;
 	pstat->has_legacy_ac = true;
 	pstat->uapsd_vo = 0;
@@ -1189,7 +1189,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 
 					pstat->flags |= WLAN_STA_WME;
 
-					pstat->qos_option = 1;
+					pstat->qos_option = true;
 					pstat->qos_info = *(p+8);
 
 					pstat->max_sp_len = (pstat->qos_info>>5)&0x3;
-- 
2.43.0

