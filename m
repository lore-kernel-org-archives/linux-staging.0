Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D153BDF59
	for <linux-staging@lists.linux.dev>; Sat,  5 Apr 2025 09:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743845891; cv=none; b=NMigoc3Rupg1dtHjh2PX79U/0QwQhHKeP/D/fmYgZm/g8LZPIZcbD9rxn5fgxcnEgxpx5QfiLbA14ykW3/yV++uCP+qlYKBMDpNCIsWggHSwFzqm36drArLKztkW1w6I3ns9pP9pCMHkHWRub4NRZRXkXKCp7fSuEulCBvueUu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743845891; c=relaxed/simple;
	bh=nhp0kQBdBvzm61TCBnE5PQzUBlWBFK07rS78WI6dAtY=;
	h=Message-ID:Date:From:To:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=B17x9fRyt3sgEHJS+Fz7DOa51DfXrstJgMCqVHws8KQbHrVbg4g7z36sS71bbDQ3Iy57BPPBENkp7j9U1Ht8VyJEsVpAi1jj/pe4dNBh9F08npdruK1VnrqN3wz4ALEBjiuT7c8AH9q4eUxjsN63PqzAEFdhc5tbptdHFXGzZqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtqnFvx6; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtqnFvx6"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39129fc51f8so2239430f8f.0
        for <linux-staging@lists.linux.dev>; Sat, 05 Apr 2025 02:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743845888; x=1744450688; darn=lists.linux.dev;
        h=content-disposition:mime-version:subject:to:from:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Z+grPb8I7BvHVVGAjeZ+6sPEqrTjykvJDq5w4Vs7D0=;
        b=mtqnFvx6P61VJ4FPVdcFIfMKDa3IRnracO82W9gXuL8lZgCGzCAy/RzrsQZie91rPv
         Mt4N44+ZdHPomBP3WoV8rv5ai/3lpa4Ec8NwZ4q03vjJpJg+trWyWAkxXwWS+Y2eKGtP
         Pkh5WYTUrKhhGsozCKD4mjS8qnDn4wvlqSl6Sl096oWQlDVFhPDgz/58Dy8/7g6zgDt0
         0k65ixvAGIiDr/Oav+Rt3DZ1F5pxwR8MHEiIR8OFfaZvC6c4d5HhMRQZ0lmltCoazchA
         hPBVrR5ez3hi8P7wxY21NZrW/fCKnt1vhKCVOD8BOUzwfjsRnsA3cIL7L52CwwoFxNHG
         ovCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743845888; x=1744450688;
        h=content-disposition:mime-version:subject:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Z+grPb8I7BvHVVGAjeZ+6sPEqrTjykvJDq5w4Vs7D0=;
        b=aiJ2HkgbAkpDXU91WmDSFJPoy6yejepMJ5dYFScj/o/o5X8rFqexr1qVl6I3+oECCN
         WdpjamwTzhYRyU7u7LYzHoTucGkY7vKqli5BA7TqKUyqpI+im42WsMbauIbfse54HGdn
         2udRFx7laortp+a+CVrS19m4mmdM7LnsPz0x7FPAbBT8D01qNIwJrtfFyVInF6J3V84s
         iCGvgLqDnJfmRX6QKJPx0/h4kRBjlkG3xA/tqJMxL7UTg/RPR21MQtMpMf0cqcf9n+Zm
         2LD36X0QMd/n2bByRW84mwGmE+NNsXU9iJM4V9FLlo4SmQrjJpuVWCUh0dyGZFfYaMTO
         O11Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxq3HJ6sSp+6Jsb36bS5/FIO/WFucZlWZEETHPMRuXfaHM83sVWY8R1gsuKDO+v3/M5IfyIOh7uwKeF79h@lists.linux.dev
X-Gm-Message-State: AOJu0YzlpEf+6gDhO410YFeQ1WgolAPLLfLm+tESEXMJJ4h8ZXqkb6bJ
	Ha501IK8t2FNvR4hq35cyTWgruBuz6Dk0PHm99XzkBQLORGqnQeU
X-Gm-Gg: ASbGncvU0A2FvjRNGbJ1i2bMbBqx03C6SX8a4mp2dhTU0luld4IAS+rwwscZN9eEfF+
	5ADflGAiX167BE4+2CyoI8S+TM+TIkBQoII+scq0QEVY/ZmEraOTV8xq9qX20EpDLDfi/+xpZCL
	OqWTAofd80aFBLpHwjtMIzKaGgso2a08grNViFqf8wFvc527uBGDTEDsVJz8Vj/aJj6pDQAEoXD
	TBpTgwkhfuYSnHkXOpKRWuyHwnunA22Oum4msbn0IEPL9W+KMG24l5tETShoYI1PCm90JEXpbB3
	oHmoHImtYp1pGv9vvwFLtnRhKg==
X-Google-Smtp-Source: AGHT+IGIFJ/B9HcTfFsyw3jLL0mVGCHmD/FUbG6bazt95trNFXWXG4lipr0vJbpr563Oru3iHKbbHA==
X-Received: by 2002:a5d:5986:0:b0:391:466f:314e with SMTP id ffacd0b85a97d-39d0de17029mr4637918f8f.16.1743845887913;
        Sat, 05 Apr 2025 02:38:07 -0700 (PDT)
Received: from parrot ([105.112.71.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226959sm6263884f8f.82.2025.04.05.02.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 02:38:07 -0700 (PDT)
Message-ID: <67f0f9ff.df0a0220.33076c.f0e5@mx.google.com>
X-Google-Original-Message-ID: <Z_D5_KrpCr_K84vh@princerichard17a@gmail.com>
Date: Sat, 5 Apr 2025 10:38:04 +0100
From: Richard Akintola <princerichard17a@gmail.com>
To: sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] staging: sm750fb: change sii164GetDeviceID to snake_case
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Change camelCase function name sii164GetDeviceID to sii164_reset_chip
to conform to kernel code styles as reported by checkpatch.pl

CHECK: Avoid camelCase: <sii164GetDeviceID>

Signed-off-by: Richard Akintola <princerichard17a@gmail.com>
---
 drivers/staging/sm750fb/ddk750_dvi.c    | 2 +-
 drivers/staging/sm750fb/ddk750_sii164.c | 6 +++---
 drivers/staging/sm750fb/ddk750_sii164.h | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index 8b81e8642f9e..3fb14eff2de1 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -16,7 +16,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 	{
 		.init = sii164_init_chip,
 		.get_vendor_id = sii164_get_vendor_id,
-		.get_device_id = sii164GetDeviceID,
+		.get_device_id = sii164_get_device_id,
 #ifdef SII164_FULL_FUNCTIONS
 		.reset_chip = sii164ResetChip,
 		.get_chip_string = sii164GetChipString,
diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
index 2532b60245ac..223c181dc649 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.c
+++ b/drivers/staging/sm750fb/ddk750_sii164.c
@@ -48,13 +48,13 @@ unsigned short sii164_get_vendor_id(void)
 }
 
 /*
- *  sii164GetDeviceID
+ *  sii164_get_device_id
  *      This function gets the device ID of the DVI controller chip.
  *
  *  Output:
  *      Device ID
  */
-unsigned short sii164GetDeviceID(void)
+unsigned short sii164_get_device_id(void)
 {
 	unsigned short deviceID;
 
@@ -141,7 +141,7 @@ long sii164_init_chip(unsigned char edge_select,
 
 	/* Check if SII164 Chip exists */
 	if ((sii164_get_vendor_id() == SII164_VENDOR_ID) &&
-	    (sii164GetDeviceID() == SII164_DEVICE_ID)) {
+	    (sii164_get_device_id() == SII164_DEVICE_ID)) {
 		/*
 		 *  Initialize SII164 controller chip.
 		 */
diff --git a/drivers/staging/sm750fb/ddk750_sii164.h b/drivers/staging/sm750fb/ddk750_sii164.h
index 71a7c1cb42c4..a76091f6622b 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.h
+++ b/drivers/staging/sm750fb/ddk750_sii164.h
@@ -28,7 +28,7 @@ long sii164_init_chip(unsigned char edgeSelect,
 		      unsigned char pllFilterValue);
 
 unsigned short sii164_get_vendor_id(void);
-unsigned short sii164GetDeviceID(void);
+unsigned short sii164_get_device_id(void);
 
 #ifdef SII164_FULL_FUNCTIONS
 void sii164ResetChip(void);
-- 
2.39.5

