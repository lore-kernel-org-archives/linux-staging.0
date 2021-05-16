Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D6B72
	for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 09:00:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 855546103E;
	Sun, 16 May 2021 09:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1621155622;
	bh=mBgTPkPp+wYI8t3PytcJ+CDiGxCy70thfYMLvJ2fTYg=;
	h=Date:From:To:Cc:Subject:From;
	b=0TFUEu1X6CzkF+cGAqu1uwtb5VQdZYjoIln5GBZ63X6R5w2jzIEwyqIIfRrbZXX/f
	 W+ILq7tAOl5aPpIaGunwGsSZCFC/Uy+nFMS1gPqXr+pUz2GzNU6UsQPBzV8k+s1U9V
	 +0Myh8d+R2+neN3LgZpnE54Ehi4Un3Lb7ErKh184=
Date: Sun, 16 May 2021 11:00:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: devel@linuxdriverproject.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [GIT PULL] Staging/IIO driver fixes for 5.13-rc2
Message-ID: <YKDfI+xY2SCpC4Ot@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-5.13-rc2

for you to fetch changes up to ba9c25d94dea1a57492a606a1f5dde70d2432583:

  Merge tag 'iio-fixes-5.13a' of https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-linus (2021-05-11 15:17:55 +0200)

----------------------------------------------------------------
Staging/IIO driver fixes for 5.13-rc2

Here are some small IIO driver fixes and one Staging driver fix for
5.13-rc2.

Nothing major, just some resolutions for reported problems:
	- gcc11 bogus warning fix for rtl8723bs
	- iio driver tiny fixes

All of these have been in linux-next for many days with no reported
issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Alexandru Ardelean (2):
      iio: hid-sensors: select IIO_TRIGGERED_BUFFER under HID_SENSOR_IIO_TRIGGER
      iio: core: return ENODEV if ioctl is unknown

Arnd Bergmann (1):
      staging: rtl8723bs: avoid bogus gcc warning

Colin Ian King (1):
      iio: tsl2583: Fix division by a zero lux_val

Dinghao Liu (2):
      iio: light: gp2ap002: Fix rumtime PM imbalance on error
      iio: proximity: pulsedlight: Fix rumtime PM imbalance on error

Dmitry Osipenko (1):
      iio: gyro: mpu3050: Fix reported temperature value

Greg Kroah-Hartman (1):
      Merge tag 'iio-fixes-5.13a' of https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-linus

Tomasz Duszynski (1):
      iio: core: fix ioctl handlers removal

 drivers/iio/accel/Kconfig                         |  1 -
 drivers/iio/common/hid-sensors/Kconfig            |  1 +
 drivers/iio/gyro/Kconfig                          |  1 -
 drivers/iio/gyro/mpu3050-core.c                   | 13 +++++++++++--
 drivers/iio/humidity/Kconfig                      |  1 -
 drivers/iio/industrialio-core.c                   |  9 +--------
 drivers/iio/light/Kconfig                         |  2 --
 drivers/iio/light/gp2ap002.c                      |  5 +++--
 drivers/iio/light/tsl2583.c                       |  8 ++++++++
 drivers/iio/magnetometer/Kconfig                  |  1 -
 drivers/iio/orientation/Kconfig                   |  2 --
 drivers/iio/pressure/Kconfig                      |  1 -
 drivers/iio/proximity/pulsedlight-lidar-lite-v2.c |  1 +
 drivers/iio/temperature/Kconfig                   |  1 -
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 23 +++++++++++++----------
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c    | 21 ++++++++++++---------
 16 files changed, 50 insertions(+), 41 deletions(-)
