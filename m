Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF9E43B498
	for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 16:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783702356; cv=none; b=Mb8y2vnYtSilo3LDfkMQ34Vv9Oy65wKVTgs2PPUE7bDnjrtVyRtspVdhSARblNoREved/HQ/XlpRkIm9cENDSsxJW53Xx9l7kqAGyn0IE8xBBhaEal56cOKrjo35BLB5BItOycqYa0o94tOWzbyfz89ul7B5FWVLTvxx7Bib2EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783702356; c=relaxed/simple;
	bh=do5+VuiSQYGOek/x1myGB3E5fb7x6ZiJQESYdU7Tnyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PXR8H3ve4LhErQXWUX2V/ZbyJdV10/0o51Kmt//JX70h9frXfbN3/Qx6BICi1ci2J5HUeFEJw6YLBWpVGM4kD5t0AA+LWPBaBvjoXrSCympR6T7MoURnYqlPHB9j8q4eQgQ7RP2iPQAydmVGHZS0C7gcLJLSX7FZgWZeMQwJaxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mv/OZAN0; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mv/OZAN0"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c15ba3a2b4bso144144966b.1
        for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 09:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783702353; x=1784307153; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yLWD01JCL1dBsFgnUdPHrQzbvvtyUZW+9Q5F6PMRSxg=;
        b=mv/OZAN01vFnErZVCexzqm79jzWh4GZ318njuHSuY3VPnnji0VPtGvmuW7JIXGic6d
         U5oguJGauNJg8fU9c26twmuEGYD+oJqJBI1s5XOjXLJYbaZI3VAIVvuTeh5JpmdL91OQ
         ySI5cfuADWBH9HawBfWpj4Gl6vrkZ0naMnGreoO0NT4n8hSNo/1LSjHSvHUQZQFjB+qd
         C3hY1yAfSpkDMXh7VbyklBEDchg2C5ra78slUYD90LMMV325fEXWxfUH+6/lwRsHo/G8
         e3zVXErjhKrDeeYkzedFEcOEs6u6ZHWiVJBJquYmbKRHu88DjVZPwWEXvRcVsBiGyIvs
         RjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783702353; x=1784307153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yLWD01JCL1dBsFgnUdPHrQzbvvtyUZW+9Q5F6PMRSxg=;
        b=d6FJfee75t26JC0Blb1sgr0gdWDDUmOwZfhB23W+EYSrE9sPMffv3YBkivSuoFZ9/I
         vQphTDtf9dZ+xy/MTDdRzwVDuMejJxc48Qz9RIhfUyDI1zxZPeTNZLEdcnobqPuidLdY
         IgDiuD3nMjSU/Ne0dbrf/JtHTJO4pWnov4hCGS+6AXMhPzEWn9GaRZo1ga7WHquHCSEE
         QgTLqg3OXITKlTp+s4amKXC1XItWEoAwBWhFejnTIiVuYcKvEDBRyMk+6VKoVEBmoDgb
         +08iCXbEdZr84gG+W/ZAdv0xcz0P9aiO2jPq6lPMSeaDi3jcHKy3he9ZmG4Voty3EHVJ
         YKmQ==
X-Gm-Message-State: AOJu0Yy+FsIJqE5gkEtMo740TWamFsW/injxCddKL1fLSd04YpnQ3KG0
	NAT5JsgtuaCQcHBfWVjguYmsnXSp/23pFTMCiAdvyxUczuPLjcNljZ7wDoMPSw==
X-Gm-Gg: AfdE7ckV0v8LJVxOl7qnfEJ+QkYFaceM+ZQkW2GHDQACeSxrwGYUW9Ywje96pT7woD3
	Iz3Xau/LSP1+JSdXTAftgrp+O/brEZD6hfyMr/wK0n2wrA28QR6i6EgeIvYEqvUycwb9ziLY+Ia
	OulGE3raiv+/LGLk7bbWUZ80ja7fPNSZbKeDSAeEjO1nO7ukmnkb7NFXB7pjRJ3HeQX/ez8SAmE
	1Ay7SgJqhZ2n8bgD3FTEUt++21rZ6TbdmvzsLUi29N+QKkIEHLQlJS8bzXSqOkdA9Clei0Uf0BP
	Qd5jtoSvZDuig2+wsKgK2sjMsMSiPGG+4xMBvrxVzds1wa3LnXPX2JTjV42plsJv+slLru1FDPR
	TU5fCZO2gXIStJsfbL+hwRdFLb8fRktQ9J37Aqjse3h1wAASGhDS7tHM+mHyD5zdY8u0faR0vP7
	lxwPefZGimqw==
X-Received: by 2002:a17:907:741:b0:c15:beaa:7ec0 with SMTP id a640c23a62f3a-c15ce043ce0mr529563766b.17.1783702352844;
        Fri, 10 Jul 2026 09:52:32 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad694736sm643050266b.0.2026.07.10.09.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:52:32 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2 2/5] staging: rtl8723bs: remove unused ForcedDataRate from hal_com_data
Date: Fri, 10 Jul 2026 19:51:09 +0300
Message-ID: <20260710165220.68599-3-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260710165220.68599-1-nikolayof23@gmail.com>
References: <20260710165220.68599-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This field is set once and never used, so remove it.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c  | 1 -
 drivers/staging/rtl8723bs/include/hal_data.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
index bd6fbb80ddb7..13efbfa5b58a 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
@@ -94,7 +94,6 @@ static void Update_ODM_ComInfo_8723b(struct adapter *Adapter)
 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_NET_CLOSED, &(Adapter->net_closed));
 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_MP_MODE, &zero);
 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_FORCED_IGI_LB, &(pHalData->u1ForcedIgiLb));
-	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_FORCED_RATE, &(pHalData->ForcedDataRate));
 
 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_SCAN, &(pmlmepriv->bScanInProcess));
 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_POWER_SAVING, &(pwrctrlpriv->bpower_saving));
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index 273080ae62d1..578cff14adc5 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -154,7 +154,6 @@ struct hal_com_data {
 
 	u16 CustomerID;
 	u16 BasicRateSet;
-	u16 ForcedDataRate;/*  Force Data Rate. 0: Auto, 0x02: 1M ~ 0x6C: 54M. */
 	u32 ReceiveConfig;
 
 	/* rf_ctrl */
-- 
2.54.0

