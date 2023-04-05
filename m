Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A463779E2
	for <linux-staging@lists.linux.dev>; Wed,  5 Apr 2023 21:47:58 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9333b408ee7so6783166b.1
        for <linux-staging@lists.linux.dev>; Wed, 05 Apr 2023 14:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680731277; x=1683323277;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iehfqAb2+mLggzs2gHVsdI0okskRQgfHIl/m02R70JY=;
        b=dua4/AN7bMNF1xUf0vNDOYp3Q7eM8C514AFsYpdUZ1hu3mo+CojQH1Lmof+w1xDn+W
         k+Al0fnEDp2gxzbbYZsUvqW4oCweX+SpYm5O/lnAUrVsLCYWvYtyy73ldX1+dRFvxCRX
         MjuL280E7SOYpaAHlDwiRN+5/jUslZI0mJ3h/cl6XR+OY9XA0aHn9q4haZWo3/8tKoJ5
         MVciGlxMpHo0HE7tK01rCT9CEY389h9Ww/sN/VlFGn7tEE/cGwgmj5nb/2yHvFXg+Kox
         elsJ5EZnnjba/Bm949bhACuWYIm/qW7Bw20K2EYXAA2/UeCsyLGF8UXbM3hOx6U6w4Mk
         IFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680731277; x=1683323277;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iehfqAb2+mLggzs2gHVsdI0okskRQgfHIl/m02R70JY=;
        b=uyiPsC065N0ZvzBwuhbSlCL7172vG038Iz1GH7TfdedQDGxfPTGaYIF9Bzj+S6i0WB
         cnNjvhWlV3AGswWYRXFQE7nLCna56mdeFTLw809/5wPsq4qO+T8cwTCKyCvpGyBvFkIw
         cIqGR7sqVdsw9qaHNC8KFGASwsWM4ds4y4/5yFZEt4KWNnvh1arolb4ZuAaerLRiGIQt
         F1yLhwZZtfXvqChhj4hFXlfFdOpcjjcVQelAonEb52W2pMavHAvO9j9TG0NY5Att/imr
         4ZQNd2Heb2gwHMYtHTHJdqDlI2rugCuM0lyCByuiOCVFG75PnAXp2rT8M4qUoVy48U2x
         qacg==
X-Gm-Message-State: AAQBX9e3ViecSH89AUywiLtieBGErMfNKchSOoQk4TGGsa9Zo7UPkEOF
	JIV9IhoWxvFxdzI7FkqJVVg=
X-Google-Smtp-Source: AKy350Zzs6jn9VX0EaR/JVOLwxEruJGkn/HztJ6+kLrbv3qiyjK82l75KwxRCI6xahKLzdZgAKzMeQ==
X-Received: by 2002:a17:906:208a:b0:947:bff2:1c2b with SMTP id 10-20020a170906208a00b00947bff21c2bmr2756156ejq.1.1680731276603;
        Wed, 05 Apr 2023 14:47:56 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id sz22-20020a1709078b1600b00948da767832sm3573447ejc.152.2023.04.05.14.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 14:47:55 -0700 (PDT)
Date: Wed, 5 Apr 2023 23:47:53 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] staging: rtl8192e: Remove unused code for hardware
 rtl8192se
Message-ID: <cover.1680729715.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unused macro IS_HARDWARE_TYPE_8192SE and unused function
_rtl92e_dm_init_wa_broadcom_iot. Remove a double check for hardware
rtl8192se. Remove unused variables.

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e

Philipp Hortmann (5):
  staging: rtl8192e: Remove macro IS_HARDWARE_TYPE_8192SE
  staging: rtl8192e: Remove unused function
    _rtl92e_dm_init_wa_broadcom_iot
  staging: rtl8192e: Remove one of two checks for hardware RTL8192SE
  staging: rtl8192e: Remove unused local variable irq_line
  staging: rtl8192e: Remove unused variable RF_Type

 drivers/staging/rtl8192e/rtl8192e/rtl_core.c |  6 ------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h |  3 ---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c   | 18 +-----------------
 drivers/staging/rtl8192e/rtl8192e/rtl_pci.c  |  2 --
 drivers/staging/rtl8192e/rtl819x_HT.h        |  3 ---
 drivers/staging/rtl8192e/rtllib.h            |  1 -
 6 files changed, 1 insertion(+), 32 deletions(-)

-- 
2.40.0

