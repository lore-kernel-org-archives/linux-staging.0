Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E66290F
	for <linux-staging@lists.linux.dev>; Tue,  7 Mar 2023 08:50:09 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id s11so49261998edy.8
        for <linux-staging@lists.linux.dev>; Tue, 07 Mar 2023 00:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678179008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k7pqtykxNAHfKk3ftPnpaownpFSnpgV4knCvwnISbJY=;
        b=I/bVjZS2F+kmcvTTkU9tLOwZVISBmrFUKaeW38tzAwYtZHTXLshMtSUHlJJ0tlso/A
         qsCvoZV6EiGggenLszHoGIoA7pkdwTQqvvF75W8pqb4P/AZoe6+BxQOedwWwznu7Fs3v
         dSXFJNL71rSyv9rQrQZf5/HD0RLsMshQFTuZtLhfBpS9cSXRzOtG3+94TXloONnVWHCl
         pzsBEKjLBums4Z8kYhZ+Zvmpe/5F1bn+mJRY6LzPyui9oqXkRQccEzAyB8Q54dKiBGLl
         s9e2V+otekmC3eOJtfsN2qsrTF+drHv6zFE2RHBqanG+nllGBdZmKKr2FmhLUjjzuKD5
         g4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678179008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k7pqtykxNAHfKk3ftPnpaownpFSnpgV4knCvwnISbJY=;
        b=kUl2BzJS6IYFQmJFDi02OgujIDN2o9zkdieiLB+JmPp1HgVqNptV/RPhyj9srUmYib
         OoXiu6W484rK9vMURrgycWXUjMuPwftKfmInb2OEbmuLtXu7e1Ujv2590vGRVKazLcGM
         4O+cXLY937a2mUAwmWk9nuZ0I7jXjc8LXXdpsDzpxTwRp9Ywy/RZT030xmmOqNb1dlQv
         LFi/KwbD6kyxwwxPCzorcS18tkH9QYlw8erf5nNwXDxxN6PRjI+6eMuZE+i9H7y1pX8w
         Dz2om+wRNCfgVr5dJ5YyvJFXjVyx5OftXP5Fgc4FVbTwx4USZRjNrer576dvZkKir8Af
         xNPA==
X-Gm-Message-State: AO0yUKUyrjJmVIPwOZIFec+aDd9GH5El/fAzjArCP7QkellMXeXLe4O0
	p+up1XBGTpVAOA69APYpPnzfLK+UxQU=
X-Google-Smtp-Source: AK7set9LPrU9voO8OIMQUg2zuD+0YE2Nrohxl3lbTAcVbNZyW2+QnWJZdexsEVVwtR90793/56qLAQ==
X-Received: by 2002:a17:907:6d12:b0:8b1:3131:76e9 with SMTP id sa18-20020a1709076d1200b008b1313176e9mr18373189ejc.46.1678179008275;
        Tue, 07 Mar 2023 00:50:08 -0800 (PST)
Received: from localhost.localdomain (ip5f5abbe7.dynamic.kabel-deutschland.de. [95.90.187.231])
        by smtp.gmail.com with ESMTPSA id o21-20020a170906289500b008ef42f9cf48sm5707402ejd.82.2023.03.07.00.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 00:50:08 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/2] staging: r8188eu: two simple cleanups
Date: Tue,  7 Mar 2023 09:50:01 +0100
Message-Id: <20230307085003.5025-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series contains two simple cleanups.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (2):
  staging: r8188eu: busetkipkey is boolean
  staging: r8188eu: bgrpkey_handshake is set but never used

 drivers/staging/r8188eu/core/rtw_mlme.c        | 1 -
 drivers/staging/r8188eu/core/rtw_recv.c        | 2 +-
 drivers/staging/r8188eu/core/rtw_xmit.c        | 2 +-
 drivers/staging/r8188eu/include/rtw_security.h | 1 -
 4 files changed, 2 insertions(+), 4 deletions(-)

-- 
2.39.2

