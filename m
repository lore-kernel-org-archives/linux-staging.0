Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4649813E030
	for <linux-staging@lists.linux.dev>; Tue,  4 Jun 2024 17:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717522173; cv=none; b=bhOFqSIB2S26yZnv/FZmJh3MJu8h8/SBO9LfWccGam4IDE/NBjQzr0thiU28Vgr+uFnof2tNVUPuUiB6DcpI+vjl86bGok73SfqbzQv0KjkSh1IsMYpXXRoZBMl2b7r3ajTH2ftfdqvLRuELz+AP9lCd4zsCwwtTRezIpjDyeV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717522173; c=relaxed/simple;
	bh=ECxuFy1CqMlUmYWTemmD540QTETuLDU3LEIHq03964o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tLSjjpREWMJr4zFgGgQaYeadPggEvD2GEaLVGKmgecwkCaw5df1U/Qwyl8kDhkKAgpsgvPTuXduWFgihJyozAy7i/ZwsUox4Tk5a4lSmGQUi7lyDZG3H3vzKeaeWJ6tiwGz2Foe64XM5PIcKkIrokTlnwvJJ+Qg35+GLU5Q08kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=hXkOXV4z; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="hXkOXV4z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1717522163; x=1718126963; i=wahrenst@gmx.net;
	bh=XbOIuODUCUQYgmxgmgv+5Smb6UaSNc/ht77NoSgfhL4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hXkOXV4zp12O0pcnlYRUM+awtQ5Yv8x8tp4BQDy8rqSE8yUa874Y+PYt5NVblD9m
	 vE1Cn9TadYBWPq7E1d+hZzUfG8bPYSn7MshA7gpnBVyIXAo5PFxaWR7j4b6gwX1wr
	 usuc39oPYwtKW0Htdci09JCSVM6hkACGhA3S5SvnQlxQayraekQbX8tVGuTt+KWwa
	 pv15Qp5sEf/RwKzvB76xlmi3Ejg9HTB9EeEzK+ULmoK1Nwt0b8Ei3TnFptSNE+h9q
	 AFlyVUdN+5J2QomTpjl6j9GW5fpMhHbPBz1uTYMHwJu6ZmpKjyId1bH9KUsbaui3I
	 R1fWDJS0tYjC8/m8yw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9MpY-1sZYow3iUO-016ho1; Tue, 04
 Jun 2024 19:29:22 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 01/11] staging: vchiq_arm: Replace variable ret with status
Date: Tue,  4 Jun 2024 19:28:54 +0200
Message-Id: <20240604172904.61613-2-wahrenst@gmx.net>
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
X-Provags-ID: V03:K1:jz5E/93pwCXh4ZgHQMeQzcO2itT90CBjVQgT7cxpoqNDQjCrZeS
 TNft9OWaxrGU1TIeb6RKk0viqa5/YFtKJ4ox9xYCn4u04Vrah0TaXqQU9m4nxHf5BAdOTpY
 X69U78GyOQPIcj2uyKmXZRE4YZ4kWAGsfj3cJ5U2frQuFdcwRK57ljTWrPsjFSXDDU4O67+
 sOsQzSJoa0OiV/AY+I7iQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:epqMepvIfvo=;FOu7bRMMGhQRBbJ2erHC9lgxyZs
 2OrYwVzSbB4JkxBsUBugpOVKoIHOIwq0GVMzi9rvYtVjCotGZzagqTPUd9t/HHgYXEWYI0Jn8
 xdEj31sLZMweMVZl2Eq9fkWAyeSwHnziglVJIZQ5WAV+1d0oLhNjItJ8OLRXsGkK4Iz2oVWg3
 If8m8J+wAlnFN7ZNhzOtlV3sL9ZIv/a5w9eF+Y5PRozm0A8fK0Q+bb3QjOqrCiw9VASjZ6FDb
 vrLH2YkWQP1riCI/SYH5fgPGlKTCUUlNYdrXxA/FY4QKZEmiIS15of8Vkocg9Q/WlrIAkodsy
 JcFNzuUMwpdC6sNHrkPlhvH3yCJZYjP6SXU0D//uzTmcaqapZjAGUPPmlDiNMxZ9DyIGN7grd
 Zb/cgYcSPpTamt0jFawccwU2kEm7XcfNVP1SG+fBmDfJTcYwtq9bqXJTtSfNEmqGuA8QnAx3k
 tx1ZGKj8rnHRk0j2IN0OJI4I9j4jtRxcKL17IN5PgSx032rBCEHO6l2fvScImB/ZEaB6Bwtjo
 6b84PbfPZDJVXqx583B5/SiWP68y63Yc6vB30A5OYHgW9lQ9YjBdyx5i0Dcr6nSocq/gvPRU4
 8YYC//bh3m/cTYU9X9PnpOLVj1WnQI+nrb32s7sao2hjxdu4XVhGINr3rE9GcmKwHpcY0c0AL
 sTxFr6eFtzn/OgEpmVi82qesmg3mWVhDpXCYhB9Te1SeRs+V55p6te5OIoWRO/IWsjXj/WrZj
 ic9IUJ8If//pD1o6uK0AhB4OMf4utEVmj+wm1weC23qS4tGru+zoaVdMGlME6nnGxHnmqy1nt
 btWEccPQujnharGKUggeTHVD7k+NvDNIWU6Np5EOpPPVc=

The variable ret is just storing the result of last function
call like the variable status. So replace ret with status
and make a consistent use of this variable.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 69daeba974f2..e2f4aa00cb70 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1298,7 +1298,6 @@ vchiq_keepalive_thread_func(void *v)
 	int status;
 	struct vchiq_instance *instance;
 	unsigned int ka_handle;
-	int ret;

 	struct vchiq_service_params_kernel params =3D {
 		.fourcc      =3D VCHIQ_MAKE_FOURCC('K', 'E', 'E', 'P'),
@@ -1307,9 +1306,10 @@ vchiq_keepalive_thread_func(void *v)
 		.version_min =3D KEEPALIVE_VER_MIN
 	};

-	ret =3D vchiq_initialise(state, &instance);
-	if (ret) {
-		dev_err(state->dev, "suspend: %s: vchiq_initialise failed %d\n", __func=
__, ret);
+	status =3D vchiq_initialise(state, &instance);
+	if (status) {
+		dev_err(state->dev, "suspend: %s: vchiq_initialise failed %d\n",
+			__func__, status);
 		goto exit;
 	}

=2D-
2.34.1

