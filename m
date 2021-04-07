Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1EE6D13
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 10:23:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4EC00613A9;
	Wed,  7 Apr 2021 10:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617791030;
	bh=34TodTLk/VIckWwu+MXMhXACn6D2SHx7dl/QxJWtCh4=;
	h=From:To:Cc:Subject:Date:From;
	b=j3aUX0a2jRPk8uuSvr0bQAHZxKj43BMUM1/GCPNzXg9gD6wLgCVFByb5/A3oiBlsP
	 YDuKh7eUXwAuZ6Gbu9U6YqadfasICaTsuDx89OtcH5tA2Hh/1xVWv3LOBfATGJomLJ
	 v1iy3J3AnHaFO3ogEzmGvH19l8XXCPA5E1lrIoPyN7Oinl9wZxXOU7z3HUieBgO2SV
	 RYr4p3QALLm1TRcb8whe8jHFW0kIny7SnPJlPB8bQsMdVNuN+xHrFqL8b030ja7DQ7
	 HJnc1n2zWZLQEr+80x38NcnTRkmR6zEFQ0mLqmtcGqp5dWrPeUEZwgHKI8EhYAd/n1
	 k0T3huxrFE74Q==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
	(envelope-from <johan@kernel.org>)
	id 1lU5La-0008Qz-Il; Wed, 07 Apr 2021 12:23:42 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	linux-staging@lists.linux.dev,
	greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 00/16] tty: TIOCSSERIAL fixes and clean ups
Date: Wed,  7 Apr 2021 12:23:18 +0200
Message-Id: <20210407102334.32361-1-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TIOCSSERIAL is a horrid, underspecified, legacy interface which for most
serial devices is only useful for setting the close_delay and
closing_wait parameters.

This series fixes up the various ways in which driver authors have
gotten the implementation wrong over the years, like, for example,
jiffies conversions, permissions checks and error handling.

The de-facto standard for error handling is to ignore any unsupported
features and immutable parameters (cf. UPF_FIXED_PORT and deprecated
ASYNC flags).

Permission checking should prevent an unprivileged user from changing
anything but the ASYNC_USR flags (and custom divisor) by returning
-EPERM.

These patches are against tty-next, but the staging ones could otherwise
go through either tree.

I'll be sending the corresponding USB fixes separately.

Johan



Johan Hovold (16):
  staging: fwserial: fix TIOCSSERIAL jiffies conversions
  staging: fwserial: fix TIOCSSERIAL permission check
  staging: fwserial: fix TIOCSSERIAL implementation
  staging: fwserial: fix TIOCGSERIAL implementation
  staging: greybus: uart: fix TIOCSSERIAL jiffies conversions
  staging: greybus: uart: fix unprivileged TIOCCSERIAL
  staging: greybus: uart: clean up TIOCGSERIAL
  tty: amiserial: fix TIOCSSERIAL permission check
  tty: amiserial: add missing TIOCSSERIAL jiffies conversions
  tty: moxa: fix TIOCSSERIAL jiffies conversions
  tty: moxa: fix TIOCSSERIAL permission check
  tty: moxa: fix TIOCSSERIAL implementation
  tty: mxser: fix TIOCSSERIAL jiffies conversions
  tty: mxser: fix TIOCSSERIAL permission check
  pcmcia: synclink_cs: drop redundant tty-port initialisation
  tty: synclink_gt: drop redundant tty-port initialisation

 drivers/char/pcmcia/synclink_cs.c   |  2 --
 drivers/staging/fwserial/fwserial.c | 19 +++++++++---------
 drivers/staging/greybus/uart.c      | 16 +++++++--------
 drivers/tty/amiserial.c             | 25 +++++++++++++++++------
 drivers/tty/moxa.c                  | 21 +++++++++----------
 drivers/tty/mxser.c                 | 31 ++++++++++++++++++++---------
 drivers/tty/synclink_gt.c           |  2 --
 7 files changed, 68 insertions(+), 48 deletions(-)

-- 
2.26.3

