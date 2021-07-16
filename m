Received: from sender11-of-o53.zoho.eu (sender11-of-o53.zoho.eu [31.186.226.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480ED70
	for <linux-staging@lists.linux.dev>; Fri, 16 Jul 2021 02:50:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1626403819; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=GhzW9hvP8Au3V/uSgPk8JgsK7PzwGKpksO8eZ97Y8cB+BJUbgMimA0h6PI9w/u+S+058YIQ54JqSgo3ACW4ph5kvFVT6RO42kNBGmPZ+8FZEv2R49rfaujjRS/Jg0mMxtj+ao5UXB83o12VeWtLaNebcdJR08vveFu1RBo0475E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1626403819; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject; 
	bh=rZXmKIcbfRCVxB4gCaVtTFxYz07SdA5/qWHPP1yfCCs=; 
	b=OKUR9eA2VGKB9bz7rS/4QJQEom2YwVUlDZnZ/3KZF09PgLr3JQdsc92z91iCzQBX1gOkrTOrEX7LCKH43lcMnzc2tqD3+fvkjyD8wtPNP57ERklel9PL8ADFl6DWW0KRMnqYZVqSck/sG9lKSgSPhmtNVtdntbntf3TH/HSovtg=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=diegoroux04.dynv6.net;
	spf=pass  smtp.mailfrom=me@diegoroux04.dynv6.net;
	dmarc=pass header.from=<me@diegoroux04.dynv6.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1626403819;
	s=zmail; d=diegoroux04.dynv6.net; i=me@diegoroux04.dynv6.net;
	h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=rZXmKIcbfRCVxB4gCaVtTFxYz07SdA5/qWHPP1yfCCs=;
	b=Us09oeyiKnc4DaD+GZzLi0jnZd6DM6FUZb24mRjEcLlUmS0VKwQz9FGCJgnXM72c
	MrbfyBGf1asvBxD2q/D7dYagYfvu33iU+mDNrDag3dOscWAMcEHtvUlrDoFwxgCIhrk
	LlpbZzx/PtMaSS4BCNhH1mzutpnhC6zypfb692co=
Received: from localhost.localdomain (189.188.61.111 [189.188.61.111]) by mx.zoho.eu
	with SMTPS id 1626403818939401.8669863347718; Fri, 16 Jul 2021 04:50:18 +0200 (CEST)
From: Diego Roux <me@diegoroux04.dynv6.net>
To: 
Cc: Diego Roux <me@diegoroux04.dynv6.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Message-ID: <20210716024909.39411-1-me@diegoroux04.dynv6.net>
Subject: [PATCH] staging: bcm2835-audio: Enclose complex macro value in parentheses
Date: Thu, 15 Jul 2021 21:49:00 -0500
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8

This patch fixes the checkpatch.pl error:

ERROR: Macros with complex values should be enclosed in parentheses

Signed-off-by: Diego Roux <me@diegoroux04.dynv6.net>
---
 drivers/staging/vc04_services/bcm2835-audio/bcm2835.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835.h b/driver=
s/staging/vc04_services/bcm2835-audio/bcm2835.h
index 1b36475872d6..51066ac8eea5 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835.h
+++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835.h
@@ -22,7 +22,7 @@ enum {
 /* macros for alsa2chip and chip2alsa, instead of functions */
=20
 // convert alsa to chip volume (defined as macro rather than function call=
)
-#define alsa2chip(vol) (uint)(-(((vol) << 8) / 100))
+#define alsa2chip(vol) ((uint)(-(((vol) << 8) / 100)))
=20
 // convert chip to alsa volume
 #define chip2alsa(vol) -(((vol) * 100) >> 8)
--=20
2.25.1


