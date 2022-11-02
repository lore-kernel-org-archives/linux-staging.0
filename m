Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCE636F
	for <linux-staging@lists.linux.dev>; Wed,  2 Nov 2022 00:36:18 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id l14so22368433wrw.2
        for <linux-staging@lists.linux.dev>; Tue, 01 Nov 2022 17:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tO0LAor4TdjnxnPqUvrC1prKZiIrkWSk8R0XYZ6tvt8=;
        b=tWfKavahahchekF5H2ZJeJjY4YDSYtrcnHRU8WIS0QwxKhLPQdlDbE+fAftYAAgp/F
         gt+hiEVITG4y8URcjz477i9kRCP5LwnfRlhryqiUTnTCkKYxvQsMO5wLm8g3znMfh3aO
         Nrco703cnoJvhWPhpY22TX/A99tkKhnCKcJRxeGmUL2voo0A6MlEOC6/PgKzK+IZJm06
         Qbpy7F3KsWjJVNQ4AOk1hfpTVQvp7O/ooKS2RIYMajsGcNsIFHBOnrWdlNPT2+Zp4CWg
         B49cUOEf8j1a6hfW75PEpFEYfFGevfVO5SlaoXqlsViypk2LY5aY/mSJRikH1x+lRP0r
         Y4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tO0LAor4TdjnxnPqUvrC1prKZiIrkWSk8R0XYZ6tvt8=;
        b=fn+RPZdX9dLiXI1tcRC0Duy3N4eJWiHLb5gmfd1JISIameoa4AqNJDrGCOJUciN5Ho
         cgOvGBB5tId8n24ja0YhNmsQBpS9nNjl0MuGlWHIUzvrwER48SGfc0BDggvXVnPJ+nPs
         dXnR69bgfPa0b77wLkNaDAQbY9ZzYXlyJrqwkRIKz8+7xX5VvTYf84xU1/GMt9lWIoKw
         4Lb8hRKQocEXAI/ibsUgRk+mmzErr12yaxW33jEEvX8b96Aj+jqwbEW0Pe4ax4EYBML3
         yEhfPIs2GMGAg2DRFJUfXdyPZEUTNeWPYe3SR1TnsC2XXZlTpAEbu0Ctz4gjYyLMeHUh
         f+5g==
X-Gm-Message-State: ACrzQf139nOoPVbqBlWpOb9zSe2sHMsv2AeGheEnPdLw8DSfx3g2ijqo
	imHkr7Ee5cljnYSEJQNxbMypYA==
X-Google-Smtp-Source: AMsMyM4gOR4Kt0AX11B0rtuVxAKEcfK5Ac2YWaihHg00v3NLVEiG2uON1m27o+rnjCt5dEsreUCfQg==
X-Received: by 2002:a5d:63d1:0:b0:235:9aeb:e365 with SMTP id c17-20020a5d63d1000000b002359aebe365mr13612992wrw.77.1667349376421;
        Tue, 01 Nov 2022 17:36:16 -0700 (PDT)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id p5-20020a5d68c5000000b00236e834f050sm2600149wrw.35.2022.11.01.17.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 17:36:15 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	paskripkin@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@oracle.com
Subject: [PATCH] staging: r8188eu: convert rtw_setdatarate_cmd to correct error semantics
Date: Wed,  2 Nov 2022 00:36:13 +0000
Message-Id: <20221102003613.971-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert rtw_setdatarate_cmd function to use proper error return codes
rather than _SUCCESS and _FAIL, and a simpler 'return 0;' style. For now,
wrap rtw_enqueue_cmd call and return -EPERM if it fails, as converting
this function makes more sense later on due to its large number of callers.

Also change rtw_wx_set_rate function to pass through the proper error
code rather than just 0 or -1.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/core/rtw_cmd.c       | 18 +++++++-----------
 drivers/staging/r8188eu/include/rtw_cmd.h    |  2 +-
 drivers/staging/r8188eu/os_dep/ioctl_linux.c |  7 ++-----
 3 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index fdc0c71e28a4..19b2f73d481d 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -340,33 +340,29 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 	return res;
 }
 
-u8 rtw_setdatarate_cmd(struct adapter *padapter, u8 *rateset)
+int rtw_setdatarate_cmd(struct adapter *padapter, u8 *rateset)
 {
 	struct cmd_obj *ph2c;
 	struct setdatarate_parm *pbsetdataratepara;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
-	u8	res = _SUCCESS;
 
 	ph2c = kzalloc(sizeof(*ph2c), GFP_ATOMIC);
-	if (!ph2c) {
-		res = _FAIL;
-		goto exit;
-	}
+	if (!ph2c)
+		return -ENOMEM;
 
 	pbsetdataratepara = kzalloc(sizeof(*pbsetdataratepara), GFP_ATOMIC);
 	if (!pbsetdataratepara) {
 		kfree(ph2c);
-		res = _FAIL;
-		goto exit;
+		return -ENOMEM;
 	}
 
 	init_h2fwcmd_w_parm_no_rsp(ph2c, pbsetdataratepara, GEN_CMD_CODE(_SetDataRate));
 	pbsetdataratepara->mac_id = 5;
 	memcpy(pbsetdataratepara->datarates, rateset, NumRates);
-	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
-exit:
+	if (rtw_enqueue_cmd(pcmdpriv, ph2c) == _FAIL)
+		return -EPERM;
 
-	return res;
+	return 0;
 }
 
 void rtw_getbbrfreg_cmdrsp_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
diff --git a/drivers/staging/r8188eu/include/rtw_cmd.h b/drivers/staging/r8188eu/include/rtw_cmd.h
index a740a9a101d8..c330a4435b31 100644
--- a/drivers/staging/r8188eu/include/rtw_cmd.h
+++ b/drivers/staging/r8188eu/include/rtw_cmd.h
@@ -727,7 +727,7 @@ u8 rtw_clearstakey_cmd(struct adapter *padapter, u8 *psta, u8 entry, u8 enqueue)
 u8 rtw_joinbss_cmd(struct adapter *padapter, struct wlan_network *pnetwork);
 u8 rtw_disassoc_cmd(struct adapter *padapter, u32 deauth_timeout_ms, bool enqueue);
 u8 rtw_setopmode_cmd(struct adapter *padapter, enum ndis_802_11_network_infra networktype);
-u8 rtw_setdatarate_cmd(struct adapter *padapter, u8 *rateset);
+int rtw_setdatarate_cmd(struct adapter *padapter, u8 *rateset);
 u8 rtw_setrfintfs_cmd(struct adapter *padapter, u8 mode);
 
 u8 rtw_gettssi_cmd(struct adapter *padapter, u8 offset, u8 *pval);
diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index f3b3d7468539..dda48a2a6d0c 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -1340,7 +1340,7 @@ static int rtw_wx_set_rate(struct net_device *dev,
 			      struct iw_request_info *a,
 			      union iwreq_data *wrqu, char *extra)
 {
-	int i, ret = 0;
+	int i;
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
 	u8 datarates[NumRates];
 	u32	target_rate = wrqu->bitrate.value;
@@ -1408,10 +1408,7 @@ static int rtw_wx_set_rate(struct net_device *dev,
 		}
 	}
 
-	if (rtw_setdatarate_cmd(padapter, datarates) != _SUCCESS)
-		ret = -1;
-
-	return ret;
+	return rtw_setdatarate_cmd(padapter, datarates);
 }
 
 static int rtw_wx_get_rate(struct net_device *dev,
-- 
2.38.1

