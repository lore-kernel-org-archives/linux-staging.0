Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DF83FC8
	for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 20:49:30 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id w29so30960370wra.8
        for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 13:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wdgqtRpc9sO5oNDV8qMEuEdtDpa8CWTtIfeCG6MLKKE=;
        b=UJr1/0VX7iWfrNdJ0ZBTDMXjpi0+Texx0ens2JfWS2BM7Du//txUvRaKrJpGzoO9ad
         Gt5jxdeJAm2NK5N8FXOiCF43BVpVXE0OXMkz95qzws1ZaQiNRzSFx72MPp7JUPJk4QYx
         0tsq+2HT8GuPupKgllCF/UVDcOhvbcm06t00yItAx2NSJ21bQmFOHF1ZjQT0CIvC/wFT
         jk2BV42a6h/yiwK4gP74+JBipJQmGtrpJhe9YMyFA40gbLxbz8Q7KB4Yy9IHY542ZVk4
         qAlHbdem78znbSwGV+tBM7B4PfesS3T2H57Z29oAO++9xDCxsySGIOWw/8S92gtA0ct5
         E7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wdgqtRpc9sO5oNDV8qMEuEdtDpa8CWTtIfeCG6MLKKE=;
        b=Wq32eiONOruINU7XiAkYMG1wCke7zair1UflikdlUnZNx305M0yfhBMUJDjjXNdk7I
         1xOy97jolZrKO1HOHQQ72vVHtZm+1BjoKVtAMLVVC9dNhJfaf8iaQgzaTvcK6eIDRhYL
         P31jXdXc4AInuo+ZwZdhYrNxIT/oluSjiWfoJDCngZ+Wn6/4eB7clBKBT3qq/3uP3eZT
         IoqmmdK8J0CAkzeewDDczDxxQfxdqCwJmUKnc3eVhV4nvirH9q+8Z6JAmq94yYYSWbJT
         Y2knNYCxGIzxAD1CHnLdcmM6Y7lhPSJUjjzrWGcQK/pKLteSQRZ+Eng5mEcaEOt4desg
         tkTw==
X-Gm-Message-State: AOAM531b/STS+cB6uldbUadeKcsU1uIJmnkj0ybBBEbpAiozBTwnRKIL
	F3Y+LaWjLL2hSe78h2aQsrI=
X-Google-Smtp-Source: ABdhPJzYKEcoKAOo9GMtejXGeZ+EdzpLVvd8n3ZmykcBMrgyzuYfWL2zCFuGNHIvYiMBg9DrhOKNJA==
X-Received: by 2002:a1c:2246:: with SMTP id i67mr3982600wmi.157.1632516569444;
        Fri, 24 Sep 2021 13:49:29 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::51da])
        by smtp.gmail.com with ESMTPSA id j19sm9040292wra.92.2021.09.24.13.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 13:49:29 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/5] staging: r8188eu: remove dead led code
Date: Fri, 24 Sep 2021 22:49:12 +0200
Message-Id: <20210924204917.6313-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes led related code that is not used in this driver.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (5):
  staging: r8188eu: remove dead led blink functions
  staging: r8188eu: remove dead led control functions
  staging: r8188eu: remove unnecessary comments
  staging: r8188eu: remove _InitHWLed()
  staging: r8188eu: remove LedStrategy from struct led_priv

 drivers/staging/r8188eu/core/rtw_led.c    | 1364 ++-------------------
 drivers/staging/r8188eu/hal/usb_halinit.c |   15 -
 drivers/staging/r8188eu/include/rtw_led.h |   18 -
 3 files changed, 90 insertions(+), 1307 deletions(-)

-- 
2.33.0

