Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E343FC3
	for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 12:04:35 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id z4so22066123wrr.6
        for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 05:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0TkptHSvoyjCQEisDx9uEyo0ZmIqb3gk+9GGlP5MHlM=;
        b=i+kjTY2N8tJPsbKc6Led8NFV5ziB6zvieZn+TlOtdg9yR/c0riXLO91TzscPgxqdin
         OXgI2sEiR0MDPRccP/h8WJ1zalnN8jJx71B7OidOeKyVjYnIGg/eyp9I9d32f94CPHeg
         8bDFq7CTh+FD4ETCgon78Fy0NgGGYlE2Y8URshST9xCjiyIwR1uXpdVPwZ3swCzhVxQd
         m1RMDe+nY84j7BZ0XOdYLRAY4pCySruQrDEowx/Ipsuiz3nwAdE1whbWdEYkyJPV8BAe
         KSyrQjt7rIFL8++8wRZOTIEr64Cb4dtv7u0sr5MyB3j72jbgirZDYAukrRJkZ+th3E5d
         5Nlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0TkptHSvoyjCQEisDx9uEyo0ZmIqb3gk+9GGlP5MHlM=;
        b=g5hv2uyu/61rnBYJlNxxV2RKie9iVSebLKMKR3iaZc1ya3mHw+aqHivJMS4BMurNab
         UifGRBMQYRXMUJbt7S6UNAgahI7DzE2wckR6VzyhIyQrrlNCPu3a2t4LkBhg1nbhPFFz
         vP5N2Ck8dQAAtGDeL/UM7khegpd7E6d6pxddUEDfcnKFZdopC1zVApwOoMQovmItkjV+
         HXBWnwwJCYm6lwqT+MxkaZReLXEAHhz1cCpDoImTrM6NG2KronfpJtPhQlm0JfPWpzmi
         KshQHZ5zZdewV21AYZyIWhGACo4D+HOE4z9Xd5aCT7cUtiFKYrAWBMaR5u40oLpjMkXW
         sVUA==
X-Gm-Message-State: AOAM530zrevp9BlqcP2VVe/7Drl0sJvO2a5KLh5SKQLLhCl2A59t2/Ok
	ymz9qNqBGqj9QLmCFH7zZpI=
X-Google-Smtp-Source: ABdhPJyumtCqQ7rtPQ4iaxfHgjuS49AAfjb54Enay087+RlBwzs7gUWHUuyeLgfa6YbbSpAQWqp7xw==
X-Received: by 2002:adf:de09:: with SMTP id b9mr24931868wrm.314.1630325073759;
        Mon, 30 Aug 2021 05:04:33 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::16fa])
        by smtp.gmail.com with ESMTPSA id f18sm13184195wmc.6.2021.08.30.05.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 05:04:33 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/8] staging: r8188eu: refactor rtw_macaddr_cfg()
Date: Mon, 30 Aug 2021 14:04:12 +0200
Message-Id: <20210830120420.5287-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series refactors rtw_macaddr_cfg().
- use mac_pton() instead of custom approach
- use *_ether_addr() functions to copy the mac address
  and check if it is a broadcast or zero address
- assign random default mac address instead of fixed one
- clean up minor style issues

Michael Straube (8):
  staging: r8188eu use mac_pton() in rtw_macaddr_cfg()
  staging: r8188eu: ensure mac address buffer is properly aligned
  staging: r8188eu: use ETH_ALEN
  staging: r8188eu: use is_*_ether_addr() in rtw_macaddr_cfg()
  staging: r8188eu: use random default mac address
  staging: r8188eu: use ether_addr_copy() in rtw_macaddr_cfg()
  staging: r8188eu: add missing blank line after declarations
  staging: r8188eu: remove unnecessary parentheses

 drivers/staging/r8188eu/core/rtw_ieee80211.c | 33 +++++++-------------
 drivers/staging/r8188eu/include/rtw_eeprom.h |  2 +-
 2 files changed, 12 insertions(+), 23 deletions(-)

-- 
2.33.0

