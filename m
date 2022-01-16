Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22022C9D
	for <linux-staging@lists.linux.dev>; Sun, 16 Jan 2022 19:26:39 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id q25so2077921pfl.8
        for <linux-staging@lists.linux.dev>; Sun, 16 Jan 2022 11:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+an7IKXCzTHm4c2E+GDMSIDpCDQ46aOoF0DBIs1Sxew=;
        b=oMdJpG1xA/YwY0eaxDCNRpvT2JhA+XDMWTFoCCCOl2dYec0Qczbc8/zbD1RZoxKoWB
         RJ0CwLB9qULgDj1yN8vNwuQZasbwyuabCJjTuI78jQWGDiEnuRMM9HzdQSBq4HVk34+n
         3y/fjCWdW6pEpggH+fbqKdW9YIIOE28BGCC3ps+H6uDUqs8jAirY/0Sg7+XIPeVFFTkk
         zygpFHZaZ+c8LbzkMKQLDTyZGNO4Uv4vZNnGTvkRbOg39zVyyQZWmUSTglYdxUx8w+Dr
         J7I031NuWgqBai2CE4msg04OHLg0URDPC9l8Q3sBeEaKUFHZinSniPTtTUJ5qXa8zZz5
         HqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+an7IKXCzTHm4c2E+GDMSIDpCDQ46aOoF0DBIs1Sxew=;
        b=FaaikzKb12HgFO/nkNwqWfnVefrZAdXsLCOCQFIKAB0niWHkrh6FVig2EOG+VhsNRy
         qHLiymMxJlckHkMtuzFEXCAx5JIEXag4WYm4dR1H5zSW/FmVNofuHofEEhUJPrQfJKBD
         3ihwL2UKKr5SHEYHcj8d5bV3Oo8S441LjFlPjbLrMnicgt4PblqmN2zI+DgdVoOXxWOh
         pCf8tc0uhooQAkPzCEN01GtBCAPPCslg4Cz3a3AslxX3negumsHl5vyH9heB9RG7905R
         qOX7gzF92Myn45cKXxG3Oj+mMBwKZEnufskfR+agczLdDVofmSAasUaBiWjNw0UYNnJ1
         8kRw==
X-Gm-Message-State: AOAM5301Dk3Iad/ck/lLHgONxEtuKEzR9UOsKbGHoCAQxZ8k6+Wm7x7v
	8GBfefC1Vbs0oySKKUTPyzg=
X-Google-Smtp-Source: ABdhPJyCorLyOHoL+v6+t7fDcnQCr8n8tc4BiS/tIqwyTaIsw6rXyPsQE5JQGABwt26Edn+PmsFP3A==
X-Received: by 2002:a63:338c:: with SMTP id z134mr16055036pgz.459.1642361199173;
        Sun, 16 Jan 2022 11:26:39 -0800 (PST)
Received: from localhost.localdomain ([150.129.206.110])
        by smtp.gmail.com with ESMTPSA id v10sm7773823pfg.19.2022.01.16.11.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jan 2022 11:26:38 -0800 (PST)
From: Vihas Mak <makvihas@gmail.com>
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	martin@kaiser.cx,
	straube.linux@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vihas Mak <makvihas@gmail.com>
Subject: [PATCH] staging: r8188eu: handle rtw_init_netdev_name() failure appropriately
Date: Mon, 17 Jan 2022 00:56:11 +0530
Message-Id: <20220116192611.19224-1-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_init_netdev_name() calls dev_alloc_name() which allocates the name
for the device as per the given name format.
It returns a negative err code if the format is invalid. Currently the
name format is specified by the module parameter "ifname".
Warn the user if "ifname" is invalid.

Signed-off-by: Vihas Mak <makvihas@gmail.com>
---
 drivers/staging/r8188eu/os_dep/usb_intf.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index 91792dfd3..875815b5e 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -399,7 +399,10 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
 			DBG_88E("can't get autopm:\n");
 
 	/*  alloc dev name after read efuse. */
-	rtw_init_netdev_name(pnetdev, padapter->registrypriv.ifname);
+	if (rtw_init_netdev_name(pnetdev, padapter->registrypriv.ifname) < 0) {
+		DBG_88E("rtw_init_netdev_name failed, ifname:%s\n",
+			padapter->registrypriv.ifname);
+	}
 	rtw_macaddr_cfg(padapter->eeprompriv.mac_addr);
 	rtw_init_wifidirect_addrs(padapter, padapter->eeprompriv.mac_addr,
 				  padapter->eeprompriv.mac_addr);
-- 
2.30.2

