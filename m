Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE0F33C0;
	Tue, 12 Apr 2022 19:59:23 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id d71so6522280qkg.12;
        Tue, 12 Apr 2022 12:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OSSxqX8tPYg/tg3+HY2atLHtEG2+4vSWaPUPQtk8FFs=;
        b=ME2rzraFEBzLQVyEICnGlhLGN3TYXUG40fsZvzk0YNOCUqDi+p+05CekzEMeh8zQJn
         IOe43DpXusxGAK420y04rWTM7YGwlp9Z1NW5W2U5fVSOeG95xLGy0K5CZoXHG2XG5Rrn
         Ci/TmgBDCP6sRQZtWU24HxbQg8FK8axzA8RvRss8FNfKxVojSWHjxNmIxUMZczaEpGjm
         IurY4UMmCo5QwbcVGiI6ZWXP3aOlHNYAXBlAcefoDYaeNeptXyn68wV2oqFAjeeZKBnP
         xpZOAPEeEx5U3NeK0IRuu8hqnfxwXJBRECsvswtiu1V4FZoYbi9y5BTZdgg6OwpKkdsn
         Ltzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OSSxqX8tPYg/tg3+HY2atLHtEG2+4vSWaPUPQtk8FFs=;
        b=QhPTbD7p8GSaj7vVOx0PdkmGxKWcrUtAINw9YpPgwFBq8J1QAlKdZ1YljVCqxCiUMq
         FUfn/zbrK6Bk5/0qZeLtumT4NTTa9omv2LTLDDcXP9cGwOAiqLIeblMPhYU+X2/gbmWp
         taw99I0k7dRf4QjsNm7ItjWtum58bNhLA0/Xc24i6Rl5B6LuuarlxYwle5BMS3m69vOe
         fKSDZ0UMoYr9Zu/sLivCNwHFEGvQiLFjutXD48RFxWCEwJlguCpwp7qAXceh3vR4qSxr
         Sq/e615179s3EJYqCiPGq2AGAr0yn8FfktZs7JpFzae+KxDuovG3IX5a7maYXIDyt7HG
         UjEQ==
X-Gm-Message-State: AOAM530l9vTLDKGjfaVX0el0oAwiDATHwbppBP50ohJbUxMLnxlu6OHY
	XafMWCnVtF+LmqxfEC5OO9I=
X-Google-Smtp-Source: ABdhPJzPGA2WvKxT8VEv/QVQmi6hhSwsxGpUOGCJCjo4PLAHqRM02+IDxZUA/gXJEnbYAbOmKtXTVQ==
X-Received: by 2002:a05:620a:4689:b0:67d:4c03:651c with SMTP id bq9-20020a05620a468900b0067d4c03651cmr4343932qkb.475.1649793562350;
        Tue, 12 Apr 2022 12:59:22 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.wework.com ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id t7-20020a05622a01c700b002e1b3555c2fsm27270744qtw.26.2022.04.12.12.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 12:59:21 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: johan@kernel.org
Cc: elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	jhpark1013@gmail.com
Subject: [PATCH v2 0/2] staging: greybus: fix warnings reported by checkpatch
Date: Tue, 12 Apr 2022 15:59:13 -0400
Message-Id: <cover.1649793138.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first patch corrects a typo in a comment. The second patch removes
an unneeded return.

Changes in version 2:
- edited the subject to be more concise.
- edited the log message to be more descriptive.


Jaehee Park (2):
  staging: greybus: correct typo in comment
  staging: greybus: remove unneeded return

 drivers/staging/greybus/arche-apb-ctrl.c | 2 +-
 drivers/staging/greybus/audio_codec.c    | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

-- 
2.25.1

