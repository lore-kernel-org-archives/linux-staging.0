Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022DA3209
	for <linux-staging@lists.linux.dev>; Sun,  6 Nov 2022 17:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667757437; bh=R2B3fDOf8MX2Y8ck45wyaW6ET1XIPeT3gTlhsiet+a0=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=OL7ufRjrqdeP0G1yvdffp4NMSdM3GSaBaZRgp/o00sW0AO/j+DRvRZ6wvdT0bocUQ
	 oIJNDJgOMwX8l4SVpMiIRVE2nSSxtCuNOVtywVwL08c3enooTUYD6fS8auB2BeZ5JR
	 qvu87pjIHTUI60Ku+CcAxNV+2tFkW0auTo7W15uE=
Received: by b-1.in.mailobj.net [192.168.90.11] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Sun,  6 Nov 2022 18:57:17 +0100 (CET)
X-EA-Auth: H+PFsFexCiXLjRkugddMC6Rj+rM8J/vUcqx6NmA7KTpCi4zjSKKgYqed5BGoIC0zRxd70x6CFipLp5SQm7lSvF7LPucpg5Ke
Date: Sun, 6 Nov 2022 23:27:12 +0530
From: Deepak R Varma <drv@mailo.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] staging: r8188eu: remove unnecessary casting
Message-ID: <c333e22349c5c347c740b425330b35830b969fa9.1667755987.git.drv@mailo.com>
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

The dhcpMessage struct member variable "cookie" is already declared
to be of type __be32. There is no need to cast it again as __be32.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---

Changes in v2:
   1. Change associated with variable cookie separated into this patch.
      Feedback from gregkh@linuxfoundation.org.

 drivers/staging/r8188eu/core/rtw_br_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index 4deaa7e352a3..a7c67014dde0 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -615,7 +615,7 @@ void dhcp_flag_bcast(struct adapter *priv, struct sk_buff *skb)
 				if ((udph->source == htons(CLIENT_PORT)) &&
 				    (udph->dest == htons(SERVER_PORT))) { /*  DHCP request */
 					struct dhcpMessage *dhcph = (void *)udph + sizeof(struct udphdr);
-					u32 cookie = be32_to_cpu((__be32)dhcph->cookie);
+					u32 cookie = be32_to_cpu(dhcph->cookie);

 					if (cookie == DHCP_MAGIC) { /*  match magic word */
 						if (!(dhcph->flags & htons(BROADCAST_FLAG))) {
--
2.34.1



