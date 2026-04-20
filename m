Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693A336EAA8
	for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 14:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776694188; cv=none; b=IlHURy6T2qNrs8ZP3eLPhoaxWKwUdgCSTnuGtnQLwuXFEI388sXhKnVhNy7urLApEqFKMhqqmwZ1i/XxICAkHQ+wKddJoLFZ4rTq95VPCP2R1eCqyEqmFiDmD32Yg9qFXlI7jAMZzkcrEE9x3/GCb5+eT8J/7RVL7S4qP3jd8Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776694188; c=relaxed/simple;
	bh=zl/btun4vswcZCKNwdf7yHrhdjLCThX8GH22GKnU9pY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CdXmlqQbkqu8NdWCH4b61YO2hHAhZA1uvz0SEAOUPSdFNiQuKUoSAKtUtVbQp9cuzVDwJFmBxCWmwf3vbywI7bfMxc7gEOdrvzYYQ4AsZhP6qleS2uJYZ6l+NxVRVdJAsDdZhphEAQ6L3+uwvpbV3190/JSRc9l5k+WCrIqRhd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gr62KG8a; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gr62KG8a"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b9d9971d059so438440166b.2
        for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 07:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776694186; x=1777298986; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YdmSEBxLsk8sxmN+On4zurEXd2v6gvfUnEqAFEIij1E=;
        b=Gr62KG8amLClRTtBIYLod4ntDDGEa1H+dLH5wASOUlVj+Og1aT36UNt7I+ViK6+NP8
         tT+5lE/j+CQZnLcfUXMZ4hpAI7FymSlarXoSjp1nW5uXt1v+FcC+kBTSdEyL/QOu0wiI
         xxdrasvQ7xBqtpTqt7sJsJADWMxBRF/4BfKMfjs4+3+azXtp7gw/xNCptLpwLQ2A7TZg
         1G8E6j0pVwW8uqi6uLw2nNB6l58ov6PqnacTX0vJaptGe2mhWi42G2A1hYwwLVlBA4zS
         zyHUU3fNew6KHkRjjdFoJTOu1sLLc5r/4EDV9K3yOYuDmTNrjKzF49lHsO+1TEJWQmrX
         xcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776694186; x=1777298986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YdmSEBxLsk8sxmN+On4zurEXd2v6gvfUnEqAFEIij1E=;
        b=GyIzh4gStdPjUFW4aLURnvEnn/8Y9hibSnyg7lhrJ6yX/laKuQl78k+13xsRFRpqnD
         6WsCprA7cP8L7O+JttT60w7t4D8J2qaSh/VGHJf41OtImPkaIoBy5TsMVY+HrzJpJoG4
         0em61PjbsNP8UY9vEcBEyDpioKYZLkntd6+Eg8zl0jSJIce4Y2NkN9/hskjPAxh0becr
         7FoJZUg2TOFfXu/OVetKONdY0J4UkW+lm0KBExkT+P0dUOgU/sdfIXHAUevRU8iDGEAM
         jaCKgckOSH+KsiEG2qjlmKT/L1iqf0W+hgnIooc1wGbpe0m37TwAays9evwVW77pJ02i
         MQTQ==
X-Gm-Message-State: AOJu0YzRV9ROIwYYyCApBUaEMk2JE78rciLmYIk1EmPo5vwii5Ya9K2f
	tDF5f+pj9jFkK/W6r2jBLF0U3GEC4daK1bjKi2Slb4onDBweztgd11AD
X-Gm-Gg: AeBDieuvYgmtMCh0GwyZlTKTxzTzp/+l2wI+bPwJxKamzjePXbPLMH//ElhyuMXBgLk
	f+O3T3CQ8+7uPaX/RlXe/9B5AXVQqlJR/1BuAHaFMGrMvYVLZZqc38sFPXAXLmT09ByUwwfodWF
	yzTqaTC43hFAo+HgQqH6e2C+Raqt4qI3O4k3ir1JS89aFM+M6J+lrdHYOHod3FkDu8szCwSujT8
	mH/fUirl1VLTDQqKL2vOuT+nZ+c46UzZyFaqDc8SJAbzIDNJFsixCAGGeR7A8ORyhHDMlLhcYWJ
	zbF/FuOTg4vFDKesBnBHI5MC4UURTgux3e4qtmp6mhTx8e26OkUqBTR6jw+N9XrBZzVDxFhPVU3
	E3ZOhxV3FKg5iryiFRbxfCJmYACQmZnxvrmY4RcGbsJxCciF6I16ze7Vi1SGDzZ0xmFL6flnh6M
	1QLTVfUf09EaBC1zRzxge7VjT68/o3dUz0okgwcdgslmDTAvgJENcJUuFYk9OGTtg6ylR3NIg5K
	xNWFCL2ZfVQSIyk3+rUP27PqFHiK1UXVT2NnSi+6eUMs8seUSNHdHaN/TLZTAcXY0w8WXGWwzer
	42LMkXcrAGyJoxdHBx2B4USCrLY=
X-Received: by 2002:a17:906:4fc5:b0:b9b:ddb2:b1c1 with SMTP id a640c23a62f3a-ba418f7f625mr565611866b.21.1776694183240;
        Mon, 20 Apr 2026 07:09:43 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45121109csm358377866b.6.2026.04.20.07.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 07:09:42 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: fix OOB read in OnAssocRsp() IE loop
Date: Mon, 20 Apr 2026 16:08:07 +0200
Message-ID: <20260420140807.152739-2-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420140807.152739-1-hossu.alexandru@gmail.com>
References: <20260420140807.152739-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IE parsing loop in OnAssocRsp() advances by (pIE->length + 2) each
iteration but only guards on i < pkt_len.  When a malicious AP sends an
AssocResponse whose last IE has only one byte remaining in the frame (the
element_id byte lands at pkt_len-1), the loop reads pIE->length from
pframe[pkt_len], which is one byte past the allocated receive buffer.

Additionally, even when the header bytes are in bounds, pIE->length itself
can extend the data window beyond pkt_len, silently passing a truncated IE
to the handler functions.

Add two guards at the top of the loop body:
  1. Break if fewer than sizeof(*pIE) bytes remain (can't read the header).
  2. Break if the IE's declared data extends past pkt_len.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 5f00fe282..9666226a6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1400,7 +1400,11 @@ unsigned int OnAssocRsp(struct adapter *padapter, union recv_frame *precv_frame)
 	/* to handle HT, WMM, rate adaptive, update MAC reg */
 	/* for not to handle the synchronous IO in the tasklet */
 	for (i = (6 + WLAN_HDR_A3_LEN); i < pkt_len;) {
+		if (i + sizeof(*pIE) > pkt_len)
+			break;
 		pIE = (struct ndis_80211_var_ie *)(pframe + i);
+		if (i + sizeof(*pIE) + pIE->length > pkt_len)
+			break;
 
 		switch (pIE->element_id) {
 		case WLAN_EID_VENDOR_SPECIFIC:
-- 
2.53.0

