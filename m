Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E5F6F
	for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 13:37:15 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id j7so16845107wrd.1
        for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 06:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kMdX1fc3cqcNLmuRtmkuTcqx3+HOGuLqRNKr/OhBJA0=;
        b=c2qOc+92pJmDkN8uQMO0k4tpl7xW2tGyG6RTphYXFX6cyJnlgnLxRGEGAtAMNS2eRo
         T11Ujlvn/PnK0V+qH6gflBWys+1B/cOecFbUhS8MSNTVq99UEk/2l/6vFXA2CVoucDcJ
         8scFDTyg3mT6F6l8pxvsdPDRDxCmqmKYtB9BIafTArfOiGcezFwGWubCfLwva780bZlW
         L8qtxsHbcK589EleLVzWNqbKBBNWx2s6J5UnJWbB/FxcWPjki02vnz1JG2mtLMwzk3+W
         R6X/HCXFFzJ864Kh07vPkJxXReMIhMPCIZkepBQRIfYW8RJKS2FeZ617HpCh5p9es4h0
         a3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kMdX1fc3cqcNLmuRtmkuTcqx3+HOGuLqRNKr/OhBJA0=;
        b=ct3mB/hzC/6cUkvh6dXgBgIwUQh5mmZrT8QXaMojCr9OrsTMhMopcgQ7myydxj+jV3
         blNy+qD+PNCSTR2cdhQsFAhqZqcTP/AgppZNtM4grnx9LWjYbL8W9lThBaYJAHz/8O6M
         IftNh1I3U+O/r3hjZC5sP+/MudNhNBvArDgE5HgQI0IV+p1BZd86vEBMkvDlVa0D/itz
         vji7RGcjPpjzotL1aOJA4iXyDGKJ8DpSaGLkfm9Ra+gkJjV+7mWhhQGkWpMepJkepAvZ
         258oSUp8Seo1CLYAV1wjusu8oCtH1xUCdPdwbH+mUtBZJ1fDhEfA5tu283b62yE899fZ
         Qg3w==
X-Gm-Message-State: AOAM531YlmsDoJHB8OP3PP4WCJq9v/OGC9epJgBlGEdXIlDF/PaFywQK
	9+mYo/FP2CUtw+doVWKESK+7jyCJ3UU=
X-Google-Smtp-Source: ABdhPJyuOct3RVwcf7aAKMk5ExQFT/hWkB6pS9Vm2biKV5tlujSC5OEBubfemclaXvQCNftKphYJzQ==
X-Received: by 2002:a5d:6a11:: with SMTP id m17mr7675642wru.361.1616420234498;
        Mon, 22 Mar 2021 06:37:14 -0700 (PDT)
Received: from gimli.cesven (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id d204sm17091770wmc.17.2021.03.22.06.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 06:37:14 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 05/19] Staging: rtl8723bs: remove useless structs in rtw_ioctl_set.h
Date: Mon, 22 Mar 2021 14:37:03 +0100
Message-Id: <20210322133717.17797-6-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322133717.17797-1-marcocesati@gmail.com>
References: <20210322133717.17797-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unreferenced struct in include/rtw_ioctl_set.h:

	struct BSSIDInfo

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_ioctl_set.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h b/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h
index 4b929b84040a..d6d3c39a69c6 100644
--- a/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h
+++ b/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h
@@ -10,12 +10,6 @@
 
 typedef u8 NDIS_802_11_PMKID_VALUE[16];
 
-struct BSSIDInfo {
-	NDIS_802_11_MAC_ADDRESS  BSSID;
-	NDIS_802_11_PMKID_VALUE  PMKID;
-};
-
-
 u8 rtw_set_802_11_authentication_mode(struct adapter *pdapter, enum ndis_802_11_authentication_mode authmode);
 u8 rtw_set_802_11_bssid(struct adapter *padapter, u8 *bssid);
 u8 rtw_set_802_11_add_wep(struct adapter *padapter, struct ndis_802_11_wep *wep);
-- 
2.30.2

