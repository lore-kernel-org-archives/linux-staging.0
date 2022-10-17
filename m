Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A1E2F27;
	Mon, 17 Oct 2022 16:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666024309; bh=5Yb+4ARq0ilueDytZ8Aus4VvXa+Y2d6ob8lG8tdYn6Q=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=DBiNru1rwGsndvb1zvVhRATyquIvXFopsqiwtzvZ3xq3wBzL/EQuu+quMmYDl6b+p
	 9Oo9Sk1CCh3jJ8Qdq+qLRTkeY2AuLGamWayCbUaSdaleTcCSx4OHQPanBjUirLgOhZ
	 VduQ7mu3U4wEjikmPc1Cg1WY9EQ1K9uYzOsdGHDc=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
	via [213.182.55.206]
	Mon, 17 Oct 2022 18:31:49 +0200 (CEST)
X-EA-Auth: meiLiH2MjlqbGeP19xG3i5vTjOcBFdWpEMpA6VJRjK1RxUQRQ+qOTmbj7ivi43w+fWgY/6qsxOaQrsReyV7DzTCWa8jKfopK
Date: Mon, 17 Oct 2022 21:32:17 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, paskripkin@gmail.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: kumarpraveen@linux.microsoft.com, saurabh.truth@gmail.com
Subject: [PATCH v1 4/4] staging: r8188eu: use htons macro instead of
 __constant_htons
Message-ID: <cb4c340251fe80ea9f83c2530f6a624219701c10.1666021212.git.drv@mailo.com>
References: <cover.1666021212.git.drv@mailo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1666021212.git.drv@mailo.com>

Macro "htons" is more efficient and clearer. It should be used for
constants instead of the __contast_htons macro. Resolves following
checkpatch script complaint:
        WARNING: __constant_htons should be htons

Signed-off-by: Deepak R Varma <drv@mailo.com>
---

Changes in v1:
   1. Correct spelling in patch description.

 drivers/staging/r8188eu/core/rtw_br_ext.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index 14797c2d6d76..718133c991d7 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -609,14 +609,14 @@ void dhcp_flag_bcast(struct adapter *priv, struct sk_buff *skb)
 	if (!priv->ethBrExtInfo.dhcp_bcst_disable) {
 		__be16 protocol = *((__be16 *)(skb->data + 2 * ETH_ALEN));

-		if (protocol == __constant_htons(ETH_P_IP)) { /*  IP */
+		if (protocol == htons(ETH_P_IP)) { /*  IP */
 			struct iphdr *iph = (struct iphdr *)(skb->data + ETH_HLEN);

 			if (iph->protocol == IPPROTO_UDP) { /*  UDP */
 				struct udphdr *udph = (struct udphdr *)((size_t)iph + (iph->ihl << 2));

-				if ((udph->source == __constant_htons(CLIENT_PORT)) &&
-				    (udph->dest == __constant_htons(SERVER_PORT))) { /*  DHCP request */
+				if ((udph->source == htons(CLIENT_PORT)) &&
+				    (udph->dest == htons(SERVER_PORT))) { /*  DHCP request */
 					struct dhcpMessage *dhcph =
 						(struct dhcpMessage *)((size_t)udph + sizeof(struct udphdr));
 					u32 cookie = be32_to_cpu((__be32)dhcph->cookie);
--
2.30.2



