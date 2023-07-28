Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5C5AD57
	for <linux-staging@lists.linux.dev>; Fri, 28 Jul 2023 06:18:09 +0000 (UTC)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
	by pb-smtp1.pobox.com (Postfix) with ESMTP id 4ED0C1A8D0A;
	Fri, 28 Jul 2023 02:18:08 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=fKEpd+eGjrM67ezGtmXQn9pwwlfJskaOQfpzU8QSZA0=; b=DCuc
	BFUzh+WbzCwcKpgsEMGxvwNnzjRqKF48SyPpfDfoXmDXCppdqRMK+fYuoPcv3RvM
	YjN9iEUufB6NXN17QHef0nRXrwcGM5l8w1ItulY+f1cY+JsPKzXAZSGLUaZ5KT6g
	+pYEx4I0BIWViUq8nk4JIyC+hiKqrPVcZMbJ3uY=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp1.pobox.com (Postfix) with ESMTP id 417DA1A8D09;
	Fri, 28 Jul 2023 02:18:08 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=darkphysics.net;
 h=from:to:cc:subject:date:message-id:mime-version:content-transfer-encoding;
 s=2019-09.pbsmtp; bh=Fqmo4pPl09EgKH4K9DqTKoHP9GtV8QIg3pdG40LpXgs=;
 b=LV8RHqY21GNFDdbTbrxAPBpHlgRGdRrXIhb7ErRulU5enh3hhSahKa5hiTkwS5M+eZXD3/mYGRI1W9pKhPruup83Q2RAKB2nx7kHzI6LQ1V1AA8JT/UaYS7XG2cSKU7VSjkDt6UMd3Hq0/M0FzDtpyZwZVNxowvSkYoggSeNDw8=
Received: from basil.darkphysics (unknown [76.146.178.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 000E91A8D07;
	Fri, 28 Jul 2023 02:18:06 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca,
	error27@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v4 0/5] Staging: rtl8192e: Function name cleanup series 1
Date: Thu, 27 Jul 2023 23:19:25 -0700
Message-ID: <20230728061930.624540-1-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 84CB791A-2D0E-11EE-BCC2-C65BE52EC81B-45285927!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

Rename functions to fix checkpatch warning: Avoid CamelCase


Changelist:
v4: Resending. git send-email failed to send patch #5.
v3: Changed patch #5, Rename global function ResetBaEntry to rtllib_reset=
_ba_entry
v2: Sent to mailing list via git send-email, patches are the same.

Tree Davies (5):
  Staging: rtl8192e: Rename function ActivateBAEntry
  Staging: rtl8192e: Rename function DeActivateBAEntry
  Staging: rtl8192e: Rename function TxTsDeleteBA
  Staging: rtl8192e: Rename function RxTsDeleteBA
  Staging: rtl8192e: Rename function ResetBaEntry

 drivers/staging/rtl8192e/rtl819x_BAProc.c | 44 +++++++++++------------
 drivers/staging/rtl8192e/rtl819x_TSProc.c |  6 ++--
 drivers/staging/rtl8192e/rtllib.h         |  2 +-
 3 files changed, 26 insertions(+), 26 deletions(-)

--=20
2.41.0

