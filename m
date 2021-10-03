Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586893FF5
	for <linux-staging@lists.linux.dev>; Sun,  3 Oct 2021 12:33:22 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.122]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MsI8Y-1mmthW1V9e-00tnYV; Sun, 03 Oct 2021 14:33:16 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Gaston Gonzalez <gascoar@gmail.com>,
	Ojaswin Mujoo <ojaswin98@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 0/3] staging: vchiq_arm: clean-up header file
Date: Sun,  3 Oct 2021 14:32:46 +0200
Message-Id: <1633264369-998-1-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:+bS4szpb0/pEJwssxukTw2XTFeBxVDil+jBcYR7damb4HMY2yOO
 hO4YQuvjl9FHHsD/MkWYdLDKoW9ak7G7QHifulYwmhpuplnNGTJmAZbth0XuCluCse963tv
 XuHHbh3mNR8wqNtM0TtwdoQIJQ3T4A9ZPBq+RhMc94kHEfZ+h7MlpAjXcJqs149G1/iRkoq
 l5Yj/kM2H2q6U7fQ5FJSg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6TcG9IYoESI=:8ELBK27v0EyADvS+My9aoR
 CeKKuyzGEP7dUaIom4uEIB+TINUCbcfZvz5x2R04RsNT/1R17Y6s5OwLDoqgHDk/T0qZvSVl9
 n/kwPeyGM2q0ebC0gOy0PyRb+588/4Op9RXx5BneiWQmVU2pU6qLd9VTXsTqly7VR3/fBofzT
 KOnlwICunVmicSWhOGA692nFEuNKeDc61VQlQKFY3J3q+N7X9jUhdqPiZJIwDojTfeI3HL2Jc
 c4CYAOma/kiIE2EBKOC3tUpEocCi3MVjxaxBTTQhVZcxM+1/uIKEfy5RFJmpCnwKsa6C5czQT
 oJPglqVtJ4VQxN3dxnio/7QVFt+Vkdmy2kg0dTsQvt2kDDCIFYlfpbJjXP4Qa5vlE3/9Q13eI
 gtkC0w24HNcBqEY3/QfdFLaY1S90uspQ6P1WMR9n7lsbNq2nVnbxjbdmF7fDL7ufXaW/DOdOS
 KqU6IIhIMv3Q+CiDu5DqBXjGsPFrrHS8JahpQ3epzk6oxEkwf11lIPmky5Jfwkj5TvMAv3ngX
 8uVmNBvD1teutTy52/kHjAA0yWPAum6sRY08iqcMvXZeQfr1Ih9M6v8AG0Um/AdVLCZZC1kMx
 9dG0DT64i91OnmAW4guZ9VdRlXBUTyY06uvS+N2sgjuM88/PGrBQ+LpUThcjsdh2c8TvCK8CV
 zH25T5z6Wd9ve4DaBAXhHraHdxDLnmpjpnDBtA+Nm6GfxgTDT1QwRjMaoQqUBxiyjusmkeTpA
 bM9Dt/6FT0eIewiol0M2ge4qNwd7KHnMg3Snag==
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

This series cleans up vchiq_arm.h after vchiq_2835_arm.c has been merged
into vchiq_arm.c.

Stefan Wahren (3):
  staging: vchiq_arm: re-order vchiq_arm_init_state
  staging: vchiq_arm: drop unnecessary declarations
  staging: vchiq_arm: move platform structs to vchiq_arm.c

 .../vc04_services/interface/vchiq_arm/vchiq_arm.c  | 73 +++++++++++++++++-----
 .../vc04_services/interface/vchiq_arm/vchiq_arm.h  | 51 ---------------
 2 files changed, 56 insertions(+), 68 deletions(-)

-- 
2.7.4

