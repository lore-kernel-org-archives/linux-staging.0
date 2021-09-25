Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B03A3FCB
	for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 07:45:42 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id eg28so45573745edb.1
        for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 00:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+8PZXNRc5ZTxd7WuoBWNH6vWt+Frn9DdJuHENk685Rk=;
        b=Psx/hbfu1CqLOthiaZaXLpBqk3e4CTjIH5etc4mTfLdbjMeIZR7yZEjrslCnXjsnH2
         v7eLbPu50aTXzvj6W83uFmHmGChWYVSIZxIuW0VChbKzXlAELnQyGcw2D4igB6UFIx5E
         xjH/4c7jxT3lIlv1cgq43TJU/djyxOTlnSKA27octQMlIMSZsF7OTvX5LIE82K8TDhP1
         U8OHvetdqWHQCLaS+mLOeSCT7LWuwRTGRtd+LKINd7Lk8yFGK5hPp4WwFyvt0YIF6LMS
         rGMxsqUR2oJ6NLwi5B0Kgq/1DKsTR19Imt04lOTu7JdGmkN50Qv2C5rKe/VoZVVziYAE
         uLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+8PZXNRc5ZTxd7WuoBWNH6vWt+Frn9DdJuHENk685Rk=;
        b=JevAP4wKf+Zs0Ds/1ba8duXqpvq8trT7LYgvYfnHjSr5xZsb9PjyzBG86/24slTpRS
         kn8ypwPC2bjhsc3UGE7iZui3bPMbERvRxcnmXdWDi/Mamdplkg5yYqn+m8PgPDY+aWZz
         ZFDvpw7kyXeq3rNL4FEvyvMfp6x6h8s7tkAE0mWuRoO2C12zT0MSHQUyvv+uWxI+AUUi
         lgo2fwB90H6kNlkdDwkdHUOv/Oyo5550BkoHu98NusgT1f+SHWRhgCz5q9VxPZtEJAdt
         VN75T8JZOQPEr6ZVZIu3hax1nuMxCOcruk6IL6fulZKZVc1CSnTy1B2DBt5XD67FkwF5
         0aUw==
X-Gm-Message-State: AOAM533t1YN+ErezkXlKCV7E7OnLqQzRzhcwtNOy9fWgFp/G8aBxpz/A
	UxOOtcSqRokIAQ6qPyEFYcw=
X-Google-Smtp-Source: ABdhPJzKMjlmjwDx39EH55uunp2gbn19ryAemm8p6/GhD/A75doeBV+lv01hP7rUbTSUU1BVgsPe0g==
X-Received: by 2002:a50:f60a:: with SMTP id c10mr9720290edn.250.1632555940453;
        Sat, 25 Sep 2021 00:45:40 -0700 (PDT)
Received: from tom-desktop.station (net-93-71-218-228.cust.vodafonedsl.it. [93.71.218.228])
        by smtp.gmail.com with ESMTPSA id m14sm5949900ejl.74.2021.09.25.00.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Sep 2021 00:45:40 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: tomm.merciai@gmail.com,
	Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Madhumitha Prabakaran <madhumithabiw@gmail.com>,
	Yujia Qiao <rapiz@foxmail.com>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	=?UTF-8?q?Aldas=20Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Deepak R Varma <mh12gx2825@gmail.com>,
	Marcos Antonio de Jesus Filho <mdejesusfilho@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] staging: vt6655: replace camel case variables
Date: Sat, 25 Sep 2021 09:45:21 +0200
Message-Id: <20210925074531.10446-1-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series replace the following camel case variables for vt6655 driver:

bShortSlotTime -> b_short_slot_time
ldBmThreshold -> ld_bm_threshold
PortOffset -> port_offset

Tommaso Merciai (3):
  staging: vt6655: replace camel case b_short_slot_time instead of
    bShortSlotTime.
  staging: vt6655: replace camel case ld_bm_threshold instead of
    ldBmThreshold.
  staging: vt6655: replace camel case port_offset instead of PortOffset.

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

