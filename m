Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615A52F37;
	Thu,  7 Mar 2024 01:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709776577; cv=none; b=lI7vyN444n1GouZ1jHVY0pqgAVeMDB5GNy9LPKFCYtWT4/smvlY6ozLWWGZ+UCcituDErWOBHn+F35UFfEVVL8iLUIW8CH+Q5htrWvS7eXZ8tYxU9zhlppL2az82oSZieG8A/J7irpg8iFWmM9IngwMs5lWhai3YEejnX9WYbyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709776577; c=relaxed/simple;
	bh=BQMHzl3nOJb2pLPOvOL081PsPrHBEF9uKCVtTvbHZEw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jJOfmmgl4Mf70W60iBbZ3eWD6xXhLuZWRQEs6ssOvPfxDhtIxSqUT2UpgRiTfSJJgJ8/T/2Nzn15JMNrbTqOBHZjiMDfHL/q+j1JKJnkQG0gDOsq2CtBzBkALQwFL7ymIuW5ijPAC9akf0KTEQlNt4RVVrAjKiUl42tNMmWBqKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZ86uLlF; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZ86uLlF"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5649c25369aso360930a12.2;
        Wed, 06 Mar 2024 17:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709776574; x=1710381374; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HR6s3Bi5bqJu5l38YQrnW1VZ1rSnBNpwXqJfJ26pVMw=;
        b=XZ86uLlF8cnR8U4fslhmQCGHwPjyEdsClkGf+Izd1t96ut2Cy/f4P9DroXbSSlkxne
         Wstt1//oUYGVV1hWDHRte4JPSo+u0fu+OXUQxSJFQw3ODFHTwR9V1mKRnaiMdLf/+MAT
         jMqD4rGX2JQj3c0iZodjphE2095ij9Ujz+5bSOt343YyMGMJH2ST7TIFh/EnkM3IhJm1
         Xcj7rrh5mRLJ9iJVxesGK3DWLJiBDv9Iq4/9lTpC9/rgOpR9URXHWoCFbPEF4orLJpLx
         q/f/WD/eXuCbFGpJK4SGwesMXff3CLX9deq5BPmlcFuVpe9cKNs2X0H+1nj93ckGqWVf
         sa7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709776574; x=1710381374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HR6s3Bi5bqJu5l38YQrnW1VZ1rSnBNpwXqJfJ26pVMw=;
        b=NrGP7+M9FZYBPLZjjDJj8BBcmrZ6fd23CFxq0x8oXRquf2y0+gu6Cg0m3yiL6BRhV4
         EWCl2TfpOfjODKIofLP7JGxiPf9u6czvv7FEHTvAejjNSFVQywiSiSN06/8sGP6Bkuub
         b0fFns4fWmnzl/j6dFJKAhXa1TrxnUGJnPQ+rjP5F1A4p8TqMu1cJZeu0/c3yIlVi5wr
         NhQ6yoiHoVACTB5KRseIMD2xc7p0I7q3/8zvYAqBEN3hPo7eMajRiJD4LgdUhZZZkEYP
         73SjBdGNjNiN4O/1edbAX59/LjQO0BliGnpVR4jRho7oghcgYfWK8diWIp3S+SXLL2v4
         xobg==
X-Forwarded-Encrypted: i=1; AJvYcCVaMgte4N23yBKL9kuGGOPRN71FY7ITHQUJR04R300tbIG8U+Ov1ZPblscZznipNTGhumjYGICzO7HGMKvEToxXZ3LBtJ8HfZAkf50QiM5FPZrrQZkFGCEEUIxcYIoUy51owsrzUWIKpg==
X-Gm-Message-State: AOJu0YwUZDGRawJ+wsSuxgkeT1rC9BxmTU9hsEvr0F7AnVSM56a/8Xe4
	4mzJ7OeOlakS8AoyNgigKCElkOUEcxBkEXbJuk+GU/s4Q7JM8HRkfgoZx/s9CqU=
X-Google-Smtp-Source: AGHT+IFGU1ZrEpccsPfIb6UHrntJOVVxNS+j4vAuotuaNy7FYpDtgjeV0vBPkr/uK3rPFhZZu9wreA==
X-Received: by 2002:a50:cc4d:0:b0:566:418d:7ba9 with SMTP id n13-20020a50cc4d000000b00566418d7ba9mr10290757edi.1.1709776573562;
        Wed, 06 Mar 2024 17:56:13 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id n3-20020aa7db43000000b005656bbb5b3fsm7516913edt.63.2024.03.06.17.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 17:56:13 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH v7] staging: vt6655: Match open parentheses in card.c
Date: Tue,  5 Mar 2024 21:04:06 +0000
Message-Id: <20240305210406.29644-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align the function parameters to silence a checkpatch warning.

This patch aligns parameters in functions calculate_ofdmr_parameter(),
card_set_phy_parameter(), card_update_tsf() and card_get_tsf_offset(),
for better readability.

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
Changelog:
V2: Modified subjects to be unique for each patch, as requested by
<gregkh@linuxfoundation.org>
    Fixed the warnings in the patches as suggested by
<philipp.g.hortmann@gmail.com>

V3: Combined the vt6655 patches into one patch as suggested by
<dan.carpenter@linaro.org>

V4: Removed the multiple signed-off-by as suggested by
    <philipp.g.hortmann@gmail.com>
    Omitted the cover letter as the changes have been combined into one
    patch
    Reworked the patch subject to be concise

V5: Fixed the commit message to "Align
    the function parameters to silence a checkpatch warning." as
    suggested by <dan.carpenter@linaro.org>

V6: Fix trailing white spaces in the patch to silence checkpatch warning

V7: Edited the subject line to include file name as suggested by
    <philipp.g.hortmann@gmail.com>

 drivers/staging/vt6655/card.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 36183f2a64c1..3f807d898607 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -81,9 +81,9 @@ static void vt6655_mac_set_bb_type(void __iomem *iobase, u32 mask)
  * Return Value: none
  */
 static void calculate_ofdmr_parameter(unsigned char rate,
-				       u8 bb_type,
-				       unsigned char *tx_rate,
-				       unsigned char *rsv_time)
+				      u8 bb_type,
+				      unsigned char *tx_rate,
+				      unsigned char *rsv_time)
 {
 	switch (rate) {
 	case RATE_6M:
@@ -288,7 +288,7 @@ bool card_set_phy_parameter(struct vnt_private *priv, u8 bb_type)
  * Return Value: none
  */
 bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
-		    u64 bss_timestamp)
+		     u64 bss_timestamp)
 {
 	u64 local_tsf;
 	u64 tsf_offset = 0;
@@ -297,7 +297,7 @@ bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,

 	if (bss_timestamp != local_tsf) {
 		tsf_offset = card_get_tsf_offset(rx_rate, bss_timestamp,
-						local_tsf);
+						 local_tsf);
 		/* adjust TSF, HW's TSF add TSF Offset reg */
 		tsf_offset =  le64_to_cpu(tsf_offset);
 		iowrite32((u32)tsf_offset, priv->port_offset + MAC_REG_TSFOFST);
@@ -321,7 +321,7 @@ bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
  * Return Value: true if succeed; otherwise false
  */
 bool card_set_beacon_period(struct vnt_private *priv,
-			  unsigned short beacon_interval)
+			    unsigned short beacon_interval)
 {
 	u64 next_tbtt;

--
2.25.1

