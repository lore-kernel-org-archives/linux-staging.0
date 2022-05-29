Received: from sender2-op-o12.zoho.com.cn (sender2-op-o12.zoho.com.cn [163.53.93.243])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC89B28FA
	for <linux-staging@lists.linux.dev>; Sun, 29 May 2022 15:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1653838734;
	s=zohomail; d=mykernel.net; i=cgxu519@mykernel.net;
	h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=H/7tQvtUiqi0ZJQmTxMoDoDs/okaMbJa/iz0nsWrZos=;
	b=XqgBJ5yCJqSPQ/aDKSeP8W34gSaSsT2m5ylRPK9XOjRSVSAjln1QDS3FGL5zmWVH
	a63vXBYuOriHpDzDdpNFldOQDXIVl+CSxnCpWRbJUu3i5iKnbA24zkEvg2vkTP84D0F
	Vg2ehgeM1Wq/+cyK5bmeXw5ljhbq1CSS67jqMsek=
Received: from localhost.localdomain (81.71.33.115 [81.71.33.115]) by mx.zoho.com.cn
	with SMTPS id 1653838730991907.8340407713124; Sun, 29 May 2022 23:38:50 +0800 (CST)
From: Chengguang Xu <cgxu519@mykernel.net>
To: netdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-scsi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Chengguang Xu <cgxu519@mykernel.net>
Message-ID: <20220529153456.4183738-1-cgxu519@mykernel.net>
Subject: [PATCH 0/6] fix a common error of while loop condition in error path
Date: Sun, 29 May 2022 23:34:50 +0800
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8

There is a common error of while loop condition which misses
the case '(--i) =3D=3D 0' in error path. This patch series just
tries to fix it in several driver's code.

Note: I'm not specialist of specific drivers so just compile tested
for the fixes.

Chengguang Xu (6):
  netlink: fix missing destruction of rhash table in error case
  staging: vt6655: fix missing resource cleanup in error cases
  scsi: ipr: fix missing/incorrect resource cleanup in error case
  drm/exynos: fix missing resource cleanup in error case
  scsi: pmcraid: fix missing resource cleanup in error case
  media: platform: fix missing/incorrect resource cleanup in error case

 drivers/gpu/drm/exynos/exynos_drm_gsc.c             | 2 +-
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_pm.c | 3 +--
 drivers/scsi/ipr.c                                  | 4 ++--
 drivers/scsi/pmcraid.c                              | 2 +-
 drivers/staging/vt6655/device_main.c                | 8 ++++----
 net/netlink/af_netlink.c                            | 2 +-
 6 files changed, 10 insertions(+), 11 deletions(-)

--=20
2.27.0


