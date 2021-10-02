Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499CE3FDE
	for <linux-staging@lists.linux.dev>; Sat,  2 Oct 2021 14:42:50 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so1257354pjc.3
        for <linux-staging@lists.linux.dev>; Sat, 02 Oct 2021 07:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=t0Eu+or4Zx1l/oph1/ldEs4+NBM0UXePlavm40JzuOw=;
        b=n1tBbcxo1UuzwW2C0/tMbR/wIjpcQLgxq/HNZ3l1PqrJ34OaPqIlZ8pGRJcsu2Wrex
         XnewG+oNVmxOQqWh4hPRMMTa3UkT3YKKcwM20omSOe6Jc/HLWKoCuG1R4xfzhAyHDDgw
         L5QJruf7D9WrrroUBO7AkFMtM22ntxfe0w1BLCwUp56+dcE4DVn/kuSt94yXH8npkzFL
         yFTw9jGBnu6QjfSvJf50LXVuotjZEHSOQDvUWhsKtK88dT3KutLCvT5Sg0U6yRzO9Udp
         4tvTUxtJIsErwbm40SlqKYXMOO4T2vjBtfKYIHyt3v2BpbWKCCbDDM0u+fGihH3ar2em
         7EIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=t0Eu+or4Zx1l/oph1/ldEs4+NBM0UXePlavm40JzuOw=;
        b=mT0/NHi+nXVjcN5wrA1LAqAIquoFkqnsY2yljoVF7Cf0g9I60CtnCYdIbGSfHP2/0g
         /pMkafE6RvPin2J1LJdYk9NX0Zo06K25kMFh2R7BHljRWnv8vsMXqhgFoC+toNWDtvDe
         BrVL0NDTTIrPlkYnC+xinVqz71CWt0zb7aWr5HSEcPYOdkXbXE7HpQpX6qQLGvfqZ+FK
         7F6JdZKvyfyc6uXmcuz++10qRpTNWxGSzUYQl3FCjrABxCxdHpggZccQsyxHU2XbDssP
         o40uwj18NrI8vQyIJea7OigYbWnxk1kcidxCdBQkj8SLx1Mt2d3K80Xrqrun4x2VWCT9
         j5OA==
X-Gm-Message-State: AOAM530hLi/A8S5xG3vp6cv6qO4OVX7RD0C+Tt1GsKRyZ9LI5nlSh0Ap
	mC+T2/sy33dmrjbuo3KggYQ=
X-Google-Smtp-Source: ABdhPJxgkSZn8MkgT6RrTefgWBBoPg/oHtnlXzWlFQK/RnxQJmdB3QwPaM7Csa1csFrUvEF6r429ug==
X-Received: by 2002:a17:90a:307:: with SMTP id 7mr19673013pje.176.1633185769726;
        Sat, 02 Oct 2021 07:42:49 -0700 (PDT)
Received: from user ([223.230.105.60])
        by smtp.gmail.com with ESMTPSA id i12sm9261448pgd.56.2021.10.02.07.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 07:42:49 -0700 (PDT)
Date: Sat, 2 Oct 2021 20:12:44 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, straube.linux@gmail.com,
	fmdefrancesco@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: r8188eu: core: remove power_saving_wk_hdl function
Message-ID: <YVhv5JiHovfdpNGg@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove function power_saving_wk_hdl is it just calling rtw_ps_processor.
Instead of power_saving_wk_hdl() call  rtw_ps_processor().

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 3a70776f3304..44a1df4f51d1 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -1649,11 +1649,6 @@ u8 rtw_antenna_select_cmd(struct adapter *padapter, u8 antenna, u8 enqueue)
 	return res;
 }

-static void power_saving_wk_hdl(struct adapter *padapter, u8 *pbuf, int sz)
-{
-	 rtw_ps_processor(padapter);
-}
-
 u8 p2p_protocol_wk_cmd(struct adapter *padapter, int intCmdType)
 {
 	struct cmd_obj	*ph2c;
@@ -1890,7 +1885,7 @@ u8 rtw_drvextra_cmd_hdl(struct adapter *padapter, unsigned char *pbuf)
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

