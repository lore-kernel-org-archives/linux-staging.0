Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D4E206944
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 11:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729077329; cv=none; b=YAkGmgOKs2fqZ44jaDE/WDOwQo4PG3ozD2FJNWI+/uSp7kN9txHs8Quo/YTDyJ4F1tHUJzmvrB1DXb+3tlXv9sKTDD/P6yFtzjk6aBiG0lpqecueEDxPGj2jKcjGl61desDIvkHgX/gHqS/stmA89qcmvoBIVNxYuHU/LCtFgVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729077329; c=relaxed/simple;
	bh=DEHSGwi9A3GIknJBjSkmfh89kVEe0AAscdiM/zazNF4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cS7JNazO5NGpbRoUL9D+1SW1nIOdszDWIukwxo/eCig5NNVS2+oW8R54ru8ungMYKm8YiTlbyWytkBm6UZrXfV9PCtUPvrf97maQQuq0InqPD2qnrdvLf5EnO2YOTiSbrTk+2QZy1pU+f4aJMNPEJOhYZ92o+hwjO+YmB50mprw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nva4WOeD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nva4WOeD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3E38C4CEC5;
	Wed, 16 Oct 2024 11:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729077329;
	bh=DEHSGwi9A3GIknJBjSkmfh89kVEe0AAscdiM/zazNF4=;
	h=From:To:Cc:Subject:Date:From;
	b=nva4WOeDFTSMewuZ+7gOF8pDzAru22rty/AXmhp9dZLXp2dGwLnk8cPowvAYLpjSc
	 lJQmHkIdW1+P1pnjZig3ccv4Rbnifqh2CB0etUP2IoCF+EIaMUnneMfTqg68Pgdx+9
	 dzO1kFNrPiipBnsFy9PIani79cRuHtGKANnTm/PppD24O4xI4/5QEhp4Rg1rcImkgN
	 GCrFpIOHfs66l+5wm4T4mM7p7ISAPZ+SjEjGK5GdSbIiwgMpd1MXscz+SW6bUkoi85
	 xOHHoSmIM0pdM3s1GL4sw1SbeptnizlvJeyf6tI0NQwYtDR2fjVy+Jr86+TozI8afz
	 b8ypSD1/P3yuw==
From: Arnd Bergmann <arnd@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Penkler <dpenkler@gmail.com>
Cc: linux-staging@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 0/7] staging: gpib: randconfig build fixes
Date: Wed, 16 Oct 2024 11:15:14 +0000
Message-Id: <20241016111521.1143191-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The newly added drivers added a few build failures on my randconfig
setup. Some of these only happen with extra warnings enabled, or with
the pending series to allow CONFIG_HAS_IOPORT to be disabled.

	Arnd

Arnd Bergmann (7):
  staging: gpib: add module descriptions
  staging: gpib: avoid unused const variables
  staging: gpib: pc2: avoid calling undefined dma_free()
  staging: gpib: make port I/O code conditional
  staging: gpib: add bus specific Kconfig dependencies
  staging: gpib: use proper format string in request_module
  staging: gpib: cb7210: select NEC7210 library

 drivers/staging/gpib/Kconfig                  | 18 ++++++++-
 .../gpib/agilent_82350b/agilent_82350b.c      |  1 +
 .../gpib/agilent_82357a/agilent_82357a.c      |  1 +
 drivers/staging/gpib/cb7210/cb7210.c          |  1 +
 drivers/staging/gpib/cec/cec_gpib.c           |  1 +
 drivers/staging/gpib/common/gpib_os.c         |  9 +++--
 drivers/staging/gpib/eastwood/fluke_gpib.c    |  1 +
 drivers/staging/gpib/eastwood/fluke_gpib.h    |  8 ++--
 drivers/staging/gpib/gpio/gpib_bitbang.c      |  1 +
 drivers/staging/gpib/hp_82335/hp82335.c       |  1 +
 .../staging/gpib/include/nec7210_registers.h  |  6 +--
 drivers/staging/gpib/include/tms9914.h        |  4 +-
 .../staging/gpib/include/tnt4882_registers.h  |  4 +-
 drivers/staging/gpib/ines/ines.h              |  3 --
 drivers/staging/gpib/ines/ines_gpib.c         |  7 +++-
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        |  1 +
 drivers/staging/gpib/nec7210/nec7210.c        | 39 ++++++++++---------
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c     |  1 +
 drivers/staging/gpib/pc2/pc2_gpib.c           |  5 +++
 drivers/staging/gpib/tms9914/tms9914.c        |  6 +--
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c   |  4 +-
 drivers/staging/gpib/uapi/gpib_user.h         | 20 +++++-----
 22 files changed, 93 insertions(+), 49 deletions(-)

-- 
2.39.5

