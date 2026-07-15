Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3784A13A4
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119861; cv=none; b=gL37dHmmnN/spejoiJ4tTd77/PiIv72ZVdVIyo/+INdZuT08SO+3ofh8IR5ZCFn4jXoQfUSemaKCzT7evn4uQAQGsllIrd22SP5auLBGET53BtMoiuflEdcV3HLOJ0r0C+Wwvzgmw2yklwIs2kLyQWavcAxXxFuOw8GThy9GuH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119861; c=relaxed/simple;
	bh=2Q6d8WyT9DBrXtGDiScoAlgfUG4yEAeG9nXn7SKHrnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a6WuP4BtmLidLu+tyAThqQzLDqkVtTG22hgrb6oSbWDK25Yj5gPc6TpeT9TuUOPEgZjg5itJyCqdyrn55BoPhdXoAqMXNMS7Y/MuxEcE6a362WMuHBOJcXVuy0FHZNYcBfQSK6DPuBNf92QVgtTvhTGZu8jkxGi1AAV5xRcn2SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ogjU9Zqb; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ogjU9Zqb"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3997a448ecbso20537621fa.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119855; x=1784724655; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4TMzq3sqLE2mIsEbqNFBEWHJwoVqep7wjRLvzGXoJzE=;
        b=ogjU9ZqbcMbcH/YMUc9pfmbXEiJeFneqQiWEbcoqqgXbjiQafXOvuWgycDPiSdS7Hp
         FCLAJqJHIO5yPucEEtBkFdEXXbotC2iGe113Hl71m9Oo82boLzzqA39gBu0BqyocGD0A
         ki4zCRUlqZ8vGI2nLlYUQtcTjvktQ6C/szw57Ic9vuQp+QYJD+KO6cLrgwk5K26SwMwo
         FxhgHSxCzqFc/XB+GEu7IH7GUh1tlB81d0UEe1ffFdr5IyPkN1iMVhjL5p5w3WLlhaK8
         ZG4Zkc+ct+1tWSJqCfV+asbmdnwA/VYiJYCIAk4WaAvzPK3Otqg3R1nymz0JOYyIhXFj
         GJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119855; x=1784724655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4TMzq3sqLE2mIsEbqNFBEWHJwoVqep7wjRLvzGXoJzE=;
        b=rWY2pIsh0Y6nTybsEZ3aAzi78e2pvvcaOpyCu/bw2T2DUJTieX3wnKN5zEcWhAdUFt
         HkhDwOat50/U1sRuQl5gZw0w4cnv1AYCTozx1SPYIO7X920839yfZ52yHo1Q/MrRDYJx
         35UwawRC3tbeXrqSOjuL7qz4D8nMOkW1AFXy0tORlKDAGlxqxBw8DPqj85l6lnm84YyH
         f5Hl8Y1HArAWAZK6enwhDHfoISaECwyfC+Zm71tne1t6xrNGLL64iwQQre1vPx7qp5h/
         /hctyh91Q+dcSbCj77U4ZdwREeymaBVik3YCe0UsY1sN2K2QxTwOycnSuMeQrDV1uEgQ
         5uMQ==
X-Gm-Message-State: AOJu0Yyb0k3W8+FAIIEmovZxSmFh2En2PbYfL6evyi65elaDHS1j6sku
	2MQ7qU/LcajVMqSZQbWEkqxFbqUqEvXg36cQJd00fVXZpzJgzQwid4JT
X-Gm-Gg: AfdE7clqcmjmKh89anRVmX5usv/abcAdicr6LeXl1V5QmWX1c4ejNBLbCdh2AXWoRaR
	wWuFySQEbtbrnHLomqKx2Aks4C8YUmdQixh4zj+i5n3M++9iWn0xywlD0Snk+w6Lp0Dbvf9XDYG
	R5Ab5z+RfbG+3TQguiLgsMQuOYyDmO4PSlIpsUA9VDY2UAmi0i8cQD5Jo6pOsI8d7Hht5uEFVaD
	FV4CB8n3oxuhoCmM0QjLPwivIg920S4QCzwtBDqBU8ZZwfom6nI5JRLfEm/YyJXS9iHUNms4KD1
	1Jiju+kAki5W5mmIjoEfbpiB+E1H2ASO9spO8J1FIG8+LoZNv8b6+1RAmIb8Cp+P2qpU7T6Hrzl
	GcxvIuoMmWU6vOZyzG7eULLyVvfgGAJ0uFJEE4OT03LOtz8w0n49JQYPHRQLJo2Q1FtHY7qJvws
	9+4WxhSaoJmTKP2m7f5fBIPehvo3BuLPiKdsaiA6DNK4Ll2jl75WjhhMKPxofEYLbSeI6LPCzP0
	wSUafgi7Nte9g==
X-Received: by 2002:ac2:508c:0:b0:5b0:e70:c6e8 with SMTP id 2adb3069b0e04-5b0236c0babmr3009824e87.59.1784119854817;
        Wed, 15 Jul 2026 05:50:54 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:54 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 49/61] staging: rtl8723bs: remove phy_GetChannelIndexOfTxPowerLimit helper
Date: Wed, 15 Jul 2026 19:48:17 +0700
Message-ID: <20260715124829.90290-50-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the tiny single-line helper function
phy_GetChannelIndexOfTxPowerLimit. Inline the arithmetic index
calculation directly into the callers to simplify the code and
reduce runtime call overhead.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index 32b69ba3b..7ad04aa85 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -643,10 +643,7 @@ static s8 phy_GetWorldWideLimit(s8 *LimitTable)
 	return min;
 }
 
-static s8 phy_GetChannelIndexOfTxPowerLimit(u8 Channel)
-{
-	return Channel - 1;
-}
+
 
 static s16 get_bandwidth_idx(const enum channel_width bandwidth)
 {
@@ -721,7 +718,7 @@ s8 phy_get_tx_pwr_lmt(struct adapter *adapter, u32 reg_pwr_tbl_sel,
 	if (idx_rate_sctn == 0 || idx_rate_sctn == 1)
 		idx_bandwidth = 0;
 
-	channel = phy_GetChannelIndexOfTxPowerLimit(channel);
+	channel--;
 
 	if (idx_regulation == -1 || idx_bandwidth == -1 ||
 	    idx_rate_sctn == -1 || idx_channel == -1)
@@ -838,7 +835,7 @@ void PHY_SetTxPowerLimit(
 	else if (strcmp(Bandwidth, "40M") == 0)
 		bandwidth = 1;
 
-	channelIndex = phy_GetChannelIndexOfTxPowerLimit(channel);
+	channelIndex = channel-1;
 
 	if (channelIndex == -1)
 		return;
-- 
2.55.0

