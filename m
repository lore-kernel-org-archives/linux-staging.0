Received: from out-1.mta0.migadu.com (out-1.mta0.migadu.com [91.218.175.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020418492
	for <linux-staging@lists.linux.dev>; Thu, 20 Apr 2023 13:32:37 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tinyglitch.net;
	s=key1; t=1681997555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HYPasswPNjthbHxXzPBv9mP61cdgKG5LEiRivNJjVRE=;
	b=eKwD+AJhzVcAHvYj2LhRyrUZiTSixI4oin8FrxXXrGk0ItAiIJshOXQzdZ+Y23HJihlo/7
	ecw9FNuNA1DohnTsNJK4e0c15mb57Mg/aUwlovfSzIq2i/Yl6NNh00wcTThcPmxIo766hO
	dPWhMJdxQvmYFT3/EmYnVvGJ1MZ87Q8IJLaPBX8YAyFLSaRcQBXFV5uqtBxDOqq8L9fL9o
	M62GOw0I2kRBIRDhBqSfJQVEcAfAeVcBTjhZAy/a4g5UV8X10RccubpKed/uIH8fjUruLK
	K1vHoppMKF5HM6uTUx83lip+OFHnZOpUdu+iVoYZOovz4IGbXqaE9fcEnOjIKA==
From: Stephan Snyman <rooiratel@tinyglitch.net>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	kamrankhadijadj@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stephan Snyman <rooiratel@tinyglitch.net>
Subject: [PATCH] staging: rtl8192e: add missing braces {}
Date: Thu, 20 Apr 2023 15:32:09 +0200
Message-Id: <20230420133209.4661-1-rooiratel@tinyglitch.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add missing braces to if/else statements to adhere to the
Linux kernel coding-style guidelines.
These issues were reported by checkpatch.pl

"CHECK: braces {} should be used on all arms of this statement"

Signed-off-by: Stephan Snyman <rooiratel@tinyglitch.net>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index b649d02dc5c8..d44bf261de54 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -264,8 +264,9 @@ static int rtllib_is_eapol_frame(struct rtllib_device *ieee,
 		   RTLLIB_FCTL_FROMDS &&
 		   memcmp(hdr->addr1, dev->dev_addr, ETH_ALEN) == 0) {
 		/* FromDS frame with own addr as DA */
-	} else
+	} else {
 		return 0;
+	}
 
 	if (skb->len < 24 + 8)
 		return 0;
@@ -433,8 +434,9 @@ static int is_duplicate_packet(struct rtllib_device *ieee,
 		if (*last_frag + 1 != frag)
 			/* out-of-order fragment */
 			goto drop;
-	} else
+	} else {
 		*last_seq = seq;
+	}
 
 	*last_frag = frag;
 	*last_time = jiffies;
@@ -2314,8 +2316,9 @@ static inline int rtllib_network_init(
 	if (stats->freq == RTLLIB_52GHZ_BAND) {
 		/* for A band (No DS info) */
 		network->channel = stats->received_channel;
-	} else
+	} else {
 		network->flags |= NETWORK_HAS_CCK;
+	}
 
 	network->wpa_ie_len = 0;
 	network->rsn_ie_len = 0;
@@ -2329,9 +2332,10 @@ static inline int rtllib_network_init(
 		return 1;
 
 	network->mode = 0;
-	if (stats->freq == RTLLIB_52GHZ_BAND)
+
+	if (stats->freq == RTLLIB_52GHZ_BAND) {
 		network->mode = IEEE_A;
-	else {
+	} else {
 		if (network->flags & NETWORK_HAS_OFDM)
 			network->mode |= IEEE_G;
 		if (network->flags & NETWORK_HAS_CCK)
-- 
2.40.0

