Received: from mail.plaes.org (mail.plaes.org [188.166.43.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EF014884C
	for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 19:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.166.43.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771700849; cv=none; b=OmPz9pxyHi5DzQhkQMqekF+v0Ji1iCQkPQmgojEopHpfBSWzS+tUnJXx9tT0B80yCbCFXCcEn3E+1R8BpfHz8PDTtUptfqg2aPp1QnFNsYUvr+UGuDpFmbb7BoYoIU/qcQgmHYX8ErkNtZmdbBBPRizaSmWm8gyowg3zGNqZCOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771700849; c=relaxed/simple;
	bh=vc7comdl9kZeKo6DtEbmNCVBq6uUXdihnm/U87RG9zc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gki9Madj7xr9HvhdWo5yJPBduQ75krnhGorefSpWNzlxav1aQxwihNZNHrr+VCgyucf/YjyS+FtICkURtiiYM/HDXINIoFYBsjadGtv33807syUmfR/YsJC4HTDrL6XQi6CdrJyzMfJvE8+uYLIYIoNHd/2LYKQvYhX5WtD/AR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org; spf=pass smtp.mailfrom=plaes.org; dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b=oOtLZYAZ; arc=none smtp.client-ip=188.166.43.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plaes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b="oOtLZYAZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=plaes.org; s=mail;
	t=1771700840; bh=vc7comdl9kZeKo6DtEbmNCVBq6uUXdihnm/U87RG9zc=;
	h=From:To:Cc:Subject:Date:From;
	b=oOtLZYAZ/WHWkK26lgba6K9079Oy1zPVmhHx4Aopwnbx5kuLUI/CrBx8pivswZ5pP
	 uG80pgIcijD8Nywa5rqz2jMnqT+w6C5e713YkcGbVOv/hqa8YCQbO3RBm0/73n1KLu
	 UFqd1Cjz/knngqDo4mA2pWDwVUg3ECD2mB3+jttk9ENaGJ6WwG0hTy8OIN3lPXRuOW
	 EIMzyX1iBa2/gaR5TGRz2Dkm7/nZUAWBc6hf84cT00XseUKc/l0GIH77blV/ADrzlX
	 ZJa+wW+Nd49pWkL0GKW0A6t6ZXNZtuHerbgpPVfpW/PBHnd3Zl+5kiytrliR9iA/0T
	 wxYQMlKvWFWuw==
Received: from localhost (0bd2-0000-0000-0000-6400-8cb1-07d0-2001.dyn.estpak.ee [IPv6:2001:7d0:8cb1:6400::bd2])
	by mail.plaes.org (Postfix) with ESMTPSA id BB338400D2;
	Sat, 21 Feb 2026 19:07:20 +0000 (UTC)
From: Priit Laes <plaes@plaes.org>
To: 
Cc: Priit Laes <plaes@plaes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Archit Anant <architanant5@gmail.com>,
	Minu Jin <s9430939@naver.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bryant Boatright <bryant.boatright@proton.me>,
	Ignacio Pena <ignacio.pena87@gmail.com>,
	JJ Strnad <strnad.jj@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Tanjim Kamal <tanjimkamal1@gmail.com>,
	Navaneeth K <knavaneeth786@gmail.com>,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Michael Huang <tehsiu.huang@gmail.com>,
	Nino Zhang <ninozhang001@gmail.com>,
	=?UTF-8?q?Rog=C3=A9rio=20Fernandes=20Pereira?= <rfp2005@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Omer El Idrissi <omer.e.idrissi@gmail.com>,
	William Hansen-Baird <william.hansen.baird@gmail.com>,
	Diksha Kumari <dikshakdevgan@gmail.com>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Karthikey D Kadati <karthikey3608@gmail.com>,
	Akiyoshi Kurita <weibu@redadmin.org>,
	SeungJu Cheon <suunj1331@gmail.com>,
	Erick Karanja <karanja99erick@gmail.com>,
	Sun Jian <sun.jian.kdev@gmail.com>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/11] staging: stl8723bs: Various cleanups
Date: Sat, 21 Feb 2026 21:01:30 +0200
Message-ID: <20260221190628.50273-1-plaes@plaes.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Various cleanups for rtl8723bs driver, mostly targeting unused code and
definitions.

Changes since v1:
* Include description in commit body as well
* Fix warnings introduced in patch 11.

Priit Laes (11):
  staging: stl8723bs: Use common round_up macro
  staging: rtl8723bs: Remove unused BIT32..BIT36 definitions
  staging: rtl8723bs: Drop empty rtw_bug_check function
  staging: rtl8723bs: Remove unused rtw_sprintf macro
  staging: rtl8723bs: Drop unused _kfree(...) declaration.
  staging: rtl8723bs: Get rid of unused _rtw_init_queue
  staging: rtl8723bs: Drop unused NDEV-related formatting macros
  staging: rtl8723bs: Drop workqueue wrapper functions
  staging: rtl8273bs: Simplify regulatory initialization functions
  staging: rtl8723bs: Clean up wrapper functions
  staging: rtl8723bs: rtw_ieee80211: Reduce global symbols

 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 90 ++++++++-----------
 .../staging/rtl8723bs/core/rtw_ieee80211.c    | 41 ++++-----
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 10 ---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |  6 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c     |  3 -
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |  1 -
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  4 -
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  6 +-
 drivers/staging/rtl8723bs/hal/sdio_ops.c      |  8 +-
 drivers/staging/rtl8723bs/include/cmd_osdep.h |  7 +-
 drivers/staging/rtl8723bs/include/ieee80211.h | 30 -------
 .../staging/rtl8723bs/include/osdep_service.h | 25 ------
 .../rtl8723bs/include/osdep_service_linux.h   | 18 ----
 drivers/staging/rtl8723bs/os_dep/wifi_regd.c  | 27 +-----
 14 files changed, 73 insertions(+), 203 deletions(-)

-- 
2.53.0

