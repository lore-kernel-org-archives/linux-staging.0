Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E124171
	for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 13:51:37 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id g4so10048048pjk.0
        for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 06:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Oat56oXy+eq9YFjUfHTUBj0ELGqmUbrbNMdQSDvWOZY=;
        b=ORC1bRd2LED7D1ipCRVRCwk3nkwGhHzL4i9UqeoHbMer6DdHt2KPkye2SqXcJtIRJ3
         oVdK+u3KThOvxPQL/3F18SegSC79699zmm+A8L1iv3Sa9BiQZ1ehxXQyF2JEnSze2fFC
         UMAEEffmHyY7WUV7yU5yGcdC5NxJzNcB47UtvZsRHu4KeErayVmXrVWDmfNN5ztZYmTd
         Cvii20dPzgrlrE/07hTolkd77B4sTqYvBT9WMdQ0uSyjoyWuERKITiS0D0svh5Aa9yDy
         0BVObAXwMwutxtVPyzlv1hPvUxlwJdHyLDs0PToYLsHqZT+WNRtS+iAnjrN2Ms1ew62D
         oBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Oat56oXy+eq9YFjUfHTUBj0ELGqmUbrbNMdQSDvWOZY=;
        b=Vq8ZU0kGciKstAKGQBDL/sC+keruKhF/HNgsfnembCIL0nFofIus6yrGhLKTn54Fdu
         obQ7o3ZaNb2S4m+QU94HyeN5BZ+jpZxBmjU+HaXLX6VZWABAu7i1qKsuUanx4A99uQqT
         J2aZxDth36BANYy6eNQktYwd436umChYSXBoXYUBwh2F26FEJd82AHi0NkpHQSqKUtnN
         +2P1cmzToTpC2wOBjXoXcioBwORKsJLlBAbq2EwhfWQpX7XVZUIQciCcM/TGVCGe1Mn2
         tezTvUAkpWX5J6QU+R2DOCODeQuavSg4Btk+q6GslNDvsgUqNvMAECibCutRT8wk7b1a
         LAzQ==
X-Gm-Message-State: AOAM533ldoc2IAkdIq9RAGJ956wte3Zb5zaugvPvaktz1NZprhVbAHrn
	3El86UUVABfEIUY6MmRzk9Hhj/QJFNs297VT
X-Google-Smtp-Source: ABdhPJzJEfr27phtSC+0vjL45RQyKwZCU9Q0avkrLDXz0ep8+vIniM5cSSXGzX7VSeqGfNAYu1TzAw==
X-Received: by 2002:a17:902:9f93:b029:104:9bae:f56a with SMTP id g19-20020a1709029f93b02901049baef56amr18061276plq.75.1624283497593;
        Mon, 21 Jun 2021 06:51:37 -0700 (PDT)
Received: from localhost ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id d3sm16154940pfn.141.2021.06.21.06.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 06:51:37 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: linux-staging@lists.linux.dev
Cc: netdev@vger.kernel.org,
	Benjamin Poirier <benjamin.poirier@gmail.com>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Manish Chopra <manishc@marvell.com>,
	GR-Linux-NIC-Dev@marvell.com (supporter:QLOGIC QLGE 10Gb ETHERNET DRIVER),
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC 15/19] staging: qlge: remove the TODO item about rewriting while loops as simple for loops
Date: Mon, 21 Jun 2021 21:48:58 +0800
Message-Id: <20210621134902.83587-16-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210621134902.83587-1-coiby.xu@gmail.com>
References: <20210621134902.83587-1-coiby.xu@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since all while loops that could be written as simple for loops have
been converted, remove the TODO item.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/staging/qlge/TODO | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/qlge/TODO b/drivers/staging/qlge/TODO
index 8bb6779a5bb4..4575f35114bf 100644
--- a/drivers/staging/qlge/TODO
+++ b/drivers/staging/qlge/TODO
@@ -6,8 +6,6 @@
   split cases.
 * the driver has a habit of using runtime checks where compile time checks are
   possible (ex. ql_free_rx_buffers(), ql_alloc_rx_buffers())
-* some "while" loops could be rewritten with simple "for", ex.
-  ql_wait_reg_rdy(), ql_start_rx_ring())
 * remove duplicate and useless comments
 * fix weird line wrapping (all over, ex. the ql_set_routing_reg() calls in
   qlge_set_multicast_list()).
-- 
2.32.0

