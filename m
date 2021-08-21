Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AD83FC2
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 16:18:38 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id j10-20020a17090a94ca00b00181f17b7ef7so3019601pjw.2
        for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 09:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ujqwGhoXkAIsKqOBu+5AHyJrM+q7QtaKNKGeGWtsMP4=;
        b=b1DgIoDWfW00uQUDRWRZKNU3L0Ror2LLbFSuinu622OLVn5J53SU6MpUwO6xr6Epk+
         1xWa2xFfRhSa0Zh59p39aSmQrV/vUXySzE9WcSfAivb8zly7QyTM5HPG8EIjtKJeh3nT
         5EBElk2nMFah2h6/LbadWTL0vRcve6Iq7U6RzgKQcUmivlmPuzcPTTTBoXwkl2JW9bwq
         vg9Iq95MgLe+JmN5KrkPGOJ6TWW5nfSphH5bj9g/wXbdV+i8KIZ8A1z6MmasDd0td96d
         wDnCfvm16BccBBkICqV+noCtr1mKupsC+wIN9sAdAIbRlHHAdYUKGz7iVGFvtI9U3d58
         BsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ujqwGhoXkAIsKqOBu+5AHyJrM+q7QtaKNKGeGWtsMP4=;
        b=e334IuYUKaf5GJlGEQWReN1MYnivgSzvvTNBF96/f5vS+/wZ0dpMS7bH6HQDodsUi2
         3M88HJWtpQiZISUUSu5jSI68jDc+pVuCROY50w1gt1gPS16Fe3BodxzcKfhHaEWHw9pC
         HBnlIyqDFr4ynG8sudYUci4ITdFVVR0X4RcaGKSeOORO4PMAZJD9DJBgukFaZVBNrODB
         GdA4w4deYKcmmZRAfGuAvkM0+bSwGkvUAB4mzLojCzW80v3NMHaUiBJnIICOxg0G/k1x
         T31HCiSIPS2siew+LF6MMvCkdlwKaE4P5+RsF2I2hORmzIAU8IeveMW6yzDul8804a6w
         mQSA==
X-Gm-Message-State: AOAM531CBFnv6PB5mDBlrDJlr3tMHbX7a3tyGNu6zVB6KDdyRzc4kx1T
	s+37S3N232VxOeYdJxOoBnE=
X-Google-Smtp-Source: ABdhPJxRYFbfpkYRMA48a8AJFfKOOWjC/TSKs76S7gRP5rYRq6aWSOFSkL3TumD6KBYM51meilrFSg==
X-Received: by 2002:a17:90a:a791:: with SMTP id f17mr4188714pjq.225.1629562718477;
        Sat, 21 Aug 2021 09:18:38 -0700 (PDT)
Received: from xps.yggdrasil ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id y27sm4227011pfa.29.2021.08.21.09.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 09:18:38 -0700 (PDT)
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] staging: r8188eu: fix sparse warnings
Date: Sat, 21 Aug 2021 21:48:27 +0530
Message-Id: <cover.1629562355.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,
	This patch series fixes some sparse warnings in rtw_br_ext.c

Thanks,
Aakash Hemadri

Aakash Hemadri (5):
  staging: r8188eu: restricted __be16 degrades to int
  staging: r8188eu: cast to restricted __be32
  staging: r8188eu: incorrect type in csum_ipv6_magic
  staging: r8188eu: restricted __be16 degrades to int
  staging: r8188eu: incorrect type in assignment

 drivers/staging/r8188eu/core/rtw_br_ext.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)


base-commit: 093991aaadf0fbb34184fa37a46e7a157da3f386
-- 
2.32.0

