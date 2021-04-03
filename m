Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C755F
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 18:09:01 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id n138so11762920lfa.3
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 11:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=/DHc77qHzF47tIzabn/XC2E6zkbwQgwze0m6zhIGO0g=;
        b=TgArWY+LrUkDahwrOlfzPf1xYluBXZ9jZjo29rEJU2zde5ZhPVsCYLwv0sUuVy83B9
         2Lu0jZfrS1qKM/crA5xu8y4bBDvyxPxhRWqPRn0U8+RllfBK1zSXL0k/DS2t4s7UeFFL
         FYtCR0hG6s/UYqVrXsOK1myctGSnCCiXrozP0H32bIS4MgLmx5QETtnFr9J+hpTuAVjR
         O1cBXn/gr8lgFxIY1bATqyVTva/kVFfzctLeddRBaAZHpTOE+YJ2EDAAYB0QmF8SmCoa
         wztynjZOaJqRdOHAqce4Oh4IOp3qJtfz25PGwPwYqknvO5TEzoxU9XdQinKE8Zab722m
         ceLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=/DHc77qHzF47tIzabn/XC2E6zkbwQgwze0m6zhIGO0g=;
        b=Wf+Cby7jHrY75/p2m2wMnZy6lGKXkEkrqecHQw3KPO4au43coX3Aoff6T8vHlaKPPZ
         VL6nx1r0vMGWDsVc3GvQtKZ2lwD6pjxAoiS11hcYwTqNDaXkuWhNAn0+3jtJQSEji6ft
         nXlu6C478mAduij7hAwccmR3mMZb64sHGxsm0P3pfaEI8+JEq1K+8HJdsWuJchXLMrjE
         IptYrZcRFjBusIPBQN70Qoctz9McAAu2Py2YCZRmU7UQKsSZenCPKZJE0rHoPBnwZbAn
         zB1d949trPDKVoluxfpr15oWQ1K1Kt3qbznsZMwPuMK1L7xYcFJY2TVvt7RMusW+TFuU
         HDuw==
X-Gm-Message-State: AOAM533jjvQN+ZYMQAtn0lNxfwyaTC36f1QDW/xsjmUrplovfRBu4uPh
	1ULl5/3kDneNSyTm+EiJf1o=
X-Google-Smtp-Source: ABdhPJyUKBSE506Agpa1pHJ2jcmU6rDw8dlvIeCJ6ybjHFzhs8Re4o1xtcRSKSVvbE0SP212eNZzdQ==
X-Received: by 2002:ac2:5312:: with SMTP id c18mr12411768lfh.618.1617473339502;
        Sat, 03 Apr 2021 11:08:59 -0700 (PDT)
Received: from zhans ([37.151.32.231])
        by smtp.gmail.com with ESMTPSA id v10sm1202850lfb.238.2021.04.03.11.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 11:08:59 -0700 (PDT)
Date: Sun, 4 Apr 2021 00:08:57 +0600
From: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
To: clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH 0/7] staging: media: zoran: Eliminate camelcase
Message-ID: <cover.1617472411.git.zhansayabagdaulet@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patchset fixes 'avoid camelcase' warning by converting local variables to lowercase and separating words using '_'.
Renaming of each variable is implemented in separate patches.

Zhansaya Bagdauletkyzy (7):
  Rename 'HEnd' to 'h_end'
  Rename 'VEnd' to 'v_end'
  Rename 'DispMode' to 'disp_mode'
  Rename 'VidWinWid' to 'vid_win_wid'
  Rename 'VidWinHt' to 'vid_win_ht'
  Rename 'We' to 'we'
  Rename 'He' to 'he'

 drivers/staging/media/zoran/zoran_device.c | 48 +++++++++++-----------
 1 file changed, 24 insertions(+), 24 deletions(-)

-- 
2.25.1

