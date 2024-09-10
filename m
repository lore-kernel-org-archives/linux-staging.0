Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECCA1741FA
	for <linux-staging@lists.linux.dev>; Tue, 10 Sep 2024 05:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725947862; cv=none; b=qqyKaFUAyP/81NuPabtWZkra8IB3406GR6xLQZUENc+eCM+q4zB+DIHjiq2cIKSdLoNtha/7U69RyXtifsh8KVOAkUl/SW5TW+g9uKY+G3ZNYW29/4pSziTfFoE4UUeM03J+FM/j9RGwb5kN6AJMHrTwFmwuXizUXINz1Hzhb8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725947862; c=relaxed/simple;
	bh=88MdzK35pF009HwgTk+vpadotNtn2mweeut5kECOrTU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mKN494jpQYGvVeiZHNiFMo79rYWxhPJr+wMQi5eIDYK4gGBry4orBaPSOXyL5cQez6SjUCm2l7UkG0z/RpYnVEuNth1m3r36HgGE7t123WAWZqiJfLQtXydTsXkF4Y+Pil/fQk64RF8BdZtccjmCNpN0k00zLYCKfs4Lepx29u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HFjAA72s; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HFjAA72s"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a8d100e9ce0so462462966b.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Sep 2024 22:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725947859; x=1726552659; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0qZhPDdZQMhy2lcFy03oOkPowW/yGJnrN+PDGUtF53A=;
        b=HFjAA72sh4VYRI3T4PWle95R4Vz0lA5L1/xglN8+yCve/SQ5nO8x9v7NaIS7x5kx6X
         e6heaHrYak0qUqF2HG1XZ1H5E51BLbp3C6lR2Pp5NvPrOLu6sT70LO0bvD1etsjsZ6JK
         3MAIVQDqcs96KadM36ZMo3smtz7ctTO5AOc5OjNc3zzE0XC75PKVeGmCRPsXPjVPmGJZ
         dYoZYTExACK1pYL2dRb5tLugsHB4kDVA0d9/jigVc5Sls+tbpYuJaQmNRXFwKj8rmYyg
         ZKUIQhjBH/Ahyupw6b9frYwTLsewIzvGVxMYTCba/iiO9SI4bN19OKgE3e1HBZY+ualJ
         0VXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725947859; x=1726552659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qZhPDdZQMhy2lcFy03oOkPowW/yGJnrN+PDGUtF53A=;
        b=ePF70Z0p/EhI5UBoFBEZ5OcgVZ69MQrzWp2erTWIiQKJ7ckyOASNnV7Q8fPl38S2ro
         iDlJJsaRdYeHZCkODkHsrUhsr5VhSlk81w4u5zdlfewgEMrZ8SFdKvmZm4WmSBWFZXwt
         KGAXUS0PlgNWIGVPaC/a45oF27HHPq7nkKo2j2b+pSN0M8fH9U6bZaxQOePJVjeod5CQ
         rS8RMpDO+gYQ+3iOqOsP0aeK+OniiSQRnT03BV5OA2QKNO1D6lmI2UE8UiwhXaqYl7+8
         M2spExC0fKDCi09X7XbjS90NWFjLtihzlJ5sdAgex0/VVFrrq57NcrA7v8E2W1lD9DAL
         +UUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc9y3TxJErApHyoQ8WeusDkgzoZOgJL4z4VpuqKPa1keOF6cEb4VSOUDsQR7xxK8S8TIMz2ms0xBcvz96e@lists.linux.dev
X-Gm-Message-State: AOJu0YxyZPLE7nSudK8PLgXjHKo1FHRvQwl1d1S6IdWgOAkSI37mS4l5
	PHjq/LTBWp1iahEtziJ/hpPAVFRVicHySXc4enqb2HHPS3SLasCY
X-Google-Smtp-Source: AGHT+IFxP7HYZREKwbvwJ28zJ8beb/6B356d4GuWn2Cr0EUFv/Zb6zwv3IHC7ygQmOWDa/AnGqjKAg==
X-Received: by 2002:a17:907:5cd:b0:a7a:8c55:6b2 with SMTP id a640c23a62f3a-a8a885fb74dmr1484410066b.14.1725947859185;
        Mon, 09 Sep 2024 22:57:39 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p200300c78f2a8598b80c2d4e9a813f29.dip0.t-ipconnect.de. [2003:c7:8f2a:8598:b80c:2d4e:9a81:3f29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25c72e7fsm431020066b.109.2024.09.09.22.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 22:57:38 -0700 (PDT)
Date: Tue, 10 Sep 2024 07:57:37 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 07/11] staging: rtl8723bs: Remove unused function mac_reg_dump
Message-ID: <80e89052b30d8c495f375e43fc4c1deeea75a624.1725826273.git.philipp.g.hortmann@gmail.com>
References: <cover.1725826273.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1725826273.git.philipp.g.hortmann@gmail.com>

Remove unused function mac_reg_dump.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_debug.c    | 10 ----------
 drivers/staging/rtl8723bs/include/rtw_debug.h |  2 --
 2 files changed, 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_debug.c b/drivers/staging/rtl8723bs/core/rtw_debug.c
index e5a4baf1b78b..bfce632e037e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_debug.c
+++ b/drivers/staging/rtl8723bs/core/rtw_debug.c
@@ -22,13 +22,3 @@ static void dump_4_regs(struct adapter *adapter, int offset)
 	netdev_dbg(adapter->pnetdev, "0x%03x 0x%08x 0x%08x 0x%08x 0x%08x\n",
 		   i, reg[0], reg[1], reg[2], reg[3]);
 }
-
-void mac_reg_dump(struct adapter *adapter)
-{
-	int i;
-
-	netdev_dbg(adapter->pnetdev, "======= MAC REG =======\n");
-
-	for (i = 0x0; i < 0x800; i += 4)
-		dump_4_regs(adapter, i);
-}
diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 9948fd0f7e91..c417a26de166 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,6 +7,4 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-void mac_reg_dump(struct adapter *adapter);
-
 #endif	/* __RTW_DEBUG_H__ */
-- 
2.46.0

