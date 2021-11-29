Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83B668
	for <linux-staging@lists.linux.dev>; Mon, 29 Nov 2021 00:20:52 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id n15so14813152qta.0
        for <linux-staging@lists.linux.dev>; Sun, 28 Nov 2021 16:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NWqlL7LjDLDM5yhDSFf11J4TVTC5sLPGqtfWz0BcMXc=;
        b=xttGO0O88Ccol9n53dcDEoo2oBgoWWIB9SCwknAzFN6OPm89uxBWIp5moq0qrRdSQQ
         EcyZXKnx72R/+fPeEx1S9/ckML70O+lNciITaXo4YKPy7JBkkzpQG5G9GRDU7yHMjjIQ
         wnixl4STR0PqDLtkhk44raStuMiZCgmwEIXfR0Tqfa+yF82J0flmu1Dqb5Z7jXSlhvA6
         hW2UoNiq0Y7e8CxjjrcI3fAUOxHOEoPjf0olMUoMheApAIcr9QFIqZwkK4iAnztDt9Ut
         P0OEIpMbXxTImC6I9kM7Epik8jHq4dE4wTEYrYjDMgsbTPa99XNnR9cRYbhMvg/ZKO+X
         lVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NWqlL7LjDLDM5yhDSFf11J4TVTC5sLPGqtfWz0BcMXc=;
        b=jNDECAUNoEV9od/ulZDliVvX+psem29dsBzgJYkNA0P6aMzHDDYBJPC9ms83Tm96kJ
         VGOrGqKMaJskwrg0sVMsje21MAVsXFVAyJ6rAQ0r62S7/akLVSNYbZwrNRki4j6xfXgn
         PLMS1s9b3Zaa2ZU4L47N09+z9lMVkDPLEQ+cglgdwanpGY/tpAgjfseNaiiNRsEqKIPO
         2MA61KP+9hmGK/nK2mC1CmT7UaGnO0ZKgXuApn6Y6n0u3D82xPwElgAAeyV1H92PZc2P
         bxOP4Z/MAmsRh50y2j3ZL2OOegRcFfsVKcJFi9euScE2x4cnkbtlBfqgrO5q2X9SpSdQ
         QkPA==
X-Gm-Message-State: AOAM531BL9FlTvcTGVtH/Dj0IpRXQLx0sULOLWMiLl3en6YNcLLvNpdD
	NSIkxlfAZdLbfJz0dJXdY6RSaw==
X-Google-Smtp-Source: ABdhPJzNSCZ6++ZAoYjgo5WEg50WvGHqF21OuA0pztWasKxIoylla4JCUaSdgmn8ckOaw2jRgOxwzQ==
X-Received: by 2002:ac8:5542:: with SMTP id o2mr31318886qtr.670.1638145251894;
        Sun, 28 Nov 2021 16:20:51 -0800 (PST)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id n74sm5681022qkn.83.2021.11.28.16.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 16:20:51 -0800 (PST)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] staging: r8188eu: convert DBG_88E_LEVEL calls in core/rtw_ioctl_set.c
Date: Mon, 29 Nov 2021 00:20:38 +0000
Message-Id: <20211129002041.865-5-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211129002041.865-1-phil@philpotter.co.uk>
References: <20211129002041.865-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert all DBG_88E_LEVEL macro calls in core/rtw_ioctl_set.c to plain
netdev_dbg calls, as although the information is potentially useful,
we should be exposing it using standard kernel debugging functionality.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/core/rtw_ioctl_set.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ioctl_set.c b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
index 84c320d4a478..eadfbdb94dd5 100644
--- a/drivers/staging/r8188eu/core/rtw_ioctl_set.c
+++ b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
@@ -110,7 +110,7 @@ u8 rtw_set_802_11_bssid(struct adapter *padapter, u8 *bssid)
 	u32 cur_time = 0;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
-	DBG_88E_LEVEL(_drv_info_, "set bssid:%pM\n", bssid);
+	netdev_dbg(padapter->pnetdev, "set bssid:%pM\n", bssid);
 
 	if ((bssid[0] == 0x00 && bssid[1] == 0x00 && bssid[2] == 0x00 &&
 	     bssid[3] == 0x00 && bssid[4] == 0x00 && bssid[5] == 0x00) ||
@@ -185,8 +185,8 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct wlan_network *pnetwork = &pmlmepriv->cur_network;
 
-	DBG_88E_LEVEL(_drv_info_, "set ssid [%s] fw_state=0x%08x\n",
-		      ssid->Ssid, get_fwstate(pmlmepriv));
+	netdev_dbg(padapter->pnetdev, "set ssid [%s] fw_state=0x%08x\n",
+		   ssid->Ssid, get_fwstate(pmlmepriv));
 
 	if (!padapter->hw_init_completed) {
 		status = _FAIL;
-- 
2.33.1

