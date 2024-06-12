Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F2A210E6
	for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 03:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718162558; cv=none; b=AKAFAtuZf74JL1pJESu2wLW8H2CZ7RcftVnY9u2L+7KUu7O/Ru/fDSBCwPmycnmbQw1ds04KAmkI+IsQxsr3TMEOP3Ao7Lpnxku/m4jV3hGVf+QbE9P6E5Ojb9pv2tmALLflGMSqXihzSnQDpfUCIjTDGu/POCQ+qZHQtiJtEFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718162558; c=relaxed/simple;
	bh=MNGZfx/m8G/rOwnxNGd4tIVSOsIacMXC8rkJWcI6FKI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tjkHLCxl0jGMxBQWNBwMHnUg6qsXdfDxUlu9CegMUMPr+iHvKrJMYi4x7EnMdSSRaonw0UcSVkCXotA4h2Q9B3a/+KLhTbhrce8+HAoxXoOgE0K09OoG+NYWV84E0pHyzaecCa8/eNDvVzv0dECZyBDpZyVQcf+bhH6DG9Be4d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=Ue6R0Dw0; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="Ue6R0Dw0"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5ba33b08550so952065eaf.2
        for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 20:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1718162556; x=1718767356; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ih+jocFy4KluPcELXVg85YttXvFxOSqGBEasMdYF/eA=;
        b=Ue6R0Dw01MG1qcPpYQ55+Cbtfpv+MuqHM3xgmyuUiDRAV8iQzyoK7MRGha7DA5Xr2f
         Sl/b9jz6euUt979cLrQVpW7/82+CmDgTZ54OjcvAWsuXq8rT5dwsF6jbvZ52f5SOIrZr
         LnoH3bbaSIvkpcmblibcp6SO5DhcTlkDz060xeU8OvR7VrtyRe9tdPPVI2FpeCXYplid
         2IamcxVDYIwV8EeZ5BCVLG6irJemZzhnO/4dOokNA9+hunGO2xPh3PcQ9g9xeSVJ4h7R
         uWUCgdVmgeulZGLENFSbdXNOTzHJ4J2VakZXcyhIWOqToGXOAwVKBonCufUOYNfStTHd
         GKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718162556; x=1718767356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ih+jocFy4KluPcELXVg85YttXvFxOSqGBEasMdYF/eA=;
        b=fzM6jmib9jBQak/N3m8eJxbrqQdu2R1PZCZWBvLnwrySq5A5syY5XLdrJ7LViWgTgi
         /ithzrRJrlFDIMylX+St4qN6MrEbBecwuP0Fgq+X9ROEWbsI5dcnWPg2BwP1ecH9Rymb
         7wOsqn+8I4QBwLfyzyKS50XmswNq4tu9Zz3zaAPw0YcsjM3wHDfvN4TLaYDAyAz9mReX
         JpIEUwB7+91bM2Ajk6j9pKyq39k/tY0yVh+8saXbMllTN4Go2F7GVgM+DhIZlGRZPBgq
         NMp2M3zzuIzRGjBicSxcsMNd4BBBUrT2uNwn4fSggC3oxbQrCyM3rUrZRJFidaG4Lnl4
         EMrA==
X-Gm-Message-State: AOJu0YzAF6CgZ2NQZzNbjZu4MA8Ghz1leFj3nVKUfmymKILFTSzY1bX+
	xSxquBVhY2yzF6WM4JPtEONuw8h5agpg9kLezLJZ/nzfyEQvL4XeTIWTDIOEkKM=
X-Google-Smtp-Source: AGHT+IHBuiTxrdPRHM4jtIqD5RsNI+BOh+MI67NlK2/uiXzoHG78x2okPV55dQLCkk6gbMYYzfFfhw==
X-Received: by 2002:a05:6358:e4a3:b0:19f:5550:84b2 with SMTP id e5c5f4694b2df-19f69d9a729mr92606055d.22.1718162556481;
        Tue, 11 Jun 2024 20:22:36 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6e8e8a84949sm5635411a12.32.2024.06.11.20.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 20:22:36 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 04/24] Staging: rtl8192e: Rename variable HTOpMode
Date: Tue, 11 Jun 2024 20:22:10 -0700
Message-Id: <20240612032230.9738-5-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240612032230.9738-1-tdavies@darkphysics.net>
References: <20240612032230.9738-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable HTOpMode to ht_op_mode
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No Change
 drivers/staging/rtl8192e/rtllib_tx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 360d1cc446d0..83082a990fbd 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -417,11 +417,11 @@ static void rtllib_query_protectionmode(struct rtllib_device *ieee,
 			break;
 		}
 		if (ht_info->current_ht_support && ht_info->enable_ht) {
-			u8 HTOpMode = ht_info->current_op_mode;
+			u8 ht_op_mode = ht_info->current_op_mode;
 
-			if ((ht_info->cur_bw_40mhz && (HTOpMode == 2 ||
-						      HTOpMode == 3)) ||
-			     (!ht_info->cur_bw_40mhz && HTOpMode == 3)) {
+			if ((ht_info->cur_bw_40mhz && (ht_op_mode == 2 ||
+						      ht_op_mode == 3)) ||
+			     (!ht_info->cur_bw_40mhz && ht_op_mode == 3)) {
 				tcb_desc->rts_rate = MGN_24M;
 				tcb_desc->bRTSEnable = true;
 				break;
-- 
2.30.2

