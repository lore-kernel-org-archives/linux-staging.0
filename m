Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F123BB37
	for <linux-staging@lists.linux.dev>; Fri, 24 Nov 2023 21:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="II2FI7pO"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a04cfeecb15so66101866b.0
        for <linux-staging@lists.linux.dev>; Fri, 24 Nov 2023 13:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700861418; x=1701466218; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6R1/B3Gpd0WqEyYMT6wMEe4jySl/wJKQezxM85rFgxE=;
        b=II2FI7pOHk3Qrl3OWgtCsoOCABRVHEKUYiBwBqsKELILXfbePUFoMHPTunnm10A5Wc
         Kfwy3DjBIQZ9/APb3fnc+YpYmjpAhoExJRAfQiVbQ68XoYgydei5hkTaf/ba72l+xKnB
         pOpTDxMDwnexTTw6CTYEUeFVahqbkczFn80bMuX10IYIZei6laiHWIiZRFqumJZRQfmy
         UmenNShgmWEUHr2Y0gc5wDEpV0goOi+R+AkbE9nVm5w8iVMaWIoUTxehe7R4Mv7XlPZC
         LOGo2Yfrv9077ZMkhcWbZq71m0htAt7CUW11WlUp+6GDqGOKM24t9nukkJ/V4RvA3RkD
         b8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700861418; x=1701466218;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6R1/B3Gpd0WqEyYMT6wMEe4jySl/wJKQezxM85rFgxE=;
        b=QljGiVIDytyqI8fNRc+8z/XWVtRqAiXFbDWbDGF9kZ4uyi8eFHDx2lozS3E/6cEDFH
         Wa1x4TD4NecnKhWpqphazgy8qlz37IzKfjhM7kPg62lE92osYzKvTlJ6KWg2GTWqKHbA
         g+goZFAmRPut7MsM6yyGKMNsR98K0pOkruJ+FWg79amo+0FXPQfZ3Y4Lb0H6UHr/7Qa7
         DdTene/wg/wu4OYCrH6aUU3fzOQKyKJ0ZEuz6eeX60+FwOBkrdUBzYiapdx/siEudZpM
         a47RtPlSLfN1CFbY3M9B2aAhX+3fWgvtHrokKgXDGxA79515/VDk3cFIH2JI7N7czBd9
         3+lg==
X-Gm-Message-State: AOJu0YzLbRMp+PQkYsrI+DvREZhK3XcvpdYIr1jot5nuE7jARh+/HI7k
	eH7fnZ1Kte16FgdZwaUvuXo=
X-Google-Smtp-Source: AGHT+IEWbmcnVqC9MkWPJSylBqhlInbTCWAcS/eX5prInruM0qp5xcSBhoChSK10CO9Z/PAWaWacpg==
X-Received: by 2002:a17:906:6dd2:b0:a01:ee03:37ee with SMTP id j18-20020a1709066dd200b00a01ee0337eemr3069238ejt.4.1700861417761;
        Fri, 24 Nov 2023 13:30:17 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id s21-20020a170906285500b00a0179ebc25esm2535720ejc.85.2023.11.24.13.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 13:30:17 -0800 (PST)
Date: Fri, 24 Nov 2023 22:30:15 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] staging: rtl8192e: Remove sending beacons
Message-ID: <cover.1700860758.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This driver supports station infrastructure and monitor mode. Therefore
it does not have to be able to send beacons. Remove all code with the
preparation of beacons.

There are two ways to time beacons. One is via an interrupt from
hardware and one is from a timer in the driver. Both are removed.
 
Tested with rtl8192e (WLL6130-D99) in Mode n (12.5 MB/s)
Transferred this patch over wlan connection of rtl8192e.

Philipp Hortmann (8):
  staging: rtl8192e: Remove unused interrupt for IMR_BcnInt
  staging: rtl8192e: Remove unused function rtllib_get_beacon()
  staging: rtl8192e: Remove unused timer beacon_timer
  staging: rtl8192e: Remove unused function rtllib_send_beacon()
  staging: rtl8192e: Remove unused function rtllib_get_beacon_()
  staging: rtl8192e: Remove unused function rtllib_probe_resp()
  staging: rtl8192e: Remove unused function HTConstructInfoElement()
  staging: rtl8192e: Remove function rtl92e_update_rx_pkt_timestamp()

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |   4 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  |  48 ----
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h  |   5 -
 drivers/staging/rtl8192e/rtl819x_HTProc.c     |  16 --
 drivers/staging/rtl8192e/rtllib.h             |   5 -
 drivers/staging/rtl8192e/rtllib_softmac.c     | 219 ------------------
 6 files changed, 1 insertion(+), 296 deletions(-)

-- 
2.42.0

