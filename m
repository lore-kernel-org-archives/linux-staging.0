Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0434D17E9
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 03:21:25 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-68fb85afef4so422825b3a.1
        for <linux-staging@lists.linux.dev>; Wed, 20 Sep 2023 20:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1695266485; x=1695871285; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qhhsMMDhQSZIy566QGTwti8rilWTQdvE2G3gWQD5Qks=;
        b=iSphQo8UQRbhMewvQ2CUSjqrFPL7fkIS+LFJk9tcvgXkyNTUKxaV8PEgsuT/p3ZYic
         xRTji5ttsuhUZ4/vE0mBSJd9yCr7yIBbLm2fTp8+UWLq7D6VxQq3lvq/RnTKTKxzYgPM
         +h1pv/Kj2h7pmA56YrJ0re5pMhFzUGLxAODe1/mbhHIZBuHkFyxzDhmDBtocSRdc5Mx1
         sejNhwEv13LFcYow/cM9H3+gqTLC/6FuVL2KKcotySDunwlwwy3XjPIpMukuVZLLwDvm
         v+7r3WhLkuyL0KTPmZ3uoEEKUHAi4uqi4egEKja1+6OtAgxqfLBRI7BhG/quXX49eRP3
         Yf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695266485; x=1695871285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhhsMMDhQSZIy566QGTwti8rilWTQdvE2G3gWQD5Qks=;
        b=CiArTZbFBb+ZLlMPJAaR8uDxgQYbp1h1WeH2EooEkBLundsWk3NROV7Q3qJIKmijQV
         4GtiLM8qG/BvxCr2/8QY7li6CldU+3JWIVwakegLL4lbc3/67YPoC3qrTsNYqqVguRH9
         2qkjpMa9ZWjmgdnHZSPiByIRkE0veQEG5OwRSEbWNMCWBc0v72hmtoVvmtjFuj/Ghy45
         VMSqp7L+Hthod/36kzUPSUMDI+vNuIqXbBzzBT9A+XpRYduxBLxsA+E01PvcOzL6txl8
         X2rtgcQUX2XA0KVczmV+ge5z2SFcsjzvFYPc/A03l0vlV3y/QOsA5R3dqxLwfKSf1/fp
         /d6g==
X-Gm-Message-State: AOJu0YzQa2CKrNtHPWtqMHgckNy6qFgfbm5Aisv8er2ps2sHhKK2HASZ
	4xvBaSN84CCDh75cXMC+nic4ww==
X-Google-Smtp-Source: AGHT+IGGT/F8gUARgyincCxZ2iNYBJvBvEjQ22OUCDRfBrm/wh9EI+6L84NqgYuwEmURClbgfJC01w==
X-Received: by 2002:a05:6a00:9a0:b0:690:d413:ee0f with SMTP id u32-20020a056a0009a000b00690d413ee0fmr5388825pfg.2.1695266485075;
        Wed, 20 Sep 2023 20:21:25 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id p14-20020a62ab0e000000b0068e49cb1692sm237324pff.1.2023.09.20.20.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 20:21:24 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 00/11] Staging: rtl8192e: Function and Variable rename series
Date: Wed, 20 Sep 2023 20:25:04 -0700
Message-ID: <20230921032515.96152-1-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes 11 checkpatch Avoid Camelcase issues throughout the 
driver.

Thank you in advance to reviewers
Tree

Tree Davies (11):
  Staging: rtl8192e: Rename variable Time
  Staging: rtl8192e: Rename variable pAdmittedBa
  Staging: rtl8192e: Rename variable pPendingBa
  Staging: rtl8192e: Rename variable Dst
  Staging: rtl8192e: Rename variable pPendingBA
  Staging: rtl8192e: Rename variable Addr
  Staging: rtl8192e: Rename variable pStatusCode
  Staging: rtl8192e: Rename variable Policy
  Staging: rtl8192e: Rename function GetTs()
  Staging: rtl8192e: Rename function TSInitialize
  Staging: rtl8192e: Rename variable StatusCode

 drivers/staging/rtl8192e/rtl819x_BAProc.c | 74 +++++++++++------------
 drivers/staging/rtl8192e/rtl819x_TS.h     |  2 +-
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 36 +++++------
 drivers/staging/rtl8192e/rtllib.h         |  8 +--
 drivers/staging/rtl8192e/rtllib_module.c  |  2 +-
 drivers/staging/rtl8192e/rtllib_rx.c      |  4 +-
 drivers/staging/rtl8192e/rtllib_tx.c      |  4 +-
 7 files changed, 65 insertions(+), 65 deletions(-)

-- 
2.39.2

