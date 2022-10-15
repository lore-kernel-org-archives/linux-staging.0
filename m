Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D6620E4
	for <linux-staging@lists.linux.dev>; Sat, 15 Oct 2022 15:11:35 +0000 (UTC)
Received: from ipservice-092-217-066-135.092.217.pools.vodafone-ip.de ([92.217.66.135] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ojip2-0006sp-Fk; Sat, 15 Oct 2022 17:11:32 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 02/10] staging: r8188eu: handle rtw_write8 errors in SwLedOn
Date: Sat, 15 Oct 2022 17:11:07 +0200
Message-Id: <20221015151115.232095-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221015151115.232095-1-martin@kaiser.cx>
References: <20221015151115.232095-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check the status returned by rtw_write8. Update bLedOn only if we could
update the REG_LEDCFG2 register.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_led.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index 5b214488571b..4f1cad890cae 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -34,7 +34,9 @@ static void SwLedOn(struct adapter *padapter, struct led_priv *pLed)
 	if (padapter->bDriverStopped)
 		return;
 
-	rtw_write8(padapter, REG_LEDCFG2, BIT(5)); /*  SW control led0 on. */
+	if (rtw_write8(padapter, REG_LEDCFG2, BIT(5)) != _SUCCESS)
+		return;
+
 	pLed->bLedOn = true;
 }
 
-- 
2.30.2

