Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419C02CA1
	for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 16:32:35 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id e9so8081663pgb.3
        for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 08:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tUqRPe41F16/TIkhlkuc7qmLwMC4mtGG1eE6VsNQEHg=;
        b=hoQaPDvZJtvTfDY93i9UWOxAzo0ximI8UhHMz9knb5tN2mgJdK3tHbm3Z+JqTLJUn5
         ZRASzabEZmVdWhAfO0HZRzMi/VH0cCL4nT9c3CgtGCFz/aKl7c/qu6Te4CMVKllHU8bq
         4436LAqwlFPZATaOB8VuyjkKMo9/pfpqwIsaQe4fjIrxq9d3AhE4zVHqrrE2WcdcJIXR
         4DuX0TvgR569/hPKUiq5GiV3iECFwy+32x2WZKyk/qklI/32D4ImdaPuPXvnvbhT0TYK
         ZP8r1zWWSfKQr0se+5925WlhSbaMRBAgg9yhT4DnQV6lL6m+yq8rlK0xWiclfwcStyhp
         qWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tUqRPe41F16/TIkhlkuc7qmLwMC4mtGG1eE6VsNQEHg=;
        b=LJhIIeA51QW6hEN7+e9EcPzbpwpEAtTCBW1E9mMztUBUnlH6DpuhDW3bm7Bf5OwdYq
         lsPqC9kvmfZhntvctJIS3C+bl3NXXtjCNf59uyEw81ET4GIQM4TS3wj/tB7eMkNseKpN
         1mHERapqg2fEGPAazLtW8wBa4MlPIp8ZdOAjmRh7BOpnLwD1M9xdavPmAIJ4eZwa6pkz
         FcevT/E6EfcHSbeFZvtvaFLwIvrxnLUV8lrMkvSwReWuSFmzn1Oxd7V8DmDlpfurlMgG
         i7R33gRW5NvORlo+MXzVg68uTAl6nJ84A/kWKdNx4F/WvYKVWm+03BeQACkL4V3kc679
         PBTA==
X-Gm-Message-State: AOAM530D//uAvq86oP65dcP7+HARJpWORjIAn7ZEDxNS/MaJalFDtEon
	/fSqiD63quvdzFbmUMg+Tu4=
X-Google-Smtp-Source: ABdhPJzS/o1IrVP/jXSHA0oN1aBVQvMIWvShKO6zWQKGwSfSnLIHw+mKYeKqbtKYTNGouUDkNBpbwA==
X-Received: by 2002:a63:5908:: with SMTP id n8mr10606724pgb.390.1643473954849;
        Sat, 29 Jan 2022 08:32:34 -0800 (PST)
Received: from localhost.localdomain ([171.78.146.184])
        by smtp.googlemail.com with ESMTPSA id q13sm1893528pfj.44.2022.01.29.08.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 08:32:34 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 22/23] staging: r8188eu: convert rtw_p2p_prov_disc to return void
Date: Sat, 29 Jan 2022 21:58:14 +0530
Message-Id: <a6696ce2645a07ddd5b5eca21bcc04b196038e8e.1643466748.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643466748.git.abdun.nihaal@gmail.com>
References: <cover.1643466748.git.abdun.nihaal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_p2p_prov_disc always returns 0 and it's return value is not used.
Convert it to return void.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 4c778cf92680..1af8b2c068b8 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -3171,11 +3171,10 @@ static void rtw_p2p_set_persistent(struct net_device *dev,
 	pr_info("[%s] persistent_supported = %d\n", __func__, pwdinfo->persistent_supported);
 }
 
-static int rtw_p2p_prov_disc(struct net_device *dev,
-			       struct iw_request_info *info,
-			       union iwreq_data *wrqu, char *extra)
+static void rtw_p2p_prov_disc(struct net_device *dev,
+			      struct iw_request_info *info,
+			      union iwreq_data *wrqu, char *extra)
 {
-	int ret = 0;
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
 	struct wifidirect_info *pwdinfo = &padapter->wdinfo;
 	u8 peerMAC[ETH_ALEN] = {0x00};
@@ -3201,7 +3200,7 @@ static int rtw_p2p_prov_disc(struct net_device *dev,
 
 	if (pwdinfo->p2p_state == P2P_STATE_NONE) {
 		DBG_88E("[%s] WiFi Direct is disable!\n", __func__);
-		return ret;
+		return;
 	} else {
 		/*	Reset the content of struct tx_provdisc_req_info excluded the wps_config_method_request. */
 		memset(pwdinfo->tx_prov_disc_info.peerDevAddr, 0x00, ETH_ALEN);
@@ -3225,7 +3224,7 @@ static int rtw_p2p_prov_disc(struct net_device *dev,
 		pwdinfo->tx_prov_disc_info.wps_config_method_request = WPS_CM_LABEL;
 	} else {
 		DBG_88E("[%s] Unknown WPS config methodn", __func__);
-		return ret;
+		return;
 	}
 
 	spin_lock_bh(&pmlmepriv->scanned_queue.lock);
@@ -3297,7 +3296,6 @@ static int rtw_p2p_prov_disc(struct net_device *dev,
 	} else {
 		DBG_88E("[%s] NOT Found in the Scanning Queue!\n", __func__);
 	}
-	return ret;
 }
 
 /*	This function is used to inform the driver the user had specified the pin code value or pbc */
-- 
2.34.1

