Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E427A
	for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 16:31:43 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id 15so3095352pgf.4
        for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 09:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pw2gY9g3Zv3KXM6VXF/ImbqSLw84yB8cj4stx7YhQT4=;
        b=Ju5qlgtY8/ORpMVMvWLrQUKE0tSJ2+epFXYwkkXh//9V/x5KT+UTQ+HLWnOQEljHmc
         ijOcRsoETTaSM6WBdlwbtMm0y3ZxqsY5S5eeXQTtTwO1OPcPafhVktCVndjcXbM7kold
         v0JUjR5QZUZte3nUNu8g3h7ELaujPa2V4momOBvyHtGy3fJ3HfqyrUeiyWFlF1asfiUw
         9INuDZNbMQw5FviVOC4ErZR5KcMcpzGrfZDqSHtrSHed93CsVKtX6jS5PXW8u42B+PRC
         d1SySWGv1PlqGGDAx6eBgzpcG35cTiGdtyPIA1EgdFQVvixOBWWp2ZHig+tB9tcKQV2e
         BWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pw2gY9g3Zv3KXM6VXF/ImbqSLw84yB8cj4stx7YhQT4=;
        b=7M0iYFvjT76tld6zjxp14RhcgGzpFqJLfo0i+k7SsAdS4bS2TRr+MED7OOirlLY4QN
         BwK+4hrYi1I1/6079iR/EsnegM99Ky00q8lRmVsZgvUKDfwju3j5xloDFlLreWk+M0pr
         q/i3BBqq/4X/sWmz6958MS1LDuKCzK4stMA+DU9d701U4JD/vPv5xmT+pWSBfCiG6oc8
         iuSys6v/UEunKdgRu6UoKPdrCeZG/Sc9Pab+KmJwfI/lluHknnBO7CyrX4/5vQPXO4g4
         zs7manCfYHOmW8OFQXT7armQBa+vljaH0UUm90zs9lzo3MlRFVAXBnC9hetDbS1G5gIY
         KTwA==
X-Gm-Message-State: AOAM533FFIqw50JlL16pIr6smywU6eCsA/VnJddJxSX2coitGomeiCNP
	9J/YMyFj0pyzeFjazG8gwlE=
X-Google-Smtp-Source: ABdhPJw3IpC+QxPsTGZQJ6he+jsRJNc1Ee5RsRMr6aPMF9erOSofHzVJLWyUe1OK/Xhf0dzyGcCAVA==
X-Received: by 2002:a65:4c4e:0:b0:39d:21c4:2381 with SMTP id l14-20020a654c4e000000b0039d21c42381mr11988550pgr.566.1650817903265;
        Sun, 24 Apr 2022 09:31:43 -0700 (PDT)
Received: from makvihas.localhost.com ([2405:201:202b:15:b82e:45af:4bb0:4014])
        by smtp.gmail.com with ESMTPSA id i5-20020a635845000000b003aaba2d78c2sm7113472pgm.71.2022.04.24.09.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 09:31:43 -0700 (PDT)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH 0/3] staging: r8188eu: fix some null checks
Date: Sun, 24 Apr 2022 22:01:29 +0530
Message-Id: <20220424163132.37007-1-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some NULL checks which doesn't make sense. 
So either we should remove them or fix them appropriately.
This patchset fixes them.
Tested on Comfast CF-WU810N RTL8188EUS wireless adapter.

Vihas Makwana (3):
  staging: r8188eu: fix null check in rtw_free_recvframe
  staging: r8188eu: fix null check in _rtw_enqueue_recvframe
  staging: r8188eu: fix null check in _rtw_free_mlme_priv

 drivers/staging/r8188eu/core/rtw_mlme.c | 8 +++-----
 drivers/staging/r8188eu/core/rtw_recv.c | 5 +++--
 2 files changed, 6 insertions(+), 7 deletions(-)

-- 
2.30.2

