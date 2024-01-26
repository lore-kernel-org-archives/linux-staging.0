Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996925BACC
	for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 22:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706308314; cv=none; b=BZohozy7dU+6AY7kCbU9pfOPkQcgzO8MBdB11kRyat1G9Eajs6e5yl+fMzQD66C/E42bMW27tM39wZzJOMSinC2fCCdVi+rqdwAneu0ZxaF/g4jQQRdbKWThRyywdUyNbK4X/cuf6SHjZI6Fwfmi+ylEXXEC0zDBJ3Xfbctl7oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706308314; c=relaxed/simple;
	bh=oDyTQMAlYFK13GRbBx5p2vaeE+EpzyLeiAyEXuNjTCw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DGcVpW9UzOlxs01ZHCx3H4xdvxjYoXhHGHlQzNQlOPtcH4WuPvCpmpN7BpihAOGGel6kmxRndMzLWVVAQq61uSp07MIoohUxG9V9j5gnGSCXogJh5liVzuxZafD85+e98y0Ok0ew9eRq9BMS3xOv9kBawMuCil1Yt7l4vnDDjiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=U02ZGaHA; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="U02ZGaHA"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2906b859560so589805a91.1
        for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 14:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706308312; x=1706913112; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IdyNE96vOnHl+1TTP1qK9C3aETsrFzB3trLDWoyyaoE=;
        b=U02ZGaHA8Z8axwqsbQ5fUAC11ARV22Gw9yn4u8uMWhOXLp6BNaZlOwL1Tb94JSIg/G
         JACltnRXz1HSn7JPCLG/mlf/bfPyIFFDKFdIGLJF2RyWFQp7DV0hxe6tCo7HPei7DiKt
         zb3hTYpw+Qp/zNEsHJMPxSYm35uWUX3U80HiONAZV7N/DYPPSFX61XNQY9kun0dnf2Wj
         r+ppTSaDcQ+W2qfk29o9qJP6fAPhd1CoGMiibd9rs0ciXDUb/po89iEl0jtBH7HjIARs
         eizwaBPqDt6gzsifzMBHNldayhN4B4HmpDhj308QHO8NWEOIl61U9O5PJEbQavRO1btZ
         84EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706308312; x=1706913112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IdyNE96vOnHl+1TTP1qK9C3aETsrFzB3trLDWoyyaoE=;
        b=uSRgGjZh3JqmIclYHdaWh3JsAhHp9zUVo3F4QQVlODGIZp/1OxsgpFGaprozy+OUAX
         9kxYs3iEak5NAqex51407TamzAB5fWwfGITll8vEoxsZnk0uduoxtuxtnekcpeyzgCxk
         qQuG2w0Vf8h790FP4wYm41n56jaWW8RwONFUWPYgsJHa4AVBsfxSZh8Qdx1IXKTfd3Q7
         +71jahu7mrJGT1QdCTBY8eqgN2fwODE712RYKVBfx2Qbzshy7H0o6Tq5QV0sDYkqfu2+
         58oJyR9Y9m16a7wnCZCs69a+pEsWNOcib/iJsa19BC95gytdi1Rtd+u06ulqJWw+DIPI
         v6+g==
X-Gm-Message-State: AOJu0YzyvCGefFOrscdjl7wzWYZorb8m1PA4QB11JBnNgjXMEfqqfNJj
	0k/H8MYx8jO/UuiMkcTH4MnqEyVkNb5Z+SG6c3LWmD1IHEhMb/7GSgxAzRanVTquj3YzDig7v0S
	u
X-Google-Smtp-Source: AGHT+IH7tiCtgM3uxXYawFfDam1iA74z+Gol1a2InNE+j2+UrICJG1LaEiHkr4c5RtzkSqNZ3s10NQ==
X-Received: by 2002:a17:90b:180c:b0:290:393f:c8f1 with SMTP id lw12-20020a17090b180c00b00290393fc8f1mr539203pjb.66.1706308312089;
        Fri, 26 Jan 2024 14:31:52 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902d0c100b001d8a8f431b7sm737909pln.300.2024.01.26.14.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 14:31:51 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 18/18] Staging: rtl8192e: Rename variable bForcedBgMode
Date: Fri, 26 Jan 2024 14:31:06 -0800
Message-Id: <20240126223106.986093-19-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240126223106.986093-1-tdavies@darkphysics.net>
References: <20240126223106.986093-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bForcedBgMode to forced_bg_mode to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No changes.
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 07a89d1af86d..348644998744 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1193,7 +1193,7 @@ struct rtllib_device {
 	u8 *assocreq_ies, *assocresp_ies;
 	size_t assocreq_ies_len, assocresp_ies_len;
 
-	bool	bForcedBgMode;
+	bool	forced_bg_mode;
 
 	u8 hwsec_active;
 	bool is_roaming;
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index ba35714f83af..2545ac8963c4 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -721,7 +721,7 @@ rtllib_association_req(struct rtllib_network *beacon,
 
 	if ((ieee->rtllib_ap_sec_type &&
 	    (ieee->rtllib_ap_sec_type(ieee) & SEC_ALG_TKIP)) ||
-	    ieee->bForcedBgMode) {
+	    ieee->forced_bg_mode) {
 		ieee->ht_info->enable_ht = 0;
 		ieee->mode = WIRELESS_MODE_G;
 	}
-- 
2.39.2

