Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7486E40BED
	for <linux-staging@lists.linux.dev>; Sun, 14 Apr 2024 19:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713122613; cv=none; b=rYpKVaSq0D6AuTKM9aqNQA7ZYLMb0X75/vizKZkN9+5d7J1s/nWXHiAcvA1k7VwG2zkEimW9qlP6V61gObKxoGVlAVJVn81risYTHCOje99jUgZvNLzwUR21tmRAWrssgxHYAQe5GMJ9it5GjvHzzfM7JBv5wRj69jw7/v5DqYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713122613; c=relaxed/simple;
	bh=pLS7IbsD3DFOrQdvrzDKFs+CuePkt8jH0G8abt1KxBE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lkssaURtVky33xVBCJC4bvm+6BdjlHKfwYhKEs24L4h78JCdZGz2nHHszvR3nKJxcqwMH+zcvaU3s1RThRjiG7Dw+lNUScqnX656qRrXfoaHH4UQXHLKFiC+7mQdMD8Rp44zXSUQbJGvBMiKDyA7xPolkLM7b7KdzuLivnnbUfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=q1lhB5Dm; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="q1lhB5Dm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1713122601; x=1713727401; i=wahrenst@gmx.net;
	bh=b7dGd2M3688/60gmQ7vdls0og9I6mq35Fc2UrWqI62s=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=q1lhB5Dm4dMOtHE+mmQpDEG1N9KVNZffMw4u4neSfOYTUoMziL8j0+2tE9XAV6Q3
	 T1QUUbRScvVDrNZIo3w8Kpj1uaIYLjuBcG9tNC4Yj7tqFYvVXJNo5E+XDZQGpPEw3
	 PBrUCwkn9w4L11B4DO9cll85JuyBGu2ov9lkdSXNHnyBHVBBtK1VQdNJE4E+Q7ld4
	 KGupsNUvCBsaXUBXxg+fmsmmM62/n7OXIePvhwqO3xxmitVM0wWs+EWWH6X6mVSv0
	 Qqr3tRH8SbK/pisUHThGAJCG+iM7ezWBWue4Q8MVKkGGS31aQmPmbLE/55Dom2iYM
	 r4KISYD1SUZIt3OaaQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmDIo-1seBgm43mK-00iCQX; Sun, 14
 Apr 2024 21:23:21 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2] staging: vchiq: Reformat Kconfig help texts
Date: Sun, 14 Apr 2024 21:22:57 +0200
Message-Id: <20240414192257.6011-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rAraSMZyJ2eVn76GWwZ5H4d+1Tb1xEaJ6t43VeD8CclRmKTF+Rt
 5iPPPfiLkOhZq32Xbh7rs7NRhdLsi4986vvQtZE21jzpaj2atPQosF4hnzoM0Zz/ILcA71b
 pHuF01S2vEqkj04/LA3jsQtjjao4VF10kKvoTs3LsO14jWzkat6PiOLRHwKp04++osqEyZn
 pEOyfgVfnIGYS4zNUSzFQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZTWEnxuC/J4=;k4b8f2Q9iLCjVDA4lRw8ZpQw4v3
 gi4fcg8qz0MD6WqRcl2WFL9kkzRnL8vFOVsmgLU6pXViNZH266fak7bRBdpcBeDezHtuclrC4
 BLT5ty+tmMBHoLnbjJ+7qiiZ8TeCD0oRtgkJG1ZM5fbJB3gSXawG4wjfxY8CU5zI0LV2IubrC
 QWBvJjWHlaYrKj7tyKZ3r1WDNhh6XR7MYNMPsDHsCetRWfu43fAhXqNAp2TezhMNOK1pljQsF
 T05QIdPGGurU+x8/Wdi/DA3k4Q2amUOo7v2wau8WZbnliYay010i5+RQMgPSAztKhvHQDCbW1
 RpwKXoBQy8lyF5jQc5VJRU5S8PKi+1BNuyCJne5dWHVSaCWGmocgSORJDh3Uf9+VAVWBOLr8E
 XWHezIJGqYkVLyWTxLu77gvm1ElbSulntpuhfHE4XOcQjAkJ3IUykRF9Yv/T+QctQ31zocLUX
 yoOq+N/ufdo6djY2hjrAUfcnEv4aRkLeD5vRP40V3iSkJNATa9Nf0e9vBsfB9HNGxYUXqeYuB
 4bWljCnKMsQrhGclXuW/D7itVVKhvb1Y7hh9GhSpQ3DmWNWY3ki8rP8vMskAbdJuDYN546dcs
 FXhT2L9X47Q74QSh31luuiuw0U2lLnFIskWmrk/ZOVn+O6c67GaJDE4+2iRKbduBeZg70L7xG
 9y7zg+5dJseuaZMQ1tct3v9LTZAnwoaafgVFtIcxepFD/UOdzQCehO3HEk28azlvesJow39jG
 9nz7ky1d7llV9RPHGq0cc2+nwfd4Q+F/ZKQrqKR//g+remfjncs9m0qxH6HkdOZ16VMHYaAsk
 y6UiYNB1NLbqHD2rYlBYPtK1hZ/QJjqZxDFyUpnZa2pqI=

The lines in the VCHIQ Kconfig help texts are too long, which makes
it hard to read the menuconfig. So reformat them to restore the
readability.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
=2D--

Changes in V2:
- add paragraphs
- add Reviewed-by from Laurent

 drivers/staging/vc04_services/Kconfig | 36 ++++++++++++++++-----------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/vc04_services/Kconfig b/drivers/staging/vc04_=
services/Kconfig
index 31e58c9d1a11..ccc8e1588648 100644
=2D-- a/drivers/staging/vc04_services/Kconfig
+++ b/drivers/staging/vc04_services/Kconfig
@@ -16,27 +16,33 @@ config BCM2835_VCHIQ
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
+
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
+
+		This can be set to 'N' if the VideoCore communication is not
+		needed by userspace but only by other kernel modules
+		(like bcm2835-audio).
+
+		If not sure, set this to 'Y'.

 endif

=2D-
2.34.1

