Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA5B256C70;
	Tue, 25 Mar 2025 13:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742908281; cv=none; b=QT46/2KRbJemiH3YPanhi5Lrt21ojY44mjZegu9QgwbYOt3ac3UAmu3TPzHXIc36+uVLCUfoqjXWTQgLixcgkwYf7AaWBVwdl9kJecgpZ5jqRy3dKUyks+wE6K7eWYyFyR6DyLLU/Ss8PerqI+pxqcMv0JAcZWGwbtnFk791Q/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742908281; c=relaxed/simple;
	bh=edJ4YRNsOE/0C0ggXJSB0i5UyziNkEAhkYdp6Koq6L4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KAGgMatdmT3sCUYfoHlKI+99gBksf+y75UcH1sLDn02FC8HG8b/U2gM9TqTMf0FAlRKqnXW92WL3eQNedP87BjWP3DdXFovRalhq4PkTh0ZqubrEZFUZJFEyzlm6finSK1SvUhPz3+OOUBtS5JOWMRCfdbx5Bnsx/PwJp9k+/Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/xntfo2; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/xntfo2"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab78e6edb99so785304466b.2;
        Tue, 25 Mar 2025 06:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742908278; x=1743513078; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zxm3ckLosiHCJw//iFVWkvyQ4kCXQJFNmNppDxHYSU8=;
        b=J/xntfo2aM2tQfFIcvV17hUnJMHAHwtZEy3TNbniqs/QhtB2DzaXcYCU1GsAHgm9U/
         f8rDhemrSN8dYYWIUce0ThzHScvXxbu7TVqSmk+CpyA99lOXzUXJAd1QIHfbqHEyfKqI
         ePJOrW7F5DFgEatBKupYnHZf+0J+86ITw1VMQYTkOAZEAG5yhjg81ioc1mwYjXgH54RT
         Kei5PwgXZVrRn4VZpFabjQtTpbm7PckGIhWLcKu4+mm7YMz4YdfrwGWo5PwBZ7bGLPT5
         ZMna9mvyy/wKPoDayW8rWHspGIgkZ3xfsJ6pC+7V1bT+2C9hIyWSHjeJ+tdIMMASqS4m
         hgqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742908278; x=1743513078;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zxm3ckLosiHCJw//iFVWkvyQ4kCXQJFNmNppDxHYSU8=;
        b=byEGS++eKaXjYSvZWEPTP2ALduCds2YQiDDSHot/EtGmNatVOisjA8gvN1WFqMzoJx
         mWO+mOqkAzQgKPVpU7Wbz0M+7qKXNPCOvbn6UwGI7yRau987i8+Asbc/MSyAsFyq1ppV
         o979H8BsdzFZbqlUgUhAxo+x8tRhnpo1Q1piISD488M0vRe6BP2Hs/bBUGegg1rf4OpC
         LMVkN8+d69A4jp8gM53khKY9UNgehZN0MfrbKfPRJ5TI0zzVh2l8kDTnYIk6m8cZN+aW
         6jlNstyAm2g1wphV+iJ+2StH3MmsIVizbKRnaxOxhXm8+6TGSZpCLMG9e1natDeDB4j0
         5wCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3ncDYzaNENVALve1tmpkBpARFrw+5V5GkvpRWda7CglDymfUAAagxvLZlubw2GOyAYoBalHccmVU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzwN/M69iK2r4/nKu8krat+giMRfWc1SE6jJRmbS/60y8vvdiKC
	QswlFsrUYOw8Pmhu/lBkD+s4CWQSRzRTxTxpD2zurY08f4sjjjNB
X-Gm-Gg: ASbGncvCiRQ6MSXLhmsUc905yipZF7e0BTaOyR3EFKQFH3yICYQCU6VS9Y+UX5gmhDX
	9MoLzffnPr1tgtnymJdtjHfWiKkYFXxTGUuT288zihk9iF5X4vQW84lO6GsckxOdU4omYO9GrVi
	ey3dDi8h3yP8Fjfflyx/7BDCf7WQN6i27/g/2Tm3M4jkLWDxvspShC0kxumLg/ZXxnDmZhMPyCq
	QL9CY9TXQtsiKLf0aAWvQzJOkmAkreIJdcUIC1oSQz+t8Pg/UDSFEuMDVBhl1ke5Au5fRTuaHvZ
	kVa/ec5KTK6uwPMR2el1nEPrvNanDzeZHpltqw7aL367N+lKWQ==
X-Google-Smtp-Source: AGHT+IG35J5bN+CEAXSSLE8h4t/YPW+a8XkdcaJSWu2ijuFgpXQb9vgmpH546mPppv3DaCUfHTisYg==
X-Received: by 2002:a17:907:ec8c:b0:ac3:84d5:a911 with SMTP id a640c23a62f3a-ac3f224dc86mr1660857566b.28.1742908278079;
        Tue, 25 Mar 2025 06:11:18 -0700 (PDT)
Received: from HP-650 ([105.112.117.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efb658b4sm848739066b.118.2025.03.25.06.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 06:11:17 -0700 (PDT)
Date: Tue, 25 Mar 2025 14:11:04 +0100
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	outreachy@lists.linux.dev, Julia Lawall <julia.lawall@inria.fr>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: simplify if-else block by removing
 unnecessary braces
Message-ID: <Z+KraOo2DfmH5zMX@HP-650>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The if-else block contained braces around single statements, which are
unnecessary according to the Linux kernel coding style.

Remove the redundant braces to improve code readability and maintain
consistency with the rest of the codebase.

Reported by checkpatch:

WARNING: braces {} are not necessary for any arm of this statement

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 0ed420f3d096..53d4c113b19c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -988,11 +988,10 @@ void rtw_macaddr_cfg(struct device *dev, u8 *mac_addr)
 	if (is_broadcast_ether_addr(mac) || is_zero_ether_addr(mac)) {
 		addr = of_get_property(np, "local-mac-address", &len);
 
-		if (addr && len == ETH_ALEN) {
+		if (addr && len == ETH_ALEN)
 			ether_addr_copy(mac_addr, addr);
-		} else {
+		else
 			eth_random_addr(mac_addr);
-		}
 	}
 }
 
-- 
2.34.1

