Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D6D4C7F
	for <linux-staging@lists.linux.dev>; Thu, 15 Sep 2022 20:29:57 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id z97so28655435ede.8
        for <linux-staging@lists.linux.dev>; Thu, 15 Sep 2022 13:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=J6g4J+gYjXd8OHWCzm+tXzp/795vOtzfgmy4dG6lLeU=;
        b=Qw3+cE33st4nv2CtQj/v2TRUZnQND1xzsKByP30WefXFUPe9J/FrN/zP69U4d/+rwz
         gRVzYTXK1qaVbO7+ZS2CVOoDvGXDcyFK4VrQ544RutlD38+j39tzNt9zmZ8dYSogJ1I4
         qI2CvdKpYQVS3Ig2Ee3dtjdxqgh9ntkVcTu5NefWpbJG/5MJKSzQK1rs/4A1U+M0wpJR
         2wowSWLnafMZud15464KUegsXrkwZNr4oOMtiNPu09LmpPr7zuFCwXBP+lhyiVjstxN5
         kDuC1aWUM2e9jOXW8Z3/9Iv2kuNlQ3neYNNwAbLEpgqwqMTQ8GqJTl62CdhqKXYL6I/R
         TnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=J6g4J+gYjXd8OHWCzm+tXzp/795vOtzfgmy4dG6lLeU=;
        b=zzHu3UzNN1QcB0lca9woWn+8uE6gFNImDCS5VcEP4KwC1YkyNbi4NqShJrqDbCg8EY
         IXSKveiTPtU9WFM2TX8EDkG0SUEQuGdkmxyINaFj5CmNtldEKMxUVBaikkpS3XG6BI3X
         yDJo13QnEjoBVd+pQpirOoMY1vx58ixlecJlnYYyn/zci6AHyE4x37OKPTQcWv8irZkr
         AsD146aW96R4tQYfyGycGspSsLfC6Ca/d77m+UBVELSM83pzWPyTD4zTU29drQgp+Tnl
         J65vvp1MYlbYMlMM5ND0xRc9IW9ee5XiiA2x2zod3w7krlhrb1G5HD+Aw9HvP5+WmUXO
         cK8g==
X-Gm-Message-State: ACrzQf0V9mgkASgCogl2mQZyum/P9j52FTxuUR1fKG4BmI64EBcAAr45
	DeJ8P+82lNpwScsegYCh81k=
X-Google-Smtp-Source: AMsMyM56mM/0EyLlbyS2sE9U0WxWKUevEa4qdXO9H3trLQUX/NR2nmRliblkBfDWAcNo4gGn/yAqgg==
X-Received: by 2002:a05:6402:51c6:b0:451:6379:81cb with SMTP id r6-20020a05640251c600b00451637981cbmr1334443edd.372.1663273796153;
        Thu, 15 Sep 2022 13:29:56 -0700 (PDT)
Received: from localhost.localdomain (ip-217-105-46-43.ip.prioritytelecom.net. [217.105.46.43])
        by smtp.gmail.com with ESMTPSA id ci25-20020a170906c35900b0072b3406e9c2sm9607295ejb.95.2022.09.15.13.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 13:29:55 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: forest@alittletooquiet.net,
	gregkh@linuxfoundation.org
Cc: namcaov@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [RFC PATCH 0/5] staging: vt6655: Implement allocation failure handling
Date: Thu, 15 Sep 2022 22:29:31 +0200
Message-Id: <cover.1663273218.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver does not handle allocation failure when receiving data very well.
This patchset implements better handling in the case of allocation failure.

Nam Cao (5):
  staging: vt6655: remove redundant if condition
  staging: vt6655: change vnt_receive_frame return type to void
  staging: vt6655: split device_alloc_rx_buf
  staging: vt6655: change device_alloc_rx_buf's argument
  staging: vt6655: implement allocation failure handling

 drivers/staging/vt6655/device_main.c | 41 ++++++++++++++++++----------
 drivers/staging/vt6655/dpc.c         |  8 +++---
 drivers/staging/vt6655/dpc.h         |  2 +-
 3 files changed, 31 insertions(+), 20 deletions(-)

-- 
2.25.1

