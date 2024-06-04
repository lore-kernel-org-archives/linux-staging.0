Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BDD14884D
	for <linux-staging@lists.linux.dev>; Tue,  4 Jun 2024 17:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717522174; cv=none; b=CgjQDM2iwOBpk6RN5hqkn6RexrPNx3jdGlc5MxkbgedtcvItlOfvAdq33YCss3OxhaUe6qmjVadBpgp36kPhxE13b3nGsRM+p+HsbTTP/sXSCDbtyUnksTHO6RHAMYMD7xdyiTZAwvJQxm8rqlhBYZNJ4zvfLUgMZuTzecPKSg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717522174; c=relaxed/simple;
	bh=vmBz7fxadM8L54KqAY4FA9Fbch5Y5AK9zdARNrOP7tA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q9DiToFQ6NRBToBkMm0igS0ZO39CaPpPpPqBtaU2wq28TmP/U16bGmMG1ov26Gj3Or9InrBDporygXYuBFcNzfwiiOG6Wxa9UWvWif8v1ZExfG76TzaihsimCLdPg+wzpTmCcTDegTtV6DqqHDienQbLKlynTFCgw3otdD4Uxwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=sOSvAsb0; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="sOSvAsb0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1717522162; x=1718126962; i=wahrenst@gmx.net;
	bh=WK6o1roi+j4phLsR6Cuk/MEj42xb9O0r/JecCLyJMrA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=sOSvAsb07/4/qKMvu5cqT7uGq8szBsZcJUUucz9TM909Dbs2Bye186sLHN1ES2nc
	 IxXLvVTyohNiNRUDLbVSK6lNz7BJCYPdc7DHaL80tRB7XvHurnxPTTV5qEsUKpbTg
	 VBtbEs7XnCSn5L+32wQejG6RABylTDoboR3pNP2s77a7l/uUsXYRCaSrdbctqgTak
	 d99YaD2WDk25Jfsolnq5w2UZVmWOMmKgA1AU6d8Q6wwtJyOJx1rSOzUmJ43dNhS85
	 LVKEvPjFftmhFJB3FZqqoLJhNzE/wS/5POSTHGKcJeYoAqijBDrjlqk2xILErJ8aq
	 AYwsDwE2BQO/mGfvGQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEm6F-1sFxnt2Oj5-00Erzy; Tue, 04
 Jun 2024 19:29:22 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 00/11] staging: vc04_services: Random cleanups
Date: Tue,  4 Jun 2024 19:28:53 +0200
Message-Id: <20240604172904.61613-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ltucmVgk6BMfdFvWC6PRAMmK5wDyJfDyn62e9FrYhSs7gKd98Sm
 5d/ssULjBrZGcgJLmzzgQa28CmX/1KdMxZ1VyHneY7GPWmpHlpka/trDt4gzN5U685/IswK
 cRJb/i5vgUiw3LLTaKPi+9Iekqfx1zUG/dwD8YWW8wGcE23m8QprzaJVduUPT0g9cp4fZxw
 kkrxcukW0E4CvTKSiJ/gw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fYbIsuH8r8w=;aCo6+BTy4A38TBaFDlsXGHmrN/x
 5H+sxdmn7OLaOEP9iJYP4mW9h2FmEaAsYa7VkQyO+rA2ig9ED/suvzGIbCpI4iNvMixUjVSX5
 R/iNTcHu9/9bF7kf7wq2QJDWfF/pdaDWUDtLCUYMV8yuIb3IzOEhzpE8LLlqn7so9z7d3hoo8
 iSqE6d+phhHnljVQFbPJ+8flAl5Ta8m7lpYSbnruL/j3YZtGHklxetQtyjPEDsjvBl5UfWVyS
 EXM2ETcaU16QltEDVN7IWsypyiXzMHZiP1eEUzr182JwgvehjU4Y0qyTNlG7Lfa4OPQQMyVgL
 rgBZuv13TFcECgm+tMRutFIZqqvucQjSvsnJz2Pn7ONDc4OXJrQNbVNAiatCeWySja2HRDVLL
 +p6HOIdV0HoovEpFxt8KI7oabWZGghdmLUYP/NoiSm6H/sz85iEl0Oklbmz/MpCxrmN/LSLn8
 1n4boDWIB1go6Y49zzu0vJeOn4PZz2brdx4oqQ0XQGdAzOp/BX/rvAbgsknkdCW3y6aOi/Qos
 XdsUkeoMvR9uzOCL/AjK9snTXfb3y+D0roZsmQldJ/tIebgNrDxeH8K0Tfsu8Qz03/XMGpbvo
 +CZtkYV1ufTK0YUeVZYq8DdNBTltdmL0jLWb1EutZBVd/GD0G9M2I+D8tPufym/xpuEiBm/vE
 FPehdXlg1MJTzB9Upqkyupxn7VkZoc1A0suRVUGKKcLQGbxOfAfvyjLcWTbM4+hPS25078zma
 2tBu/JT0vAf1fVXKJkO8diwklYg49qTrHBWd2x6FBWuW0qKsfwkHBgiKczqFPs7svYaWsxZms
 5fP4RUjDNsCdbt1fRIfK5vhHbO4wg/x1ZzKFJToF6fXvA=

This patch series contains a wild mix of cleanups. Most of them
remove unused parts. But there are also improvements to better
understand the code. Finally the testing instructions are
updated.

The series has been tested with a Raspberry Pi 3 B Plus.

Phil Elwell (1):
  staging: vchiq_core: Add comments to mutex/spinlocks

Stefan Wahren (10):
  staging: vchiq_arm: Replace variable ret with status
  staging: vchiq_arm: Drop obsolete comment
  staging: vchiq_core: Drop non-functional struct members
  staging: vchiq_arm: Drop unnecessary declarations
  staging: vchiq_arm: Get the rid off struct vchiq_2835_state
  staging: vchiq_arm: Drop vchiq_arm_init_state
  staging: vchiq_arm: Reduce indentation of service_callback
  staging: vchiq: Move struct vchiq_config to vchiq.h
  staging: vchiq_core: Add hex prefix to debugfs output
  staging: vc04_services: Update testing instructions

 .../include/linux/raspberrypi/vchiq.h         |  12 ++
 .../staging/vc04_services/interface/TESTING   |  45 ++++-
 .../interface/vchiq_arm/vchiq_arm.c           | 168 ++++++++----------
 .../interface/vchiq_arm/vchiq_arm.h           |   3 -
 .../interface/vchiq_arm/vchiq_core.c          |  10 +-
 .../interface/vchiq_arm/vchiq_core.h          |  28 +--
 6 files changed, 143 insertions(+), 123 deletions(-)

=2D-
2.34.1

