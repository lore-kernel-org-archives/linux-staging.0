Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EE67477
	for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 18:09:27 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-50bfd66ba3eso2578245a12.0
        for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 11:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684001365; x=1686593365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CmA/3ovmaGe5dWQW+NLjn0vPr5rS/Ohpr12MEunuBaM=;
        b=LBz3jPLeKCK6RJpCX7HTpolOd1zS12HKWhl39VsPHtyhjWYdQ4NtKJtJLg5lo57BmK
         8U5yJbvSju/pmenELtNqU3bW8iIK8dCDyjb0HR9EfHvVcyuKeGPEnEooxV8EXWokFrhj
         AYSLV/JAFO3qx4vqivyPXkMlO9wTKFsrNogJIUzuyJ5xuRUbmwJwqLXxakD3oORCKuUV
         k6bmVizf8OeP4fzVapBaauMilJetkyvcueGndWtbgmY42E49swdJeyIPaN5BiSRdLq7j
         9+adubpVtiyA2XYdMXFMSC3WTzplX/KfwRhtDB4ipQbUiE68FxuehSBJe2gW9eHHS43U
         1JfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684001365; x=1686593365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmA/3ovmaGe5dWQW+NLjn0vPr5rS/Ohpr12MEunuBaM=;
        b=BmhbtCkiI7JrmeyjaGFfgZk0uJAS6F8iMLw3ywVaB71vxlun6cv6QNAf+zTnPz+C+M
         ruMUjkOloANYALs5OWEpkVCq9/Lj4Q2CECFCnmZoIw9rdViKrfRoP/TI9l4BAl39zVB/
         8C83rGK/XVB5Rnxqtry4CmmOO/ez13iIVTllD86zuAj+ibL5iO5v7naF8oW4mV3LAJau
         y5kLBpeRzVOk7+sxpk1OyUkFiUTaNuEMvyRA2lfTUY3KfZphvdxbvMO/ENMymWEbVuxH
         q1NxBtIqfd4bnfJxFURCWrtjobpKjVipYUs+CWbX43YsXC9hLsvdoGq6AVl/nnUfE20S
         2/jg==
X-Gm-Message-State: AC+VfDzgAav3Puh6vsRdzbz76eZxgg8c3/P7Dq6PFS7Frg9h7qYn06IX
	LuPTEdPyV36htMKlvzI0d2Y=
X-Google-Smtp-Source: ACHHUZ6xg1n4MHIZ0/r7v9eCEhrd0yFtS1SRMjCiO1k+HvzW50ns4eSb6I48NXe48zTcv0hSdQEpzA==
X-Received: by 2002:a17:906:7a50:b0:94a:5f0d:d9d6 with SMTP id i16-20020a1709067a5000b0094a5f0dd9d6mr23905006ejo.4.1684001365267;
        Sat, 13 May 2023 11:09:25 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935e01.dip0.t-ipconnect.de. [87.147.94.1])
        by smtp.gmail.com with ESMTPSA id e26-20020a170906845a00b00965cd15c9bbsm7086908ejy.62.2023.05.13.11.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 11:09:24 -0700 (PDT)
Date: Sat, 13 May 2023 20:09:23 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] staging: rtl8192e: Remove undefined function
 SetFwCmdHandler
Message-ID: <e141f44176aab38e11d7211ed79cebda68aea5ed.1683960685.git.philipp.g.hortmann@gmail.com>
References: <cover.1683960684.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1683960684.git.philipp.g.hortmann@gmail.com>

Remove function SetFwCmdHandler as it is not defined.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c |  1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_ps.c   | 13 +++----------
 drivers/staging/rtl8192e/rtllib.h            |  2 --
 3 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index b58a30d68f2f..3f8a58e32930 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -734,7 +734,6 @@ static void _rtl92e_init_priv_handler(struct net_device *dev)
 
 	priv->rtllib->SetHwRegHandler = rtl92e_set_reg;
 	priv->rtllib->AllowAllDestAddrHandler = rtl92e_set_monitor_mode;
-	priv->rtllib->SetFwCmdHandler = NULL;
 	priv->rtllib->InitialGainHandler = rtl92e_init_gain;
 	priv->rtllib->rtllib_ips_leave_wq = rtl92e_rtllib_ips_leave_wq;
 	priv->rtllib->rtllib_ips_leave = rtl92e_rtllib_ips_leave;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c b/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
index 5a1cd22f5e25..54a21c14cc75 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
@@ -217,12 +217,8 @@ void rtl92e_leisure_ps_enter(struct net_device *dev)
 	if (psc->bLeisurePs) {
 		if (psc->LpsIdleCount >= RT_CHECK_FOR_HANG_PERIOD) {
 
-			if (priv->rtllib->ps == RTLLIB_PS_DISABLED) {
-				if (priv->rtllib->SetFwCmdHandler)
-					priv->rtllib->SetFwCmdHandler(dev, FW_CMD_LPS_ENTER);
-				_rtl92e_ps_set_mode(dev, RTLLIB_PS_MBCAST |
-							 RTLLIB_PS_UNICAST);
-			}
+			if (priv->rtllib->ps == RTLLIB_PS_DISABLED)
+				_rtl92e_ps_set_mode(dev, RTLLIB_PS_MBCAST | RTLLIB_PS_UNICAST);
 		} else
 			psc->LpsIdleCount++;
 	}
@@ -235,10 +231,7 @@ void rtl92e_leisure_ps_leave(struct net_device *dev)
 					&priv->rtllib->pwr_save_ctrl;
 
 	if (psc->bLeisurePs) {
-		if (priv->rtllib->ps != RTLLIB_PS_DISABLED) {
+		if (priv->rtllib->ps != RTLLIB_PS_DISABLED)
 			_rtl92e_ps_set_mode(dev, RTLLIB_PS_DISABLED);
-			if (priv->rtllib->SetFwCmdHandler)
-				priv->rtllib->SetFwCmdHandler(dev, FW_CMD_LPS_LEAVE);
-		}
 	}
 }
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index cc1ce106678c..6c1f56324bd6 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1714,8 +1714,6 @@ struct rtllib_device {
 	bool (*GetHalfNmodeSupportByAPsHandler)(struct net_device *dev);
 	u8   (*rtllib_ap_sec_type)(struct rtllib_device *ieee);
 	void (*InitialGainHandler)(struct net_device *dev, u8 Operation);
-	bool (*SetFwCmdHandler)(struct net_device *dev,
-				enum fw_cmd_io_type FwCmdIO);
 	void (*UpdateBeaconInterruptHandler)(struct net_device *dev,
 					     bool start);
 	void (*ScanOperationBackupHandler)(struct net_device *dev,
-- 
2.40.1

