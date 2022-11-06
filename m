Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353C03209
	for <linux-staging@lists.linux.dev>; Sun,  6 Nov 2022 17:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667757342; bh=z+5A15Rnb2tsOBvm60vdD60D90+vivHwvYlePj43mGs=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=WOqBr3xn4x0+e9Ln11MMxhE29LTiUrB4/xr3vIbegXdAV5mD8zmoA/trRtkQZZ3xY
	 t57Bx7IU8RZcVVQdEo9H5T/SgJP25XJJ7/q91J8+K5Fln1PDmGXDHCOwyIuzddh/gm
	 +3eTfy7pKKcE+sAcyyXaDqijfUhVu/baOyEM24Pg=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Sun,  6 Nov 2022 18:55:42 +0100 (CET)
X-EA-Auth: 2x8xCTGx8/XRKTESQemLJuUZXOoDmAPsE3NgmIDJXOBna1ts0EXAIhsOnjXG1c0AM3zj65wIeK7rTTQNwqdHJHN9zFqHRm1m
Date: Sun, 6 Nov 2022 23:25:37 +0530
From: Deepak R Varma <drv@mailo.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] staging: r8188eu: simplify complex pointer casting
Message-ID: <1428580d09a9916899209c9278dca40ee2d297d3.1667755987.git.drv@mailo.com>
References: <cover.1667755987.git.drv@mailo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1667755987.git.drv@mailo.com>

Pointers to structures udphdr and dhcpMessage are derived by casting
adjacent pointers with size_t. Such typecast of pointer using size_t
is not preferred. The code looks complex and delicate. Simplify such
casting by utilizing generic "void *" casting.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Deepak R Varma <drv@mailo.com>
---

Changes in v2:
   1. Separate the change associated with variable cookie in a separate patch.
      Now in patch 2 of this set. Suggested by gregkh@linuxfoundation.org
   2. Correct variable ordering. Code cimplified to match current style.
      Feedback from gregkh@linuxfoundation.org.



 drivers/staging/r8188eu/core/rtw_br_ext.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index a23f7df373ed..4deaa7e352a3 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -610,12 +610,11 @@ void dhcp_flag_bcast(struct adapter *priv, struct sk_buff *skb)
 			struct iphdr *iph = (struct iphdr *)(skb->data + ETH_HLEN);

 			if (iph->protocol == IPPROTO_UDP) { /*  UDP */
-				struct udphdr *udph = (struct udphdr *)((size_t)iph + (iph->ihl << 2));
+				struct udphdr *udph = (void *)iph + (iph->ihl << 2);

 				if ((udph->source == htons(CLIENT_PORT)) &&
 				    (udph->dest == htons(SERVER_PORT))) { /*  DHCP request */
-					struct dhcpMessage *dhcph =
-						(struct dhcpMessage *)((size_t)udph + sizeof(struct udphdr));
+					struct dhcpMessage *dhcph = (void *)udph + sizeof(struct udphdr);
 					u32 cookie = be32_to_cpu((__be32)dhcph->cookie);

 					if (cookie == DHCP_MAGIC) { /*  match magic word */
--
2.34.1



