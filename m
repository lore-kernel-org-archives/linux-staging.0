Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4273D90
	for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 19:20:14 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id uk30so1522561ejc.1
        for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 12:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc;
        bh=EFbRg/nqcrMXwmvwVJAfLTwGOIkIy+h69qc0adusVBI=;
        b=c5nZCcAX3Mffi02JWCfgocLDuB/aJlOqDTWln6qMPcZ+Gxip48Z5JA9aMYBwkQ6clz
         EVn960uPpgSJUFRQY1ZW+uHQt580Z3zBVVBFvdt6T8+oHnoG3VZPuaQxNBX2M5NHNpEB
         ht1ZqAlOvQJmCkPyPDaXxSda6urPElHI8PpxTckJIkA168kHbcTlHuOJVlszTvmfR2o2
         k+zeequNl88Av7Wqjnz0Jv45SNN+e+15DSY3Ah5SC/pvua9beC3HM9zeubguFSyH28Iz
         AVD9VQtFccQ7/qY++62/wjV9q7RKK5jw+Lw1UKy6cWhjUG+GD249O8jNET1e2MMH8EZ/
         xM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=EFbRg/nqcrMXwmvwVJAfLTwGOIkIy+h69qc0adusVBI=;
        b=PAAUkE/H9PXOG9rNwzeNZ13lC0fQNlNwR4w1ZNs2Hj/Ouy1b2l2VnwUxBChkgPQ7D2
         EpR21abqpxn6UWNUUwE/jUBD+yTxDPm6kxMVqgPxT4M0wpUtAW8xgkbWrhkXBRcHpap+
         olOdQDb+ghKfDO7iKt90JjafTR1nyojPu69YPoiUe2A/K/qq/gbwWIg6Oz/4YiUAYT51
         vZKn55CnaoitLtmlRwTR4XUAFDJtrRJPGhpbqb4fj7tPJiKPTWY98a+XXTfI7rJasw1n
         3wOJa2qCHeTKsYajhpn1xc/iRpG2DbyTFZdprGudCNpLTo97586UFP8S/ox1oPILq5kp
         qgTw==
X-Gm-Message-State: AJIora918CkChx3lWnGhwAA8xn1pNTAljPLOa/y1PED0oejQDBHjSiiJ
	oCR11eo/xq4sH2wpNpQjTcE=
X-Google-Smtp-Source: AGRyM1tZapWpVJ/5Ytntxbfj3ZmPbpUqzirX59zV/WvbivUG4tdg9QJBYCgaNTcacf8Et/W8wvzt1w==
X-Received: by 2002:a17:907:7638:b0:72d:f11b:5ebb with SMTP id jy24-20020a170907763800b0072df11b5ebbmr7216032ejc.647.1659208813009;
        Sat, 30 Jul 2022 12:20:13 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id q8-20020a170906a08800b006fe0abb00f0sm3231656ejy.209.2022.07.30.12.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jul 2022 12:20:12 -0700 (PDT)
Date: Sat, 30 Jul 2022 21:20:10 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] staging: vt6655: Create one base function for four macros
Message-ID: <cover.1659192760.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Create one base function vt6655_mac_en_dis_bits_u32_reg with parameters for four multiline macros. Multiline macros are not liked by kernel community.

Tested with vt6655 on mini PCI Module
Transferred this patch over wlan connection of vt6655

Philipp Hortmann (6):
  staging: vt6655: Convert macro MACvEnableProtectMD to function
  staging: vt6655: Create one function for four macros
  staging: vt6655: Rename function MACvEnableProtectMD
  staging: vt6655: Convert macro MACvDisableProtectMD
  staging: vt6655: Convert macro MACvEnableBarkerPreambleMd
  staging: vt6655: Convert macro MACvDisableBarkerPreambleMd

 drivers/staging/vt6655/device_main.c | 40 +++++++++++++++++++++++++---
 drivers/staging/vt6655/mac.h         | 37 +++----------------------
 2 files changed, 40 insertions(+), 37 deletions(-)

-- 
2.37.1

