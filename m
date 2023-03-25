Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCEC1840
	for <linux-staging@lists.linux.dev>; Sat, 25 Mar 2023 08:35:49 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id eg48so16417767edb.13
        for <linux-staging@lists.linux.dev>; Sat, 25 Mar 2023 01:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679733347; x=1682325347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OtIYOlrEQ6ezmFUmDEHNM3uU5E+lWona9mVF/nvcfZ8=;
        b=dlCMbDJFvAx5eJsoyWDnb8bGX9oUMgTZX/0FamcM+s9vtXAFihUgrJah6WDD3LKRyy
         kzGa6PRSs1Tk6fKaH69zeKiodA5uqR2BoCyAgsCr/LuAGys4fnrwRPXcicr1yijNkLIJ
         TgCMHq7sZBNgibwQ+YU0uaWF3HOGmau//FWI2AfPkJNMrNAUGNMObVSFeaw41ysHlvRW
         TRr3iaeKSlSK6+cCbHhXbqqO7VjiEetFD9sK4+GJyQMqzag6DQp/24tBXPQof8t6kReZ
         6EWxsw02e1vWRB3LnQppnbu12Fmh6f16RlSWWD9DIRt6tgkDVTW7irEN5oFlQB++iFTL
         NTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679733347; x=1682325347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OtIYOlrEQ6ezmFUmDEHNM3uU5E+lWona9mVF/nvcfZ8=;
        b=ai3pJi94TgsbxKEnjwJHXWxOOiSJizo0EvA09/Qh6BLhy2jzlPDgZ/UE8SGQ8rvVxh
         cEw310RJkEP2qd/vJosM0O1F/FwUo/yi2tXhxV0UNCESW3N5M5n5Tlz+6sKeVdHSsS6A
         a4rn35K4O9kHY3azRVaphiwiatM74lK6rWbvOVsGUdPWiWL6oz7+Qi8WsloIrmX4eJVM
         JCxe9JzZolQFR1urPIjqgJw8wlHtTOiZiFedWQ6y/D2+dCHK+lrK6NkrQzDGdXEdZ8fG
         kyWpk6V8AYTWAPR1VqCKklF9LTLftNQacWMaa6YOeW7JvMNtk9rJBCCei14qgRa1Z0RN
         QdhA==
X-Gm-Message-State: AAQBX9d0OMVvJB7rdcRMvMB7ZJA0QC8TnGq1TRUdpNK+HHnphk/M0WDU
	MvkG7MeUfcvwbPv9xEvZ4mM=
X-Google-Smtp-Source: AKy350Zu03goyVTjXDhMxOEDqqc5iF0P/X4FQg4fZyRTd/jl9FvVZ+lUgnmQ6SLI5VT7zQeKmEj6tQ==
X-Received: by 2002:a17:906:209e:b0:8d3:be84:1cc6 with SMTP id 30-20020a170906209e00b008d3be841cc6mr4172218ejq.3.1679733347206;
        Sat, 25 Mar 2023 01:35:47 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id qb16-20020a1709077e9000b0093f3d41b9ebsm683134ejc.220.2023.03.25.01.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 01:35:46 -0700 (PDT)
Date: Sat, 25 Mar 2023 09:35:45 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 03/11] staging: rtl8192e: Remove priv->rf_chip in
 rtl92e_set_tx_power
Message-ID: <190d0a77602cb89bc24512c99b72f25f4ca5d5e2.1679732276.git.philipp.g.hortmann@gmail.com>
References: <cover.1679732276.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1679732276.git.philipp.g.hortmann@gmail.com>

priv->rf_chip is initialized to RF_8256 and never changed. Remove
condition in function rtl92e_set_tx_power as it is dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index acd1e1869d78..6579c7b81bfd 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -485,19 +485,8 @@ void rtl92e_set_tx_power(struct net_device *dev, u8 channel)
 		powerlevelOFDM24G = priv->tx_pwr_level_ofdm_24g[channel - 1];
 	}
 
-	switch (priv->rf_chip) {
-	case RF_8225:
-		break;
-	case RF_8256:
-		rtl92e_set_cck_tx_power(dev, powerlevel);
-		rtl92e_set_ofdm_tx_power(dev, powerlevelOFDM24G);
-		break;
-	case RF_8258:
-		break;
-	default:
-		netdev_err(dev, "Invalid RF Chip ID.\n");
-		break;
-	}
+	rtl92e_set_cck_tx_power(dev, powerlevel);
+	rtl92e_set_ofdm_tx_power(dev, powerlevelOFDM24G);
 }
 
 bool rtl92e_config_phy(struct net_device *dev)
-- 
2.39.2

