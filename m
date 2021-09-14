Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131603FD2
	for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 12:14:04 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id d21so12138701wra.12
        for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 05:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WG3o0NPKF4oM/tA2/pUsvZD7ibEQxGbhXbUXWj0SZd4=;
        b=GJdn5Uh8WrxXCQERCWhk0lob2qap5Cd2LwunFkORyXmigauemhDPc0WA1v5RAWN3t6
         5qFk7ps3jFCQHR+cFXOO2/0njuA2aCphVwI2CueihLxFbBgF2LDr5sAvn82r9HTJCa+z
         2H38dT9nC7Ud1zsWNrHdTbwA4yFhVzvpR6RM+VGRGLNrsi+HJvYLOPs2GUCtyOabej8U
         OL7HvFLDy4NfVmscX8z4pi0tQkVowDZaIj+SfcBFZYY10Q/F+FyfNAu9dKV+/h2PsA0w
         aa/af0Hzk8Si2piLZvvGAsX89eBxsXHhqq2hwp/jhbGtUee9NI/1qB+K7UZoOudZpoLK
         6NHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WG3o0NPKF4oM/tA2/pUsvZD7ibEQxGbhXbUXWj0SZd4=;
        b=Lc4WkYbGPkbDnBvF0Dok3ckSMrIKemJsLkIVG61ZYUVXJlc+vqE+t+IgpcN4xIpKJx
         aGHUGn6q8rDV3/DmXL0ZXFQRdVapfi266ADJjUmPylEao8FxSQuAxxmvbVANfsI8U6ED
         I4M50DBZvhIneEttXJrZRgbkg9V+OZ+glRw+64ucPSn3twxDIfytEBw+pzWfGcsNzJVQ
         6MheS2i5DFwmdeEXyn/SIIjUFLS2P+/rOCuSX+PBahLwhoRrjwPZ4xe6clY8wnic4m4U
         lt3LiFFC7xx0GWZQjyDPW4RQXNEL57Gyc2s1/3MVrFZbg3xI/7oPuzlp8PnbvcYtpJp5
         toNQ==
X-Gm-Message-State: AOAM532B4XrrKzpM3cmlnJpEJnHTcVF2lrvOSFS5Bk6buoYJSDm+vbL8
	sHJAYphe6TKXBu1e0mTgL5s=
X-Google-Smtp-Source: ABdhPJzim/4QKv1GY4VteX70vQ+pZ2HZAuHh25CzF/BbtQBP6ceeJvT+s7LVwCwi9XaS4eKmGj4gMg==
X-Received: by 2002:adf:8144:: with SMTP id 62mr18661185wrm.144.1631621642459;
        Tue, 14 Sep 2021 05:14:02 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id j19sm10028100wra.92.2021.09.14.05.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 05:14:01 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/4] staging: r8188eu: remove unused fields from struct hal_data_8188e
Date: Tue, 14 Sep 2021 14:13:48 +0200
Message-Id: <20210914121352.26052-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes some unused fields from struct hal_data_8188eu.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (4):
  staging: r8188eu: remove unused macros from rtl8188e_hal.h
  staging: r8188eu: remove write-only fields from struct hal_data_8188e
  staging: r8188eu: remove unused enums from rtl8288e_hal.h
  staging: r8188eu: remove unused field from struct hal_data_8188e

 .../staging/r8188eu/hal/rtl8188e_hal_init.c   |  5 -----
 .../staging/r8188eu/include/rtl8188e_hal.h    | 22 -------------------
 2 files changed, 27 deletions(-)

-- 
2.33.0

