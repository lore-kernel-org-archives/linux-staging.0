Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DA1187C
	for <linux-staging@lists.linux.dev>; Wed, 16 Feb 2022 19:40:47 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id m17so5657786edc.13
        for <linux-staging@lists.linux.dev>; Wed, 16 Feb 2022 11:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qkw5lRjf3nabe8ZscLlo0xJJCuvMix/6SLYQZbaisbw=;
        b=NiEcxFmqrBNp3AKMfYTqWtWbl4/TxXVVBB64QLSnBna2+TOy0BnFV3jwVfmVAzom5n
         XivpXV1UjX4mTALjoyfPANAIQBWWFNZw/Mr2zGQJhxJs/qbtZFYKQVL8DvqEtDlOuqpz
         3l+W6pzYjfOtSwaYpDJN3pkdu52qivLGD7+4iOtp4nBjyOqB9ILlDgo2VgFgwSpApY/L
         WPa0rQFGNMT+vaBhYsGe/reLWvqR0DznZAyP2hTg0nfBaVKhLqyHdhQ/I78Ku6Ars9S3
         lCZj4Ln2pBEkCxFFBRVr22t0q46RxOjkHRAuvr7MqD/6EEAlVT1JkJXvdCHhqWLXkrky
         1e4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qkw5lRjf3nabe8ZscLlo0xJJCuvMix/6SLYQZbaisbw=;
        b=15dmGhtYqZHMddm+FxbIm8P5DVxbkH/sDuV9eis66RV+x9UNUAba8CJB2n+s1n86Se
         A9vs9SNEt4m/Tco5GQiJiwg8gEwyh1BK6tax+bNawv4hD4d7z2FW23YUZwtpoBfFoHIm
         9kme5xbONf0wt8f46ckaJDJOVGNBhOfcvLu9dA25UPVLNIOaJUS/w8lVDbxFet6VvrQL
         mGlrHDFp0mvliBKO6qlgpRr1qsHkeVE0a+IxIW+fDik2JFXMhkvxsCsNrHQ1GCfaTbiK
         PQ1dR2xf9Js3aqHIX9vSYUqa8/xqwOg8rnYIxQ3ZuSs+8PU+wvaKyWQ1ORAGdaS+E3I9
         MULw==
X-Gm-Message-State: AOAM531yYmTS8c/5H8ZqLIUv++tDqReAkNU8Kmx04NeL4P8OcmqYeKtt
	ZY7KoqP0psV+QRW599nHwbc=
X-Google-Smtp-Source: ABdhPJzSroogHTpd71ByMH/Z0a220F9XaYcVaZVAW+hYrmU3kuou/Ilv3IoLJMhPsJiZdTOFxxsP5Q==
X-Received: by 2002:a05:6402:2065:b0:407:eb07:740 with SMTP id bd5-20020a056402206500b00407eb070740mr4615493edb.406.1645040446340;
        Wed, 16 Feb 2022 11:40:46 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb8c.dynamic.kabel-deutschland.de. [95.90.187.140])
        by smtp.gmail.com with ESMTPSA id z18sm276910ejl.78.2022.02.16.11.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 11:40:45 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/3] staging: r8188eu: remove dead code
Date: Wed, 16 Feb 2022 20:40:35 +0100
Message-Id: <20220216194038.6762-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes an unused enum and some dead code related to a
variable that is always zero.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (3):
  staging: r8188eu: remove unused enum
  staging: r8188eu: bCCKinCH14 is read-only
  staging: r8188eu: rename CCKSwingTable_Ch1_Ch13

 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c | 16 +++------
 drivers/staging/r8188eu/hal/odm.c            | 38 +-------------------
 drivers/staging/r8188eu/hal/usb_halinit.c    |  5 ---
 drivers/staging/r8188eu/include/odm.h        |  4 +--
 4 files changed, 6 insertions(+), 57 deletions(-)

-- 
2.35.1

