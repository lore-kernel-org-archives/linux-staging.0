Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A54B71
	for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 13:49:13 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id t8so3432372pfe.3
        for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 06:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/Oy/mbpvFy0BleeKa4Nb1n/BvqZ7v/6FbRfaIVQGsQk=;
        b=eOuNkl/R6zkjI9JhhKuta0t+BKjBhYkh9NAmYVmxTEXANlgWKPYdRwGwt3F+usY+tb
         6fMbtriMU1R+jaUOFIOJIr9WZSfiJB7f5IMfxVFLrtmuz1nSkvoQjKBX6xgudySWSWf/
         0QZZPWPpmKe8Bg4uI99FT7wItxdK2bLsa3EmdSqS7FCkpKCSNIx3PLbizvlHWWVmJIAQ
         jLvgEA5YpsZeLLeiMFlheEscsuaDUdpN+xhNUvv35zOAbLGRgK4vJ9/jk64QU+BsuFEN
         RSmvhZ88DOP55MH/A+KncIlHyGkBeJ/NfUmZ/Bvw4XYdiA+8tc8HzuQOG7/blhE2NZ6U
         CtSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/Oy/mbpvFy0BleeKa4Nb1n/BvqZ7v/6FbRfaIVQGsQk=;
        b=CwIkeQfd1UjIaJJVGDDaeFpj5MQbHw1wQZtADvEig0YDOCuxtUuY90bcf7jO0MYw1S
         AkVLXhkNp8sF/49K+R7Pzizcp/mTzelQh8MF1Z/cYTlO3YDLrA38Hy2WyWZWFo64oesH
         4DXUopSy2hBwHa7GMkQVOLI0CWPgYKnFls8HqTPTmJ7SRO1LFJVz7g/Y+dc4B5yQUv+P
         02MYi0gCX6GovGkNZmPU0uIa1VRvN3ivnYNuBNMJfx6r/1X5WhbfWjL1ybKLKl6kc31g
         aQA4tGZZExZTVh0ub5UzWJ0NdXJleZ1EVCes41V6rWvIzxReSD0BC1/9YD5TTGvWOCqg
         WfBw==
X-Gm-Message-State: AOAM533BMQ54nB5oxvUord83hL6ZSeDZGm2DGjC7TgAKuiDKFq176KP6
	oMlGeNxpMramSJsno9y/XsUV0zCKkFt5Zr10
X-Google-Smtp-Source: ABdhPJzFljhHvYo7LHTs8ee5cJdVvaRo3nS8pldLtlUt6V2HwO5eo1KbADdnMtwX8QTxiAxnBaluDw==
X-Received: by 2002:a05:6a00:797:b029:2f9:6ddb:9d5e with SMTP id g23-20020a056a000797b02902f96ddb9d5emr19255184pfu.35.1624283352562;
        Mon, 21 Jun 2021 06:49:12 -0700 (PDT)
Received: from localhost ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id k25sm15252008pfa.213.2021.06.21.06.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 06:49:11 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: linux-staging@lists.linux.dev
Cc: netdev@vger.kernel.org,
	Benjamin Poirier <benjamin.poirier@gmail.com>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>
Subject: [RFC 00/19] Improve the qlge driver based on drivers/staging/qlge/TODO
Date: Mon, 21 Jun 2021 21:48:43 +0800
Message-Id: <20210621134902.83587-1-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.32.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set improves qlge driver based on drivers/staging/qlge/TODO
written by Benjamin.

For the testing, the kernel was build with KASAN, UBSAN, 
DEBUG_ATOMIC_SLEEP, PROVE_LOCKING and DEBUG_KMEMLEAK enabled on a
machine from Red Hat. The machine happened to have two NICs managed by 
this qlge driver. I put these two NICs into separate network namespaces
and no errors occurred for the following tests,
    - with default MTU
        - non TCP packet
          - ping the other NIC from one NIC with different packet size, e.g.
            200, 300, 2200
        - TCP packets
          - start a http server on one NIC
            $ ip netns exec ns1 python -m http.server 8000 --bind 192.168.1.209
          - download a file from the http server using the other NIC
            curl -X GET --interface enp94s0f0 http://192.168.1.209:8000/kernel-5.11.3-300.fc34.src.rpm  -L -O
    - do the same tests with jumbo frame enabled (ip link set enp94s0f0 mtu 9000)


[1] https://lore.kernel.org/netdev/20200816025717.GA28176@f3/T/


Coiby Xu (19):
  staging: qlge: fix incorrect truesize accounting
  staging: qlge: change LARGE_BUFFER_MAX_SIZE to 4096
  staging: qlge: alloc skb with only enough room for header when data is
    put in the fragments
  staging: qlge: add qlge_* prefix to avoid namespace clashes
  staging: qlge: rename rx to completion queue and seperate rx_ring from
    completion queue
  staging: qlge: disable flow control by default
  staging: qlge: remove the TODO item of unnecessary memset 0
  staging: qlge: reorder members of qlge_adapter for optimization
  staging: qlge: remove the TODO item of reorder struct
  staging: qlge: remove the TODO item of avoid legacy/deprecated apis
  staging: qlge: the number of pages to contain a buffer queue is
    constant
  staging: qlge: rewrite do while loops as for loops in
    qlge_start_rx_ring
  staging: qlge: rewrite do while loop as for loop in qlge_sem_spinlock
  staging: qlge: rewrite do while loop as for loop in qlge_refill_bq
  staging: qlge: remove the TODO item about rewriting while loops as
    simple for loops
  staging: qlge: remove deadcode in qlge_build_rx_skb
  staging: qlge: fix weird line wrapping
  staging: qlge: fix two indentation issues
  staging: qlge: remove TODO item of unnecessary runtime checks

 drivers/staging/qlge/TODO           |  31 --
 drivers/staging/qlge/qlge.h         |  88 +++--
 drivers/staging/qlge/qlge_dbg.c     |  36 +-
 drivers/staging/qlge/qlge_ethtool.c |  26 +-
 drivers/staging/qlge/qlge_main.c    | 586 ++++++++++++++--------------
 drivers/staging/qlge/qlge_mpi.c     |  11 +-
 6 files changed, 373 insertions(+), 405 deletions(-)

-- 
2.32.0

