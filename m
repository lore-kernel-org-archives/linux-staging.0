Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABD1132C0C
	for <linux-staging@lists.linux.dev>; Sun, 14 Apr 2024 14:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713105957; cv=none; b=b50HlVRbYOL7kCsM+CqQ9UQ+AiQ6NxTba0FqH24fA7J7VcJWeEbS+pTnqFJV5zMsndwLf/yX14zT4SjUpARMJuq+UkR2gMECxUJXUSPnLfgjxFmaDe958fwkJQala5oLNPyvRyqURLMVMXEHa+sh0Jd88LMyAi+ls7EsVpQcDQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713105957; c=relaxed/simple;
	bh=tCtpLZxtQX8U4UfqMyCxfZFTrriOcIGIDSBmQN6zUss=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FSrsNAG8ChFb0it5WqSuSULoU2Jgs7VCOBagK5fWGx9ODekUIU7FBBmC2Q2RNMmE6Va/gg95iv58OJ7pA/wQc/rmZT5q+7NZn6UDJcFsCnGEGgIu2+VJCubYXgcd+Wq2BnFj/CVehaTrd9FFUupkm7jlpB0z3mH4I1xzsuX9ivw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=Ylcqbl2b; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Ylcqbl2b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1713105940; x=1713710740; i=wahrenst@gmx.net;
	bh=f3Ka5G3c6zjirj+vPS1rBeFjWEh6IYyIgwnoiJ0gqXA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=Ylcqbl2bfnfdNBLWVQde/rUsV4WBbH09YO2BBtlZST3tfwoWHoIYXV7a9uWN/sZC
	 mV6JITBMbftkfx6+EWgffR0ADy4Jq4W+5pMde99u/HOtBeyfO34O1C4qNcpStLAsU
	 UqoLDINWvY58SmEaeu5a7unO5cuUN05PQe/k44acBPvBkIXWC5DyOYMPVuqekEmKb
	 fOn7IEfDN/X+TOrOSSR5kPVlJI1RMsMNC8zhi0g4yDHnQtp7dT9kghjF7N4hJgLCu
	 vuybRkK7h/oYAGK1WYSKq+qyB5s1znXFAoogT3wglB/u0oZIj08BuRW5frc/Sz0qr
	 59XmfbicjSJEZ+B9Dg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MD9XF-1s4VZV1e2D-009CQw; Sun, 14
 Apr 2024 16:45:40 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH] staging: vchiq: Reformat Kconfig help texts
Date: Sun, 14 Apr 2024 16:45:15 +0200
Message-Id: <20240414144515.14738-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Z+jEr4rgZ+QJCxXoAU/yglQXE1SARoh8HlaCANho6pAIl36q5Mh
 xW8eY9Go8Y2foEDKbLaaU7qz75K5hup75k9nnKh3oH6GJ/Y8RoRACmB9+1LFHmgKU4HUGq3
 vJt1xVIhPUSZxDbTSToAdtCqwKSLwPZF9EKeJt2AKPfD7+uikqn+eQnR2B5MUqSnZG2+G70
 6rjqoF5lhIp8Rrni5S5wQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bjyU3pAilCc=;DzlyMSIUW2iYOkS7XKk06FNM4e3
 q0CMfUABMSPqmjXY0cxmblGPyTLKAIALlYq9U+PZ/SlWdsbhvrEAOUFlfUW025XTuIujomZMM
 QvTWZynrjimZc6UucfHBHMkIk3eMT6HDmDtrcuWgL4wnEbxAG/5F8iygSziSjQQq3pkxRNarF
 Qn2VefB+iyqStT2uTDAsJ+QQ/wpUvnakz5Bfa00IPMgN8gXETYA5qAB8mKqSvAmiDF7n0jEHM
 xey/GtwzR3wzGcJyuhGUtW3yZDgwBMOmCnhj7pr8DOdd9nWpr4LgwedAgUrqrNdC7mGQ7gmD0
 ov+ewsifCLfV0AEhXUCHiBfJcWbzHrKEUyduZa8QebSXDGX76iraoObi/pAoOpWskcH1K4geE
 c1nLlc/n7HOXQf6EoelzZCMsW8rJuCjQRh2mLI9LuZy0JzUyVEd7uQI+PKwzxyBaeJuQxV1UP
 JlRcMA6LRP0D1EYgUyf63PD30zDoensP1SCaZMGkWsFvWpfPY0FKoy9xhE7qu0bIA0vv/EIpz
 8MceIH6m61ZVHb8nG4w8XBNDxLbsfg/OFCAN4qVplR2FvPgOGMZ9nnE0thzesJEYNVkW8M6+g
 GAb+Gw0CZI8uoUFQDm4nnXiI+LO82R0SnuQ/qjMxjFTI1YXHooT+y7uluFzbS7AtkoEdyA3Eh
 vW1BdxjsH1yMPla08jSIaZ+bABgP6SuVhwJXj9HVr7FCcIIQBXeOiyoIC68n8FmwfzmIFTh6Y
 iqwKsiL8JJwzBaVwdG3rUCgZmmFtlivqz5TiDuatEBb6QzYElHXX5TarKZUchn8Unwu52kY6W
 PMZZaREBn50Rz56lWhACHA5VEEHuTa3tWiGUEbAFauAbU=

The lines in the VCHIQ Kconfig help texts are too long, which makes
it hard to read the menuconfig. So shorten them to restore the
readability.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/staging/vc04_services/Kconfig | 33 +++++++++++++++------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/vc04_services/Kconfig b/drivers/staging/vc04_=
services/Kconfig
index 31e58c9d1a11..982445dd317b 100644
=2D-- a/drivers/staging/vc04_services/Kconfig
+++ b/drivers/staging/vc04_services/Kconfig
@@ -16,27 +16,30 @@ config BCM2835_VCHIQ
 	depends on HAS_DMA
 	imply VCHIQ_CDEV
 	help
-		Broadcom BCM2835 and similar SoCs have a VPU called VideoCore. This con=
fig
-		enables the VCHIQ driver, which implements a messaging interface betwee=
n
-		the kernel and the firmware running on VideoCore. Other drivers use thi=
s
-		interface to communicate to the VPU. More specifically, the VCHIQ drive=
r is
-		used by audio/video and camera drivers as well as for implementing MMAL
-		API, which is in turn used by several multimedia services on the BCM283=
5
-		family of SoCs.
-		Defaults to Y when the Broadcom Videocore services are included in
-		the build, N otherwise.
+		Broadcom BCM2835 and similar SoCs have a VPU called VideoCore.
+		This config enables the VCHIQ driver, which implements a
+		messaging interface between the kernel and the firmware running
+		on VideoCore. Other drivers use this interface to communicate to
+		the VPU. More specifically, the VCHIQ driver is used by
+		audio/video and camera drivers as well as for implementing MMAL
+		API, which is in turn used by several multimedia services on the
+		BCM2835 family of SoCs.
+		Defaults to Y when the Broadcom Videocore services are included
+		in the build, N otherwise.

 if BCM2835_VCHIQ

 config VCHIQ_CDEV
 	bool "VCHIQ Character Driver"
 	help
-		Enable the creation of VCHIQ character driver. The cdev exposes ioctls =
used
-		by userspace libraries and testing tools to interact with VideoCore, vi=
a
-		the VCHIQ core driver (Check BCM2835_VCHIQ for more info).
-		This can be set to 'N' if the VideoCore communication is not needed by
-		userspace but only by other kernel modules (like bcm2835-audio).  If no=
t
-		sure, set this to 'Y'.
+		Enable the creation of VCHIQ character driver. The cdev exposes
+		ioctls used by userspace libraries and testing tools to interact
+		with VideoCore, via the VCHIQ core driver (Check BCM2835_VCHIQ
+		for more info).
+		This can be set to 'N' if the VideoCore communication is not
+		needed by userspace but only by other kernel modules
+		(like bcm2835-audio).
+		If not sure, set this to 'Y'.

 endif

=2D-
2.34.1

