Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92253320E
	for <linux-staging@lists.linux.dev>; Fri, 15 Apr 2022 12:10:36 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id v4so9715135edl.7
        for <linux-staging@lists.linux.dev>; Fri, 15 Apr 2022 05:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6MMojV7I0m+iCYpeKkdRw9htRoG2xcIHZ+vtIiBqUTM=;
        b=oDrQo8EmtG21PYVImTfxmTgfMWQRJRiVSw1174+Y/StjDcUs6DPn4xOAT+eNYwjpU7
         HuHbZfcqC+mS+N2TGR4hIkexa4FZ7R65ZMfBtbp7bszUPzprBHXH7Hr+qxyRVa4TaV/9
         KC95wDaDx8tDa/iY/2YS4UrgTWGEwFnu3cfQEfq8wVXhgQS0SJuGPEyW4HAcG2WCBlME
         Uc/Qbkao15z//E8XarpJC3nYl647GzIHm3SOBpruYCw80lLqjInYs5X8eDfS+3HyC9p5
         y8TDEGyTuy2jmamCHP5+kjv8Husv9v9ZoD//riqj7gd0RsIvjBCVXuB+kIjNHg+Ecqsl
         K/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6MMojV7I0m+iCYpeKkdRw9htRoG2xcIHZ+vtIiBqUTM=;
        b=2o27IeyN8E4IMTdS8jhIXQvcqV38BJWZwHL8ph8sxdKSWedcOnsIud7Ne18RSLmyqc
         BztLRPCYIfFRkbR39jPEUxbd6pGCzO1OkZSwFVWXQ9AbBgrjSbhC9KuTc2OZw3rYhlkX
         lPPQjPuh80gTwhuxDXTi6+FUN7Yr1/WtiIfYvHN40s6GGnSmymD7PLoQ6hUQzOFA1cEi
         A+PKLISTR7sXN63EFVZiHOBvcRNKKwdInxiIJRpScR+nbUoJ3BxJ43SbGRPQqc7fCH/4
         Fl+RtkrGhkUc9X4rHE2kFw6Qixo+jewSqut7BXQ54F2y2UxMiAtYs7AyMkLXPUO+qHOY
         cysA==
X-Gm-Message-State: AOAM532ahaEpOBxsdMR8H0KKxZ4BFVFJN619irnGmjRB/zlbBAoJTxqW
	B5udWLLVN/QZ7smkWgS7x3I=
X-Google-Smtp-Source: ABdhPJytc1rjKlyqIrY1JgqT03Uzf9p61vob+8Mdub+Lggywy/hqzWtBxndQJRTr/042IMUKwN9fmg==
X-Received: by 2002:a05:6402:e99:b0:41d:11f2:85e0 with SMTP id h25-20020a0564020e9900b0041d11f285e0mr7857729eda.339.1650024634853;
        Fri, 15 Apr 2022 05:10:34 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abba5.dynamic.kabel-deutschland.de. [95.90.187.165])
        by smtp.gmail.com with ESMTPSA id z22-20020a1709063ad600b006e8867caa5dsm1626114ejd.72.2022.04.15.05.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 05:10:34 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 0/8] staging: r8188eu: fix and clean up some firmware code
Date: Fri, 15 Apr 2022 14:10:15 +0200
Message-Id: <20220415121023.11564-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes wrong size of struct rt_firmware_hdr in the first
patch and does some cleanups in rtl8188e_firmware_download() in the
other patches.

Tested on x86_64 with Inter-Tech DMG-02.

v3:
- Splitted the first patch into two separate patches.
- Added back logging the firmware version only once.
- Included the compile time check for size of rt_firmware from
  patch 8/8 of v2 in the patch that replaces the hardcoded size.

v2:
- Added a patch to check size of struct rt_firmware_hdr at compile time.

Michael Straube (8):
  staging: r8188eu: fix struct rt_firmware_hdr
  staging: r8188eu: convert u32 fields of rt_firmware_hdr to __le32
  staging: r8188eu: clean up comments in struct rt_firmware_hdr
  staging: r8188eu: rename fields of struct rt_firmware_hdr
  staging: r8188eu: use sizeof instead of hardcoded firmware header size
  staging: r8188eu: remove variables from rtl8188e_firmware_download()
  staging: r8188eu: use pr_info_once() to log the firmware version
  staging: r8188eu: check firmware header existence before access

 drivers/staging/r8188eu/core/rtw_fw.c | 79 ++++++++++-----------------
 1 file changed, 29 insertions(+), 50 deletions(-)

-- 
2.35.1

