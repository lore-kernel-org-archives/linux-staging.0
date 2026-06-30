Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8203A2E2B
	for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 16:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782837255; cv=none; b=U2rYHjwbGGky8bYVe8b7o5/uT6JhBA7XW/z6pyAYzIvS5lwxX0UrcG6dQu5UDGN9vCIsH0d7sOIaBmt4a4VLeAED7tXKC8M9WGTmx5E6pnZD358/wazfrwQ0O478ZBDVlnEC7T1k2mdnnNrYcoU+DCrg4nmsjZ12t61C4uUTAE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782837255; c=relaxed/simple;
	bh=xukIOZyX+/Y8s63jpfb6Iaj623f9JMld1911xiLaT54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DTAdoL7OlInk34YkgMGot6h9V9YtuPl2X2mMJvVQr3boN6xDhL0rlmh/xcEAp6GOgBGdrqdzoKu7YZXmEfSZPhv+5BeGpv/ZCb8kzMBTGP9QxwIXvAqZfYJxtV1mujbSpnmqdjDtBED54jGRpIM0IcP9pr5Bu1UFNikItOcVgs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=sLnPRhUj; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="sLnPRhUj"
Received: from fews04-sea.riseup.net (fews04-sea-pn.riseup.net [10.0.1.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4gqTHn4MXczDqVR;
	Tue, 30 Jun 2026 16:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1782837253; bh=z3jaFyIRXdH4EuydtTez/SjgEY2bBLvo/Qcf0pHoR0U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sLnPRhUjwQiWn625dgXnlycT8jYV2553G4d1m/WsLUMedCa5RLUqL6xhn99PjEFGw
	 HOdNX3KpxCR0/PpPKitqWDoGDAdAdiNp0La82haB3M8h2/tPX2Iyz02ECJU4ZJgUpO
	 zkKM6GxU+DMORGo+xcgmzjA3GP7arxhsii8eONKc=
X-Riseup-User-ID: 1F0D70A0E3BC082003D9E9FBE151F5EA62533FC20E792E56DE4980A17FB4CAF5
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews04-sea.riseup.net (Postfix) with ESMTPSA id 4gqTHm6pFHz5vZJ;
	Tue, 30 Jun 2026 16:34:12 +0000 (UTC)
From: Alonso Garrigues <agarrigues@riseup.net>
To: gregkh@linuxfoundation.org
Cc: guojy.bj@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alonso Garrigues <agarrigues@riseup.net>
Subject: [PATCH 6/6] staging: rtl8723bs: Add braces to if statement in rtl8723bs_cmd.c
Date: Tue, 30 Jun 2026 17:33:16 +0100
Message-ID: <20260630163316.1128319-7-agarrigues@riseup.net>
In-Reply-To: <20260630163316.1128319-1-agarrigues@riseup.net>
References: <20260630163316.1128319-1-agarrigues@riseup.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add braces so all blocks in an if else statement are consistent as per
kernel coding style.

Signed-off-by: Alonso Garrigues <agarrigues@riseup.net>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index e4af4348e037..037c13c1e0a8 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -69,9 +69,9 @@ s32 FillH2CCmd8723B(struct adapter *padapter, u8 ElementID, u32 CmdLen, u8 *pCmd
 		if (!_is_fw_read_cmd_down(padapter, h2c_box_num))
 			goto exit;
 
-		if (CmdLen <= 3)
+		if (CmdLen <= 3) {
 			memcpy((u8 *)(&h2c_cmd) + 1, pCmdBuffer, CmdLen);
-		else {
+		} else {
 			memcpy((u8 *)(&h2c_cmd) + 1, pCmdBuffer, 3);
 			memcpy((u8 *)(&h2c_cmd_ex), pCmdBuffer + 3, CmdLen - 3);
 		}
-- 
2.54.0

