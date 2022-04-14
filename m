Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FE917C8
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 10:43:48 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id k23so9242232ejd.3
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 03:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KBg1gZpB+ya7NnVLqElXRH341atMJVXzfkwIYoZMBOc=;
        b=YXC9aU3c2gfEzEIe/nd8bLTlcAYArbguOw94TXK58jpSy7gS4KRyL+WOnPddnSe8wx
         cF1Jl/i/EN6R3V/5FaLaxgLyWDQxu+YpXGifKo/Okn9KmzHhN8BNWDEcTj7FRAkV4rFY
         KINM2I81dadhM0dMqj7aegFzFbF/ZCuMv99+LJplSCanGcjmUqPZlJ0s4S7mikqePrWx
         a/iw2upV1rXr46z/kzY8NeIZ46LBPFUWhztu5RbIhPGQBID65yB/CpQJf6VNbHX2M2yJ
         CPSK1SGowE+6z/gdTdkoFHc4A6+nzW4oqm2TRSd2iHlnV+J+KFmjGAau+pxasnstMnyR
         pWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KBg1gZpB+ya7NnVLqElXRH341atMJVXzfkwIYoZMBOc=;
        b=D6gxM/G5iRA1gKnJ3bV9Aatmf8k0CFl0xYzT27Kameu/SEQ4sy73GvqEj/s/LgBTaN
         2mvmzKmAcRE4mt5W/h0K5RyDDp4Z1bsiOMwlBDQ8WSxebViqpr5L+9+gDm8/vMbS68PG
         Q1XVjd6+VZAlBkcNxl/8F0yITMww3326bdqdIMotP8RnT0YRveapGuRQuS6BYxDzx6yn
         LoG6AVYiaQRh/y6bShNNLudma3UzjbcNUW79ozG3x8+/VI/a0aOVbAXCYkUImHZa71Kr
         RgT4Q87DpJKmE9xG7tfUprTWBA3zqbj5PBMqxCcMAX6MxAsWR3Ibu0s7wV+TsBn5jozE
         N5dg==
X-Gm-Message-State: AOAM533Edfk5GJzWfUD5ujHxoZ0LoOV/lRANn7/ZViTf9+HyIP8CWtdP
	pCz1S4UzjoTWfeDDh1yJREA=
X-Google-Smtp-Source: ABdhPJyIXbfMH1V00imxIlxsSBss6Q0tWUTrWkdG7SbeH0jr3NUeyB+x9KzEfjySaVgo76WJsqiknQ==
X-Received: by 2002:a17:906:58d6:b0:6da:bc08:af7 with SMTP id e22-20020a17090658d600b006dabc080af7mr1746311ejs.537.1649933026702;
        Thu, 14 Apr 2022 03:43:46 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id h9-20020aa7c949000000b0041b4d8ae50csm821318edt.34.2022.04.14.03.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 03:43:46 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 0/8] staging: r8188eu: fix and clean up some firmware code
Date: Thu, 14 Apr 2022 12:43:15 +0200
Message-Id: <20220414104323.6152-1-straube.linux@gmail.com>
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

v2:
Added a patch to check size of struct rt_firmware_hdr at compile time.

Michael Straube (8):
  staging: r8188eu: fix struct rt_firmware_hdr
  staging: r8188eu: clean up comments in struct rt_firmware_hdr
  staging: r8188eu: rename fields of struct rt_firmware_hdr
  staging: r8188eu: use sizeof instead of hardcoded firmware header size
  staging: r8188eu: remove variables from rtl8188e_firmware_download()
  staging: r8188eu: always log firmware info
  staging: r8188eu: check firmware header existence before access
  staging: r8188eu: check rt_firmware_hdr size at compile time

 drivers/staging/r8188eu/core/rtw_fw.c | 77 ++++++++++-----------------
 1 file changed, 28 insertions(+), 49 deletions(-)

-- 
2.35.1

