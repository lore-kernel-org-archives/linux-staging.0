Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B024DA09
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 21:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718053377; cv=none; b=C1vlegNnoY3i1DUEhqf520bmTA74QxCoB5odVo09sYweP2oIpbejJ57Wz8kua2ESy0xAUuCi9g95J/ncksEWUY6rdLp+CsIOgeh+jwSUSl2UbDDOSp6tWiYG4anYo/6EjTkySVX0ZFrEciIN1UdVvfTx1evpY2cQyujTIjJUf9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718053377; c=relaxed/simple;
	bh=Z3/JjVrTdM9SBAU/8NRIQbmct1VsNhAXPQtJ65V5eXI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iFY0x7+/KgPmc/S/BhurJgAkghRJrPcBUlUq1tD8bzmxZx8frFHEN0HPCVNMgjGkgDLeJ3GTvi6CVvdSN6At5FDZKAJYzZwD+12bmGSrjXs7D40It/5n6nlqK5siMBvlooBa1qfrG1/jjyFwe8/R3KMfRn3ztCCpLx7jwNalois=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=gmb4hIQu; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="gmb4hIQu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1718053361; x=1718658161; i=wahrenst@gmx.net;
	bh=1g2OvbxHtxKT0PRHqWij0NUGTLZhjh4r90yi8QuVEqQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=gmb4hIQuLLXV6QnxYSeuaKcLbgCOjFje8Bs6wh6zww/6bXSCco3UOJ+2KhH4u/cS
	 YAh2ZMAsvJmCUVRjVyq+ujQUocn312JhObLVrYjJbsWzEw3qIvi8xzb/frtMQTlhr
	 yBwOUC86UyvlyIo7x/BHSnqB52PABX0Yh0TEFPLsfuGHC2aVrzg0VCZbaMUKjJtIH
	 AGflLw/PNV3R3pLyb9D3REp9IqHROyNZamnQ0T0rYXD59aB5hzCyfyhk4lzK2+ERY
	 FzCLPGCUdk5uSw9yOgZcSSJjDOTxd/h2yyX4xwonrIcDI9KHTlVIDDrRVTG60JsvJ
	 /KPetRmqJUoRceYSMg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MK3W0-1rzeil2JCg-00W0r2; Mon, 10
 Jun 2024 23:02:41 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 00/10] staging: vc04_services: Random cleanups
Date: Mon, 10 Jun 2024 23:02:10 +0200
Message-Id: <20240610210220.95524-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VCPr0+QjWZnbzqNDtF+ZSmpTyloUhkp/1hUTE2XUsEgq+2SfRGi
 F4bv8fRFnh+ZR5MtjjInOgy6dEoHhkue1As6GGkEdyPD0NomcFuUIg1RiRTJ8mVnV6yVK7D
 B8bjAaJJRn8yCYxuZ5s0TF/tBYisJxWf3KJ04jBX4J8gnOGNgao8TH/7pwnQoGioOJKcrRD
 W88t0gBx+A6S4pdIZZt7Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7+dv/8wohvI=;3tueQo46q+2QwOCOKP79MtjgWCr
 67kR+YnLD4AtX+6Nt2lvlXAa4ZM5GmEZC4bU6jWrDI4d/svojNwDO0IpV7qCSPnXp3GCev5mx
 8m8puRUPP/XV79JvEtCeL1Z8UC+EJuIZWgaW3/0o4zBiT/E2mlScDXX0owQIF87p3At7pUfFq
 yOs8hs7HX2BN/AhqKmWyXEhVfDxH9xXlXkTCLVoAsg+U8PRcM+QWgv3/dLCEq1ZTrkowOnwC/
 0vORAClykKys/+9Y3IO3SZBpgMSm5GO2pRD5KOdQG9IMIb+G6L/0TskZnXBvskD4dD10a7hsT
 JGSGjvXJLerXYtbPRhIHSeS1DYL/XoF7VDLnOv/96yO0MUUMRXsFup0Bo4XUW7nM8aczXrOPc
 7/mSkWAreEDZQGXqMIXrujwPF8/mDeAJhVkw9xDVhOaABp/Cq2QE1i1em2/RfiOyatecmrxzU
 NwaHo1kjPQtALG8/vPsEr2joYmBDCIvJdWkTTH0MIb7UDp4ccYinU++vRQhRKvGW9P0ZqAExU
 oSjrBPasW7Ybpzpau2oiD6ncWBwZ+2YvxQNqNtjdWGLJrrNK2PhXcKNePbxea2XyQ9z+iDJ4s
 +6SB3VoHgWTuGWJojEf2CaM2S14rN5tQJsv4JAo1aMEHtmbp6S0VFt+2kS8xWXsNHQuGtzntL
 s7uHw9CyW/EXtlK2NWqKfQI+njKycUlu+fOONvTgnw2ovnah+2la6A9xvL/GDNLy+i1P0leKB
 uyj52gX42jjJf7Ckf1nBcDoUG8aBXx/hWxb7lirqD+3eQ5ejds+PrmGmIfsN1GBG4UW9KifzR
 lffHTyMiiP4VR3S34ug6vgiqgF06ch+h0O3sLiSdBcgjo=

This patch series contains a wild mix of cleanups. Most of them
remove unused parts. But there are also improvements to better
understand the code. Finally the testing instructions are
updated.

The series has been tested with a Raspberry Pi 3 B Plus.

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

 .../staging/vc04_services/interface/TESTING   |  45 +++-
 .../interface/vchiq_arm/vchiq_arm.c           | 254 ++++++++----------
 .../interface/vchiq_arm/vchiq_arm.h           |   3 -
 .../interface/vchiq_arm/vchiq_core.c          |  10 +-
 .../interface/vchiq_arm/vchiq_core.h          |   6 -
 5 files changed, 167 insertions(+), 151 deletions(-)

=2D-
2.34.1

