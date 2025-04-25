Received: from mail.ptzai.id (mail.ptzai.id [103.126.10.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDF422F776
	for <linux-staging@lists.linux.dev>; Fri, 25 Apr 2025 07:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.126.10.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745567068; cv=none; b=SjD7uOkL2Hk9O/FWQWOgEUDMKVo5LTkgAhqectTBfhO7+US69CnS0OVGDpgi9uFNqDrRlSFfSmvx18pVJHR51ABsPRMZE/hbez9E9hVrlRW4WpbPOwaCY5bEim/GGkyZ90CtYOPZtX7ASRxaU+f6vfvfEtCHGIO5UxRK3EcnJZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745567068; c=relaxed/simple;
	bh=BRn69EM6y9i2MpcZhSIwUkQ3UFFOrjsi7Mp1x1QBGVQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dHdB9bncvffPtIx54Q2/ApSd9rtoKiYueFUhNr2XFOf90ql0LCMzcUtyvdUU5RBqtEdtIhOhQcjqjHd0a4GtaJcdYP+WHcaLauHjiYI66CUkfx5fgYvQuo49AiVnhHa0+rUnujqMxSKYA8UmT2N+Wh1uDI6xfZrMuXClJoiUmZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ptzai.id; spf=pass smtp.mailfrom=ptzai.id; dkim=pass (2048-bit key) header.d=ptzai.id header.i=@ptzai.id header.b=egpHiRXp; arc=none smtp.client-ip=103.126.10.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ptzai.id
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ptzai.id
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ptzai.id header.i=@ptzai.id header.b="egpHiRXp"
Received: from mail.ptzai.id (localhost.localdomain [127.0.0.1])
	by mail.ptzai.id (Postfix) with ESMTPS id 5C1A21068CE30
	for <linux-staging@lists.linux.dev>; Fri, 25 Apr 2025 13:56:21 +0700 (WIB)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.ptzai.id (Postfix) with ESMTP id 3325E10697889
	for <linux-staging@lists.linux.dev>; Fri, 25 Apr 2025 13:45:15 +0700 (WIB)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.ptzai.id 3325E10697889
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ptzai.id;
	s=E96DBB9A-8BDD-11EC-9732-6913AA4D48C7; t=1745563516;
	bh=BRn69EM6y9i2MpcZhSIwUkQ3UFFOrjsi7Mp1x1QBGVQ=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=egpHiRXpIUr/OXSYPBM1+JDG+x497nGsf1W3jSGS7XnOgTaNQ5sXGVCwBXGoHC+fM
	 +rs4Xjk4VFJ2TPoFxDvrjbOG30tqt1rSFStPIOJcFnzrPA+TmcM71mo3itNKLvlMeq
	 WfjCpBpxn8dlEqszyrizufxuTc7WtQ3OiMTK087P1PRF1US91RtkrTDel6bCoO7Nt/
	 2f8WfmB8sQJteZDEZYsjePadu1eX5yp3IO2T+HrenCn+Xttr24WlKcBBRFnyTH/FLr
	 LrQdWep+y/zik5StHkgKGiIONKdwypWpRBQi/2c7vO6VOktth+Ny390abdwMx+h/c3
	 QGb/JPV0eeEvw==
X-Virus-Scanned: amavisd-new at ptzai.id
Received: from mail.ptzai.id ([127.0.0.1])
	by localhost (mail.ptzai.id [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id CbTuTWtLC7QO for <linux-staging@lists.linux.dev>;
	Fri, 25 Apr 2025 13:45:15 +0700 (WIB)
Received: from a79-168-142-120.cpe.netcabo.pt (a79-168-142-120.cpe.netcabo.pt [79.168.142.120])
	by mail.ptzai.id (Postfix) with ESMTPSA id 7B6AE10697864
	for <linux-staging@lists.linux.dev>; Fri, 25 Apr 2025 13:45:13 +0700 (WIB)
Reply-To: adilkareemin@gmail.com
From: Investors Group UAE <syahrir@ptzai.id>
To: linux-staging@lists.linux.dev
Subject: Exclusive Funding Opportunity
Date: 25 Apr 2025 09:45:07 +0300
Message-ID: <20250425094507.6B82FC45D53863C4@ptzai.id>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Assalamu Alaikum linux-staging,

I hope you=E2=80=99re doing well. My name is Adil Kareem from Investors Gro=
up UAE. We work alongside private investors in the UAE to offer tailored fu=
nding solutions that help businesses like yours grow and thrive.

If you=E2=80=99re considering financing, I=E2=80=99d love to learn more abo=
ut your goals. Could you share:

The amount you=E2=80=99re seeking

Your preferred repayment timeline

I=E2=80=99ll then follow up with options best suited to your needs.

Looking forward to your response.

Warm regards,
Adil Kareem
Investors Group Representative
