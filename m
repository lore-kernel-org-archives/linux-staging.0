Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8952354F84
	for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 04:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709008935; cv=none; b=t5uSZsG0zFL9ortUn3JM7VusMD8hddbydfRckcq60XWhzFGPsTRfzIjLC8+mYOKgJQhitQdj74Wk8Xg7gx8uqmHl3tTISEYhKLD6uxaDkvHg7Rd6H4BDSi32YAACf7WhDwtcGPr3276/NxJV6+F7V778at7WGc0SLwiU7QZRFo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709008935; c=relaxed/simple;
	bh=PG7R9LP/p6+DQlOU8Jrp8FyMGw5i1TE9sJUY1y+sl4k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pmYRLj+f+deya4WmxN3wpWk/Z9qIbh6KNoZ/KR4QgVhnFM9mHscD3WcQ1iXYIkp5dGmkBl7/3m4SVapVgfudbLBP2T8h258F57lY5p+IEcGrdvT7hlcMbSx4Zu8Pb+/hx2ohWoq5ir4wyNAFa86fU5WSZlQEAHfigyzBQkf8iX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=QMa1iBwN; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="QMa1iBwN"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e4f3cbb518so1153736b3a.3
        for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 20:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1709008933; x=1709613733; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kj0lfzux4GLg48IwZCKkqknJLfu/rk3Sg7vSDrSduwk=;
        b=QMa1iBwN70gV7huO5/kOTDyhj3dqsriXEzFBx6yxyO1pbqdyWumE7tiVHEKltQGRjl
         47rWp2oke/TalY3n2IuNJt5lII0AMyw2qAX/rGyuF15Ev2oGPi3zwKmEB54HVTktZ14x
         e/ovr45BhJG9wPCGTu1vrq+Vr8zdwMiLGC3WlmxeViDPk4M90HZplGPEoKKsDPJPAfG1
         QWyQoqo3+Z0zEWUvo4Evw0d40mReC2YVnC+KsXS1vNAq5U/gVzalBeoBFISNjFG29K4K
         iHEvEmIrIxIvSUK5Ou3zf9LsF3pJk0MCrByVb1xP4CFpK4hsqK3X7wlSNW3TBtNYirLM
         mkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709008933; x=1709613733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kj0lfzux4GLg48IwZCKkqknJLfu/rk3Sg7vSDrSduwk=;
        b=sDmT5XV2wUbXh6ZWRqSFRFAtgp9r8cDAC0x07puhSSlHYxBMLUt7egPWazN0nf6hE/
         +Y04qrGWHGBwBhXN510TL38VG3IUeTOpprYBn6NyHMlBy6YwrRweKPfovOYoYpIf0MCv
         lmaDsT4Q1AheigC2MCZC+fu76z6uXXIaN1P+fOFYchfpSQlhYnfglTwcyaEYltnCOxAA
         KNWTK+hUl+egdhNUx8/ayhbtt6IXpXZ3zFW0O8jrfSh48XEqXhDodFX8V7J2+tb3c19u
         S9N2wh4EjxvM6hYriXff0YU/H/2Y7taWJ7AC9AaBO8W6zdLLy2YJ3mTIDqBrWh2bxsCD
         zIFg==
X-Gm-Message-State: AOJu0YyXMfEvY242PuhJgV6AulEulLf0EmfoqRKUUHNda3H5au0HAAjZ
	hX5p0gq3Zl+CdpVcwvg5bMyd7hj83FScDXeFuWZ2O06/J6TQWI6OxIROYQulXMo=
X-Google-Smtp-Source: AGHT+IE0lUScJ3xAwnkBadKfEUlNWkvrb2ESJhkg7t+RUXumRrq4RsPKNyjQWwYkasqZNODYhJr2xg==
X-Received: by 2002:aa7:9992:0:b0:6e1:482b:8c8e with SMTP id k18-20020aa79992000000b006e1482b8c8emr7529222pfh.17.1709008932871;
        Mon, 26 Feb 2024 20:42:12 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id e30-20020aa798de000000b006e4ecc3e394sm4899782pfm.79.2024.02.26.20.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 20:42:12 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 10/20] Staging: rtl8192e: Rename variable BssCcxVerNumber
Date: Mon, 26 Feb 2024 20:41:47 -0800
Message-Id: <20240227044157.407379-11-tdavies@darkphysics.net>
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

Rename variable BssCcxVerNumber to bss_ccx_ver_number to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: no changes
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c      | 6 +++---
 drivers/staging/rtl8192e/rtllib_softmac.c | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 9ec4a3b8ae3c..c703e6d95fb9 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -935,7 +935,7 @@ struct rtllib_network {
 	u8	MBssidMask;
 	u8	MBssid[ETH_ALEN];
 	bool	bWithCcxVerNum;
-	u8	BssCcxVerNumber;
+	u8	bss_ccx_ver_number;
 	/* These are network statistics */
 	struct rtllib_rx_stats stats;
 	u16 capability;
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 103117692a88..051371e0138c 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1843,10 +1843,10 @@ static void rtllib_parse_mife_generic(struct rtllib_device *ieee,
 	    info_element->data[3] == 0x03) {
 		if (info_element->len == 5) {
 			network->bWithCcxVerNum = true;
-			network->BssCcxVerNumber = info_element->data[4];
+			network->bss_ccx_ver_number = info_element->data[4];
 		} else {
 			network->bWithCcxVerNum = false;
-			network->BssCcxVerNumber = 0;
+			network->bss_ccx_ver_number = 0;
 		}
 	}
 	if (info_element->len > 4  &&
@@ -2356,7 +2356,7 @@ static inline void update_network(struct rtllib_device *ieee,
 	dst->bMBssidValid = src->bMBssidValid;
 	memcpy(dst->MBssid, src->MBssid, 6);
 	dst->bWithCcxVerNum = src->bWithCcxVerNum;
-	dst->BssCcxVerNumber = src->BssCcxVerNumber;
+	dst->bss_ccx_ver_number = src->bss_ccx_ver_number;
 }
 
 static int IsPassiveChannel(struct rtllib_device *rtllib, u8 channel)
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 477d736fe22d..794c50b2737e 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -744,7 +744,7 @@ rtllib_association_req(struct rtllib_network *beacon,
 		ckip_ie_len = 30 + 2;
 	if (beacon->ccx_rm_enable)
 		ccxrm_ie_len = 6 + 2;
-	if (beacon->BssCcxVerNumber >= 2)
+	if (beacon->bss_ccx_ver_number >= 2)
 		cxvernum_ie_len = 5 + 2;
 
 	pmk_cache_idx = sec_is_in_pmkid_list(ieee, ieee->current_network.bssid);
@@ -851,11 +851,11 @@ rtllib_association_req(struct rtllib_network *beacon,
 		tag += os_ccx_rm_cap.Length;
 	}
 
-	if (beacon->BssCcxVerNumber >= 2) {
+	if (beacon->bss_ccx_ver_number >= 2) {
 		u8 CcxVerNumBuf[] = {0x00, 0x40, 0x96, 0x03, 0x00};
 		struct octet_string osCcxVerNum;
 
-		CcxVerNumBuf[4] = beacon->BssCcxVerNumber;
+		CcxVerNumBuf[4] = beacon->bss_ccx_ver_number;
 		osCcxVerNum.octet = CcxVerNumBuf;
 		osCcxVerNum.Length = sizeof(CcxVerNumBuf);
 		tag = skb_put(skb, cxvernum_ie_len);
-- 
2.39.2

