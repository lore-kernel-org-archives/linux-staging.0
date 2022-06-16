Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF2D7A
	for <linux-staging@lists.linux.dev>; Thu, 16 Jun 2022 10:20:32 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::228])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id D4483CE27C
	for <linux-staging@lists.linux.dev>; Thu, 16 Jun 2022 10:00:37 +0000 (UTC)
Received: (Authenticated sender: jacopo@jmondi.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 03C4E1BF209;
	Thu, 16 Jun 2022 10:00:28 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrea Merello <andrea.merello@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 0/2] staging: iio: imu: Add CEVA BNO08x through the staging tree
Date: Thu, 16 Jun 2022 12:00:04 +0200
Message-Id: <20220616100006.22045-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,
   this series adds support for the CEVA BNO08x Sensor Hub through the staging
tree.

The driver currently only support reading a rotation vector in quaternion, which
is just one of the many features supported by the device.

What's relevant here is the protocol handling part, which is used to exposed a
triggered buffer and direct access IIO interfaces. The BNO08x family implements
a packed-based protocol which requires parsing on the driver side. This driver
implements such parsing routine by copying the full received packets and
synchronize the possible multiple consumers which might want to access the data.

Sent through the staging tree as the HW platform I used to test is not available
anymore and I cannot guarantee maintainership of the driver.

However I hope the driver can serve as a useful reference for future
developments.

Thanks
  j

Jacopo Mondi (2):
  dt-bindings: staging: iio: imu: Document CEVA BNO08x
  staging: iio: imu: Add CEVA BNO08x driver

 .../bindings/staging/iio/imu/ceva,bno08x.yaml |  63 ++
 MAINTAINERS                                   |   7 +
 drivers/staging/iio/Kconfig                   |   1 +
 drivers/staging/iio/Makefile                  |   1 +
 drivers/staging/iio/imu/bno08x/Kconfig        |  11 +
 drivers/staging/iio/imu/bno08x/Makefile       |   3 +
 drivers/staging/iio/imu/bno08x/bno08x.c       | 618 ++++++++++++++++++
 7 files changed, 704 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/staging/iio/imu/ceva,bno08x.yaml
 create mode 100644 drivers/staging/iio/imu/bno08x/Kconfig
 create mode 100644 drivers/staging/iio/imu/bno08x/Makefile
 create mode 100644 drivers/staging/iio/imu/bno08x/bno08x.c

--
2.35.1

