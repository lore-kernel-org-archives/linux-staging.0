Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614E814D2AA
	for <linux-staging@lists.linux.dev>; Thu, 25 Apr 2024 16:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714064367; cv=none; b=d2mYJbBj0wWwIk+yZiJ77wBLIX7AROq1guX1ZNGy0sXmV0U/1xoaaLteWZXf/+O7taYhZ/U/12dTnZmISQ7KGLsD9LYM+oXMNOt3km1JZMi5OJ48lQ4UQc66CyIYRrrPuNqTkjhqGg10C+facrhWTlxRdwn4We6voLY7E6iLveI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714064367; c=relaxed/simple;
	bh=6QtcclFOl3gZ12xo5RK0yNzieeEWfA7t+GCwIlZcV9g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ntnsbh2I94mrNq7i5rLWpJLFTemtfX1TkXj6jDGm7jzESRTaQ6dROBy67L3HyOdIJy+V+WeqntTtxZcX1N8JTT8N49DY1wwZMPJgo2xsBpxo6qNlm/Bzdwcy5/HKJ8lq1Aa7Q/h/7W3hEX8mOkNMxwx9gG8Q9GURKZxgaVrUuw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=eSUAkGcm; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="eSUAkGcm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1714064355; x=1714669155; i=wahrenst@gmx.net;
	bh=za0lJFAEFEu+cMcc9yHS8hoYGNCjR3OLjeYClJuw8rk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=eSUAkGcm5W84kQ67+of5QhN+QTS4WiL8vNDowhTAb58k6z2HoCVIUN/v4IoVP5VK
	 j1NH+pnsu3wvTybn3aa+orrIRvWtUvSM8GRdN55J+JTyY5MXSvaALREQxQA3f9ASZ
	 ULNg9Y+9h/Dq3zGFYmle1MicrLbqI0BHjtdma8oydvq5T5QFayX9cac548rdlP7JZ
	 xFOg8U6MXDxJwc2yqplixEOwmh64KYnSP3a58kqd6ufDDEtOSbTG/Azg1BRIXK/+0
	 P7ZIjIgfcjo8zuRD/wzajWda7lEta0a9tona76RLa3yMwOGyPgoIjXvinuagb+5yD
	 zwoFMR+iYg7k3L0GuA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MvK4Z-1sr2V01wvJ-00sRlX; Thu, 25
 Apr 2024 18:59:15 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 4/5] staging: vchiq_core: Drop unnecessary blank lines
Date: Thu, 25 Apr 2024 18:58:51 +0200
Message-Id: <20240425165852.6681-5-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425165852.6681-1-wahrenst@gmx.net>
References: <20240425165852.6681-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:R2zJddKy9tKReoZwWYeSSaEfZ/0hze3wV0CJZT97g80bjq9F2QY
 0iW1W0k21YhkOMFlPKK32gIAYD6Bb4+U01QppAw9qMhon/MYZL69AD4M0io7Z3l14mxOX9Y
 qFl76++ZydjL0zFRjGITcpeV1hcdYUpMajmG0H/iFTAksunbmn1i5XPf6k23X/liPXG0tRG
 OOzBBb/X8bX9zXtnkeWbw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gaCvF27H48k=;og+93i9Qn5Kn0WWZdqcvAWJPtVP
 JTfiKmNr9LMNLQwqJ5dWwF2w+gnGJCoEDL4tAbvEmbFuRPzUMV1Z0PACVQqegYk/shm34YSTT
 amFahc1i6O/0hJomShVtCSAKUHLKihgKh8tWBpQ82SewKT809fuU8JeQxNDHWS33dQNobAMj1
 pYvg8MAlCRi/Dy9pIHy3hNJ2UAztPb/dallLlY+zC2NYfuADRoH9anrkIXGkcwDSfbRpFHPfw
 yZUeLWNE9VXGPeIOhVZCWlwAgIFh6J5wkJs7jrhWyBVAPfeiACnU870M3yc+Rr3tgNH3JWTzw
 4+0T51sQ6l3AJjTM+1txGJ8rhApK62pnwGjBX3Br/DP9odzhPsArf7LPDgdg2yJa2fxzWps+9
 fgB2iOa+S9TB52RP2fBAUSk/ioQpNWvwsimfsSCnMIdOzEF2TSvrCKNvySndYRpfy6b0IlMKu
 21AhVxHyA9ogrNWSHGETOK9+Pg/CJEwmJgMCSaQySF5uPVTFNmrma56/aiS5vRt8b3ajCi330
 S06L1cZAbGIZ6FF959jvhAnVBCgvZWtMBSvfJnoqaTqbRXLdTfcrjVKdz1b/Rbiy3MTP7s2z5
 z9p9g/MJAztk1Jp0lj+EmT1PcRDnp3fK6pXphv4RC6QWmg3XeQ6gle6ouVSRnfFq6019DEfEt
 oT3lCDV5ceiRREUj+k7DfiqNpbpXApAoMzVLAfUULcLuqAvWuFindc9FnY8xwgvhU4Zp55oNg
 lt8H93F09JS5u8E2TaiM3T+Ghy+aJQZbrM+R6MnCwsd8ypRbyDMP8xN6DOvzxJ0B1ZfgKntWd
 TGVKDi1g5H7nZYUKLFUZkgYEkp7Ctdf72Gy6O3jOOyOPA=

checkpatch.pl noticed

CHECK: Please don't use multiple blank lines

So drop them.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Umang Jain <umang.jain@ideasonboard.com>
=2D--
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.=
c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 58451ee08abc..ca32902afe06 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -1190,7 +1190,6 @@ queue_message_sync(struct vchiq_state *state, struct=
 vchiq_service *service,
 	header->size =3D size;
 	header->msgid =3D msgid;

-
 	svc_fourcc =3D service ? service->base.fourcc
 			     : VCHIQ_MAKE_FOURCC('?', '?', '?', '?');

@@ -1616,7 +1615,6 @@ parse_message(struct vchiq_state *state, struct vchi=
q_header *header)
 		break;
 	}

-
 	svc_fourcc =3D service ? service->base.fourcc
 			     : VCHIQ_MAKE_FOURCC('?', '?', '?', '?');

=2D-
2.34.1

