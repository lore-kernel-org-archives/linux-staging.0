Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BD95F
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 20:06:25 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id w8so10085174pjf.4
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 13:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=BRuM09+J2aRYPZ9OUTp8R2fLyI9MYToqI7peFMSk8bU=;
        b=lAAjckvzUujgug8k3+FTIryj68kvDL02K8IHYw3YEo7xayLfRq29/56j0AleZqRWmO
         MDKvhVMKrTw8/hC2PD8PmBjm6C/hT60ToS4UQQuL+VzFptkWlcTn296vC08QtiRjBzIU
         qTbtF56f0pARvIlV498lLIHWT7wzZk6Xe2Q3xjqKKyGk7ZIWYydCcHsiiJwZxPXu2+3S
         HdagR7njK7ErZ7/pAx7LyjpxBWEu5Sc8KgF5rpqHa3fNdYrHeodE8FEYEa+czQNMgmiW
         kBURRanz0kXdXPa/BOo6lik3yXnAu31YJk7tXGE5xzosh4Sy7JYNFTsatXMMy3SJ+ef/
         JZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=BRuM09+J2aRYPZ9OUTp8R2fLyI9MYToqI7peFMSk8bU=;
        b=CDf3XelXE7bDPX+mRr3gpqjzxNdMDpgtcS8+fJNM+H2eXuOjiEcezv2vJ2exXB4M+b
         J31m1jfMfvgG4HNqiodDPxWFuyUZlMRjxJ5O4Dp1WeGqzlDEYw9nVzeJcmfeDGxm9uPB
         V5fAII2g5BnfYHVknShGOhVmvrHeQaiJxwUHYzu05biLS9rllPiraFu7sAHPIH9hLiYT
         qUqMsuX/kbLqry0LNvJogV7qT9xIIZrMbNGtTLq6bsSg2NmpFZAZNMzrzEIgBhuyvj2j
         3SmECTAVSFRKOM7hxkOIsefS1Ejgd+RO7K+TPm69Qkr3Q1vUwMJUUf1HLig0Bmh6Keau
         rcYQ==
X-Gm-Message-State: AOAM531TSJ6BLqlYz161ZYdM2pMCHdayVn0Bu36bLJ8Nh0vN1Z5+04hy
	Ym6gPA7tngvU4vHAbmo9cxU=
X-Google-Smtp-Source: ABdhPJwWCA498WxMX0SwPucZ1+YRNBumZ/NsIqqI8w29sQPpE8+Kt23WJFbltg5pKSkZiVBRQ+CRRA==
X-Received: by 2002:a17:90b:2284:: with SMTP id kx4mr4958415pjb.96.1617221185463;
        Wed, 31 Mar 2021 13:06:25 -0700 (PDT)
Received: from djbComp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id d22sm2985668pjx.24.2021.03.31.13.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 13:06:25 -0700 (PDT)
From: Deborah Brouwer <deborahbrouwer3563@gmail.com>
To: gregkh@linuxfoundation.org,
	ross.schm.dev@gmail.com,
	marcocesati@gmail.com,
	fabioaiuto83@gmail.com,
	dan.carpenter@oracle.com,
	phil@philpotter.co.uk,
	amarjargal16@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com,
	Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH 0/3] Fix block comment warnings
Date: Wed, 31 Mar 2021 13:05:34 -0700
Message-Id: <cover.1617221075.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

This patchset fixes checkpatch warnings arising
from the block comments

Deborah Brouwer (3):
  staging: rtl8723bs: core: fix repeated word warning
  staging: rtl8723bs: core: fix block comment warning
  staging: rtl8723bs: core: remove empty comment

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 61 +++++++++++------------
 1 file changed, 28 insertions(+), 33 deletions(-)

--
2.17.1

