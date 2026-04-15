Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5FB33C195
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 09:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776245992; cv=none; b=hrPrBTGTc9xU0feMM2GtsY/wt8DS/bq7wPRGM6nLPDQFu3TCQKyDUg3QZZXGNcnKauNTCE+1IrPodoIgnpDdlzwx4+Yp13BnK2T0JLqJ051f4JKOFSjulBdNBF1iRWjlW+TD7MIKuSfWXS6YOgboU5dieJNVq/4cqFNICbm3r/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776245992; c=relaxed/simple;
	bh=8wEJzSrLXxs/034FOnYHmEz9U9WF+Tj2QdyA72fy5CY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LBjhnZWd+pd/hjvm2VCTqqebOL3SRLPeM05bHkL2qyBh8ay/6bbB1nQcRmaOqjOOocnGJ+iGG/ns2Hy2rXAUxeD5ZatzBhPQA0pojvfY3Ze7rUAzjt9XO5Mcq8xGkrF/O3avX1WHTCBB26e3pGslle0ipzohq5DDwtN16ZCsWBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MHZCRIW+; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHZCRIW+"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-67179ed133dso3730207a12.2
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 02:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776245989; x=1776850789; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TMt1KMCrs6g/yh5vW62yefiOqceYfNw77kBLrZ0YXf0=;
        b=MHZCRIW+XLaGNG7+Q2wxqExWsRYWiIbzs9nob+JfZywKQwfggVnxNWG9YA44xsTqWz
         /mVo7tVBiXDbFaJiXBbiGv4XFMx9GBJ4ywGdpv6M1Wsd2Y/m+iIkopkbDOEwVrEra5eP
         ibY81sFsreCKfaQnW+S6vn3Lq6+4Q+Mp7eTdTvUhbl15hE/bF2begOu876De9htgXI00
         fUWJOCAOasJMbHQ1bNJkX/TVrFMxQLV5ogYFQBDkfdlC9wZS4HSPVtjpvbJcnMtN5jZx
         /lIBqx1PDrHT8U9wMR9Xnfu8EeTjYoBZAhn3CT9Py0Xv9y6LVUHFzXI4A6boNh5BQUTU
         28PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776245989; x=1776850789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMt1KMCrs6g/yh5vW62yefiOqceYfNw77kBLrZ0YXf0=;
        b=gPK9bttL1bibMuVh/oLNi8nygX/F2fl68ttNei1FGG2TRiPB3vvL0mbpkNDjVVFGTF
         8kifTaWnAlpIkfc3otaT9jayeVXZzfhpdi7H9sq+GuCrPmgwiacQN+rMyEhmS8+SIxIm
         mhJiHY+mnCDxq311B6Vm+cyrOf8LLuxwUHO/QhimvGATu5QcFXOYAFB+d0/PE9D50u8v
         jy8kKSvrgS+oeyu6vtVOVhSh9rjWtBz6MZvkG/TGvM42ItbAEVoA+IOma5hhcCZr9geS
         tZdbRuDBTcQ0nd7fh/HY3BPUkYoancZL2lSKYLJ9mC+1DxdGjfw6BspHbNhsK9c6kO7g
         xtCw==
X-Gm-Message-State: AOJu0Yy9SIsqsZaBN9QbMaS6+vc/UKtySqYj+aOMdcP+WQZYPE69IeQy
	1xcdV2Mw8iJS/GRaylRO0G9xEwD8BNo0OD2cNMsW0zwAH9BO5/08oELU
X-Gm-Gg: AeBDies+7G0n/VWsTz3t5USQe13m5lD0AIoRXNGb+pYsQg1St7ndJoG6S77RIh+Mnu+
	RU9K0dN+jIf0y+AbPFNT4eU5V7ugcDvEnq4aMmmQwcfrigU/SmKJkGMpgmYtnyKVgaWp8uAbjkZ
	K0Cxk1Mx2Q5K2smx2EEzpX5uyrNB1a0ub3p6+2ulS2Z0MA9Ge5A2+9wINxs9fzwkGc/D0V1R8DL
	AZi4CzUV7ShdZb2J7Ng+23rizODPedE6l2qxwcZU2+OElXzDb7JHG2/ndDSuWm1ZPceF7tDZnGS
	9teIKcaXMawN91SG5nVTBLVIs0dX00Xan/519Cey3HdsZflk5axjgJvqMzgQhr5PxFmRrhuMcZp
	n4/nbBjFwxhsXs+XLU0Mt9DoDn8TzYZkd/ajR5Vg3mUBGK72zeoXN/Vp96PZpfsBK7Kghi5AZ3x
	QOPOFoMschfGEIkW0JwEXht6BAbM7kktZhfw0flsYaDVQKmbYO9JF8qoEg+B5n9o5PueDR2/kJu
	5GAWQ0lVJN4aHzHiUjPJB2XAcSwqTCTdN+ZIz9RYqgOTfrhpX6Bz10pKMWMDLSJVRu4x6L8xOAd
	mq4JFMf2EIYCLRXA
X-Received: by 2002:a05:6402:1d51:b0:670:3b53:9bc with SMTP id 4fb4d7f45d1cf-67077652932mr8597223a12.4.1776245988696;
        Wed, 15 Apr 2026 02:39:48 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67237d8cd5esm252223a12.11.2026.04.15.02.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 02:39:48 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	stable@vger.kernel.org,
	luka.gejak@linux.dev,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH v5 1/2] staging: rtl8723bs: fix heap overflow in OnAuthClient shared key path
Date: Wed, 15 Apr 2026 11:38:18 +0200
Message-ID: <20260415093819.1112313-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_get_ie() returns the raw IE length from the received frame, which
can be up to 255. This length is used directly in memcpy() into
chg_txt[128] with no bounds check, allowing a heap overflow of up to
127 bytes when a rogue AP sends an Auth seq=2 frame with a Challenge
Text IE longer than 128 bytes.

IEEE 802.11 mandates the Challenge Text element carries exactly 128
bytes of challenge data. Reject any element whose length field does not
match sizeof(pmlmeinfo->chg_txt) (128).

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Reviewed-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
Changes in v5:
- Resend as 1/2 in a two-patch series at maintainer request;
  patch content unchanged from initial submission

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 5f00fe282d1b..90f27665667a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -891,7 +891,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 			p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + _AUTH_IE_OFFSET_, WLAN_EID_CHALLENGE, (int *)&len,
 				pkt_len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_);
 
-			if (!p)
+			if (!p || len != sizeof(pmlmeinfo->chg_txt))
 				goto authclnt_fail;
 
 			memcpy(pmlmeinfo->chg_txt, p + 2, len);
-- 
2.53.0

