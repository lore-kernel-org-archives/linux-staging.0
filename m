Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0138126F22
	for <linux-staging@lists.linux.dev>; Wed, 21 Feb 2024 21:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708551944; cv=none; b=UnFJE4tBr9o2knuqWCIjFAUISSEEy3xecoOyyEpR72vqdCvt8W03BQgXHNbzp9mPEpfKyBMiF8uZ0zmDc0l1R0P2SzfmQqgakKq1ZzBvqV1iszDH8QUJWbqaIbgPqP+t4O5x1BZNRpz/AmfcqqZHWtfrN+IY5CrwefBqzcdDcYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708551944; c=relaxed/simple;
	bh=x3wrIfiS+4hMvoU1Yli9XWwwJhpuldzeGM9+2yOJ83o=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UzLuwpZPYOk6OhMEIG8Z71T6HfgflTGVe2BHVhGX1RG4p33ywFx32lErV3GlHHHL3ocKh+GJpoAe765wyhA5pzwCF9XqGNeckKO0foSKW3I7/qM6HmtWeVPIP+HP58dj9nPh12qPUyhM4fRGKEZxuwFNKnMM2NWttKvTHBAdkSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FwX+CEDL; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FwX+CEDL"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4125753b593so4650305e9.0
        for <linux-staging@lists.linux.dev>; Wed, 21 Feb 2024 13:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708551941; x=1709156741; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3bIQ3iiFn1BJ2ioh1I8RqVG2EQ3pCkt6p5JTvGUIPbY=;
        b=FwX+CEDLyCDKZgp7FLrooSbiStsbqrSvpSqEKqk7BqnEJYwsVBIoBDDB6TVQH+MAHz
         TYAzHgv8dCUnCRs0dcS9yXP1rYvYFRDO/UeKjCoc6uU7/eqlsznr9u9apmZWd0+x/TaR
         YnZ11s0hwi0fn8pAuElk97rvOwrWi/P6hIEmnPMsjmmECa05cyZnXutv5S9G/tLNv3xm
         dUR6HLwN5GDjB6QCssaeH8CFJ90NRUqAU0FbVO2yTg897X0i87371Pyv0s28BOrctjM/
         yOF0vlvuP1VeNK57gf2QdKvxmod7si1mzjXLZZnxNZLH59xQefxFA5HnF8dSPBGoXU/I
         L7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708551941; x=1709156741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3bIQ3iiFn1BJ2ioh1I8RqVG2EQ3pCkt6p5JTvGUIPbY=;
        b=KKCcDaBFg6iQaqWAX/nJZhFrJWgcz/hF8/whXlFluK51gAqQ+1YoCW4akzvCL8m/9H
         TZXXOmNRck+XqjjKmSgHzmv6fkmW0TvFX+KGMyoNAEurCqvHLmIBYpuxFy/ZINKa0eOg
         RmJrrJoYjfOpzsC2/PPWLgA+jc2YeVy/WXv3sPVGQpzStn6wE3vG0hTRt/FUl6pfQOfN
         3plAJNF8TwD3eliQZ8IEidHmhSWSHcSSjgywp0hsKsAwYD2MPIbhQNonODNkzrqCw74M
         7qvQllCEBB4NFcd3Dow79QoF2jKxKVzS7Y7DVWQumA6b7QuSFwcZv53eel5y/jZm+J8a
         wjgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTY2gvbbDKu6R1bLABeKQYb/fNDNBCQfv/p4St6O+DA41Yt1yHemE3oAsPAiW5GEMNyQR/SwFkDHuiK6AGGPoSkYTDt9krRtb5TbP/QQ==
X-Gm-Message-State: AOJu0YwZzz3RWqV33WZasnuvPpqOwL09TPf0V2TbsY/UF5NVkL+I590B
	Ta1tHg7TPF1/CZrkLioxveykTr0iNNc9rFiVV1VTRKi+tS41hSp6
X-Google-Smtp-Source: AGHT+IGI+OTlVEO7wIsXzAbhMQNtoGzHCywFwCT41xg8p1ig4AGa2ou95jce3cAxKesZ3FvlD4fmaA==
X-Received: by 2002:a05:600c:3b89:b0:412:698d:69db with SMTP id n9-20020a05600c3b8900b00412698d69dbmr5801097wms.2.1708551941036;
        Wed, 21 Feb 2024 13:45:41 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id m34-20020a05600c3b2200b00410ac2d6b40sm3854150wms.8.2024.02.21.13.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 13:45:39 -0800 (PST)
Date: Wed, 21 Feb 2024 22:45:37 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] staging: rtl8192e: Remove unused variables nic_type and
 RxPower
Message-ID: <96f8c089aefe6648dad0c68663211b375f016517.1708461563.git.philipp.g.hortmann@gmail.com>
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

Remove unused variables nic_type and RxPower as they are set and never
evaluated.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   | 2 --
 drivers/staging/rtl8192e/rtllib.h              | 2 --
 3 files changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 07218edab746..e7494b548749 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1295,7 +1295,6 @@ static void _rtl92e_query_rxphystatus(
 		pwdb_all = rtl92e_rx_db_to_percent(rx_pwr_all);
 
 		pstats->RxPWDBAll = precord_stats->RxPWDBAll = pwdb_all;
-		pstats->RxPower = precord_stats->RxPower =	rx_pwr_all;
 		pstats->RecvSignalPower = rx_pwr_all;
 		if (pdrvinfo->RxHT && pdrvinfo->RxRate >= DESC90_RATEMCS8 &&
 		    pdrvinfo->RxRate <= DESC90_RATEMCS15)
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 705b94f0911e..605bce803b5f 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -1500,8 +1500,6 @@ static void _rtl92e_rx_normal(struct net_device *dev)
 	};
 	unsigned int count = priv->rxringcount;
 
-	stats.nic_type = NIC_8192E;
-
 	while (count--) {
 		struct rx_desc *pdesc = &priv->rx_ring
 					[priv->rx_idx];
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index d764de9459e2..d238fce712a4 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -474,11 +474,9 @@ struct rtllib_rx_stats {
 	u8  control;
 	u8  mask;
 	u16 len;
-	u8  nic_type;
 	u16 Length;
 	u8  SignalQuality;
 	s32 RecvSignalPower;
-	s8  RxPower;
 	u8  SignalStrength;
 	u16 bHwError:1;
 	u16 bCRC:1;
-- 
2.43.2

