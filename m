Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC159149C6A
	for <linux-staging@lists.linux.dev>; Tue,  4 Jun 2024 17:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717522174; cv=none; b=qSipkpUfJb4rX02MXkZZGwgG6hcB76qWnOMDH/eOCCGe38ifk8cy5/8a3DIP5Xr9MGm8GOggKAcuba0x75m/zR5C1cE0reZqx5GopxkD6hyYq9oRHjG1w+Ds5z2qaX8pkyhWLAn+wvHwliThZ0tjTM6fguZOROyyxbzjB1oGLLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717522174; c=relaxed/simple;
	bh=drZLbwJK/d5DTrLrmnfBtwGK7AniFJODUE7sIVldQm8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DrSj3YHqlQ7mXEJHYbAAdj5Ng5OGTyqwoSRlZJlbv1NOskxdnnbjsrCCH++/cRDxAX/PlII3Lp23Bv3RGY0kpr3NeCwbKWSb6VxMDFfDSjCWY/ZKHGEptsDHRmd2uQ105npw65WM4AcqZcpWtYDJtixeM9UkETYPtZ2wpRLCe2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=JpexnhFr; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="JpexnhFr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1717522164; x=1718126964; i=wahrenst@gmx.net;
	bh=LTurhgqGBCWSBmH7AaC3KDylsswoCMbxqEa1yyg5lJo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=JpexnhFri5PF/j5P8eZUGD/rLE+wHlsIlzb+tc1/Lk7hljOvM/YHMxCQg+YvkhKt
	 wZc65m7UoZqU+A6BIU71IT2pVJRJ3YKUlWI5bMF0ao0I1dX7PksdFJWA3sALlO7ZY
	 5y9gP5UXeFVrTUwODxuvll1Sqc/g4C0t/1oYeoralC6HtmrQqjxbb3rRgpTHIXvEy
	 6YE9gPTRbe8zf4cdUhg5GWcxyKNYT+VagviPpnLhA0YBTFkLv5+fGt6PaEMM0NWhS
	 Fh4dj7+1neBsyjjl3yYx5fO+FgwiLgHt7ErtyBZclP2r/9kmNlBsW+aeWOsBk7jG7
	 l4ZnxHDcSJHuG+S3Gw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Md6R1-1sn3Vg3b4F-00dESM; Tue, 04
 Jun 2024 19:29:23 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 04/11] staging: vchiq_arm: Drop unnecessary declarations
Date: Tue,  4 Jun 2024 19:28:57 +0200
Message-Id: <20240604172904.61613-5-wahrenst@gmx.net>
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
X-Provags-ID: V03:K1:+6MBcs2hLQzB6gsoVTK9u6MrzrO9bb3vr8uDoCRVVxtnlBs8Opt
 bckuv99I1RUHGRtRqV86N1ReO4qLLPrE4Zvn2YC/QlO861pAqm1Nq7RsxJiL2xzcwIqHSmo
 LYe5wq92NjOGUP6nBLhUDcfflGCE733JH/hy/fa0Jou4hAwoD3k49I/+HygoqBKfpR7Ijj9
 YSCyESukDOW/Xkw5XVUwg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Gk929ch/ZcE=;Yj2Tn/UPQe1OsCo/sJBz2PEU57X
 5psE9OuuA+uzMjI0nD+XUhoL5qpS77bar78ggCcAHvWEfkn4zUevHO7R6aleH2G/u4FE2FYdB
 k4HOvIPDrFwcS0TIFVttYKFJNxI9+P6JfUX9lYIFxUNCS4iuG1RlNo0ABrF0uqTdv/zFvXhYU
 rzf/8Lh5qTm2GiEhUrkbZILF7Pf00H4xVWtmuvMc6dtjYdPRkBv2ibeK/NYnvADb1ND3GXYxy
 5AQKkEaASDSe/PN0oZLXbgcR5Yg3qgpKt5HFGzFJH3cstuMAdb07pZRWK0wBlcXN8bpB5Z3QQ
 b3sa83n5jputrRx9VnkXUX1opAngxV3vUV2HHgdHXAi+x3AI7H8DNhlpeLjSYcRFGohCTaQCA
 ZfFWC9TboSeo+JE0O235/Hr61CXWzRxAL72wgrlEKiy72tkgbbMwAiUmWCW51E07iyXOyCW1s
 kJ7mUmsD9iY4MBv6m8YJ/R+OC7qbTAZBe0ubi0qdHRmrNPFC8gQGQ68XP4jih+p0iacPai0y/
 hNfYVFI4stIDH3g1brvOxflYkjUViyZiplZHQgQsxCNWk8jExSltgBHjtXn1WEFOpilkz+OBo
 5zCVPRCCoMV0FO6YDCNzTjaLSpvBsBanlU9EjrMJWCm3bMPIfWSbrIC1Sx5y91W6MtYntfD+V
 ZA6ReVfxDLqXdqZ41jcUzRB1j4BnhDAgalhyT3O0TuQgnhSwYwUrjsLYZ1IXrjX/1CuK0+I+I
 Wc7ccI8voHm4wPYEoF6Boov6DjbLwtPP8/jKSZCAmGe6T+ZC/BSTEH5PfF9/lqw3hX5MSxzS+
 3Y4CG9w59bOG+Bt+AHCVStT7avUbHjYjiv0aA8MF7LKZ0=

These declarations are left from cleanups and not necessary
anymore. So we can drop them.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h  | 3 ---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h | 2 --
 2 files changed, 5 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
index fd1b9d3555ce..b402aac333d9 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
@@ -109,9 +109,6 @@ vchiq_release_service(struct vchiq_instance *instance,=
 unsigned int handle);
 extern int
 vchiq_check_service(struct vchiq_service *service);

-extern void
-vchiq_dump_platform_use_state(struct vchiq_state *state);
-
 extern void
 vchiq_dump_service_use_state(struct vchiq_state *state);

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.=
h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index be20abcfad75..3c7a6838ddba 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -539,8 +539,6 @@ int vchiq_platform_init_state(struct vchiq_state *stat=
e);

 int vchiq_check_service(struct vchiq_service *service);

-void vchiq_on_remote_use_active(struct vchiq_state *state);
-
 int vchiq_send_remote_use(struct vchiq_state *state);

 int vchiq_send_remote_use_active(struct vchiq_state *state);
=2D-
2.34.1

