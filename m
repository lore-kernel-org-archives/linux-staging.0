Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2B170
	for <linux-staging@lists.linux.dev>; Thu,  5 Aug 2021 18:58:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 750F460F42;
	Thu,  5 Aug 2021 18:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628189923;
	bh=gOZlffGUr2e48j1pwi3Riunv2adJDJXK/fbCwjsuipw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ao+LtVb+/IULGN8TUo13q3iLIOHKMAE//59ktRtaCajNQWxM2uhVFiYi8M3+8FqgP
	 Zar2gQhxICw3Tcr15tpTiB2xCyvCS5o4hT9yUCTXCTIMbFOnKYSb022f/F+gu0ALuK
	 M7kHQukc6uf5gn0qUb/dfvs5FGNuZzcwbFb2zjraqgraZi6CE8NDa6QNoIw+kzNxsE
	 6sYXb13OM3Nshrd2snNCAB0UV4KYNetmfyAfIyX8OSwK3OtNczXhG+CDDzvFHCBcPm
	 wdFP3gLliauHm0wvcrVRrxUVa9cOBTSyIr4Y+vIR2ItC5J/Bf/LgQoII6zQzk30Vau
	 6y2XSY8ghhYjA==
From: Nathan Chancellor <nathan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Phillip Potter <phil@philpotter.co.uk>,
	Larry Finger <Larry.Finger@lwfinger.net>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2 2/3] staging: r8188eu: Remove self assignment in get_rx_power_val_by_reg()
Date: Thu,  5 Aug 2021 11:58:06 -0700
Message-Id: <20210805185807.3296077-3-nathan@kernel.org>
X-Mailer: git-send-email 2.33.0.rc0
In-Reply-To: <20210805185807.3296077-1-nathan@kernel.org>
References: <20210803223609.1627280-1-nathan@kernel.org>
 <20210805185807.3296077-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
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
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
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

