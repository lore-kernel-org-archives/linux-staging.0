Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFEF337105
	for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 16:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779726943; cv=none; b=A9c+5r1Jcb5A5rMVi8oHkMxJ7QNrZLVF820XukyE/X/aGS55IW2zGSzmNB043HKFEu0dfZabBdQODOnRCPuDR44YoxrzrsiDZIwskdsIZ2Bm3johI6RtY2HkTnoawR5tq6DIZzLfvq1cEjM5ab3nQnv3r51iTtYk5wvgHlrdBaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779726943; c=relaxed/simple;
	bh=5wl9YNXCcxQiVONFJ/oiB+49ZoDcryaRZP2xeh9BkAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q+pP/5DPVwwuK7vcafwbCYprElfb2W4ccemheB4SLj6H+0NwqqBSftxgv6anzNTz1UGueVmwJjDE9voDGpYU0Qest9SCzpRUzcmA98J88tKe6Imsv9C/FTNPhu3xC6gQSOm5ElyeLFx0END0Fk5IxFgS/8topbHbxdGG4Atlo6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b=JFqw7wC9; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b="JFqw7wC9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779726933; x=1780331733; i=artur.ugnivenko@gmx.de;
	bh=O5Jd5WxQ1O2FIlnAZ8+wEWmy5gKDbgWmTIQyXQTIGBk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=JFqw7wC997ISRi0kunQbzHPksHF1ZHMeEQEqBYSRyOK8tZk7TtCVFk+aS/GPWgVs
	 /w1/Y0HGQNwKo2rQHkGhLTF9kEAZ83uvfuXdjqerYqBG3YomuMyI05Q3XQlg61Hu7
	 UFxYRIPAAHkZQTWyT+bgjJahSkf80F3nkeufK0I5hJ/VmqJK1R+ttkdLrcDCpb/f4
	 RGu2ZYkX6eGlGgcV6DKZkNcXHpdY+sy+Y36VnCRdH5dC/znsaH0i0RxzhxCtR2Ekx
	 gphik/2Z4atCamVLaGK6Rr2zCjkNuOYyL07JaO3QFCcNf/bpGC8qx9nbeOJvVw4YZ
	 GdxCgMzhblN+DoyN5A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKKZ3-1wl08Y2O47-00P9VT; Mon, 25
 May 2026 18:35:33 +0200
From: artur.ugnivenko@gmx.de
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	ahmet@sezginduran.net,
	error27@gmail.com,
	Artur Ugnivenko <artur.ugnivenko@gmx.de>
Subject: [PATCH v8 0/3] staging: rtl8723bs: fix several style issues in hal/sdio_halinit.c
Date: Mon, 25 May 2026 18:35:29 +0200
Message-ID: <20260525163532.20317-1-artur.ugnivenko@gmx.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EzuC3dOLCTtMb12Gph+8VfMESJstIb2ZkoyKzhjnkKffeMCf8nA
 Pyh2UsBiX9m3WYEnUXlUg9mOs8JNKOCklw4Ii6mHz/gYHHC48eIIw3kEti0w85oY+Ro7/fJ
 kYb335vUAYSXGyerrWo/wDnFajnoJkecD+X6drYJYjpZaNp3ia2fMBsbtBuABoB/uHwU1zG
 iiW2+spkkef5r+UwzgwlA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3czm5OU+dbE=;E5aop5ko80h3tQDha3WBbJTcrG8
 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

From: Artur Ugnivenko <artur.ugnivenko@gmx.de>

Fix the following checkpatch warnings in hal/sdio_halinit.c:
- lines longer than 100 chars
- inconsistent brackets around else statements
And refactor queue priority initialization in hal/sdio_halinit.c
to fix a "lines ending in parentheses" warning.

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

 drivers/staging/rtl8723bs/hal/sdio_halinit.c  | 166 +++++++++++-------
 drivers/staging/rtl8723bs/include/drv_types.h |  10 ++
 2 files changed, 111 insertions(+), 65 deletions(-)

=2D-=20
2.54.0

