Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D145646B
	for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 04:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709008941; cv=none; b=aAex2/PyXvdvekAcypnekLJFVHS1TMMMar+X9iu2XEcmJDmgfiK3KMi1+qrSX12fcPYLA4Rp8dLasP3w6LwwycqVICFSm/kdnhW8ANDxbYosS1e10z/2o1aYbcivwVRcMbfY2Ih05cXJk1mVu+LcdSoqJ+pkbQO+HYW1dLA1c8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709008941; c=relaxed/simple;
	bh=2GdfiNtXfqkf0sPRRn4zSuegaebDi7tmfMKdY890X6o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MURE0szOVljfN8Dw7YfJDzrkQprkuZJxDI0r2J8yNBThbJ3TFin/90FClZOzaJAsm5OwO37UniWMqs2J98EGT5d3gnkA5WOYeLmtEJh0tA2ccdFs0BXEmgr2wIcXKFYIuEsabGiAmzcoc9bujESQBDrK8rUURzzcEDiZvGbJlW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=lyughem1; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="lyughem1"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3c19bc08f96so1963484b6e.2
        for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 20:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1709008939; x=1709613739; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQ70orEx9Z7FVR/JUHIaH19uQdZyExB+1mSBQCRAEpQ=;
        b=lyughem11ZUVI+9B4obTteJEN0efVViXZ4zBknHgxPr7yB1uiDYCz3YZ1U4X+YdEP+
         5RRX95ckci44DL9QlO/Qdcxi8eyvEajyQnXll37KFvTxQkBQJat69JVsMMzBposDMQQL
         4QBhi+d65H8/nankVdKPG0LbP+RsEXusoebc+i0gEDDs1qkMsdYGqKzPULU6R0sjAGUF
         e7rx6IcX40TPreMTOBOyRxapUnWLcCsCK7eSS0MT+AJa63YCE/Ij5D/bT6uqG+L3pTKP
         K7CvtNSc5qS5H5uZyE2IXJTZ8FyNHwWo40lKAL2JW+AswK7lXJCpPf2bk8AXpeN0mZjl
         MUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709008939; x=1709613739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQ70orEx9Z7FVR/JUHIaH19uQdZyExB+1mSBQCRAEpQ=;
        b=p6fIeaHwrR3hkCIIlKhNDysN1dRa7D6jaGv5NA6IkLUsSFxwXb/PVnerLpdXlgMGz5
         1GnPKKbTtus3gXdxh+yE7+wF/BG0kA3LjBG20BE+27SJkZHMv5IT+tRwy+cyutLsGqlG
         3WAqYi8WZHUinMtRuF9TPnmTL6Vlvo0dIqx/4WorB9o1InvjGfody/ZQpeff7qsGhEP/
         vmP1I38/lUYeggad6DY+r/jvmlk5g4tamXtLsZIqI65DiiAF9b5zjmWgjLRwNHzYeeVG
         VOBtxM1axtNJIQDKNOM5JHFPxkAn85bBiA91MvkraV5sdX9/vGpkLn1XnPqqT/d5qUpu
         USaw==
X-Gm-Message-State: AOJu0YzIrreBy/uNvl6a5lKYs/XjpWScgSYNwjLTmYmW8hcyXY0xYkVl
	/ghvGBsIw3T16KPHjDnHlMHBndT+oGK5qsoiEJxE7hqpcQZzO+phaJoEOuzjWx4=
X-Google-Smtp-Source: AGHT+IFiTQnqSujC0nm1N1BTmJRntQKj0QrjE/2oRoJ+l6JCNbiiWNAp3FMF1QNz4FzPJ4iLLIIH1w==
X-Received: by 2002:a05:6808:1508:b0:3c1:b099:d4d9 with SMTP id u8-20020a056808150800b003c1b099d4d9mr48040oiw.12.1709008938954;
        Mon, 26 Feb 2024 20:42:18 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id e30-20020aa798de000000b006e4ecc3e394sm4899782pfm.79.2024.02.26.20.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 20:42:18 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 15/20] Staging: rtl8192e: Rename variable CcxAironetBuf
Date: Mon, 26 Feb 2024 20:41:52 -0800
Message-Id: <20240227044157.407379-16-tdavies@darkphysics.net>
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

Rename variable CcxAironetBuf to ccx_aironet_buf to fix checkpatch warning
Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: no changes
 drivers/staging/rtl8192e/rtllib_softmac.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 0907bee45dbf..51fa9db7d73c 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -819,12 +819,12 @@ rtllib_association_req(struct rtllib_network *beacon,
 
 	if (beacon->ckip_supported) {
 		static const u8 aironet_ie_oui[] = {0x00, 0x01, 0x66};
-		u8	CcxAironetBuf[30];
+		u8	ccx_aironet_buf[30];
 		struct octet_string os_ccx_aironet_ie;
 
-		memset(CcxAironetBuf, 0, 30);
-		os_ccx_aironet_ie.octet = CcxAironetBuf;
-		os_ccx_aironet_ie.Length = sizeof(CcxAironetBuf);
+		memset(ccx_aironet_buf, 0, 30);
+		os_ccx_aironet_ie.octet = ccx_aironet_buf;
+		os_ccx_aironet_ie.Length = sizeof(ccx_aironet_buf);
 		memcpy(os_ccx_aironet_ie.octet, aironet_ie_oui,
 		       sizeof(aironet_ie_oui));
 
-- 
2.39.2

