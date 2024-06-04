Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7BC13DDAA
	for <linux-staging@lists.linux.dev>; Tue,  4 Jun 2024 17:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717522175; cv=none; b=bYsUPqxRkdFFMhDrstCBLyvFlsMkY2O8ig6ZIk2CvBAd+H+jyHrhQ+IdS/rzSDgS5786GZPFw8RXHg4WvJOg/cXggDAeW4jZ5xmwM1UOMhAX0OlXq6KM2amSQKUdaCGGfZVOk0wEpiO9r+2uj+iDbUiZhkEmy0uBzt/ab+3OeKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717522175; c=relaxed/simple;
	bh=JXNWA+ubrBbGTGHQ3fiyooas53vWpW1tnxzWy0QUOu0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uQIJ14nuaCQwznlzEFjyVUdN1w6UfZp2NCW2Y9IQbqubgbUTTsBb7PfJjqPMB6z6Z/CBVDYcPHSYnBSxU1VF1KgDYU1P+s7lVu7rxZhRZtV5NgyuEDYvfv1YO4JDpWfWuDf5swNl/RcXd3NbP3Qpvwl1mgMThdgFmxPZHFWvoHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=bmfXTvai; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="bmfXTvai"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1717522164; x=1718126964; i=wahrenst@gmx.net;
	bh=cPi4YOg3++c1NzBOCaXmqdHTfRwQCOT+4zrHxzV2j+c=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bmfXTvai81PvpmoP8rkg4jrwBW2Kl6rgJmzSJBwTsXvBTdxTmH9411uxjNFcUlIg
	 9sBVKUUeL+Qc/Ya/e1DYtCK1BQJvZV/kmJWo3WZM0Cj6gOeD4FsKNYpS+oVl/e1QQ
	 h2EGaZWg+/vJUyCFTp0jazJD8Ya6tEgTlDVSo6xMeyf6Fa4aIebgHAvpvqW4jBJY3
	 fsVBW7ATnA/HwrttOKgEFusqoMBHYP3xL8cBtGTiEC2csD2kWPRNRvyaWqIEmZJZ0
	 vu98oWuUvUAXZBfsurT6UvGczoziZs2O/ruEXtJjEkB65zLRRQ7bDmmAf3F8KnXTE
	 sHybU2irHDlwu5Ft8Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXp5Q-1ry1960ieS-00VA3t; Tue, 04
 Jun 2024 19:29:24 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 05/11] staging: vchiq_arm: Get the rid off struct vchiq_2835_state
Date: Tue,  4 Jun 2024 19:28:58 +0200
Message-Id: <20240604172904.61613-6-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604172904.61613-1-wahrenst@gmx.net>
References: <20240604172904.61613-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Y201S/auoNhGuy1Zdhgan48f7+dU9nXqYq/STRvIFilo6dSWN0b
 IZXbfFXTWwIRurufUh75bEmSJhTXu3/jB+3jNFUstQm743WLqqInIDCwbN2XEK49uVgH6Ik
 /WVIICPuUI42pbrWlJTikJSxzfaf/pskGHXLM5PwfhUtmKtj72VrWXi+vweGzwi8IFYMHvn
 jMo1j8JGqEwt2FKygzHQg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cp8TfH8WKaE=;3o+TwRnRIoUkhMqvaVvV2peoyY5
 0++BRiKOPyWyChPDpJJoKMo5WYKOWbhmm83tjnFzriuFDSmxl71HJB7F9LWM7tNwu5oQYB4/t
 Qn4+pnLK0roZIfaUBNM3FXo13YfF/4fvRb5KyIqPXzFAHe4cAX+yBlRSi7n8/wG5e5J6cCsLz
 sa0EPuf6OF/Vsv4GdEgpEj6no1IbUfZPitOwURIznoRVxjzoyWoxegMKSDob+abxMkaADLugi
 BPtWHpseXvtmQyRt1tIZCN37b1Ukrleeb1vLNDyKUkWskezBTgLLgyEJKyOFWPMH7bATS11YD
 +dFKFdjFxoz90+WN/Mq61lGw12lCqak2uYMa4LfFcIHm7ocDiGR8Q3HXaDSId4SZwZgb7k08D
 c4U/s0L+JoobmUtABnYpET+LKZotskhnfucPUzahT/OM8HoTwQBcCcOd/2R2yybOMPdjW6kv7
 URu+k3/45z86NOrwqdx2xBdZ3WWnv+zXG6QIdIdoGwGj4v6RceQBGjGUh8DfYXm1GDPeACe3o
 o5pwbx85ImX3BJLPnaHsU5c+xV22xZiM20Ff49I+usufIiujDPG2VAYI6zu6TSJc7AlAePz1Q
 pVSYOinYa0VcpNyZu6Zotqbo5C4SSnNHxcoa2faoTRU4BxRs4ZVUQdqpIuqKJErLPmJ5dPBOr
 waKD2D0ha3Efvoz1s2t7DJuL66yKd1y4lofPT7UjhhGBq1xWhNX1PF1aWNSCc6QYpgqtCETu3
 ap2AArZ22uCsQo2T6L8c6Ug7OA43TRdCH1e2Xi/8xBK7v9B/ky8rGXMBALEOqdy03jWeYnEny
 ODQSvtYrIp/HJjaveCMXLIFsV+wOuBy0tRoSLEbeLux+0=

The whole benefit of this encapsulating struct is questionable.
It just stores a flag to signalize the init state of vchiq_arm_state.
Beside the fact this flag is set too soon, the access to uninitialized
members should be avoided per design. So initialize vchiq_arm_state
properly before assign it directly to vchiq_state.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 .../interface/vchiq_arm/vchiq_arm.c           | 25 +++++--------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 515cdcba043d..98a0b2d52af5 100644
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

