Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300B94D8CC
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 21:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718053377; cv=none; b=XKoowpSbdwd8ZaKIAchX7dcBf4Wf7sqLUqAUb93PchZxvfm4NlSlEvi4pTmLkVsLfORvMFgqY7Pxtmw74eW8rMgxSgNsv5WoKaMhCxOyMPnnHnBG9IPtZ8CKvuhlDvMWVNK1R6+hwa5Y7q7EHs9FK1T06tTWqhkOj/80e71YUjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718053377; c=relaxed/simple;
	bh=IKZDpPseMXUMPzasYx172ydhM7J1DaIgC2eNxZDaNPE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JBowVkD4AkvQB8qymasQHfxp8i14I2rNWSzQPIx8DnXYhbaqYJmrowqiMVuBeVn3lGQY3idoZTenvYNiUtBM3Gd9EGcIUpOo/menGPkbTmsOQ/ur1/XOBtcmmSjaZSN66JMlE28YJwOxQVsgaEaM/gge4HQeCUIbIAdxHFqk9EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=X5R+Vy5l; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="X5R+Vy5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1718053362; x=1718658162; i=wahrenst@gmx.net;
	bh=7q8HbYwAcDjZpLq+HqBScyCmUIe2XBV25YY5hn+VnG8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=X5R+Vy5lapZtjRaSGR5b2g+jinJqSQPaAR1T+s6syYhWYR/+GYbeaHs8+zw1CsnW
	 M30AH2OoRNnFwL/TO22PPB6kpSvW8X5dBpj/MrKjFAiz2cljYOJyG4rz6qCXQSTZU
	 LgPJkgijVhr8XG6SDBk8tmvKhIBLFfkQO45kNegnCqQeB1Sz7HqgWoP9hymwEjrX3
	 2zyqEpKr+AKIgSG07oU1UWJw7ydU3rZwx6IrNep6gFCKnVRfdgajEJYdu97wK7Whz
	 AnVvajWAk886+oSdSIw84pop4nC7Ms7qFaaHH8nwxoarcZc/U1Tp6vFqBK2d5cmf8
	 js7bWMo2qIxB3PaKdw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNbkv-1s4tNR0lVT-00QoBh; Mon, 10
 Jun 2024 23:02:42 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 02/10] staging: vchiq_arm: Drop obsolete comment
Date: Mon, 10 Jun 2024 23:02:12 +0200
Message-Id: <20240610210220.95524-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610210220.95524-1-wahrenst@gmx.net>
References: <20240610210220.95524-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UTKrEXKfXQdb+d12EIblwVKA1mOfnQqcLQ9KzwvViAZX7QkUt4j
 QZ1s295lswb0oTEeWnmekhwv7SpWcYEL1hnbxiIHVUx//u2XMbNpYgswx9QhXJ3hhA9herq
 AVkn1JXMESRu1nWQcrc9a0XYy7JjQBA2MXihP62KJE6tiDb49pEggbxe2BdpL5eNcmmFct9
 3eBfqqssrBBBLF+5O21EQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uIJb8c2uGqE=;6cOpXyrOb4YDWL8nPvXqrU1RCr5
 VV5ZeuUU4Dpg4IHBf0n43O9je9qERsb3abZtEFdzI2cjDsmo+YHeFCQhQkeh5lss+eZg7qrKb
 0l2WkTv8t4lu0UwG4RIV5NN5ehNje5qEMIXWDJcGmaOxnOd/n7HE2GhBktp7i0qt1v9pyrkUx
 WzGlXu4aqZ+Hjq1c23nxWmfY5s6DmPR0f9oTN8Brx8ykUgo0J+oMy0tmgoM6+9IGtS8evWADZ
 NRlJ7zkhqJX0GWIXiIMJyj3ZG6DBgCwzoEuvyrLv1TqTgmWSz3hNwrqZv3YipC1PsUrWC0EdU
 APhJLcXsNVYMBZCgUa0OQh5BoR0zC5CP2Ahm9c9GHJmjlKLoJGZ4Uur83q0if7ii0DQB70cGD
 kK7qUwGHMsA9h+lSRQF/Ziw691YisbpOsfXuqwS6ZdrOIDQeOkkOG9fWL54+Sd5mvw4PTjdI8
 o1RBciaSKRdag4MO/459OsQvXeg6oNdxx8LQEl3kVvR5rv6jKDhe7ycAtwJXwL6FGNMwue2yZ
 1HeI9qR4N7YyD0na3GC2Y92wtQYT1s3XKRk2r5ttxvTURXluvpPrT25xmxcEskU4rNymVl9sZ
 /n4y58HBB3H//H93IrTKR0YqRQoB82ah49LjQLHWSMtuls4o0n5wlQ+X7EQJDzNAT8TyzTn2c
 UKoP1ZbLqhsx8gmPgTE5vpt1j7pvSA62x64XTWu4LKcideBFJ0J4u1pwrpTyVzXw2W+6Pq4bm
 ELfdtpqVpyt13+GtvsCk84nSDVyqC1VhSWUx89Fe5x93z0zTbsesjqWQJnQCbff9BvnCo3dYY
 XPOo+RxjYOSEmttlrYB/axCMGdDxD8Ia249ojuhZXz2Bc=

The BUG_ON has been replaced with WARN_ON. So we can drop the
comment.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
=2D--
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index f3815101e1c4..094ba1aea8f6 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1448,7 +1448,6 @@ vchiq_release_internal(struct vchiq_state *state, st=
ruct vchiq_service *service)

 	write_lock_bh(&arm_state->susp_res_lock);
 	if (!arm_state->videocore_use_count || !(*entity_uc)) {
-		/* Don't use BUG_ON - don't allow user thread to crash kernel */
 		WARN_ON(!arm_state->videocore_use_count);
 		WARN_ON(!(*entity_uc));
 		ret =3D -EINVAL;
=2D-
2.34.1

