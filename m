Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D242D2FAE
	for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 08:18:07 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id cp15-20020a17090afb8fb029017891959dcbso10798446pjb.2
        for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 01:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YxrRajkgeOR59o34/2DpG7lBqxnZ5L/RmTpyatgnweU=;
        b=HJnfw11KuXmFKHhBdXkwkUp1xpwlSEcZNaZPFIGi8c2Wrew1jw8jzX6g2cf+c7tZGF
         XVu8gJlKTcj2GrTSeuYBgRhopiiE/FIaADgFRDdy9UGBkYMwj36Lyjp4A9q89yX7qEzf
         ytk+YUbUYm0qRnkxw6K8ulVuL5OdzCyK1HsHvST6+b9kHYcQhywEAEO2LZ7n5z9uK+gr
         bYupwFmjcOkT9bUxaPqGazgzJVVmyurCR/HC/hNStDHShyeg1mB/UNhIZZq90xLvXuP1
         PUO9Jsmt50Cw+n6ev9t1IPz8X+NvFb+WvLmBoTmftmsJdQvsljQWphUAwi5tZfdvJ7aS
         h3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YxrRajkgeOR59o34/2DpG7lBqxnZ5L/RmTpyatgnweU=;
        b=Le95PsNcvKJU/OQajp393TwLxHiqWoyIwwGcqe7DVzSOjocYGq+jxQOrrXMV+ALZV8
         bKz1Jg68pOEzRLtfs+zMWjTknVQWEeyucFSqsCCJTr1u0dQRyL2cTRoXJEKRiZhSlKzt
         1IVCKzSW2Y36ebe6SoE1Nwxeq1BvZzGX1caaMf/M34flGczyhsiibJG37JEjSxWgMK/N
         cOWWQIs4Gq4dXg61jwVMfhyoAKh4xEDWpkGfk5kywbDycWjez3hAIbz/BfRIPt1P7eGA
         FcBIWTO3NSxxf6UTKrA56vItUBP3dXGCaYtDOFTsU95mL0ceIbn1qO7yuJ3x0B6cTclc
         1wyw==
X-Gm-Message-State: AOAM532zOTvxwcXFBBm060QyL2qJl/ogWjAI+tXyp8YkQmf4nF7KEntb
	s0IEDewYdeQk4lhyO+55RRo=
X-Google-Smtp-Source: ABdhPJxOK832d+KvwH3HXdWOk3E8GBEpoaa8+vNVWMQou45om6Xw/N/xDC1oh6UVVbS1oJ07a5LnnQ==
X-Received: by 2002:a17:903:32c8:b0:12d:b0ff:9403 with SMTP id i8-20020a17090332c800b0012db0ff9403mr11017101plr.54.1629361087285;
        Thu, 19 Aug 2021 01:18:07 -0700 (PDT)
Received: from xps.yggdrasil ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id gb17sm1531129pjb.26.2021.08.19.01.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 01:18:06 -0700 (PDT)
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] staging: r8188eu: fix sparse warnings
Date: Thu, 19 Aug 2021 13:47:52 +0530
Message-Id: <cover.1629360917.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This patch series fixes some sparse warnings in rtw_brr_ext.c

Aakash Hemadri (5):
  staging: r8188eu: restricted __be16 degrades to int
  staging: r8188eu: cast to restricted __be32
  staging: r8188eu: incorrect type in csum_ipv6_magic
  staging: r8188eu: restricted __be16 degrades to int
  staging: r8188eu: incorrect type in assignment

 drivers/staging/r8188eu/core/rtw_br_ext.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)


base-commit: 093991aaadf0fbb34184fa37a46e7a157da3f386
-- 
2.32.0

