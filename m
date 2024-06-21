Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD33814F121
	for <linux-staging@lists.linux.dev>; Fri, 21 Jun 2024 13:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718976029; cv=none; b=KAGIDK4Mcg64T1147S0Ov357EYDoDtiex8Sgarps8EqeP2j6tJfyigt2paQmfihJa18EG+Gjctpq/5vWeLFA3xb07vO15OPqe7t1608j2M+43dSc1gYhKfOH5KomR8ubQ19eIQVNmvALABAcrbxUL7Vf/+V+eoHmGVj5nyLco78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718976029; c=relaxed/simple;
	bh=zjeJKXn7lZxZXUdZBcHjOW148s7SitiM4IdZZeCBWUk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jxuf5nBCk5j7kkDfxpB5lpO4PEIZNroj2sBJJT3pVZxd3Lf18Az3rPG19wQi0X7c5EnB5H8e/kvdclAlxH5gB72i7347/IHvtdiaEE+1hrumD58M/tZZPvOjexB4EWDuHyzj0Q+qnDE/2Ou6kiPUObWyNcDmSiPvOtVPUmTa3Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=ojlG9BHJ; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="ojlG9BHJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1718976017; x=1719580817; i=wahrenst@gmx.net;
	bh=HZF72wZCHfT06Ui1Po5hzq0v74I7NCMeBc9OKZHDPas=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ojlG9BHJspMTyI33pQWOvwOwHet5yxM8ZzL7pBY08IjWf+I8AJwNm14CsQwwHY9i
	 5Tjiz1OJmz3MwoHCgSVu0GfwAmzGabhNG7t1N+pPyWK2mzfb3Dj96uaBwKZiAP626
	 8E3Kx3LRKEuaBddfmSXruAyERVXr9T9IgjM3+UuKExhUneYxpZSxE8BYb8A0r4p2f
	 yvZcTt8vzpPo90dS0hg5r1ddXuWRzsylYsbMVZLypdBf1klz84EEsj/GgWelKaJcD
	 G6kVoe0g+/TVcpQW5f1v5A+zaUXhQcxud4R2vsxUjrg/05RvL0eXOi4GmUqtHq7Tr
	 I0PZOJGHFkZLKWQDmg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MsHns-1sf3SE3bcQ-00u7sE; Fri, 21
 Jun 2024 15:20:16 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V3 05/10] staging: vchiq_arm: Get the rid off struct vchiq_2835_state
Date: Fri, 21 Jun 2024 15:19:53 +0200
Message-Id: <20240621131958.98208-6-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621131958.98208-1-wahrenst@gmx.net>
References: <20240621131958.98208-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VaW0Wv/AU1cmkBNmovVh0htrgrC+2t8QSwhiadc7cs2/bkDzYW1
 Qs2LMtdoOPpFs4FylXNZpoCzP258ZSjxvwbu5RdqtsZ5oo0TFH05J0h99TxILhZMdnfU2Ty
 rRodj463yLmFxQ/QfTRnb5gG2gpEQYgGotZESvBdIlidnam4AbPwFR+k1Yb4dVpRjEEoRw+
 21hv6tWNbNgru36pcIdSg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dH1nFVi41ik=;LrmVJZvfDEYbOYyZ0ztc82//TMR
 AY4HeAf8YbIBvXmWeDvvhgUlimr39JXhZQ8MF89G3XIltyqD+1ANyxXFc6DE9bFH1FAsZYz+h
 6TnS6THHzWbmcnLRRTnRJnlL2ksT61wztayLUHBQq55a9nOVRfuoLBq3+oA3dVmnZpgznt50a
 KZkAB81todFnQaRTw+9hQpQbGeaXBzLwl0q8noH+PYgFtjlJcVgthdkO7FFE1GDMZuQldVdXx
 kjprnrbWPZhVegA2bVln61mXa5REpg2frEOhCDF+DrNOUv39MaVRgR9w3vcsXLgNyLFhta57G
 J/PpK+mhNPNqQ18xcx+/wfWFH1RV1ktznvPC311XIWJb284qZP6hGwxAs0JyHugkBE0UAu+7m
 zpqv+tCOKJfHmTr6Z4wHu89Xppzhx3xa6i0W43ZfRQNGKqqiyCnrdWaICcvjoxBoX7K71S5PM
 53ezT/ApJeYmtI8Q6s+qaXJkzM/MtIo6GyoafRiz+owER5MOZiobfCcIur8g/9JLQRaYrSxiB
 Fgv49n0kjW1JXmRiDotgL77xbZJCa6F4QksErhpoEfn/H5kds/GvCA93sdpecc8vuMUHCdJn3
 rC653wdweXOqlHJn5qlQmfJedylE4vec9vQCbn+RdrdPabDbncH1osYWBVycm/6L3MNm+WCyn
 EqBnnJTG4BZWf7N5W64I9y27m4MtRQMuZUPKnNDAd2/K7iOo24AlvNYemgXhWaDjwyrKczxJq
 VRbxmbR4WqcE951ymk075C4B/U+RIoJwLL/gdxAtAaGYs0aUKZAA4AQcdws4DpN/KpV6gRXLa
 fnGaMEuTknQFe2riFXQy/p7p4MTHyPSCS9ugOdgzsPx98=

The whole benefit of this encapsulating struct is questionable.
It just stores a flag to signalize the init state of vchiq_arm_state.
Beside the fact this flag is set too soon, the access to uninitialized
members should be avoided. So initialize vchiq_arm_state properly before
assign it directly to vchiq_state.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 .../interface/vchiq_arm/vchiq_arm.c           | 25 +++++--------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 6cfc5a769b8a..70baabc08c8a 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -109,11 +109,6 @@ struct vchiq_arm_state {
 	int first_connect;
 };

-struct vchiq_2835_state {
-	int inited;
-	struct vchiq_arm_state arm_state;
-};
-
 struct vchiq_pagelist_info {
 	struct pagelist *pagelist;
 	size_t pagelist_buffer_size;
@@ -613,29 +608,21 @@ vchiq_arm_init_state(struct vchiq_state *state,
 int
 vchiq_platform_init_state(struct vchiq_state *state)
 {
-	struct vchiq_2835_state *platform_state;
+	struct vchiq_arm_state *platform_state;

-	state->platform_state =3D kzalloc(sizeof(*platform_state), GFP_KERNEL);
-	if (!state->platform_state)
+	platform_state =3D kzalloc(sizeof(*platform_state), GFP_KERNEL);
+	if (!platform_state)
 		return -ENOMEM;

-	platform_state =3D (struct vchiq_2835_state *)state->platform_state;
-
-	platform_state->inited =3D 1;
-	vchiq_arm_init_state(state, &platform_state->arm_state);
+	vchiq_arm_init_state(state, platform_state);
+	state->platform_state =3D (struct opaque_platform_state *)platform_state=
;

 	return 0;
 }

 static struct vchiq_arm_state *vchiq_platform_get_arm_state(struct vchiq_=
state *state)
 {
-	struct vchiq_2835_state *platform_state;
-
-	platform_state   =3D (struct vchiq_2835_state *)state->platform_state;
-
-	WARN_ON_ONCE(!platform_state->inited);
-
-	return &platform_state->arm_state;
+	return (struct vchiq_arm_state *)state->platform_state;
 }

 void
=2D-
2.34.1

