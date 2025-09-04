Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3834A1F872D
	for <linux-staging@lists.linux.dev>; Thu,  4 Sep 2025 02:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756952124; cv=none; b=X1D+GwykhRwSsCqxAItuR0ROZw3vYfGvehhAKiJ4tqGzN5+qgdtRiTXvbKrNWQWWkPFp9NG4WKYd80rYp4HdcwtF+CSPZV9JWT+4FooMXWpsafsIaCFiKzCz8UoY10MSpAxm9uGgsfqjpoejtvuVjPMGRsiTFjJbvdiIP0DAOIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756952124; c=relaxed/simple;
	bh=d/a/06MRexX8jkafOM3Tb1PqFQuAWBAEPNY/pLIaUXY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PE7K+tzpn7pmb9o7rYOU7Vdpr5jHnQE6c6OMFTeQLGEuXvgy98vsopyZ/i83wbwWpcgzeA/b2/oudzLeBDKdrLybdiHqQNtGRW1y10n8SF4csFDSUO8iEqQpjkNUgMTi2WDI0Li8yT62E+QfOcX7o/jWoM17tVQFJaGbij/HbbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PDAbxELS; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDAbxELS"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-726549f81a6so5373916d6.2
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 19:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756952120; x=1757556920; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVxRP/gHP4MJ/VTDLOIdadmwOEyVTedNOpSakKUHi5Q=;
        b=PDAbxELSTIzHus8JVOppLkCT578BlOWItLD5wW1eXRBky1/z8m9B3iWipsE8TrsUD9
         c9SwZSLXj25kHXG3UePF/ll26pk5Pm3MItz9MkBL0SlLwzmmCGepfw8v9XRSEWwDRQAG
         lCltLEN8ocyfMdUXvvx+3IMVYFBl9CNpW6Dex3+p6WFU7IYhaHR9ZzBbY2FCbA7FI+Iv
         KhC1bgA9nITbKNegnjI3J072sbf1wZ2earPwLcZQoinqNU2uL9/pGOghw60IOj5l2SHS
         7ICRBmdfMM57flpfImOAVLx5LImebStBaZboDbuU8/iHDVBtyNMkfBuVSF2oM8wbiXKE
         weEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756952120; x=1757556920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVxRP/gHP4MJ/VTDLOIdadmwOEyVTedNOpSakKUHi5Q=;
        b=UgANQ5Zxaa1oRjDe+dxR7qfpNAou1Q+MAqKn/5a7BwmEW/iV//Q8Beus8Vf1ziKml0
         WeHPs5NRncZgeA5u9LcujiqWJe+UD0MojxIifDXlafKgY6UQm1iPH7nJVmb1XIImTTYn
         55HYV5W6mPTWmnSC4fzqEvT0udmVFBrQ9k2HxkztlXmb2uGVNRy3pQUrh8lX1SV4uEjt
         Xq3KjEZSi3U3truNW+wrPosGRixTrrp5MP5cyngcOl7Y5FlVEtpZ69wItZpzGIfMM50N
         9nhtvAs36pwQw0tciOXotLJ1XLaP4XcejLf8+LqMnRj8i6OUDXBJ8fEUpzlBxNByYJ23
         4TtA==
X-Gm-Message-State: AOJu0YyuTmdTxfvWf3AIodYzOB8ehRKBNWEGtYtRuzzaVXFLMY9xiLIO
	z7ATe6m6ud1/aGZE34uEDyjJ704k97ooBR5FLu/drp9LlZTdZ9U8Fsxf
X-Gm-Gg: ASbGncvSeD2AMlmDmIsX6pgigHIMQC3MJEhrLr115ASiqlymPWS2+8R5nUV6kUsDTgA
	GWQqkL7rkTJsb56KkDDoZUSilvOPcMI/8Fgzsp8bKuZE1h3BzasVnXkknwkj8qVz3Q+ctDyAg7E
	n2wBe+BDU2VTUtu0ZMDpZ9mD7YPfjbh6JYRtm48bGuFvoz6N8JCt1DUwZY5f+Gmmoh2vkbzVCc+
	vN9C6Q1dPah8rRZGPbZQ+5Cx3C9OqhFUaYW38cyrRjr/ersGiGpgEqnlRizIPuce/asK1+snFa3
	BMQye68v9VWF/6kYfYY2z6mowIcKzloOmSKmgBHiHRs18pbtb5jStHGqWyVYdR/VhEboTU/JC8u
	y+od4B4JgFPRvmkkOrvxG0NzYqJ35uTrd5uHFupeBwLJC/PBF9HY=
X-Google-Smtp-Source: AGHT+IEVebM5qnAmzI7cnZAlWknRkgW85d9n6X104TWupLULP8QJNQ+sporW6oExm0LIDSZeVRhUyg==
X-Received: by 2002:a05:6214:3007:b0:70f:a347:a9a9 with SMTP id 6a1803df08f44-70fac86f022mr241292036d6.36.1756952120162;
        Wed, 03 Sep 2025 19:15:20 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720ad2cb78csm37714076d6.19.2025.09.03.19.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 19:15:19 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Subject: [PATCH v2 14/16] staging: rtl8723bs: fix line ending with '('
Date: Thu,  4 Sep 2025 02:14:46 +0000
Message-Id: <20250904021448.216461-15-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250904021448.216461-1-vivek.balachandhar@gmail.com>
References: <20250904021448.216461-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adjust formatting to avoid a line ending with an opening parenthesis,
in compliance with kernel coding style.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 25f333bb0816..2c34b68f1d60 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1112,8 +1112,7 @@ static void rtw_joinbss_update_network(struct adapter *padapter,
 	 * ptarget_wlan->network.phy_info.signal_strength instead (has scaled)
 	 */
 	padapter->recvpriv.rssi =
-	translate_percentage_to_dbm(
-		ptarget_wlan->network.phy_info.signal_strength);
+	translate_percentage_to_dbm(ptarget_wlan->network.phy_info.signal_strength);
 
 	rtw_set_signal_stat_timer(&padapter->recvpriv);
 
-- 
2.39.5

