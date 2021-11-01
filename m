Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6478668
	for <linux-staging@lists.linux.dev>; Mon,  1 Nov 2021 14:32:19 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id a20-20020a1c7f14000000b003231d13ee3cso17294119wmd.3
        for <linux-staging@lists.linux.dev>; Mon, 01 Nov 2021 07:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nk+zvXAt/yARZGxNV8fi4WGClbaS5+zS5+rohIvR53Y=;
        b=GUcjWsJLUg2Lf2WmjGU/RQeJcsua7eeLBxuChpYxP84Ylg2tZelUYkJxQv6ZXlVeO7
         8mWWgVkxsk4XcBhKxmMdwwd7kC26Qzw/3/WLIqBwgFt6nMyOezDBclDAi/HkCCj9iK6Y
         uZMweyotbPljtq08Efsdx4usDZu+iDk5BD/tfgZwAvNREUEcCu7TzLlMpX+ud5K0o+UQ
         LxTioXUX0OAobNBRFNMQkQ2bEpgYthF+RKOdSGIw9V+6WoqJmvZjRo7MnNw1M0/Yx5C4
         Ov65aJlQLKr6DrHSmrgecYBxlK6gGri5rS2rn8kKEB036vmgIC0dLcy3vtmz46+rI4CU
         Gbwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nk+zvXAt/yARZGxNV8fi4WGClbaS5+zS5+rohIvR53Y=;
        b=jPeXHKYIvr7BBIqmpZFkRr8FHF+X3kANu5ikTcsULhCVPJegzoFc/y8EJdwyXtIopZ
         EGYFgyPooNJYTVgWXnWApxGZaYGZo6MVuKnOsA3qt51jJ6MgY41o7xBcEPvL6X+8LKkw
         1YDnZM/RXRQ/ko/TaQCBm0xmMlQMbLsLtR7fFfCwNR7GRA1lArInqL+pQm9gEXpJt34/
         iL/WDWo3NlmUW9VetOYe5rW0uVQPzokTmvT2C2t+wB6C/clNiUaYdwiKSwIKKLZuL0gF
         lEvZ8ZecG5t7dgnpKMZNRg700yWB1q79I+1+FMFerlPVqbHFVaNm3RVfE9CKw/VqkZM/
         B47A==
X-Gm-Message-State: AOAM532+nq5+Fvbm9X6cEAyr+lAWAaGz5d+YbzrOA/1ZTfB/q31MooLE
	pYfJC5EBEoKPN+NRPjR6DQE=
X-Google-Smtp-Source: ABdhPJzh/TukZxPlocC0fnpJzW8NxmJVcRR7+AL1erPqINggPG3XDXjtuK7yb/AS3p2jYC9Js1HIew==
X-Received: by 2002:a1c:f405:: with SMTP id z5mr31418913wma.72.1635777137721;
        Mon, 01 Nov 2021 07:32:17 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id l8sm17157721wry.43.2021.11.01.07.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 07:32:17 -0700 (PDT)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH v2 0/8] subject: staging: vt6655: Fix line wrapping in `RFvWriteWakeProgSyn`
Date: Mon,  1 Nov 2021 14:31:58 +0000
Message-Id: <cover.1635773679.git.karolinadrobnik@gmail.com>
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
  * introducing two new temporary variables (`idx` and `init_table`)
  * rewriting a conditional to switch between two modes of
    AL7320 initialization.

In addition to this, the patch set renames the function to align it with
the kernel coding style, updates the function description and removes two
unnecessary conditionals checking if the value of `init_count` is lower than
a predefined value.

Changes in v2:
  * drop "staging: vt6655: Introduce `data` temporary variable" patch, suggested
    by Julia Lawall <julia.lawall@inria.fr> 
  * amend "staging: vt6655: Rewrite conditional in AL7320 initialization" patch
    to use indexing and `init_table` temporary variable
  * add two new patches to remove unnecessary checks for init count, suggested
    by Mike Rapoport <mike.rapoport@gmail.com>:
      - "staging: vt6655: Delete bogus check for `init_count` in AL2230"
      - "staging: vt6655: Delete bogus check for `init_count` in AL7230"

Karolina Drobnik (8):
  staging: vt6655: Introduce `idx` temporary variable
  staging: vt6655: Use incrementation in `idx`
  staging: vt6655: Remove unused `i` increments
  staging: vt6655: Rewrite conditional in AL7320 initialization
  staging: vt6655: Rename `RFvWriteWakeProgSyn` function
  staging: vt6655: Update comment for `rf_write_wake_prog_syn`
  staging: vt6655: Delete bogus check for `init_count` in AL2230
  staging: vt6655: Delete bogus check for `init_count` in AL7230

 drivers/staging/vt6655/channel.c |  2 +-
 drivers/staging/vt6655/rf.c      | 44 +++++++++++++-------------------
 drivers/staging/vt6655/rf.h      |  2 +-
 3 files changed, 20 insertions(+), 28 deletions(-)

-- 
2.30.2

