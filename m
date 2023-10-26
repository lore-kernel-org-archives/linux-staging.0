Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7F4DDCF
	for <linux-staging@lists.linux.dev>; Thu, 26 Oct 2023 05:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kv4lhYxY"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-507c188c529so156333e87.0
        for <linux-staging@lists.linux.dev>; Wed, 25 Oct 2023 22:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698299009; x=1698903809; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZDrfNzJFy46QmelTeNDlluLSuWGgn7i99bhsTcEDtjI=;
        b=kv4lhYxYIq4Xk1aBwRo0lxAum5VW1d7GcGxPDXn7e5lFkiy9EfNt1WOEmbH4fBrKHi
         +baC/jC3mQtQ2iUbcuA7v3tWgX5KDaEndbtX7lDR+g7u2K2HrUCUgQnDw7Mmc/6iziw6
         1am2LPU0OxJAuOAasala+uBbefNfEXnS80hIcd3jGHs5d+EMD2WmXLP0I8byEphJbCDe
         9AF/n86AmhXoFRWhj4upw17RYbSxcmiWv3/43u38Dr215utNmFBGSzYRMaDs3FkFbjLA
         AOSgzpGvncLgI9QypQRhZxDdXiSjyUYVC+miufeqNS4laBHP6QFaViCCei6F64qZH0K8
         Dqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698299009; x=1698903809;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZDrfNzJFy46QmelTeNDlluLSuWGgn7i99bhsTcEDtjI=;
        b=NGWlqthlrcKnou2CteYLqqEW/ms96ahhIhNAgrYJfeDM6ILocyI62Obv3ujOE3gyBJ
         08F2aTO5k5I9TceTnJqp89vARUHJCxAEZUlWT0vsZSsxFQwLQ6nxVX23ttfkml7CP7tH
         zh3b3aq7QhrqxY9rFB6TeYDNJscEdD2kIGU4kZBNwaA3U6e3Ah7DhMxHQzRI0QvW9KCn
         UuaDt7fQJZpveQMB3bEAzlsh3XO+ss+ACZUnto6s14Xf7ibnSY1/2Ox/UhT9A0OeAa7C
         0QAgO2iFDs89gY+hQ0PHNSHd1ek4gz1osigxGBSESK5jyq49zE2sfOoghO8SSFnUfIYT
         xRFA==
X-Gm-Message-State: AOJu0YwUFAxTM5rRzJSzVQVeD0KWPQ+YO6bjytAYlxj7fBvHhmr482Ig
	M9DwWrCvkNj/FyAVY0XLG+w=
X-Google-Smtp-Source: AGHT+IGeR7SZkubWeLWD1BuxNOZShZptn62n6yLXEXds7HHclU9x2fXX3/21XC0OsqU+oGQQd3l7Dw==
X-Received: by 2002:a05:6512:3a93:b0:503:65d:50c6 with SMTP id q19-20020a0565123a9300b00503065d50c6mr11832855lfu.4.1698299008632;
        Wed, 25 Oct 2023 22:43:28 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id e13-20020a50ec8d000000b0053e775e428csm10605787edr.83.2023.10.25.22.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 22:43:27 -0700 (PDT)
Date: Thu, 26 Oct 2023 07:43:26 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 00/10] staging: rtl8192e: Convert array rx_ring[] to rx_ring
Message-ID: <cover.1698295861.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove some functions that always return false or zero.
Remove a loop that is always executed one time and convert arrays to variables.
Remove some unused constants.

Tested with rtl8192e (WLL6130-D99) in Mode n (12.5 MB/s)
Transferred this patch over wlan connection of rtl8192e.

Philipp Hortmann (10):
  staging: rtl8192e: Remove HTIOTActIsDisableMCS14()
  staging: rtl8192e: Remove HTIOTActIsDisableMCS15()
  staging: rtl8192e: Remove HTIOTActIsDisableMCSTwoSpatialStream()
  staging: rtl8192e: Remove HTIOTActIsDisableEDCATurbo()
  staging: rtl8192e: Remove loops with constant MAX_RX_QUEUE
  staging: rtl8192e: Convert array rx_ring[] to variable rx_ring
  staging: rtl8192e: Convert array rx_buf[][] to array rx_buf[]
  staging: rtl8192e: Convert array rx_ring_dma[] to variable rx_ring_dma
  staging: rtl8192e: Convert array rx_idx[] to variable rx_idx
  staging: rtl8192e: Remove unused constants starting with MAX_RX_QUEUE

 .../staging/rtl8192e/rtl8192e/r8190P_def.h    |   2 -
 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |   2 +-
 .../staging/rtl8192e/rtl8192e/r8192E_phyreg.h |  62 +--------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  | 131 ++++++++----------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h  |  10 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c     |  37 -----
 drivers/staging/rtl8192e/rtl819x_Qos.h        |   1 -
 drivers/staging/rtl8192e/rtl819x_TS.h         |   1 -
 drivers/staging/rtl8192e/rtllib.h             |   1 -
 9 files changed, 67 insertions(+), 180 deletions(-)

-- 
2.42.0

