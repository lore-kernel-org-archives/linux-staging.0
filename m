Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17E2EBC
	for <linux-staging@lists.linux.dev>; Sat, 22 Jul 2023 21:59:08 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-346541baf2aso10290095ab.1
        for <linux-staging@lists.linux.dev>; Sat, 22 Jul 2023 14:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1690063147; x=1690667947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lauvryu8+RbX4F+Ht5xLHh2lskvh455ipXTKcGMOp/A=;
        b=WQJSAZS/QFZogRrUnNVVA4Z9HR/apIXr9heJJY8reym+lUluCZjVpVTvYFki2M9QAJ
         KJFn3q7jYm12JP5F8xFP+SP0DrbS97Me4lmKeQw2NhrifvGQFOdgUE264B6wWNfAF4Ee
         Zqrd16xQ28G+Jvavb+4GKMdfw4OWH8L9TYiRsrq9+ZnsLk+bLCSKPln6d5Uy2ZyPOGiN
         jwTwwyRthVmLWoiwCGK1YxHw5VbfmVF7HT56i8iSpTEv+oC5m+Grc4pYDPzeOArPEQfg
         87mZCVaI0+woAWOgdznYRYIhPDp85q0sJMIljnBM2/JZi3Oc4KNenR/wwLuD19d4ERKW
         o5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690063147; x=1690667947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lauvryu8+RbX4F+Ht5xLHh2lskvh455ipXTKcGMOp/A=;
        b=kUnjwTL4TwAtu2HSdsd42IGm3PrVvbe5Wl8rsRpPQmYTh0mszavDUQG0Xrv9g0LN7d
         LXTP9Vn0owYTxqu77qhG2ncGFh4shGXj2DRb09FcpQkhMWTJ46xYQObHrQOnUqAHH2YD
         FItCn0zQsgbLr7VdgRFPUwFo8johKJcorkuLN31Qc+Je4w+79qhP5B6bgT5JkgayIHpM
         naWMoDx4G2IAFwKYLN1udaqlvB30jXZqPCyDotiyP//aMIbmv8+GuAXjcg1h8Voj+kaS
         uXO+xRdsRF7U4eGmrc+gyoigO7CfYMDvyMt9yW4jc1d/Z17usB/fOeV3rwKWyNx43LqN
         vrJA==
X-Gm-Message-State: ABy/qLY+2zxxQShHhD5IrQiGm6215ewEE7gpjHiwbeIo3YPXKsMcJeL8
	/oOzHoQl34Wz22/nsCSBUaw=
X-Google-Smtp-Source: APBJJlFY8mNC3x+dU1aVMbXuCuG6KD3ZhpnnpHXe/AP6NEOc3uvjMGtemh9v0CoGKhXWBfFPaYPYLg==
X-Received: by 2002:a05:6e02:1242:b0:348:9dd1:7963 with SMTP id j2-20020a056e02124200b003489dd17963mr1893489ilq.7.1690063147698;
        Sat, 22 Jul 2023 14:59:07 -0700 (PDT)
Received: from localhost.localdomain ([161.97.244.155])
        by smtp.gmail.com with ESMTPSA id g15-20020a926b0f000000b0034285721db5sm1923590ilc.4.2023.07.22.14.59.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Jul 2023 14:59:07 -0700 (PDT)
From: Franziska Naepelt <franziska.naepelt@googlemail.com>
To: franziska.naepelt@googlemail.com
Cc: gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 7/9] staging: rtl8723bs: ioctl_linux: Fix alignment on open parenthesis
Date: Sat, 22 Jul 2023 23:59:05 +0200
Message-Id: <20230722215905.4383-1-franziska.naepelt@googlemail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230722215330.4114-1-franziska.naepelt@googlemail.com>
References: <20230722215330.4114-1-franziska.naepelt@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following checkpatch issue:
- CHECK: Alignment should match open parenthesis

Signed-off-by: Franziska Naepelt <franziska.naepelt@googlemail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index e4c5e249df98..88f560353df7 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -147,7 +147,7 @@ static int wpa_set_encryption(struct net_device *dev, struct ieee_param *param,
 					psta->ieee8021x_blocked = false;
 
 				if ((padapter->securitypriv.ndisencryptstatus == Ndis802_11Encryption2Enabled) ||
-						(padapter->securitypriv.ndisencryptstatus ==  Ndis802_11Encryption3Enabled)) {
+				    (padapter->securitypriv.ndisencryptstatus ==  Ndis802_11Encryption3Enabled)) {
 					psta->dot118021XPrivacy = padapter->securitypriv.dot11PrivacyAlgrthm;
 				}
 
@@ -200,7 +200,7 @@ static int wpa_set_encryption(struct net_device *dev, struct ieee_param *param,
 					pbcmc_sta->ieee8021x_blocked = false;
 
 				if ((padapter->securitypriv.ndisencryptstatus == Ndis802_11Encryption2Enabled) ||
-						(padapter->securitypriv.ndisencryptstatus ==  Ndis802_11Encryption3Enabled)) {
+				    (padapter->securitypriv.ndisencryptstatus ==  Ndis802_11Encryption3Enabled)) {
 					pbcmc_sta->dot118021XPrivacy = padapter->securitypriv.dot11PrivacyAlgrthm;
 				}
 			}
@@ -334,8 +334,8 @@ static int rtw_set_wpa_ie(struct adapter *padapter, char *pie, unsigned short ie
 
 	/* TKIP and AES disallow multicast packets until installing group key */
 	if (padapter->securitypriv.dot11PrivacyAlgrthm == _TKIP_ ||
-		padapter->securitypriv.dot11PrivacyAlgrthm == _TKIP_WTMIC_ ||
-		padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)
+	    padapter->securitypriv.dot11PrivacyAlgrthm == _TKIP_WTMIC_ ||
+	    padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)
 		/* WPS open need to enable multicast */
 		/*  check_fwstate(&padapter->mlmepriv, WIFI_UNDER_WPS) == true) */
 		rtw_hal_set_hwreg(padapter, HW_VAR_OFF_RCR_AM, null_addr);
-- 
2.39.2 (Apple Git-143)

