Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143E83FC3
	for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 17:54:46 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id i24so2511683pfo.12
        for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 10:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=aNdAt3bIyCf0OKCvnDHfldR4f9Z2Y9u67akOXp3+z54=;
        b=ZAvsshhZZBaZiHNl9M8e9qw1Sp8NuOS5+VedetlWLCqPs5SMzt5OJPHeX/dDDI7Q8m
         A2SiSKiJmI/y/keXRa8fNt3mr1U5I6Pjs0Ia60LfIn39mvgqgKC2KYTnvCXOxAJqqqqk
         qRp37zb7dVXk4s/zaVNP0WMCbD/un1Y8U3X+qaTJZId97lT5Vs75kSkeHgFU7BlfSrap
         Kkb+hyXk4ztYMWkQ/fWALZ37x+2lGV8brRgNqRd87QoaAggxF+05rvhqujhTJrp7LbWy
         MiX5l6g1w4bciKVlveZfJGMHvq4byU44BGcuxXf8f1J/KWB5WZ9yACLI+fAOAuYWwMpa
         oalg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=aNdAt3bIyCf0OKCvnDHfldR4f9Z2Y9u67akOXp3+z54=;
        b=4EmziB7ii9F+NTf05kDBwtRvyLHLenEm7sTjHEz8njbrE3Y3aLkdsGw76I54HovDkc
         3jvwcGwqcNqcudtwmz4TRXb+bXXlx/a1yI4cPcD2izlHhRziTLh05QbAI0Oxv9wHACfQ
         gTQng9wmLt4OOAMlGBMWlkq+hz3IsMFuLi1QTcmIjoiAf9mdgHgl9CmsGxNE6T47/W9Z
         rQ0XcS1XL7MNIAfvRareItffpxdhzE7rJKb5fyAy6KIdcpCss/dNvvmYNw6GIgs17Lcj
         Ge3rJcyM0wSYNUMX4cjH7uLAeVKGXHlp7PqoUfg0eH5BOVVLfogYgSWZzjjdUXG0chkS
         DQeQ==
X-Gm-Message-State: AOAM531nU3l2I0yNE82HRvL5iP2Temiwzm+rCp9oSgLKbDR5KsQCf9Bm
	tuyMvFaX0nMM9TLudQDxoA8=
X-Google-Smtp-Source: ABdhPJwR236U1teahdmj4d8BkQvVQ4ygrxUYFsq342vIic5uJhW63bhYrd3OuLYLvFH8SRBibynpBQ==
X-Received: by 2002:a63:33cb:: with SMTP id z194mr8370058pgz.380.1631296485508;
        Fri, 10 Sep 2021 10:54:45 -0700 (PDT)
Received: from user ([117.98.200.228])
        by smtp.gmail.com with ESMTPSA id h8sm5550218pfr.219.2021.09.10.10.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 10:54:45 -0700 (PDT)
Date: Fri, 10 Sep 2021 23:24:39 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: r8188eu: core: remove the function
 power_saving_wk_hdl
Message-ID: <YTub30ZRG3oLbxQW@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove the function power_saving_wk_hdl() as it just calling
the rtw_ps_processor().Instead of power_saving_wk_hdl() call directly
rtw_ps_processor().

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index ce73ac7cf973..35e6a943c556 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -1669,11 +1669,6 @@ u8 rtw_antenna_select_cmd(struct adapter *padapter, u8 antenna, u8 enqueue)
 	return res;
 }

-static void power_saving_wk_hdl(struct adapter *padapter, u8 *pbuf, int sz)
-{
-	 rtw_ps_processor(padapter);
-}
-
 #ifdef CONFIG_88EU_P2P
 u8 p2p_protocol_wk_cmd(struct adapter *padapter, int intCmdType)
 {
@@ -1941,7 +1936,7 @@ u8 rtw_drvextra_cmd_hdl(struct adapter *padapter, unsigned char *pbuf)
 		dynamic_chk_wk_hdl(padapter, pdrvextra_cmd->pbuf, pdrvextra_cmd->type_size);
 		break;
 	case POWER_SAVING_CTRL_WK_CID:
-		power_saving_wk_hdl(padapter, pdrvextra_cmd->pbuf, pdrvextra_cmd->type_size);
+		rtw_ps_processor(padapter);
 		break;
 	case LPS_CTRL_WK_CID:
 		lps_ctrl_wk_hdl(padapter, (u8)pdrvextra_cmd->type_size);
--
2.32.0

