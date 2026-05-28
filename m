Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBA52E718B
	for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 17:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779988015; cv=none; b=HSf0XNQ1TfhLR8f1stItXUydAMiNQFoFCRjY12WKB3jfQHr0NG/lNimSH9BqtFB/jsHdBhHENasy3+NHyUDhQyrAXqdE+KM+MZzdiXrx0/8uTpL0hXKtOOEbe4R7Y8ek3NL0oMlVuvESOwGuegraTHijHD6VKiLt/+jszUNrp3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779988015; c=relaxed/simple;
	bh=e2j2G7YdJq87qUkSOHhs8M7h7zEZHMfMQEz72BMd2+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FzrKJG15H1eHm1mJILb6GSfpcZw8RUPJ+SmAOAsJlEZtDluAULwhcmGTMTAG28nJi2Nb4NYSrZJITS3t5/ngVZPyV+OvvLghe415DInQbunls7Mh3EDP+I9AfzQiecIf3KjjwwFxgUgCuPF5X+JzfFl7g2JV7J1pWlzGBnI6LXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b=tC5x55YI; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b="tC5x55YI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779988006; x=1780592806; i=artur.ugnivenko@gmx.de;
	bh=4nAhlT9z1NjzeraGC5GbHD8PnBk+ZEr5sMSgeEVO0CA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=tC5x55YIogtmGrkc+IuLeJc10INBt20YKzkmPn4/FlAO9NhtO+GQf54Go7zZDDVq
	 VVHSj7zM7mYjo0KXynAT9oIWRfw7VPhFPEXvLTzJ5c+OPNiRM7UaEDNXBvALoGqcL
	 j2oX4f6s2E+/3gC7V2PHGIrOrc8+IoT1QH8v4efBCm3dV7nsEI7eTCW9tL5UMTeUu
	 av+s/CebOlYBhnlOV7gG5uffb51W/JeC2nrBlhImNqslklsh8MYVqfPAGRC4nnqty
	 BFM+kNJiBPcmepNwsqynt/4/uNozNo4C2rMEYQidv7Gub1UX21W4I/DV4a0LJ72tY
	 nexyHrlRZ48CzS7f/Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MSbxD-1wr1lH20xl-00Niac; Thu, 28
 May 2026 19:06:46 +0200
From: artur.ugnivenko@gmx.de
To: gregkh@linuxfoundation.org
Cc: ahmet@sezginduran.net,
	error27@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Artur Ugnivenko <artur.ugnivenko@gmx.de>
Subject: [PATCH v9 0/3] staging: rtl8723bs: fix several style issues in hal/sdio_halinit.c
Date: Thu, 28 May 2026 19:06:42 +0200
Message-ID: <20260528170645.30861-1-artur.ugnivenko@gmx.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/eMl8XQs9ngaCTCfzfvLZ+zGzNZbWzdZZYXRaEmOsSfDQI/a7LF
 pvKrXINdhurdY7xQVo/KdI9v3AeD/3Jz22GzhELCluJfBzmTMabAIHNPZwJ/67lLoyaBNjl
 RarWCtMU6IcydFwSYb35mRwDfN8pjc6DWlsnpTucIuzs9QGzF+cW6u6abU0pvCiEEyGcc21
 HUmTwGNpOM5eUm36C+kew==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nSZDyUGnfCI=;ujzNPbc+FyRZ76KSndeGLkZYGSv
 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

From: Artur Ugnivenko <artur.ugnivenko@gmx.de>

Fix the following checkpatch warnings in hal/sdio_halinit.c:
- lines longer than 100 chars
- inconsistent brackets around else statements
And refactor queue priority initialization in hal/sdio_halinit.c
to fix a "lines ending in parentheses" warning.

Changes in v9:
- don't declare variables in the middle of functions in 3/3
- remove unnecessary whitespace in 3/3
Changes in v8:
- Remove the struct from v7, use an array instead.
- Remove other "lines ending in parentheses" fixes to keep
  3/3 small
Changes in v7:
- Remove whitespace patch.
- Add transmit_queues struct to improve style of
  _InitNormalChipRegPriority
- Add changelog to individual patches.
Changes in v6: Make the patch series apply to gregkh/staging-testing.
Changes in v5: Added the entire changelog to the cover letter.
Changes in v4: Fixed the long line checkpatch warning in patch 2.
Changes in v3: Split the patch into multiple patches.
Changes in v2: Make the patch apply to gregkh/staging-testing.

Artur Ugnivenko (3):
  staging: rtl8723bs: shorten long lines in hal/sdio_halinit.c
  staging: rtl8723bs: fix inconsistent braces in hal/sdio_halinit.c
  staging: rtl8723bs: refactor queue priority initialization

 drivers/staging/rtl8723bs/hal/sdio_halinit.c  | 163 +++++++++++-------
 drivers/staging/rtl8723bs/include/drv_types.h |  10 ++
 2 files changed, 108 insertions(+), 65 deletions(-)

=2D-=20
2.54.0

