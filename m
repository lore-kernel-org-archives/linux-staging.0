Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B525C7B
	for <linux-staging@lists.linux.dev>; Sat, 11 Mar 2023 21:51:27 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id o12so34443038edb.9
        for <linux-staging@lists.linux.dev>; Sat, 11 Mar 2023 13:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678571486; x=1681163486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tPkEkboXCEvGQOJLs4aF6ZhqJfv9Ne9y1/jeaB9rp0I=;
        b=FtDYtRmYudyXOa6xRqhPbHyRbYf0JybwghD58q/7JcyzUrHKjYrShq6EpUcS511R6r
         UMTkCiSqzisx95d30p2f8+qlwg4gor0JLj05gKTRCuiC4gHsP8V1z9ng29Pq2UCOhLRB
         ZxDdRS1nIqOydXAADA7zl9A7pL16vDUvTcUmQ+6NR0/C5iUN8fCcSvXKf3z64VRdPPsk
         Ss8nc/c2w+x3UavBPllw99x2gMiyrwjGImK8LzTdG62UBI/Z2qt/8EYntT9zSiDazOKq
         PU/EB3E+boklwoELUEI6U7eL85w3riKoBuROUySrwnLlHDAACr4GoRjNhFI+CCrtFONJ
         yfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678571486; x=1681163486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPkEkboXCEvGQOJLs4aF6ZhqJfv9Ne9y1/jeaB9rp0I=;
        b=vHnjmv2V5Ex2MZJBOe1OYXRTNiiwyTZS3RWKpmFKppgG7vgy18wJjPzc/KrL2bjoUG
         Xpzvq+7rZu3YDZ+HnJBarnUTdvCv4D/vYDywTQ1RhCPlWoJV2THnYol3/r8LPDTCXf12
         NfAabL0kefrJM05G01ttxzpBX2CtGvbqK46+hWB7tJVD5cuuykaVwuIoNERw4g/W4L+l
         e0U0Y1dtqamRheBOslTPH0qPaYYq6+O5SAssEPQMrfHjIYG/oGPX38rh9NDjtaWe1czz
         ESm1EARuSITElEARtzN5mzC9bvaiIGyIf8jvkIrix5e3miVbWMdoBjP1+uPAoQph85Mc
         Zavg==
X-Gm-Message-State: AO0yUKWsPF7sjhrR+yPUsMn02p3zlJwDLYa0nd/2cocX2LGDaAAv7pWd
	VQ7aqZWnH76ewLATlGs5h0alnoH0lpc=
X-Google-Smtp-Source: AK7set+KSxeA2XX82oS+cOYzeFW2kH1OcfNVnVtYJZt3RpnK5l9bcAzeMbrps6pBQwVDXX7gD/DtOA==
X-Received: by 2002:a05:6402:280b:b0:4bc:edde:14e2 with SMTP id h11-20020a056402280b00b004bcedde14e2mr7419460ede.0.1678571485984;
        Sat, 11 Mar 2023 13:51:25 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id z13-20020a50cd0d000000b004acbda55f6bsm1640543edi.27.2023.03.11.13.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 13:51:25 -0800 (PST)
Date: Sat, 11 Mar 2023 22:51:23 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 05/12] staging: rtl8192e: Remove unused RF90_PATH_C and ..D
 for rf3wireOffset
Message-ID: <180723eee77f70ffda1f8f0656c2f256f005c4ef.1678569965.git.philipp.g.hortmann@gmail.com>
References: <cover.1678569965.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678569965.git.philipp.g.hortmann@gmail.com>

Remove unused priv->phy_reg_def[RF90_PATH_C].rf3wireOffset and
priv->phy_reg_def[RF90_PATH_D].rf3wireOffset.
rf3wireOffset is used in _rtl92e_phy_rf_read and _rtl92e_phy_rf_write
which are used in:
rtl92e_set_rf_reg and rtl92e_get_rf_reg are used in:
rtl92e_set_bandwidth (eRFPath only for 0 and 1)
rtl92e_config_rf (eRFPath only for 0 and 1)
_rtl92e_phy_switch_channel_step (eRFPath only for 0 and 1)
_rtl92e_dm_check_tx_power_tracking_thermal (eRFPath only for 0)
rtl92e_check_bb_and_rf is used in:
rtl92e_config_rf (eRFPath only for 0 and 1)
_rtl92e_bb_config_para_file (eRFPath only for 0)
rtl92e_config_rf_path is used in:
rtl92e_config_rf (eRFPath only for 0 and 1)
Remove dead code and constants.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c    | 2 --
 drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index a0dd628b1bf5..1013ab95bc7b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -367,8 +367,6 @@ static void _rtl92e_init_bb_rf_reg_def(struct net_device *dev)
 
 	priv->phy_reg_def[RF90_PATH_A].rf3wireOffset = rFPGA0_XA_LSSIParameter;
 	priv->phy_reg_def[RF90_PATH_B].rf3wireOffset = rFPGA0_XB_LSSIParameter;
-	priv->phy_reg_def[RF90_PATH_C].rf3wireOffset = rFPGA0_XC_LSSIParameter;
-	priv->phy_reg_def[RF90_PATH_D].rf3wireOffset = rFPGA0_XD_LSSIParameter;
 
 	priv->phy_reg_def[RF90_PATH_A].rfLSSI_Select = rFPGA0_XAB_RFParameter;
 	priv->phy_reg_def[RF90_PATH_B].rfLSSI_Select = rFPGA0_XAB_RFParameter;
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h
index ec39de9e89fe..19acc44648e1 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h
@@ -58,8 +58,6 @@
 #define rFPGA0_XD_HSSIParameter2	0x83c
 #define rFPGA0_XA_LSSIParameter		0x840
 #define rFPGA0_XB_LSSIParameter		0x844
-#define rFPGA0_XC_LSSIParameter		0x848
-#define rFPGA0_XD_LSSIParameter		0x84c
 #define rFPGA0_RFWakeUpParameter	0x850
 #define rFPGA0_RFSleepUpParameter	0x854
 #define rFPGA0_XAB_SwitchControl	0x858
-- 
2.39.2

