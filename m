Received: from challenge-bot.com (ozzloy.lifeafterking.org [208.85.243.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75F81840
	for <linux-staging@lists.linux.dev>; Tue, 14 Jun 2022 02:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=challenge-bot.com; s=20180430; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wxg1Qx31xYRL1VBGbLQizcl3JBI7G3epjuGqGFMFwbA=; b=AvPQTmEdyYSBWkDTKSMckZXRSp
	XzZV9fon/3AhhksNJjs/EjBnaOWaQ3uAaZYLbGNzoRJQFXGgHTmgkmniTvUuGGHINA3Rgote84FI7
	2gI5zmrgRix/KGmF+JHC0sXP9wDwrm+8ha/fDVPWyIJUq7nAZsvucyfFXOPWkvLcBMwI=;
Received: from ozzloy by challenge-bot.com with local (Exim 4.92)
	(envelope-from <ozzloy@challenge-bot.com>)
	id 1o0vyA-00088E-CQ; Mon, 13 Jun 2022 19:07:50 -0700
From: daniel watson <ozzloy@challenge-bot.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Daniel Watson <ozzloy@challenge-bot.com>
Subject: [PATCH 1/4] staging: r8188eu: remove leading '_' on _rtw_IOL_append_WB_cmd
Date: Mon, 13 Jun 2022 19:07:30 -0700
Message-Id: <a1596a62d8e63afbe6a645919a349a8402277c5f.1655171591.git.ozzloy@challenge-bot.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1655171591.git.ozzloy@challenge-bot.com>
References: <cover.1655171591.git.ozzloy@challenge-bot.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Watson <ozzloy@challenge-bot.com>

name the function rtw_IOL_append_WB_cmd and call it directly,
instead of using wrapper macro

delete wrapper macro, which is not needed

NOTE: code compiles, not tested on hardware

Signed-off-by: Daniel Watson <ozzloy@challenge-bot.com>
---
 drivers/staging/r8188eu/core/rtw_iol.c    | 2 +-
 drivers/staging/r8188eu/include/rtw_iol.h | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_iol.c b/drivers/staging/r8188eu/core/rtw_iol.c
index af8e84a41b851..8c990b1af5a70 100644
--- a/drivers/staging/r8188eu/core/rtw_iol.c
+++ b/drivers/staging/r8188eu/core/rtw_iol.c
@@ -67,7 +67,7 @@ bool rtw_IOL_applied(struct adapter  *adapter)
 	return false;
 }
 
-int _rtw_IOL_append_WB_cmd(struct xmit_frame *xmit_frame, u16 addr, u8 value, u8 mask)
+int rtw_IOL_append_WB_cmd(struct xmit_frame *xmit_frame, u16 addr, u8 value, u8 mask)
 {
 	struct ioreg_cfg cmd = {8, IOREG_CMD_WB_REG, 0x0, 0x0, 0x0};
 
diff --git a/drivers/staging/r8188eu/include/rtw_iol.h b/drivers/staging/r8188eu/include/rtw_iol.h
index fb88ebc1dabb1..a648f9ba50a62 100644
--- a/drivers/staging/r8188eu/include/rtw_iol.h
+++ b/drivers/staging/r8188eu/include/rtw_iol.h
@@ -41,16 +41,14 @@ int rtw_IOL_append_END_cmd(struct xmit_frame *xmit_frame);
 void read_efuse_from_txpktbuf(struct adapter *adapter, int bcnhead,
 			      u8 *content, u16 *size);
 
-int _rtw_IOL_append_WB_cmd(struct xmit_frame *xmit_frame, u16 addr,
-			   u8 value, u8 mask);
+int rtw_IOL_append_WB_cmd(struct xmit_frame *xmit_frame, u16 addr,
+			  u8 value, u8 mask);
 int _rtw_IOL_append_WW_cmd(struct xmit_frame *xmit_frame, u16 addr,
 			   u16 value, u16 mask);
 int _rtw_IOL_append_WD_cmd(struct xmit_frame *xmit_frame, u16 addr,
 			   u32 value, u32 mask);
 int _rtw_IOL_append_WRF_cmd(struct xmit_frame *xmit_frame, u8 rf_path,
 			    u16 addr, u32 value, u32 mask);
-#define rtw_IOL_append_WB_cmd(xmit_frame, addr, value, mask)		\
-	_rtw_IOL_append_WB_cmd((xmit_frame), (addr), (value) ,(mask))
 #define rtw_IOL_append_WW_cmd(xmit_frame, addr, value, mask)		\
 	_rtw_IOL_append_WW_cmd((xmit_frame), (addr), (value),(mask))
 #define rtw_IOL_append_WD_cmd(xmit_frame, addr, value, mask)		\
-- 
2.34.1

