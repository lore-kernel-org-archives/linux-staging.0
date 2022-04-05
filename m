Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B5A15A3
	for <linux-staging@lists.linux.dev>; Tue,  5 Apr 2022 06:08:21 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id bh17so24433763ejb.8
        for <linux-staging@lists.linux.dev>; Mon, 04 Apr 2022 23:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H+FPzuMqfL+tm7onrZD+j5++mLmXoOFcMmgPUGk3Dgg=;
        b=HqfJHEUxz7Jh21okwWtNTly5CHbQ34YwsbDZLIhIHStvCME4jMphgnuGqT9NBW5B0m
         +cEcOruD+Jq3s7B9jGCnSNSx8EXkAKeUUGqwSvwl1bwXcgunfwy7JXXKG1ovBxIP0IEj
         1ZsFAb6nJr1Yin1lMZ2wDf08EvuiptRMyUwlDOOmOU65qUgBCmaWB/WOxQMW1VGEaDbI
         mb5N/bQ69NwJNSob4ZnxgH38nAiI9iS0Y3nkIaoRs70G+Mel7W0EFYf8SK0HZYsV13aI
         sb1J3j6ixGr70bsjEsM0AYIaPD5pnx9mb4aIfsnUeBc0EiP8yS1Wko/ptYhDYDDX6HFq
         ebbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H+FPzuMqfL+tm7onrZD+j5++mLmXoOFcMmgPUGk3Dgg=;
        b=my4GsdZNaeUOACftMIVzYn7v0MQk4a2YHBYf6Xil86zG137Rp/3IWn23dagmZ1Z3HU
         tWEql57gr4B7Ow6cgyd0o1GFtrwfKOtp10lJ/f1hn/fVBRuqhPGDcPOspqLLTGR06EAj
         C7KxL3KujS4kKRSN1rNA4ln/m9yE+I3DVWPOGfnpGW54+pZQZSzl8jXs4OkJjBaDphE5
         eULMska03z1pc4PGvXIzELMPipyoaxpt+T0E2FbPt6zcX+qqvQm4fGLEWkb3QUYREKYg
         R56AvEtVOr4se706riWrwKSnLJbYU9bC/DFskQh1/7aQASoiXpAZXLP32CzOfKu+UDSr
         EWUA==
X-Gm-Message-State: AOAM530A/WFAbk0Mxw0PAoWwbd+F5eXDwPcFofUWncSRiMwcaYAefrvG
	/EEiTRac4x/ZirdvCO9Hvc0=
X-Google-Smtp-Source: ABdhPJw+PJOEI6KMp+/0TgB/6PgKs7K0Bmge8uh5Q/96ZPHjXF64+KGXEZeg0iT0hXR0L6PGRLuVXg==
X-Received: by 2002:a17:907:72d0:b0:6db:4788:66a9 with SMTP id du16-20020a17090772d000b006db478866a9mr1968057ejc.516.1649138899963;
        Mon, 04 Apr 2022 23:08:19 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id h5-20020a170906718500b006e7edcda732sm2484538ejk.125.2022.04.04.23.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 23:08:19 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 0/2] staging: r8188eu: remove ternary operator
Date: Tue,  5 Apr 2022 08:08:11 +0200
Message-Id: <20220405060813.8448-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes unnecessary uses of ternary operator that
explicitly set true or false and removes unused macros from
ieee80211.h.

v2:
- Do not remove ternary operator where the condition does not evaluate
  to true or false.
- Added patch that removes unused macros from ieee80211.h

Michael Straube (2):
  staging: r8188eu: remove unncessary ternary operator
  staging: r8188eu: remove unused macros from ieee80211.h

 drivers/staging/r8188eu/core/rtw_p2p.c         |  2 +-
 drivers/staging/r8188eu/core/rtw_pwrctrl.c     |  4 ++--
 drivers/staging/r8188eu/core/rtw_sta_mgt.c     |  4 ++--
 drivers/staging/r8188eu/core/rtw_wlan_util.c   |  2 +-
 drivers/staging/r8188eu/hal/hal_com.c          |  2 +-
 drivers/staging/r8188eu/hal/odm_HWConfig.c     |  4 ++--
 drivers/staging/r8188eu/include/HalVerDef.h    |  4 ++--
 drivers/staging/r8188eu/include/ieee80211.h    | 18 ------------------
 drivers/staging/r8188eu/os_dep/osdep_service.c |  2 +-
 9 files changed, 12 insertions(+), 30 deletions(-)

-- 
2.35.1

