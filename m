Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98452C81
	for <linux-staging@lists.linux.dev>; Thu, 28 Oct 2021 10:35:51 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id p14so9262004wrd.10
        for <linux-staging@lists.linux.dev>; Thu, 28 Oct 2021 03:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QAaMfHwdtZJ2KjW1qioIa8NnTSpvgBhACsmEL5jElvA=;
        b=SrXsuaZwEiK6GtpGMoXABWAl6voqIoao+Yq95iMx4d1OyRMCXPtTxr0n9gAnl2oMmN
         7tBxoWyyTRWngHQuEAbaBbTi4pF2oH1CV7w+HS9q7XebDP15brABt9MDshafkqWdOaKc
         uL68FjAKJMpKT21DQOV1JAsaxynQQ9HrT2Sbs/OgBQbID89OYM90wAcNG0tA34U9/ilB
         HDPbSCNS76EFk4i5Uo4OYuRR38doXyoOZ+jp9jhAqWyvz2tZk9nSWyt6WJjefq0KX0bY
         P4ZRGRei7ZnUeL4uqh4Ro+x+lW2EAGaOq/hQ1QbdoDH+MabS5R4Pt81++glWth1ndQrn
         2RWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QAaMfHwdtZJ2KjW1qioIa8NnTSpvgBhACsmEL5jElvA=;
        b=xVuc1xdHy90ssz3rkQMLwQdq6MK/XWi65XX7bIPZxGkTOB7ndiPzemLBaKfDGfw3TK
         lxE8tikTAmGeyLgCe9h/hUz25h9mpdkh+R0WF0alwLLXBA9DhGum75xo98+Zm0+zzy5X
         SHEFBRQ/JauOXjXLFfGL2/e3RAPNp4/ikg9PuAVghI4D7JBzY2qVYIlxhlknUbM/SoWp
         1M/9P4yCNSdMw2HBjvedEoxgeYuX2jkid+HOFRvHnbybomo3icnyU8i4IKkmjIN3yiEs
         ma2caxrsQgDd2jYz9sfgaF93zavVULRauLCceUTMxZdcj7AI7OPS54m4mD+N0ivcXlgO
         TF3Q==
X-Gm-Message-State: AOAM531czA1qQaSTidglprsOTSE4dvs1qh6+rOzD6nYQcmh8PYcAY7VY
	VEUtBl+vQ1l8U482+LVsbxo=
X-Google-Smtp-Source: ABdhPJz4lVROD9IU3nabNtd3OztQZFuT3KaBIjHUDKsK+fNyKPQ9FdLzxPB+xAaXZNYherot8Dlc7g==
X-Received: by 2002:adf:a387:: with SMTP id l7mr4399996wrb.214.1635417350063;
        Thu, 28 Oct 2021 03:35:50 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id 13sm3768083wrz.38.2021.10.28.03.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 03:35:49 -0700 (PDT)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH 0/7] staging: vt6655: Fix line wrapping in `RFvWriteWakeProgSyn`
Date: Thu, 28 Oct 2021 11:35:30 +0100
Message-Id: <cover.1635415820.git.karolinadrobnik@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set is a series of small refactorings of the function
`RFvWriteWakeProgSyn`, now renamed to `rf_write_wake_prog_syn`.
The work here allowed to shorten lines marked by checkpatch.pl as
being too long by:
  * introducing two new temporary variables (`idx` and `data`)
  * rewriting a conditional to switch between two modes of
    AL7320 initialization.

In addition to this, the patch set renames the function to align it with
the kernel coding style and updates the function description.

Karolina Drobnik (7):
  staging: vt6655: Introduce `idx` temporary variable
  staging: vt6655: Use incrementation in `idx`
  staging: vt6655: Remove unused `i` increments
  staging: vt6655: Introduce `data` temporary variable
  staging: vt6655: Rewrite conditional in AL7320 initialization
  staging: vt6655: Rename `RFvWriteWakeProgSyn` function
  staging: vt6655: Update comment for `rf_write_wake_prog_syn`

 drivers/staging/vt6655/channel.c |  2 +-
 drivers/staging/vt6655/rf.c      | 41 +++++++++++++++-----------------
 drivers/staging/vt6655/rf.h      |  2 +-
 3 files changed, 21 insertions(+), 24 deletions(-)

-- 
2.30.2

