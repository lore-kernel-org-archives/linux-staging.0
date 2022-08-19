Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36CD2C9D
	for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 13:50:24 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id x21so5754215edd.3
        for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 06:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=ZgX6jdvBhV2Y++t5rSQiAxJFF+Lv/REHFFRciLPQA3g=;
        b=p9qLO9IU4C+bXeIBFkgmM0bmivY2RTNsQbXiEGI7ChVegQZy7XEmzOF90+wDKAQlMI
         CktLvXLPekO4ehUNoDHKO1CGyiSAJpeuFLxvHsYunecK5cIiw/o/doMTHTbRjJ8RTtuo
         yLreXK9VBHEEZAcOSW0AH81OVqgcovbxeCoq3ovm6ydNMM90kYrd383VAoqpUrBDJBvJ
         kfaXUm+GRS/lGGxxOgzlw5uma/rM3Uwit5+EENXZRuF9Bp4IItdHTmAgNxeuklS7sS5D
         fq5D7hGrUv5XcPdG3L5yOPUJXJ5Z4mu6l+XRn0VqycXVNzrifc2U6rkTGzdkYe1ZR+fH
         dOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=ZgX6jdvBhV2Y++t5rSQiAxJFF+Lv/REHFFRciLPQA3g=;
        b=kHKgTWKXkONI6foteK8ySpPH1p4lx30O7NvWR718Qpws3JT4QKtN5ATBWE2oNLEcmO
         sl7GcVPSBv7NVnaaPdlru03fBjXicOUF4l0y1pcYYvxDQfdiXRg0mO0Ob+8EHPMnkEV3
         FpFVV1Oz1lNDHFbtsXtM/vWwFL7ojB+humneznnU+H+SxP7BKJ4I6laJ7vsoDOcZYuy1
         8R0YV2tGVzojn2fWEpzx2IpinbjyfA7n6hKY+3zKd+XSsaou+SWa4JmCZq8JRVwoFzYW
         chMGOwVMo9wvBEd/h6eTNNSaBar6fYLi6LC6NVZDQMbKifJuNWMJ7arJtbGFKwgmP8ca
         uqKw==
X-Gm-Message-State: ACgBeo2ZPHoquT7AckImQcFT0yxsvuHk4Ee9RCChXpXa2McuCCXpRPx/
	cp4zDHuLrYN4s/g9I+4kM8w=
X-Google-Smtp-Source: AA6agR52xXbSQg1P6N21/poLhCvNJJl+djZ9g/YfAgBWWXesc5ikEGCUc4ePWlv/EGa8DU0x/Zq2bw==
X-Received: by 2002:aa7:cd78:0:b0:446:49f4:1c0f with SMTP id ca24-20020aa7cd78000000b0044649f41c0fmr1829636edb.342.1660917022992;
        Fri, 19 Aug 2022 06:50:22 -0700 (PDT)
Received: from nam-dell.ucebne.fiit.stuba.sk ([147.175.148.17])
        by smtp.gmail.com with ESMTPSA id i8-20020a17090671c800b0073087140945sm2313821ejk.123.2022.08.19.06.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 06:50:22 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: lkp@intel.com
Cc: Larry.Finger@lwfinger.net,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	namcaov@gmail.com
Subject: [PATCH v2 0/8] remove some dead code
Date: Fri, 19 Aug 2022 15:49:34 +0200
Message-Id: <cover.1660916523.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <202208192018.BfgiZyOY-lkp@intel.com>
References: <202208192018.BfgiZyOY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove some unused functions and variables.

Change in v2: add a new patch to fix kernel test robot's warning
about unused variable.

Nam Cao (8):
  staging: rtl8723bs: remove function rtw_odm_dbg_comp_msg
  staging: rtl8723bs: remove function rtw_get_ch_setting_union
  staging: rtl8723bs: remove function rtw_odm_ability_set
  staging: rtl8723bs: remove function GetFractionValueFromString
  staging: rtl8723bs: remove function IsCommentString
  staging: rtl8723bs: remove function rtw_odm_adaptivity_parm_msg
  staging: rtl8723bs: remove function rtw_odm_dbg_comp_set
  staging: rtl8723bs: remove static const variable odm_comp_str

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 21 -----
 drivers/staging/rtl8723bs/core/rtw_odm.c      | 79 -------------------
 drivers/staging/rtl8723bs/hal/hal_com.c       | 55 -------------
 drivers/staging/rtl8723bs/include/hal_com.h   |  5 --
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  1 -
 drivers/staging/rtl8723bs/include/rtw_odm.h   |  4 -
 6 files changed, 165 deletions(-)

-- 
2.25.1

