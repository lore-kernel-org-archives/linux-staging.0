Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44D43214
	for <linux-staging@lists.linux.dev>; Mon, 24 Apr 2023 18:03:53 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-63b35789313so3551166b3a.3
        for <linux-staging@lists.linux.dev>; Mon, 24 Apr 2023 11:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682359433; x=1684951433;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T1NUtVt3knB/HcXq8IIUhsyBrwMDib57ziNBiOWDoTI=;
        b=CkeLkg5KKm0VfGJuk5lq/38olMkTW7PTeFFmDiDckPTrlzJgywQfut52O+UPNqV1A9
         K5KaXcu5BLzfG9x1VwslhDrA989OPGEx4MvEcr8joRS7ofdpZUuViB0NlLjWps00q/9I
         a6f77xX+CHYg0L5KwLa/L6MNUI6c3mYdjBVQnrxHNiI15oM5yo81MsoyIZ8OVsmWgR+G
         yquL/JyhEvfFifD1iLb4KPUDtf8ntADaWP2l8YJ8bj5T4MZSg0Vihn6RuBY4AysV6Yw/
         qnPzWbTQpjrRHhm1Mqt6+BDa23GOZlx2fGdXSXuglm+76iqK9TQ0HMhY47FLZCD4oTLF
         XOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682359433; x=1684951433;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T1NUtVt3knB/HcXq8IIUhsyBrwMDib57ziNBiOWDoTI=;
        b=Dfvzn104eYTpWMlD42JeTIGXQ0ugD/zZHcwJlcXYXhuSVC2bpvrUZxn+nyziIuiKKO
         w3woehhY+/IWexetLrZy2sFTUgS0YxQ5gHiH792PYwRPmU+Xa0UlvAftB7/mFU3ai2+S
         +Lo8J7v8JaG3MMHe+NB85Xye8So9TXBb2h0w8BZYobouqVRnWgYUpCgsC9KFVKwprslf
         qPCHJ/k2dqlRMAe/6e77ACv3F2wRpATNH22iTpNplr0RAZxsAGF8GBPvZHDpdbeqBgax
         janbb1Ok+IY05eDNrt0MoUOJqlAajEatne3Q/gXGkv+w86e35o6Db75Ir6lqT4gyxbgw
         plew==
X-Gm-Message-State: AAQBX9cli1IWm3jD2clto1ynVMWhpBfcBrY9psXWGKZw5vDsPyPgH6CF
	cM/J3feL9XW3LdP1K2l+P5o=
X-Google-Smtp-Source: AKy350ZA91Hw7jALmRYigNL9sAR+S2RLG796GhOl37Oju8SnrS+eaj2ZhA4j9lhMUwSNn+CXqlijYQ==
X-Received: by 2002:a05:6a20:1449:b0:d6:91f5:2b10 with SMTP id a9-20020a056a20144900b000d691f52b10mr17617976pzi.58.1682359432995;
        Mon, 24 Apr 2023 11:03:52 -0700 (PDT)
Received: from pop-os.localdomain ([103.251.210.208])
        by smtp.gmail.com with ESMTPSA id x185-20020a6286c2000000b0063f00898245sm7948417pfd.146.2023.04.24.11.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 11:03:52 -0700 (PDT)
Date: Mon, 24 Apr 2023 23:33:48 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/4] Remove unused rf_set_sens variable
Message-ID: <cover.1682358035.git.yogi.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The rf_set_sens variable is declared but never set, so it is always NULL.
Cleanup the unused rf_set_sens variable. Remove functions
_rtl92e_wx_get_sens and _rtl92e_wx_set_sens which always returned 
error code after removal of rf_set_sens variable. 
Cleanup unused max_sens and sens variable.
The patches are required to be applied in sequence.

Changes in v5:
    1. Rebased onto latest staging-testing branch per feedback from
       philipp.g.hortmann@gmail.com

Changes in v4:
    1. Split changes into patch series per feedback from
       gregkh@linuxfoundation.org

Changes in v3:
    1. Fixed description to fit within 75 chars
    2. Added suggested tags
    per feedback from philipp.g.hortmann@gmail.com

Changes in v2:
    1. Removed function definition rf_set_sens
    2. Removed usage of variable priv->rf_set_sens
    3. Removed functions _rtl92e_wx_get_sens and _rtl92e_wx_set_sens
    4. Cleaned up the variables sens and max_sens used in these functions

Changes in v1:
    1. Fix comparison to NULL of variable rf_set_sens

Yogesh Hegde (4):
  staging: rtl8192e: Remove unused rf_set_sens variable
  staging: rtl8192e: Remove unused _rtl92e_wx_get_sens function
  staging: rtl8192e: Remove unused _rtl92e_wx_set_sens function
  staging: rtl8192e: Remove unused sens and max_sens from r8192_priv
    struct

 drivers/staging/rtl8192e/rtl8192e/rtl_core.h |  3 --
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c   | 45 --------------------
 2 files changed, 48 deletions(-)

-- 
2.34.1

