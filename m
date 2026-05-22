Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D943A48DB
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 13:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456013; cv=none; b=crboVkTsIEFuZy2bvWyW2YLv/GEj5d1x+WQev1swvxUd8T7z8mu5ugOAogC/2LeRiM07opxP4Ps7SyeQQ1GRQaFz1DSJHhZmdNRXhgtTkIJ5/3iLDkjxkFg4y/SW1uEn4v/fIP2HMSN+sYneTbRE0/TYJwl44wN2hO2Grvy+c18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456013; c=relaxed/simple;
	bh=nzX50VNGRDRhOp6Idv71mBUg3eCa6/NH5xSg1T38WzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pgV2zQKV7INsechWoDuxkrVMM6Z3fIvje+xfTjELhwt/a2yo8PxtOH6sAwtt9CjybjSd2tTcW5hHvHnf3mAgj88SCVgnoFyIAqH0DDgrnqbf6+Lfnw6jOEAgvixZuYx2YbQP2zOdEAftlsakhDNHuZO6iKtykK8KhnDzqP2p5dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b=SInL3ro6; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b="SInL3ro6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779456002; x=1780060802; i=artur.ugnivenko@gmx.de;
	bh=khcB4Ep7dhMpKLgw0PAG//xitG0ieKgTnN0WQ597N2M=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=SInL3ro6+wdC8FVIP5Ne72eKPoTUaKbjwhI9hGdme7losHxvrgnM/Wf7yjNqInyJ
	 oC4buUQJ3V6VlsMtgSmy5s2EBjSQ6lKhltGHu774GfBwdY0PkYnXp27IcKMuyhdFO
	 vI6px08amkuGaJJZFemEQLz9z+09iySffwuB7j5TIs7K+bu87fhme8sgPeM9UWaJt
	 8KuUlMtmFaXy8dB16mqVvpFyRJqCis9xHGAUFGpfnhBTMUUlt76nGzyorjwfjcxDK
	 m/PlSs3p8pelsgAEtYLHmKMWopZXpO+frPfZOKvIofzqBgdvBX4ajo8qw3DKz7sow
	 0UVT/YkOKnFfUJa7KQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8QWG-1wLzww2PBI-002eUe; Fri, 22
 May 2026 15:20:02 +0200
From: artur.ugnivenko@gmx.de
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	ahmet@sezginduran.net,
	error27@gmail.com,
	Artur Ugnivenko <artur.ugnivenko@gmx.de>
Subject: [PATCH v7 0/3] staging: rtl8723bs: fix several style issues in hal/sdio_halinit.c
Date: Fri, 22 May 2026 15:19:58 +0200
Message-ID: <20260522132001.4771-1-artur.ugnivenko@gmx.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2t1My9Fnae59lpLu7a5fsSWK9201xp+ZVGM0i60Oj6xUOl/Lja0
 hxeIYdL/vGFn2O6UKxz26cynDjcUoUiupqHXkTp5WpViHVCQ3B98krUFfsmW1ASDEkPCSqa
 hmkSAiscg0w2duWxUtjoPLn5LWDEEPEJP09TRhGBjD8qS8ZuEMpMCxg+szz0NktU7/EfkF7
 DEL+8Z0OQgz/koZ1du6Qg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XMuc1NBpOTo=;VKO7BrQlEDbBHnzfZGMfAd4RL0T
 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
 Mhe/VQ==

From: Artur Ugnivenko <artur.ugnivenko@gmx.de>

Fix the following checkpatch warnings in hal/sdio_halinit.c:
- lines longer than 100 chars
- inconsistent brackets around else statements
- lines ending in parentheses

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
  staging: rtl8723bs: fix lines ending in parentheses in
    hal/sdio_halinit.c

 drivers/staging/rtl8723bs/hal/sdio_halinit.c  | 168 +++++++++++-------
 drivers/staging/rtl8723bs/include/drv_types.h |   9 +
 2 files changed, 109 insertions(+), 68 deletions(-)

=2D-=20
2.54.0

