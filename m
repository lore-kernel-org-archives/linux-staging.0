Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B6242E416
	for <linux-staging@lists.linux.dev>; Wed, 26 Aug 2026 14:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787754913; cv=none; b=bX5byoLWVsIeiVSysuJDG/VgngMCJP083coMxLAn+xKFzI/71R5Aupbi+h/1g3AUs6u+20jzK27t9fpD+7g0ciayrmd3pfx99lEKifFrTNkLcKZhszyIgg6+JGghp4zgtSZkcypd+5Xuse1ZwOKZnEWwebubRVQ2O3MyTc6WORU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787754913; c=relaxed/simple;
	bh=jqfkF0e6vWxKSKLw11Mg207qPvtAzL2cGYddUhr5jCA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=phoffUN5NVZUbMN/xdctr0tqibhD/K8Ko9lCcngxl031VK2YrT5x8/gbWGy//2lDqL5K0A0wMLHd52fYyquZGpG2VQlRImaK5yGGXirLk0ika9QutiHwe8KgeewyNpdNGJUnRwGTkhAyaHeJ6ijn2JiPhViABB5Unu7TWkAH7JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fsvw/XTN; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fsvw/XTN"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c252cd2b3c1so85290866b.2
        for <linux-staging@lists.linux.dev>; Wed, 26 Aug 2026 07:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787754909; x=1788359709; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=puj5sHCWZ6EX0dZBwVaC94xWO8GxrdTzFIHs0oZ7wjc=;
        b=fsvw/XTNXBfpBAT8qdhdwaGnToa204YijGAjsM61g6+KyzKQ3vzhgekbXjk30dTlqs
         EfxdYdJ3z19ZTeBv6jJCL5b7Xpll6lVV0hplVoLyXX0p8gZgSPSHekICsiZ5LEBJBzAZ
         h5/MILYWVD+5HYjYgAt8AEl9gnC/wLeDRxVhQEJTDeUC8cuLLNEeby+WU3Us6kC6vHd6
         uKF2jV1raFmKJckZIwga2Zd7Gj3QMoz7CgFrOlItPEh/bGnqnPlCEoBtfX9h/OxjqcMX
         rMkgBUyCnwYkmEHNCrBuoOptnzZ5juQdOL7SmVu5escy8CDx++/tBBNwHwCkNg9HNZZJ
         7/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787754909; x=1788359709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=puj5sHCWZ6EX0dZBwVaC94xWO8GxrdTzFIHs0oZ7wjc=;
        b=dXizHm1mdDiSr23SBnbVclmMEFaS27Wr7ogye5BV75h7kEN4ogElJyVWOZqVAFKGix
         ZbnlPb8SfrZwEZedxChiGeBmiu0vA9nmyMa7dwYTM72jZ3Jl4Rav/HFaj0JbEvxA5D0c
         5TujwZl0dQb53mgLP5WTf9T0e8DGmhdokYlpDU2aSYOPEvBO/wvxiNXBRxe3N9nJdxwk
         +3sqCknxlsATVptbFIkOvIbCdXs/KSymukboYbOe8eTVcBh+JKLbi9rcNK0gIn6gSwte
         /9z+lyxh1fIHsueokPfSCeT3BAVgnmym0J0lfnJeeSHiNEFKWEBoLD+pUSbrZztsyM6G
         PILQ==
X-Gm-Message-State: AFuF++mG0XFALQdkUwwuYM2yA0FEjUE8hF2ZJ7oSYZ1KKU4MmMS8ofEm
	//bh/w5eQnia/dokPWtZTigD205CyJEfeeN2sOlPhX3N+FTU7bawEOrE
X-Gm-Gg: AR+sD12OdxywuLGbUZ8CyacMfyzPxN9oXMJxpvZvQkBNX8Edx9XWembdonhJxRypYbX
	YHFsiSFzljOCqYDWh1HgxaGUxHDtIkbohO8H1M2bFCksZwuF81b6VtjOhSyFELxrNfUwCFta9mp
	nwlrEvJvob35oHlP3NpZ8oFfqyi5uqe9SoSmTY3aq4l8E/EiUdFdsKtVU180DA3H2sQ801dG2fu
	MoamnbxByLsN5RzDt5Z2roimCXYPH58LXilOjXaM34M95PM1Ld5laxmmfKHUN4rEr5SHBIGHr65
	1hNCuOZlbAt/xMnmjzABx8lYNOHuXEcsHF+gJnPvLeYWOGBCZ1dou5o0PXDW8Wb2mj6GbPhT9iQ
	+gPknvEvyXcZ/mr2PtE1Do8GlDBggJvFXJ+bSuefV3bgzqrlkBCdNeSeHXWXuKEi3eQc9004iVO
	0IeTjxriiffcxF+j4eMSF2BqN013O2wc2A8e+Gm/Ut5q0LSEtYFYH/sRccpCuiF4C/p6fg8r8uS
	ljK6Q==
X-Received: by 2002:a17:907:1c87:b0:c21:180c:d82d with SMTP id a640c23a62f3a-c250c3bfa5dmr900955166b.20.1787754908848;
        Wed, 26 Aug 2026 07:35:08 -0700 (PDT)
Received: from localhost.localdomain ([94.240.188.176])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9ef92csm531690966b.63.2026.08.26.07.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 07:35:08 -0700 (PDT)
From: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
Subject: [PATCH] staging: rtl8723bs: use strscpy() for ifname copy
Date: Wed, 26 Aug 2026 17:34:18 +0300
Message-ID: <20260826143418.5713-1-nsvatoslav515@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace snprintf() with strscpy() when copying ifname into registry_par
to avoid unnecessary format specifier parsing.

Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index f31196f54b3e..dd0c5fc813c8 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -256,7 +256,7 @@ static void loadparam(struct adapter *padapter, struct net_device *pnetdev)
 
 	registry_par->enable80211d = (u8)rtw_80211d;
 
-	snprintf(registry_par->ifname, 16, "%s", ifname);
+	strscpy(registry_par->ifname, ifname, sizeof(registry_par->ifname));
 
 	registry_par->notch_filter = (u8)rtw_notch_filter;
 
-- 
2.47.3

