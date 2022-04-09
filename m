Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075D4A31
	for <linux-staging@lists.linux.dev>; Sat,  9 Apr 2022 16:32:23 +0000 (UTC)
Received: from ipservice-092-217-091-111.092.217.pools.vodafone-ip.de ([92.217.91.111] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ndE0a-0006Rg-S7; Sat, 09 Apr 2022 18:32:20 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 04/10] staging: r8188eu: improve timeout handling in rtl8188e_firmware_download
Date: Sat,  9 Apr 2022 18:32:06 +0200
Message-Id: <20220409163212.241122-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220409163212.241122-1-martin@kaiser.cx>
References: <20220409163212.241122-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the standard kernel functions to define and check the timeout in
rtl8188e_firmware_download.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_fw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_fw.c b/drivers/staging/r8188eu/core/rtw_fw.c
index 625d186c3647..7a0997b9bac5 100644
--- a/drivers/staging/r8188eu/core/rtw_fw.c
+++ b/drivers/staging/r8188eu/core/rtw_fw.c
@@ -247,7 +247,7 @@ int rtl8188e_firmware_download(struct adapter *padapter)
 {
 	int ret = _SUCCESS;
 	u8 write_fw_retry = 0;
-	u32 fwdl_start_time;
+	unsigned long fwdl_timeout;
 	struct dvobj_priv *dvobj = adapter_to_dvobj(padapter);
 	struct device *device = dvobj_to_dev(dvobj);
 	struct rt_firmware_hdr *fwhdr = NULL;
@@ -290,7 +290,7 @@ int rtl8188e_firmware_download(struct adapter *padapter)
 	}
 
 	fw_download_enable(padapter, true);
-	fwdl_start_time = jiffies;
+	fwdl_timeout = jiffies + msecs_to_jiffies(500);
 	while (1) {
 		/* reset the FWDL chksum */
 		rtw_write8(padapter, REG_MCUFWDL, rtw_read8(padapter, REG_MCUFWDL) | FWDL_CHKSUM_RPT);
@@ -298,7 +298,7 @@ int rtl8188e_firmware_download(struct adapter *padapter)
 		ret = write_fw(padapter, fw_data, fw_size);
 
 		if (ret == _SUCCESS ||
-		    (rtw_get_passing_time_ms(fwdl_start_time) > 500 && write_fw_retry++ >= 3))
+		    (time_after(jiffies, fwdl_timeout) && write_fw_retry++ >= 3))
 			break;
 	}
 	fw_download_enable(padapter, false);
-- 
2.30.2

