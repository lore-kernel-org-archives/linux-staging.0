Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC16219E4
	for <linux-staging@lists.linux.dev>; Mon, 25 Sep 2023 15:54:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39800C433C8;
	Mon, 25 Sep 2023 15:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695657269;
	bh=VbwuYfSftjz4yAlzxKgg+THJnGjMCtfrUoHPB+hCAGI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T0MwjoFQyuNUeUaE2hTBr1gh5Sz2OLJTVdVvw/FqELkETvLI8+stNeQMILiRP9run
	 JxmrQiDjBbqisGW9HmUZ9VZk3XCZ0aCMX85iw6YApZZAb/bALSjfpWyMs6m1bpkGL8
	 PvbC1Y6a972zMHFwHd64OZ7QUcGSj0MgNsPDC1FwJfM6EpAyvupj9elnTaecoOEIhA
	 wCIjC7c9cDCiwKCjm6gx1zwtG1tcepvTy7mmHHz238J7yV1entUqyjQ/hjd4y0/g7t
	 G6VNZiH2lKqVvdxEEt+HeOl6zm5UQnNE9xrVHpnGGD9n0jbKDf87KGEIABFNd3tzRY
	 c832cDme1GApA==
From: Arnd Bergmann <arnd@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Tree Davies <tdavies@darkphysics.net>,
	Yogesh Hegde <yogi.kernel@gmail.com>,
	Sumitra Sharma <sumitraartsy@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] staging: rtl8192e: remove bogus __packed annotations
Date: Mon, 25 Sep 2023 17:54:04 +0200
Message-Id: <20230925155413.471287-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230925155413.471287-1-arnd@kernel.org>
References: <20230925155413.471287-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The rtllib_rxb structure contains a pointer, so this is not a hardware
structure but could benefit from loading the pointer in a single
instruction rather than assembling it from four or eight individual
bytes.

Both structures are allocated as part of larger structure that
already enforce at least a 4-byte alignment, so there is no
reason to ever have to deal with misaligned definitions.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/staging/rtl8192e/rtllib.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 7d26910a0b162..fe7b58ae33995 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -172,7 +172,7 @@ struct sw_chnl_cmd {
 	u32			Para1;
 	u32			Para2;
 	u32			msDelay;
-} __packed;
+};
 
 /*--------------------------Define -------------------------------------------*/
 #define MGN_1M		  0x02
@@ -707,7 +707,7 @@ struct rtllib_rxb {
 	struct sk_buff *subframes[MAX_SUBFRAME_COUNT];
 	u8 dst[ETH_ALEN];
 	u8 src[ETH_ALEN];
-} __packed;
+};
 
 union frameqos {
 	u16 shortdata;
-- 
2.39.2

