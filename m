Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168958BE5
	for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 15:10:04 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-51a4044b7a1so4439774a12.2
        for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 08:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687187403; x=1689779403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TD4KyJwmLcyQbc53eDQ3FoSu3CT+Si3hOoe+8Vx8cGw=;
        b=E2uiSvQQAPNHpBZb32RR72MmOJ6cKYumOcMuiSSVUg0phsA8mhm1pa9jSx9Hym4aqc
         dYzd61eMBJQA14d9tlDoucGBDk8f5JwGn7ZskCn1AY+nb3hqjXYfZJsXLpA3ma4eALcP
         zD0lPTGeG1jvkMjNMeZUhcKupkB/HcEvIuYQtas3WzWqjbJjE+Hx61XlalfQmc94ADnv
         1fobQVhO4TqzYCffSHQepxZGsOhCqqnAGYWcHv+UvaGIVh7cfNLduTLysoqLDecCtXvS
         hbe+Jbc3XsqZAIm/xhxmnQAkFU7KFxpm0iMktt20glCsN7BbGKwApP7mlH2DJ/zQcl4S
         JbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687187403; x=1689779403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TD4KyJwmLcyQbc53eDQ3FoSu3CT+Si3hOoe+8Vx8cGw=;
        b=YSMT/jw4H9Zc3fszKU93LLBrMoIUYuFRrJ0sW7vxB0TZ4YGb2WopgrK/EsHhgqADSX
         xkzMTKnGVpLAiSz22eF8br+cgHRUk1PPHhA/4pKYaFQJM0Qh31kr2ttCcj47GIBm0FCH
         /9o3iq/fr/rSLyQRarRmXL8U8xApT/WsHf6ER07vclQHwqjy9BxaNvxUroPhBJiBqm8C
         t7UU8iuOchkogxinAkqz7uX/HIrd/JOjm6kzPcCq7Ymoy+jiCLcTLFKKmfOhwFf0LcJS
         mfl4Jvl4gyeLfhih2s4XLbJCccg6Oa9b1kQSZJeT2bKytw42HuHY5Uq6dYWUDjAM7lCK
         jJYA==
X-Gm-Message-State: AC+VfDxazXTpARtS7UksGiKVRRCG+S8gDWKNqwn60vaZe1bVxI1WqBBd
	DmC56GxC7Eu5IQR7OfchUYE=
X-Google-Smtp-Source: ACHHUZ4lv1LI1EaN8I+nHnwhvD+Z4VbBsYtpegX2mQ62GMDa0k2hbDRPqmcdVIfQdtS802sW8rXNkA==
X-Received: by 2002:a50:ed83:0:b0:51a:2c69:5c74 with SMTP id h3-20020a50ed83000000b0051a2c695c74mr7097975edr.37.1687187402901;
        Mon, 19 Jun 2023 08:10:02 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abbd5.dynamic.kabel-deutschland.de. [95.90.187.213])
        by smtp.gmail.com with ESMTPSA id p6-20020a056402044600b0050488d1d376sm13297186edw.0.2023.06.19.08.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 08:10:02 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/4] staging: rtl8192e: some simple cleanups
Date: Mon, 19 Jun 2023 17:09:49 +0200
Message-ID: <20230619150953.22484-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Four patches with simple coding style cleanups.

Michael Straube (4):
  staging: rtl8192e: clean up brace coding style issues
  staging: rtl8192e: convert else if sequence to switch
  staging: rtl8192e: remove return statement from void function
  staging: rtl8192e: remove comparison to true

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  3 +-
 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    | 11 +++---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    |  3 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_ps.c    |  3 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c    |  6 +--
 drivers/staging/rtl8192e/rtllib_softmac.c     | 39 +++++++++++--------
 drivers/staging/rtl8192e/rtllib_softmac_wx.c  |  4 +-
 7 files changed, 40 insertions(+), 29 deletions(-)

-- 
2.41.0

