Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E14A2C84
	for <linux-staging@lists.linux.dev>; Tue,  5 Oct 2021 20:57:07 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id k7so1724171wrd.13
        for <linux-staging@lists.linux.dev>; Tue, 05 Oct 2021 13:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VIhiZko/HdZRRX8wV8ISQub/+SSvOguPPMhdzz4lBsI=;
        b=F55aWN7B0tWVyyqkDpMB35S/HuZ/y5OfbQ3UQB86GaKfqZ0py0u1QrjhhAaQlThy4E
         7pnNICzzoTMcEH/JSoPXF9/irnPwwIYUZnGEI3gHwajirg7f1fuOpZTu6DTXVaEiMKQo
         n8W9FQN64cwQL//MQGkX/m21WXAQapWmu2EGeWy+peRf6oIwe21TMwNhtRL5GyAUE4LH
         YhDa4SGn0WzrWXbQtkWYw5s7+5MoVLIxdxhDrhmJv3flJJSeaJneEG/vwJN/dbTVHhMT
         nG10yuzh9LeIDrPmC5tZ9orYoQL8tuwJOx9w/cV17ms+u3i5X6KEF+3BGDPlI33A9uUc
         y2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VIhiZko/HdZRRX8wV8ISQub/+SSvOguPPMhdzz4lBsI=;
        b=FjCRK6LroW8h+NlguoVsBXZhFbRzjvsM9oGXXoh6e62F3NjTYijOBVdx/gJwTugQbb
         R41qiQfGB0NYhIGxqXJM0i8d0JEhAvK5U5JAJGo/NlzH71cGbL7npz2XQzpYO78HAzEW
         yl5Cc72OfhEGUfccGtujejo6S5Ri4gLMFi3gfExUIGroUFLDzyxtJxOMwVyRHBb7blQt
         Ck8vSuwZoWRCfRD+97v38erA4yBSX5SDcndOsH0IAVe1XE88qvy9JlASWKoE4KwAUgxR
         pK8Nkw1ANo8TOKlX4TX3j5IJevy1WzDoe0mV5SrSwrP0puBvv9Z//9DQxElJdF+QBoIs
         95Ww==
X-Gm-Message-State: AOAM5337pRNdmN/43h4JTinGdCsXBHmx5k1Wj8sOyVWdDvHHPnPAkIsz
	nae+bSURT6opFPPDjHvi594=
X-Google-Smtp-Source: ABdhPJxMcxauFEQGHdkkYeRphHVrjZgzBs8tyPX4bB6G74U+UgQGtcrW1hhPRdeepx7NtGQGv4g6jQ==
X-Received: by 2002:a7b:ce8c:: with SMTP id q12mr5856041wmj.14.1633467425703;
        Tue, 05 Oct 2021 13:57:05 -0700 (PDT)
Received: from tom-desktop.station (net-2-42-54-217.cust.vodafonedsl.it. [2.42.54.217])
        by smtp.gmail.com with ESMTPSA id p14sm2944109wmc.18.2021.10.05.13.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 13:57:05 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: tomm.merciai@gmail.com,
	Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/3] staging: vt6655: replace camel case variables
Date: Tue,  5 Oct 2021 22:56:56 +0200
Message-Id: <20211005205702.14029-1-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series replace the following camel case variables into
equivalent snake case variable for vt6655 driver.

bShortSlotTime -> short_slot_time
ldBmThreshold -> dbm_threshold
PortOffset -> port_offset

Tommaso Merciai (3):
  staging: vt6655: fix camelcase in bShortSlotTime
  staging: vt6655: fix camelcase in ldBmThreshold
  staging: vt6655: fix camelcase in PortOffset

 drivers/staging/vt6655/baseband.c    |  58 +++++------
 drivers/staging/vt6655/card.c        |  90 ++++++++--------
 drivers/staging/vt6655/channel.c     |  10 +-
 drivers/staging/vt6655/device.h      |   6 +-
 drivers/staging/vt6655/device_main.c | 150 +++++++++++++--------------
 drivers/staging/vt6655/mac.c         |  46 ++++----
 drivers/staging/vt6655/power.c       |  24 ++---
 drivers/staging/vt6655/rf.c          |  12 +--
 drivers/staging/vt6655/rxtx.c        |  12 +--
 9 files changed, 204 insertions(+), 204 deletions(-)

-- 
2.25.1

