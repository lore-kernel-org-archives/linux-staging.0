Received: from challenge-bot.com (ozzloy.lifeafterking.org [208.85.243.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79E3290E
	for <linux-staging@lists.linux.dev>; Wed, 15 Jun 2022 17:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=challenge-bot.com; s=20180430; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=N9mphYMfxQdT/0wa00SOKNuuuPdp5vfec0Gt4uUXQqg=; b=bagIpW3kUL+GyBAUo/d8o9fdSv
	gvBq62hEWOCKCalxy4rp9pKGiPjWqpWoRWzJCNrLzMQWZ5ubRlrOvIfOwLiWUIJxlv/2dFd+PRVQe
	Tqr7pEXXX8RKW4yPT/IcjiOc8wGkpiOliqQJdhKAyz2DcJ/13VIB7YP5e3hcLmUEfQf0=;
Received: from ozzloy by challenge-bot.com with local (Exim 4.92)
	(envelope-from <ozzloy@challenge-bot.com>)
	id 1o1Wde-0005iz-Hp; Wed, 15 Jun 2022 10:17:06 -0700
From: daniel watson <ozzloy@challenge-bot.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Daniel Watson <ozzloy@challenge-bot.com>
Subject: [PATCH v3 4/4] staging: r8188eu: call rtw_IOL_append_WRF_cmd directly
Date: Wed, 15 Jun 2022 10:17:03 -0700
Message-Id: <4f26e0dd99e32738d7019ebcf680e7c73ed8ac8a.1655312169.git.ozzloy@challenge-bot.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1655312169.git.ozzloy@challenge-bot.com>
References: <cover.1655312169.git.ozzloy@challenge-bot.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Watson <ozzloy@challenge-bot.com>

Call rtw_IOL_append_WRF_cmd directly, instead of using wrapper macro.

Delete wrapper macro, which is not needed.

Signed-off-by: Daniel Watson <ozzloy@challenge-bot.com>
---
Changes in v2:
  - Make the commit message clearer
Changes in v3:
  - None

Note: This code has not been run on hardware.

 drivers/staging/r8188eu/core/rtw_iol.c    | 2 +-
 drivers/staging/r8188eu/include/rtw_iol.h | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_iol.c b/drivers/staging/r8188eu/core/rtw_iol.c
index b7ee3833c908c..31e196ccd899a 100644
--- a/drivers/staging/r8188eu/core/rtw_iol.c
+++ b/drivers/staging/r8188eu/core/rtw_iol.c
@@ -109,7 +109,7 @@ int rtw_IOL_append_WD_cmd(struct xmit_frame *xmit_frame, u16 addr, u32 value, u3
 	return rtw_IOL_append_cmds(xmit_frame, (u8 *)&cmd, cmd.length);
 }
 
-int _rtw_IOL_append_WRF_cmd(struct xmit_frame *xmit_frame, u8 rf_path, u16 addr, u32 value, u32 mask)
+int rtw_IOL_append_WRF_cmd(struct xmit_frame *xmit_frame, u8 rf_path, u16 addr, u32 value, u32 mask)
 {
 	struct ioreg_cfg cmd = {8, IOREG_CMD_W_RF, 0x0, 0x0, 0x0};
 
diff --git a/drivers/staging/r8188eu/include/rtw_iol.h b/drivers/staging/r8188eu/include/rtw_iol.h
index 9ad467759ef1c..099f5a075274c 100644
--- a/drivers/staging/r8188eu/include/rtw_iol.h
+++ b/drivers/staging/r8188eu/include/rtw_iol.h
@@ -47,10 +47,8 @@ int rtw_IOL_append_WW_cmd(struct xmit_frame *xmit_frame, u16 addr,
 			  u16 value, u16 mask);
 int rtw_IOL_append_WD_cmd(struct xmit_frame *xmit_frame, u16 addr,
 			  u32 value, u32 mask);
-int _rtw_IOL_append_WRF_cmd(struct xmit_frame *xmit_frame, u8 rf_path,
-			    u16 addr, u32 value, u32 mask);
-#define rtw_IOL_append_WRF_cmd(xmit_frame, rf_path, addr, value, mask)	\
-	_rtw_IOL_append_WRF_cmd((xmit_frame),(rf_path), (addr), (value), (mask))
+int rtw_IOL_append_WRF_cmd(struct xmit_frame *xmit_frame, u8 rf_path,
+			   u16 addr, u32 value, u32 mask);
 
 u8 rtw_IOL_cmd_boundary_handle(struct xmit_frame *pxmit_frame);
 
-- 
2.34.1

