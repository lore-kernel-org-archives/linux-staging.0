Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC7870
	for <linux-staging@lists.linux.dev>; Tue,  3 Aug 2021 22:36:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B829E60EBB;
	Tue,  3 Aug 2021 22:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628030214;
	bh=XqGUnp6HhB5XCqxFjh9U8lbifuggEtKCWvOnpHJsWdg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kxfn2O7iui9wxfFfavOHOI5qLm89L9mVA0HpEfcbq0NKuEm0ri8MLAXMnu/KlhZwb
	 ZSwlQ7gSykW56NnN1U/4I1KPiGPstQVy1/ak0BzSlm9WV7PsnOltncJLLBYT7POufu
	 hkoCPaesSuGQqAd1aPuB5dMq3sC8MF23w5IOI0o0Kyaso0jbzGNRg334BSKi5RvNPI
	 4F/1wt4S7dm9rcd0Ol+G/UK2k+uVtM/vXimcIkzsvfMHBffinQEYwDXALHDwU97o8o
	 zImJtHBE0vTQM9pL3u6wjmGDy4uTGMn6Sb0Btk5gg45eTkdpDQJbv16M1hKirdcs6I
	 srEg09bU6YyhQ==
From: Nathan Chancellor <nathan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Phillip Potter <phil@philpotter.co.uk>,
	Larry Finger <Larry.Finger@lwfinger.net>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 3/4] staging: r8188eu: Remove self assignment in get_rx_power_val_by_reg()
Date: Tue,  3 Aug 2021 15:36:08 -0700
Message-Id: <20210803223609.1627280-4-nathan@kernel.org>
X-Mailer: git-send-email 2.33.0.rc0
In-Reply-To: <20210803223609.1627280-1-nathan@kernel.org>
References: <20210803223609.1627280-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

Clang warns:

drivers/staging/r8188eu/hal/rtl8188e_rf6052.c:344:13: warning:
explicitly assigning value of variable of type 'u32' (aka 'unsigned
int') to itself [-Wself-assign]
                        writeVal = writeVal;
                        ~~~~~~~~ ^ ~~~~~~~~
1 warning generated.

Remove this branch as it is useless.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/staging/r8188eu/hal/rtl8188e_rf6052.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
index 335b120ce603..77889dc05858 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
@@ -340,8 +340,6 @@ static void get_rx_power_val_by_reg(struct adapter *Adapter, u8 Channel,
 		/*  This mechanism is only applied when Driver-Highpower-Mechanism is OFF. */
 		if (pdmpriv->DynamicTxHighPowerLvl == TxHighPwrLevel_BT1)
 			writeVal = writeVal - 0x06060606;
-		else if (pdmpriv->DynamicTxHighPowerLvl == TxHighPwrLevel_BT2)
-			writeVal = writeVal;
 		*(pOutWriteVal+rf) = writeVal;
 	}
 }
-- 
2.33.0.rc0

