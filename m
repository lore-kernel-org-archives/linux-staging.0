Received: from mail-244122.protonmail.ch (mail-244122.protonmail.ch [109.224.244.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D148A33B6F0
	for <linux-staging@lists.linux.dev>; Sat,  7 Feb 2026 19:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770491536; cv=none; b=oBRDAkOBEkRZSTebIHcGHz0b6HmAyyLYrxK13JxsMJrjjxpvzbFmtjSHV/YAmm9qsPZ1445Mjz+tX/Nh3ZAq6qfNrWCIc94jDhjNc2gCv+A7KQnxFKbRIWDmWPlud7nvWHvEMSS+tuROFnK1VKOKMH/VhCdfMWSjaeWhHNCqNdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770491536; c=relaxed/simple;
	bh=W2iMgD64vnlKE5Z/cmgQ71C3OxQRvEwb8LpjEpnTsLw=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nnHgJrlOEEeglw0Sw2+pWUumPe1FwJ6vNbjSCykVKvHMJPuKY9L7smlq52tnBLUd459Cy+TSDT89+ZnA1UATtuLPrCTDiuCCqGrPUC7Oxe+cWK5RN7ZYRC3YxlImrpmZymNo+Om/qbdlxuNzNGee0fK6kJkTy8Ootnz6kCNFkaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=JKaWJ/a/; arc=none smtp.client-ip=109.224.244.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="JKaWJ/a/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1770491526; x=1770750726;
	bh=W2iMgD64vnlKE5Z/cmgQ71C3OxQRvEwb8LpjEpnTsLw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=JKaWJ/a/RWOvq7sQqvT3XZ3JTPa9hC+ZcNN3sughLEKW0px/tO6yXOzK8iJ2Nti+R
	 hdayF8BMkDqyHpNayUrsZehKs2kiyV7QJNmKpfpEYv45VnGRGRuWAXXpMhGzEHnrF9
	 2YzKpZlkgQCfRHRa0soCbeNJcUxZ8nHM2k2Gbde7O5RhZt4OsR/UsMiF4egy+zQaK2
	 56yTaMLvOw8R76RtIOv0RJNd+EeSqjPd3Z9PZA/49H3bVoG3U+dq53vWfWq8dz/1CD
	 8GPRCcW92RZa4fo8bdLOifw/EMrFyN06PdOt3aRVpDWqj/6ZXEs/zQj7fkZGtzgbAP
	 RK6oxkSex/dAg==
Date: Sat, 07 Feb 2026 19:12:00 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: claude-bot <andrz2-claude@proton.me>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: octeon: replace BUG() with WARN_ON() in TX path
Message-ID: <20260207191151.1206944-1-andrz2-claude@proton.me>
Feedback-ID: 180211986:user:proton
X-Pm-Message-ID: 523607b9a29560614830b7c19ed9fd1970900314
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Replace BUG() with WARN_ON(1) in the default case of the queue_type
switch statement. If an unexpected queue type is encountered, the
kernel should warn and continue rather than crash the entire system.

BUG() should only be used when continuing is impossible. Here, the
code can safely fall through to the next block after warning.

Signed-off-by: claude-bot <andrz2-claude@proton.me>
---
 drivers/staging/octeon/ethernet-tx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/octeon/ethernet-tx.c b/drivers/staging/octeon/=
ethernet-tx.c
index f5bbedac6..b90baa584 100644
--- a/drivers/staging/octeon/ethernet-tx.c
+++ b/drivers/staging/octeon/ethernet-tx.c
@@ -450,7 +450,8 @@ netdev_tx_t cvm_oct_xmit(struct sk_buff *skb, struct ne=
t_device *dev)
 =09=09__skb_queue_tail(&priv->tx_free_list[qos], skb);
 =09=09break;
 =09default:
-=09=09BUG();
+=09=09WARN_ON(1);
+=09=09break;
 =09}
=20
 =09while (skb_to_free > 0) {
--=20
2.53.0


