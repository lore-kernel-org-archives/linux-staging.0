Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220F97470
	for <linux-staging@lists.linux.dev>; Tue,  7 Feb 2023 18:16:45 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id g6so6457367wrv.1
        for <linux-staging@lists.linux.dev>; Tue, 07 Feb 2023 10:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xmsSrOMQzGqTbxYtpsoEwK2HkdTJeu+/aeeH05/7YqA=;
        b=f+B7pQ4/XQkQ7xXipcWRh+TiWMSG5gm+0GbkQ2PucRVLd5klKA4IccE30Bjb5wfER5
         BdfjS7WfwXh3H+5bYEFO8f8bJOVohx3NPUDuTe93N5OoXwXVKUKKtbPIblo5v616vYZI
         NY6R10SIxVBjSASTKC17GkimZ4C6IeXssgnGvvl+EF3ZEUjHtoZfuhnjJB8Jwwklw9xv
         qMgYTjxjCuwCHqSu09OEsBRxPmkMqkVIsR4x8Q/2PY4Cfg3oYK2re51nZvQ0gRvjWecY
         StpRTtcAEsYZNt1jYkKArxXfMMirP5QTgLrCcmFLVSrNYk3oDqDH7q+7VUYrdsK1u9qv
         T4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmsSrOMQzGqTbxYtpsoEwK2HkdTJeu+/aeeH05/7YqA=;
        b=zkz6o53Pt7xUAHQvI9onrX0pwxh1Z70I9/Xsc3dsMfh1VCfQ0BjDEGvJkq74TrJuHo
         VPfk6xdlQ4pjVnG52C6644CnWDaUWHKhAxmf2Tud5SGYHZyD7DxRoW5bjCI66+ZAKyfk
         TgsLDZ0+kb9wqRULE7qfR8QcJYSuJOaGP+pIXEah9t8P0OTn91WZu3Dh12miBCIng6BO
         EMBfr5yB0KGc9mhE6ohDnXxcj8vADWl7p5sA7K2YK4X+lyBmPH3dZElQcN/gZny+JNLi
         GdEzXwjvAFywdf7ejENf9Za40n629LNxLlEarPi6/8j8GoIgCxcVukf9/iVOsIZK4GTd
         1+oA==
X-Gm-Message-State: AO0yUKXXO8+YDNK/YiLfy1yY3du1GplhdNu6rrd0bWgBeCstOetRKdwm
	rQgQaqH3diLWD9FRhDGqjfI=
X-Google-Smtp-Source: AK7set+p+fuc0wTbFgAm+jOkR1yU0wq2yXJQnx5Qk4f0KSjukyV/d8krL0ixVB9BOhyK8r62fIe0Cw==
X-Received: by 2002:a5d:6707:0:b0:2c3:db5b:7277 with SMTP id o7-20020a5d6707000000b002c3db5b7277mr2621584wru.0.1675793803516;
        Tue, 07 Feb 2023 10:16:43 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id e2-20020a5d5002000000b002c3be6ae0b1sm11756528wrt.65.2023.02.07.10.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 10:16:42 -0800 (PST)
Date: Tue, 7 Feb 2023 19:16:39 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 04/10] staging: rtl8192e: Rename MacBlkCtrl and remove double
 definition
Message-ID: <8c0c46860fdb71660183fce567f7bc80e1d1ad36.1675792435.git.philipp.g.hortmann@gmail.com>
References: <cover.1675792435.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1675792435.git.philipp.g.hortmann@gmail.com>

Rename constant MacBlkCtrl to MAC_BLK_CTRL to avoid CamelCase which is
not accepted by checkpatch. Remove double definition.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c    | 2 +-
 drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h     | 2 +-
 drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h | 2 --
 drivers/staging/rtl8192e/rtl8192e/rtl_pm.c        | 2 +-
 4 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index cb455969f5dc..a2587300a47a 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1861,7 +1861,7 @@ void rtl92e_stop_adapter(struct net_device *dev, bool reset)
 
 
 			rtl92e_writeb(dev, PMR, 0x5);
-			rtl92e_writeb(dev, MacBlkCtrl, 0xa);
+			rtl92e_writeb(dev, MAC_BLK_CTRL, 0xa);
 		}
 	}
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
index 75ef179e28c4..795efa8d3181 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
@@ -242,7 +242,7 @@ enum _RTL8192PCI_HW {
 	DRIVER_RSSI		= 0x32c,
 	MCS_TXAGC		= 0x340,
 	CCK_TXAGC		= 0x348,
-	MacBlkCtrl		= 0x403,
+	MAC_BLK_CTRL		= 0x403,
 };
 
 #define GPI 0x108
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h
index 433272a2aae8..f846f109ed98 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h
@@ -42,8 +42,6 @@
 #define CCK_TXAGC		0x348
 
 /* Mac block on/off control register */
-#define MacBlkCtrl			0x403
-
 #define rFPGA0_RFMOD			0x800 /* RF mode & CCK TxSC */
 #define rFPGA0_TxInfo			0x804
 #define rFPGA0_PSDFunction		0x808
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_pm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_pm.c
index 82b45c61ac75..9c80dc1b6e12 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_pm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_pm.c
@@ -41,7 +41,7 @@ int rtl92e_suspend(struct device *dev_d)
 		rtl92e_writel(dev, WFCRC1, 0xffffffff);
 		rtl92e_writel(dev, WFCRC2, 0xffffffff);
 		rtl92e_writeb(dev, PMR, 0x5);
-		rtl92e_writeb(dev, MacBlkCtrl, 0xa);
+		rtl92e_writeb(dev, MAC_BLK_CTRL, 0xa);
 	}
 out_pci_suspend:
 	netdev_info(dev, "WOL is %s\n", priv->rtllib->bSupportRemoteWakeUp ?
-- 
2.39.1

