Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6461E3B28F
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 04:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748761; cv=none; b=hZLeipZ32UfHYAYSoJ1RFkPEYZwfIJxdqxGHpUNLBl9tHEF9q3rFfSs0PRinirKs41234dBKLqLdqh0GlOt/jcDG12p8sYiPf5zndcxq4WE2w9M9w3WEGKK8z91BVocbuA0/OUiVM2gaoQqhe3hfNEJiDmcWTUc2k9w4kf678Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748761; c=relaxed/simple;
	bh=p5QrjqSMLh3C8Hnh5NSEldYXViZN0be6lfcWjlh+Ng8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K7XGmUb+EX9EKiLJreRST+s6aPE3L9sL9+1TknlMK+81wST+o/J2KXHjEBNMQ2krZkWW7rAVTJN1WUx/1GLJki9IImUHw9I8UEIHs4vK30s4dk/09v8BkDQq6dG48d6iy1NYkf8f7yh3bnjLBEIFwAypizpKW4cY3AeHjJ5Yt2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=WqBASuTr; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="WqBASuTr"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3c97066a668so2129070b6e.0
        for <linux-staging@lists.linux.dev>; Tue, 14 May 2024 21:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1715748758; x=1716353558; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BkWCUuQ58U/Du5A5sN3Nb9vbIZaHHcSncvI1Bx9M1F4=;
        b=WqBASuTrvpNIOaVT8qQIawu9R5AWICvSWxDGlQK5oWBa6oDaFLuMdQUS8j5yLUF6oR
         5EEwmy0/o7Q+by5m0X4m8Tbr9KWcFBY5NSde4p/M5Y4YqChHTPiQDYAtfL3NcpxErWCL
         UkYgyPGomsjpDyW91N/uwTT/Pa3lLUpUHxmiFUPT9zTv/p2gKsCG9PCZOLa4CTGlIvmh
         2n4Mjo2JHkjkYp+j6cD7ZlBaKQCNXkAe0nKuiOXpVPRa46dulkiozAEV7Uz/NQ/d6ufY
         yHHRBxF+PFMma3oa34iXE/pBHJT/AzyCe3R4LUajJ2sokaFM/o4uSZePqH3KJTs/Ks3K
         EuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715748758; x=1716353558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BkWCUuQ58U/Du5A5sN3Nb9vbIZaHHcSncvI1Bx9M1F4=;
        b=AkyQn8WOMGYbu4dsiea8fp/dvmqoUsYrANu0QDJFK2lLW/htnHI/Lzigfv66e6lUs5
         AQ1BUcDSOc9RCnkwqigHsw6NRUohgBWvcU1RIIWuEoKGIFJ23Kk9KOZyQY7OWCI7MM4v
         ++WjqwqqqubfSVkEjGeVvJOS+4pyRmGVso7csk94rJ1L2x/ZwMFExphjYanRykmhn/MH
         p38xt5AzzEcmxZN6iaKYz4bls17I8+0S6NmC4UEsz9/rGcLnfJGBpkZzf0xCZfS25qHW
         9SZQL+ruMnwX2KnJSYh0+bFjxJD/cVVB1rufob5SI5o/oEikZ7K+uNpJdgF/CEXNjdA7
         9nXQ==
X-Gm-Message-State: AOJu0YzUFDNUFWEsvN2LhzK/ab4zg+1YKwrpeOoE4G0wu2i3CxPWxFAK
	n60O2XtA/zlUEv3UZMHDJWD75tlwdmXHk/McVT1X2PvcORZgdtHwnevGE90JABw=
X-Google-Smtp-Source: AGHT+IGxDb10Z+0G2o/84Zt6O13liaWmSFNlegXU40W0XbhGUcKWfwRdmmavROorwt3kjUksvZ0Zlw==
X-Received: by 2002:aca:1311:0:b0:3c9:70eb:151b with SMTP id 5614622812f47-3c9971e10a7mr13733680b6e.59.1715748758588;
        Tue, 14 May 2024 21:52:38 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a827fdsm10135035b3a.60.2024.05.14.21.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 21:52:38 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 06/31] Staging: rtl8192e: Rename variable MBssid
Date: Tue, 14 May 2024 21:52:03 -0700
Message-Id: <20240515045228.35928-7-tdavies@darkphysics.net>
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

Rename variable MBssid to mb_ssid
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h    | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index ce0cd1f557c3..7f1c2f49227e 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -916,7 +916,7 @@ struct rtllib_network {
 	u8	CcxRmState[2];
 	bool	bMBssidValid;
 	u8	MBssidMask;
-	u8	MBssid[ETH_ALEN];
+	u8	mb_ssid[ETH_ALEN];
 	bool	bWithCcxVerNum;
 	u8	bss_ccx_ver_number;
 	/* These are network statistics */
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 4e7c491c0aaf..c29efa3eef6f 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1823,9 +1823,9 @@ static void rtllib_parse_mife_generic(struct rtllib_device *ieee,
 				network->bMBssidValid = true;
 				network->MBssidMask = 0xff <<
 						      (network->MBssidMask);
-				ether_addr_copy(network->MBssid,
+				ether_addr_copy(network->mb_ssid,
 						network->bssid);
-				network->MBssid[5] &= network->MBssidMask;
+				network->mb_ssid[5] &= network->MBssidMask;
 			} else {
 				network->bMBssidValid = false;
 			}
@@ -2351,7 +2351,7 @@ static inline void update_network(struct rtllib_device *ieee,
 	dst->ccx_rm_enable = src->ccx_rm_enable;
 	dst->MBssidMask = src->MBssidMask;
 	dst->bMBssidValid = src->bMBssidValid;
-	memcpy(dst->MBssid, src->MBssid, 6);
+	memcpy(dst->mb_ssid, src->mb_ssid, 6);
 	dst->bWithCcxVerNum = src->bWithCcxVerNum;
 	dst->bss_ccx_ver_number = src->bss_ccx_ver_number;
 }
-- 
2.30.2

