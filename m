Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019222C83
	for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 19:59:49 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id a9so13910431wrr.8
        for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 11:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KS6RiUdjt27X6hxnbtiq414OVvlBCUbwLO8x8hx0P1s=;
        b=bukNTslaLbTyX8iFzV5F5TWJT02FEphXZWHpNBgZ/ZK1A1EY7pfCurB+mfmQDV4qSH
         CLVFVTtr7/po8dxhK+z50u8gtDPOjD2Acngp51Cpxq8XJRQGbCj762dwqb1JaIPNxwiP
         JispjwHWannm9eVfj2xdTaMcU9HpSin/9ykIsF1MbLbPEBK2n+3h2E7xrTsnjXhREnXj
         0Ktl0gVUXPsEH4k8rMX9Tm0kxP3L5BSF3wZpR3TanzM8pTT5SCYV2Dk1fwpxVArZxNsx
         tyZfdWRbYRNyZUBmIxKzCbTxwLbFBb6lPqKeSjU2O7r+MsxOlpfL1NTCQy2zdhJeUvp9
         2/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KS6RiUdjt27X6hxnbtiq414OVvlBCUbwLO8x8hx0P1s=;
        b=4DlevhXktU5a94dcpY9fO0fhxpm/D2YZ/20FtAAoXaMAMlhtu0Rkqf0q/YVYpoSFOd
         CEhr/OVWqseqItTFpuhMyb5DCXPy10iAP9cHGyRyCknUfsSH78qnuVwc8P9h39hpqLi+
         W7Hc9KlchYVd96dBwmuQlk8TfBDOeDJGwECf54N4hhjGgcHHOGsAjR6MVxKsXtOH1F8E
         HfffHGZk4ToX4UgIhI5DRM5ZGpBgC3qgiJrlQMa3QY7lKS/eTnZQipJmrDFnpM7fABUQ
         WEJ46IDsDotJG6K1hdlxAqTINihx3Bpp3k1DqMCI/G+tTLPLEeup+b31eQ7D8zU74O+R
         o/sA==
X-Gm-Message-State: AOAM530K8atHeA7W5FL4+tQIDqvHRCHDVHLS51GVmHV6r5Q4kJ/wvEZF
	QknICstlkxG/AICHVHwySic=
X-Google-Smtp-Source: ABdhPJzVWBsdz8kAeieJkGYlcWhGTG0jVZNpZm7BxBhMr2004UwIp8hPzHFE2SuHkGVjfrm3n/n1Eg==
X-Received: by 2002:a05:6000:547:: with SMTP id b7mr9619488wrf.543.1637870388265;
        Thu, 25 Nov 2021 11:59:48 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ac86])
        by smtp.gmail.com with ESMTPSA id h13sm3762721wrx.82.2021.11.25.11.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 11:59:48 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/5] staging: r8188eu: remove more usages of rf_type
Date: Thu, 25 Nov 2021 20:59:31 +0100
Message-Id: <20211125195936.10060-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes some more usages of rf_type to get one step
closer to remove rf_type from the hal_data_8188e structure.

Tested with InterTech DMG-02 on x86_64.

Michael Straube (5):
  staging: r8188eu: remove rf_type from rtw_update_ht_cap()
  staging: r8188eu: remove rf_type from issue_assocreq()
  staging: r8188eu: remove rf_type from storePwrIndexDiffRateOffset()
  staging: r8188eu: remove rf_type from getTxPowerIndex88E()
  staging: r8188eu: remove TxCount from getTxPowerIndex88E()

 drivers/staging/r8188eu/core/rtw_mlme.c       | 12 +--
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 25 ++----
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c | 85 +++----------------
 3 files changed, 20 insertions(+), 102 deletions(-)

-- 
2.33.1

