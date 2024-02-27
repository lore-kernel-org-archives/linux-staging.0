Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D90455E5E
	for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 04:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709008938; cv=none; b=USn3gZfhexEfAeTTLE5TsOcG5hsLxPt3pVMfKjtHDLlmKQEsx0FTwXHxe92Eyc87zMr9Qn6qtFtzIDpQb/OIcLABqDXK9563iJbkVHnj7QKhUurMLLVFZPy7vhwP7vozPTcKOEQflkmPa++I/KUeh5z14kI3NDfJG9WzUNlaOLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709008938; c=relaxed/simple;
	bh=tqcc9gB26d1zgnSGh753STas+DgJU/zFIqtBXvVY2h4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b8DD9HDl2mOMMse4ZMwpyRbqw48fw6RCcFu2SkvPAPR0SdpIaxfqtfQolAHwLwh/8McXrSHwHQoRq74mrshp0CUtZ3ifdY0sHa0Q2THdP+jAD2w4TRbk446Dy+PCLce8KJ1OzTieZTw8nB1awm72ddSUepmxQkA/FHEcxxYgBho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=IAuJuScK; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="IAuJuScK"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3bbc649c275so1875874b6e.0
        for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 20:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1709008936; x=1709613736; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGjxrWfSkdcoBSYz9zgMBbu18xLKxQVnlKOGiNS55KQ=;
        b=IAuJuScKRVoV8hoZONdNT3XC/x+KROaNeRUvnkoQOQ5jv22Fceau7vv1S560fZbMe1
         5ZJQ2CksnITWNKrY4FCEAB7VsEOA2QVTpx9knQbfQLzi7uASsvCUFNMZx17LqDt+7BZl
         wYElR19VpJ6K9KDIcN5r/eWFZq3yT9ASO6NpMndxejW4yLxGHDXBBjTlv6Hn3dqju07U
         W+meISrLuFusZUuxojXTRnIqbgB0PAbiGHq0QizenD/kRVOGJfz3JkDiekTKHUA6xaln
         nNQu+gA17Bik57y6QxvXCriyPl9+Dfw6529HTO5IBTV+mK7f8s5RRakcHOsicv7lQW5u
         3WVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709008936; x=1709613736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nGjxrWfSkdcoBSYz9zgMBbu18xLKxQVnlKOGiNS55KQ=;
        b=iRFCa73Bzg+jt/78mlRGslDw84NJINuAW0y0QlNuUBok6bA/+yUKQfLcb1lJMTRUL9
         XPAvy+Ig6cJ4zMdU77I5Bdb2TtFFXLSFDGhdE8iYZx1MCOaCBcky21AF5wJzdLdKeM0M
         Qa+Qrmw3iI82sjOeYbFFrXDDtgLrR2xThtgKZ7UyIX7gWB3hPQFUrYoLMrYLplS0PnLb
         49vx6qWkh5cGjnJN81IY02XUur8vH7S0kh2wDQhDymDm11/XqUomnVUyRjZYaOUNVlto
         HMCDWs8cDjSHUpC0vQd4jESnXnmsHwsMBzoztw62OiIsSpO1qdi/CXOGneWKOE1UVp1d
         /cpg==
X-Gm-Message-State: AOJu0YzV4B/qMvuVVBAaemiBERW81QzDy14oYORTr4o00Zi0F2YKYZjw
	pRjC/V2IzK1LtsoG7WectlfpToARGY5OC2K2l8B1fALLmzGTzspZG4tmXC1DlWZQq9Axk9Y7EMq
	u
X-Google-Smtp-Source: AGHT+IHZaax2qw5NUDsSsoTWWNL5lFHUm0IGcmncb2DRReoxqE9EU2USBp4ULMg16kaET15VNnJ51g==
X-Received: by 2002:a05:6808:18a8:b0:3c1:b01e:4db3 with SMTP id bi40-20020a05680818a800b003c1b01e4db3mr113179oib.37.1709008936498;
        Mon, 26 Feb 2024 20:42:16 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id e30-20020aa798de000000b006e4ecc3e394sm4899782pfm.79.2024.02.26.20.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 20:42:15 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 13/20] Staging: rtl8192e: Rename variable AironetIeOui
Date: Mon, 26 Feb 2024 20:41:50 -0800
Message-Id: <20240227044157.407379-14-tdavies@darkphysics.net>
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

Rename variable AironetIeOui to aironet_ie_oui to fix checkpatch warning
Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: no changes
 drivers/staging/rtl8192e/rtllib_softmac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 880ce2bfd0eb..da8be4383d69 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -818,15 +818,15 @@ rtllib_association_req(struct rtllib_network *beacon,
 	}
 
 	if (beacon->ckip_supported) {
-		static const u8 AironetIeOui[] = {0x00, 0x01, 0x66};
+		static const u8 aironet_ie_oui[] = {0x00, 0x01, 0x66};
 		u8	CcxAironetBuf[30];
 		struct octet_string osCcxAironetIE;
 
 		memset(CcxAironetBuf, 0, 30);
 		osCcxAironetIE.octet = CcxAironetBuf;
 		osCcxAironetIE.Length = sizeof(CcxAironetBuf);
-		memcpy(osCcxAironetIE.octet, AironetIeOui,
-		       sizeof(AironetIeOui));
+		memcpy(osCcxAironetIE.octet, aironet_ie_oui,
+		       sizeof(aironet_ie_oui));
 
 		osCcxAironetIE.octet[IE_CISCO_FLAG_POSITION] |=
 					 (SUPPORT_CKIP_PK | SUPPORT_CKIP_MIC);
-- 
2.39.2

