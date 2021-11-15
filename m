Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFC868
	for <linux-staging@lists.linux.dev>; Mon, 15 Nov 2021 10:56:20 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id n33-20020a05600c502100b0032fb900951eso10147367wmr.4
        for <linux-staging@lists.linux.dev>; Mon, 15 Nov 2021 02:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZnKAulS/vIGrw+3FjdDPJBScIMVfc4pnUettjnr0PVs=;
        b=ggSYQtrTCDS/DratDv0dlBLFwAj9deVBsJWmMVZx6J92cEBlai4w4a/zYhbFWA2mV7
         uki7MxwwBNgiaZPFSnfikq5WhBk+c2PKjirTU2uHLU/zCBm+ZQVB+kauVivYQHIUBEDL
         PTYvpQlN7CBNt5/eJUX9auOTh45dlvEmdMzZ1nt2Mw37zVbv0N/UjrxY3ELQgLgNUYyb
         N5QMBT7cjmJq3QhJkZ1cgo7m2IqW6ByUVIx0gLa6AZ9cORiCqguX4cOYsYN68VuiYXXB
         65AriatapML1EuSHgsQoa4D0jLEai2o4Ue+vYibUy+GsC8tbRInfbjP7yMk3yMXT1Iac
         lx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZnKAulS/vIGrw+3FjdDPJBScIMVfc4pnUettjnr0PVs=;
        b=5aqIwbRnAT2DEzpJmK5TNNy2UYtmBQObbceZ/Rnq4x88tZVlzY5pEg3q1vZ0GCYmkl
         lzTBafkBoC+sEb95j1SMuAuGOZXasRLkihdwJTfug63Mh65SH01ePgKPVBajACuwPKF3
         zxFAsUPD/939bfJp+4Cubz7+fBGHjZJFKnN+x5qeB6BYSSlg/0CcWTgis6eZys0MEOiK
         7ojpVaZxkleiK/XM1sM25AfgI6i9YD4qdvrheA9JrjTQzqyAwSPQZtCYjeFt7KG8SEqx
         Nd/WRNsfcHc6sdgLoaQzFqyWDKM3iutSUHXJOl6JDVNwA0bDIguwSo3fv9eiEy3HqG4v
         2O1A==
X-Gm-Message-State: AOAM530LQ4+Ar1C66kcyAl/y4H60WyrApSEMD7pwQfmuzRHivi2Nw688
	3xAd9JHC88Q0/5N3gGotGf0=
X-Google-Smtp-Source: ABdhPJw1JuoENwuS1D5LEAiKPlSODt9xNMfu0jvXwp4q101mH6KBfQIHJsfpjCOa9V0dQI1yjhuAzA==
X-Received: by 2002:a05:600c:22cb:: with SMTP id 11mr41309165wmg.181.1636973778280;
        Mon, 15 Nov 2021 02:56:18 -0800 (PST)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id d1sm13516532wrz.92.2021.11.15.02.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 02:56:17 -0800 (PST)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH v3 0/8] staging: vt6655: Fix line wrapping in `RFvWriteWakeProgSyn`
Date: Mon, 15 Nov 2021 10:55:41 +0000
Message-Id: <cover.1636729147.git.karolinadrobnik@gmail.com>
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


Changes in v3:
  * add a patch for removing the type cast as a first change, suggested by
    Dan Carpenter <dan.carpenter@oracle.com> 
  * merge two patches (using incrementation in `idx` and cleanup) into one,
    partially implementing Dan's suggestion

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
  staging: vt6655: Remove unnecessary type casts
  staging: vt6655: Introduce `idx` variable
  staging: vt6655: Use incrementation in `idx`
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

