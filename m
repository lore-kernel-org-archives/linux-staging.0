Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733472F23
	for <linux-staging@lists.linux.dev>; Wed,  9 Feb 2022 16:37:22 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id 10so2697380plj.1
        for <linux-staging@lists.linux.dev>; Wed, 09 Feb 2022 08:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sPW8mVCw4MrqTJ8vozaqP06taDowj1TVJJcqIK2tj1k=;
        b=pzxJLP6rtImsQ3liqEAeYv+fquczQUi6O4B+tI22FsHC/ueGSL9nm+5mUJcZF/WaXK
         rq2uhqnO9ByYYdrFaLJ4iZijv3dTFEJpLkiSJ54zqht2D3GYkx4WK1tW3+HhWJUt+OIo
         ir+7strdRwypmmrN7XLijsZcIqOZTGk88t3nVUA1HZkD92VErcLObQ9VCj7dvvVVddNK
         nhrXf8J7ssk6RSBslUjaykn9zvTLibCIxqCD7v0H+WXSfa9Ywa6LluLMrLufN+zL+PAd
         9RVvQLeuvF8+jCbERXJ3jvmX5vMwNfWwg0rCakJnCucRurqpEXnwStny4w+sGFdVXSrJ
         hB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sPW8mVCw4MrqTJ8vozaqP06taDowj1TVJJcqIK2tj1k=;
        b=omewArPj5zEnnjFHoOya1YG/Jv6/WvsSUxxwLhq8ynsrSxwDMgCfCtgAJpKHBQ1Hll
         DYN9kWVd4eb8l6AtqRr+uflQcpcgifrAPtkoC3X5bBcKS5HgpsCn14ZAUrdGP7y6y5l+
         8irvFgaQHIOMC3sn35lguInch4hb0TTmZ1q+5KDGuiKzn5UGjMxf8PKrSdbfKhKViznj
         Brd7SSJIda+4c3X06vLeg6ZVHKWBq7nLbLLlJpcAfzY7I8RechTwF859p3oKVeQjxTr/
         F0nASTmXB2tHmcw4cwhDl0Kz09IK0voKF4WBG9iqb3QBdgnr2Q6YRuYQT7Hg6QkwDuig
         r+KA==
X-Gm-Message-State: AOAM531Fq1mXkndKt4Kn8uz93/9/5QEsF2f8MHAln7j1/rU68W9Z3wKD
	aNmY675To7a4/mePJUYWvjs=
X-Google-Smtp-Source: ABdhPJyYFCCz/u7zAow5JFgjk9HWwix4smcsFPf2aKDHDxGGTbAo9NDYuic0Ampcj6fzRNR7msJteg==
X-Received: by 2002:a17:902:aa95:: with SMTP id d21mr2938454plr.59.1644424641789;
        Wed, 09 Feb 2022 08:37:21 -0800 (PST)
Received: from localhost.localdomain ([122.164.186.156])
        by smtp.googlemail.com with ESMTPSA id kb18sm7840199pjb.30.2022.02.09.08.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 08:37:21 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Abdun Nihaal <abdun.nihaal@gmail.com>
Subject: [PATCH 0/9] staging: r8188eu: set of simple cleanups
Date: Wed,  9 Feb 2022 22:05:58 +0530
Message-Id: <cover.1644422181.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes unused struct, function arguments, macros
and empty functions.

Abdun Nihaal (9):
  staging: r8188eu: remove unused struct zero_bulkout_context
  staging: r8188eu: remove empty function
    rtw_get_encrypt_decrypt_from_registrypriv
  staging: r8188eu: remove empty function rtw_mfree_mlme_priv_lock
  staging: r8188eu: remove empty function _InitOperationMode
  staging: r8188eu: remove empty function __nat25_db_print
  staging: r8188eu: remove unused argument in __nat25_has_expired
  staging: r8188eu: remove unused argument in on_action_public_default
  staging: r8188eu: remove unused argument in chk_ap_is_alive
  staging: r8188eu: remove unused macros in sta_info.h

 drivers/staging/r8188eu/core/rtw_br_ext.c     | 15 +-----
 drivers/staging/r8188eu/core/rtw_mlme.c       | 13 ------
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   |  8 ++--
 drivers/staging/r8188eu/hal/usb_halinit.c     |  5 --
 drivers/staging/r8188eu/include/rtw_mlme.h    |  2 -
 drivers/staging/r8188eu/include/sta_info.h    | 46 -------------------
 .../staging/r8188eu/os_dep/usb_ops_linux.c    |  7 ---
 7 files changed, 6 insertions(+), 90 deletions(-)

-- 
2.34.1

