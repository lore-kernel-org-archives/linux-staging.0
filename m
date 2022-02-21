Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2D533F2
	for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 21:24:56 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id qk11so36518055ejb.2
        for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 13:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=Y1JYlQf0cbV473Kny9YeritOSb5hB/rSnw4GQZShC3Q=;
        b=TNB2qITSlYgiYr+NrsFSdyeIKKZnFomDDXCAVdXhOKnoiJQttR99eWxvPjT9lqs7fu
         GQ7azVQPkbPMdxg7xxnlrTAspCGQUqk2lWAEgeebwkq+Zc6JZ3FaT9+egL1Y2j9W4M8W
         IQxB5ttL3O54fsYCrkCO50aCAw0H4RmGpotK6tOaTjJkcisQ3+4rfJETXgsJ49tco27r
         AAsrMeL0vOefeJqHHy7fsJF82Qzdzk8olVIYShq56/K/QFJ+52wrjuv/AB75HTWzvQNt
         pybZredvmqmuhw97eyi8NV7BHd8AnXZFan4lRq3WUUlwtmqHjxc6qmI9aBw9mPcapWFA
         Jm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=Y1JYlQf0cbV473Kny9YeritOSb5hB/rSnw4GQZShC3Q=;
        b=6jl7g/po4Nte5lMRpMtc5NoB++hXIHC+ZUlLq7LBwtoX9ASgNLd5+kO6vXcRzkwjoy
         8z9c5HlayU6FOLs4Ab292dgE31E/JjSe/BccZbNfOIOuHFhAAfSonz94ucwdBxsbmznu
         Sh6R8Ea2FXuh1X48tiR0W3vG1z5HBqkhftNg4ah3bsp2lnjI6y257r3gTpL9RS6kgx+o
         fN5It6FhnhhtpMksTWqkPQN7mNNSahaS0nJTOY1v7yPxJdo8ul+5YyDiA1Xlc2mly8f4
         AKLHCN/f5hwIcSFO7tgi7/IO3wdYEMjsLNLNTr40Jhd8aSDdV0i2fgCN5eNIKtCq0DOt
         kKTw==
X-Gm-Message-State: AOAM530En4XIRV9+uSAZCDYYbApOyc6pR9IQHeYVaDai/5BVhbJnY+69
	KGGR8JyhQ0DpNWykuFYmx4gcMaNEzWc=
X-Google-Smtp-Source: ABdhPJzOI8p//Z8bDDgCYEB75hv0bCndKlwVXgeKcPIa6Ahh8fotgWMbQxfrUmus1TbSxwiwWWJW9Q==
X-Received: by 2002:a17:907:3c03:b0:6cf:65ec:5f28 with SMTP id gh3-20020a1709073c0300b006cf65ec5f28mr16811029ejc.324.1645478695187;
        Mon, 21 Feb 2022 13:24:55 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935aa6.dip0.t-ipconnect.de. [87.147.90.166])
        by smtp.gmail.com with ESMTPSA id z7sm5694468ejl.98.2022.02.21.13.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:24:54 -0800 (PST)
Date: Mon, 21 Feb 2022 22:24:52 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] staging: vt6656: Fix CamelCase, add comments, change
 macro to function
Message-ID: <cover.1645477326.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Various checkpatch.pl fixes as liste below
Tested with device VNT6656G6A40
Transferred this patches over VNT6656G6A40

v2: Patch #1
    Changed EN_CFG_PKT_BURST_MO to EN_CFG_PKT_BURST_MD
    Patch #2
    Devided into three patches
    Patch #3
    Devided into two patches

Philipp Hortmann (6):
  staging: vt6656: Fix CamelCase warnings in mac.h and mac.c
  staging: vt6656: Add comment for locks
  staging: vt6656: Fix CamelCase warnings in macro
  staging: vt6656: Change macro to function and moved to better file
  staging: vt6656: Remove ftrace-like logging
  staging: vt6656: Remove unnecessary line breaks

 drivers/staging/vt6656/device.h | 11 ++---------
 drivers/staging/vt6656/mac.c    | 14 +++++++-------
 drivers/staging/vt6656/mac.h    | 22 +++++++++++-----------
 drivers/staging/vt6656/rxtx.c   |  8 ++------
 drivers/staging/vt6656/wcmd.c   | 13 +++++++++++--
 5 files changed, 33 insertions(+), 35 deletions(-)

-- 
2.25.1

