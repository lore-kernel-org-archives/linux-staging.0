Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF527A
	for <linux-staging@lists.linux.dev>; Sat,  2 Apr 2022 07:29:19 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id k23so6675945ejd.3
        for <linux-staging@lists.linux.dev>; Sat, 02 Apr 2022 00:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=VIsazpZqnc9Y6800sSSLJKWoimkfCmom/y4Xr16gegk=;
        b=bsCXpJ6tYDHiHBqAzfmVkNECsspN+abP0vlSk+dBDHGL1Mat8nUzWD5iSJI0hMv/rz
         pNpn6zwq1HUHAgISc73i7IBhz9Gixzf/uaCDxHNvqwE+giMbaoaZVLMjKH4jEzNJ4Sc9
         Ol6lEIw6iUhBhsM8mNKeSxH45VtBRr7ZIpeykAjLrdgUTJTdHGT+lq93Q2AokOr0em14
         Crlt+QAv8PdaURIUZBbwDGEsWwL4PLafw4uElDUO3R4xgpIOcJx8o0nCFDQJz7k5i/3K
         /4+RIFcikVKwdNJmeOZ1WVhTH2ZLX7XodYQYLOFQTKPybRIL0wYxLedD0ndyJm2hWbRJ
         vlFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=VIsazpZqnc9Y6800sSSLJKWoimkfCmom/y4Xr16gegk=;
        b=n6vXunkSqw4DaMg7egF/yeRpy7REDIywepseg/0d2I6A3DEttLLFAHeVee8JizRKeR
         cTulCkRfX+0tVXiXI3RdIcClDsFopqffX+TyfHrA4VYzkwq/0r19bB9g6WC3nXwJ4tac
         WN6vt3Hxqecw6JZSSK+uGt9Dv+ObDqISr8V4B7vff0lJ3+Lru4opm1YuDNQIxigl8HkQ
         nhlO59Dvn/4P4uhk/RzxlDvJnBDuZ+Gxb7Xk2r8FXRgsmbHDU5mTdT5gbhH5Q1sTtSce
         shj2vM3Hgq7DGf/3QPOcfsjjLHqh5VzCaVtCpk+Hn+v39CZbVAenbpmJowyjSMArSWti
         NDcQ==
X-Gm-Message-State: AOAM532xHqIc6TQBPh7LAo5APFZaYvyNCE+1Ks4wJSAUpi5+JG39BdaL
	EBLvKDa5wYDCostUN6Fki9o=
X-Google-Smtp-Source: ABdhPJxHqaCaMIYZnIwWusSw2HTc8081FvcxjQRcWNnDBAEjpeQOfCI5ZjGnaUAAklQu/Y505Rks5g==
X-Received: by 2002:a17:907:6d96:b0:6df:f199:6a7c with SMTP id sb22-20020a1709076d9600b006dff1996a7cmr2889889ejc.137.1648884557355;
        Sat, 02 Apr 2022 00:29:17 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a074e9.dip0.t-ipconnect.de. [84.160.116.233])
        by smtp.gmail.com with ESMTPSA id n9-20020a05640205c900b00418d79d4a61sm2148118edx.97.2022.04.02.00.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 00:29:16 -0700 (PDT)
Date: Sat, 2 Apr 2022 09:29:14 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] staging: vt6655: Fix CamelCase in upc.h and started in
 mac.h
Message-ID: <cover.1648882847.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Start fix CamelCase by
- removing macros
- renaming macros
- converting from do-while(0) macro to function

---
Tested with vt6655 on mini PCI Module
Transferred this patch over vt6655

Philipp Hortmann (7):
  staging: vt6655: Remove unused macros with do while(0)
  staging: vt6655: Remove unused macros with CamelCase in mac.h
  staging: vt6655: Rename constant definitions with CamelCase
  staging: vt6655: Rename macro arguments with CamelCase
  staging: vt6655: Rename macros VNSvInPortB,W,D
  staging: vt6655: Rename macros VNSvOutPortB,W,D
  staging: vt6655: Convert macro PCAvDelayByIO to function

 drivers/staging/vt6655/baseband.c    |  16 +-
 drivers/staging/vt6655/card.c        |  60 +++---
 drivers/staging/vt6655/channel.c     |   4 +-
 drivers/staging/vt6655/device_main.c |  30 +--
 drivers/staging/vt6655/mac.h         | 293 ++++++++-------------------
 drivers/staging/vt6655/power.c       |   4 +-
 drivers/staging/vt6655/rf.c          |  14 +-
 drivers/staging/vt6655/rxtx.c        |   4 +-
 drivers/staging/vt6655/srom.c        |  29 ++-
 drivers/staging/vt6655/srom.h        |   2 +
 drivers/staging/vt6655/upc.h         |  47 ++---
 11 files changed, 186 insertions(+), 317 deletions(-)

-- 
2.25.1

