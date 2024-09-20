Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507EA185628
	for <linux-staging@lists.linux.dev>; Fri, 20 Sep 2024 19:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726860991; cv=none; b=RFLc6XPORyz3QtDaPCb9NtOPkXxe5QX0UgaOrN9LKOHq6l7VFClvhr9Ml+ZG9BM5A34Qhsgr/R3gK+QRuJHEBdw3+WNy1dZMNiaZo8swwf/PzomzdK/UDVvq7VH1qJX8+Y/pSVB14sp3W4K6KfDWs7NZEtUgqRvYo72WoT7U1Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726860991; c=relaxed/simple;
	bh=7vlRbQcwd0pMoUrdjMHi2lDH5TbuFKu9CR3Uy6Y21Mc=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=B90aLnh0Z9eF0q7jUEeEoHbcSangHpBD4eJ8Rj9H+Lj+38n/nVd2pGQnjLSqLL7MSFj664xIEB0lcEi2ouyBun3D4p4OJVwRAuDl1HpqtBjcOolY/hh6aIFoUs0Z1tBLsG/at9d18EkSCTidT9mjys8pJzW2Le8cYsxtEUaAbqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=SgUhMKDw; arc=none smtp.client-ip=185.70.40.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="SgUhMKDw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1726860983; x=1727120183;
	bh=W8v8r2h7r1KU/mFKXhHA1+p2uQE6A/CCsuxkOZmGugU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=SgUhMKDwN+kHcXx3O1FnKQPDv5pmihiXB889vm105UM1H7d7kqI+CF0uZ9BUJedOk
	 rOvw0Up8ZeNQxrgF7ACiZmIZXfcKP7N3HA1NMoMH3w4wH1BEwriSP5i/pQvgS4xnUj
	 /nJPRF8rclUnWuMDMhogdJd6pHBE3IbmSJroRQC3zYUWRGlgHbL/nSYJpj//3uadVh
	 zXZ/T8KMANzKSXw0dz6D73YI1cqfPKI0nSJ0HIiCGl27gk4Shp6Rtp7taUPv7LVwIZ
	 DMLYuvW4yUU0+ezz9H9xDJEgVG23v1CULtSATGml8Wo0SLW4gKydqc55BdUBS/jJPE
	 YaXRBn5xtiGMA==
Date: Fri, 20 Sep 2024 19:36:17 +0000
To: gregkh@linuxfoundation.org, tdavies@darkphysics.net, philipp.g.hortmann@gmail.com, dan.carpenter@linaro.org
From: =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Subject: [PATCH v2 0/6] staging: rtl8192e: Fix alignment to open parentheses
Message-ID: <20240920193356.32156-1-dominik.karol.piatkowski@protonmail.com>
Feedback-ID: 117888567:user:proton
X-Pm-Message-ID: 2e49eaab5358febfe06682868e7aa778d14617b3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This series aligns the code to open parentheses to improve readability.

v2: Split patch into smaller patches and refine them, exclude files conflic=
ting
    with https://lore.kernel.org/linux-staging/Zung-0ClV_527-_e@kernel-710/=
T/#t

Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@prot=
onmail.com>

Dominik Karol Pi=C4=85tkowski (6):
  staging: rtl8192e: r8190P_rtl8256.c: Fix alignment to open parentheses
  staging: rtl8192e: rtl_ps.c: Fix alignment to open parentheses
  staging: rtl8192e: rtllib_rx.c: Fix alignment to open parentheses
  staging: rtl8192e: rtllib_softmac.c: Fix alignment to open parentheses
  staging: rtl8192e: rtllib_softmac_wx.c: Fix alignment to open
    parentheses
  staging: rtl8192e: rtllib_wx.c: Fix alignment to open parentheses

 .../rtl8192e/rtl8192e/r8190P_rtl8256.c        |  9 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_ps.c    |  2 +-
 drivers/staging/rtl8192e/rtllib_rx.c          | 91 +++++++++----------
 drivers/staging/rtl8192e/rtllib_softmac.c     | 60 ++++++------
 drivers/staging/rtl8192e/rtllib_softmac_wx.c  | 60 ++++++------
 drivers/staging/rtl8192e/rtllib_wx.c          |  3 +-
 6 files changed, 103 insertions(+), 122 deletions(-)

--=20
2.34.1


