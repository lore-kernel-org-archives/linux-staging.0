Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C0329CA
	for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 07:39:01 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id c3so12634377pls.5
        for <linux-staging@lists.linux.dev>; Sat, 22 Jan 2022 23:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=uhRfBYr+QspbVT8yLaJrPUXP2Z6/BOSZ8fDX9dfoTa4=;
        b=Qo1CRKU0nmS3Z+DuG+KK6MQE0+MsHldMbHb0EM2b0eu0z7cJ3RJ3j7xZBcy901s0CB
         nxv7hm5WqYedXjS6YN+4DaW6licZCrGNj1QnPCgUQvJhvpVTNUocRAU87Twx02jDZlOc
         Y5cCytgPA2K0T5VXvnOW87RPcormIA/0j6YUSe5baikRp1NgV7rQ3RgbMTbRX5a87X39
         7iTiFPL+P2eX3Sk/GrlyVNdZ3RIsnEbEq0tdB/WaFxV0L2Hz52vjvVrBXktDU7EutcZE
         RGG4kaX3NExkqieFZ0zHx4r+eiVJcOvC961yV7qzpaDN1G43CLPKUDpWUYE3EaHzvzTW
         N+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=uhRfBYr+QspbVT8yLaJrPUXP2Z6/BOSZ8fDX9dfoTa4=;
        b=XQEH8QUqs4MC+WKSmWyZmo4v98tzrOCfQMe/6nljHgT6VucuaBlydL0GqU7vr8Wxl6
         p0/M8YD41wC+ym1ldE9gzjD6TWuXVJeXs8Zoa0wbOerIYyk1swPv9DVkEzByokLBVOy1
         ukCKXG4zrAB+IcQ2TT7HgqLWbcczXD/FCBFHFGja5nkoXxwWInNtknY88mi1wLM7l0nK
         9DwVhUFHUplHwSs1hwDIRe6oooJsKr7K0RAUQIfOfyucQRLvbkTZhAffh5PoFLZ7xVvz
         nGmmvzP3Hu0DgDm6RGto/3vlFIx1Hrc6LFj6J4tDKBEOqwBIzv/ODyRUSGcGdldHW6No
         JWKw==
X-Gm-Message-State: AOAM532pXCOwzFPNol5df76OBQR6u7m1j3qR06lrATWl902ZDXh10w1y
	66jt24Y3EnKrVUiESBLYrV8=
X-Google-Smtp-Source: ABdhPJyJPbInC92Cnl9KOmoACPzxsCxjYf9t+u3So/gmoRz8o6odpR+nXdj3dCD0J8YFcYsI/U/Rag==
X-Received: by 2002:a17:90a:e541:: with SMTP id ei1mr7840048pjb.91.1642923540933;
        Sat, 22 Jan 2022 23:39:00 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id n2sm8878979pga.39.2022.01.22.23.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 23:39:00 -0800 (PST)
Date: Sun, 23 Jan 2022 20:38:55 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: gregkh@linuxfoundation.org, paulo.miguel.almeida.rodenas@gmail.com,
	realwakka@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] staging: pi433: add debugfs interface
Message-ID: <20220123073855.GA79453@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

When troubleshooting RF applications, one of the most common approaches is to
ensure that both sides of the communication path are using the same 
configuration such as bit rate, frequency deviation, encryption key, sync words
and so on.

The existing driver implementation doesn't allow the user to see which values
have been configured onto the uC which makes trobleshooting more painful than
it needs to be.

This patchset adds debugfs interface to this driver and exposes a read-only
access to uC reg values to address that problem.

Patch dependency:

This series depend on these patches as they change the same set of files:

- https://lore.kernel.org/lkml/20220108212728.GA7784@mail.google.com/
- https://lore.kernel.org/lkml/20220114221643.GA7843@mail.google.com/ 
- https://lore.kernel.org/lkml/20220118230312.GA4826@mail.google.com/

Paulo Miguel Almeida (2):
  staging: pi433: add missing register contants
  staging: pi433: add debugfs interface

 drivers/staging/pi433/Kconfig          |  2 +-
 drivers/staging/pi433/pi433_if.c       | 82 ++++++++++++++++++++++++++
 drivers/staging/pi433/rf69.c           |  2 +-
 drivers/staging/pi433/rf69.h           |  1 +
 drivers/staging/pi433/rf69_registers.h |  2 +
 5 files changed, 87 insertions(+), 2 deletions(-)

-- 
2.25.4

