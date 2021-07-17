Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE23672
	for <linux-staging@lists.linux.dev>; Sat, 17 Jul 2021 14:57:04 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id b14-20020a1c1b0e0000b02901fc3a62af78so9935787wmb.3
        for <linux-staging@lists.linux.dev>; Sat, 17 Jul 2021 07:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xRK7NSI5UgeQ2tu+VHcDHeBzFj/hyQCQmKRmPBf8Kfs=;
        b=MbTWMunJVoMjkyYhtnHcM2TDQ7sRPyr2tD57XNBjilL/kSS0cRRGcPaf1b6npq9Mia
         Ur4BIDDVyYdcb+jAK2RTYv965IvcTETxwhtLVYX7v5NtCSsnvya4ywQnHY5TVBepiSY+
         usd2CreaVL31Kc2ohHYTCGgB3N9MMPkCA35+BDzEvkqPP9/uRbJxX4iqKPfd/VQaqq5x
         rCKsF65kFPzljTfmpiaDPDZoWME6sojIoTd89chJLkwuJc0Is33bv4Ar2RJcMkQQ740V
         e1aS8knN0E/1jEJ/AATk1TVTctG1fGEREnCPEE1M6e7LCqP/+D9prD4OHtOt9+d61DiO
         /JTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xRK7NSI5UgeQ2tu+VHcDHeBzFj/hyQCQmKRmPBf8Kfs=;
        b=AS82YsUH9eSN3GWlgg2ud8o89PWVPdMkOeAqJY2Kl4MkegFlUu+T2+zi2Xmn0qRo4g
         0BM8XmcZ0KE3oHTlfhW26EDpNeQw+x1m+8oyHQI0KBOliysjbuWBVfKrzQtvVLjohS3q
         +9Tu4E///RE9meQG3HSEK9fwgAggqJFD0d+auw/37VAREo9qGdJVcuCNPmsbtQ7I+LgE
         YEOV/Mt3+xp4zDHtuvdXtFdonvp8xdCbCjnqHV/9RVa9ufu4U6DGmvz8cscjIC/xRjl7
         MoFZ24ieUSJA0YYi27Syynv/aKvY84gfO+wRi4ASZUYhpPqXKmps7ZJa/pXk80YawNIB
         N9zA==
X-Gm-Message-State: AOAM532yiXaPrzAn+rEQs49pzPx0AxftxN5348ccKpcqaxwAtO0BpNL6
	D+IDeTXYvR5vHrW4CXkmoKI=
X-Google-Smtp-Source: ABdhPJwe1L03lXK9t/ykUyykJavtp8asfCN8VmhKNOOuUjaBbquq0MfTVSQcRlHe4yzKntINYT+stQ==
X-Received: by 2002:a7b:c181:: with SMTP id y1mr22998036wmi.106.1626533823324;
        Sat, 17 Jul 2021 07:57:03 -0700 (PDT)
Received: from agape ([5.171.72.101])
        by smtp.gmail.com with ESMTPSA id w8sm2598776wrk.10.2021.07.17.07.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 07:57:03 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/10] staging: rtl8723bs: fix post-commit camel case issues
Date: Sat, 17 Jul 2021 16:56:48 +0200
Message-Id: <6fd6d3266b5119330e15006ae610cb49b767bc59.1626533647.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1626533647.git.fabioaiuto83@gmail.com>
References: <cover.1626533647.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix the following post-commit camel case issues:

CHECK: Avoid CamelCase: <Adapter>
33: FILE: drivers/staging/rtl8723bs/hal/hal_com.c:152:
+		if (is_supported_24g(Adapter->
	registrypriv.wireless_mode) == false)

CHECK: Avoid CamelCase: <NetType>
46: FILE: drivers/staging/rtl8723bs/include/ieee80211.h:159:
+#define is_supported_24g(NetType)
	((NetType) & SUPPORTED_24G_NETTYPE_MSK ? true : false)

CHECK: Avoid CamelCase: <IsEnableHWCCK>
49: FILE: drivers/staging/rtl8723bs/include/ieee80211.h:161:
+#define IsEnableHWCCK(NetType)
	is_supported_24g(NetType)

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c       | 4 ++--
 drivers/staging/rtl8723bs/include/ieee80211.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index d18537fde4ed..4a112989899a 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -144,12 +144,12 @@ u8 hal_com_config_channel_plan(
 	return chnlPlan;
 }
 
-bool HAL_IsLegalChannel(struct adapter *Adapter, u32 Channel)
+bool HAL_IsLegalChannel(struct adapter *adapter, u32 Channel)
 {
 	bool bLegalChannel = true;
 
 	if ((Channel <= 14) && (Channel >= 1)) {
-		if (is_supported_24g(Adapter->registrypriv.wireless_mode) == false)
+		if (is_supported_24g(adapter->registrypriv.wireless_mode) == false)
 			bLegalChannel = false;
 	} else {
 		bLegalChannel = false;
diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 2fa6ced333a0..f29b7a92d9ac 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -156,9 +156,9 @@ enum network_type {
 
 #define is_legacy_only(net_type)  ((net_type) == ((net_type) & (WIRELESS_11BG)))
 
-#define is_supported_24g(NetType) ((NetType) & SUPPORTED_24G_NETTYPE_MSK ? true : false)
+#define is_supported_24g(net_type) ((net_type) & SUPPORTED_24G_NETTYPE_MSK ? true : false)
 
-#define IsEnableHWCCK(NetType) is_supported_24g(NetType)
+#define IsEnableHWCCK(net_type) is_supported_24g(net_type)
 #define IsEnableHWOFDM(NetType) (((NetType) & (WIRELESS_11G|WIRELESS_11_24N)) ? true : false)
 
 #define IsSupportedRxCCK(NetType) IsEnableHWCCK(NetType)
-- 
2.20.1

