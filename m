Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A920D3E462
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 04:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748763; cv=none; b=nQlmQb2d72LhtGKNBhYwC/9ThChz8BPYGqC+l3C7IOKhP3SXGmnvzesuXRYgwB8/0972WklZEB/tYBE8fg0RE/KT9m12SQGFPqESSeG8ie1SE1fFpHyE+iNAJ0JzW3X+IwmUZgt6xxw6pB1WCow8RVaYih4m5rns3GPrazS8DqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748763; c=relaxed/simple;
	bh=GyNRy50iVJ8CzHvzzyr2UB/FzU3BE/8SBY88bWxnEJk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D88MtX5fhQC9H3WuESWiSCAcBvnOwyMfKW2xwZU0z+dh4MrFC9XGcn0RI3ThL19AR/EX/x5jB5MUpxkjNOTqxGu/VlQO9/6dPhqeIsFi0VZdjXFfTE+NyhsKQoR9h00PvqtxiUd3nZ+daAkja8RqkGe7hJLP+K8FHwRmc9YC1SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=hAV1FAcG; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="hAV1FAcG"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6f44b5e7f07so5233175b3a.2
        for <linux-staging@lists.linux.dev>; Tue, 14 May 2024 21:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1715748761; x=1716353561; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TKnRcK17hcgNmkRBQJJ1T9dJgIQuI3ZGebQCDIapiBw=;
        b=hAV1FAcGxXb3AntPI4NaUVdSkn1CMmLjA+mFzdkzB0I6tnaNYgEkQEqlcgKAmyrp2g
         t8B9RVMb0OMS+g8CgTKfMlgfrSfQ7TS+KD06rUWSqaaOwWO3Us4dUs9Dsftyn5D2y1A6
         PuoSr4tCIzk/5md7Xt3l32UGDTxqa3UYF/L3dWsRORted81NnU9ovO4uQ4wZ5IixSqSy
         vFG1mm9Bm1ypwRq4S+CWbwQ/SEuIG9YKMfErggvTm/JTj5uh05DW2YKKdQdD00aW4hRX
         9zCvHrd8B/h0VC+DgDomVjOeq5iMVMush0OyExTF+FlHMjNr/KuQpvEhWyJibT087/om
         EQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715748761; x=1716353561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKnRcK17hcgNmkRBQJJ1T9dJgIQuI3ZGebQCDIapiBw=;
        b=HQKh9APtyTrHSz5MvbV4T71tGs/I4K+tp6/wdmwl5R1JblOkqkrHrpNMnU18TwEAeL
         BfUI2jn0iSsuktzntkIfWAeRcaFtF8qMAPhUgflOB7aeNv+cbotqZE6y7+Xaog6TNgVE
         thckIpsneqkJZHiFU4XBMtXXCWb91Zomw/FjCzVSM86oTowce1jw0R54SLocklah141X
         l/KzrT6MF3zlEImRHHk2H5AfDQR0x9BDoMfEjm4fjcicb/onxjTzKYSYKD5jzTUEQlWM
         KOdx74D71Hm+k6iBC/kD4O551CussmU/ziYyBgKa5xUKal3pgADNG8NHOuy4R/tfwWKv
         m5jA==
X-Gm-Message-State: AOJu0Yy2k1IUHtep9/nX3/DPqux3GJ/lIPOP+7XGKKsHlBvnilCo+Cli
	Ud26s35vGQpxpH9v2i98E/IsGxuiKP9j3oopZ86mAC5Qdil6SMpIzLa3tJJlkpxti6l2ci+gJha
	S
X-Google-Smtp-Source: AGHT+IEoJMfmvJz5Xb6i4RqmtY117K7L5+CRsRRKqbQ7AqBeF9TxfIV3yUZga7Tol11qf6rvojuSCw==
X-Received: by 2002:a05:6a00:cc3:b0:6f3:ecdc:2248 with SMTP id d2e1a72fcca58-6f4e036b640mr15969006b3a.27.1715748761062;
        Tue, 14 May 2024 21:52:41 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a827fdsm10135035b3a.60.2024.05.14.21.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 21:52:40 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 09/31] Staging: rtl8192e: Rename variable rtllib_rx_Monitor
Date: Tue, 14 May 2024 21:52:06 -0700
Message-Id: <20240515045228.35928-10-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240515045228.35928-1-tdavies@darkphysics.net>
References: <20240515045228.35928-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable rtllib_rx_Monitor to rtllib_rx_monit
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 76389aef53ee..108fe1520cf9 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1383,7 +1383,7 @@ static int rtllib_rx_InfraAdhoc(struct rtllib_device *ieee, struct sk_buff *skb,
 	return 0;
 }
 
-static int rtllib_rx_Monitor(struct rtllib_device *ieee, struct sk_buff *skb,
+static int rtllib_rx_monitor(struct rtllib_device *ieee, struct sk_buff *skb,
 		 struct rtllib_rx_stats *rx_stats)
 {
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
@@ -1434,7 +1434,7 @@ int rtllib_rx(struct rtllib_device *ieee, struct sk_buff *skb,
 		ret = rtllib_rx_InfraAdhoc(ieee, skb, rx_stats);
 		break;
 	case IW_MODE_MONITOR:
-		ret = rtllib_rx_Monitor(ieee, skb, rx_stats);
+		ret = rtllib_rx_monitor(ieee, skb, rx_stats);
 		break;
 	default:
 		netdev_info(ieee->dev, "%s: ERR iw mode!!!\n", __func__);
-- 
2.30.2

