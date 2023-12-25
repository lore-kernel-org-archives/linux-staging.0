Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F5853808
	for <linux-staging@lists.linux.dev>; Mon, 25 Dec 2023 20:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="ETYDQiDF"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5947cf2a4f6so776880eaf.2
        for <linux-staging@lists.linux.dev>; Mon, 25 Dec 2023 12:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1703535797; x=1704140597; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OdIPxbQKa8Cv8Owffg1R/sXrNLQmQN3H0nynm3esdh0=;
        b=ETYDQiDFoVAjF5w0mREZp5PxRpaIPmPsSjEGr0CnYgdq13H2wVY2Uxxs8h2k72UWPE
         DwqMx4xrRTG5/HKWkV8JxmrK/hIa6KOKTj8M/OM3twTVWJWCXF5vioG+eaOhLcb9qxGO
         KUBfz68niozfjTx8DxW9Vne5TtFrQ5yuRRhidFIaNN9OC+t2eV5ciDyQPCop8zRQxn8u
         DDTH5AdlEKFMTrh8CBjmqMcTK0daIwJTtmOjarjgDgURosfX+2paz8UxecAQ/hQFqbV3
         8k+0GjNBgN6i4SEX49Jw44mT1WPfQJEUMxKb02Ea7KAaKVk2qI926bO8OJocyX/WKcH9
         XeMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703535797; x=1704140597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OdIPxbQKa8Cv8Owffg1R/sXrNLQmQN3H0nynm3esdh0=;
        b=khxrXqS0FwWEKBRyGyBZUqE0jnu//MA09by0t7gW4zmiw3Ph3W7JmxCnsnyxIKYgbh
         7u2mad+l/BfiCWp+W0nh+83iguhkulkn5xpBC4pk6rEP3+/xqQK+I6hjOvmpGszbMywZ
         p1IjtxQVryD0dyFjM0yiwWt7+7q1vSsPvwR+B74cCHHdeONZUMkXfVv1fZ4ffEQe+ugs
         YFIuLcN5wwu2uQYmy4vIuCk4YbN6OnhWeEsQUdErFN9GiEbNuRBPAYu0/OzPvciDncFz
         BDuJfzc/gNyrb4aRBFK2Ys6rSEe5rmwacMoFl7r7ex1o6c434LpbpsoC0KpEbmRM0chI
         VwAQ==
X-Gm-Message-State: AOJu0YyRALF6drjXagIMtN9Y6S6Bl/eluMaGgtuhXTPovjXdnNJpPKtv
	4OgXSEK9pC0Brs88Y+Qn3J6bgXwbGec5rA==
X-Google-Smtp-Source: AGHT+IEQgsE+uywm+xiKRXj/Hjj5W83ncMof8v6BQFCHCmoQfiKQ1ESsELo0NiuzSk6j40Lm4ya9ag==
X-Received: by 2002:a05:6359:4c06:b0:172:f31a:6bfb with SMTP id kj6-20020a0563594c0600b00172f31a6bfbmr9053739rwc.51.1703535797423;
        Mon, 25 Dec 2023 12:23:17 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id l17-20020a17090aaa9100b0028be5732f01sm8741246pjq.0.2023.12.25.12.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Dec 2023 12:23:17 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 0/6] Staging: rtl8192e: Rename 5 vars/ 1 function to fix CamelCase
Date: Mon, 25 Dec 2023 12:23:08 -0800
Message-Id: <20231225202314.31869-1-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series renames 5 variables and 1 function to fix checkpatch warnings
Thank you in advance to reviewers
regards,
Tree

Tree Davies (6):
  Staging: rtl8192e: Rename variable bUsed
  Staging: rtl8192e: Rename variable NumTxOkInPeriod
  Staging: rtl8192e: Rename variable NumRxOkInPeriod
  Staging: rtl8192e: Rename function rtllib_EnableNetMonitorMode()
  Staging: rtl8192e: Rename variable bIsAggregateFrame
  Staging: rtl8192e: Rename variable OpMode

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    | 10 ++++----
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  | 24 +++++++++----------
 drivers/staging/rtl8192e/rtllib.h             | 12 +++++-----
 drivers/staging/rtl8192e/rtllib_rx.c          | 14 +++++------
 drivers/staging/rtl8192e/rtllib_softmac.c     | 18 +++++++-------
 drivers/staging/rtl8192e/rtllib_softmac_wx.c  |  2 +-
 6 files changed, 40 insertions(+), 40 deletions(-)

-- 
2.39.2

