Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD833939C6
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 20:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776112195; cv=none; b=MDR4ugdxLnE66UUUXN//yrMPCDucpLBPasCPPxB1L3ZMsefxzs8rDpIzocoR8l+RW3gGNba6ZamoYrs9Dm9gQcPUn/40Q2TgLyksvKSnHybvEbkFidY5cl6bOZ/raNgnZpCWa723KUMairgUN2DHOspMUG8m2GP2XqB0tSqmF/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776112195; c=relaxed/simple;
	bh=JPVaL4c5/9h9h4/5l7XJiy0RobptP8/C1TcDRP2ZUOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P6U6XsWvge6ul/ZImpWu1QTEXWupvy5m4x0gNaUBTxPPRRaMU0lXMSdiWXxIe0QA7ZYP6a+NCJYipyORFPKO5ItJMY75r6tB+DXHScOYLm7Smf71o1OXXBQ/jXGZaH83Z9XDkQhep8riiknBz+VFLh0fqM03maj3764Y85KTY0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lNL2ZMWm; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNL2ZMWm"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b9b1df1a6b3so562914066b.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 13:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776112192; x=1776716992; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J76QkE9NJQFuHh61XUi+3w9vtC/liTP6j3ZjmrLLecE=;
        b=lNL2ZMWmp27un0vS2ABRQsnoH4P18bNRKvKgvAqmzr2q1+MgtB7dysS+9fZPL6moOM
         TSh18Kyqd5CWw2VLucY2VEq0YBqdnGylAbg24EsRGZOdvO6EKhldmb4wpGZnNdFt6Wa9
         vgcgmrJ9mCyOkSSHsanEdhwAl7imkG1pi9E3gPyP67V2xx+WCH59/OJwSPO9kSegotQg
         yg75Lc8S4pIbdqQVxrLo5S+R5+u+ENIiMLH9NJYIkpUgmDTmKWgPGElFiLf2+QcFhjAi
         hSrvrStVBaRgNxetPXDQZrja+NqiVVs2I/PiekfGeOsOEt+Gi441y10nDSRKe50LLfMh
         dBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776112192; x=1776716992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J76QkE9NJQFuHh61XUi+3w9vtC/liTP6j3ZjmrLLecE=;
        b=M1Fh/eN7AwsZU2JHwvpjBvmArKSsofRX9+nLQzLo7wnjY4ryCQzw/DMkajfwY7qjhB
         MHT1QWDU8sB2JOTO+rH3YcQAQkgkxrZRQPr3HXMDdtr4+Mv38iPShxUQKeALhE21gTWa
         n2usqhc9rRWzKaHeFYCCwkLRdBV2tfRln3xVHLO8pSLFHL4Z9MP1grbB12zWywMT2tVG
         PR2u2w3zGYVjgPp2ngOuPTcajL/fkGwf5JnvZe+5qO5JnldFcInblGGhXN7YmPpTibIc
         +BVegVRgKq3L2ZC1/SqAVLWIesgUTKKPQ+ZlVQLBy3309q0Vmnfh2OPKShtJb4tFgq1m
         ADJQ==
X-Gm-Message-State: AOJu0YxAH4bI15xCe4GuLqNEqZcJF/O1Zfbxyuoee/5GtN8uQOccjybC
	BcfYSRkf/tJxa40bqWDen3O+NtKM1n2IOAEGxkcAR2D5NMo4lx5ghso4
X-Gm-Gg: AeBDiesUy9ulGQaiVu6TbJuESh6Z0G1aRJAVO0TT0vEfkxbeal1OEl49OfHQYBz+oRZ
	hpWhKaigmhIMoSRb5iqEvtdFJCGKav1krs1sQnXdOtwkZmpI2hT7hEy5j39h+b7Z4yK+J1rJLZN
	qEy1cR7rOsmGD3VZWHdaMSbaOddBIZGcbGMPt4+jB5L8YO5p3MOPxeos5Zc1q011q4FD0EMm4VZ
	5ZNsc8N3RiefoEaZGjHsCzA4uVIntJKQBr7Lqo5b3dTacKdysLrPRXNFqvEnnD/6Wmb9mbSS4+f
	t0/7rpS4P6D6U3bel05Pr7dyWEDNYzHE3HhGTeYjYWk57bD8TOhz367U1VtwSggrZ7keHLDO24D
	C9TD1BQrObDYscd8I3QkWUwjKOSMIAxmHNC4N9W4YJEYbns8uHrQJtiDWzu04qbDyJ6bQiB1gpN
	V2PoiRoXQo5Q3Gtl/5BrWm/JbtKjCAjz/KvITxlGIhyt2vWc57GskTUEkaHTpJWFkO/N5Slym1i
	VKKcB8vTxvud5hNqLsN9seI0fu8oTaXm1ufhSoUC7gED1JrBaKUwFpSqxU5AEHUUvfOGns7elRq
	pMv5zQ==
X-Received: by 2002:a17:907:6b8e:b0:b94:1d92:7eb with SMTP id a640c23a62f3a-b9d7279302bmr734143466b.18.1776112191780;
        Mon, 13 Apr 2026 13:29:51 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e5c582fsm353034166b.31.2026.04.13.13.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 13:29:51 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	hansg@kernel.org,
	stable@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix heap overflow in OnAuthClient shared key path
Date: Mon, 13 Apr 2026 22:28:24 +0200
Message-ID: <20260413202824.740653-1-hossu.alexandru@gmail.com>
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
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
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

