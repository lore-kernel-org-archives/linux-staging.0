Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D02E1CD36
	for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 03:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708919966; cv=none; b=lSC9dFf574EOs6qIP/kLAwaUhOedkp5mdfnZ/+Fd7UtH7Of4mO+f49cWuKHfyvmNvfcZx7a9DkBKk+p6n37QUtOwmRRovJvoLgiCP9peK8D/PTXLwlD8LdEFQYuxSl0Rzi7jP2A+vroOqFvEH1hDCKj6f6i0pfF8jUDM2edFYiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708919966; c=relaxed/simple;
	bh=rn1uhe9kSvdRl3bR99SI2tz9xfp7AgAFtEZNJ3Cph+8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dVS0aKGj76o/WHzPs31aIADguc1ed3a4RV/YDOmnAVyyn+5RXZgmbXaEDw96BNRTjjLl0O4UNjgHZ2JxcXak3rsa7+PiJe3awcCR0UORibQcAEvCvrutgn+4VPJvG6rBLRY6xEIjS3XzuSjw4DJq2jR96wjufRceGy+Lq2Ta8Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=YKo4qynr; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="YKo4qynr"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d7881b1843so20428585ad.3
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 19:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1708919964; x=1709524764; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFPZDGKeKZyaOMKlGQ3oMS5Xrp30OXpLH+RSaWh7syU=;
        b=YKo4qynrdu+MkghIgnoRhG8thwLAkwa26JFLahFTbsedz8wusFLh5Iw3ixrHSEJ1+l
         DbSVATzGxDUFNavmoHiEKth7Fce2uGKKBcS/D48ZBZW9wHYDRY/yiEMu8RMV3jcXmAL8
         eiCqyJBzQmBNeafROGAqC9Jp5LUTm/BpLTH25il7v4xKWb2bfPyPdMpbFj55aVNjYYMa
         Ne9VackBEJCSrbnzHi0kl8SFWuzxroHAP4Fepfi5rbjPaVwa5LF0S46KCzOqMKk/Xix3
         XyG7NkzobNhekrGSyBx1Lyp8fPAJag4GEywUUrGulk+5ayWCJ/y6JBVFjhFM36wunHct
         VjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708919964; x=1709524764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pFPZDGKeKZyaOMKlGQ3oMS5Xrp30OXpLH+RSaWh7syU=;
        b=s2x+0mVlYPlCLpmbztzs9fXFALKqMk3hKH0jRbo9BtxR0iUt+oVWDCh6CE04qDCAvv
         NCqmcCdQROlqGPylQrNT5uIzXsC76ncM6FtWX2o6LpD1ZRdppLdRMKyg0fuhy/8Zo3ZJ
         OhjDDWEpGdMRb+4xs0vUNAfl8l6WN2HsVXfRMPF2piYSOPZaJPJuv32jeBPjdP1H68VQ
         BKXQT+iCwZlANdSIBIFB9pCwNhfKO1oUOw8sP5lylJyIHGsJ0zP6q+ujzm/NkyjugWOv
         QG7E+QJws4Lz6WIEloYBRp64OLxIJ6Egc8sc67QptNvvjiOOfCUQldSqm1rF5Dttkl+o
         GNvw==
X-Gm-Message-State: AOJu0YybMVg6NIYreJ+m7GxhZ17a3AWjv353fZGoqZGFP7NZBTe5fYzM
	lrA8OrAx8fpLt7v3I0RAtEOE8rVLlRL0CV0gLBuu3sfpVQdawl2H9XTf9yXeRuhj9GYOPj3MClF
	a
X-Google-Smtp-Source: AGHT+IHS1JmNpzgLjr+HYVQG6oOnedLl/aKpZ55VAo3nq6VEHO3q/i/7RTUC/v94uYQ/SZ0D5CB0ng==
X-Received: by 2002:a17:903:2450:b0:1db:bbe0:9e9 with SMTP id l16-20020a170903245000b001dbbbe009e9mr8731405pls.58.1708919964699;
        Sun, 25 Feb 2024 19:59:24 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id iy13-20020a170903130d00b001da105d6a83sm2893426plb.224.2024.02.25.19.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 19:59:24 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 5/8] Staging: rtl8192e: Rename goto OnADDBAReq_Fail
Date: Sun, 25 Feb 2024 19:59:12 -0800
Message-Id: <20240226035915.370478-6-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226035915.370478-1-tdavies@darkphysics.net>
References: <20240226035915.370478-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename goto OnADDBAReq_Fail -> on_add_ba_req_fail
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index c0006daa75ec..a3a2fe72d644 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -251,13 +251,13 @@ int rtllib_rx_add_ba_req(struct rtllib_device *ieee, struct sk_buff *skb)
 			    "Failed to reply on ADDBA_REQ as some capability is not ready(%d, %d)\n",
 			    ieee->current_network.qos_data.active,
 			    ieee->ht_info->current_ht_support);
-		goto OnADDBAReq_Fail;
+		goto on_add_ba_req_fail;
 	}
 	if (!rtllib_get_ts(ieee, (struct ts_common_info **)&ts, dst,
 			   (u8)(ba_param_set->field.tid), RX_DIR, true)) {
 		rc = ADDBA_STATUS_REFUSED;
 		netdev_warn(ieee->dev, "%s(): can't get TS\n", __func__);
-		goto OnADDBAReq_Fail;
+		goto on_add_ba_req_fail;
 	}
 	ba = &ts->rx_admitted_ba_record;
 
@@ -265,7 +265,7 @@ int rtllib_rx_add_ba_req(struct rtllib_device *ieee, struct sk_buff *skb)
 		rc = ADDBA_STATUS_INVALID_PARAM;
 		netdev_warn(ieee->dev, "%s(): BA Policy is not correct\n",
 			    __func__);
-		goto OnADDBAReq_Fail;
+		goto on_add_ba_req_fail;
 	}
 
 	rtllib_FlushRxTsPendingPkts(ieee, ts);
@@ -287,7 +287,7 @@ int rtllib_rx_add_ba_req(struct rtllib_device *ieee, struct sk_buff *skb)
 
 	return 0;
 
-OnADDBAReq_Fail:
+on_add_ba_req_fail:
 	{
 		struct ba_record BA;
 
-- 
2.39.2

