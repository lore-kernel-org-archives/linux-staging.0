Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A046D2FB0
	for <linux-staging@lists.linux.dev>; Sat, 14 Aug 2021 16:50:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A87CD60FC1;
	Sat, 14 Aug 2021 16:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1628959850;
	bh=iiuMofXzRk6v81QnjzS89U7OMiEid8a03rKgMEXE3SU=;
	h=Date:From:To:Cc:Subject:From;
	b=pwkbJyyfYCt5FauavwpFMY9380wHxURzWRZFGPGTLRPID6gRDhYUWpSIutD3bTP1Y
	 zW2YO2EqBpPuQQkeHY9+4Zm/OxsSfrM2gkyqeKtxYXXZ/X9LRCih1it9KMdQQStl9N
	 RKTvmvTRAh4RcA4byHZzBtVHKW1jDXrUXmjM53Mg=
Date: Sat, 14 Aug 2021 18:50:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [GIT PULL] IIO driver fixes for 5.14-rc6
Message-ID: <YRf0Zwu0SySEe2g9@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 36a21d51725af2ce0700c6ebcb6b9594aac658a6:

  Linux 5.14-rc5 (2021-08-08 13:49:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-5.14-rc6

for you to fetch changes up to a5056c0bc24f6c9982cfe6f4e3301f3c7d682191:

  Merge tag 'iio-fixes-5.14a' of https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-linus (2021-08-10 08:54:36 +0200)

----------------------------------------------------------------
IIO fixes for 5.14-rc6

Here are some small IIO driver fixes for reported problems for 5.14-rc6
(no staging driver fixes at the moment).

All of them resolve reported issues and have been in linux-next all week
with no reported problems.  Full details are in the shortlog.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Antti Keränen (1):
      iio: adis: set GPIO reset pin direction

Arnd Bergmann (1):
      iio: accel: fxls8962af: fix i2c dependency

Chris Lesiak (1):
      iio: humidity: hdc100x: Add margin to the conversion time

Colin Ian King (1):
      iio: adc: Fix incorrect exit of for-loop

Greg Kroah-Hartman (1):
      Merge tag 'iio-fixes-5.14a' of https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-linus

Maxime Ripard (1):
      dt-bindings: iio: st: Remove wrong items length check

Sean Nyekjaer (1):
      iio: accel: fxls8962af: fix potential use of uninitialized symbol

Uwe Kleine-König (1):
      iio: adc: ti-ads7950: Ensure CS is deasserted after reading channels

 .../devicetree/bindings/iio/st,st-sensors.yaml     | 41 ----------------------
 drivers/iio/accel/Kconfig                          |  2 ++
 drivers/iio/accel/fxls8962af-core.c                |  2 +-
 drivers/iio/adc/palmas_gpadc.c                     |  4 +--
 drivers/iio/adc/ti-ads7950.c                       |  1 -
 drivers/iio/humidity/hdc100x.c                     |  6 ++--
 drivers/iio/imu/adis.c                             |  3 +-
 7 files changed, 10 insertions(+), 49 deletions(-)
