Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B59270569
	for <linux-staging@lists.linux.dev>; Sat,  8 Nov 2025 04:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762577669; cv=none; b=gfTDEUNnenHfqB+LPdyn6ZTO1nMCp8RLMics56SiJIdVHEpymer1oUda7lyQQPD8inruPGFyt8isjKdRld22MfgppwNRIU8KqsWhdRuLPwnxtmN7G4T+PqBtWMX7uKdsdqZfT7KnR62eErBs4+Ox4ClQW1is6Jkio2ydtrtRf18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762577669; c=relaxed/simple;
	bh=FJ0z1Pw91C1KXDxkISNCpi29zWmCs/T2mvQmzcQzaNE=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=BAjjscJQj5fjZYrOg04BuE3oqQtjPhJK9cc/cwqMQ747IN8rq+i69CZEVhxEaaMRd8DwfP0s/UDWvr6AUaPLJzF3fVOElroqTUTqfDiwO+xNQ0HFZCzzUMS4xO45mV49cerX3gGvIMYqhOf0mcBCt0/+1ZsZDgApWDUmvtsIETM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=JC8lJpqV; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="JC8lJpqV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1762577658; x=1762836858;
	bh=WOoEZbPGGZXaVMi7xthSdL2YB8sqg8DisbydO2JNEoA=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=JC8lJpqVQvINvHFAhLvDtCS0IS41ay98Jqim4fX6QyW48+YF8HwFJYsu3wKw+hfnh
	 z9eOe2AHnNVKC8XhPxK9ye1lLve10om0s2VXPFe4Tk5AoDjesEvQFuQm7+uru3SGXq
	 myJ5q1iuAq/XaKNV33Lse4mm4UZoPFnZJlpHQqG++uNbj3NK463LU4vvDqpRu2uQlJ
	 axSi0ZIjQZEo+MiacRh6JkFZrCWffja1KqgtUO8PJsNzlldRoJ9tx+aC9lWZ9hdGAO
	 EBdw5neCMddA9ZuuFmF/AaXk8PnuB6A11p0M+kA+EXZzlmDmyM1frQYE5Me5a+dQ3j
	 buw81x48DcR6Q==
Date: Sat, 08 Nov 2025 04:54:13 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
From: Bryant Boatright <bryant.boatright@proton.me>
Subject: [PATCH 0/3] Checkpatch cleanup patches
Message-ID: <cover.1762576396.git.bryant.boatright@proton.me>
Feedback-ID: 74848953:user:proton
X-Pm-Message-ID: d0681662824020a91077f8cb6c632209707a9e75
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Correct camel case names reported by checkpatch.

These patches are not required to be applied in any order.

Bryant Boatright (3):
  staging: rtl8723bs: Rename camel case enumeration
  staging: rtl8723bs: Rename camel case argument
  staging: rtl8723bs: Rename camel case variiable

 .../staging/rtl8723bs/core/rtw_ieee80211.c    | 40 +++++++++----------
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  2 +-
 drivers/staging/rtl8723bs/include/ieee80211.h |  6 +--
 3 files changed, 24 insertions(+), 24 deletions(-)

--=20
2.43.0


