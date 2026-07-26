Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FF826159E;
	Sun, 26 Jul 2026 13:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785070915; cv=none; b=AetklR3VGcrQ2Ey7+8x5+kkDIHh5j6WQkLIUNS1eGFn557FCAcCaRGfrxg0nCL7vRXsUP4/XQiNJkh4Ta9ZMRpxHklaYfy7GHEWyfI4TNCKcHjjFkgfmnuMizSdWMeCYFsmRGvLYfCxxXOA/lDJBDh6CO1tP//jhweBGhnEM3rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785070915; c=relaxed/simple;
	bh=eHJf2T/XJh6dQn213P9hvfRoduNLeHpyQDvU1oEVri0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VcRgHWih7o4se4lEWiCSkjeF1ZdKKI/bk+1ipfyxHubrg8imUKrgYgZeuFOKfRfS4TQKCClTMgFerAsDCQWF2UJEgD5yd1RCxmBXEofWjtqtijnS+SAtsNn5kWsA4IFCYE3QH1r3EMJLoAC4/eXRq+LHEb/bM5XqQtx6oNVH4jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bPvJ9uXl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bPvJ9uXl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C2F81F000E9;
	Sun, 26 Jul 2026 13:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785070913;
	bh=yrjpEjZAN0g4EMeGsi3SeZa+h/eNAIYdVJ+vo9CZJiA=;
	h=Date:From:To:Cc:Subject;
	b=bPvJ9uXladthT528/ujkpABAqurBUVV9uMPw8oaP3be2rx/pOYUyNVZSN2L+9BvDc
	 vhA/rHglCf4L/xQStWN724QznV4HM3NEk2QjFPIbtUQbozpc6WQb9nhmn5JAXcR7mu
	 7g4hm+a8ObGt8mxqfaHCTz1olzB0H2mKIG6jswIA=
Date: Sun, 26 Jul 2026 15:01:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [GIT PULL] Staging driver fixes for 7.2-rc5
Message-ID: <amYFNRZ3HEN_acG5@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit a13c140cc289c0b7b3770bce5b3ad42ab35074aa:

  Linux 7.2-rc3 (2026-07-12 14:16:39 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.2-rc5

for you to fetch changes up to 0e95ff792ae0aa6fbad9455943e9e1e4062670e9:

  staging: rtl8723bs: fix OOB reads in rtw_get_wps_ie() (2026-07-17 14:23:13 +0200)

----------------------------------------------------------------
Staging driver fixes for 7.2-rc5

Here are two small staging driver fixes for 7.2-rc5.  They both resolve
some reported bugs in the rtl8723bs staging driver and have been in
linux-next for over a week with no reported issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
MinJea Kim (1):
      staging: rtl8723bs: fix inverted HT40 secondary channel offset

Moksh Panicker (1):
      staging: rtl8723bs: fix OOB reads in rtw_get_wps_ie()

 drivers/staging/rtl8723bs/core/rtw_ieee80211.c    | 9 ++++++++-
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
 2 files changed, 9 insertions(+), 2 deletions(-)
