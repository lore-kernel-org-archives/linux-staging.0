Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CCE3B6C06
	for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 16:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782837217; cv=none; b=SL7VrCiwgZkbYhr6eUC4YA19w9YycrC1OYcvQ7niODpEDeH7b1RIgaeWkCzY5RNaK0kW5E4RtOFqTMxbKHYnXAfkEEkSGy/OKZKf/sM0bjtTNyeTD+P8EIsi5/+Hx0YXZ4chhldepOrgY7B6DYonLWeferpK23BkxYn9GyszNUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782837217; c=relaxed/simple;
	bh=YsQHx/hOFB1AMniS4wcHEoxUFcjxdEeEcEow8O9CdyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qED8xR3mQZvoz5OuReAm1KKjBvq6w+wZj9eGfrxAbpJB6gt/XvTz6fI7TbSgEFM31Pk+b61e7kGioK0AT75BBmvrmdmWCIucG07hCi8OHPPZmwS/lymuXxy2uxhfzwu2nWF0zuHthGAaXe2cKlwa19mlhmMehE87S1DvoFBNQqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=QWJ42bAP; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="QWJ42bAP"
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4gqTGy3vgCzDqVR
	for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 16:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1782837210; bh=gWWkqlUEhjZPCdLrrsq3xDLW4QIfjq1XrIROLzVx/RM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QWJ42bAPefkJbeMQIj6QHG6rXKIIrKkUrHnq9VzXSj3MdXvIBAT5k+OgQd1vA+9UK
	 a3+Til9XWsnFUM3R7Zx8gjBHMVWbjPat9sUFzIXjOk4pV+0KCC5y/G2PqRX/xkWfdD
	 +LAsq9GFVDhk+wzd/sRJnNPbD1I0k2PRCy6Jmm/I=
Received: from fews04-sea.riseup.net (fews04-sea-pn.riseup.net [10.0.1.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4gqTGr4QS2z9sqg;
	Tue, 30 Jun 2026 16:33:24 +0000 (UTC)
X-Riseup-User-ID: 28C159E935D4E1087524068F4CEF54171F420CF94350D637178036B99693D793
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews04-sea.riseup.net (Postfix) with ESMTPSA id 4gqTGr04VGz5vZJ;
	Tue, 30 Jun 2026 16:33:23 +0000 (UTC)
From: Alonso Garrigues <agarrigues@riseup.net>
To: gregkh@linuxfoundation.org
Cc: guojy.bj@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alonso Garrigues <agarrigues@riseup.net>
Subject: [PATCH 1/6] staging: rtl8723bs: remove dead code block in rtl8723bs_cmd.c
Date: Tue, 30 Jun 2026 17:33:11 +0100
Message-ID: <20260630163316.1128319-2-agarrigues@riseup.net>
In-Reply-To: <20260630163316.1128319-1-agarrigues@riseup.net>
References: <20260630163316.1128319-1-agarrigues@riseup.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove commented-out dead code block for readability.

Signed-off-by: Alonso Garrigues <agarrigues@riseup.net>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index c35c7f1c38ef..13d6052a7347 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -416,14 +416,6 @@ void rtl8723b_set_FwPwrMode_cmd(struct adapter *padapter, u8 psmode)
 
 		}
 
-/* offload to FW if fw version > v15.10
-		pmlmeext->DrvBcnEarly = 0;
-		pmlmeext->DrvBcnTimeOut =7;
-
-		if ((pmlmeext->DrvBcnEarly!= 0Xff) && (pmlmeext->DrvBcnTimeOut!= 0xff))
-			u1H2CPwrModeParm[H2C_PWRMODE_LEN-1] = BIT(0) | ((pmlmeext->DrvBcnEarly<<1)&0x0E) |((pmlmeext->DrvBcnTimeOut<<4)&0xf0) ;
-*/
-
 	}
 
 	hal_btcoex_RecordPwrMode(padapter, u1H2CPwrModeParm, H2C_PWRMODE_LEN);
-- 
2.54.0

