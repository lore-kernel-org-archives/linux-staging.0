Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41DA72
	for <linux-staging@lists.linux.dev>; Wed,  8 Sep 2021 23:10:15 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id u19-20020a7bc053000000b002f8d045b2caso44289wmc.1
        for <linux-staging@lists.linux.dev>; Wed, 08 Sep 2021 16:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FUNSeceQctNpOtv7NxFjjx9adbKFkGaFzjaK9/lF9t0=;
        b=BYvtVaktqt3K7oTwqBwBpTYQzLL3zGuHTPp8DNHdfH/VllkaptRMyRQUTE9MfBx7Mx
         KDFg3PMZwsmWUuC1VgH87KszujVckGIib3H5gZVend6ObY0PRgxgagAplD/3EYUf7COU
         w6wb+P1VFxzQC9d9sqsFs1WOqIF7C5gYSYa72dG3YCz1DnEiBrpPQOHr0F/ME9vW60Kq
         50TGwzjeuD3lSJ4iI+3qHdbPPZSBAsXqSr7erjHZNxzhCwYbTZBLACVforLxXyUtAvB9
         omg7M4UFaeMAQrhbOAoUE9hnxSRQxFPd0oVOlIJ600Htro/C52rG0bLub0iHwDaGy2x6
         czcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FUNSeceQctNpOtv7NxFjjx9adbKFkGaFzjaK9/lF9t0=;
        b=qlb5RoUc/0SU3Qa61/c2RzBbyIr4VX9COuEzf6CYwBUpCV6YQMVx7m3hDywZMgpqzn
         Ud8VrVDcA7NbHpHnkmZFBbNG+UmKgeo30MlJGqvu6krBlKxYl7Y4QVa2wL3APqTxTgPJ
         FsJmhgmmNxC078B7eHD9dFnGEG0xM2NCpLiPuG50LBJuEME0GmuUOOpypIJw56PrwwLK
         UsVY/HAGx/lJdMvFXi2CyZkLPXVpO357dTN+cgNtLHHgRipLreOAlcnRBOn+SW7IPx8p
         hoJRocKoMvKbtSSlwhXxokzrEhAwsuoHJXCieqBG/Wrf8qU+pPtXiNYB8Tu2ax3x7XMo
         lY+A==
X-Gm-Message-State: AOAM531npowg9poiIT9O3IFU74zfjSfXvLZUoohQmN7RXuns3gCICnXV
	Xat2+Xwhm+Q9aP8vPHwwHlA=
X-Google-Smtp-Source: ABdhPJyE8KVuqMh21000QXanMwVC7iyKkyF9ooc4XvHiAWRiffM6xGojB7eBWfI/xG9K/Lv0TOh54A==
X-Received: by 2002:a05:600c:4e93:: with SMTP id f19mr5821303wmq.185.1631142614209;
        Wed, 08 Sep 2021 16:10:14 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id l21sm348393wmh.31.2021.09.08.16.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 16:10:13 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/2] staging: r8188eu: remove unused functions from hal/odm_HWConfig.c
Date: Thu,  9 Sep 2021 01:09:51 +0200
Message-Id: <20210908230953.16931-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes unused and empty functions from the file
hal/odm_HWConfig.c.

Michael Straube (2):
  staging: r8188eu: remove unused odm_Init_RSSIForDM()
  staging: r8188eu: remove unused ODM_MacStatusQuery()

 drivers/staging/r8188eu/hal/odm_HWConfig.c     | 12 ------------
 drivers/staging/r8188eu/include/odm_HWConfig.h |  9 ---------
 2 files changed, 21 deletions(-)

-- 
2.33.0

