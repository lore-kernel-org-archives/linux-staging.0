Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B4C325494;
	Sat,  8 Aug 2026 15:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786203139; cv=none; b=YUZHbRkt/USsPyKQ9TCnGMAtxUsCWAdOk1hcn8EzClnVg7xDDysMKaaMHxW89BDlxFk1TNiYQpaKN0q7Q9y/fVDicS4eAW8ryghxxiAQy2BSYsFuBjnA36rR0Q4KDj8/26hkS9GYL0/HhDqRr1qZLjLbfng5AYCVKHngwHrhdAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786203139; c=relaxed/simple;
	bh=ncDojDBOOL8u7/aqpDMCcLEHXZf9LmlfOEFoh9yUkc0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WsOtGGw1coiDoWu5KwJKzCuSfbq5ElUfSv6j6ZdjMnbdzDBeDBGWYhrCXs97sI+s5tgoIsH68/nl36pL93qmbkyxGSCwUy1ZZ8Cwd73eoKCAveFIjLH/hCcGTGBZOLxrI4YxAAdreykAgJEEvrhLWlLBqLgNCcXJruXein0/nr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LXocn/1Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LXocn/1Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D0C1F000E9;
	Sat,  8 Aug 2026 15:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786203137;
	bh=ZLOl2Aqp46ES+EAbHqGu5g9gLv6J62HHaK+ivBdRvM4=;
	h=Date:From:To:Cc:Subject;
	b=LXocn/1YMOUvlwljPy/OygFMJkspo+rqv1pauOgCyYJLopVFTs5FZVtf6vSQ4UrJd
	 YiPuMhXuF11dSyzYjmsR1gufP4wnktFx+aoDXlOKB40pGgcjz7jb8sdWUQ+2/oM46w
	 tSCuqcj1Dg/uYpE6Ud0BcfJrjBvWGaLqEDqNEb5s=
Date: Sat, 8 Aug 2026 17:31:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [GIT PULL] Staging driver fixes for 7.2-rc7
Message-ID: <andL7yDYZhWQIn9z@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit f5098b6bae761e346ebcd9da7f95622c04733cff:

  Linux 7.2-rc5 (2026-07-26 14:45:48 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.2-rc7

for you to fetch changes up to 6829665d050983907b560173e49dcc6c11cb2730:

  staging: rtl8723bs: validate monitor transmit frame lengths (2026-07-28 09:44:42 +0200)

----------------------------------------------------------------
Staging driver fixes for 7.2-rc7

Here are some more small staging driver fixes, just for the rtl8723bs
driver, for some reported problems found with it now that people are
starting to actually test the thing with "bad" networks.

Nothing major, but good to have in the -final release.  All of these
have been in linux-next for over a week with no reported problems.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Mariano Baragiola (1):
      staging: rtl8723bs: validate monitor transmit frame lengths

Muhammad Bilal (2):
      staging: rtl8723bs: fix OOB read in rtw_get_wpa_ie()
      staging: rtl8723bs: fix OOB read in WMM_param_handler()

Panagiotis Petrakopoulos (1):
      staging: rtl8723bs: fix missing shared-key auth challenge length check

 drivers/staging/rtl8723bs/core/rtw_ieee80211.c    | 3 +++
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     | 2 +-
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c    | 3 +++
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 4 ++++
 4 files changed, 11 insertions(+), 1 deletion(-)
