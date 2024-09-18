Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FF04D8DA
	for <linux-staging@lists.linux.dev>; Wed, 18 Sep 2024 16:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726677102; cv=none; b=uVGbsZAPQM6BMkb2vDRp52jeOu39MbNNu+PpR8iQ/GFjyekJoRMXm5x9xqBIoqIyebIo4hkaNwcp2xIMrxzilf/Le+fZA0cczyLvhOkvR9FyYDA9ahVT48tWEhRq9mayKCIzpqa3/y09wYQQt2z0203bhA8xqnJIxs8i99cgmyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726677102; c=relaxed/simple;
	bh=1hYrEkoTY13iEEB+Ygb3JKE62cGhuUL80x7DC7WMJJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k+krI0DPvO3risBp7ltuVe5ZCO+XN6rkCjb7jigQyWl7d8DSdgsYXbGSZ2rCQfrer9Lq7y/oF0fshfFLI1Vgxnl3KSCmuSsljQKb3zUtU5CQEAysZKwiFFYuYPZmsLz7VshjqYCcPx2UIgy3QxWr5oWgL4PeiL4EJ6/k9s31uU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UwyHxoSR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UwyHxoSR"
Received: from umang.jain (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 534ACD52;
	Wed, 18 Sep 2024 18:30:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726677009;
	bh=1hYrEkoTY13iEEB+Ygb3JKE62cGhuUL80x7DC7WMJJ0=;
	h=From:To:Cc:Subject:Date:From;
	b=UwyHxoSRaXcjblu+MvqINvKJlASxHSrr6fRsUGZFGFy9pBJ4yEOycoEot0qwpT878
	 b9wo8iiU1reywdc/EBLkrUFSMfHKsOcDgJ2CJoX2rzhwKjbRHgojgl+7ILhAhOAT57
	 q7rQWmEPKCnS7hXFrH8AQcHfDlSNVv7IZL/t1L08=
From: Umang Jain <umang.jain@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Stefan Wahren <wahrenst@gmx.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 0/6] staging: vchiq_core: bulk xfer killable() completions
Date: Wed, 18 Sep 2024 22:00:54 +0530
Message-ID: <20240918163100.870596-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series intends to fix the variations of events completions
on bulk transfers and message queuing code paths.

Patch 1/6 explains in details how we ended up having
wait_for_completion_interruptible() in vchiq_core.
A high level sequence of commit changes is explained in the
commit message. Each commit/link mentioned is referenced in
the commit message, to provide adequate context to the reviewer.

Patch 2/6 makes sure we acknowledge and return all errors on
queue_message(), instead of just -EAGAIN.

Patch 3/6 and 4/6 align the return values on interruption,
according to what kernel's mutex_killable() and
wait_for_completion_killable() would return (i.e. -EINTR)

Patch 5/6 and 6/6 drops the retry loop on -EINTR.

Testing:
- Tested audio playback with bcm2835-audio (uses vchiq_queue_kernel_message())
- vchiq_test -p (ping test)
- vchiq_test -f 10 (functional test)
- vchiq_test -b <size> (bulk test)

No regressions observed.

Umang Jain (6):
  staging: vchiq_core: Use killable wait completions for bulk transfers
  staging: vchiq_core: Return on all errors from queue_message()
  staging: vchiq_core: Return -EINTR in queue_message() on interrupt
  staging: vchiq_core: Return -EINTR when bulk transfers are interrupted
  staging: vchiq_arm: Do not retry bulk transfers on -EINTR
  staging: vchiq_core: Drop retry loop on -EINTR

 .../interface/vchiq_arm/vchiq_arm.c           |  81 +++++---------
 .../interface/vchiq_arm/vchiq_core.c          | 105 ++++++++----------
 .../interface/vchiq_arm/vchiq_core.h          |  18 +--
 .../interface/vchiq_arm/vchiq_dev.c           |  14 +--
 4 files changed, 89 insertions(+), 129 deletions(-)

-- 
2.45.2

