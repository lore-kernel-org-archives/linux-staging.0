Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9998229CF7
	for <linux-staging@lists.linux.dev>; Sat, 20 Apr 2024 11:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713614062; cv=none; b=MI3267b4qR8vdnQSalVwqWAtGF7OUINUYbkBel7oEwYDgnMc1OHsrh60gAtPbDb6irYzvLwX/KyIJ594WVOXwD13myS3+7agDJdeqly5MKp2LIOISUE4deWslvsJC+0OjRXE+o+a9RrOWrzhho+cdlAcLpeVwqSGtCKjXqCu7JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713614062; c=relaxed/simple;
	bh=QSb7r2EogLP2ZyVqnb8f27Heoqit3v76cGL1gfp4kkI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IX8QodTbY75FEBe6yKVk31mGNOY5bbd0WXwSAeKz1A1cwK7HtfjIYpaUfE2CRgPPnEboaLfzK250QO+6qGHMO3Xpor2RUnbW7QTFJG6lDdIHGeWG3mJhBmAZD3F64H4MhTyRRQxbUhJdURhQWxCdH8NhGKOv1Dvv9hjVrXAAkQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=OjqcXsaq; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="OjqcXsaq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1713614049; x=1714218849; i=wahrenst@gmx.net;
	bh=97M1kqdll0hOVOhu6BLb3J+FkpgASkRSTSLyTAp4RCc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=OjqcXsaqu5G1OxqAilaVzHcMtIildwQK4Ks2wiazorgrm+D47RDkCMf1uPK3NX+5
	 XmwBN7oxfkhq1pM9Gc7CwagvDsINHzfSWIpwdpFhkTiaQ9e+tVZNrJJoFqcomh+Cs
	 a0Z0j2rZ9bt6uk6x1hR/bmsqEKm4/dNkKEFRat1KiVI86mnDqSDk8tSkgg3D3uiqU
	 jfA7NB2CKGYaSSlZFzYOQeby+t3vWoeWDvgvajawyTFEKtmPrF5oxnAK+EQjsVkeV
	 tlpS3qUK39dwuqDCN/t2FR1j/4I1H6EGHazv7NSGLBSsd5Fb3oTwGL2pssxzpeQzl
	 yr08Au4hQb58C8wyAQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MSbxD-1s8tqL42pd-00Swz4; Sat, 20
 Apr 2024 13:54:09 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 2/4] staging: vchiq_core: Add parentheses to VCHIQ_MSG_SRCPORT
Date: Sat, 20 Apr 2024 13:53:49 +0200
Message-Id: <20240420115351.27713-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240420115351.27713-1-wahrenst@gmx.net>
References: <20240420115351.27713-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AnSiHOkS6hjzQRD2VWP8Zn82xpdkf3SjMpF2G3UPKQwjbPXYfjb
 SAthhB2XBhku5ikcwBKzHD0T4FttuDzh3TAigAoVJA2inMlm+jznBaGsEIxP/FhX5rK0D9N
 TeCVIfha22rHR9gBteqKALepOFvXW2Yn53IwDnwDgqQynT7LTdQ1g9XJ3CmVtTLh9myYaIo
 ziLuv+lVUrGqh4lvR9ipA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YE7E3tS8fb0=;ybjA1Bvs1LGMGqv8XdTgPBKBTZF
 qhDxwtml5zjYXGJsVOgp3wktkUXM6zAuxjF0OsawMnrL0MYYACdyX/+GMco5TqvECQXXeRBIq
 eFzOuI5ZKNXOXfpzyjW0tUQL2s9OOe/xgeu6/X5kSX7I4RqXXBG3zmnsgaJ9ZZ8HwBw8hesgG
 JxDeKQiD5KZ9nyUCHTeFc4hOdLXmQ2u3BXwNOd8EPA3tIJv0ofH3PZRXkFdD2EJ4fZvaCJ653
 +UyIWXzKBhSSrbQk0LgYOKMvo9SSebVpN3VQbdHGJnCpXu8J3Gs7t1lt2e4wdEsIYITaWxNGn
 XMtxc6AeLXHgFmhfbYjddHwJLq6BAy89dLJhUdV4vnVuQidEpLKMswGZuyRXTyNrUKUWeUA0F
 +xKEsHUdht23aOd38jJJYbiruMRE+5Y/zffm9I+ReVvWb68R7bxYXFoyM2NtnQ873dMdXeQBo
 ixbBdAe+mfc9ShZPaIQ8qu+0hzu7wJteFdY8otaE8OvOtgDAb2RjbPKJJGiRBsUMgsne+oIAA
 0lrq2rcXk5lei5norTu3v1P6w1lCM736oAkHCPHw57GOfgqUtzrYYnG/qmeHZLfyAilh3JWrL
 f6+150MT+uK+KZWvW3TWnVIBgZaK6hknufOV+ggdaKZtpOitRcauenAUyOv1TxvseJ5pQfoIF
 /f4c6gaZS+V1h9uzpbvDY9qe7Sc1DISopVl5UZseYhzz+++UksKZ3fuNSt9380iK8yqHhWBIr
 3fvxXdmD9xMfM9Ci+hBSjfiAn+QMKgCLRWpD88xnMGamloWm/+hxve7YwN2HJjiI/2pmK6lq5
 DMqGqemLUrWTZqMcWlVwCQF9d5bhUPFFZm9mQOjE7nOs0=

checkpatch.pl complains

ERROR: Macros with complex values should be enclosed in parentheses
+#define VCHIQ_MSG_SRCPORT(msgid) \
+	(unsigned short)(((unsigned int)(msgid) >> 12) & 0xfff)

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.=
c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 129d73fec2bf..58451ee08abc 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -43,7 +43,7 @@
 	(((type) << TYPE_SHIFT) | ((srcport) << 12) | ((dstport) << 0))
 #define VCHIQ_MSG_TYPE(msgid)          ((unsigned int)(msgid) >> TYPE_SHI=
FT)
 #define VCHIQ_MSG_SRCPORT(msgid) \
-	(unsigned short)(((unsigned int)(msgid) >> 12) & 0xfff)
+	((unsigned short)(((unsigned int)(msgid) >> 12) & 0xfff))
 #define VCHIQ_MSG_DSTPORT(msgid) \
 	((unsigned short)(msgid) & 0xfff)

=2D-
2.34.1

