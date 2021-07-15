Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130DC70
	for <linux-staging@lists.linux.dev>; Thu, 15 Jul 2021 14:57:04 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id v5so8206241wrt.3
        for <linux-staging@lists.linux.dev>; Thu, 15 Jul 2021 07:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=trFt9B5wK6xRGkrNN9eahQdfcGvBp0la1dk04lJiCpA=;
        b=N0PiPgjjUGfonhDvn999uJM5dv2ffJGFzIFkBawjQu6MznQ+XM5kkPc7WUKVwZNexp
         GdGY3McFMe/FZL4RACPyN22JiU+LUiXVrJWFOS4BbwIKCzFMlJe1j6epOavVrBvw4Ivu
         vPKHnjtnk0kS+gkBABCTMLn1+5fQ35luyeeHNRcFKwjlXVes0iiW/6cLqAlJQFSfDJBA
         jKH2UgXvnXcc/G4g/q+u9llB3NOW0AFNcmaQcjw9DJrfT9M29PFCKlmb1SU1LwYNxVtU
         gMz2Hi4Y34GOK3/Fe8tGtZJz7quzG1l5xVVY5gBlvKH+rlO3/juHyHzf/XpShPKZj1x9
         Np0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=trFt9B5wK6xRGkrNN9eahQdfcGvBp0la1dk04lJiCpA=;
        b=MTWdzFeE8af3L/icuiAQIHi1nXabBeILmAd1qdDazxrngDCRgI1sljhhlNAvrz/r5T
         o9Bt/Fl+pRrPAmFyq7JovEs8Z5AP5t76ZyrEhfyMY7i3KvBKP+8AqaBuw63uJQ3dEcfc
         bklg+KTisNdGP8/X+3zU+iWjjTOTrfsGgv6MTAh5Pvov8mSHljI3bVIttonwKeCTXfEG
         R5FnqafkE0GNKIz8+tgOUtGy8U48T4x7pZILCyMfM4Zc4ZuArmCT9u/xtnPlnpssjNdH
         R04zZVs7hwnOR6u4d9a9zsIkAuaWycHI038zYIFBJF9058K6/Oo8gTGOBRFD0nCNv5OU
         bnxA==
X-Gm-Message-State: AOAM532iZums9TOgNnoC5Qo1KdLXX8DhQLy2Pz9arg52IVHfe6IqKYOK
	vxfX+8odPDjoelIO6gqygss=
X-Google-Smtp-Source: ABdhPJy/vYIUvT1bf/Kh0W3foAhW2hrzKAzpUKwGsi7FwSshJNKMretk9weUK1ZwXYqJi2x23btcrA==
X-Received: by 2002:a05:6000:18c:: with SMTP id p12mr6336783wrx.98.1626361022443;
        Thu, 15 Jul 2021 07:57:02 -0700 (PDT)
Received: from agape ([5.171.120.140])
        by smtp.gmail.com with ESMTPSA id x19sm5357402wmi.10.2021.07.15.07.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 07:57:02 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Colin Ian King <colin.king@canonical.com>
Subject: [PATCH] staging: rtl8723bs: fix wpa_set_auth_algs() function
Date: Thu, 15 Jul 2021 16:57:00 +0200
Message-Id: <20210715145700.9427-1-fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <619462ca-e652-30f5-6ffa-3213175d8bbc@canonical.com>
References: <619462ca-e652-30f5-6ffa-3213175d8bbc@canonical.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix authentication algorithm constants.
wpa_set_auth_algs() function contains some conditional
statements masking the checked value with the wrong
constants. This produces some unintentional dead code.
Mask the value with the right macros.

Fixes: 5befa937e8da ("staging: rtl8723bs: Fix IEEE80211 authentication algorithm constants.")
Reported-by: Colin Ian King <colin.king@canonical.com>
Tested-on: Lenovo Ideapad MiiX 300-10IBY
Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index f95000df8942..965558516cbd 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -349,16 +349,16 @@ static int wpa_set_auth_algs(struct net_device *dev, u32 value)
 	struct adapter *padapter = rtw_netdev_priv(dev);
 	int ret = 0;
 
-	if ((value & WLAN_AUTH_SHARED_KEY) && (value & WLAN_AUTH_OPEN)) {
+	if ((value & IW_AUTH_ALG_SHARED_KEY) && (value & IW_AUTH_ALG_OPEN_SYSTEM)) {
 		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption1Enabled;
 		padapter->securitypriv.ndisauthtype = Ndis802_11AuthModeAutoSwitch;
 		padapter->securitypriv.dot11AuthAlgrthm = dot11AuthAlgrthm_Auto;
-	} else if (value & WLAN_AUTH_SHARED_KEY)	{
+	} else if (value & IW_AUTH_ALG_SHARED_KEY)	{
 		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption1Enabled;
 
 		padapter->securitypriv.ndisauthtype = Ndis802_11AuthModeShared;
 		padapter->securitypriv.dot11AuthAlgrthm = dot11AuthAlgrthm_Shared;
-	} else if (value & WLAN_AUTH_OPEN) {
+	} else if (value & IW_AUTH_ALG_OPEN_SYSTEM) {
 		/* padapter->securitypriv.ndisencryptstatus = Ndis802_11EncryptionDisabled; */
 		if (padapter->securitypriv.ndisauthtype < Ndis802_11AuthModeWPAPSK) {
 			padapter->securitypriv.ndisauthtype = Ndis802_11AuthModeOpen;
-- 
2.20.1

