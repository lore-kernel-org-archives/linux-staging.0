Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD704387
	for <linux-staging@lists.linux.dev>; Wed, 31 Aug 2022 05:36:52 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id s11so16856437edd.13
        for <linux-staging@lists.linux.dev>; Tue, 30 Aug 2022 22:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=Zdl+bHnrlDuNezApLP0OPztrvL1DKjzc69eOvMJqVL4=;
        b=ndCngMFNIpxhdsEVpoO+0vUeZhV4e6LWjVdHnwZfH6wvgK6P1IhD4AJ7jBNyzyZT+F
         9N79bADXa44ZSs+q2FRKJBfy1lF1K9T4pfKgEiO2XfXZ+U6fhy2Sr9mL1jWWb8kvZYjc
         kderaYpg78OYZvvPl4SsIPJ4HNYjJzC6Jl4zYMUClwmaXs8g1fnI1iL7D8Ov7HCKOcHL
         NmZkfsm8Q/m3UZxPTGn+dfjlliLaXY3/LR34nrzjKG4g6NHbt/1NlX8bc16xSyYP6Di0
         XowG6n17R8yukTGmoWGtRInN/lSWqBQHuXpMh12YFVrEXX4wJJX0LcGoeh+H4I7tCDvX
         Zx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=Zdl+bHnrlDuNezApLP0OPztrvL1DKjzc69eOvMJqVL4=;
        b=UnIMhEO0aSpeBqa6FoeJaeuyxEA80h5taAYtDHvUPiVPVLNLAit6r1UwOfufnBqCaG
         /gECMESKxSbWThy/Z5zsDnUVFvSDVzVtC10JLbBE1w6Fd44HGv6DEPB+XdVYbdzijJz1
         xav4HDPccWHXfg94XD0ION2VRC3X7coNPsPQq8+iYc/H/JGR6eJ+R3lURF9qUYE3LgLP
         +jtXEYidLEFgh4T9rzR4TusjgY2NJ2FC8AQpWQK3vcoEDDkSDtC4b3LmW4piagIj5KfC
         OGgHdvHo0LT8OcAyw33VHq0Qm+5SsrHt3TOrFlXY19NTjnyv1z2e7Bwh95ekrcaHkFMJ
         wxcQ==
X-Gm-Message-State: ACgBeo0289GySOPpwPB2sZSLPYDeHusN0+SsVBnARziTCMGoqPTf2DpY
	hz43bAKOkteiHEsWQoS/PbYkyveyHAU=
X-Google-Smtp-Source: AA6agR55WyoIOKGhR3LLdGBYjzoKHVFs+EezhwoOJ60vpzjasByoGDk1BhzcGBQRcNzuMYgg3UfL5A==
X-Received: by 2002:a05:6402:1d4e:b0:43d:9822:b4d1 with SMTP id dz14-20020a0564021d4e00b0043d9822b4d1mr23260330edb.212.1661924211190;
        Tue, 30 Aug 2022 22:36:51 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb89.dynamic.kabel-deutschland.de. [95.90.187.137])
        by smtp.gmail.com with ESMTPSA id gh21-20020a1709073c1500b0073a644ef803sm6610135ejc.101.2022.08.30.22.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 22:36:50 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/2] staging: r8188eu: migrate os_dep/mlme_linux.c
Date: Wed, 31 Aug 2022 07:36:37 +0200
Message-Id: <20220831053639.8559-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series moves the functions from os_dep/mlme_linux.c to
core/rtw_mlme.c and removes os_dep/mlme_linux.c.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (2):
  staging: r8188eu: make two functions static
  staging: r8188eu: remove os_dep/mlme_linux.c

 drivers/staging/r8188eu/Makefile             |  1 -
 drivers/staging/r8188eu/core/rtw_mlme.c      | 31 ++++++++++++++++
 drivers/staging/r8188eu/include/mlme_osdep.h |  2 -
 drivers/staging/r8188eu/include/rtw_mlme.h   |  2 -
 drivers/staging/r8188eu/os_dep/mlme_linux.c  | 39 --------------------
 5 files changed, 31 insertions(+), 44 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/os_dep/mlme_linux.c

-- 
2.37.2

