Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC7423AC
	for <linux-staging@lists.linux.dev>; Wed, 16 Feb 2022 08:17:16 +0000 (UTC)
Received: from dslb-188-097-046-221.188.097.pools.vodafone-ip.de ([188.97.46.221] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nKFUp-0008Pc-Ax; Wed, 16 Feb 2022 09:17:07 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 3/3] staging: r8188eu: struct usb_suspend_parm is not used
Date: Wed, 16 Feb 2022 09:16:57 +0100
Message-Id: <20220216081657.622467-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220216081657.622467-1-martin@kaiser.cx>
References: <20220216081657.622467-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct usb_suspend_parm is not used. Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/rtw_cmd.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_cmd.h b/drivers/staging/r8188eu/include/rtw_cmd.h
index 39273f9775cb..54643927054f 100644
--- a/drivers/staging/r8188eu/include/rtw_cmd.h
+++ b/drivers/staging/r8188eu/include/rtw_cmd.h
@@ -122,18 +122,6 @@ enum RFINTFS {
 	HWPI,
 };
 
-/*
-Caller Mode: Infra, Ad-HoC(C)
-
-Notes: To enter USB suspend mode
-
-Command Mode
-
-*/
-struct usb_suspend_parm {
-	u32 action;/*  1: sleep, 0:resume */
-};
-
 /*
 Caller Mode: Infra, Ad-HoC
 
-- 
2.30.2

