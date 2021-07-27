Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B88A177
	for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 19:20:09 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id u9-20020a17090a1f09b029017554809f35so6085305pja.5
        for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 12:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LHDDmMV915NlqVzU6Fz/0FX3KRO8YEAV5C4ehYloHEU=;
        b=tfKwMgeABBSvgWX+IvJ17zJcPJedYVLMFvoY0kv7zHDGEEVyGO1ZxXOQ/U5RygTnRh
         Ll7px7rHAT3A3JDs5Uz0SJH86MQ80+D00Hrza5J9Qh0cdtrbEZ/P6+0/2XY4BAC9bw8e
         yAEEPw016EIROUxGdVx4XkCBA4MYkhjR0kBVeC0cgB2bEYLPAMOeDk+YpPzrecRHO8En
         IsDHHk1fpf2D5jvlJxWrV2tD7QMifkxlyfeI54APeCk+tYce4s8K2HNBzN85IVwQQLxp
         yLqcjgWK88OhEAbamqwN7hc0KVDpbSSvRssb5IbY9tKxQAaQ9tzEcBTGw8kYYTMrJQuQ
         AUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LHDDmMV915NlqVzU6Fz/0FX3KRO8YEAV5C4ehYloHEU=;
        b=F71qGgbLo3nxnNmLgooRCOPcDXB2lw+rubvoOiMAsPzy6Fc1FDz2OvYmnVSeGkpjdm
         Q50S+y3pEj/PVObEparoBrJSk6L1u25ORHNszqn9J+4ennB3Z3egwKOMeHOzk85VeO5c
         HUZxa3wwGhBH6idBHiyoSiRapDyc4eWn28YzU034d2bsf2V//6YmO9HpEkg7ROzsjetH
         rirrEl7sHf/NZ7XYeVrp7uqMTrVmWtjciVay3/LpHUTU7Kn2g2ph+816Gyu8UOM+Vao0
         a7YgNZnDZAQZmlzJWAU4wqbHgisQaTKBWjEo0Nwr3yejRVuH9q8xbU+Drb9n7y25APy4
         mrFg==
X-Gm-Message-State: AOAM533w54aG40LsQHTB7bcif3j0/Jm8jPK7wUFMJzEUCSVCpBfXq2gK
	u8qdDs9X1yGPmZY4uaMO57g=
X-Google-Smtp-Source: ABdhPJyMiOXY8pB7EwQqfVIsk+O8h5ZHty+pDmFkHEk0+/ShwQ9k7FNWEwvdBGSYHrfBKCfVQbnE+Q==
X-Received: by 2002:a63:ee06:: with SMTP id e6mr24851846pgi.374.1627413608648;
        Tue, 27 Jul 2021 12:20:08 -0700 (PDT)
Received: from localhost.localdomain ([2402:e280:2130:198:9b25:1cfb:9ff3:2a8f])
        by smtp.gmail.com with ESMTPSA id f7sm4317096pfc.111.2021.07.27.12.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 12:20:08 -0700 (PDT)
From: Benjamin Philip <benjamin.philip495@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Benjamin Philip <benjamin.philip495@gmail.com>
Subject: [PATCH 0/4] staging: sm750fb: Remove CamelCase in lynxfb_crtc
Date: Wed, 28 Jul 2021 00:49:49 +0530
Message-Id: <cover.1627413010.git.benjamin.philip495@gmail.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset (as the subject implies) renames some struct members to follow
the snake_case naming convention from CamelCase. By doing so, it also fixes
2 checkpatch CHECKs.

To test it, I have checked if the module builds, which it does. I have also
ensured that checkpatch.pl does not issue any new warnings.

Also, is this patchset fine or should I have clubbed it into one big commit,
Greg?

Thanks,
Benjamin Philip

Benjamin Philip (4):
  staging: sm750fb: Rename oScreen to o_screen in lynxfb_crtc
  staging: sm750fb: Rename oCursor to o_cursor in lynxfb_crtc
  staging: sm750fb: Rename vCursor to v_cursor in lynxfb_crtc
  staging: sm750fb: Rename vScreen to v_screen in lynxfb_crtc

 drivers/staging/sm750fb/sm750.c    | 44 ++++++++++-----------
 drivers/staging/sm750fb/sm750.h    |  8 ++--
 drivers/staging/sm750fb/sm750_hw.c | 62 +++++++++++++++---------------
 3 files changed, 57 insertions(+), 57 deletions(-)

-- 
2.31.1

