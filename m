Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AF62E622
	for <linux-staging@lists.linux.dev>; Fri, 21 Jun 2024 13:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718976029; cv=none; b=pOWtr6xonR+yUIL3tSDbfGnE82Kyij8tlJIFk6N5dgEJNZSo8lztY0meUasuirIQvhcS6/zdjFPrq2oXkfqKQQGB9PvGDSiQb4zUChB86QdrVNChqSxThG1Ox1D792gkxRtQDuHirnQjv5wvvW1Du1MTuEDkEWx1Sd0IxDJaWqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718976029; c=relaxed/simple;
	bh=FHwmRY7r1L1wzkYJp3X3V/V8V33gXPlxpfn6s75U8qA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lNpkJo0EcaOFcqIh9Zj4d3tEqpCr833jajOvAwwED5/zgmAeehAfs/fla/ztdK+PleZecWNjXbIfCofDYSwFL5AFdVSZul/P2tB8D2is7mlK2RF47ar0e2LbXCLQcwU2oT2aMe5noJmGYpSzu6zVQI8ab3Lpkg6ZcU8HoPu0It0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=nVREjPYJ; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="nVREjPYJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1718976017; x=1719580817; i=wahrenst@gmx.net;
	bh=IC966Q7RTiSk27CZV+8YMDFXaB95l626V9b3lNakaT0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=nVREjPYJkW8St8Z6L+pQ3udb8Uj4RXt2J+Yt4jgljahzXxr1e/f5HAwHY4DErIrw
	 xGKE3soaJPx1qK81MCeSiHnaQG7sjzWTk05R+Ro9LnYXtJn6yCcTEccxe9w48/GUV
	 tsvvCXJQhH3DrOeHQw0P2+3KZ2BwtO+ZT8fC7ej/hstklSjl/G2RZu6gyAkkFVzlh
	 ZmbJY2bW8Klem/z+/FfX2E7shHzBoT2PkjdO+dDO06uJVzUb/HxXyKr9pqHA7ZB83
	 j/X8GrIaa8OVq6AD4CND4z0csrPXWK8Kv2g4WHiIWKl0J9cPb4F4KD75eHlDTLtEa
	 onYEHrTM9qcsU6GeNQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MaJ7v-1roLpM0dO9-00VnWr; Fri, 21
 Jun 2024 15:20:17 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V3 06/10] staging: vchiq_arm: Drop vchiq_arm_init_state
Date: Fri, 21 Jun 2024 15:19:54 +0200
Message-Id: <20240621131958.98208-7-wahrenst@gmx.net>
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
X-Provags-ID: V03:K1:NrxSYFbW40Ip2SZDFh3lOoCdh2dAH/1T3mW1u3Udiia/rk4m1oC
 o8tM9RvHULa5O0vARS8bnqEEBNPe73lEzCxu4DwthvQWQe2dBuyTMkjHvv3+G/ETneZG67Z
 UttF27+fUtKUzmkmEOeMH1wqOuPCJtyQOEzQjzw0Iy+C/HmRAqqAbIoY4cZZhVDGICv41Dg
 9Q92T0s2BjLj/HM8ic/JA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wEDUIUyk0p8=;vabIn/2JEk3Dz0RsRcPxSxrE8M1
 PhG/zXKSq/QBidu452gi049Li3bAmu+DbMBrTh49r3GIvHja3D4NN/qWWkaxShnlsqybAUHnH
 KSMHyAnS4EGeso7GOuj2BINmUNTL50+81eM3UA3Zaf4Xy4j0j5Yw7ND5ThxzBKxHJwlHsm3Jv
 CiTvIHVUX/e6aA0rMdBCC84v8A/OpIGSJYujYNPRv5nmn5/azkJnsKUfXYiYNV6Se+UnugT87
 kA1w1i8ZvTuNZsiXLDj7SbbJrhzSx05akVVLqFJnejI9NlPGON+0EVa8AG+vGg9OIXyT2dw9m
 nVvVYh922zVzvDe/cZilT0fVcekOsJ6kFLy2AgIgjU2UpU+sFkXK9AXviikDCZEx+M6wnRJVw
 BhdAQrqbNC6J5yl8awY12SPRxwZUgx7yZXhKTC3h8aOFtw8Dz/6SmeVo8AxsRHGlWfrC7itG5
 ExrAHkpp41xLAJIl+zEI37JL0i7Krvx8NfjZtn98kbddzxloR7jFGk4lMRKuQQp4Y0IF2kagQ
 fniwN5S85yfdfVTkt7w9HlC9DE9KPsSzhYRvX11kpysgh8O+W/eTvptkcfQYfE/hDv5/DD6Fh
 clanaaoDkHcVEUVYJWh9MbOYiyUkgoCNDhwn1b8U4IliCe52v/CPvt7cTn20Of3uFl6wge9cw
 GakkUVh98SKu50/0nxehRnTAPllX/AkUdyouHJp1rjhYIlG2ySHuwhkKb580PyF0D1XICcCMS
 EXDB3IjifQwXUDpJoODQMacQV+EV7Sg+lxGXYgDRK0AMMXhqApTvf9zXEhxW6XcyluKguQa0E
 8KIGhPvswT0NBLHU+3hgFShgGFJmyHeJZm7QNuBHvxQqA=

After removal of struct vchiq_2835_state, the init of vchiq_arm_state
can be simplified by doing it directly within vchiq_platform_init_state.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
=2D--
 .../interface/vchiq_arm/vchiq_arm.c           | 27 +++++++------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 70baabc08c8a..cb37da7d8085 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -588,23 +588,6 @@ static int vchiq_platform_init(struct platform_device=
 *pdev, struct vchiq_state
 	return 0;
 }

-static void
-vchiq_arm_init_state(struct vchiq_state *state,
-		     struct vchiq_arm_state *arm_state)
-{
-	if (arm_state) {
-		rwlock_init(&arm_state->susp_res_lock);
-
-		init_completion(&arm_state->ka_evt);
-		atomic_set(&arm_state->ka_use_count, 0);
-		atomic_set(&arm_state->ka_use_ack_count, 0);
-		atomic_set(&arm_state->ka_release_count, 0);
-
-		arm_state->state =3D state;
-		arm_state->first_connect =3D 0;
-	}
-}
-
 int
 vchiq_platform_init_state(struct vchiq_state *state)
 {
@@ -614,7 +597,15 @@ vchiq_platform_init_state(struct vchiq_state *state)
 	if (!platform_state)
 		return -ENOMEM;

-	vchiq_arm_init_state(state, platform_state);
+	rwlock_init(&platform_state->susp_res_lock);
+
+	init_completion(&platform_state->ka_evt);
+	atomic_set(&platform_state->ka_use_count, 0);
+	atomic_set(&platform_state->ka_use_ack_count, 0);
+	atomic_set(&platform_state->ka_release_count, 0);
+
+	platform_state->state =3D state;
+
 	state->platform_state =3D (struct opaque_platform_state *)platform_state=
;

 	return 0;
=2D-
2.34.1

