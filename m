Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2056D38C427;
	Sun, 12 Jul 2026 08:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783845906; cv=none; b=fGycQXGsK79bLfrflbOkOSBaDL4bqCmGT7rQZcvwB5k6/xD5oIYbgx9jv23W084mCpLdGbOoMQE5hitdMCdnPUrQsGZMv41W3PZa21NyRP2MmA4RZL5UF95UW3iSeKGLZPlU2zkrEJvycOznXnIUZAGZs36/6LeQ1TNXv5SG0K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783845906; c=relaxed/simple;
	bh=oRFYWeI3MzXRTespVPh/V3xgylkQ11i3ooo0qMDbM00=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a4pfYBsmqujICKgsw/wre+o2bFxIYtrI4fRT7Xa5VYyPWzm7IYtsfErmp2T7CPoLnjrYdc/yhzPCqh+3rEBejd7Zvnl/LrGYMPVDQ4WcpZaX8w6WruKSxr+CTNCjrGLinho5WedN6DOhj6epJkA54z9DtzutAL0gg5XhPkVM+UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=URvhaFEt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="URvhaFEt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34EA91F000E9;
	Sun, 12 Jul 2026 08:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783845904;
	bh=eJW8iGTd/xEcysiWjOm0SuUcZHZpq3hljqrLLrbMErs=;
	h=Date:From:To:Cc:Subject;
	b=URvhaFEtk0WO0VQGZFjS9/XlCqECKHO0ogNffufYcoyntR2GzZxWv+CJAxCurKxQ1
	 wOIzw7v8KqYrrfTCTi5oMs1uugknDEkW6lPut1rO3fcdav3IwiHuCQ7NJK+jKOvGch
	 EL+u2CZIDLAC878fMyQ5nMaF5WUTFGccD6NeA22Y=
Date: Sun, 12 Jul 2026 10:44:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [GIT PULL] Staging driver fixes for 7.2-rc3
Message-ID: <alNUCxosMgwZ2XQO@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 8cdeaa50eae8dad34885515f62559ee83e7e8dda:

  Linux 7.2-rc2 (2026-07-05 14:44:06 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.2-rc3

for you to fetch changes up to 1463ca3ec6601cbb097d8d87dbf5dcf1cb86a344:

  staging: rtl8723bs: fix OOB reads in rtw_get_sec_ie(), rtw_get_wapi_ie(), and rtw_get_wps_attr() (2026-07-07 13:43:27 +0200)

----------------------------------------------------------------
Staging driver fixes for 7.2-rc3

Here are some staging driver fixes for 7.2-rc3 for some reported bugs in
the vme_user and rtl8723bs drivers.  These include:
  - many rtl8723bs OOB fixes for when connecting to "bad" wifi hosts
  - vme_user bugfixes to correctly validate some user-provided data

All of these have been in linux-next for a while with no reported
issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Alexandru Hossu (8):
      staging: rtl8723bs: fix WEP length underflow and OOB read in OnAuth()
      staging: rtl8723bs: fix OOB read in update_beacon_info() IE loop
      staging: rtl8723bs: fix OOB reads in IE loops in issue_assocreq() and join_cmd_hdl()
      staging: rtl8723bs: fix heap buffer overflow in rtw_cfg80211_set_wpa_ie()
      staging: rtl8723bs: fix OOB write in HT_caps_handler()
      staging: rtl8723bs: fix OOB read in OnAssocRsp() IE loop
      staging: rtl8723bs: fix OOB reads in is_ap_in_tkip() IE loop
      staging: rtl8723bs: fix OOB reads in rtw_get_sec_ie(), rtw_get_wapi_ie(), and rtw_get_wps_attr()

Christopher Mackle (1):
      staging: rtl8723bs: don't drop short TX frames in _rtw_pktfile_read()

Hao-Qun Huang (2):
      staging: vme_user: fix location monitor leak in fake bridge
      staging: vme_user: fix location monitor leak in tsi148 bridge

Michael Tautschnig (1):
      staging: vme_user: bound slave read/write to the kern_buf size

 drivers/staging/rtl8723bs/core/rtw_ieee80211.c    | 15 +++++++++++++++
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     | 20 +++++++++++++++++++-
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c    | 23 ++++++++++++++++++-----
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  8 ++++++++
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c     |  6 ++++--
 drivers/staging/vme_user/vme_fake.c               |  8 ++++++++
 drivers/staging/vme_user/vme_tsi148.c             |  8 ++++++++
 drivers/staging/vme_user/vme_user.c               | 22 ++++++++++++++++++++++
 8 files changed, 102 insertions(+), 8 deletions(-)
