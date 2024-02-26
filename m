Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF041A5AC
	for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 03:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708919792; cv=none; b=PyfBFYiZtr0X/kttSoP8J70nRiynmEjzb1sPkGQX2TN7S1BabKGxt2Zp3FM8hR/iS+Ntf648n74X96rmPX+iu7vl1uetWa/gnTjlcZcii4D9IbpuVwP82vgwyIL7nyUt0MQvK/ryzB5CYfZyKdH8kkchtRKFErDBX9CuMYsSgXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708919792; c=relaxed/simple;
	bh=/GkI0AH4KAbueBIXyZZOUSkMKIyc+Cm1aO4KSCZ3H/Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qpLU1gX0LHr2d9njyZllfChj/0RA8185v3G79Rs/fe9TRWXiBImh5r5OOP+yx4nGxTSMCfCXLFHpwt/8vwDhCaq59EYlBZNloFg6pERqWnIgxhwP3KbzA5CXytN8b3NSFtyREIqlfmLcdm20AXthSbYEAmny/73YGy46gpWBkh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=Amc//hK3; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="Amc//hK3"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1dc49afb495so20458545ad.2
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 19:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1708919790; x=1709524590; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y94qPBIiY1LTWFk09al9S+rVSJfj9Ljec3w+8fEwPIw=;
        b=Amc//hK3jrKNZyVflw0TqwgXdO3IWniBkZw1iDNj9Di1d9GnC7zF91whqDEmF4ajFP
         oPjW+kmhqYXCpPCjCcqRFPxaYJCy4EHuThiXANN+s+VhVp6eoLODlRaZQb0Pm3qnvkEG
         QWXLA9Au1yhTWLsgmoU10O1jx4MfFwddz6jiLtR27s8ArDXZ1v6/KzH8Bxcbl6Qr7tQa
         EvlltCUfw45OWwtlRwcoa+iELICt021m4uzfEcvwkedHZkxWFCjPaE4FDijohZuw65BL
         A4iRsfdtkshGvHFNGB1Vh/MhXsW/camGmeIGYuHgLhJoz+DWN2hNsdnWZhNDs6rIv3F1
         v9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708919790; x=1709524590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y94qPBIiY1LTWFk09al9S+rVSJfj9Ljec3w+8fEwPIw=;
        b=CP8EUWq8NRmrBt+w/EYWwP+Z3IMrSn9FGtgGMLUTzSoBlbOgCj3hNUR/rPOsBRVs9r
         9NgT3IfFFt/fk/n4n2n78/7s8IgQzusnTxTJb6WbhgWcioLUBc9vDC+KFMIZqSsQzSWK
         VrlwyuLP1KUFzRnxwsD/DQpMn1aGUc/eg21HhF9AXtOsWW7rRffOJhSNEpFK4lVEMpGW
         ITqUP49/ZvE9iIl21vlEzaQROBMZDlT2+pJPt2QD4So5XVQZMlzR9K8Df/vSUBrw8F7M
         Tx8Q6tpnu2DKSbyHs0NdMvkIioLTodB3nHpODmh1N/f1tAEAwHqBtuPf5xLI7FOR6MA4
         rzag==
X-Gm-Message-State: AOJu0YwiDhvkxY3nAWBk67SU1mzNXWCUEEN9RaEnSLsnyuO+v35dq0um
	Ma6cGukA83auH8l6KEKrY2OVrtm4n64SCYnumTchScbLsDEK5rvuugrWTyPWj18=
X-Google-Smtp-Source: AGHT+IFNmKD/LceEGvf88RsFhDZGd4B7FIRrWhlJYJ98No9LZm6cQnNjBQCHjtrItQ7s9yfwhBAlzg==
X-Received: by 2002:a17:902:b68e:b0:1dc:a647:6979 with SMTP id c14-20020a170902b68e00b001dca6476979mr1033903pls.58.1708919790316;
        Sun, 25 Feb 2024 19:56:30 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kh5-20020a170903064500b001d8a93fa5b1sm2897615plb.131.2024.02.25.19.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 19:56:29 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 03/20] Staging: rtl8192e: Rename function SecIsInPMKIDList()
Date: Sun, 25 Feb 2024 19:56:07 -0800
Message-Id: <20240226035624.370443-4-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226035624.370443-1-tdavies@darkphysics.net>
References: <20240226035624.370443-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function SecIsInPMKIDList to sec_is_in_pmkid_list to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 83f337e27209..607122ab4b00 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -664,7 +664,7 @@ static struct sk_buff *rtllib_pspoll_func(struct rtllib_device *ieee)
 	return skb;
 }
 
-static inline int SecIsInPMKIDList(struct rtllib_device *ieee, u8 *bssid)
+static inline int sec_is_in_pmkid_list(struct rtllib_device *ieee, u8 *bssid)
 {
 	int i = 0;
 
@@ -747,7 +747,7 @@ rtllib_association_req(struct rtllib_network *beacon,
 	if (beacon->BssCcxVerNumber >= 2)
 		cxvernum_ie_len = 5 + 2;
 
-	pmk_cache_idx = SecIsInPMKIDList(ieee, ieee->current_network.bssid);
+	pmk_cache_idx = sec_is_in_pmkid_list(ieee, ieee->current_network.bssid);
 	if (pmk_cache_idx >= 0) {
 		wpa_ie_len += 18;
 		netdev_info(ieee->dev, "[PMK cache]: WPA2 IE length: %x\n",
-- 
2.39.2

