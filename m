Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3981849
	for <linux-staging@lists.linux.dev>; Fri,  8 Dec 2023 01:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="LjoWlRzf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="2Emq2Yka"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id B53215C01F9;
	Thu,  7 Dec 2023 20:55:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 07 Dec 2023 20:55:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1702000520; x=
	1702086920; bh=PKi9VhuflI7LpDvHoat4EZNxSnaWpvricOV0daR6G7E=; b=L
	joWlRzf3SkeV3uK55L6mYliC0H2xKeUDsrZhxQeDJFarvLIEe+b+KCURe0a7H3wn
	8X4l0R222XbaOdDAqAGpYvdnwnQjMXVKhy2n06FV5HOLhBX9j9BXYwFucehXoN4M
	LILtP0THvdOqbTrnEXAEUaip/YL7Z0pGeTIEcQX3JxzHG32WDhScJwfKBYXlaWR8
	+k+LUzTKjBJBLn6X+HCQ3wOsqmtpH6+lsLmtbF1xoFMWa9D3JUSZ5VZo8vp6+Fiq
	xnJUyY47bNAd58WiiU5xyl4JrGo1pIQF3alXtq+XWg7C9hSM/D+PeUYzd/PQW4cf
	3ezkHabYnR6C1ATQKLCRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1702000520; x=
	1702086920; bh=PKi9VhuflI7LpDvHoat4EZNxSnaWpvricOV0daR6G7E=; b=2
	Emq2YkaWYxH2OKHYHggZerU3SdKBtQRk9Pj+CAXj/A4NPfHKX5xjLUOBD/xFeIfw
	hIstTdwtzveROlZRvvVYJnDup+nmnSV6LNYx7dO1u/eViSn4ijcnyrN7DpjWe39C
	IwzO5Y//ZpE6542kYpP+BQkPqB0V5zNYh4Rn62+mkA/MVgxHGQyYTmjTjVM2mD8h
	0uTZkFme2KGkyUH9PXhoJP+CviQb/RmLi9UATGqy7arpfGPp6oOEI64kaZznsjDG
	IefJQHlrYfG+9sPH+Ugq3wyF1r2X16xg9dKjn55OzVbNBY8ImJLbSBNANjUaCHdr
	6jhox3qyLuPQxixcm1LTw==
X-ME-Sender: <xms:iHdyZe-QvnaTVOQYgwRnvpZ9FK_Vs8wuRpQo7LJEzVh4zDtKSys9Ow>
    <xme:iHdyZeuLpOubtWZPaWsT14bzVtdO_7WcclB7BnmoqxNXulWZOEM6o4isncyVCQK1z
    y7XTCzz-rWaen7GhuQ>
X-ME-Received: <xmr:iHdyZUANyehoCPDT1bNMfLv0OSYTNXbQUSwjoFYqFxza0HaMD5gyQ8mwy93bwuJ6IRu_6uQTESeos5Qv94gtQPK2-lSajItAPPzl0txi7WM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudekgedgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefirghrhicutfhoohhkrghrugcuoehgrghrhihrohhokhgr
    rhgusehfrghsthhmrghilhdrohhrgheqnecuggftrfgrthhtvghrnhepkeeuvdffueduke
    egieeuffejhefgkeetfeehueelfeduuefgveellefhfefgjedvnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghgrrhihrhhoohhkrghrugesfh
    grshhtmhgrihhlrdhorhhg
X-ME-Proxy: <xmx:iHdyZWeQZbtVBTpBHdWoB6OjxDC5QEcetXWHVixgQgIeiGRIq2iMOg>
    <xmx:iHdyZTPKMrcr2cjxQy4eT3mmIVo6HU3e9DsOGyJhlnF6g7wQrDEeww>
    <xmx:iHdyZQmGNMRuO3IGuJKY84cqJOgu3ddDMIdcRf6vBdbb4XwAvWXMYA>
    <xmx:iHdyZcpD-sUhqOWISE5fJoLYspXTZXj4CswlE4kxqIvAC7fFhVd1og>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Dec 2023 20:55:20 -0500 (EST)
From: Gary Rookard <garyrookard@fastmail.org>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH 3/5] staging: rtl8192e: renamed variable CCKOFDMRate
Date: Thu,  7 Dec 2023 20:55:34 -0500
Message-ID: <20231208015536.21013-4-garyrookard@fastmail.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231208015536.21013-1-garyrookard@fastmail.org>
References: <20231208015536.21013-1-garyrookard@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Coding style issue, checkpatch avoid CamelCase,
rename it. CCKOFDMRate -> cck_of_dm_rate

Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 633f735bdab1..73c0204303ec 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -116,13 +116,13 @@ static u16 ht_mcs_to_data_rate(struct rtllib_device *ieee, u8 mcs_rate)
 
 u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 data_rate)
 {
-	u16	CCKOFDMRate[12] = {0x02, 0x04, 0x0b, 0x16, 0x0c, 0x12, 0x18,
+	u16	cck_of_dm_rate[12] = {0x02, 0x04, 0x0b, 0x16, 0x0c, 0x12, 0x18,
 				   0x24, 0x30, 0x48, 0x60, 0x6c};
 	u8	is40MHz = 0;
 	u8	isShortGI = 0;
 
 	if (data_rate < 12)
-		return CCKOFDMRate[data_rate];
+		return cck_of_dm_rate[data_rate];
 	if (data_rate >= 0x10 && data_rate <= 0x1f) {
 		is40MHz = 0;
 		isShortGI = 0;
-- 
2.41.0

