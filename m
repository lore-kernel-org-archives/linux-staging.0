Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293273D97A
	for <linux-staging@lists.linux.dev>; Sun, 10 Mar 2024 23:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710114963; cv=none; b=eb6FBlHC4vJT9Y7l2dy5MIc9BqBX7vU3IoMGp1vD3ev3C14cvOQI6LqaUsi6P7zw9kcCX0Q3CLYyYztMNQFVBpqO70aMn1mnN1TWc5HqRy5RuayAeOmWX45bllU1umHp8TeiQhgV1hizt49CSBfWbH4ArhZHPuwmrU2kedmZCOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710114963; c=relaxed/simple;
	bh=HADUIoGNxxZzzQVbd0yS7ovHI657F4f4qpl2PdUmfl4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qTqMG49depQXV5vz9sqULn7Q1KTDtAlT6TP9dIi+xI5RmBUMQKMK2ezIkfCiIyqA3NPaYNQQmpfSg1+jcuDJ8r5TU88Zms2Dwqg1ETsa8eU1TFmtFaPL5P7dvx2ndT3iQjc/msVRZxQHO+Aa9q+5jIS72VJqMHtiLUwZzRhHpX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=OsvtbK31; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="OsvtbK31"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5c229dabbb6so2814050a12.0
        for <linux-staging@lists.linux.dev>; Sun, 10 Mar 2024 16:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1710114961; x=1710719761; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ek+tNEVfANxjTbowDv0K1U1oO/hLiu0/vhpb377ZsU=;
        b=OsvtbK3156kWdZFqf+/9jQx5puw4eOSHCjFpJSWKKlmVSSZ8YD1rbs4sNvtv5XSKfl
         YUC4Mn3MeTMAs6KT5qpm1lgba2GCGIIaGn0t+qMsybc149ZZvx4T7JB6rznY3UqZlaIz
         o2Eov4MFC4WXcesIf/9yOHaI062YoNWEw5ChTsMvNRYgf2LacZyuj3x+xQGYqqPLWpiZ
         14u/kS8XxO+GXUvfLTMCEigTdfx0uVKYegMJrxOH70jZPaoLTqNC0DTArFWeJ3M0aRYy
         +KdKC+iYrpVtdXQaYns164Gzw1DLgSKQxseCwl24rV7zIZ8xzPy78FeqX5X+n0ViLVS/
         cX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710114961; x=1710719761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ek+tNEVfANxjTbowDv0K1U1oO/hLiu0/vhpb377ZsU=;
        b=RJcq+k0o/D/Y0hEPQXU63KJl15uZikmqrsvz30Xpa7OrL0zutKTO4a/yy+2ylAtooW
         EWQjrnoMid2ZHWUqVCJJpAMyI0PHSEvblwC1r1tQg+iJLopVObBdbAKCBjehdKCfz5Rq
         mEei+PiEgEF5t47/YxzWxuLekinB+Lir2NkLbVr0eOeQ9O96ADaL0Kl8buf6uSwP0flq
         1rcz+2iaiogN3LEGIxbddUXPjaQDWvtyOLGmzOsIReqFKRa/Vt2/Fnn4bgpeWj+/8kwU
         Rm/K0mdVf7ZbsoftoONwZb5z+jr42IVpJZHFI8+Dh9fpF+wqlOmC0tQmZj9i+MaS5OCK
         /i9A==
X-Gm-Message-State: AOJu0Yzz+z4E2R2f8aZOk66EkwYGD1EndJzL/TvNHaDNdG/1b8/ohqwn
	yVNOy3co+/pc1VEmV3wQOeqdQs1s1WoIqZ85AqIrPlsv2QES0wybyCJFgdh5kDY=
X-Google-Smtp-Source: AGHT+IG7CX8dL1RSwnt03aj3Eop80TAIeNKxlDtk7/JKFUXyCnlK82z7gXgIDqAY8BQmAbDiyH4v0g==
X-Received: by 2002:a05:6a21:1f24:b0:1a1:67fb:924b with SMTP id ry36-20020a056a211f2400b001a167fb924bmr2233425pzb.28.1710114961466;
        Sun, 10 Mar 2024 16:56:01 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id o7-20020a17090ac08700b0029bb29ef41bsm2903439pjs.50.2024.03.10.16.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 16:56:01 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 07/11] Staging: rtl8192e: Rename variable bRTSUseShortPreamble
Date: Sun, 10 Mar 2024 16:55:48 -0700
Message-Id: <20240310235552.4217-8-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240310235552.4217-1-tdavies@darkphysics.net>
References: <20240310235552.4217-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bRTSUseShortPreamble to rts_use_short_preamble
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index dcb78cd2e840..41373c013299 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -900,7 +900,7 @@ void  rtl92e_fill_tx_desc(struct net_device *dev, struct tx_desc *pdesc,
 	pTxFwInfo->RtsBandwidth = 0;
 	pTxFwInfo->RtsSubcarrier = cb_desc->RTSSC;
 	pTxFwInfo->RtsShort = (pTxFwInfo->RtsHT == 0) ?
-			  (cb_desc->bRTSUseShortPreamble ? 1 : 0) :
+			  (cb_desc->rts_use_short_preamble ? 1 : 0) :
 			  (cb_desc->bRTSUseShortGI ? 1 : 0);
 	if (priv->current_chnl_bw == HT_CHANNEL_WIDTH_20_40) {
 		if (cb_desc->bPacketBW) {
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 525242b0313f..cf75d1225501 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -121,7 +121,7 @@ struct cb_desc {
 
 	u8 bRTSBW:1;
 	u8 bPacketBW:1;
-	u8 bRTSUseShortPreamble:1;
+	u8 rts_use_short_preamble:1;
 	u8 bRTSUseShortGI:1;
 	u8 multicast:1;
 	u8 bBroadcast:1;
-- 
2.30.2

