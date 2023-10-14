Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C427E
	for <linux-staging@lists.linux.dev>; Sat, 14 Oct 2023 04:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="QY9zjino"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-690fe10b6a4so2291917b3a.3
        for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 21:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1697258393; x=1697863193; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IO5psIUHOcx6xz4P4p7pIE6VmBT0LrXpXuleTpT22S4=;
        b=QY9zjino+sPvPXu+zIN3HQWcTijoDA+9emer93JbBIrSPYuFeyzw5fmO+3azQFBqVw
         DYrbnCNoa3IeiBs9N+RWcXjfIN2+WXbZPKMr9/aKTKkaH6STjHE2u2mGY59xGV8/V/LH
         +fugMcVYgfCNztfsggZJicXYiGJWd8Bx+d8tzWumt6ctTXpTVqCsw2SjiK5LsaE+eSji
         3xr4wuS6/eIH/9VPyOZKAregSZwt6V8MQnywtAFoQMwp+gE8uHGJR3UC5E/EfoBGQYCW
         c9yL/Q9ne9Da+Y6VAqovrAwHOZJrUW4mtcsgyixFIPJr7Y89CYcRoCrw9VUKpVXozSsk
         Y/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697258393; x=1697863193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IO5psIUHOcx6xz4P4p7pIE6VmBT0LrXpXuleTpT22S4=;
        b=PHR6rPMTa8A6/RgTOl2DEA+6ji3z86o9FtW1tP66msiTSW7ogXc6g4uI+40g/VqiyR
         xQR7oqBaNxhnHv7tJsrAFWu04SvJSiV7+lFyE5MmQ1yQ5nLzVBUiDiKA7wNt/4jmxrFM
         PJc30z3vMXslUkK5Bl2wAenEIxBmCGXRQUPR+YavFVbUSDv6anMVHDgG9M52xyS150Cv
         TMxJeIkaBBmLES2ahOXL/Pp6KzXPSihUyqVBIE3Wpk/vP9k7I/JajupGiBNMMk+UOspx
         BnLH5lJH6NlCBfCEXudq9xK8Rx/Fwijzlv7D8o6bbA8x5FJrV3Zy25WxWV4eNMoZb7k5
         tiHA==
X-Gm-Message-State: AOJu0YyLFIZp9vEzJkTgjzqBxp/yVLMcHGjnv2kX1NJINoDKq6EEKXU4
	Yqkx+n0entP8xrVvQ78Lg/OWvA==
X-Google-Smtp-Source: AGHT+IGRvR1Vx+xE646Iq6UlDT5H7Zwh0/g1kuIgt5ZArE2J5BNx1z/XkRa7LXessGSx3qbjOqGicQ==
X-Received: by 2002:a05:6a00:1989:b0:68f:e121:b37c with SMTP id d9-20020a056a00198900b0068fe121b37cmr33741447pfl.4.1697258393451;
        Fri, 13 Oct 2023 21:39:53 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id y6-20020aa78046000000b006934350c3absm14271926pfm.109.2023.10.13.21.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 21:39:53 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 0/4] Staging: rtl8192e: Variable renames to fix checkpatch
Date: Fri, 13 Oct 2023 21:44:31 -0700
Message-ID: <20231014044435.11947-1-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series renames 4 varialbes to fix checkpatch warning Avoid
CamelCase.

Thank you in advance to all reviewers
~Tree

Tree Davies (4):
  Staging: rtl8192e: Rename variable pBa
  Staging: rtl8192e: Rename variable TSInfo
  Staging: rtl8192e: Rename variable ReasonCode
  Staging: rtl8192e: Rename variable pTS

 drivers/staging/rtl8192e/rtl819x_BAProc.c |  58 ++++++-------
 drivers/staging/rtl8192e/rtl819x_Qos.h    |   2 +-
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 100 +++++++++++-----------
 drivers/staging/rtl8192e/rtllib.h         |   2 +-
 drivers/staging/rtl8192e/rtllib_tx.c      |   8 +-
 5 files changed, 85 insertions(+), 85 deletions(-)

-- 
2.39.2

