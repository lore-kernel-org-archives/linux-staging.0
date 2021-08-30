Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1EB3FC3
	for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 12:15:42 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id m2so8687536wmm.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 05:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hs4ujLXWBLneOzGa1TCzzBohS5G380csWuXra6v4X9k=;
        b=f138dCjoU2KK1oL45hichGHXxfwijdZ+QEndz1G4h1yeItcZOavd6YobBpEDUVivsN
         Edzh7QYagNohzzt+pSXZjKZMJBtdn9P04+B2WX3ppwnB1JgmS82ypC0C+m4VDoBnU8RY
         NNhi9upH5rT3/07KdP6YK98Brn7ufawP0TZHqL831eTqSt1F9Yy32XLw/zIFn78IH5FP
         0QTsQ3rmyER9jepR02W1fca/+n9mPUSeuA2L0ncly6aHiqmp3yBbn7M57Th7obLzEfoY
         +A2s9XT09yvZgAsDg5krkXOmEjOkpunUcc6wUqmfKk8g/OKYktAQTxfQs3R4laitHFhf
         JhGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hs4ujLXWBLneOzGa1TCzzBohS5G380csWuXra6v4X9k=;
        b=XHL96FZyfLRfaJ+RUfI211eVlg6fav4LXO3f+A7bRNlTLX2M6FP1vUgb3dPerNHbTv
         9gnnP8qph3adcC3VfWARjcBPam4ASq0FZ+eh7EJeeNGYK4H95+Rt/Si2pWJtauKSfms9
         Zwo7aSSP8MCvwQ3RhpCRJQW53QSWRVcGg+Okdzcm/BpVDzEaie1futcK1H4fW5Odbkiq
         hTpOesW5ycrm+YJzD80GNGixYjQVrjoxsX4VhYChoFXtWj54WZvXmszaPgFJgsk/QPhg
         prAKHlQV7sW3gvs0X3VGaALviT75E50H8wgsG0tbTNGM+bH06Zkbc7D0tOKVG4Kruy9z
         XqOg==
X-Gm-Message-State: AOAM532o0cOjLQnQ+SixCDwxaovksTVOhArYYAUtyebrxPRUhuFT7yVh
	jzSf/Ybtmx2sAq7M4QSA7mw=
X-Google-Smtp-Source: ABdhPJwOkqStIB1AAfPSjOxfR8NbKcz+MLvdE561z+XnC2GZTrYbF90B5neH/9tt5NbyGyPMgvNBjQ==
X-Received: by 2002:a05:600c:26c4:: with SMTP id 4mr21083766wmv.111.1630325740906;
        Mon, 30 Aug 2021 05:15:40 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::16fa])
        by smtp.gmail.com with ESMTPSA id x11sm15492116wro.83.2021.08.30.05.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 05:15:40 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 0/8] staging: r8188eu: refactor rtw_macaddr_cfg()
Date: Mon, 30 Aug 2021 14:15:00 +0200
Message-Id: <20210830121508.6411-1-straube.linux@gmail.com>
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

v1 -> v2
Fixed typo in commit message of patch 1/8.

Michael Straube (8):
  staging: r8188eu: use mac_pton() in rtw_macaddr_cfg()
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

