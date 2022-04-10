Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7064ED1
	for <linux-staging@lists.linux.dev>; Sun, 10 Apr 2022 16:31:49 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id p8so12555175pfh.8
        for <linux-staging@lists.linux.dev>; Sun, 10 Apr 2022 09:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/yU+vBGEs0hJu5+rGTU3MHDinaz43KmLmKdOju9XgNQ=;
        b=IrwBWCFOVfmkafhQzlbBNdy6jswf7TD07xn6AsCFmU51FGERKrM4nobPty/LkSVph7
         e20/4b0QPR2whF3JKwD2XFt4Os7eCBMkJGG5nykgQkQ6bVlq1Dl0rk1cQwlWoB65sK0g
         WivTruq7jSW+LzBkXgSeUD3yWyMTVY/P9veqhqL/srJ2eMZST4cTpgwCTRuyvCi3TxAs
         vwzfAqmJ53HnmzL8CVjvHuvkuDySsgZrkvq32ODpH7my5Y+FPsPiqO4TUKM6KRdh95M6
         NOSNA6qq39W9hBbAOq7PJ/wnpC5B3fIuPqr8LknjK2NfIBCr08WA8ASZGrMQkL/SO71f
         vQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/yU+vBGEs0hJu5+rGTU3MHDinaz43KmLmKdOju9XgNQ=;
        b=lAQGPivja1fLBELGv0clZnB8lFQOAkvWloYbkl31LXD23HJ3jtg1ehrZ74KYoqDyBH
         +SfEclYC+ixjHLvMkaBVidQ6zsdJO/qkqq+wm9faL1aYeqO7AVasCFRBLksZaeodqCc+
         Nv8f4/jn/iGhO3KR1a9q0gcLuanaJyxQFfRoX/AbTQyWOT9tDC4FXXB4jEFryX96Vhha
         CqPeOh/mUQd9uofJmIP/6DYCKXsPSuZo/Ww2V9oRVo/wzxs7k8nX1R1AcWCaDCQyxqU0
         n0ZZfeQjT6bF3NBlBBA7rroOt6hyk3HgK10tyHT6SfAkoz5So7ZHs4BvXxCZ1RfeWEoS
         OfjA==
X-Gm-Message-State: AOAM531ZxDUI++KPZU7sIoOQERAhHulnoR3VSIa+6YEK5T3YAkwJ3XR9
	TvDGPgRdGVMxwT+GXkrJU2w=
X-Google-Smtp-Source: ABdhPJz67nU7sOqT5zNutVei3WjibcRCt21sJJ/szY6IhvvN9cNR0r+512gXZvi19wG+WCDC8Lp3rA==
X-Received: by 2002:a65:6a4c:0:b0:39c:f169:b54a with SMTP id o12-20020a656a4c000000b0039cf169b54amr11725706pgu.384.1649608309284;
        Sun, 10 Apr 2022 09:31:49 -0700 (PDT)
Received: from makvihas.localhost.com ([2405:201:202b:15:606b:10e4:2085:6825])
        by smtp.gmail.com with ESMTPSA id f12-20020a056a001acc00b004fb37ecc6b2sm31940021pfv.29.2022.04.10.09.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 09:31:49 -0700 (PDT)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH 0/6] drop some unnecessary wrappers
Date: Sun, 10 Apr 2022 22:01:11 +0530
Message-Id: <20220410163117.3964-1-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop some unnecessary wrappers and update all the references
accordingly.
Tested on Comfast CF-WU810N RTL8188EUS wireless adapter.

Vihas Makwana (6):
  staging: r8188eu: drop unnecessary wrapper rtw_free_cmd_priv
  staging: r8188eu: drop unnecessary wrapper rtw_init_cmd_priv
  staging: r8188eu: drop unnecessary wrapper rtw_init_evt_priv
  staging: r8188eu: drop unnecessary wrapper rtw_dequeue_cmd
  staging: r8188eu: drop unnecessary wrapper rtw_init_mlme_priv
  staging: r8188eu: drop unnecessary wrapper rtw_free_mlme_priv

 drivers/staging/r8188eu/core/rtw_cmd.c     | 45 ++++------------------
 drivers/staging/r8188eu/core/rtw_mlme.c    | 16 +-------
 drivers/staging/r8188eu/include/rtw_cmd.h  |  8 ++--
 drivers/staging/r8188eu/include/rtw_mlme.h |  3 +-
 drivers/staging/r8188eu/os_dep/os_intfs.c  | 14 +++----
 5 files changed, 20 insertions(+), 66 deletions(-)

-- 
2.30.2

