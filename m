Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12693A5E77
	for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 14:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776694589; cv=none; b=dki1G+i8ekUzVmXn3Wqrw9rkUbDNLwrXBIhA2NOdpDXp1I3y0cdLCuVAKhVJCp1Yp3uW7BopAl/6c/LIfeLwmNjppjWnhX/cGPT8CgQgGjHc63PgdgHN6XcMa60mgezrceiXG10pWUAnPGY8vnJekCXK2MV2IXNrMQC3XcXlwuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776694589; c=relaxed/simple;
	bh=zDhr9zlL/pqPV216vNykVZfrXnNBLSflmL3rAcjqXaY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OHPEgTenAV5GVgcrmuXlAeGJhFK+Qbvx7XZYexmf7K689wJynlSYP5yc3Fr3ICOpATgiqUPoeNbveHYz2mYQSqjBlRvaHEdYBQ0rTbycogqUDnTn5HZKvV0jNTDwnmlK2dh1kkJf40IlP4diXq96yLQcYQyKqCTbTxOiJwkvJK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=P5jTSNW3; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="P5jTSNW3"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id EE15226E4F;
	Mon, 20 Apr 2026 16:16:17 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TKzOFZrCbqaM; Mon, 20 Apr 2026 16:16:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1776694577; bh=zDhr9zlL/pqPV216vNykVZfrXnNBLSflmL3rAcjqXaY=;
	h=Date:From:To:Cc:Subject;
	b=P5jTSNW3FSB/5fkaE2Jk9QWvx2/pq0uV9s2MpEgJ9RDAONWqznMicVEWGYSyINLot
	 DoFwzQsBWK3LEfXVrzp6Fpgo0pv4Lv4Whyu2EKmWGMkJgkw2X8k8ugKuwmw9faw9Pa
	 X/z2ykPX7TE+n/zlEMShlCpkbHV1v9ubf68dJkbDAR16I4bOaPCVAxjLlG3N8HJJND
	 P6/TQV5zLyfzJe3trJxiw0dj4eGk3Zc++CTQkRA6NBnaa9fZhy6hkZNSh42Jx5U0LJ
	 CIchpYfOo7QXDIajgJYl/iExlSOvkGHnG9Rei35F4uMNiz17PUkh0sfZ6X1+l0uGga
	 EkMw99gkAZhMw==
Date: Mon, 20 Apr 2026 16:16:17 +0200
From: Demir =?iso-8859-1?Q?=D6zdemir?= <demirozdemir@disroot.org>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: remove redundant else block in
 sdio_halinit.c
Message-ID: <aeY1Mc2uEUKkr-dB@archlinux>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Remove redundant else block after a return statement within if block in
rtl8723bs_hal_init(). Identified through checkpatch as a warning.

Signed-off-by: Demir Özdemir <demirozdemir@disroot.org>
---
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index f2f73c65a636..809f07855bb8 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -654,11 +654,11 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 		padapter->bFWReady = false;
 		pHalData->fw_ractrl = false;
 		return ret;
-	} else {
-		padapter->bFWReady = true;
-		pHalData->fw_ractrl = true;
 	}
 
+	padapter->bFWReady = true;
+	pHalData->fw_ractrl = true;
+
 	rtl8723b_InitializeFirmwareVars(padapter);
 
 /* 	SIC_Init(padapter); */
-- 
2.53.0

