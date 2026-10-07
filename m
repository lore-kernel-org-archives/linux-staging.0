Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3CC486E5A
	for <linux-staging@lists.linux.dev>; Wed,  7 Oct 2026 10:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369195; cv=none; b=IQJ43sJ+I1DJgRiJKYwcBeGMELRalWelBWvfbSKgbiA5acbO4eOYbXGByBO8/RMnC0DvgbDCnT+6M/IBGvcHUVMkYSEuFq6cgjQDLB7wgU7IJ70Qv6VbpJIiXP9d1QoOVI55E4bwg/TExs3YYKkal3kdYmIpKkTXtqwnGUfFAsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369195; c=relaxed/simple;
	bh=EI0yaxaUN8OKEbiy7o89NqeQY43DO8r+Zr8ya6jFJTs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bJpB80qLC0gKohlgWPT5ODKnLBTFgHUb+lScDI5ArI5sPWGN8WwvoypF5QHssQpP8fFbWO0nnej0TEScQ25Fgv2K2cy9r0hpqwKuRNNIK7XqFaouaLY22KRptNFqxqqSN75Qlw21i2IdL1CojCZe9AgDqFiITRjo2zFVC3Gk/mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=srrJ1/KE; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="srrJ1/KE"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49ff680331aso40462905e9.3
        for <linux-staging@lists.linux.dev>; Wed, 07 Oct 2026 03:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791369163; x=1791973963; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2ZH3e8JlOg2YzEIhOq4sZb5mwpidxRCG0IJ4sQhxF3Y=;
        b=srrJ1/KEkEriu+544kFSMQZ1RIxgQ+ErGCzs2ReDzPMfEI0lmXIn703YWfH3QXbOLU
         boBX+mpM137b/ns6oMUcTJrBh9Wg+fOjqBqIupFAzPND/BuKtoDp5TJ725tW9lLy88fy
         RpEfzl2/GPfRmW7vXSLXHUnejOvx36uWZR6r+DjYIW7ALeK4b9SlnGrAtv4Cmt3pYmEP
         jyJ8zrMC3CotpzSWa3THXJN6ywobsXFdKGd3Gta1EWICSvTPVg0pDt9EdUJ6+G2mKbBU
         vxs2Brpn7Qg1jO9AFkKEApm2MGun1WqmFtvHvJqGqt9pToDiR3rcILoCaUImkgng0otP
         x1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791369163; x=1791973963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ZH3e8JlOg2YzEIhOq4sZb5mwpidxRCG0IJ4sQhxF3Y=;
        b=mmwBUadLzuIPi3uAU5Al8t12Xw10S9iI4T0hAqb0eM4/WW3+ks/0mLhtts3FrraS7b
         GLXOpavmWHHYzRGKM9NXkyP5y4fZVyccwyUUT/6Tf2N4c5O3AEZ/QYCv+x6sHZFl8mrp
         ABuh0XtAinF66WOePB44sajXRK/eyLVXSUT1rQEOSPZLmqH3P5ySP1VTUwSOEfKNvJNq
         xf7M7x/BVepYnamBFV85Wqyp8/kLnsC5+0+rTPWvc/YVB0PnYqC9fK5GeMAFjUT0ENBJ
         z5gra3eZDbfnOG0M4u7L25uCUiYYeDAkP/Y6Qv/NSIe8NvQm0A5EqkfEETcR8j66wi0P
         JqVw==
X-Gm-Message-State: AFuF++ngifRucnkCLe75NXeI6enr0N5h9ysMFpmH/z8Z3NAqaIk8kShF
	g/jxxnoeTosNU9O2HCuqsc7C+R9fHPbO3GpD50GEZMWvmplA6P2OEpd0
X-Gm-Gg: AYBFou3sRNVr4SKzcQrMdUBn/hBp1eRQntxk6CQ/Orwq5pu0jNMDzS7G5s5IYbleYSc
	V3PQjaaTgy6Pv5gw0Pp6/arHmiWdxryUkI/kG46aDZhCLN3CpYSnftX6FTCUz25R6ru4mSZLsAp
	/RJdsUk5mQ6aXcnil2jIELGRBNgjMbygV9ZVCxFJmhJwE8I7FXfwrRVKqC1DwEheub0FqN6TR9e
	tzHED6g9iY/d1Z1hBt57ilpo4ksdVPmZqVOE10j6IV7ihhEQU2HniED/HXDiJAlu0jtcJMKT91c
	i3lTXysMZlNCWEiiFhEBSTGiN+VNsvLpWmB/FPg71QxPWF//BK3NHXmfcIf2eOplI7DRwkWHLch
	AeI68QNlymSmiAqXWWv3gB3CdW6w//vRMYIHMOIWShfvklbtWySFp8Icg1JIRDO7uYf/x+U32em
	q80noyPvF4eguDrsUfIObdZEP6dtAGANfDKca4ilUx5Ut47Cd+n5AcsppfR3WzgLrHie98R1Oui
	RCtkMS8
X-Received: by 2002:a05:600c:c0cc:b0:4a1:6517:ccf1 with SMTP id 5b1f17b1804b1-4a1815a24a9mr15342205e9.9.1791369162669;
        Wed, 07 Oct 2026 03:32:42 -0700 (PDT)
Received: from fedora.domain.name ([217.218.152.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm234277655e9.11.2026.10.07.03.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 03:32:42 -0700 (PDT)
From: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: use u8 instead of unsigned char in NDIS typedefs
Date: Wed,  7 Oct 2026 14:02:36 +0330
Message-ID: <20261007103236.37607-1-ampr.mhd@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the plain C type 'unsigned char' with the kernel's fixed-width
type 'u8' in the NDIS_802_11_RATES and NDIS_802_11_RATES_EX typedefs.

The kernel coding style prefers fixed-width types over plain C types.
This addresses one of the outstanding TODO items in the rtl8723bs
driver: "convert any remaining unusual variable types".

No functional change.

Signed-off-by: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
---
 drivers/staging/rtl8723bs/include/wlan_bssdef.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
index f4c1456f1..df541e956 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -15,8 +15,8 @@
 #define NDIS_802_11_LENGTH_RATES        8
 #define NDIS_802_11_LENGTH_RATES_EX     16
 
-typedef unsigned char   NDIS_802_11_RATES[NDIS_802_11_LENGTH_RATES];        /*  Set of 8 data rates */
-typedef unsigned char   NDIS_802_11_RATES_EX[NDIS_802_11_LENGTH_RATES_EX];  /*  Set of 16 data rates */
+typedef u8 NDIS_802_11_RATES[NDIS_802_11_LENGTH_RATES];        /*  Set of 8 data rates */
+typedef u8 NDIS_802_11_RATES_EX[NDIS_802_11_LENGTH_RATES_EX];  /*  Set of 16 data rates */
 
 struct ndis_802_11_ssid {
 	u32 ssid_length;
-- 
2.55.0

