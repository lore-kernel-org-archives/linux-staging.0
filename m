Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51971C3E
	for <linux-staging@lists.linux.dev>; Thu, 27 Jul 2023 06:18:44 +0000 (UTC)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
	by pb-smtp21.pobox.com (Postfix) with ESMTP id 0F6E42B784;
	Thu, 27 Jul 2023 02:18:38 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=Yvn15xVBKFLe1lq98MntlOuwNH59SCtB5u5H8CyoTMw=; b=L4px
	ODKKX+S6y3RO9K59ED717BBA2M2CK+1kPFkHBy1sNtNrFhZbc7Hxk45nLrR7quG7
	mOiqId3Qx+f/zM7Z8H+qUDNPAGdJNqbhvIhvILELUIzEE0/NdtP+5vp++fYpG0My
	Lntq2yXexxAYtVCWBU7uj0rexi9D34EWhr4J8zg=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
	by pb-smtp21.pobox.com (Postfix) with ESMTP id 0739B2B783;
	Thu, 27 Jul 2023 02:18:38 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=darkphysics.net;
 h=from:to:cc:subject:date:message-id:mime-version:content-transfer-encoding;
 s=2019-09.pbsmtp; bh=2ohFWl8YPY7c/GpOcuJ8aS3uqIam4whGIQ6aWDJ0e6Q=;
 b=E5vKBV6b0/rj4RODwbMekzkjp57aNADGVrfA45ZACvtRjTK9RzZnqzs9jKPb6eQIcXXKZIJWihx9i9ym3xPEPo1prUrJmTS3KHgqL+ZNHr27RSTNPb0arKsWrJcmGK+RdQWsvLCVohYWRPYJXJy95vPUk43U/RWxuvMCWoIDbzc=
Received: from basil.darkphysics (unknown [76.146.178.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp21.pobox.com (Postfix) with ESMTPSA id AC5DB2B781;
	Thu, 27 Jul 2023 02:18:33 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca,
	error27@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 0/5] Staging: rtl8192e: Function name cleanup series 1
Date: Wed, 26 Jul 2023 23:19:43 -0700
Message-ID: <20230727061948.579480-1-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 6A07E38A-2C45-11EE-83FD-B31D44D1D7AA-45285927!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

Rename functions to fix checkpatch warning: Avoid CamelCase

Changelist:
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

