Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050E444C64
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 21:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718053376; cv=none; b=PWoAmGyC8FBWpHy4lYuh6Urs034g4fgHq7vbpLVDwDQa8QXWdDxNiX+OV63JRUBlFRPn/xjYnO0uUW0e3NUU0yyf65oPtughCyIBgb+AhSplaVbtO5bpGmtOdEroowSonoFUUcz76K2KgVUbZ4omBmxjR63e/BgMVeYjd0MAamU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718053376; c=relaxed/simple;
	bh=HKuAa3zfGFBIHffIsm1VcT3Ne5xBIdXjQZP3Nl0zw+0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DLwCzK0rdVKS8o2ufXUOydrn4GeQc9yMvdn0LrNhOW1Qtq3NrQDnaLa/khmH98Boygr4YZsBhhIlp+OQ7NNqMECrmRyMyVry3b0i7Fj2eAZtEcFvip5xYLxMMLq33KR+xFS+sxWlabl9rpnJToiUumzFeLk2rVOBBC/NlMDYatE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=RcXraUxo; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="RcXraUxo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1718053363; x=1718658163; i=wahrenst@gmx.net;
	bh=t7gpFqb4SdLrYI3z+nSsyk29RTJgE7SHfUpRcltmtsg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=RcXraUxovVTfZ+Eg0pFwTEPS40qXtxjS7EOxzB72K99VuksD56m3Wg98z2pvkXL7
	 Scc7tgZqe63rw+5pLYDXfpSRCEjazMeP/JMGeQ168hB3OIuhvA214DUBDN8o3LeMX
	 Hya5z4jDceCtlXRYEw2ziMqVj6GfG91dR1B751DAjVrkFoTY8Zd3V1SM9n6RK5mxO
	 /9c8ziSh/iUdxUa9MF15ZsBPH0D9s/pKHbC3RVX6HfzOG9wdtmg6BKNHDMwGy6Hk4
	 dBiszBcL6gQWA5VIGZkFOheooE3fAcosasf9uTHnPQmAxB5Ru3/I/Uej0J9BkW4uJ
	 bVsj2VquGC01ikF++w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYNNo-1ru8vZ0QT4-00JtNE; Mon, 10
 Jun 2024 23:02:43 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 05/10] staging: vchiq_arm: Get the rid off struct vchiq_2835_state
Date: Mon, 10 Jun 2024 23:02:15 +0200
Message-Id: <20240610210220.95524-6-wahrenst@gmx.net>
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
X-Provags-ID: V03:K1:OrJhS9YN58hIG60M/gX0F7JV+hQ5syPBKWbfb/q9Un9VkhW6oxS
 OxIUtsERnHD4lSnmjFy2mHna/C5oTdS3OVCDHymJ02hlqZx4L7iuq/4DGePCfVgqIed5kk6
 Qw4l4GOtmOZYZyoqjV9M6TuW5v1XulwH2Am0qNuYpYFd5NUhYkOm+rSMNkDurUX5DvxovPh
 vqEg9SE6cEzwT/PUZfvtQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Em2A8KvPtIA=;v8rmYcm/HzHJTFmA4E2OQQJ1XnF
 WHi5Ygxf7VGEK88lkX4t8cRZqxWLqHuOwnoEMkvcevtT04W+6gByHvWtKvQmfaUBEuxo4HL26
 Pico9GYSvFjocCIq3nVzWurZO/TY2TZd7QbMvPOiFq52D3ZNHLJJj/k1IpI6KBSQct+M9qVCt
 yVhFmUPCbq6qKlWxxfZwmRpXBh0jK1Z9f5metCPOBTK7t2eul8YEq2Ta9Xt4ypeZZC70yp/TR
 ecSgfoZGcU22qFr4eDE2L7hSekx6Exstm42C69zkDSDsnUXINxH1FtoVO/9djyYjvRqf/KLqb
 sqTlFwrtDEx1lw6HrnHy2AkC4ZuY2pFjTrb0NsAIi1KWbixL/+6yviW9WrtTAyg0roaEeH1fJ
 2pKLUkVwYClS/i13cd8cZ5+BFKOuQfaLYsDOEOwPIEv0xONaQBwL81VyYpzRB0idB/7Soyik7
 bcAhY9kpzgXUjF+gFAv59mdOAE62rFvAUkkZotBKNFDaTEx+i8+c4UnR8x57By7XqSOQPC4FY
 giSE/oF/3O4w7n5gj2vI5zrWEf2/4IbcGI6QsMS4FvQYPGSHVh9AnX0qdzUih/JZVHRLLlq2j
 +huMdwKX+fXcD0EQRchSD9Svf5FgW7I+TS/oUTeibPYaBmy3dDRyHh0sVkhsnOQkDb7mi0BfO
 MuGYbB08JCq2lJ/OSDXnpstPM/BKoFDUJshA5Pf5NNf2MIbhcfY+nLMoAGukX8rvYY0cIYYuV
 2d3mgQc7w0RHd7puua13MyG6BHg2QkKuxCxCmpeOEIf9p9qN1MPx9Cjz5uMSVYYlKMdK3KZS7
 0vkboEMPLBxMhMnq3YdVwMMnVTaYkSj9E3Jucbkc8c7vU=

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
index 094ba1aea8f6..6ef4cf702c78 100644
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

