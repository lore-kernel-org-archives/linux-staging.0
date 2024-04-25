Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6149F131746
	for <linux-staging@lists.linux.dev>; Thu, 25 Apr 2024 16:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714064366; cv=none; b=oTH6qtl4bN1iMUbJ8ZDAPO+lD4LMzdD8UENvhXhEo2OI2gqh0fotnv47K+0ZFZkX39qg3HbAlnw+rfbSwM1cB+8GhjwQ0T4OpScukxVImQkJqq3bblhBwPMV/nsUu9E5I3Fz3IBl5g2v+yV3Y1fViCjqDePRw81mV+ZldD5SNyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714064366; c=relaxed/simple;
	bh=jqR2fE9cOhiw2KFqqkTZwEFJmuq8U5LK6w/9SoOu0Do=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kNK3nBCAqKZBCC5RY1/+GfTS/AwBFPxeo3f5rSYrPnKGghZwmB7WRQCZV0sLAFNcKOcBUVZ3ViqAQWi+RgCzyhzeTH2HAuZMVqcT1v2UXBxJfVdocFxUhkEDTR+taHBxqUv5bTIxEgsqhDA3PfnuU2jP82rpNQmNheVd2SpO42M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=Wa9gM3cg; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Wa9gM3cg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1714064353; x=1714669153; i=wahrenst@gmx.net;
	bh=60cRyj7ZdQVJDrQogyJ8fx47LVozNsiqgJdbSCKPFVM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Wa9gM3cgqQZIMlxm2/9r/9BD3nmYgh5IllwS2qKLU8/RgSytR46m8NbRs1bf87xZ
	 pFySfLH1Du7Fmgt7acrVirHPloa7RUAMXpUhyxl1l7wCe6pwO02KsjWsfRiFq8WMo
	 LEil37K96W5xyx0bSTpmZKYqqQA98/ZxSHO2hta4EF1+InEaM3vipTMVH50Fmol/7
	 8hajKR4CVuEywvXRiDDtVXqr6XyF4x6iy8W0NTUDp8Tki+OSfZzux2JD6xakAM6p5
	 aNyzV69zvmqmzy3Ba5sBlHcd1oYlP4tpp5haYLOEUhHOuGAEA6jclm29rkIrRKSdJ
	 FQ1xK+tiJobaSBc/Ww==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M7sDg-1s3u3n2kh0-00604a; Thu, 25
 Apr 2024 18:59:13 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 0/5] staging: vc04_services: Minor clean-ups
Date: Thu, 25 Apr 2024 18:58:47 +0200
Message-Id: <20240425165852.6681-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:v4CVP7pccLEcuqGfLXllmmowC9x7O3wuG1d+Ox2PKjciDK/TGWC
 53Memv92B3Mbdx9+SVl9Q51wJqBq7x+MVjgKc2ecAS+rJ3kR0RXtgOjhhTMGDtoq8z7sv7b
 wtQ8QG09Oh2Ut++koBuRxM3NOWMztnfUr1Tj19gf38wq3KRsHbbknYpIGq7mtAYLGETqOrc
 f+8O4fWgBXcuA0toF3ETg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Q/wOmf4ghaM=;Dz6AnDJDv4B5mPn5CY63Sfmqxf0
 R3WYVfEtZcJCYKeDAvjE+GhdBJMDewOqvxVytzCev/giRgh8Ghv3ZiiDPt3cUkkwmeH11eYJv
 eJmM5UAxFSFS2uatuV2ykL2quCOrqkcwEnrCh1xVxGg6ARh48eaZsnDPzx4LOhrocpQuezq+8
 4QpJ+1Yh1E1trmjELT7o0JG6VORbjxMQX0LhJsWAgYvLkz1fDCXdwtHdWWtmjvJIh/B042EBi
 VRykoeEQlnX3vD9uHXUJLTu59sQAIBJH0yefDUDo7ltigZhIdaoLaxVyV/XZTjHBq1fu+7f6J
 eAuL+AYkEknuPRt98m0ERiYawChSUpi/zQWoIzndud95SLUpHRvcqUbu+k0B8g5SRMQwSoEE9
 +fvZ9YGU9LadQyxdP9HOPpSVOW/T+6Uee7MKByqf3L+/iMeqORaqeg3xNwAthU1tvIsle10jl
 O2T0d16/WvdYmvHS+wdXjqn4xohhfAlhmJvbLLtzpMNro5J3PW8WJEdI5GuORM2mza2902NZS
 r98ygFjnsOUcPIkbHxJeg8q7WH9x9Akrrxc2VU+5/SSjrnZzRC3/RW8wcJ3CKZC9w62oSxuF/
 GDDxobOuaIIjImM2wjIcM2ocfxgN9CA2MNa7Il8swRslHOZwWirWmldJV6+kCdfe8POGtjupK
 1ACAxaWpMEoD2iTFtkl0GFTwTo4MKQqIAwJc5MOiI21awqHfKUgiZu5FZrN4YSRg5bQbrd6z8
 pfWvWkqoK/7YAcMwclAjU9vlnpbpBkRD6UhYfzFZ51x0xSxmqMJaFjKA2HsQ1bjz3btBy9JsO
 eRyEaQ++acI2daU5UjrOuyR96hZI37Fp/K669IRTZHWUg=

This series contains just minor clean-ups, which were mostly found
by checkpatch.pl or kernel test robot.

Changes in V2:
- Add patch for issue found by kernel test robot
- Fix typo found by Umang
- Add Umangs Reviewed-by

Stefan Wahren (5):
  staging: vchiq_arm: Drop unnecessary NULL check
  staging: vchiq_core: Use printk messages for devices
  staging: vchiq_core: Add parentheses to VCHIQ_MSG_SRCPORT
  staging: vchiq_core: Drop unnecessary blank lines
  staging: vchiq_core: Add missing blank lines

 .../interface/vchiq_arm/vchiq_arm.c              |  2 +-
 .../interface/vchiq_arm/vchiq_core.c             | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

=2D-
2.34.1

