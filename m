Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668753D86
	for <linux-staging@lists.linux.dev>; Fri, 28 Jul 2023 05:46:24 +0000 (UTC)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
	by pb-smtp1.pobox.com (Postfix) with ESMTP id EFE631A8A0C;
	Fri, 28 Jul 2023 01:46:17 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=q11SRVXwa0wM9lcDGDLh7fBHJN2OYTsrZKvlSAWO/zM=; b=Wztn
	BE/nkw5qtzBJPAXKuKwrrurk1kUKCS6jQla/m3A9JT35wHPYBNlkQOLTkT0/sETH
	enzhdBQbDGWkPx+C1QMy8Fxx4dBGVV281yRrssx2YeQcBCy5t9N73GhQyG2DnWDg
	L6HF05wtNQpG36+Dr3EKlM3nFS8AjvqgZUDJqyI=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp1.pobox.com (Postfix) with ESMTP id E73211A8A0A;
	Fri, 28 Jul 2023 01:46:17 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=darkphysics.net;
 h=from:to:cc:subject:date:message-id:mime-version:content-transfer-encoding;
 s=2019-09.pbsmtp; bh=CND3Jd7DqXpD69M6Z0UDYDpgKPrBb+yd9Y/GaIvHI+g=;
 b=sLYFjwIQtoMepSREiCkLgbi4GBt217BvcVuUj5dzH5YMyMdcec+1fZO0J6FAo24z74ZVsstR2Qph4WkC0YZAfgljQDs8EAixeBlhywCUfKyOOqfNWnzSorZRRDYAkwgeKBJsBVwLWy9Lpo0czk8fcQaeq+K7bsNNuCm/WzEhCJY=
Received: from basil.darkphysics (unknown [76.146.178.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 99F3E1A8A09;
	Fri, 28 Jul 2023 01:46:16 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca,
	error27@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v3 0/5] Staging: rtl8192e: Function name cleanup series 1
Date: Thu, 27 Jul 2023 22:47:37 -0700
Message-ID: <20230728054742.622297-1-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 12224EE2-2D0A-11EE-B13D-C65BE52EC81B-45285927!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

Rename functions to fix checkpatch warning: Avoid CamelCase


Changelist:
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

