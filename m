Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0772B77111
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 03:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716261464; cv=none; b=TR3f/i3fwvpJPy3kn9DShscA/FoWFrkciZPuBw59Gf6xyUJkfCv+V+e49Lh1wdZIbs66RSCLPz0YkW1AGr4MisOPs0wkgFUq/tpfk1Drypb7fFWRktPStUU2z7Mx5dSxJEMQm/Ic0sDTcL5B7ajLSD9T4kl4QmRJIgXwsGZz+dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716261464; c=relaxed/simple;
	bh=sskCsC9Vm7UrLbQDRtkQoQ+iOreZFfaBms8WkVFgyLo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OG9IXmoO+hoxQ5F10wCuit/nRFrOoi2IGnFA5ZdGZn8YOnb4uohy33E4CerM/SyCQetYvrqdTKaoP/8LUuvnjOC2zrZRlvatzqIenA6Mk1BBDtPu6YWhz/Mhvec9Es3fhaAj3XCSm7cnofgyqR+1j/kV9/KzhNVKuCWms1BRMVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=TH7g98CA; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="TH7g98CA"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1ec92e355bfso107915135ad.3
        for <linux-staging@lists.linux.dev>; Mon, 20 May 2024 20:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1716261462; x=1716866262; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jEDkjeMT5xd5TiSydSW03WzTRxILrRiRjBw53kiJS/I=;
        b=TH7g98CAVNNQKIpzMFAgT5dQCvDVQkm/Kt2/KI32C1DgCVei8FKG6l1c5eHhGiWUUm
         dxmiKMCqtnOzcVofZUjXSwaObGFIbM+dOoGwGdshQA6eDAgV61/lSlpybq7FUfjPwdAg
         mXdZX/rhY1JVL92bgXMBRZcfcDs9LjCjGOGE1RBlx6y0XF+2SwrZdhSkA90qKMd0BM85
         +MZPwplyp896zdQC234jYj0tdA4J9PMes3pLdqWAWIsS3jdQqjhsb/aJ4k08LbXl5wyV
         QycAsM7vbNZbEk6IgwN3VPuWTGYcfVak0PtwgP4epD8Ku82DnW6t94ZrLz7DbL5maamw
         fC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716261462; x=1716866262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jEDkjeMT5xd5TiSydSW03WzTRxILrRiRjBw53kiJS/I=;
        b=kqooRfXh5OQ+VIguiJWiGYL7TOgjqF9Lg8lsWE0iZXqIhXSYgebQWJE2R+cwNinTB/
         Hlmu95POcZFC+fPPGGrXlh2BhYC03BatGck2YvMD4BD+VYZxg045qxpvnhmsl3i6Nqem
         +/VUsl0DsFeI/WGXM/HR6yR1t6eDaFQoMP4VpSHIkHRo1T218d1afgmFKHyt23Ym5QRl
         l4A+9TT2fa2c0bqFDbc1G1W3lvz0Sy/lF2RuIAjrm1LkVVbOU0rBzrsHx5xXHVDJf3U7
         EJRyB8p737PKgGqbWVGco8S941nJpsFidlG1n0Fv/5YFWl9Tt1i28Ir0tb1ybfBVV3kT
         GVqA==
X-Forwarded-Encrypted: i=1; AJvYcCWTRB2VLwLbCRN/KPCALhFVDsUW/Ahp+n+lGMLVSrC9p/HixxKHF5xyiDBr8yd4D44SawVkvuDCY+92CndJRpsQ95FsKwwW1egksrsTnw==
X-Gm-Message-State: AOJu0Yz+0GN6BiUpfztP+sVT6yaFnif6J/DLqZdPwsTBMEQCxv60gZtQ
	TZICuEWcl2TBHm5iT2YKKASOVzWug6uNsY+nZtAfhNrLgIWkYSNANLfdm7+nqlI=
X-Google-Smtp-Source: AGHT+IG79QyCRtGTpo6DaeE6OC79fud+iH4BsmkxBCnehK+xNrUjxZW1M3SLBKnYMz10OsNWBQUJ+w==
X-Received: by 2002:a17:902:6ac5:b0:1e8:2c8d:b749 with SMTP id d9443c01a7336-1ef43e25e67mr297822655ad.30.1716261462384;
        Mon, 20 May 2024 20:17:42 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31a93sm214885415ad.134.2024.05.20.20.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 20:17:41 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 27/31] Staging: rtl8192e: Rename variable CcxRmState
Date: Mon, 20 May 2024 20:17:14 -0700
Message-Id: <20240521031718.17852-28-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240521031718.17852-1-tdavies@darkphysics.net>
References: <20240521031718.17852-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable CcxRmState to ccx_rm_state
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No change.
 drivers/staging/rtl8192e/rtllib.h    | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index b88c7cd399fb..ca69bb0965ba 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -913,7 +913,7 @@ struct rtllib_network {
 	bool	with_aironet_ie;
 	bool	ckip_supported;
 	bool	ccx_rm_enable;
-	u8	CcxRmState[2];
+	u8	ccx_rm_state[2];
 	bool	mb_ssid_valid;
 	u8	mb_ssid_mask;
 	u8	mb_ssid[ETH_ALEN];
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 22c04f37bb40..3e8ee1335c24 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1810,12 +1810,12 @@ static void rtllib_parse_mife_generic(struct rtllib_device *ieee,
 	    info_element->data[2] == 0x96 &&
 	    info_element->data[3] == 0x01) {
 		if (info_element->len == 6) {
-			memcpy(network->CcxRmState, &info_element->data[4], 2);
-			if (network->CcxRmState[0] != 0)
+			memcpy(network->ccx_rm_state, &info_element->data[4], 2);
+			if (network->ccx_rm_state[0] != 0)
 				network->ccx_rm_enable = true;
 			else
 				network->ccx_rm_enable = false;
-			network->mb_ssid_mask = network->CcxRmState[1] & 0x07;
+			network->mb_ssid_mask = network->ccx_rm_state[1] & 0x07;
 			if (network->mb_ssid_mask != 0) {
 				network->mb_ssid_valid = true;
 				network->mb_ssid_mask = 0xff <<
@@ -2344,7 +2344,7 @@ static inline void update_network(struct rtllib_device *ieee,
 
 	dst->with_aironet_ie = src->with_aironet_ie;
 	dst->ckip_supported = src->ckip_supported;
-	memcpy(dst->CcxRmState, src->CcxRmState, 2);
+	memcpy(dst->ccx_rm_state, src->ccx_rm_state, 2);
 	dst->ccx_rm_enable = src->ccx_rm_enable;
 	dst->mb_ssid_mask = src->mb_ssid_mask;
 	dst->mb_ssid_valid = src->mb_ssid_valid;
-- 
2.30.2

