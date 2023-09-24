Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BDCDDC9
	for <linux-staging@lists.linux.dev>; Sun, 24 Sep 2023 19:50:47 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-404800222d2so12729835e9.0
        for <linux-staging@lists.linux.dev>; Sun, 24 Sep 2023 12:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695585046; x=1696189846; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=STaVRB4lc8G7tgw1+DUtsUKKTjDKDxKdvDBHRRxCOFc=;
        b=cKJ6NBpSUvGwUkSZB8+G5ObqGXr+3rj4Ay9LwO4UWPP7k2sEjClUGyJ5MP6GPprQ4R
         2lNn+c/+jq3AM0y1BWVA23CduSFkmiTfmR5atfaa4RcosErD65GY77ITNqWuCoTBqOkc
         pOWrLQ5/D2PxehZqHWAvdF7Cr0palmonHazQasXF3IbXcaUCI37ZNortRgnc3UYU+aGn
         vTLJfKy56U9qzBvZ0w9tE40EqFFEa7Eb2D5Z9ozM7k3ANP/kMaXXOW2AT44lb6rlg8a1
         F9Tvtpx6OE6fiM9RLnTZTf0F1sKdcZGqpWBKEgV6v1lygKHDRmSp1M8jwxmHhasl3pvt
         NNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695585046; x=1696189846;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=STaVRB4lc8G7tgw1+DUtsUKKTjDKDxKdvDBHRRxCOFc=;
        b=bHUwXSEBniSqOvrGN2uY2pWz+XwLk4rRCuVbbbZyeCbDsjf1lbaCwkXL87Y5crg/h/
         TK6RBH/xrbhVk5dl8wyLMV7XI2rKfpp6rEjFd8eugHNbPQ4Yq0F4T/IwY2/uOTBH+/YS
         Gd8DF6alrkxbFJyztll5NO3CeIVg23rzInC3njAaAvwxbNlRTG5UCmdhJesaf2LoGXep
         ulWzPU2v5vWiJFCpCeK6lnX53weUfz8GkMhJaSiAtlOkl2ABcFTRq676lqK4KmcwfZKN
         yixKx+57bcdXq36xF3IcXQPCYfiRJGS6XIHHoYWhAz3ADFkYR9JrN7Tn0nYssQIUTBRH
         bI8w==
X-Gm-Message-State: AOJu0Yy6pDa8U9Hoe2efrZrb0ddnYqUPKn9PJtgUKSrBRS569s4bT54v
	tRd8h3slqL5u95rf9Lunf5Q=
X-Google-Smtp-Source: AGHT+IHRdmk85zhv60MYPeVIo9rWi4BpI30IilpE7ErS0jlbks2+ZQUTEAlWSagW+aW+xBtCseoZVQ==
X-Received: by 2002:a7b:c456:0:b0:3fe:d637:7b25 with SMTP id l22-20020a7bc456000000b003fed6377b25mr4755937wmi.0.1695585045408;
        Sun, 24 Sep 2023 12:50:45 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id hu23-20020a05600ca29700b003fef5e76f2csm2926177wmb.0.2023.09.24.12.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 12:50:45 -0700 (PDT)
Date: Sun, 24 Sep 2023 21:50:43 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] staging: rtl8192e: Resolve circular locking with wx_mutex
Message-ID: <cover.1695582999.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Resolve circular locking with wx_mutex, rx_pkt_pending_timer and
reorder_spinlock.

Tested with rtl8192e (WLL6130-D99) in Mode n (12.5 MB/s)
Transferred this patch over wlan connection of rtl8192e.

Philipp Hortmann (4):
  staging: rtl8192e: Put kfree() to end of rtllib_softmac_free()
  staging: rtl8192e: Remove mutex from rtllib_softmac_free()
  staging: rtl8192e: Unlock mutex for one line in rtllib_stop_protocol()
  staging: rtl8192e: Resolve circular locking with rx_pkt_pending_timer

 drivers/staging/rtl8192e/rtllib_rx.c      | 4 ++++
 drivers/staging/rtl8192e/rtllib_softmac.c | 9 +++++----
 2 files changed, 9 insertions(+), 4 deletions(-)

-- 
2.42.0

