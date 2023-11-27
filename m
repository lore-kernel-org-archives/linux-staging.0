Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982885663
	for <linux-staging@lists.linux.dev>; Mon, 27 Nov 2023 05:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="iUU9RqyN"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1cfc34b6890so6128345ad.1
        for <linux-staging@lists.linux.dev>; Sun, 26 Nov 2023 21:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1701063376; x=1701668176; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AFU0GLwo+k9SYd7xhvDwdolRC+g7PfQjKlM2ZWM6J4A=;
        b=iUU9RqyNgx+t99wHUpJmTCm4jnwDR19ix27Ts7HuXrKht3IIzhwy06H9cy5e4YNBGj
         FD++wl84ovKSZY9e6PC0JWxj0lmEOfIP/SPsbpUsLceSYVAIZsw/im1tUdN/YchwHsgu
         Tlz8tR/6LLMb5OXlv1Glx3sO/uqj583qxiws5P6R8cqEAsC2LicVreLHFfkPYskQOIhY
         6D3I1seTTiXD2MU4tvOQArw1qmpYWg8oCF0I/FuEswCG6Q49dXlXVfuh1dcjA6tRLopC
         n9GCn1dix5PE+X1LjEZPrp309iVRWnMlW5/OABKKShS/Yf66jZdwoMD+FAgBlmY8Z3v7
         dA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701063376; x=1701668176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AFU0GLwo+k9SYd7xhvDwdolRC+g7PfQjKlM2ZWM6J4A=;
        b=KHFj/V6K/uimfbSls3n+naqLfR31VYBPm4MOXhLFG0aecuBn4sERYW4jvFC6daD2MF
         qewWvVT+sGu9pkfNBr6mIXK5DwhbwQfyaPEXEItrHWyXJBi32FUJKLpmGpvUuw0ydAyH
         mIKeyXyT/xpNmsC/M76rdVkm93B4xhzY1NmERGdny22vAEJyAbF9n2erAZLeZpUwun5y
         aYk4N+LoO3/Dhf3+knriafM6SuYo2pmNAj/AQML1R4PSIvhqsUq3mVykF8A2lIrXHJtA
         gqaiv/kco52SnccWJJiLR5yvNobXsO0bQ2rPmLv3qt8ScNDkp0ydGKU722BX3Og952pa
         LOJA==
X-Gm-Message-State: AOJu0YzIBxo9CIVfiAAoRbUo4exv9QQaaXIrC8khDnitNmZM44VUcTWG
	i5Jjt9hZkSueYqxMxmoyAqSjrQ==
X-Google-Smtp-Source: AGHT+IEFOyrbmnp7bIhJ3IP23QwPEQsOt25ZXE9QHgMwmG9UQfY3KA3eqlvwwBcaYv6AIBT9jssIig==
X-Received: by 2002:a17:903:4d4:b0:1cf:636f:1bf8 with SMTP id jm20-20020a17090304d400b001cf636f1bf8mr15914236plb.24.1701063375758;
        Sun, 26 Nov 2023 21:36:15 -0800 (PST)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902ed0600b001cc3875e658sm7300465pld.303.2023.11.26.21.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 21:36:15 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 00/15] Staging: rtl8192e: Rename CamelCase vars
Date: Sun, 26 Nov 2023 21:42:50 -0800
Message-ID: <20231127054305.148276-1-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This Series renames 15 variables to fix checkpatch warnings.

Thank you in advance to reviewers
~Tree

Tree Davies (15):
  Staging: rtl8192e: Rename variable pTxTs
  Staging: rtl8192e: Rename variable BAReq
  Staging: rtl8192e: Rename variable Delba
  Staging: rtl8192e: Rename variable TSpec
  Staging: rtl8192e: Rename variable TxAdmittedBARecord
  Staging: rtl8192e: Rename variable TxPendingBARecord
  Staging: rtl8192e: Rename variable pDialogToken
  Staging: rtl8192e: Rename variable pTsCommonInfo
  Staging: rtl8192e: Rename variable TxCurSeq
  Staging: rtl8192e: Rename variable TsAddBaTimer
  Staging: rtl8192e: Rename variable DelbaParamSet
  Staging: rtl8192e: Rename variable pBaParamSet
  Staging: rtl8192e: Rename variable pBaTimeoutVal
  Staging: rtl8192e: Rename variable pAdmittedBA
  Staging: rtl8192e: Rename variable TsCommonInfo

 drivers/staging/rtl8192e/rtl819x_BAProc.c | 178 +++++++++++-----------
 drivers/staging/rtl8192e/rtl819x_TS.h     |  12 +-
 drivers/staging/rtl8192e/rtl819x_TSProc.c |  56 +++----
 drivers/staging/rtl8192e/rtllib.h         |   2 +-
 drivers/staging/rtl8192e/rtllib_tx.c      |  22 +--
 5 files changed, 135 insertions(+), 135 deletions(-)

-- 
2.39.2

