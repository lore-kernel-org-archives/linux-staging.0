Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9286F6D0D
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 14:20:48 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id u17so13062260ejk.2
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 07:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bWrTvJLlhJukbZ2Xh3clrZ9MtMewC92gy97FF8zFOXU=;
        b=aMAkND35GyNP6mziH5kPabnmK7di7VJ237D1zNm1RjC/eydnhRiltjaBnnDq3UZ1IE
         QROd4q0ByNrXsqABMd1vU7cNio6siv+octBGk6yDRpZZvsM0+XGvOU/4tDdzPk9dqh8S
         xjBYmfMZQ6/exF0mdxK/Lwl7WA0o7xHUqBhqgBkhoYKWkXq7IFc49ZrbSQA2L0nOPPmi
         7Kl9XJ5auoeFfUPHOkSe+0Xx/04KtQjtok15PuTHuuASjxJxn21or2Epsc92CzDQe3mJ
         I0iDi5BKAlZrkdiPTD0va/os5iYqOhVwgmxQvXC1DMRmzdE0+stkuibeMjMjOoufMgBX
         Ulsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bWrTvJLlhJukbZ2Xh3clrZ9MtMewC92gy97FF8zFOXU=;
        b=D6g5DmIg0CGhKTEtjrfkTVBG64HPBilnokrc7A2V+9DuVDX7ylSMZ24aWUvnZ9RKXt
         TY3v6874lMffj9UilEo4tp0u7yzUYMt7Emv55lsZuXGB79xODNRkMPDuqrMZLLjOpVDh
         VSyHRT/HhQwsCU7Z6ubXCVgt5I3nOgT6LCPFSxYJxAKacsii3GMvY51MXTs28FrUUtd5
         NVtJ75aTiUMzZLOeSdfff62dP8uOsRfrpsbJxw8Iv0qA68gdv8t58Q4YQt9oX3jw8mO5
         arXvbz0bywL+vnryvyVkAGzPJb46XgpRVkv+Uh9ypL/b+wxzLvVmFFA3GVx+uulUDNct
         bV/A==
X-Gm-Message-State: AOAM533GHxBycH+qU4/F4I75iYqrOOR8FufbN2HuGzIVgC7PH6rC+xnW
	EW9JCcijF1zihYxCNUfb4Lo=
X-Google-Smtp-Source: ABdhPJyHg/VOOgp7shWC64GkIPu+CiWENmRCpfShpxQnJqOKNTROjDUpHtqDq7iVQQjFD24JU+JDdQ==
X-Received: by 2002:a17:906:4ec3:: with SMTP id i3mr3886240ejv.119.1618064447268;
        Sat, 10 Apr 2021 07:20:47 -0700 (PDT)
Received: from agape ([5.171.81.28])
        by smtp.gmail.com with ESMTPSA id w2sm2681603eju.71.2021.04.10.07.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 07:20:46 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/25] staging: rtl8723bs: remove all if-blocks left empty by DBG_8192C-remove coccinelle script
Date: Sat, 10 Apr 2021 16:20:17 +0200
Message-Id: <1676083964fe176e996c2c05dfdcb723b49febb6.1618064274.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618064274.git.fabioaiuto83@gmail.com>
References: <cover.1618064274.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove all empty if blocks left empty by coccinelle
script for DBG_8192C macro removal.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_ops.c        | 17 -----------------
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c   | 15 +--------------
 2 files changed, 1 insertion(+), 31 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 763dd6062c74..4403ccdaf2ee 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -596,12 +596,6 @@ s32 sdio_local_write(
 	s32 err;
 	u8 *tmpbuf;
 
-	if (addr & 0x3)
-		{}
-
-	if (cnt  & 0x3)
-		{}
-
 	intfhdl = &adapter->iopriv.intf;
 
 	hal_sdio_get_cmd_addr_8723b(adapter, SDIO_LOCAL_DEVICE_ID, addr, &addr);
@@ -926,11 +920,6 @@ void sd_int_dpc(struct adapter *adapter)
 		}
 	}
 
-	if (hal->sdio_hisr & SDIO_HISR_TXBCNOK)
-		{}
-
-	if (hal->sdio_hisr & SDIO_HISR_TXBCNERR)
-		{}
 	if (hal->sdio_hisr & SDIO_HISR_C2HCMD) {
 		struct c2h_evt_hdr_88xx *c2h_evt;
 
@@ -952,12 +941,6 @@ void sd_int_dpc(struct adapter *adapter)
 		}
 	}
 
-	if (hal->sdio_hisr & SDIO_HISR_RXFOVW)
-		{}
-
-	if (hal->sdio_hisr & SDIO_HISR_RXERR)
-		{}
-
 	if (hal->sdio_hisr & SDIO_HISR_RX_REQUEST) {
 		struct recv_buf *recvbuf;
 		int alloc_fail_time = 0;
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index b7dffdaffda7..6d5109aa4b69 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1635,13 +1635,6 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 
 	memcpy(buf, pie, ielen);
 
-	/* dump */
-	{
-		int i;
-		for (i = 0; i < ielen; i = i + 8)
-			{}
-	}
-
 	if (ielen < RSN_HEADER_LEN) {
 		ret  = -1;
 		goto exit;
@@ -1874,11 +1867,6 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 	ndis_ssid.SsidLength = sme->ssid_len;
 	memcpy(ndis_ssid.Ssid, (u8 *)sme->ssid, sme->ssid_len);
 
-
-	if (sme->bssid)
-		{}
-
-
 	if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING) == true) {
 		ret = -EBUSY;
 		goto exit;
@@ -2440,8 +2428,7 @@ static int rtw_add_beacon(struct adapter *adapter, const u8 *head, size_t head_l
 	len = head_len+tail_len-24;
 
 	/* check wps ie if inclued */
-	if (rtw_get_wps_ie(pbuf+_FIXED_IE_LENGTH_, len-_FIXED_IE_LENGTH_, NULL, &wps_ielen))
-		{}
+	rtw_get_wps_ie(pbuf+_FIXED_IE_LENGTH_, len-_FIXED_IE_LENGTH_, NULL, &wps_ielen);
 
 	/* pbss_network->IEs will not include p2p_ie, wfd ie */
 	rtw_ies_remove_ie(pbuf, &len, _BEACON_IE_OFFSET_, WLAN_EID_VENDOR_SPECIFIC, P2P_OUI, 4);
-- 
2.20.1

