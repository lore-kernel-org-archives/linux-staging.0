Received: from challenge-bot.com (ozzloy.lifeafterking.org [208.85.243.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9491EA2D
	for <linux-staging@lists.linux.dev>; Sun, 12 Jun 2022 04:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=challenge-bot.com; s=20180430; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9SNUBEiEZG/TlIslfoXSStsV4edMrmyoXOnBtvxh9ng=; b=UbKCQmj5Yd9IiEJfnbUJ48XnSS
	+9GL6dTRsHKFNDRjGvUebLzxRPEjfqfOG+HajXYXb4T3p7yri7T+Na4OFSj89wY12IPeYphgmudIp
	Mq0BTNt+iXzw6UVEregegw8SZHYL+fWzF6rTadIsdT2H4Dp6MNmkqx7S4svbLFc1syKE=;
Received: from ozzloy by challenge-bot.com with local (Exim 4.92)
	(envelope-from <ozzloy@challenge-bot.com>)
	id 1o0Es2-0001iX-Of; Sat, 11 Jun 2022 21:06:38 -0700
From: daniel watson <ozzloy@challenge-bot.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Daniel Watson <ozzloy@challenge-bot.com>
Subject: [PATCH] staging: r8188eu: put spaces after commas
Date: Sat, 11 Jun 2022 21:06:28 -0700
Message-Id: <20220612040628.6433-1-ozzloy@challenge-bot.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Watson <ozzloy@challenge-bot.com>

conform to kernel style by putting spaces after commas
this was found by checkpatch

Signed-off-by: Daniel Watson <ozzloy@challenge-bot.com>
---
 drivers/staging/r8188eu/include/rtw_iol.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_iol.h b/drivers/staging/r8188eu/include/rtw_iol.h
index fb88ebc1dabb1..b39ecfb75ade0 100644
--- a/drivers/staging/r8188eu/include/rtw_iol.h
+++ b/drivers/staging/r8188eu/include/rtw_iol.h
@@ -50,13 +50,13 @@ int _rtw_IOL_append_WD_cmd(struct xmit_frame *xmit_frame, u16 addr,
 int _rtw_IOL_append_WRF_cmd(struct xmit_frame *xmit_frame, u8 rf_path,
 			    u16 addr, u32 value, u32 mask);
 #define rtw_IOL_append_WB_cmd(xmit_frame, addr, value, mask)		\
-	_rtw_IOL_append_WB_cmd((xmit_frame), (addr), (value) ,(mask))
+	_rtw_IOL_append_WB_cmd((xmit_frame), (addr), (value), (mask))
 #define rtw_IOL_append_WW_cmd(xmit_frame, addr, value, mask)		\
-	_rtw_IOL_append_WW_cmd((xmit_frame), (addr), (value),(mask))
+	_rtw_IOL_append_WW_cmd((xmit_frame), (addr), (value), (mask))
 #define rtw_IOL_append_WD_cmd(xmit_frame, addr, value, mask)		\
 	_rtw_IOL_append_WD_cmd((xmit_frame), (addr), (value), (mask))
 #define rtw_IOL_append_WRF_cmd(xmit_frame, rf_path, addr, value, mask)	\
-	_rtw_IOL_append_WRF_cmd((xmit_frame),(rf_path), (addr), (value), (mask))
+	_rtw_IOL_append_WRF_cmd((xmit_frame), (rf_path), (addr), (value), (mask))
 
 u8 rtw_IOL_cmd_boundary_handle(struct xmit_frame *pxmit_frame);
 
-- 
2.34.1

