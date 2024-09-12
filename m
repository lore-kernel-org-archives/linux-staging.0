Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EDA3A1DB
	for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 02:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726108061; cv=none; b=T+lRtR1HI3UlTNr0locno2RmeOY6r/n6bStwziCDxDGZ9vM1UB/Z7zJblsUgkQ2FZFR0OaVXusNoi/7SXufl/Xrh0QvFQQw25T8ejmScFT3CJUL/XgaDt61bjuH/bI2T1eHqOFnqIo7q5lK1dxaCfmvIgw1e3pYkVY8WV9UgJco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726108061; c=relaxed/simple;
	bh=P0Gz3K04J578Th6J4/W0a2tu9qn5ugCsklVuCWlZ4S8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pHwOQIFt/qwDwqU99XQ+r1OWmHJGHYGELlB6Grz2J8j5Us6b+fbY+jTmiEycjewXtl0USHCDxdkKiHCvKyX+bkYC/9e+5aJaJlqMTzJePCT9Hv0nHQo196xenx4hbDn6A/TXrWprJOYfnTvKZJ3Jge/yzuTOEjRLkeZwdYTN/6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b=UkPj7NyE; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b="UkPj7NyE"
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 48C2RZcoC521276, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1726108055; bh=P0Gz3K04J578Th6J4/W0a2tu9qn5ugCsklVuCWlZ4S8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=UkPj7NyET1B/b7eHM+/chxyUGAsIbQo3EEGVDBvbXGwk0gHjqMDt69QPPD2KwC082
	 vLEmLYPBP/z6gsKrV1bOqDPasBotlvr+uCj1Py4a3Wx+2QqRIFfeIpzY90V2za9Lf8
	 Kes/LHIFsoTsWONWvCFScFN60XvSun0HyfSS5OG+8LgB+c02fK1zlWGXk+IZBWSELE
	 H5zuyg6biv8SJYAedRL87CsY6luH4cQpYScwTXBHAaStc55xGzRY/ZJVeygb0CrX22
	 dOnKuvKXvpp2+6cVxO6qDhepxSriC8+o7peqXLvkSzBoBUtu1FuVcPsWULhNhZJY2I
	 R20qutd6q0oJw==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.05/5.92) with ESMTPS id 48C2RZcoC521276
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Sep 2024 10:27:35 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 10:27:35 +0800
Received: from [127.0.1.1] (172.21.69.94) by RTEXMBS04.realtek.com.tw
 (172.21.6.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 12 Sep
 2024 10:27:35 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: <gregkh@linuxfoundation.org>
CC: <linux-staging@lists.linux.dev>
Subject: [PATCH 1/4] staging: rtl8712: remove unused drvinfo_sz from update_recvframe_attrib
Date: Thu, 12 Sep 2024 10:25:19 +0800
Message-ID: <20240912022522.10715-2-pkshih@realtek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240912022522.10715-1-pkshih@realtek.com>
References: <20240912022522.10715-1-pkshih@realtek.com>
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

The drvinfo_sz is a size of hardware generated data putting in front of
real RX data. The functions r8712_rxcmd_event_hdl() and recvbuf2recvframe()
have its own parsing code to get drvinfo_sz to access real RX data, so
removing this unused drvinfo_sz is safe.

Otherwise, clang report:

rtl8712_recv.c:139:6: warning:
	variable 'drvinfo_sz' set but not used [-Wunused-but-set-variable]
  139 |         u16 drvinfo_sz;
      |             ^

Signed-off-by: Ping-Ke Shih <pkshih@realtek.com>
---
 drivers/staging/rtl8712/rtl8712_recv.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl8712_recv.c b/drivers/staging/rtl8712/rtl8712_recv.c
index 1fabc5137a4c..ab344d676bb9 100644
--- a/drivers/staging/rtl8712/rtl8712_recv.c
+++ b/drivers/staging/rtl8712/rtl8712_recv.c
@@ -136,10 +136,6 @@ void r8712_free_recvframe(union recv_frame *precvframe,
 static void update_recvframe_attrib_from_recvstat(struct rx_pkt_attrib *pattrib,
 						  struct recv_stat *prxstat)
 {
-	u16 drvinfo_sz;
-
-	drvinfo_sz = (le32_to_cpu(prxstat->rxdw0) & 0x000f0000) >> 16;
-	drvinfo_sz <<= 3;
 	/*TODO:
 	 * Offset 0
 	 */
-- 
2.25.1

