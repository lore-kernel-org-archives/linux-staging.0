Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B08F70
	for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 20:40:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D9F1610A3;
	Thu, 12 Aug 2021 20:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628800844;
	bh=WXt4WjrXIsQ5V3gLQj7w2S6SifGn5Hdj7ei31A/7HtM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oE0lPx5OG4uZaHVIJmSTDO1p0UbXfp1GGaZJ8u+k6OZm11f/IrqZWchtkA9kI+gpF
	 PeTTUkZwxhwcn7Kl2pHYWn6WAEz0NnMXv8uO2SQnZpk7ob+gWl8hCQXz/RPNdHIbqI
	 gNCaQojFIwtfOpStK14rO72u09uuVLOFloRA7DVR6WaM+sx6/kihOYsRpxHL4rSzFg
	 SIYGN9HAlnLyIErwJGlemIj89HSGyUVOIBhDPhRj6dYkRrixOGmowBpI1SHkPapBC1
	 096s7Z6YLYHZwh7KkHXob39WrkSYPYoH1xvWTgBfSYnIFh2DXM6U4nHOzMzVlfRFxl
	 92UKLeyol2UJA==
From: Nathan Chancellor <nathan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Phillip Potter <phil@philpotter.co.uk>,
	Larry Finger <Larry.Finger@lwfinger.net>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 1/3] staging: r8188eu: Remove unused static inline functions in rtw_recv.h
Date: Thu, 12 Aug 2021 13:40:25 -0700
Message-Id: <20210812204027.338872-2-nathan@kernel.org>
X-Mailer: git-send-email 2.33.0.rc2
In-Reply-To: <20210812204027.338872-1-nathan@kernel.org>
References: <20210812204027.338872-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After commit 987219ad34a6 ("staging: r8188eu: remove lines from Makefile
that silence build warnings"), clang warns several times:

In file included from
drivers/staging/r8188eu/os_dep/../include/drv_types.h:22:
drivers/staging/r8188eu/os_dep/../include/rtw_recv.h:395:9: warning:
variable 'buf_desc' is uninitialized when used here [-Wuninitialized]
        return buf_desc;
               ^~~~~~~~
drivers/staging/r8188eu/os_dep/../include/rtw_recv.h:391:25: note:
initialize the variable 'buf_desc' to silence this warning
        unsigned char *buf_desc;
                               ^
                                = NULL
drivers/staging/r8188eu/os_dep/../include/rtw_recv.h:412:52: warning:
variable 'buf_star' is uninitialized when used here [-Wuninitialized]
        precv_frame = rxmem_to_recvframe((unsigned char *)buf_star);
                                                          ^~~~~~~~
drivers/staging/r8188eu/os_dep/../include/rtw_recv.h:410:14: note:
initialize the variable 'buf_star' to silence this warning
        u8 *buf_star;
                    ^
                     = NULL
2 warnings generated.

The functions that these warnings come from are not used or are called
from functions that are not used so just remove them to remove the
warnings.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/staging/r8188eu/include/rtw_recv.h | 46 ----------------------
 1 file changed, 46 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_recv.h b/drivers/staging/r8188eu/include/rtw_recv.h
index 857269ae4209..81594e7aed51 100644
--- a/drivers/staging/r8188eu/include/rtw_recv.h
+++ b/drivers/staging/r8188eu/include/rtw_recv.h
@@ -386,52 +386,6 @@ static inline u8 *recvframe_pull_tail(struct recv_frame *precvframe, int sz)
 	return precvframe->rx_tail;
 }
 
-static inline unsigned char *get_rxbuf_desc(struct recv_frame *precvframe)
-{
-	unsigned char *buf_desc;
-
-	if (precvframe == NULL)
-		return NULL;
-	return buf_desc;
-}
-
-static inline struct recv_frame *rxmem_to_recvframe(u8 *rxmem)
-{
-	/* due to the design of 2048 bytes alignment of recv_frame,
-	 * we can reference the struct recv_frame */
-	/* from any given member of recv_frame. */
-	/*  rxmem indicates the any member/address in recv_frame */
-
-	return (struct recv_frame *)(((size_t)rxmem >> RXFRAME_ALIGN) << RXFRAME_ALIGN);
-}
-
-static inline struct recv_frame *pkt_to_recvframe(struct sk_buff *pkt)
-{
-	u8 *buf_star;
-	struct recv_frame *precv_frame;
-	precv_frame = rxmem_to_recvframe((unsigned char *)buf_star);
-
-	return precv_frame;
-}
-
-static inline u8 *pkt_to_recvmem(struct sk_buff *pkt)
-{
-	/*  return the rx_head */
-
-	struct recv_frame *precv_frame = pkt_to_recvframe(pkt);
-
-	return	precv_frame->rx_head;
-}
-
-static inline u8 *pkt_to_recvdata(struct sk_buff *pkt)
-{
-	/*  return the rx_data */
-
-	struct recv_frame *precv_frame = pkt_to_recvframe(pkt);
-
-	return	precv_frame->rx_data;
-}
-
 static inline int get_recvframe_len(struct recv_frame *precvframe)
 {
 	return precvframe->len;
-- 
2.33.0.rc2

