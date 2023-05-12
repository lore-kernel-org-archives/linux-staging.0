Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E855D2F7
	for <linux-staging@lists.linux.dev>; Fri, 12 May 2023 10:07:00 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-64a9335a8e7so4469323b3a.0
        for <linux-staging@lists.linux.dev>; Fri, 12 May 2023 03:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683886020; x=1686478020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NkLNdeDn6hMP5F0r+T8wUttQQ19WSpWtWoPCipbjjYk=;
        b=C2+j8v8rPTIb6HnSvnFUQwRZ66d3mXZZSmgIfsh6FVupo5JbwYPTQxueQITyQhUyTE
         XwDGChK3UNv+U1yJxKtNWgdNH59S1wnnb41F5rM5S4lZGFGbL2Vk0EgF+rzxZJydj74u
         d6Jk4j0yuBZn+Ia57JZxzq1D7JXICpZG03MRJhZD+dcsewY1jruPow6YZRNSFRaCJFsv
         6x+yo/3iVJhPuv/fvu2hMT0F4OrD+DWMCuLCPqt0Fzygq/E9VfhsedqCVUDYddgRWsw9
         vV8dxqqeq9tItBeaKZfHNLW9omhOjhh1aTduDjMAKPQv2LssIWhToyNxoodHXrI/tdwF
         BbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683886020; x=1686478020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NkLNdeDn6hMP5F0r+T8wUttQQ19WSpWtWoPCipbjjYk=;
        b=hvLCQK77VWqBpa7t+AUOul9bBQWV3acujg7bEsapyjzemQmG6Y/Lim+jT6G9TmOg/L
         2EI1olMS0UPaVo4nwkT0+1N+xceV2qUas/UiBl6utQWFniHGvS0Erd2ne/q9Dex8U1FV
         zsofQLgFd8ku9nDInEG1EMh0f/qsH8EhBRsxfA9ztI+/Je9eMQr531LbegcSM1Ot3geW
         LdPkkr1VDLyVPhGnxRxMoujvP+D/UAt8GtTn5cLf8Uv9AENBtcH3KJt8tC2aQ9FcMlVz
         0nbwA/L9HOgOb0Ne4E/+1UQ8fGUJIffF1voWEmndW7DSpQLCpHIAFJe8UsF/5lWzwKPY
         eVmA==
X-Gm-Message-State: AC+VfDzU3WFnBY3SPkxv5ajVrCARA4okKtGGMK6lAzIg7njSWjcBdJR6
	HzFKTlmUaE4rXk+5amcgwTE=
X-Google-Smtp-Source: ACHHUZ6aNdgEG2xNAjNjCSF7H8MeFm2CvViH4BalJUiUcf1A7xoIMDscaLxs+Ef+R6vxs1eys44OGw==
X-Received: by 2002:a17:902:da92:b0:1ac:94b3:3ab4 with SMTP id j18-20020a170902da9200b001ac94b33ab4mr15640725plx.27.1683886020395;
        Fri, 12 May 2023 03:07:00 -0700 (PDT)
Received: from debian.me (subs28-116-206-12-58.three.co.id. [116.206.12.58])
        by smtp.gmail.com with ESMTPSA id k25-20020a63ba19000000b0050f93a3586fsm6141726pgf.37.2023.05.12.03.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 03:06:59 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 762BF106B36; Fri, 12 May 2023 17:06:54 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux SPDX Licenses <linux-spdx@vger.kernel.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Linux Staging Drivers <linux-staging@lists.linux.dev>,
	Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
	Linux Kernel Actions <linux-actions@lists.infradead.org>
Cc: Diederik de Haas <didi.debian@cknow.org>,
	Kate Stewart <kstewart@linuxfoundation.org>,
	Philippe Ombredanne <pombredanne@nexb.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Airlie <airlied@redhat.com>,
	Karsten Keil <isdn@linux-pingi.de>,
	Jay Vosburgh <j.vosburgh@gmail.com>,
	Andy Gospodarek <andy@greyhouse.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sam Creasey <sammy@sammy.net>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jan Kara <jack@suse.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Simon Horman <simon.horman@corigine.com>
Subject: [PATCH v2 01/10] agp/amd64: Remove GPL distribution notice
Date: Fri, 12 May 2023 17:06:12 +0700
Message-Id: <20230512100620.36807-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230512100620.36807-1-bagasdotme@gmail.com>
References: <20230512100620.36807-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=865; i=bagasdotme@gmail.com; h=from:subject; bh=BnhAyHqAAXZPpElC1S7AamhQL42pHpYqVocWHPx47Os=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDClx/NO3Lfyz29rtyKsS8//3lktmcG+LcrlZPfXRzne6r BeWG8sf7ihlYRDjYpAVU2SZlMjXdHqXkciF9rWOMHNYmUCGMHBxCsBEpksz/E+ZHn/97Pa1mcsX SRe79U8LfWr+1jyuJsSJ9dwmz6+TtfUY/ilqCr+WT7wnuHO1tmnp0jLPvboarTN8C/QeXSxye3Z oLw8A
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

There is already SPDX tag which does the job, so remove the redundant
notice.

Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Simon Horman <simon.horman@corigine.com>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/char/agp/amd64-agp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/char/agp/amd64-agp.c b/drivers/char/agp/amd64-agp.c
index ce8651436609fc..b93b0f836e52ba 100644
--- a/drivers/char/agp/amd64-agp.c
+++ b/drivers/char/agp/amd64-agp.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright 2001-2003 SuSE Labs.
- * Distributed under the GNU public license, v2.
  *
  * This is a GART driver for the AMD Opteron/Athlon64 on-CPU northbridge.
  * It also includes support for the AMD 8151 AGP bridge,
-- 
An old man doll... just what I always wanted! - Clara

