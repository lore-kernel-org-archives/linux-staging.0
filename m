Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9BD7489
	for <linux-staging@lists.linux.dev>; Fri, 13 Sep 2024 00:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726187332; cv=none; b=jqgnlWeeduqjg4Quop/eZQD+eeyrbLE4YAqIlmVR6E8uuypcP5Uah759xh61ce+ENZvMiPZC+sA5FtSXujypGGNmQ5HMpL1Gd7vjHAAiHyETWbb5zeooZk3mlmTwt4wxRFb9wX7YmPBH3B48YHBef1+SLo8N4mj8E/Wm/4lAMvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726187332; c=relaxed/simple;
	bh=0/dSx9knlfV3g6DasMmS3esEX6BchO7frevqXyoEirk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WFWK54CpvIba/xK4xC1iB/QRoKMm/NdgF5xvcC+Dz/9eQ3XsVttww1r5hKrfmxDR5WyQedJM4WqFZ/9VxqEzQEtArKqMI2H5W0nbY/QQZhXIjrO8+zyvKy5P1iA34+qopmhqW6dkGovP7HDH9ohU7tsU/i2OC4Ws+90HgxQY/JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b=lpV4arcJ; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b="lpV4arcJ"
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 48D0SjAV22030628, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1726187325; bh=0/dSx9knlfV3g6DasMmS3esEX6BchO7frevqXyoEirk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=lpV4arcJS3tCA4wlOBzENjCWv+mvJr9VPkJs3tnnQjnMkIETwoUjtaEfclD/kE+C2
	 JMyZSJhtsoJslaa3XIWbgzX5PhdfvQJhnLRpf8IS5EC5vfyZyTbiNQ+qqu58x1wgvq
	 0R68mmFGUwhwhzAKj2ELOGpfux9AWLOOj413vj3DCgqpESLJ64TbS0H8/Fpu/q+6QC
	 FyamxITHeumKEUHKjx+id7wq6XBoo+EniJNtaZLda4qMDPvMIUAirAlG9Cefh2Gdy1
	 5hB5SBuIBVLdkna8dYM5HlJOd8wRezVOKqaCjYlK5oHOnA5dTTczrTvVR9NLw7aktf
	 0B1UAq+5Mh4Kw==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.05/5.92) with ESMTPS id 48D0SjAV22030628
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-staging@lists.linux.dev>; Fri, 13 Sep 2024 08:28:45 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Sep 2024 08:28:46 +0800
Received: from [127.0.1.1] (172.21.69.94) by RTEXMBS04.realtek.com.tw
 (172.21.6.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Fri, 13 Sep
 2024 08:28:45 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: <linux-staging@lists.linux.dev>
Subject: [PATCH v2 0/4] staging: fix warning of -Wunused-but-set-variable reported by clang
Date: Fri, 13 Sep 2024 08:28:11 +0800
Message-ID: <20240913002815.5149-1-pkshih@realtek.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: RTEXMBS02.realtek.com.tw (172.21.6.95) To
 RTEXMBS04.realtek.com.tw (172.21.6.97)

The build of wireless-next pull-request using clang report warnings [1].
Fix them accordingly.

[1] https://lore.kernel.org/linux-wireless/172609384625.1065358.6518424528532813444.git-patchwork-notify@kernel.org/T/#m405a10ad637bfc5f337127bab81336d8569e49cd

v2:
 - rebase to top of staging tree to resolve conflict of patch 2/4.
 - no logic change.

Ping-Ke Shih (4):
  staging: rtl8712: remove unused drvinfo_sz from
    update_recvframe_attrib
  staging: rtl8723bs: remove unused efuseValue from efuse_OneByteWrite()
  staging: rtl8723bs: remove unused cnt from recv_func()
  staging: rtl8723bs: remove unused 'poll_cnt' from rtw_set_rpwm()

 drivers/staging/rtl8712/rtl8712_recv.c       | 4 ----
 drivers/staging/rtl8723bs/core/rtw_efuse.c   | 9 ---------
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 2 --
 drivers/staging/rtl8723bs/core/rtw_recv.c    | 5 +----
 4 files changed, 1 insertion(+), 19 deletions(-)

-- 
2.25.1

