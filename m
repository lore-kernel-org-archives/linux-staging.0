Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F67185F
	for <linux-staging@lists.linux.dev>; Sun, 12 Mar 2023 07:32:53 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id s11so36871373edy.8
        for <linux-staging@lists.linux.dev>; Sat, 11 Mar 2023 23:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678606372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=590kegQ5S46TgiOWfJqQ1hyO5zf2wczEPaNlcKYRY+M=;
        b=diRTSoV06P/iuYFocwhOo2CpLewnjZE4tFQGzu19etY8CaWDKJK4UlFJgHC3KX0YqX
         sYQ4E8KElNWpej2Yr0Igi6038KKMNNUoB7fLmDd+hoIrv1e79TDQbdlGmpJFFUPfoRqa
         CRMfJJ2Ga064jGiU/ZFFlNcyuLdX6Z9KCKcY5n3x9EUVdPj+IMXbJztu4jh/gbA65GNz
         Kq7IAz4inCb1CrsolD0hRjpdipVYV8uJ6CtyoTaIrZ5wT6XdF1Sz1meoqenlpSL9/dJU
         lZCOGK8oxMORVOw+hw/ZEQ+JOxd9W4fTw7ydJRtIEGcRWRGR18MxOjzPTC9K1ZmMEs8y
         KFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678606372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=590kegQ5S46TgiOWfJqQ1hyO5zf2wczEPaNlcKYRY+M=;
        b=tEZOH527mLYpr8o3Z2f3WpoJoixRKQcUBonT5MkuV36vt6AmRvLiLg+YHSAtBXXFb+
         cnQVWh65iK/UzNz0lgjQHlZN07Cb/BpemQVzTnPqvRGPmuKIgkx1N3AEudAvEOor94aD
         8CUkH6ryLfucqNeqYJIGbbyUnXJPpQbMQsbhz5Z6ED0kT69+YoRjK2n2KnrrzC1cS4L3
         pCQX5m6DP7vlR4p2DRnZikSalI+hVKNZIKF6X4W/dBq4Nb8GSkTidpQXObOqm7ZZi2Jg
         mAG82Q3PLpM9lZLQVl5JDrjp7BIDI7QfgVM8z8kactDofrX6vTP0jg1Rbl4L7VDP1/GD
         LrDA==
X-Gm-Message-State: AO0yUKU/esTaVRlldT/Qm/lys/VVwhHiWyLzAZVwqSE5wNjaD4p5soBq
	ZC6gZgdSaNhKfziAU+yXcKQ=
X-Google-Smtp-Source: AK7set+Dh4KntyezYUBhsZrgmfuYZ6vRjVVgyfgZkmujh7cL/UthuhlkGK9nKP1z2JSujYklQSd/5Q==
X-Received: by 2002:a17:906:2989:b0:88f:13f0:4565 with SMTP id x9-20020a170906298900b0088f13f04565mr27871455eje.69.1678606372103;
        Sat, 11 Mar 2023 23:32:52 -0800 (PST)
Received: from localhost.localdomain (ip5f5abbfa.dynamic.kabel-deutschland.de. [95.90.187.250])
        by smtp.gmail.com with ESMTPSA id dc8-20020a170906c7c800b008d1dc5f5692sm1928841ejb.76.2023.03.11.23.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 23:32:51 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/2] staging: rtl8192u: remove two unused functions
Date: Sun, 12 Mar 2023 08:32:45 +0100
Message-Id: <20230312073247.9822-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes two unused functions.

Michael Straube (2):
  staging: rtl8192u: rtl8192_SetRFPowerState() is not used
  staging: rtl8192u: dm_shadow_init() is not used

 drivers/staging/rtl8192u/r8192U_dm.c  | 38 ------------
 drivers/staging/rtl8192u/r8192U_dm.h  |  1 -
 drivers/staging/rtl8192u/r819xU_phy.c | 87 ---------------------------
 drivers/staging/rtl8192u/r819xU_phy.h |  2 -
 4 files changed, 128 deletions(-)

-- 
2.39.2

