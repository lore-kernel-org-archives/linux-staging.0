Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44412CA1
	for <linux-staging@lists.linux.dev>; Sun, 30 Jan 2022 11:12:27 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id u24so20776945eds.11
        for <linux-staging@lists.linux.dev>; Sun, 30 Jan 2022 03:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fBqhdQDBJRGoBLP7N57YtbXFLEg4i5iAZLmqRoUPvx0=;
        b=dXIOQfjcCa9oro1DdBhyRD2GfQlKwq8gWPz/p4iWbpJM0ZEEHpoJzS1yTMgqBXRjwk
         1OIjFfyMSJOgAzZ/FoVjf6dTxMiMMi2Mma/QAwPmSJ98WqDxf+bGw9QxmegVp8oU+d2W
         uyYphjUt+0PzOvNjBjuSYUwTQNCXBL7fRRSASVevBQj5jAxeKhGIrjmNOCcb6j5Iqjrp
         NOYoN80lz2ychKggU/s5WUw3aTxtH4JRQb0xmey2FlHxapZIE/inGyLPtq91ubNsijk3
         wdaeA5QiazGsSV6/06HCWHebPNTb+KDPGoVKWr/Hhr1NNfAhAMckp20DK0pMKWJHY33t
         iI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fBqhdQDBJRGoBLP7N57YtbXFLEg4i5iAZLmqRoUPvx0=;
        b=HsCQh26qJZbHu8PYzm6Hh0OZjq99INDbdvR9Loibq5IMW6h1V4mCdQ0EbsLn4lr4k1
         jkpkRnsuQCbZYYXIDyDVhgV/dIq+fCfxSqioL/nd81mje1RNRazKDX39xY9heaJEvM67
         qIM0o0yN7XwW5fZMMd4S2aZJV2tVwerbePt/0wo/iZZa7l6UOFQhl2k0hYspmJ9zPVGz
         6VbnI75WvgX9sqwJUhKhW3H/Ot0o7yeeoWfDABNR4YnMHj5kWuxEE1fdPnPxlvHFRwZY
         YIYmLv3mKkGMOMTAeerOdBPU/gaomdToTft0dO4MjfvNYJgMwrISg3G6Y6l9cfbjT7MM
         NtjA==
X-Gm-Message-State: AOAM531xgikuxIYIFWA2odQzJv9LCQeW9uD1r4tMoCP5MJTOqkPs4+GC
	MAPKAcHSKZ1L8B5F2P0tHco=
X-Google-Smtp-Source: ABdhPJwj6gVPg5wkvarYkfHovH7XPab80gbraUv3eTCbmjY1Pf0pKANgFAdGYaVsEDIzdwqDu2gZfg==
X-Received: by 2002:a05:6402:2c7:: with SMTP id b7mr16530788edx.217.1643541146085;
        Sun, 30 Jan 2022 03:12:26 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb5a.dynamic.kabel-deutschland.de. [95.90.187.90])
        by smtp.gmail.com with ESMTPSA id nd9sm12129510ejc.169.2022.01.30.03.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 03:12:25 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/3] staging: r8188eu: remove two wrappers
Date: Sun, 30 Jan 2022 12:12:16 +0100
Message-Id: <20220130111219.6390-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This set removes the wrapper functions c2h_evt_clear() and
hal_init_macaddr().

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (3):
  staging: r8188eu: remove c2h_evt_clear()
  staging: r8188eu: remove unused parameter from hw_var_set_*
  staging: r8188eu: remove hal_init_macaddr()

 drivers/staging/r8188eu/core/rtw_cmd.c     |  2 +-
 drivers/staging/r8188eu/hal/hal_com.c      | 12 +------
 drivers/staging/r8188eu/hal/usb_halinit.c  | 39 ++++++++++------------
 drivers/staging/r8188eu/include/hal_com.h  |  3 --
 drivers/staging/r8188eu/include/hal_intf.h |  1 -
 5 files changed, 20 insertions(+), 37 deletions(-)

-- 
2.34.1

