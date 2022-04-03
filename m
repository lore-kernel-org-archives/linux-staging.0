Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C617C
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 10:37:24 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id r13so14410318ejd.5
        for <linux-staging@lists.linux.dev>; Sun, 03 Apr 2022 03:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9qI2Eo7TPlccJ8aRd/LC71d9pVHYGJmUGf3GK2xFlsg=;
        b=VisdoheX0ezHOj0eWVSwSXfjEJWDQGhOtzi47hdsY3QsrBz6UTtLy9rmEfoVKDQ5qG
         RMuydcQuuka3mXjiHPCpSg1UNQKfibkAW6abyWuYDpV/PNMPowQPLVyVxvYqg5gkmQYb
         Stuc5Elwl2H7uN4E2cx5RVf2rgNiMZXNdekWgv1Oz3/9BrEMhMNOEiAhWTra6YQInaPo
         zRh1AEKoByo8H2cUmvU0iPa6AfJdFqteUVFjFuw1wOuCxxlIuW9CJ0nJQSlATNgnd3kf
         gFggjYrmNl/QOeHtSFMavEc6o/xjnDAF4OV/tS6LyiW1YAVvXaaTYxgfWYMdU1WKFoNL
         PNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9qI2Eo7TPlccJ8aRd/LC71d9pVHYGJmUGf3GK2xFlsg=;
        b=aGvM8x29KJQxg/+c7Hmix4WXMJ/uTk2ueMsVpmJ8EJ1gImy0Ziw0ZGSUcjqSf0t2Di
         q4Uc93PK3H1o8FhxORNzGEPNj8fOCP4jIVmFULdspCyGzXwglNAmdON5e3jiInyVQegY
         KiFmpRGiCdsWeQ/UtQpL3Zs+PsPyXSre+pvrlsUuwMrhFjdbRpmLaUzEogNflYh4NioR
         YO1Uahrsw+Lc6/xZwTrkMNSOLZ33fCoj2/HBvXtICyqOKdYxhOatiabYBmmbcIvN9s1Q
         GENEDF2cFWCZx12jXDKEX+2plriq5ET5+jB4a/bz70P10tUoq5laKog+zTFBTGfnaWSe
         nypg==
X-Gm-Message-State: AOAM530sQ9He1XFbCEkF3UpD6zHbUg4RQLsVbscxXA7OqcBFh8uH3tEj
	gpqPnclEoc+uxiey6MEOEi9IO5dOUUA=
X-Google-Smtp-Source: ABdhPJylypQBQl7Hnw52f7R/ThO7f5sS4AWczy7vYV9j/vcZjMjiH8jmUXuVfhuP5g8HkLP6SKgf8Q==
X-Received: by 2002:a17:906:5d0e:b0:6e0:2cd5:a87c with SMTP id g14-20020a1709065d0e00b006e02cd5a87cmr6694253ejt.708.1648982243041;
        Sun, 03 Apr 2022 03:37:23 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id kx5-20020a170907774500b006e1382b8192sm3130751ejc.147.2022.04.03.03.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 03:37:22 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/4] staging: r8188eu: remove macro rtw_pwr_wakeup()
Date: Sun,  3 Apr 2022 12:37:09 +0200
Message-Id: <20220403103713.12883-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes the rtw_pwr_wakeup() macro. It is actually just an
alias for the _rtw_pwr_wakeup() function and can be removed to simplify
the code.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (4):
  staging: r8188eu: remove unused parameter from _rtw_pwr_wakeup()
  staging: r8188eu: remove constant parameter from _rtw_pwr_wakeup()
  staging: r8188eu: remove macro rtw_pwr_wakeup()
  staging: r8188eu: clean up comment for rtw_pwr_wakeup()

 drivers/staging/r8188eu/core/rtw_pwrctrl.c    | 14 ++++++--------
 drivers/staging/r8188eu/include/rtw_pwrctrl.h |  5 +----
 2 files changed, 7 insertions(+), 12 deletions(-)

-- 
2.35.1

