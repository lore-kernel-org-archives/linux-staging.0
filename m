Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D8F126F05
	for <linux-staging@lists.linux.dev>; Wed, 21 Feb 2024 21:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708551916; cv=none; b=aFiEbjV2VuQFLrttktnl4J89hkbhsXsP40E7Y98E6D4nCnbfJqxoYp9Ow4Hu124RWy7l9bidF2AX5pDT10zgwy7uB+rJb6dBCpzCcuXtuoR4cw4S+2PMqR+a3cn6MBA1I8b+2gBjhp5AJHiDMEHRYRPmh1tENFojIFgVl3/BekY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708551916; c=relaxed/simple;
	bh=j2nhoqg50QyBMIaEdxLOEspW9uEChcSl5BxeXCTb40w=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EXiAoXVpC701k8E0TUk58PROer8e42JwVFCfSM/BQ0b2a54Vev1kdJG72VeLgMl+UzdLdxmwML0lFoWVv+jUgA30WFsWB+ZlaVc14BbJ43AXyx4CXZWdMd6EIpYq3gZJFJ5Xiwrg53kCe6puC+mIlvFT+3PsbAyA1ZLl6ikaLAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fdrPEAFj; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdrPEAFj"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-33d8b14715bso20726f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 21 Feb 2024 13:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708551913; x=1709156713; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rvrRKz3L1KRShWYrmUsdmRB21fpKWIj6Qz4Gvr6VMUI=;
        b=fdrPEAFj75e3C+pOetu/4fZrwYNOfVDyYXDbsLYqAeRBm0tPvFVKYQbUlVfEI24IP3
         O+ey1waxUMvAX1bbi2u453/b/YLtihioP7MFVW/boECXbuDX1/p3BKkBnDHW5dFoscG+
         S85gfcvf1pco3ed3MM0lOck+3COd5a8vEtSet22qqb0w8VQtBOwj6dSo1XNAtDRuhcA/
         2zsdcbfm/QJq9x/2XJnHRw5Ca+16VDl8P2PfHXdYmaGmzmpTjgDJB8Q2MaCngeMk9sQ6
         kXO9qhzNmXFk1O3o8dhcjmdG70QAmGaYYUmgF9emtpPy3yaVKMioAfEP/8PQuzvkHxZ/
         VerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708551913; x=1709156713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rvrRKz3L1KRShWYrmUsdmRB21fpKWIj6Qz4Gvr6VMUI=;
        b=fiYT8raxu6WlEjksUVld2xVuyhQkPL+8Qxxxro8q+8hV19vCQJzfedlG2ZuV1pDxm0
         j84N6M88zvseyuJFTxN7AOxfQT6iqBm1i2zHQYuiPKmSOyS0E9D63G7L1M+mGme+THKI
         In2wyM8RUr2RDUPwIfPBavyrTQnGrDRIJ9Vmdex4YtPET6PlsWL9D+tGcwr06vrK+XVB
         jE/hUt0oeiD0spH2Cjcp3DL0nU/Hx3I6cHL1F7eCuSNs5B62aiEckeDVFKaxoiPQ739m
         1ri/o/zRPau7BjPAx++f5JiMdDLIUa7pGRGgrJbQ9bVi2oztgzyJsfFn9ZZ2zlOa/IBg
         qbmA==
X-Forwarded-Encrypted: i=1; AJvYcCXhtPySVw0/Sl2H1Kw8Bbd0yIDPI7X/YyWZgVzLqLiFIZVFu3NaU+lXHlJ+Fm+eAJ5UwVzBWl2oNqNarnfY8741IDLtJquJRJLYQKB6RQ==
X-Gm-Message-State: AOJu0Yyj6sk3JX12IgAOT0Ag8ybLXwQTuhm5NDwYcTjq8MkK+vZ1+cGt
	AQaFaCOqFAnH4kkU6grqKVxwpXSp/uejiqhNf5ZeeVreQYimJY/JSjdI1GZBMKw=
X-Google-Smtp-Source: AGHT+IGM4OG1WMWSAdpQyceURSYXYW1tRC6lfrWUprHzleYBzKjZRhGguu9xdPZYyiB987XgSFV40w==
X-Received: by 2002:a05:6000:71b:b0:33d:32f7:c85 with SMTP id bs27-20020a056000071b00b0033d32f70c85mr8683666wrb.0.1708551913172;
        Wed, 21 Feb 2024 13:45:13 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id b7-20020adfe647000000b0033b406bc689sm18268940wrn.75.2024.02.21.13.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 13:45:10 -0800 (PST)
Date: Wed, 21 Feb 2024 22:45:07 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] staging: rtl8192e: Remove unused variable bShift
Message-ID: <ff505fd05683a59b02ac2e3da115718d8a22735b.1708461563.git.philipp.g.hortmann@gmail.com>
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

Remove unused variable bShift as it is set and never evaluated.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 4 ----
 drivers/staging/rtl8192e/rtllib.h              | 1 -
 2 files changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 59110da6c4f3..aeff01e921e4 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1649,7 +1649,6 @@ bool rtl92e_get_rx_stats(struct net_device *dev, struct rtllib_rx_stats *stats,
 		stats->bHwError |= 1;
 
 	if (stats->bHwError) {
-		stats->bShift = false;
 		return false;
 	}
 
@@ -1672,9 +1671,6 @@ bool rtl92e_get_rx_stats(struct net_device *dev, struct rtllib_rx_stats *stats,
 	stats->TimeStampLow = pDrvInfo->TSFL;
 	stats->TimeStampHigh = rtl92e_readl(dev, TSFR + 4);
 
-	if ((stats->RxBufShift + stats->RxDrvInfoSize) > 0)
-		stats->bShift = 1;
-
 	stats->RxIs40MHzPacket = pDrvInfo->BW;
 
 	_rtl92e_translate_rx_signal_stats(dev, skb, stats, pdesc, pDrvInfo);
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index bc4479f7d089..1949fad401d0 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -487,7 +487,6 @@ struct rtllib_rx_stats {
 	u16 Decrypted:1;
 	u32 TimeStampLow;
 	u32 TimeStampHigh;
-	bool bShift;
 	bool bIsQosData;
 
 	u8    RxDrvInfoSize;
-- 
2.43.2

