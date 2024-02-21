Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FE91272D4
	for <linux-staging@lists.linux.dev>; Wed, 21 Feb 2024 21:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708551925; cv=none; b=gdXf3aYYoK8QPYrpmbRfRw7cEmbXWutVE4ZrOiOJpnNpKRAL5V8wI/NZ4RztBHiP1mTeAUGkDmOsHcTfX6mcIPSQA7RLMLmvLMEvNFugZffEWeu1GLS+7pqweicT/HZ7udAwDvOTp5hRvwH8Eqx7+/jIQtt1PNwFx//wryFQcgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708551925; c=relaxed/simple;
	bh=uyFsV9OUDeqhejULZAuA/MVq4g8588CDjo+WwYteZ8k=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EDBarnYdRNU2apzYM3pqv67aNaezLnSDY3R51jOlAkYJ7NSVLmsMmPw29gVBzzs/P1DDdJbR/5u/zwfH1nsqDIeudIM4Gb1EjHoH2/Nvu6EO3WAlZTZphCpQX025tAVVj2oFZXuqZ291tnm9QFwLD5l08McKJ98Mrfufeth/hFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MNeCSjXs; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MNeCSjXs"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-33d4efb419bso527342f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 21 Feb 2024 13:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708551922; x=1709156722; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P120Wp5N7NPu3zWjz/hKIW84Ut+CiTr8TgaGF61U464=;
        b=MNeCSjXs8tGGcq80EeDQfbnBj95lbzpUlLO8c2sZ7+jkpS9ccaeBtjwvLMO97qsp5T
         7ATwNpHOhDHE/lPQAXEr7MyPL/wSu2NrwpZ9VIsH32qCQ320ML3aWrHeFD4yIUmfyhm5
         m0RfXJzmZm2WRY3JzBhPWg1SyueRMRkleDZjKDoqlotkqyVaeh1+sASiaCqm9Zo5A3rV
         v0aj+5u5oSLfQG/X3V5Ct/dRHsmrWZr77qdCtsyfD+5RYyVybm0HAa9Wp25zu7qqo+eu
         x0KznoPECsq6d0NGIn4F/jEPo7jjjrXQYCs6+70jSAhjOAjsXJf4vggBi/J/2vEKn3jk
         sk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708551922; x=1709156722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P120Wp5N7NPu3zWjz/hKIW84Ut+CiTr8TgaGF61U464=;
        b=RaETpj3rPzrR9lmuImIND3+dCdmmZv5Zc5F9Ikn0yGqtwk0m/V773V6QaqQq6aUEDX
         1j5ymoCeuL5MQ5aN0cUr2VfB1euhKfUGw3DD+I9/5SVsLYVgKYe2ms8Tfgcz9frUjX9R
         JBZPdngpzOcQChtRUCgqIQlY7acDrXOGOmGzBjZt43nkJpLDFM0m3oxVhTQ4Pqr29+9z
         1O+tYYgPgQpp4PG7QpGiW3VB2T/m8fWDTxRA3swaaf9hQBzayvuc5xkElPoaE6NUlu3l
         V86LVYwH1OaolSS4Qo6b7sauz8IKmPEC4XKmgiYkBzfLOXfoD8u3yi1PTnRGJqsZiC/N
         kyqA==
X-Forwarded-Encrypted: i=1; AJvYcCXQQ0Y0+H+sTconhH7zog7sX8RjG5R9dEeqcosJgTEE0TW4SN1TV3oBv2MQwAxgI1rvsID3VM1hPzR7JI0qwVJLyCgnEiU5nWcrxQaGCg==
X-Gm-Message-State: AOJu0YxfRSnyuhkCB7zrIskASwOEPZoNWDY1r1Wp/5S32LcPtV/TqX2v
	3UzUQvOylxtNV6lLt9fQx4x0D2QvA2vGOxVH6Kdu10boCGxfgz1I
X-Google-Smtp-Source: AGHT+IHjl/e2sn9am30SC6heh5b5qeWaBducd+4Te85MAi+P5SZiRbE0nvRbho+29F/68YRjJg2yjw==
X-Received: by 2002:a05:600c:1d24:b0:412:db0:4471 with SMTP id l36-20020a05600c1d2400b004120db04471mr436136wms.0.1708551921981;
        Wed, 21 Feb 2024 13:45:21 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id 13-20020a05600c230d00b00411d640085csm19129971wmo.43.2024.02.21.13.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 13:45:19 -0800 (PST)
Date: Wed, 21 Feb 2024 22:45:17 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] staging: rtl8192e: Remove variables bIsQosData and
 RxIs40MHzPacket
Message-ID: <7a8b579fd3d377fa961fe71e37fe4afa22f2a3b9.1708461563.git.philipp.g.hortmann@gmail.com>
References: <cover.1708461563.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1708461563.git.philipp.g.hortmann@gmail.com>

Remove unused variables bIsQosData and RxIs40MHzPacket as they are set
and never evaluated.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 --
 drivers/staging/rtl8192e/rtllib.h              | 2 --
 drivers/staging/rtl8192e/rtllib_rx.c           | 3 ---
 3 files changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index aeff01e921e4..ad453a94b5c7 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1671,8 +1671,6 @@ bool rtl92e_get_rx_stats(struct net_device *dev, struct rtllib_rx_stats *stats,
 	stats->TimeStampLow = pDrvInfo->TSFL;
 	stats->TimeStampHigh = rtl92e_readl(dev, TSFR + 4);
 
-	stats->RxIs40MHzPacket = pDrvInfo->BW;
-
 	_rtl92e_translate_rx_signal_stats(dev, skb, stats, pdesc, pDrvInfo);
 	skb_trim(skb, skb->len - S_CRC_LEN);
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 1949fad401d0..943a16ead903 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -487,14 +487,12 @@ struct rtllib_rx_stats {
 	u16 Decrypted:1;
 	u32 TimeStampLow;
 	u32 TimeStampHigh;
-	bool bIsQosData;
 
 	u8    RxDrvInfoSize;
 	u8    RxBufShift;
 	bool  bIsAMPDU;
 	bool  bFirstMPDU;
 	bool  bContainHTC;
-	bool  RxIs40MHzPacket;
 	u32   RxPWDBAll;
 	u8    RxMIMOSignalStrength[4];
 	s8    RxMIMOSignalQuality[2];
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 29bdaff4cbab..1e4956fc6754 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -865,9 +865,6 @@ static size_t rtllib_rx_get_hdrlen(struct rtllib_device *ieee,
 		rx_stats->bContainHTC = true;
 	}
 
-	if (RTLLIB_QOS_HAS_SEQ(fc))
-		rx_stats->bIsQosData = true;
-
 	return hdrlen;
 }
 
-- 
2.43.2

