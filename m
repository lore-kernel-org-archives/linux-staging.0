Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74402C80
	for <linux-staging@lists.linux.dev>; Mon,  6 Dec 2021 23:50:04 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id i12so9377910wmq.4
        for <linux-staging@lists.linux.dev>; Mon, 06 Dec 2021 15:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+KkN0+8pgG8zTFzGCoaxzADvB5HXfrcxguAyCm0k78k=;
        b=O2Ma6pGa66iB8IqCj4MpBXx05P/HEMts4YbZOv2kZuyuGdl6Y3niyZFHo3QZhhDAoK
         Ug4ytk5ldqUHS0EgOu4955ZJoaVuhVRj/AWamEwrDOn2xq9YzhujnylCsXop6iB4dx6S
         2+I+SgzhGRnXYuibBqwmLQpCjRrXOKsBK+65B3V7EpyZlMlGzAX+u1lRhbPGmISsx0Ge
         j/Ad7U2LiRkDe1bSdvzauQMF3jWyCUrBaoP3KcqL4iKOvJfvi4t7+A5+URwNQ7m9Pnnj
         Gq3QUv0yZiL7E5kbUHAyneVwVOgQM/8W7f+QL1W4zOd1xqCdVwSkYwXnD5HabFz+ExVh
         IWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+KkN0+8pgG8zTFzGCoaxzADvB5HXfrcxguAyCm0k78k=;
        b=ItI5qh8eRQ4u5Vr2osNhV8NkMYlmXrkVC9a26ilhW2Sm2HvCBFPnZ0VQA2o0DwJvwe
         vVFCruS5Y589EUoAmJ5YhHd/YSEdMX87G7SZ8PUUBYbB3jQ2cgG4sCc/4NB5mz4OaHLb
         aaiaLVoKsnuzEAoFauuD6tTYvqLrL43TpT32maWzNSR7dk0K5krBksMdxKnH6a1ARlOC
         /WmgY0+pS84jTgqlONSBWXqipXBCgfDw/keB3NVKrimT8hWxW8CfR/ISFZ90Pu90ZEtH
         /B1HwmrqUipP6wjXBRTp7TuYK2tK08haqpGNeU71FEAM27c+jLhAZXNdtzyBV4e4Epx6
         ylPQ==
X-Gm-Message-State: AOAM533Z8u23uU3wgGEuRMYKqEab+wOSTrmHq/IMs5hCHx6QIVrhBKJw
	DUiImbKt3QfOszZo9/oyf99n/A==
X-Google-Smtp-Source: ABdhPJygzpTsIqyGq9j+opnYOmf3e2I3/lnZXNZ3UByw7wDsrWs1zUdbLCWyL28wVtWN35QKN+u6nQ==
X-Received: by 2002:a7b:c76e:: with SMTP id x14mr2258902wmk.27.1638834603184;
        Mon, 06 Dec 2021 15:50:03 -0800 (PST)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id k187sm1241189wme.0.2021.12.06.15.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 15:50:02 -0800 (PST)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] staging: r8188eu: convert/remove DBG_88E calls in core/rtw_cmd.c
Date: Mon,  6 Dec 2021 23:49:52 +0000
Message-Id: <20211206234952.1238-3-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211206234952.1238-1-phil@philpotter.co.uk>
References: <20211206234952.1238-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert two DBG_88E calls within core/rtw_cmd.c to netdev_dbg calls, and
remove three commented DBG_88E calls. Considering the original driver
author commented them, it seems better to delete these three than
convert.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index d0a61331b883..ace3a6342e01 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -255,8 +255,9 @@ int rtw_cmd_thread(void *context)
 _next:
 		if (padapter->bDriverStopped ||
 		    padapter->bSurpriseRemoved) {
-			DBG_88E("%s: DriverStopped(%d) SurpriseRemoved(%d) break at line %d\n",
-				__func__, padapter->bDriverStopped, padapter->bSurpriseRemoved, __LINE__);
+			netdev_dbg(padapter->pnetdev,
+				   "DriverStopped(%d) SurpriseRemoved(%d) break\n",
+				   padapter->bDriverStopped, padapter->bSurpriseRemoved);
 			break;
 		}
 
@@ -316,8 +317,6 @@ int rtw_cmd_thread(void *context)
 		if (!pcmd)
 			break;
 
-		/* DBG_88E("%s: leaving... drop cmdcode:%u\n", __func__, pcmd->cmdcode); */
-
 		rtw_free_cmd_obj(pcmd);
 	} while (1);
 
@@ -579,7 +578,7 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 	else
 		padapter->pwrctrlpriv.smart_ps = padapter->registrypriv.smart_ps;
 
-	DBG_88E("%s: smart_ps =%d\n", __func__, padapter->pwrctrlpriv.smart_ps);
+	netdev_dbg(padapter->pnetdev, "smart_ps = %d\n", padapter->pwrctrlpriv.smart_ps);
 
 	pcmd->cmdsz = get_wlan_bssid_ex_sz(psecnetwork);/* get cmdsz before endian conversion */
 
@@ -800,8 +799,6 @@ u8 rtw_addbareq_cmd(struct adapter *padapter, u8 tid, u8 *addr)
 
 	init_h2fwcmd_w_parm_no_rsp(ph2c, paddbareq_parm, GEN_CMD_CODE(_AddBAReq));
 
-	/* DBG_88E("rtw_addbareq_cmd, tid =%d\n", tid); */
-
 	/* rtw_enqueue_cmd(pcmdpriv, ph2c); */
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 
@@ -1003,7 +1000,6 @@ static void lps_ctrl_wk_hdl(struct adapter *padapter, u8 lps_ctrl_type)
 		SetHwReg8188EU(padapter, HW_VAR_H2C_FW_JOINBSSRPT, (u8 *)(&mstatus));
 		break;
 	case LPS_CTRL_SPECIAL_PACKET:
-		/* DBG_88E("LPS_CTRL_SPECIAL_PACKET\n"); */
 		pwrpriv->DelayLPSLastTimeStamp = jiffies;
 		LPS_Leave(padapter);
 		break;
-- 
2.33.1

