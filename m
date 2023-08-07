Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED37136A
	for <linux-staging@lists.linux.dev>; Mon,  7 Aug 2023 05:48:16 +0000 (UTC)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
	by pb-smtp1.pobox.com (Postfix) with ESMTP id 008BE1A0BD4;
	Mon,  7 Aug 2023 01:45:49 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=UinChLaUXH1xK11hEJ+w7bYhyWb0ufAj4sr25zSbsME=; b=ZY4x
	H63Gd1fm7y3CEuO3d4QIDqripJTN9ysdGaUmjTYE0I+wBLFqZP4AWNqu9IhJt5ij
	ahu2Ikh1y0FBWNcM8xVP1l2zjfkL97y/4+EDBwOhzUHSCgvyzsC8rY4hmAt5VNZs
	+JLh4razpdvwfoB/9rlo0xyGjxBfSIHnFaeOhL8=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp1.pobox.com (Postfix) with ESMTP id DD0791A0BD2;
	Mon,  7 Aug 2023 01:45:48 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=darkphysics.net;
 h=from:to:cc:subject:date:message-id:mime-version:content-transfer-encoding;
 s=2019-09.pbsmtp; bh=98BUAZNgwnh1QBNdyw4hD6dVgs5FtbjzJUITJr09lkc=;
 b=ZNWfiJxHdhU/0xsO7uHidRsgr+wd3JFtQEnUXC+G/Wy8R3Bs97cZFmLKkIa3O01PmvL19Xty9DAPIauzvnDm4xRBJvSmwT9E3J43dZwuJq+Og+EZC+ldFTe7vInbMVyrSBLw7QqQUZKYaf5LoSih+TJTrHKKVbe/FA2OJDmWnjw=
Received: from basil.darkphysics (unknown [76.146.178.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 61A741A0BD0;
	Mon,  7 Aug 2023 01:45:47 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca,
	error27@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 0/5] Staging: rtl8192e: Function name cleanup series 2
Date: Sun,  6 Aug 2023 22:47:27 -0700
Message-ID: <20230807054732.1864827-1-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 A8F0DB94-34E5-11EE-89BD-C65BE52EC81B-45285927!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

This patch series renames functions to avoid checkpatch warning:=20
Avoid CamelCase.

Thank you in advance to the reviewers.
~ Tree

Tree Davies (5):
  Staging: rtl8192e: Rename function TsInitAddBA
  Staging: rtl8192e: Rename function TsInitDelBA
  Staging: rtl8192e: Rename function BaSetupTimeOut
  Staging: rtl8192e: Rename function TxBaInactTimeout
  Staging: rtl8192e: Rename function RxBaInactTimeout

 drivers/staging/rtl8192e/rtl819x_BAProc.c | 16 ++++++++--------
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 10 +++++-----
 drivers/staging/rtl8192e/rtllib.h         | 16 ++++++++--------
 3 files changed, 21 insertions(+), 21 deletions(-)

--=20
2.41.0

