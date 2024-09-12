Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91EA3A8E4
	for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 02:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726108059; cv=none; b=NzZUPqruaO2t10RM5bwnN6mySdCR4AWkdwCfkTXAqKxb+2L0D/MOAYqhxDpRnolRKAe+jJPPhMDige0Sjw84ljITXXdLlW2c4f88clwlQXSijjwGsiWkrEobkgepZxr1cIzASqRjr2iSiu/lyCMcCqpuJIQUKbl5qbMXm63ND0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726108059; c=relaxed/simple;
	bh=d1O5hwSWg6znx+NZ+n+luii+ruzQJAuCvReX2GnN9xo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Rs51Q0o7Fsqqgml5CKN0LMTrqBGFVGZDpHyDllk7Ydoxdqb8z7u8aMrI22F+wYeoJ9aMerKdIVkqdqFm79SqUhkk30BFtP2ETCebjRBX3D1EdOIfK3jWybKNee9ubO8fQYvt0GqlDjxh5M2zdnHGaMS5qPuVMK/sDlulRsWEFEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b=fb1c8f/7; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b="fb1c8f/7"
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 48C2RWijC521212, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1726108052; bh=d1O5hwSWg6znx+NZ+n+luii+ruzQJAuCvReX2GnN9xo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=fb1c8f/7gHF2JVSQnR4UwFnU17qPk97SkQMlpzKnn6i/HKqVOWcBKDCbCoy0eyFJJ
	 tovhWDBoMJ1kWdyoUwotkKpNbP4o2fVc1qFPuRWjlsVrb/i+jVt989SDcBjubRiDfD
	 tXLUO9rXyO5o2/sg8QJwrEMxY78NN6TvVupACaeGTNaKpoNVteT7FbxCEtCuhrox9W
	 BwI4HDS+bjKqvZ5vegTNGESJbekOOC+N0Z2q4HvFt3tTwE6j5th1LL7dDGWaV9dhJu
	 B/qm9mR8/GuZXRHVKp+KksBnRo9CXJ0j68D01X8huUgooSoVU5WjsVmFKKNsoNhjaj
	 zgr99lQ85bjQg==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.05/5.92) with ESMTPS id 48C2RWijC521212
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Sep 2024 10:27:32 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 10:27:33 +0800
Received: from [127.0.1.1] (172.21.69.94) by RTEXMBS04.realtek.com.tw
 (172.21.6.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 12 Sep
 2024 10:27:32 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: <gregkh@linuxfoundation.org>
CC: <linux-staging@lists.linux.dev>
Subject: [PATCH 0/4] staging: fix warning of -Wunused-but-set-variable reported by clang
Date: Thu, 12 Sep 2024 10:25:18 +0800
Message-ID: <20240912022522.10715-1-pkshih@realtek.com>
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

