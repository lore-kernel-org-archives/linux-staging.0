Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5B97E
	for <linux-staging@lists.linux.dev>; Sun,  6 Mar 2022 22:04:34 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1646603881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8+8slx61Q8ToDW/o7PkKsmbPNBa/MZR5vMCzY38Lg1o=;
	b=vUJZxxDBgM2VdN+goCbz4yIobXy4EQgbm2MLvmROnqEbgh43Vb42YKYNixYiNnLCXCXt/9
	el1Av0rlAuyIeAIVL6rV+91AG+L3vZ6IvgySMmYPt/H87Ig/lxLSQ0J8hhtAgC5LcdQUPP
	KpRwAeszXQU48C2Ld4aUmY5lvjavnvglphtD51CT7GQRZE92oSkC1EiEMohuLdpQoHxQi9
	Fhg8DhVjYv4aNLL0sI7NjiYD97obUGprsdBFYlV0jyFfEHL/500OfXNY933ztlu602N8in
	KBTzziTLBAI3ZVUaw/8AV4r+xq+x8LUIZzJmgrqRECOS0A6nS9f7t+s4XDOzeQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1646603881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8+8slx61Q8ToDW/o7PkKsmbPNBa/MZR5vMCzY38Lg1o=;
	b=nDXUPYWsiHR6mBDu90JfZc4ZVCJtFHHkVaT+NfY43fAFi4X6phsuZMFSVL6rhrLzeNeTpH
	6C8rWOUmy7LGGUAw==
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH net-next 02/10] staging: Use netif_rx().
Date: Sun,  6 Mar 2022 22:57:45 +0100
Message-Id: <20220306215753.3156276-3-bigeasy@linutronix.de>
In-Reply-To: <20220306215753.3156276-1-bigeasy@linutronix.de>
References: <20220306215753.3156276-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Since commit
   baebdf48c3600 ("net: dev: Makes sure netif_rx() can be invoked in any co=
ntext.")

the function netif_rx() can be used in preemptible/thread context as
well as in interrupt context.

Use netif_rx().

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/staging/gdm724x/gdm_lte.c      | 2 +-
 drivers/staging/wlan-ng/p80211netdev.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gdm724x/gdm_lte.c b/drivers/staging/gdm724x/gd=
m_lte.c
index 493ed4821515b..2587309da766a 100644
--- a/drivers/staging/gdm724x/gdm_lte.c
+++ b/drivers/staging/gdm724x/gdm_lte.c
@@ -78,7 +78,7 @@ static int gdm_lte_rx(struct sk_buff *skb, struct nic *ni=
c, int nic_type)
 {
 	int ret;
=20
-	ret =3D netif_rx_ni(skb);
+	ret =3D netif_rx(skb);
 	if (ret =3D=3D NET_RX_DROP) {
 		nic->stats.rx_dropped++;
 	} else {
diff --git a/drivers/staging/wlan-ng/p80211netdev.c b/drivers/staging/wlan-=
ng/p80211netdev.c
index 255500448ad3e..e04fc666d218e 100644
--- a/drivers/staging/wlan-ng/p80211netdev.c
+++ b/drivers/staging/wlan-ng/p80211netdev.c
@@ -255,7 +255,7 @@ static int p80211_convert_to_ether(struct wlandevice *w=
landev,
 	if (skb_p80211_to_ether(wlandev, wlandev->ethconv, skb) =3D=3D 0) {
 		wlandev->netdev->stats.rx_packets++;
 		wlandev->netdev->stats.rx_bytes +=3D skb->len;
-		netif_rx_ni(skb);
+		netif_rx(skb);
 		return 0;
 	}
=20
@@ -290,7 +290,7 @@ static void p80211netdev_rx_bh(struct tasklet_struct *t)
=20
 				dev->stats.rx_packets++;
 				dev->stats.rx_bytes +=3D skb->len;
-				netif_rx_ni(skb);
+				netif_rx(skb);
 				continue;
 			} else {
 				if (!p80211_convert_to_ether(wlandev, skb))
--=20
2.35.1

