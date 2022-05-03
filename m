Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D569B17EA
	for <linux-staging@lists.linux.dev>; Tue,  3 May 2022 07:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1651561469;
	bh=IkD2eC64H4a98Hm5EUi6JNXhMplBS97eRkzCZjPYuZk=;
	h=From:To:Cc:Subject:Date;
	b=EFk9g8Ga8Ve+m6cpuf+kPpG1Aid/az4UXWbdrCN8QS8wMlluQIXlMG1sW+8ns9Ttr
	 B1YFoxnr5yf/3KVv+r5Diyw2w22hpHJR6SsrGe5a92VpdiuAY/MVg/WNWZfvmVqRc+
	 wDw8AYU59632jl6qKJTDCkNe9gn4ylQ6zxSXBnfg=
Received: from localhost.localdomain ([59.172.176.242])
	by newxmesmtplogicsvrsza7.qq.com (NewEsmtp) with SMTP
	id E3B30812; Tue, 03 May 2022 14:56:59 +0800
X-QQ-mid: xmsmtpt1651561019tgdnr890c
Message-ID: <tencent_A80380E4306BE7BA73E450F084232B4DFC0A@qq.com>
X-QQ-XMAILINFO: MR/iVh5QLeieuDg962aXAZu67cxzwJSFTylAyyn0cBZ7CDblJEpwNipuMzCDi1
	 Kt45NMxcYnlvKh1wZqr6osnAWSeJkAON2Y+vNxBuM+uwhp4X268pPE1w3Kj6tM36FRjkSV7VC3Ru
	 23YahIBoWsi0+TydIlyv8+BsLY0sUyc+ZHQdumbXYLxPhWX/NbmB+CTz4YdjiOni3regbGUO67Wb
	 GMJrO3L+jYwvz/r1gvbWsmPDZ/KpFhB0AICXckVWVyiXmiIdQjc2SFoPVxg/7mIoBAR96t63azKp
	 4L9Xkigv31wSi7hNqbpYgzENjCv1sJm1CKl5gIzdFSdJUx9GQVyApyLryBhwReXRmbDv9SkEamUI
	 IjZ+dsNyg//aYG3q+w5+2EAd3W7zCS+OkieYbIROfC5D0NeMdTnVY0SQK0B92k6fZz2zYs4eRY4B
	 xKqBSNA1fxmjQtRaYrPjFM73azm+kdPuPvoYwCP01lnLJvbXr5/BiVNYzMdwLc9w9y2kRZBMxkpr
	 c4PSX4HC+AFCRmov9TnBoYuIvPztTHnjEJnKxU21VJpZonS7fd5hrdKaOl46cbBG71IkoE+m5XVa
	 Kr/25AhaRsJ/DE7xIi6Jm6FYIO3mHB7e07okm/JD6S2MElnU+fx2SMf7rgzStO1/sbSSWdF655bS
	 6ejmo/e3ZSLHFUokYu7ZojA2jKq06ktmE4MwK3abXVuizuH+f6yBL4TgOb+HSPXC2NRMak2o0jfn
	 ThPuOKYLD45seASS+9wyAE7S4zme4G8Nr27EfkMwLJrAjVOMk6KVe/F3vYsToXGsMKkrlk1ONkmz
	 +NFn7UV89MD19blPJiou9Xy019C/o9sHivXqLyOPvmO4XDxHn9lIHSASKmVStRn47270RggOyadA
	 NP3PpT+M4lseZ3nuzA/OltoB8HqMTlS2U8OfW5EBlLkm2z8B1JPoIW4NziACQ7QWrnigFLQcaG8j
	 ScIoeiVFs=
From: xkernel.wang@foxmail.com
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH 00/12] staging: some memory-related patches
Date: Tue,  3 May 2022 14:56:47 +0800
X-OQ-MSGID: <20220503065647.3153-1-xkernel.wang@foxmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xiaoke Wang <xkernel.wang@foxmail.com>

This is a collection about some memory-related bugs fixing.
In brief, there are two types about them.
First is some memory allocation functions are called without proper
checking, which may result in wrong memory access in the subsequent
running or some else.
Second is lacking proper error handling that does not release some
allocated resources, which may result in memory leak problems.

These issuses are similar, so they are put in this series together.
Note that most of them are sent as each separate patch before, this series
rebased them to the lasted version. While there are some inherent logical
relationships between 03~05/11~12.

Xiaoke Wang (12):
  staging: rtl8712: fix potential memory leak in
    r8712_xmit_resource_alloc()
  staging: rtl8712: fix potential memory leak in _r8712_init_xmit_priv()
  staging: rtl8712: fix potential memory leak in r8712_init_drv_sw()
  staging: rtl8712: change the type of _r8712_init_recv_priv()
  staging: rtl8712: add two validation check in r8712_init_drv_sw()
  staging: rtl8723bs: fix a potential memory leak in rtw_init_cmd_priv()
  staging: rtl8723bs: fix potential memory leak in _rtw_init_xmit_priv()
  staging: rtl8723bs: fix potential memory leak in rtw_init_drv_sw()
  staging: r8188eu: fix a potential memory leak in _rtw_init_cmd_priv()
  staging: r8188eu: fix potential memory leak in
    rtw_os_xmit_resource_alloc()
  staging: r8188eu: fix potential memory leak in _rtw_init_xmit_priv()
  staging: r8188eu: check the return of kzalloc()

 drivers/staging/r8188eu/core/rtw_cmd.c      | 16 +++---
 drivers/staging/r8188eu/core/rtw_xmit.c     | 42 +++++++++++----
 drivers/staging/r8188eu/include/rtw_xmit.h  |  2 +-
 drivers/staging/r8188eu/os_dep/xmit_linux.c |  4 +-
 drivers/staging/rtl8712/os_intfs.c          | 26 +++++++--
 drivers/staging/rtl8712/recv_osdep.h        |  2 +-
 drivers/staging/rtl8712/rtl871x_recv.c      |  6 +--
 drivers/staging/rtl8712/rtl871x_xmit.c      | 27 +++++++---
 drivers/staging/rtl8712/xmit_linux.c        |  3 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c    | 17 +++---
 drivers/staging/rtl8723bs/core/rtw_xmit.c   | 50 ++++++++++++-----
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 60 +++++++++++----------
 12 files changed, 163 insertions(+), 92 deletions(-)

-- 
