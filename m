Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691882236EB
	for <linux-staging@lists.linux.dev>; Mon, 28 Jul 2025 06:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753685025; cv=none; b=EI6tflTDheeI/m0Pa0nLeLYc2Dv5AbEY6haeajZLdHXl/v56V6mMwOOK2bdKKdRrocOcTpo2CEJcYTblF9NpoHZ0IdldBdeFNej7Rr1zR1DV5SuMN1rRLYiY/ZeRCg5fDoy7WZH5r6YsiCYhUpYEY/Fo3L8BYtJ/G+ExjcPmOH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753685025; c=relaxed/simple;
	bh=ICkLCQRNWkIQwQfoaVtdgQfsexMdUfuuMixiPal4tgc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OBKGZyI7Tfw6iTCUeFEygeWnxxhhThL4ZlFyo6DafDZVCZQARmlATy8XR1x9haPGsnxD0h1jdG7sd8XKsXHdqwYgHRvrifNPAKUkzc4Agy2s1jLwCJ+TEbXMhKprk1gVHeqAZCYMYkjTOxIil/5+P7RxuRXvR5GRjQLFH7yKvPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KD1GjYa0; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KD1GjYa0"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6fa980d05a8so32232436d6.2
        for <linux-staging@lists.linux.dev>; Sun, 27 Jul 2025 23:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753685021; x=1754289821; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5snVPivmEg3Xnsr7kWQ2OSaRpjExflTHsvK9SmeV5Ic=;
        b=KD1GjYa0TQY/pcPWECDv/F+/meYE+ixlYGcs26j8UbpWU53TA9/lI9IF7O8ovpeSGz
         Fg3N6LhLAl3bWQYKIw5czCxvhewXF5JjM9nRlvzMlnAK+UQHQG7IZ9Y+3Fal16s63e8D
         wTcvbrk1UkJjZU91HXy44huAFhwN9vB7k2ew1YlDckSj0wEQ1679lHq9kQkymKiDYsef
         yxFsfQCmuRMaifny++4q6Lv9eVUHk2B6aF+TAi4Xz7ntXVrhAPI/cBZObnXM4t5AadsH
         DU6fuXf7SXrnDuOoY4KBwZ1/AYhxZAiYuPVH0LgSCJ6RDdKEo1BVjBAud6RnmjIXSenj
         FQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753685021; x=1754289821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5snVPivmEg3Xnsr7kWQ2OSaRpjExflTHsvK9SmeV5Ic=;
        b=NQRmBaF0tDVAATA1TTPtsMqLfUKEiujWU31PZK68GfenasulMc0XzrBfUX0cdLWxbA
         Vl9yr0Z5tDu1JN8zjRMWp6SevYEjmtdh2wvtR0ZqPzSMFJSdzZMeAQRxybWmZTBSEkYG
         BiW/S2EZjzjAcfqyWpqnNmcb+XrLyy1GRVPOuyMzC9J3hb9VpY/oDjVAvCq096CRIbIH
         lKW4mxxmAK0QvWz1TT0K+i676L8ifFLJYosbj9h/K6qFSl3J1QadBPiDnrssSdOnJGeh
         wwMFTNUwNKLU7YeUwqRAugvTy92bYjeLnpvFwOTeGqNEX3nejnEcIDb4toXD+FmoeJ8F
         058Q==
X-Forwarded-Encrypted: i=1; AJvYcCXeQrDAafUgOrHlo9+pfqv9jHSJFRoo8W/GLR36wxFbTI0sA0AeEqQLwqMlcb14flQVabTs2bMnA+lAekrB@lists.linux.dev
X-Gm-Message-State: AOJu0YyMYpCmQhoDWObfjQiS0oa39kZt8/tVPGHYiypMA00CwSrHvbhI
	9Jxt6GHcxEWcPV7jLWqYLbwTxStTVcMMgbJ3CKOralJLf3LwUqPZ2cVU
X-Gm-Gg: ASbGnct1OyD39zdsH7nnDnA4HgMvf7eODM73aZ0sekgbjsivi/Ui3XO2yKRm87NorPn
	4eMs793Bqg01mqNWvb0X2QheS2hnscuTiICoFp3liG5UtlT1McHAvBsrQ95eaT8icP/RrOywLIO
	DU79EWRUpm/skAV8bR7o+DuChieVma2qBEtk3ecpC2+Q/dprJNFQx3D21ta6koqOPojJjTGEcvM
	xDOMw0I2em8iqv96jqqv//DzZ48tXPbRysSDb6amcDRhB6KN9yel31ieqY/TGJ3bEE+OZBKKe+7
	r7Ep0lutuUjhwQ1dFnuBt1BM8Xt/KINsgjgucZbKoXU4Ncu0G1upBlljXhGrgddbh6G3Ed3xcQD
	vQRpyQRxeIBSkkPeTSpmz/dwKrkuKAegzT7xxzBW4jqwCxGrtAno=
X-Google-Smtp-Source: AGHT+IEXelpE8W1diOtr0Axo883c8NWykGxfuDdek6Bd2yUucxkYmKbL0ViQNXdCwhj+pY4ZUFOwUg==
X-Received: by 2002:a05:6214:b6a:b0:707:4c0c:5316 with SMTP id 6a1803df08f44-7074c0c542amr21984906d6.46.1753685021058;
        Sun, 27 Jul 2025 23:43:41 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70729c15a4bsm28349946d6.60.2025.07.27.23.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 23:43:40 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: vivek.balachandhar@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 14/20] staging: rtl8723bs: remove unnecessary parentheses in conditional
Date: Mon, 28 Jul 2025 06:43:28 +0000
Message-Id: <20250728064328.423024-1-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250728063510.422849-1-vivek.balachandhar@gmail.com>
References: <20250728063510.422849-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed superfluous parentheses around a function call inside an
if-condition. These extra parentheses are not required and violate
kernel coding style guidelines.

Cleaning them up improves code readability without changing logic.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>

v1:
- Fixed incorrect wording: the change was not around assignment
- Addressed feedback from Markus Elfring.
v2:
- Mentioned the wrong version number in the previous patch.
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 3702d7e7a954..d845eaecd615 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -700,7 +700,7 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 	rtw_set_signal_stat_timer(&adapter->recvpriv);
 
 	if (pmlmepriv->to_join) {
-		if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true)) {
+		if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) {
 			if (check_fwstate(pmlmepriv, _FW_LINKED) == false) {
 				set_fwstate(pmlmepriv, _FW_UNDER_LINKING);
 
-- 
2.39.5

