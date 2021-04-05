Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3723F5F
	for <linux-staging@lists.linux.dev>; Mon,  5 Apr 2021 17:29:24 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id b9so3656161wrs.1
        for <linux-staging@lists.linux.dev>; Mon, 05 Apr 2021 10:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=islgxB5cX7ryyAEWQujyZ6yBo7lGXTDZIsEo+AqSaLI=;
        b=o32v2vqh2JB2QYn2BWTwMD4LCIFxgyvadEJXKeNx02aw3z9umZ+J0PvTgWXVCnevv1
         wVg5BT6WxgPwfuZdlwkwD/5vUrCpfKz2stpoKVd7Y6LdUdAV9rjZuFSYRynZqQekY2QR
         +DB9+P8k8fappSrY4B2GwUzEKWkE4hDUwCLg9hk0mzsDo/90i7RcknEbzggN3ltgm1vQ
         iDZtN2mGoP0NE99xwCiSX1ygPfdGrf6EDDEU8l9/H4u6bUC2u4kiBWctJNJK9L70W7hF
         9m7guE2sI9tRZIDvzovoouvvjBfGlFR8//NdroUCBZjA5iVGEMdNsl0hw+F+tIYt83db
         7FGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=islgxB5cX7ryyAEWQujyZ6yBo7lGXTDZIsEo+AqSaLI=;
        b=SEIPyQ0rYitRVkvaN8K93RZSkSvrOZdURGQfaCnBjO7hC9Dg4v6WhKH5uACRWiz2t6
         LIMe04geXLm2QesZNaqoIStSB2gmJI3N0l7LDpXzeUD4ZGqqhpUyNlXumtWU9+oKWzgx
         MiYKD5+IuuGP5jIQD6ziGCjmsMtq/MJcv1L+bEKTPVJeFf4XaqbaQJLGeO6Nm2aSZjDQ
         Q3Rho3doupubKELCGq8u8XfDJX3PDkswC8rKA0RFHelt718O1EFCSevbEPlaOFKBYqoa
         x7aREQlb2Jh4NgDEsX5mwyHjl5c89HRQ68huJgGsUoFRBz6bBAOn8t28NEETZKegdybH
         zqNA==
X-Gm-Message-State: AOAM533RmQsNAs773biObdpLoL3SqoDYAzsWB9Wt39oniF4kMk20089R
	w2Zr8fJStZZh2fgaIO2MosU=
X-Google-Smtp-Source: ABdhPJwD+5GvCazXiiLVZAuxEDFL944bL9uiCr9Tf1G/ObZVWPn7R3Ei475DOTRKP1pyFjp0gFqH0Q==
X-Received: by 2002:a5d:5256:: with SMTP id k22mr30836945wrc.162.1617643762740;
        Mon, 05 Apr 2021 10:29:22 -0700 (PDT)
Received: from bcarvalho-Ubuntu.lan ([2001:818:de85:7e00:9a5b:98e6:2174:bf29])
        by smtp.gmail.com with ESMTPSA id x1sm17858699wro.66.2021.04.05.10.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 10:29:22 -0700 (PDT)
From: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Subject: [PATCH 0/4] staging: rtl8723bs: core: Patchsets cleans up in rtw_ap.c
Date: Mon,  5 Apr 2021 18:29:16 +0100
Message-Id: <cover.1617641790.git.martinsdecarvalhobeatriz@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patchset of cleans up checks of "Blank lines aren't necessary before a close
brace '}'", "Lines should not end with a '('", "line over 100 characters", 
and "Alignment should match open parenthesis" in file rtw_ap.c.

Beatriz Martins de Carvalho (4):
  staging: rtl8723bs: core: Removed extra blank line
  staging: rtl8723bs: core: Ending line with argument
  staging: rtl8723bs: core: reorganize characters so the lines are under
    100 ch
  staging: rtl8723bs: core: align arguments with open parenthesis

 drivers/staging/rtl8723bs/core/rtw_ap.c | 137 +++++++++++-------------
 1 file changed, 62 insertions(+), 75 deletions(-)

-- 
2.25.1

