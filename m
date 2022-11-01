Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F206A7E
	for <linux-staging@lists.linux.dev>; Tue,  1 Nov 2022 19:15:04 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id y14so39547507ejd.9
        for <linux-staging@lists.linux.dev>; Tue, 01 Nov 2022 12:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bh/vb258a85waAX85aoxt5/0nDK0TrUQ5LPFD52UgPA=;
        b=Lu9O3ACO2fkVQQg7P2DynITZmIloWlIb6e4XM3rcu3PeX/Su5aPDqY/R24Q3r4H3Fq
         N8nUkdA1MWtb9iumVDOwCy0PTzDRp5uBhLrFt8tAG8shZ2eErCYvTDyHPf8Puq+iIpBL
         a3dO3DbUCNc7OSu9OTLcybcCfM/tFDeQSn/9RqCAconcGd8GbN3P7zW57HkOhDT6ZVE8
         qeeGuz7QpwsauwT8+Bm/tMXvN8CK9tHxFL0a4C1XcfVy6qM/3jDdQIyX26/5wCzv9Ejc
         FcQJF7d5hbDut6lfeS4Ye8Wa/B0mlkKmhUAXZckDvy8m3h3lOU+MpH7tkDxarocyey4l
         Wu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bh/vb258a85waAX85aoxt5/0nDK0TrUQ5LPFD52UgPA=;
        b=Y6mUda6j4zAzXmGosroPiCtMK9uDdFyvategoIhADOzKhp2uZPRSzGhLe3uV2APu4z
         fKn2OrAobS8cNHaZ+zzNfRb0t58Vqg0fSzXGzyoe1Vw3EzHVX411hvKT7t+uq9A6Y/kk
         vDcoCChQLPQwOayyzq3PdCtk5U0RIvXd0FRcik7HPWzdkDBWUvVbyEhsuO4qSRYXzdLT
         2Vh/JrN/rHFeFlrQdWTnZFIUpNgyTdrrL3wQssUE9P8pQbR1C2LqRRhZnQDWpFnlzwBn
         s7Wd+hRedxtdlQz1tkhWI2wHcgLi34qTlses1U7Mfd8cfQhpMQuKGtOCoOZe7PgG2Y78
         GRJQ==
X-Gm-Message-State: ACrzQf3zoeoJm6ohuZN3ep2wCDiuF7y0RgGWi52beI2y+DAAQPTY3Y0h
	MPY8SLu0aTUZklrcONnY510=
X-Google-Smtp-Source: AMsMyM4a2dWzxMe/fpwr9NVsBr+fP6KZUEpMJTIJORIBfVkUzF9XIw97i+WhqhbR3qJRGW+jv1svyw==
X-Received: by 2002:a17:906:db0e:b0:77b:82cf:54a6 with SMTP id xj14-20020a170906db0e00b0077b82cf54a6mr19470626ejb.691.1667330103172;
        Tue, 01 Nov 2022 12:15:03 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb7a.dynamic.kabel-deutschland.de. [95.90.187.122])
        by smtp.gmail.com with ESMTPSA id hw20-20020a170907a0d400b007ade5cc6e7asm1643853ejc.39.2022.11.01.12.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 12:15:02 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/2] staging: r8188eu: two simple cleanups
Date: Tue,  1 Nov 2022 20:14:56 +0100
Message-Id: <20221101191458.8619-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.38.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series contains two simple cleanup patches.
Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (2):
  staging: r8188eu: remove extern from function prototypes
  staging: r8188eu: convert rtw_free_stainfo() to void

 drivers/staging/r8188eu/core/rtw_sta_mgt.c     |  8 ++------
 .../staging/r8188eu/include/osdep_service.h    |  2 +-
 drivers/staging/r8188eu/include/rtw_mlme_ext.h |  4 ++--
 drivers/staging/r8188eu/include/sta_info.h     | 18 +++++++++---------
 4 files changed, 14 insertions(+), 18 deletions(-)

-- 
2.38.0

