Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890C36110
	for <linux-staging@lists.linux.dev>; Mon,  6 Feb 2023 20:18:22 +0000 (UTC)
Received: from ipservice-092-217-084-033.092.217.pools.vodafone-ip.de ([92.217.84.33] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pP7wJ-0007ps-9E; Mon, 06 Feb 2023 21:18:11 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 5/6] staging: r8188eu: handle rtl8188eu_inirp_init errors
Date: Mon,  6 Feb 2023 21:17:59 +0100
Message-Id: <20230206201800.139195-6-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230206201800.139195-1-martin@kaiser.cx>
References: <20230206201800.139195-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rtl8188eu_inirp_init returns 0 for success or a negative error code.
Handle this return value in the two places where rtl8188eu_inirp_init is
called.

Suggested-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/os_dep/os_intfs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index e48dbdfefedb..bd3c17f580c8 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -631,7 +631,8 @@ static int _netdev_open(struct net_device *pnetdev)
 			pr_info("can't init mlme_ext_priv\n");
 			goto netdev_open_error;
 		}
-		rtl8188eu_inirp_init(padapter);
+		if (rtl8188eu_inirp_init(padapter))
+			goto netdev_open_error;
 
 		rtw_led_control(padapter, LED_CTL_NO_LINK);
 
@@ -683,7 +684,8 @@ static int  ips_netdrv_open(struct adapter *padapter)
 	if (status == _FAIL)
 		goto netdev_open_error;
 
-	rtl8188eu_inirp_init(padapter);
+	if (rtl8188eu_inirp_init(padapter))
+		goto netdev_open_error;
 
 	rtw_set_pwr_state_check_timer(&padapter->pwrctrlpriv);
 	_set_timer(&padapter->mlmepriv.dynamic_chk_timer, 5000);
-- 
2.30.2

