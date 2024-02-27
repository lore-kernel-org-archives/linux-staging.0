Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903A752F98
	for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 04:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709008943; cv=none; b=YU0UNOM7SQABVAcpA2OkcOwSIafZvgiSeWiVnxsMJxM+1jOmln7EToNqiMl6jOqEKhlxSFd9foUO4zXLhfZOsUXblLOSoTC8n54vlfmjs2a5+2s8IcUhIplrOOunTFBHishQ1FvawjbXtEOLlGQ3yrz9Tztv5asYrrKYt4hi3XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709008943; c=relaxed/simple;
	bh=BF/sv0OBJ+auhhZiLNMXTsH8e8AmZBwl76hXFCd5Spg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MU4u2/YInI+TUhTyVbuAtU4YHHeeb+5QH0Ig5B6CXfqSPH2le+XDhmd1JuFJJJbp152GeIqDzppiA62AFNa0fUmIwDng/LmgdxDisHu89f8jQudow11h77+zmykaE7tphBXqTduGNyvdCnYbqkgdLYI4/XqhXW2L6wfNxjGck0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=e8AOdF+x; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="e8AOdF+x"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6e53f3f1f82so832103b3a.2
        for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 20:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1709008941; x=1709613741; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWeyU698U5yeL22d4/joOw8xFVDMJsDJjbUrJw2JctY=;
        b=e8AOdF+xVAz33u9ntozP3aqSkFHvt3JFcLSlYbqiA0wh9TE3H44SDplowdaWyEMm1w
         1ISHCq6RIXFDPCpmJPg3SQuD473CXOj+zGJAeh24xGgDahUxSQJQVTUE+Jum58FTnAnk
         LSMU6O0BG3etxqdw7CaZClsrVYtMsphZBkdY6FLvssvKXmqWjP+00kaRea8Pdgc/uv4D
         6D+n/vK3tGv/89WmWZoBJeVlH7uexOkQL00cXfVV4mm5RXRdoELLWsK5oI6X+O4PX9+3
         hCrKR5hwfWGkLby7kHoT0V81KEBU84jIZUStdlAJH41lYKpR8uUvhRhlmdH6ZJjpB5wb
         jBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709008941; x=1709613741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWeyU698U5yeL22d4/joOw8xFVDMJsDJjbUrJw2JctY=;
        b=pcVIx/gP19HoknTtkeQvv9T0Np6QQ2HzFAS18p28oXPPd1dMK4SyMfW+GsoB5+PqQz
         /WHUX9hYs0vfscjDGlyjepoo8Zpmfyoxg7fu3/XPOfoDYWBWXg7v4K0ufdszJhcx7F8g
         Kzy6w/LA9snjY3fy/l/xvSTi56C/5pDN2EaC2r7oHEmzbt1pUHfbl6IRKnDmGeIaa1zE
         q6iMxBOAeL3/k8AWPHNw2E6gAQ5dJm1XcDlfGBxypPDKJwGYwNlUPxojOIE0apcBtkH5
         DxHzBWX/m+ifKVEkBMyNv6YSS5wgC17+dEpxe87qM29PpUgVhF/eNLCXLZ9WLOytFk7/
         wFwQ==
X-Gm-Message-State: AOJu0YxJHfo7LoEHFHFJOQLBtGhg00uFXU8j5JIPEWBcEsgvChTYSifc
	1IITIK5o76LddXSfyvgL+dPqRq9EH4iDunraTCATKGrKDzlUmecW+xQPdaOX5eo=
X-Google-Smtp-Source: AGHT+IHPRE944yFD9VtGqCj/eXEhX45IWPacIf2hxIVECOn/sy17eCcM8px+aYUvMT4VA6Ye4ySO7w==
X-Received: by 2002:a05:6a00:3d54:b0:6e5:3b52:d4bc with SMTP id lp20-20020a056a003d5400b006e53b52d4bcmr3542618pfb.15.1709008940787;
        Mon, 26 Feb 2024 20:42:20 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id e30-20020aa798de000000b006e4ecc3e394sm4899782pfm.79.2024.02.26.20.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 20:42:20 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 17/20] Staging: rtl8192e: Rename varoable asSta
Date: Mon, 26 Feb 2024 20:41:54 -0800
Message-Id: <20240227044157.407379-18-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240227044157.407379-1-tdavies@darkphysics.net>
References: <20240227044157.407379-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable asSta to addr as it references bssid addr,
and fixes checkpatch warning Avoid CamelCase,

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: no changes
 drivers/staging/rtl8192e/rtllib_softmac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 567891123960..d19895220878 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -2238,14 +2238,14 @@ u8 rtllib_ap_sec_type(struct rtllib_device *ieee)
 }
 
 static void rtllib_mlme_disassociate_request(struct rtllib_device *rtllib,
-					     u8 *asSta, u8 rsn)
+					     u8 *addr, u8 rsn)
 {
 	u8 i;
 	u8	op_mode;
 
-	remove_peer_ts(rtllib, asSta);
+	remove_peer_ts(rtllib, addr);
 
-	if (memcmp(rtllib->current_network.bssid, asSta, 6) == 0) {
+	if (memcmp(rtllib->current_network.bssid, addr, 6) == 0) {
 		rtllib->link_state = MAC80211_NOLINK;
 
 		for (i = 0; i < 6; i++)
-- 
2.39.2

