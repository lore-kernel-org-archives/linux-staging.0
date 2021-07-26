Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8E170
	for <linux-staging@lists.linux.dev>; Mon, 26 Jul 2021 13:16:47 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id ds11-20020a17090b08cbb0290172f971883bso19723816pjb.1
        for <linux-staging@lists.linux.dev>; Mon, 26 Jul 2021 06:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cHZOvvel+5d6b214Ne7sLHOgMbGoll5+GC93mwY54eA=;
        b=VaQw2NuGT2IOg1ChHETPeKXdCjDi2OdDH2BSfYPXhvPayFcWiiU7HJkEUflo7xDjH1
         aIAKNlN3V1d9aIS3K5SxU939fjofBoeV6CcPqMWqjNVOP97VgcZKTGR5TudVQr+5qWt7
         0IoJrCLkaaVkYlEdu0jf6Rn93iwUTPE4Civl//lQVe6GU8Tu7Q5RobI8Cv56e4LMIqTg
         WIr/nS9Hj11J9t/Bfx+usXBvjQQTLd+hpRkvQ87L+eSCU+agPIKp1GKIvTOFYT6gUWaL
         CYqVb83eN4vWDR/HuRxQxREgFZaLa2HcAw8JVxqEYSk2Q/thtgPTLahqIfQF0tnobfVN
         qjOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cHZOvvel+5d6b214Ne7sLHOgMbGoll5+GC93mwY54eA=;
        b=iUHhGPPXCfYBf5znKJh0yjMVjnZ9xf6bldteNt11763ph0F3W9l0l7vJIeYwj8GpQd
         /eVcgOlRXfIv36AUgt67qx+aqZO4oFTvf2m44nZ6jD5InUGiWEfJRR9fxg9sd6Q4iiV3
         b0brO2JGsEnLiNfSUwRdpRUWuxMqTwVh8wN2kF81F1KAR2a61CXkM+4iWHjYuTAsl3Ws
         UEMvyu1/qBNiJK9NNM4IzfR3tHzcg2n6ji6oKgN22EqdoVIg/NP4QEh+TMAljAYX8f2p
         Rud13GGLX336PjTGT0e9x4b1il1dL2GbarLVlXIBq/LEUBOtNDSTbIxijNSx2fd/EpgA
         Xq7g==
X-Gm-Message-State: AOAM533jVhCD1/a5ivxDunDmA2Q88xAsTo/6k/aIkXgI7/xoMgCfOoPX
	PATp+1ZuiOGvI29k2ABDeQw=
X-Google-Smtp-Source: ABdhPJxybNRXYFGSWmauvVve1P4RAIbSKAY80gbCOdbhRJjF5MDB1qYCYCeJxKQPTxqWdB9R78N+eQ==
X-Received: by 2002:a63:c041:: with SMTP id z1mr18481840pgi.49.1627305406871;
        Mon, 26 Jul 2021 06:16:46 -0700 (PDT)
Received: from localhost.localdomain ([2402:e280:2130:198:9b25:1cfb:9ff3:2a8f])
        by smtp.gmail.com with ESMTPSA id c12sm12070869pfl.56.2021.07.26.06.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 06:16:46 -0700 (PDT)
From: Benjamin Philip <benjamin.philip495@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Benjamin Philip <benjamin.philip495@gmail.com>
Subject: [PATCH 0/2] *** staging: sm750fb: Rename maxH and maxW to max_h and max_w ***
Date: Mon, 26 Jul 2021 18:45:00 +0530
Message-Id: <cover.1627304144.git.benjamin.philip495@gmail.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset (as the subject implies) renames some struct members to follow the
snake_case naming convention from CamelCase. By doing so, it also fixes 2
checkpatch CHECKs.

To test it, I have only checked if the module builds, which it does.

Note: I am very new to the Linux Kernel. This is my first patch. I have done my best
to ensure that my patch is upto the expected standard and to research on what it is
expected by maintainers. Please forgive me if I have done something wrong.

Thanks,
Benjamin Philip

Benjamin Philip (2):
  staging: sm750fb: Rename maxH to max_h in lynx_cursor
  staging: sm750fb: Rename maxW to max_w in lynx_cursor

 drivers/staging/sm750fb/sm750.c        | 8 ++++----
 drivers/staging/sm750fb/sm750.h        | 4 ++--
 drivers/staging/sm750fb/sm750_cursor.c | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.31.1

