Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9A420E71D
	for <linux-staging@lists.linux.dev>; Mon, 28 Jul 2025 04:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753677413; cv=none; b=hOIabv0G7e1qq+pGvcEZNXuiQivX1Reo7IZ1Fc/qJqbkeyC70eo9hXY/Tqx2pAjcF2KFo5Ve5Tc/hUrxC7UDYRlgk/f9NTXGAXJfRBH+pu+QaL0/DvGMP/fZMieyIZQ3hWOmoZae591borT4YNMn6TJaV5eE77HvCUpZFhF8eWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753677413; c=relaxed/simple;
	bh=tDWQTnaOByEBiSkO3FvdLGPrQKPyATsUtvQ/bjuirZE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QqjyC5u1creXvvXJ+RhYUhmOu3DzMAPyTKJn1HGSrclKeqDmHQFGkdgdQE7sJZ7S+8F/n7kjo9yz2NCkiOXJ+vhtWksyvW5wAWpBTcdJHy7eqjia9R8li3Xgvu4IEur5T3ZGd0cRwpSh9L7M1PMzdBUbwaP+0oyAht/6xk7O0bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RRv933Fr; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RRv933Fr"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7e62a1cbf83so404513185a.1
        for <linux-staging@lists.linux.dev>; Sun, 27 Jul 2025 21:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753677411; x=1754282211; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXztVcGyYhcXEUuh9ymdxD2mjy3D+/Xbd03h6w6BTCI=;
        b=RRv933FrD62ByWIDayDNYuaw2oXm68WOnAxBO3WVjifshuAQCMeHikAYDdMv5hgzB4
         iEWZGE3RikPK9z68HqArp3iFNt/EzJh1ilS50x6iMq31pqdSmxVrJ7wRSYqzgHMWm1uQ
         wYLlpg9GnSmXIbdBYSg7QUXVdBZKgtB66/Sm1WqprA9UhQyRFZyb8yy+pPJJTMnHguNb
         d4c0pjt6FBBvQ3ol9ZuHZ3ZopvIvYJt/Oz0HGYQK50QInRXJG3DUqlR7SZ9b3GknT8DB
         EC8lIlP7McuudiQordwSWdMaMHTd90Nu1GTfWb2qT+SX44hanAI47MiwZ545tXUboXSD
         LCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753677411; x=1754282211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXztVcGyYhcXEUuh9ymdxD2mjy3D+/Xbd03h6w6BTCI=;
        b=hVDn2CKRy7Y2dHzFjynPpkVBMDXrDWY3oEymamKLtLmiOPB+iQ9EUvVXBp3zEMONPp
         sUDl49R0FgTXYh2ugKl03QQ6Tzr6C4Vy7OdZ/2dq22C/vcU6DFqOlN7Yhg474Xk/jRZJ
         AZ5fPoNtvfmgUVMaK8hYXirfkI6m7wiFXYd/3ic0C7AXX/WsZuBc++RkFUC2YptFAF7q
         hYtkem/aAdXxNAz1q9p2EEfYTNB0QShjBKWZKXREH6eO1nfFpHHdDHwZPY8j+DfZhlXA
         MABCZs3gAix+KliJLMAnfYQXSLrc0/AYWgqc/gqK1F1Q587KeFFEIYW2u+XdCVIxtBuD
         TEow==
X-Gm-Message-State: AOJu0Yzznu93WCusaWwF53egru3AhgxP+TPp6NMCGEsOG1VhOVJQNCfv
	HEkD5awK9jL51a6zdaMinKMqB522nq8FqllB6J7cEyVntE10ByLl8f2y
X-Gm-Gg: ASbGnctCoqspGB3h2/gyjHFgy+m5JoEsEHTD8cm+T2U0xuRVDHZ30HTFeUFIgg5D5ZJ
	V4mbpbq4kuwqnEbwcMgaLmLXPBkTHdGmSD1zn5l50wVr8zUe9VFEmRghucIRD9752dSF2tCOe4v
	ZXICQx4K0H/DB27YQ18xeK4qK7jOS5iI6jLuixWRZZPDaUh6haBJ0qnskx28GkiiACfuiqmIIxp
	2d8TadRPGDE9pV/QbrMDk8qcEqT/95z+9HGp27KmjzgUkm03RNZkikgLNh8kRALFJo1uVzi9PfH
	FiZLLkUImi2IZcjVbtwaY5yRKldFsCxW28A5Ih0MZixQuJ/N7VwNrAKft1VXS/uunPplOkEX/1Z
	tm9rM7wL6+pSGbHNk3VeAxXLhXialew5TPCKRBR4UWGtz2qtcQSg=
X-Google-Smtp-Source: AGHT+IHVRwJVt2WogTeYvQm25w/2dooYaUNg8V/US+F/CTRtqVjHiUxJQADIE41atp6l093H9eWpRw==
X-Received: by 2002:a05:620a:7002:b0:7e6:440f:50b5 with SMTP id af79cd13be357-7e6440f5113mr997580885a.11.1753677410810;
        Sun, 27 Jul 2025 21:36:50 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4aeb2e7a7fdsm12694961cf.4.2025.07.27.21.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 21:36:50 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH v1 03/20] staging: rtl8723bs: add blank line between rtw_roaming() and _rtw_roaming()
Date: Mon, 28 Jul 2025 04:36:28 +0000
Message-Id: <20250728043628.421849-1-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250726043218.386738-4-vivek.balachandhar@gmail.com>
References: <20250726043218.386738-4-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a blank line after the definition of rtw_roaming() to separate it from
the following function (_rtw_roaming()), improving readability and matching
kernel coding style guidelines.

No functional changes.

Identified using checkpatch.pl.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>

v1: Addressed review comments from Markus Elfring on changing the 
    description of the patch regarding readability and separation between 
    function definitions.
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 24e505111f1f..b1a427a655ef 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2449,6 +2449,7 @@ void rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 	_rtw_roaming(padapter, tgt_network);
 	spin_unlock_bh(&pmlmepriv->lock);
 }
+
 void _rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-- 
2.39.5

