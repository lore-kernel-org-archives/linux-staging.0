Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CF710A03
	for <linux-staging@lists.linux.dev>; Fri, 20 Oct 2023 12:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D1TsTbsC"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7789a4c01easo47633485a.0
        for <linux-staging@lists.linux.dev>; Fri, 20 Oct 2023 05:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697805931; x=1698410731; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FY35Cbfn5zj5Ipo1600m6sKYcyjqxN0EYqA8P1Am52U=;
        b=D1TsTbsCXdv6jZsXcb3Dgh4jc+woyLcC0JKAHSw5RoHvEmbGdTLTOLW0DY7cxEof49
         RDxfSlCIp8iyKTCQrHldNrP4ziQhQcMMEVM9QLfOCPewgmrohk4hEbSxj16kqgidQLg8
         5mhFmnDV/W9V6IqEoK7M3+0MQ28XDAVYJ9O+XfMtdjNovaOqbrw8mUZxAK+gs2hEYGbV
         lkiNLRadA2sCYmUiTg2lEa3YtUvQIC5oYDuiQHxK7aPNJuSz8/5CzNNIgE8DpMzAg/+F
         60TFL+Igd0MU9qbC/pft5MKm+uwoRBs6EzqGQqmyrTLRc/OQOBxdmhacgYbnJc5jnV12
         ZnZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697805931; x=1698410731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FY35Cbfn5zj5Ipo1600m6sKYcyjqxN0EYqA8P1Am52U=;
        b=Bky9AjKUeRJBxEC5sadfOdFpYAy6Z1WuhYpGYAT0/5fQakQL6RSRJEIA1tzNKU0V9c
         KCnDr4XgQoS1pIzBBO6fbn17NvTSzsSZziR/iB7ZyworZNXoKgF0YIjXkuM3Kz6OwZFp
         uD4tSkDWGTuWWvdGZW7aqbYm50TIvVG4Tm/Z1JZfZ+LbUBr3pBAMOG4adgJTrzk5jVNx
         ZOrivZqeN4RX59GBUtdWiJF+SUtwcZpn3gbIwJgw1OXcnl+LcSE2zUu8W9dvL/z2p3zB
         75bHVfY7rec3/Uq5BTLscXIjdzsC8/NQsNOXBAmpZaX6xfVRjGszO8RD3aL5UvjCc/PZ
         ElIg==
X-Gm-Message-State: AOJu0YzbOpBcHg0eIH9JL6XTQVJrno2ONRwdznQIhJdzB/vSxhc5WJjE
	6Wz2bTEz8jfT+iJdnNiXaW0=
X-Google-Smtp-Source: AGHT+IGEw0YWk9e28NRXWQWBzJ1lPljHRuRkDb+Mshzfx2wmhsg5X+NFekA/Mxidgs2E5vA4dVhMVw==
X-Received: by 2002:a05:620a:29d1:b0:776:5135:d98c with SMTP id s17-20020a05620a29d100b007765135d98cmr1847767qkp.15.1697805930618;
        Fri, 20 Oct 2023 05:45:30 -0700 (PDT)
Received: from localhost (modemcable065.128-200-24.mc.videotron.ca. [24.200.128.65])
        by smtp.gmail.com with ESMTPSA id m26-20020ae9e71a000000b00767dba7a4d3sm571948qka.109.2023.10.20.05.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 05:45:30 -0700 (PDT)
From: Benjamin Poirier <benjamin.poirier@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Ian Kent <raven@themaw.net>,
	Sven Joachim <svenjoac@gmx.de>,
	Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>,
	Sumitra Sharma <sumitraartsy@gmail.com>,
	Ricardo Lopes <ricardoapl.dev@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Manish Chopra <manishc@marvell.com>,
	Coiby Xu <coiby.xu@gmail.com>
Subject: [PATCH 1/2] staging: qlge: Update TODO
Date: Fri, 20 Oct 2023 08:44:56 -0400
Message-ID: <20231020124457.312449-2-benjamin.poirier@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231020124457.312449-1-benjamin.poirier@gmail.com>
References: <20231020124457.312449-1-benjamin.poirier@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update TODO file to reflect the changes that have been done:
* multiple functions were renamed to have the "qlge_" prefix in commit
  f8c047be5401 ("staging: qlge: use qlge_* prefix to avoid namespace
  clashes with other qlogic drivers")
* a redundant memset() was removed in commit 953b94009377 ("staging: qlge:
  Initialize devlink health dump framework")
* the loop boundary in ql(ge)_alloc_rx_buffers() was updated in commit
  e4c911a73c89 ("staging: qlge: Remove rx_ring.type")
* pci_enable_msi() was replaced in commit 4eab532dca76 ("staging:
  qlge/qlge_main.c: Replace depracated MSI API.")
* pci_dma_* were replaced in commit e955a071b9b3 ("staging: qlge: replace
  deprecated apis pci_dma_*")
* the while loops were rewritten in commit 41e1bf811ace ("Staging: qlge:
  Rewrite two while loops as simple for loops")
* indentation was fixed in commit 0eb79fd1e911 ("staging: qlge: cleanup
  indent in qlge_main.c")

I also slipped in one new TODO item, naughty me!

Signed-off-by: Benjamin Poirier <benjamin.poirier@gmail.com>
---
 drivers/staging/qlge/TODO | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/qlge/TODO b/drivers/staging/qlge/TODO
index c76394b9451b..7e277407033e 100644
--- a/drivers/staging/qlge/TODO
+++ b/drivers/staging/qlge/TODO
@@ -1,7 +1,7 @@
 * commit 7c734359d350 ("qlge: Size RX buffers based on MTU.", v2.6.33-rc1)
   introduced dead code in the receive routines, which should be rewritten
   anyways by the admission of the author himself, see the comment above
-  ql_build_rx_skb(). That function is now used exclusively to handle packets
+  qlge_build_rx_skb(). That function is now used exclusively to handle packets
   that underwent header splitting but it still contains code to handle non
   split cases.
 * truesize accounting is incorrect (ex: a 9000B frame has skb->truesize 10280
@@ -17,17 +17,12 @@
 * the flow control implementation in firmware is buggy (sends a flood of pause
   frames, resets the link, device and driver buffer queues become
   desynchronized), disable it by default
-* some structures are initialized redundantly (ex. memset 0 after
-  alloc_etherdev())
 * the driver has a habit of using runtime checks where compile time checks are
-  possible (ex. ql_free_rx_buffers(), ql_alloc_rx_buffers())
+  possible (ex. qlge_free_rx_buffers())
 * reorder struct members to avoid holes if it doesn't impact performance
-* avoid legacy/deprecated apis (ex. replace pci_dma_*, replace pci_enable_msi,
-  use pci_iomap)
-* some "while" loops could be rewritten with simple "for", ex.
-  ql_wait_reg_rdy(), ql_start_rx_ring())
+* use better-suited apis (ex. use pci_iomap() instead of ioremap())
 * remove duplicate and useless comments
-* fix weird line wrapping (all over, ex. the ql_set_routing_reg() calls in
+* fix weird line wrapping (all over, ex. the qlge_set_routing_reg() calls in
   qlge_set_multicast_list()).
-* fix weird indentation (all over, ex. the for loops in qlge_get_stats())
+* remove useless casts (ex. memset((void *)mac_iocb_ptr, ...))
 * fix checkpatch issues
-- 
2.42.0

