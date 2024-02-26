Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18FE1D522
	for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 03:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708919802; cv=none; b=Jgvj5hh/F+8qYBOK+ii9bhIKvAadE5matc2wybTHq0rc7F+EUZFcIKe+s6I6fR+BB2r9xPZR8z1uF+c63YHblcQ8qVi1E6Z1/hrlvAntPzrdeaSs1EtvAXVYUkx2fMT1TK7/j95/3qjOqgqCLnGUQFsfvs8HNZ7YQty3V7GDX/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708919802; c=relaxed/simple;
	bh=PU+r0O6S245XpV+Rs9xKJAijgXkkWYRIGOWMDo/7qWE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J3KIEGeZnguU1PEeNTITfPQPStn4Djb4iUTZOvE51xBP2/0aoLvKDob4LfyxxNMdgt675AmNe6MtCgdmXHi/6MmwB45bHnW0hq39plaewFnknkKWzal5XD2Jh1uSfLfFlzFXysTkUv4nUM1F59uoKXEC5EqYS7aN5iWNsWMZmAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=W3rS/1B5; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="W3rS/1B5"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5d4a1e66750so1563719a12.0
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 19:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1708919800; x=1709524600; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dltjxfxWlIXrn+4WrlfjIjhm1kDm0y+Q0IFjKykPQVs=;
        b=W3rS/1B5KIuoXtqpPykuypJ6eIm77D6WPO/vwIFZgKoGx5PQikoGj+sSfMAXy2zXoX
         K2zxjazvBAmEcnr/kpGzsL5nIzIEKtPD0U7YLBPFoeu9bPH49txinCQHMCaHSs5S6Crf
         hIeTAekc1Mmm3zRkQw7VFL6BXpfitlGCSKvOSGkvewXwkmY6TtCv0pApz+O930aFNmog
         rD8sn2TQl+wt8T5HDjxsiF2YdpEOeHE2dHOymzJ3VSQqYFGIPlwDfwdxqK+FzHMikL73
         bU1nAkKxN13cmeqbvHF8Eypfe5jQttWpRCglqxvOLQ0gn6YwB1LfE55rTDXRV3JCSIDX
         XqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708919800; x=1709524600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dltjxfxWlIXrn+4WrlfjIjhm1kDm0y+Q0IFjKykPQVs=;
        b=l2d/Tohh6Xemc2IoPEDut4kpX3YAF4TQAZTG/hBd6tZy7mRnW5cvnU/5PhO10JgiJF
         DU1jq0tMonEVUd3yRmLtdXcXde2X4mun7pzhY6m24nVsplCLhlDMX9HvH+IekSw6HCdf
         QjgBbBonOwgsSX44srDo1vJbTb4lFIoX5VjlxUf9+HoT7vzaSVMMC3/ljeM62SiMA/3u
         feYSmmMSikeFuO/Dzsj4O46Emr/s58qXshl+ue8JU9MjFHWXjLRh5zFR/Jg14TEdhVFJ
         1THUzwTDQ3Qxb84ok9hZVTuff5/0KMfyEbx9DIscc8A0IFsbC29k9A6RdrHI0gH5bBPt
         btpw==
X-Gm-Message-State: AOJu0YwZCfx6Kk7dHjzxMTYj/91PqzVwutnCou0pTmsdkTLpWc0WLcLs
	QcrrFQTNpgxhtdAFNQ5BGQ0PSy8FbEbgar40ZNKvLEw1iJX21R5a6J7oAhIEFqY=
X-Google-Smtp-Source: AGHT+IGmv4Cfgz7MuTtjpdIUZmtBc5HhsU+JcufWs7k7Xr2dmGU1dvYc0V6YCla/qqgOAXUVPBbUsA==
X-Received: by 2002:a05:6a20:5a21:b0:1a0:d2ca:d3b6 with SMTP id jz33-20020a056a205a2100b001a0d2cad3b6mr3090933pzb.34.1708919800343;
        Sun, 25 Feb 2024 19:56:40 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kh5-20020a170903064500b001d8a93fa5b1sm2897615plb.131.2024.02.25.19.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 19:56:40 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 14/20] Staging: rtl8192e: Rename variable osCcxAironetIE
Date: Sun, 25 Feb 2024 19:56:18 -0800
Message-Id: <20240226035624.370443-15-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226035624.370443-1-tdavies@darkphysics.net>
References: <20240226035624.370443-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable osCcxAironetIE to os_ccx_aironet_ie to fix checkpatch warning
Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index ff912cdac9bd..68194763b20c 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -820,21 +820,21 @@ rtllib_association_req(struct rtllib_network *beacon,
 	if (beacon->ckip_supported) {
 		static const u8 aironet_ie_oui[] = {0x00, 0x01, 0x66};
 		u8	CcxAironetBuf[30];
-		struct octet_string osCcxAironetIE;
+		struct octet_string os_ccx_aironet_ie;
 
 		memset(CcxAironetBuf, 0, 30);
-		osCcxAironetIE.octet = CcxAironetBuf;
-		osCcxAironetIE.Length = sizeof(CcxAironetBuf);
-		memcpy(osCcxAironetIE.octet, aironet_ie_oui,
+		os_ccx_aironet_ie.octet = CcxAironetBuf;
+		os_ccx_aironet_ie.Length = sizeof(CcxAironetBuf);
+		memcpy(os_ccx_aironet_ie.octet, aironet_ie_oui,
 		       sizeof(aironet_ie_oui));
 
-		osCcxAironetIE.octet[IE_CISCO_FLAG_POSITION] |=
+		os_ccx_aironet_ie.octet[IE_CISCO_FLAG_POSITION] |=
 					 (SUPPORT_CKIP_PK | SUPPORT_CKIP_MIC);
 		tag = skb_put(skb, ckip_ie_len);
 		*tag++ = MFIE_TYPE_AIRONET;
-		*tag++ = osCcxAironetIE.Length;
-		memcpy(tag, osCcxAironetIE.octet, osCcxAironetIE.Length);
-		tag += osCcxAironetIE.Length;
+		*tag++ = os_ccx_aironet_ie.Length;
+		memcpy(tag, os_ccx_aironet_ie.octet, os_ccx_aironet_ie.Length);
+		tag += os_ccx_aironet_ie.Length;
 	}
 
 	if (beacon->ccx_rm_enable) {
-- 
2.39.2

