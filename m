Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F59F39A
	for <linux-staging@lists.linux.dev>; Sun, 23 Oct 2022 20:05:40 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id f9so2672680pgj.2
        for <linux-staging@lists.linux.dev>; Sun, 23 Oct 2022 13:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6sPUPb6oRl7KEqD6mV4SRu4u5doWDjb3blZucpwF334=;
        b=n/6o2lGh9DT0UTU0OI91LTHKxInhidxtX42U/UHHdGpfGD1dvmoFK7+znOdm7d2eim
         Gt4PcxRDtV/rg0FOxugPT3Z+VT75Yk84whGAp9Z0HPH2FBRiLj+8iD9g7y4bQ7uNex5x
         rR6YC4+T4jhEccaYmgyuLXf4QX+WJ8j0qsMzt2mo7JGHFWcZHvsPM4JgGH6crl0veeCm
         I4QwJXr1gcmCfys7Q4L4GBAxsSuG2xjgQlQcn9Zp9oE7cuIs6W59wgelTH4cwFni2UOb
         0lPur2WFLtA+2T31jPxBy+gdKUeXk65Yjzrlueo2SDZJeIGCpGia1+LEolRGioLkKxpE
         8Rpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sPUPb6oRl7KEqD6mV4SRu4u5doWDjb3blZucpwF334=;
        b=yllYMA5QuUL6eVwayBUasgPqHVyPxgvew5QSRrPGvhl8qeIWvLhZZAnzcpZPXq7ZKw
         CZJw7DQtPXtbk0qQjw1CkcRepPEqSzPfMYwTI5gER6CR/WS3U8PAVl1tlnCByjLLB/ND
         rWrIbXVzr9GkMyQ5mcxeLfFgqcdsDLAWDOwWXhz07Nf5RI1OhRrxgkzYUZL4UllcP077
         B14Vcdjjli+Og3BkFtXVg93GjGaHiuTIA2x4Jusy8IiQ+xW2W837U3ufL00nCU2L3MM3
         0zA55iwg/snsZ8UiJULiDkhxgE3PvubMilzIhMbD29CTZ/vfuV/R33KH5fTZnCnhS/dp
         A9Cw==
X-Gm-Message-State: ACrzQf3A4fBlU5vT8B5JsEUXvn/K7iMi3yd2nd6hK31Uqn4DjRixDaRx
	V96ZQwnArrunUqgIWHpgOYY=
X-Google-Smtp-Source: AMsMyM5dnunP5CXd5LNnMnemSewA8Nz4tf0FT3lhkKpCyI127u8FnW/CPxYORVuzCNrlsMBjUuug2A==
X-Received: by 2002:a63:90c8:0:b0:46e:cd36:adb3 with SMTP id a191-20020a6390c8000000b0046ecd36adb3mr9255961pge.487.1666555539477;
        Sun, 23 Oct 2022 13:05:39 -0700 (PDT)
Received: from uftrace.. ([14.5.161.231])
        by smtp.gmail.com with ESMTPSA id e13-20020aa798cd000000b0056bc0578c7dsm1130649pfm.110.2022.10.23.13.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Oct 2022 13:05:38 -0700 (PDT)
From: Kang Minchul <tegongkang@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kang Minchul <tegongkang@gmail.com>
Subject: [PATCH 0/4] staging: r8188eu: cleaning up unused variable
Date: Mon, 24 Oct 2022 05:05:28 +0900
Message-Id: <20221023200532.259276-1-tegongkang@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series cleans up unused variables in r8188eu
causing coccicheck warnings.

Kang Minchul (4):
  staging: r8188eu: remove unnecessary variable in ioctl_linux
  staging: r8188eu: remove unnecessary variable in rtw_recv
  staging: r8188eu: remove unnecessary variable in rtl8188eu_xmit
  staging: r8188eu: remove unnecessary variable in rtw_ap

 drivers/staging/r8188eu/core/rtw_ap.c        | 5 ++---
 drivers/staging/r8188eu/core/rtw_recv.c      | 3 +--
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c | 3 +--
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 4 +---
 4 files changed, 5 insertions(+), 10 deletions(-)

-- 
2.34.1

