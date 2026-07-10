Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F3129B795
	for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 14:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783692753; cv=none; b=FcErTNHF4CCD9aALvTQ1bChdQ4b1qV2IxSN+Y630qewDoU5kRC4JxDgpXGKDWUvVMQu70nWeTnrNLvgFDNpXEMq7ToolQ3MyeLHaRaOLUYvxPLBt4ZH8vs5VbaPh+ckLZIqYuHMN7gYpMgL5sFNeHwXcY1k0PGFaIar2VpqZcQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783692753; c=relaxed/simple;
	bh=N4pEgZ+Oo0UfBQM2DL0UMyrll/25WZRgJEn9G2pcnw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MTDAI65PNDne5BhwNER4XpLr0WJgJUdZr4Dksn7FW0FuWd1UMcrtnvgt2RPzSJ0rVCC99e2v3Em7ZD2VbUVqlajS320IaSjByGeUSvz+JOQg4gXj57t0L74P6XHMClcLPCpdm6tBbwE4+P1VAR5sF7WEFhaxIitb2GigOcHp+BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YY86ILCg; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YY86ILCg"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-37fc02e660bso1254544a91.0
        for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 07:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783692752; x=1784297552; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+25MHFOWDVjOVz1pzn/RsxOFp8o8wn/hpyQNGxFdMaM=;
        b=YY86ILCgzUN9gxxy6nZqIFezZVTt2MgCrA2v29UKtqQHrDldSCuTn5A39r4Sp81Lum
         BKSD54MHUyZs2lUTEUS07FuNqPfNtaF9uiBAc9NeEDukcnrpg+dCc5DivlJb/2jPNZ5r
         z0xU6+PIyQAFhF8DjgY2rcFivtBODol5wc/9C5+iALsDxDHvFOgvA6ht9hMkKX3SNLLf
         7EnGhRfo+WUbbzGGWH9hJEJxRplU2f47dOESHQjaH5HQqKPCwBBbh137GC9y/QQgnMrA
         YfnNoKmEspnNA8fEQAmYvJQlrSAh6gu7YQmGVfgCsXiKlOUUPMMjeIAS9Ugbf1S+5D0A
         Tppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783692752; x=1784297552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+25MHFOWDVjOVz1pzn/RsxOFp8o8wn/hpyQNGxFdMaM=;
        b=E93hIDkLmo5uLdtwZnn+6XZ4HN2j4Zwok1biM8Ca4eaX+XJk5QzW/SI8eXizM6TBrr
         dHSYFkXW1ADShtiuKIbM1ywIihYtvULjtxCSm5tfxGujJT4LkmC2+e4FNu97LnbaHPAC
         UOGXCvRKE6dmAyJcnwc+8DlMToapQYLNs//L3PEXLqlhz2np13jtiy7bNJo3sRDjLMRE
         eRy7tb3gwrJ1J2p+PmJtOETzYGhFCSvI+r5Wko+ncD/MeATZ6FkgV3vSnt5a54fDtogl
         eGHG6u09UHcgnkx1WnjaQZW5iK2sbQcGXw3d50QF4h8peNNW6BiYugQOqpgwJaxBVtZZ
         Mg3Q==
X-Gm-Message-State: AOJu0YzbR0+q3HVb8I9OPLHMDF89SaBl7WUOKd4rydQEZavIDJ/yQjMa
	jWf4ozXS9BzSvnpCgrqZqwlp8llyifPDZpoh8ze428u2ywPMkvi4YLwr
X-Gm-Gg: AfdE7cnje0G1MLwOdmDttQk/WbEPzznEMRqi+JP2c05Ecj6hhkI745nnT9y8ybXWcEE
	xwASC2+7LQ96BHbb/oVW95flsvgvPyrsxJp0+njc73I0wkSBXoX/EolZvMfvB6gkn9zGeZjdj7H
	gRu4JWDPcfQGqA48DWRNsNHe/pz6FUT80H/5ZQ2RlGVWdt1Mv0hdzQqkQ6BTZMj7sw8nbuD3LWJ
	haIV76mMsfWeIFBXRGI7OfZ3gAGeioO98EBWDYqiBi5SkeXvoOefPNXb1v1EgaldB2Yhk9Ti6GU
	HomYoITmcVQj2tdpBmmZDb5KBHVilZz2YDbax/TGfCyWqbzazfRCo6/KTmS8vocebh9P6G4/jTq
	Tyf3Do02PscSdEs6dHtUe7W0ptHM54TVNGEsEmyQEqlMuxraIVKlCkw2Ug2b/2SMcoXjc3eXmp7
	zaEt57Ll1al+4QQHha6tKx9O5xGTA7Brj85ZifhyeWCHhtJFvEPn9WtGHoVBYU2K2MaRqeP4P+5
	nwIF2Z8XJ5O30viJZO/3KUJ9Z7vZZnMDA==
X-Received: by 2002:a17:90b:3f0f:b0:37f:d262:1e0a with SMTP id 98e67ed59e1d1-3893fd5f5acmr11876014a91.12.1783692751522;
        Fri, 10 Jul 2026 07:12:31 -0700 (PDT)
Received: from ip-172-31-35-55.ap-south-1.compute.internal (ec2-3-110-105-96.ap-south-1.compute.amazonaws.com. [3.110.105.96])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311b00048a3sm12005398eec.5.2026.07.10.07.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 07:12:30 -0700 (PDT)
From: Anirban Bose <boses156@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Anirban Bose <boses156@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: remove unused variable bDumpRxPkt
Date: Fri, 10 Jul 2026 14:11:39 +0000
Message-ID: <20260710141139.20541-1-boses156@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260525065935.130736-1-boses156@gmail.com>
References: <20260525065935.130736-1-boses156@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'bDumpRxPkt' variable is declared validate_recv_frame() function and
some debug information is written into it by rtw_hal_get_def_var() but
as I have checked it, it is not used anywhere else in the function so
its basically a useless variable now.

I have remove the variable and its assignment in the function.

Signed-off-by: Anirban Bose <boses156@gmail.com>
---
v2:
  - I removed it after checking it as pointed out by greg, instead of
    renaming it
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 6bb119a83036..2f6c9967805c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1447,7 +1447,6 @@ static signed int validate_recv_frame(struct adapter *adapter, union recv_frame
 	u8 type;
 	u8 subtype;
 	signed int retval = _SUCCESS;
-	u8 bDumpRxPkt;
 
 	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
 
@@ -1473,7 +1472,6 @@ static signed int validate_recv_frame(struct adapter *adapter, union recv_frame
 	pattrib->mdata = GetMData(ptr);
 	pattrib->privacy = GetPrivacy(ptr);
 	pattrib->order = GetOrder(ptr);
-	rtw_hal_get_def_var(adapter, HAL_DEF_DBG_DUMP_RXPKT, &(bDumpRxPkt));
 
 	switch (type) {
 	case WIFI_MGT_TYPE: /* mgnt */
-- 
2.53.0

