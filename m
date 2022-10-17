Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19261C12;
	Mon, 17 Oct 2022 13:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666014825; bh=yto/l1lyLDHKlg80DQzPoJMZv1MlSDpRPOIfnKmwexM=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=m12rP1zZOzS6Ghc0a/VVGajyRURzCP/lhvNUvqprvfO6eHRur83EUcI4SsggNX1Lu
	 lcoCtPOMtD3kGlw3tKB0aLrPOWK/dFG3tiJ48p/7uc9oc/3HA8nRnIE9f3RwdmnolD
	 tA0ht+keLWgynPVKt6SohYo0P7KM/iB5gr22Rr+0=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
	via [213.182.55.206]
	Mon, 17 Oct 2022 15:53:45 +0200 (CEST)
X-EA-Auth: J+Gjj6U9qBUSFbOzvtoxK/8I+/Kqe6dpy1Kyzts/HqVGDvcxnsz5SAW4MqYLaUVhkhDbl1Y4Fke8hF5bvPgWF33YGJCaoTvm
Date: Mon, 17 Oct 2022 18:54:11 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, paskripkin@gmail.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: kumarpraveen@linux.microsoft.com, saurabh.truth@gmail.com
Subject: [PATCH 4/4] staging: r8188eu: use htons macro instead of
 __constant_htons
Message-ID: <595559852924cc1b58778659d2dbca8e263ee9d8.1666011479.git.drv@mailo.com>
References: <cover.1666011479.git.drv@mailo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1666011479.git.drv@mailo.com>

Macro "htons" is more efficiant and clearer. It should be used for
constants instead of the __contast_htons macro. Resolves following
checkpatch script complaint:
	WARNING: __constant_htons should be htons

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/staging/r8188eu/core/rtw_br_ext.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index 290affe50d0b..334360de23da 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -612,14 +612,14 @@ void dhcp_flag_bcast(struct adapter *priv, struct sk_buff *skb)
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



