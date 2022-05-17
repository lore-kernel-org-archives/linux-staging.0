Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5631383
	for <linux-staging@lists.linux.dev>; Tue, 17 May 2022 14:06:37 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id nk9-20020a17090b194900b001df2fcdc165so2603995pjb.0
        for <linux-staging@lists.linux.dev>; Tue, 17 May 2022 07:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nQgF3isZDKLWuH4ifhpSCAZBSH+rYxzOtBZkOg2gi8U=;
        b=IKPT3GX934EYxIcfasHxe3tTubPIVtfAnAYWZyhpW6GwiiQm8Q6EvrP2+PB8BY19Uq
         z+jk5+9YM1zPXzRO5OQ7YUIp53As19xlDBYBdy/uEzcOAzGRVrhjAkq966jbCHsoAuKA
         tOWVI/NRZcv3Z4czEtGycQ0WEj+LhunFeJpIocarnusiOo+7JDpn55cQKQjKPbzbPzda
         jtCH5gPbtVtnb+8C5U+OuKDP8CPrGLOgJgPa4aUyWbfiH1obfiNEQufp5X5lHBqLDJoU
         cdKP0lDpxewvCjYEm23e5/TfGWuFdwVpYaXJDFtfOQhzGYQhxMDHhnS4EUfrHf+vXMm4
         fi5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nQgF3isZDKLWuH4ifhpSCAZBSH+rYxzOtBZkOg2gi8U=;
        b=RyYNE7bT2QHHtO+HA6bzblikSaE7CAwlcFJWpKdO6iXXu0PXZgcuY/f9bbovHvewMQ
         UMqu7Kn7dG3040D0XnRALxDRWJzgeLg14Mm058wFbXplG5feHd0KWME7dw+3VPDojkGh
         esB6UD0bihFL+UY2puYeBzJR4LnrUaWKQ+JEOgdRsoV6Pw2JXjAjF6zyv2WE3vOWZ4vz
         e7v7Rsu+lqCzz++MfrNpS2gPTOUK1QVw6+SAeBhQoXRZuV0mnxkXB6dUuJ7/hDW3+eub
         sVo27CjSb2GJ2KxWDsy74oZH1EyRgpOqKx2nD1886iB2qhlYhtkD1pNBI19rZChlgCnx
         iNYQ==
X-Gm-Message-State: AOAM530LdfLDcDcpviRw0zS/sfftO7XWs2r6JIKTGB+NgsaTzgErmon0
	7n6R6Ad4rNNgxjFZLnGzfLs=
X-Google-Smtp-Source: ABdhPJwg4wnpKRIv3claIbAuADoipHj0NqvZyKT11KCxorFdy2PIfBueO5522lxLSA+hZo/YBz6iVA==
X-Received: by 2002:a17:90b:1651:b0:1dc:aec3:c17 with SMTP id il17-20020a17090b165100b001dcaec30c17mr25037491pjb.43.1652796396778;
        Tue, 17 May 2022 07:06:36 -0700 (PDT)
Received: from makvihas.localhost.com ([2405:201:202b:1:3174:ae5c:a49e:4e77])
        by smtp.gmail.com with ESMTPSA id z34-20020a631922000000b003f27f91135asm3113289pgl.76.2022.05.17.07.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 07:06:36 -0700 (PDT)
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
Subject: [PATCH v2 0/3] staging: r8188eu: fix some warnings 
Date: Tue, 17 May 2022 19:36:23 +0530
Message-Id: <20220517140626.3716-1-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset fixes following checkpatch warning:
    WARNING: Comparisons should place the constant on the right side of the test

Compiled tested only.

v1 -> v2:
  Fixed subject line and removed extra spaces.

Vihas Makwana (3):
  staging: r8188eu: fix warnings in rtw_p2p
  staging: r8188eu: fix warnings in rtw_pwrctrl
  staging: r8188eu: fix warnings in rtw_wlan_util

 drivers/staging/r8188eu/core/rtw_p2p.c       |  8 ++++----
 drivers/staging/r8188eu/core/rtw_pwrctrl.c   | 12 ++++++------
 drivers/staging/r8188eu/core/rtw_wlan_util.c |  2 +-
 3 files changed, 11 insertions(+), 11 deletions(-)

-- 
2.30.2

