Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EC8395252
	for <linux-staging@lists.linux.dev>; Sun,  8 Mar 2026 18:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772995311; cv=none; b=TIdGCmOY1SZufxQr3OvyJFbevJajNK0MI5NewwSWosw/ZaljVCCbDB8sJwXFAtMcKBEAIcyvN9ToOCTQS7jA8W5Ix2E3x+6peAaG9UhForWtPJYOIwdVBpiOv/pWLBRxXQZwOgdgZSR0pH5Ji/cXDQUI9yiTdKjvsiLiv74OJio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772995311; c=relaxed/simple;
	bh=hFE9ozX2nr0XahiLab/Eu3QRvOafXAB40QNlMGxQIfI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DMT78mlk6xN+Jn7zigAjn6CRWS7+Xz7SnzV91+qsnJPKnHyjkZzbug4psbHWW4lzYsplJVbvfBWDCu9qjzVBIWBJnfyI2tcdemiFhFQbTXWFjvO0ymI/z3UzsEoTEZIyEsj7kOndsil+yVtDEUkW32lar0pi8oi/5DXpXvc9h7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZL0b7zGu; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZL0b7zGu"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5ffbcfbcecaso2675330137.3
        for <linux-staging@lists.linux.dev>; Sun, 08 Mar 2026 11:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772995309; x=1773600109; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zbMdI8BqVwRlom2TUZHGpCgK3ioPm+2GLZN4Jw++Czg=;
        b=ZL0b7zGuieIvJSdPoCG75qxYfOMZtJU40thu/UUWzlmnRE/BQnIkGU3zqy9b5SfyJs
         liGa7M0lBP5eZzoU6AabQFjo0X7kKrwTAdaMBYw165amKqfHVCiqm2dBjRpbegOFw/ua
         y9m7+7yvgTqLGwhufY2NTc7WlSnDMA1l4wfXRfhCErctMwi+s+RF77eRYVRFNNrwtSCc
         p9ZnvA4Nbhe87t+tgYip8HNXFLV7Wu5Ht6+jrpbQHohQIyGt5snBE1Ae49Ay1GQdmj72
         AWyruoDfqbfIg6Qy8b70gVGomLkjEaZmbFSqOUvxzVK03w1pwHxVfaD+tFzLJaweWd0+
         gRMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772995309; x=1773600109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbMdI8BqVwRlom2TUZHGpCgK3ioPm+2GLZN4Jw++Czg=;
        b=ZtxPlZVWYIMWMcbrvumrXaTkD53pc4ssyhhh2/OUnZ6LDN4TCO51PtTqnJv50xc0z1
         OujFNSeGmabvAAe3wUhHrhNAQTrlHfyGYPfus9CI/ilR+atV9MBGcHRq6uCRDPKTKdkJ
         TRy8fRovthEh+Sm+xKs41olN55bAOGsLeAshyDfJeAJpBQVuOPQ5zwcfMwyCVp81mwSw
         g3RLKMCVqQydRIt41Ox3KhjaNr+y93Tg9OJZ6dqmiLwUmcUSGCISEdRxyJtBld0Q02y6
         zrK9jIvenykXGYEPHjt2g9fVQBFxbj99Gokc8VFW/iiXIZt7KzbAOQCVxPzovkwg38XP
         fzPA==
X-Gm-Message-State: AOJu0YyqUjmTyKrBgJzXLJtADM0PoVUGz5KzF7343kFvTHsJplmu/Dex
	QaN6r1zXTyhJuIlXiiFwaI18dSPP3E6FREHV/JfsnKccDv/gXdkawCXD
X-Gm-Gg: ATEYQzwH9xabiLFOH0zC78kHPHbCfEPyYaptq2yTGj1RhK+XLcsTf92VjohBsN7lRce
	FrhA4FO5thhXpbllkGt5rVOBtybYCGhx3V6QDQnQInJ0sLU7WdZWSU1aYPACudKXetHQDxdfd+5
	6r8xlZo6MUtRFfA5x4ZD3a3vFrQVYhi8xDVaQLefu4shl+CdkwNUvNvj5HFPcVL+gZ+I7P218+6
	tMUmP7n/tVA8i+TcA7U/8iSaBAgLwBBH4ptXCKYi1FzcfcDeaS+PsBGmpjivsYV6Hq6DhoyvaNO
	mQswfc8lk2UePGhe3zzffc7RE6WusDKogQUUTFwhF/QE4CMTmsDogmOZNatqpqidw/LF4bU52EM
	CRvyZPjPkV8hsS955iyxpQ2+olCk/SYnLbYmrUpRTzBBDxKajFf6PThfvLn1ojscLYw1zCaRXiV
	uAqtNBAw77aZZxALkbJBFlCqMIMA4RxTqWGK7A5ZkwEww=
X-Received: by 2002:a05:6102:510b:b0:5ff:2425:a0d9 with SMTP id ada2fe7eead31-5ffe5ed614bmr3654757137.1.1772995309081;
        Sun, 08 Mar 2026 11:41:49 -0700 (PDT)
Received: from localhost.localdomain ([2804:d59:7f1c:1e00:6632:a8ff:fea4:c8d3])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ffe82e4dc5sm8050223137.0.2026.03.08.11.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 11:41:48 -0700 (PDT)
From: Gustavo Arantes <dev.gustavoa@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gustavo Arantes <dev.gustavoa@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces in rtw_mlme.c
Date: Sun,  8 Mar 2026 15:41:20 -0300
Message-ID: <20260308184120.519401-1-dev.gustavoa@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove braces that are not necessary for single statement blocks,
as reported by checkpatch.

Signed-off-by: Gustavo Arantes <dev.gustavoa@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 28dfb974fdff..2adc98c955fd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -877,11 +877,10 @@ void rtw_indicate_connect(struct adapter *padapter)
 		set_fwstate(pmlmepriv, _FW_LINKED);
 
 		if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) ||
-		    check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
+		    check_fwstate(pmlmepriv, WIFI_ADHOC_STATE))
 			rtw_cfg80211_ibss_indicate_connect(padapter);
-		} else {
+		else
 			rtw_cfg80211_indicate_connect(padapter);
-		}
 
 		netif_carrier_on(padapter->pnetdev);
 
-- 
2.53.0

