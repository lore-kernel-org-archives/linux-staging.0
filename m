Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE641363
	for <linux-staging@lists.linux.dev>; Mon, 11 Apr 2022 10:21:55 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id 2so14847674pjw.2
        for <linux-staging@lists.linux.dev>; Mon, 11 Apr 2022 03:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qqzor9pjG1TYg9IdQuC1oJUUk90Bi3aWHzEMNZOgNWI=;
        b=GRj2XJmEuxLk9MuNfXIRBqtrYPZlM3M/2wbiZGetnbNVwtKr5R+ul55qIFUxO1UzCP
         jE8ojn/a/ow7SB0XAeheQ9sZ6q+z1I1U6jdjtDvQJJicUSTu72neFcI92SEe9hcdeIxr
         Y5YVns+azOlep1psaVSX8tU7QuUpWk9OPtY6YWHqFQaE6qJI+ZS8pcvfC2AtBURE4I7R
         7Kz01riZEdAS5QlTP3FTBn2rL5fenLNNT78MzxWHLOEhofgD+JG/pLxjxlZTYR9Mt9nv
         CcDCVrwk187XWOtacwyNGWc1dTkgC1SACn8kjlprh1kKIh5XJaxWlvi2ORjCzO3+vdWP
         srog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qqzor9pjG1TYg9IdQuC1oJUUk90Bi3aWHzEMNZOgNWI=;
        b=p08yaPNSIMC7IAx1dbFDkxdgEptkpuMOmQ7x8biu+1eKCa259nyBGWxrHmCgJn0Qrx
         grBgcEQF46sMg/z7wPLsZWEblGjwUcewagu/u2VkZKnUEu7PJWMfpSFCwTMB6eFiMTDH
         n/sOPymZwQHTqeKCTecSJPGNoyTRWwhkQ+ozZSxKxCrJ1htLiIGUGSU9iOfsllNfyap4
         0pdniD6FINABwr5NoFkX4dXRYJO4FCd25WyVZQ7QiIftR//Rt7MfyzEM7UST8TiqlxFC
         JDxGb7R9R3YUyR8p3FgHGZRozmUGqx2Wmr9Dcj1TNTky0CSK9Lgwi2mTgIfPqzRN2uOu
         gr4g==
X-Gm-Message-State: AOAM531v5HgltwomdykjwT/Pn0IdTD7hle5eObgBDJEi1vjN3bJRd+bM
	kNDnssU0un9mIDlZoDi6CxQ=
X-Google-Smtp-Source: ABdhPJwMtswdD8i5LKlqTZJu3XXMLQxkxOHfBS/uTn6eZ686k+5+si56IuMF5pcbwT9b2nvBEdG+KA==
X-Received: by 2002:a17:902:e154:b0:158:71b7:ca8 with SMTP id d20-20020a170902e15400b0015871b70ca8mr1851201pla.21.1649672515341;
        Mon, 11 Apr 2022 03:21:55 -0700 (PDT)
Received: from makvihas.localhost.com ([2405:201:202b:15:4376:c658:ae1e:1781])
        by smtp.gmail.com with ESMTPSA id z14-20020a17090a170e00b001cb7e69ee5csm4886318pjd.54.2022.04.11.03.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 03:21:55 -0700 (PDT)
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
Subject: [PATCH v2 0/7] drop some unnecessary wrappers
Date: Mon, 11 Apr 2022 15:51:29 +0530
Message-Id: <20220411102136.14937-1-makvihas@gmail.com>
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

v1 -> v2:
Drop the wrapper functions with underscores prefixed.

Vihas Makwana (7):
  staging: r8188eu: drop unnecessary wrapper _rtw_free_cmd_priv
  staging: r8188eu: drop unnecessary wrapper _rtw_init_cmd_priv
  staging: r8188eu: drop unnecessary wrapper _rtw_init_evt_priv
  staging: r8188eu: drop unnecessary wrapper _rtw_init_mlme_priv
  staging: r8188eu: drop unnecessary wrapper _rtw_free_mlme_priv
  staging: r8188eu: drop unnecessary wrapper _rtw_alloc_network
  staging: r8188eu: drop unnecessary wrapper _rtw_dequeue_cmd

 drivers/staging/r8188eu/core/rtw_cmd.c     | 145 +++++++----------
 drivers/staging/r8188eu/core/rtw_mlme.c    | 179 +++++++++------------
 drivers/staging/r8188eu/include/rtw_mlme.h |   4 +-
 3 files changed, 135 insertions(+), 193 deletions(-)

-- 
2.30.2

