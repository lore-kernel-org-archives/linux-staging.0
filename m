Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4B268
	for <linux-staging@lists.linux.dev>; Thu,  2 Dec 2021 19:23:17 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id x15so2307522edv.1
        for <linux-staging@lists.linux.dev>; Thu, 02 Dec 2021 11:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mfKnny9KVQR03wUe/TjPaew5YqnQrIYv/BbMYPEX/1U=;
        b=CoxXgjtTG7vUL/q8+NRIbn0VGZmAxln8NpMPooVqx6dUxTtA5LNnvJ6CvQEEfU/XgN
         T/Es89MqUKNbDKa6Qa41lXciCGiD9q5UTPU5eqrlIt4zj6xG+aWcuqFFhS1rxR8aJ4dG
         evnrYLdB8yzNvFBeab4A/sRU42EYUMu0+lPa3sVJohAP/neuSooib08JY8151BMTytx2
         5hYgEf7vlxvabIbKN7ZaT8IfX296tGIi0nwSjx6kzKUwRLWHlr5OdG9QF5AnorC0DdL/
         L4m+BSerUCFMXjLVcYRDmOZJCBgSbRQe18C3HgXBeoJ2S+BCfxohG7ZC+LZ09y0WS4pb
         TOLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mfKnny9KVQR03wUe/TjPaew5YqnQrIYv/BbMYPEX/1U=;
        b=3XNAsheJ3P5HcPwEqlKNrNUsZg3mmS/3aeXxgRacS/cGeobwfcF84kGKChJiKg1ZtW
         4B1MaLRwFa2Zy/MtF7GnaVI+X6RtJvbitfAijYBqcZTCqkLVue/UoYsbCiclJeb0W+id
         KGJegzkdQDBdT8t4zayzVDkeAJ6axUbQxSRw6Yas0nqRROCfKrfAYOBO83sWmecoukIf
         VacW98E0TQ7n+xr6QExPEPgebwBKdh1PIprFBOV19W9rQf3wd92qiWTqZSgFa4qITmBm
         t9o1fgiigSewJj4UVn6QuwvbOBlhP0B7ovqsrg+NotWmJTXfpyFIEFM4rsKZ95N+9WZZ
         CbiA==
X-Gm-Message-State: AOAM531aKEz1/4joVNqT+rH/FuW/8VCQlZ1bQWoqGkxSIBo4HTPDX5+Y
	V/wQ61c6w5uaIUSqQvpbe7E=
X-Google-Smtp-Source: ABdhPJx0GBFZgjEPftkpPHJx/kv1itUDZURNwpTtuuFx3Tv5mGeTKaS8rqdGaoe6xQbbZUieIOjgHA==
X-Received: by 2002:a05:6402:134a:: with SMTP id y10mr20120777edw.241.1638472996301;
        Thu, 02 Dec 2021 11:23:16 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::5a05])
        by smtp.gmail.com with ESMTPSA id jg36sm432530ejc.44.2021.12.02.11.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 11:23:16 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/5] staging: r8188eu: odm cleanups
Date: Thu,  2 Dec 2021 20:23:04 +0100
Message-Id: <20211202192309.9362-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes unused and some set but never used variables
from the odm_dm_struct structure.

Tested on x86_64 with InterTech DMG-02.

Michael Straube (5):
  staging: r8188eu: remove unused variables from odm_dm_struct
  staging: r8188eu: pbNet_closed is set but never used
  staging: r8188eu: pSecurity is set but never used
  staging: r8188eu: pNumTxBytesUnicast is set but never used
  staging: r8188eu: pNumRxBytesUnicast is set but never used

 drivers/staging/r8188eu/hal/odm.c         | 12 ----
 drivers/staging/r8188eu/hal/rtl8188e_dm.c |  4 --
 drivers/staging/r8188eu/include/odm.h     | 73 +----------------------
 3 files changed, 1 insertion(+), 88 deletions(-)

-- 
2.34.0

