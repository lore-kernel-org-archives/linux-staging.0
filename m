Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBECF1EA80
	for <linux-staging@lists.linux.dev>; Fri, 21 Jun 2024 13:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718976027; cv=none; b=gjjSMWd5JXR2q4KIy2UHNSjX196H9l4KK/OsBJ+RQnIRquHVlgfDhHOr9NdkiAfCIbqLxgK7uD8MJJfRoOdnkNDRCyuFJfxJ3Zlscl7Da5cfE2QVBw8ArSIr7UKYHgDS4I3GIEAlnk6A5ALrvr6gSCLhbiGEmEwWpuyURsq1xiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718976027; c=relaxed/simple;
	bh=VAQiudBFvw2XreknKHfUgD37s6bJVpM9Nvtu4urOCNU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aiaYKDkhoGtpdcMPewPb3BxXEozxcLWaaYk69nk3DS6a0u1KqNC5zhLeGrWy+qkqak93uI8B2wNOeKzPe3ceFWbQWEVA9eyYtMZFMUof45xGEf0MzZiRFtLmQ6H1AKvAUMfxy2ekRjFzVLFQj0iN3Z/EGYBHEupVcSRu2kDooeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=T5HyjbNY; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="T5HyjbNY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1718976015; x=1719580815; i=wahrenst@gmx.net;
	bh=Ma+QVWksFpCb2XZEps0uXvVPZlPncBq0IIHoX5fzyWo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=T5HyjbNYZcczcADdTts6G+EmQi8h/5xM4QK2aXa2s/yIlAMvq0WgZccAMAetUiDc
	 x7oco0+XwVAiO1jc6OKKVFEdicPrj7CCSTCYCsX97c2ZeF9QAwXRsv0qheO/740v+
	 NBzsYijs1XwNqgxovbMioWfMdK6oYNJxIw5yG4QXxFf96d3XeItjAfYhAcL3/zDRS
	 d7u7tvtvaHskWqFFxx6eV0ZztLU4FIKT6/NfCSKu/F5au/hUuzU/nOqJwstDlxvUL
	 /go2UKPLqhok2CMbmHgPYj8XpGFQW9SworCilL7ksrjjoXa1pgbAhq3zFuCQUPQll
	 ckYy3u5RTG+UZjazHQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MBUqL-1sDAsC1IC7-00BXcx; Fri, 21
 Jun 2024 15:20:15 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V3 00/10] staging: vc04_services: Random cleanups
Date: Fri, 21 Jun 2024 15:19:48 +0200
Message-Id: <20240621131958.98208-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PomjwHEBo/Hxi6RCGPX328xqWji4ktArXaSb3D4PeqUgpQ7aKmv
 jOWFxHgtROt0mYCSU4NpB6kPXFoo/V1vGmBNRSsBoG+sDc9jR5A+242EeMsOkmD5rEb8eMn
 /AkSr5GaSkMM96YkRV427yIqrjupfqcStckka+Yxd29zwa4uDqa4uDn2/9GpK10pMV04AB+
 CBSy6MsbdIQ/EUtsKbGQQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VOmG3XugvZQ=;d4jlx7c/SAcKkrjjpdqSkCQh7xA
 SRXT22aw/ij8K49gNypD9oAiR77cwWDnIgcaGcZQdzTULy9cSYac52nmGx6sgQqryH3jJYcr2
 FycvLZHWLVQhycBytpSYlLTDfbkQyDjTiifjzSlRVSVlITqozkLlM7thh/mVUqY+CXlIuT0KE
 Os0/XlIbZD6tNvoFwN/zNzm9tFs1VZ8ptCGU+hRnLajnTxSBfO3ZlhCSgX8dI+nXDVHNaJBlx
 TvKCtoNZ7aR6fY9x5C6MSOtul6PTSfikLwu0xKKsfbSW7W6nxX3UyixlM18ZE/YNkBLVeDzYM
 96nEq/n055qhjtXoIZ7mff25DDaIv/pc0+Z6SSTjO7Quyn2UPPaPRnGFy+7WH01q1oy9UxGGG
 44nwpgBMQRrAUOMOJXHawda0rYggbuhkWO0gMiTEANVifyJRt46eSdb+lbufVE8NwHd9Z6T1h
 0hDirHx7dPaAA/zlBTAdXudUno//vwONkaJxJfjpiL3EuLm8HRdXDvbEsQpafEMUwPB+BWanX
 CyKJSv2G4VCB//nuywzAog+2v+y0uCjoSnsyONjjHPIMBA3AN5bqGiOXHC0EVZ76R9TMcCYr+
 HiA8FTrLR1PdKpKEY+eg8p+yRgL98SRzaE1+3S4nG9CDthMy2rTCH6TqgZz5rr/pdN6889EXa
 I/JTlE7pumu+m9dxJrHaprB4wqHPkaFvm5APi/Td7aEjUuPamD+bWj2q6gFTWBEdoBjng4RHa
 P7Ljp7Xeq/o127gjQlX447KwkI2Yq2tRrXgBKv36mymHzGd7cRPGfOf5/oJMYvmywagWprSNf
 TEMs/7NdepNipwprm0C84iN9YhZRmsvvAvL2yG2zA8ds8=

This patch series contains a wild mix of cleanups. Most of them
remove unused parts. But there are also improvements to better
understand the code. Finally the testing instructions are
updated.

The series has been tested with a Raspberry Pi 3 B Plus.

Changes in V3:
- Add Laurent's Reviewed-bys
- fix add_completion handling in Patch #7

Changes in V2:
- Add Laurent's Reviewed-bys
- Drop "staging: vchiq_core: Add comments to mutex/spinlocks" and
  "staging: vchiq: Move struct vchiq_config to vchiq.h" from the series
  this will be addressed in a different series
- Rework patch #1 to use a common return code variable
- Rework patch #7 to avoid goto
- Add patch #10 to fix scatter-gather casting

Stefan Wahren (10):
  staging: vchiq_arm: Unify return code variable
  staging: vchiq_arm: Drop obsolete comment
  staging: vchiq_core: Drop non-functional struct members
  staging: vchiq_arm: Drop unnecessary declarations
  staging: vchiq_arm: Get the rid off struct vchiq_2835_state
  staging: vchiq_arm: Drop vchiq_arm_init_state
  staging: vchiq_arm: Reduce indentation of service_callback
  staging: vchiq_core: Add hex prefix to debugfs output
  staging: vchiq_arm: Don't cast scatter-gather elements
  staging: vc04_services: Update testing instructions

 .../staging/vc04_services/interface/TESTING   |  45 ++-
 .../interface/vchiq_arm/vchiq_arm.c           | 258 +++++++++---------
 .../interface/vchiq_arm/vchiq_arm.h           |   3 -
 .../interface/vchiq_arm/vchiq_core.c          |  10 +-
 .../interface/vchiq_arm/vchiq_core.h          |   6 -
 5 files changed, 171 insertions(+), 151 deletions(-)

=2D-
2.34.1

