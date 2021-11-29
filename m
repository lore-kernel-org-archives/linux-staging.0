Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837DD68
	for <linux-staging@lists.linux.dev>; Mon, 29 Nov 2021 00:20:55 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id m17so12810594qvx.8
        for <linux-staging@lists.linux.dev>; Sun, 28 Nov 2021 16:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EPmUBGthEhAXBl7E5PN7Ogq4bY2BAt5Q0BB0Vh1NhcM=;
        b=prGI3iWcoQiOwWQvkqLuxlNAkncfrqOWy/UXZR21tXudPxUvsOB3wHcpOeOf5HnQov
         17EoX8vQSUF1mSkNglPEF4EVo/9Kikmkc/8LVxRVP1Z2f0YDe4+L4wItgXFrHGuDjdP5
         f7a2AKmzt3dIwsCdlnVAf+dmcIL6JE4LB2B+W3A2zARbtCsefLiWtWH7yK4czRdIUXDf
         5AacrUtOhzvERt7Jt2btKTgTqF7OvW2NL9mNxg+NQqBqSmXuKR0UHqFrqzfLYcmLxxXU
         hX+tTGPzBJXyoWC9W0t9OcMWXqNrrkMWuWAADRpRTzGBUmEqHLCKbbvAMdpBVZafZt8O
         q+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EPmUBGthEhAXBl7E5PN7Ogq4bY2BAt5Q0BB0Vh1NhcM=;
        b=Qlupr88cy1s/VGuUEZ95AmH+8JHJrqAnexE4LYQXQEBzpPNJ6sIVM2+o7MaqkOH5MU
         nG/14hYBAmii4xwytvK1Aq2e/U/WZHO6Uz/gQh4i7db+zBCEGjz5lXyvDwWtt05Z9lXp
         9hiokr7bQxqYfWy8ronncJp/VFRHZNu2oi2ttBN/Z3IuB0FUNqVzwzNT6y68CawuxUTs
         ma75w0mxEYmFXFuoTf8iOIrlTKMXNfsgIQBAXAeo9mKdeZXmYkufikI3WcXlbPfhlbVG
         ACCXham5DAFUFETB+RO/4/nkOvKY/rOpR+f/3DCSv/twi7pnDz000Au3P58tb5X/Uh5S
         7rJg==
X-Gm-Message-State: AOAM53120DCyCDgq6ySwarLHsz3/x+jeDnXdkZSobtOs4j4T+PE7lvNa
	9Hi5kvATyMSDk3Rqo37oeJ+Aog==
X-Google-Smtp-Source: ABdhPJwHYPeHjgVg7jSsVmC74XZJOW13LP6zIp/zBgetAH6y/fWUlDiBKwCDrDgut89ojFr9vDteTQ==
X-Received: by 2002:a05:6214:13d1:: with SMTP id cg17mr26290469qvb.131.1638145254611;
        Sun, 28 Nov 2021 16:20:54 -0800 (PST)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id n74sm5681022qkn.83.2021.11.28.16.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 16:20:54 -0800 (PST)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] staging: r8188eu: convert DBG_88E_LEVEL calls in os_dep/ioctl_linux.c
Date: Mon, 29 Nov 2021 00:20:40 +0000
Message-Id: <20211129002041.865-7-phil@philpotter.co.uk>
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

Convert all DBG_88E_LEVEL macro calls in os_dep/ioctl_linux.c to plain
netdev_dbg calls, as although the information is potentially useful,
we should be exposing it using standard kernel debugging functionality.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 52d42e576443..90fcb74ef828 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -60,7 +60,7 @@ void rtw_indicate_wx_assoc_event(struct adapter *padapter)
 
 	memcpy(wrqu.ap_addr.sa_data, pmlmepriv->cur_network.network.MacAddress, ETH_ALEN);
 
-	DBG_88E_LEVEL(_drv_always_, "assoc success\n");
+	netdev_dbg(padapter->pnetdev, "assoc success\n");
 	wireless_send_event(padapter->pnetdev, SIOCGIWAP, &wrqu, NULL);
 }
 
@@ -73,7 +73,7 @@ void rtw_indicate_wx_disassoc_event(struct adapter *padapter)
 	wrqu.ap_addr.sa_family = ARPHRD_ETHER;
 	memset(wrqu.ap_addr.sa_data, 0, ETH_ALEN);
 
-	DBG_88E_LEVEL(_drv_always_, "indicate disassoc\n");
+	netdev_dbg(padapter->pnetdev, "indicate disassoc\n");
 	wireless_send_event(padapter->pnetdev, SIOCGIWAP, &wrqu, NULL);
 }
 
-- 
2.33.1

