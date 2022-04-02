Received: from mail-oa1-f67.google.com (mail-oa1-f67.google.com [209.85.160.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68AE1363;
	Sat,  2 Apr 2022 08:51:23 +0000 (UTC)
Received: by mail-oa1-f67.google.com with SMTP id 586e51a60fabf-d39f741ba0so5128788fac.13;
        Sat, 02 Apr 2022 01:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CwyPQSB+WJYU+JkcFUBBvDrf5lBS4YcYc8z0W7DhRMo=;
        b=DubTEXg4Iq97boyWsG+ES8tg2dBvQdNgO7s3bOR3PAhTsUm1TPc9GqibMunWyFkQi1
         PAI1grvSPXOAr+LAkhzoE9m4j2fFaPhxX5+pBWv+ACUTBfb7C3yN6RBFKN904E1kcd7E
         Ii2z18jwsn2VBVRFK9WpYDgT8sWHlPTjAymqlKRf3WZMpwBY6kqAkxnZpgOkewJEI9KD
         pGuZspgQa779EjH7glXXnpPTH6sfDvaz3p6wgmYX4cKAGwKUlVhq/q61A4HTKuOW3GMC
         wPeeeX5IayCzDGxTxIq9aO/n8Bw6x/82NDSVwTKaXJI9R+K0X64ucEL8MsA0Ye2Vm1IF
         gmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CwyPQSB+WJYU+JkcFUBBvDrf5lBS4YcYc8z0W7DhRMo=;
        b=ShDcO0zYf5hIBWmSWIgKp+LFHsUK90/asvMBidLM14sy8B+i0PHbW+/jXvIqUdp44O
         J34f0cLagfpIahWxhOJWxza5ymLhSGGdItS8fufXqoh3ajw/ZEycw0aR0LxktZxT+y7q
         4jf4Yy+5GhaL5Re8+llvSCjJS0R8ma7fdS3RTW64nHgSxgpGC4TCrJU6Zx4cwyiGEaQE
         XiiboZIRlxQGu+DC7dUvAxGUlMZORvhhpaS2UwoU9IaLZ/9BZlLUSb7NwDb8bsYKoppb
         pKwU5p66h+N/yz+vmWpwqytHUj8Dx5kOWiAaXNuYazScNjN2Z0946pC2ZLsacjW8ek97
         T4Mw==
X-Gm-Message-State: AOAM530aGOlmO3AHCrFZom54zrzVj1PkyCwoT1WStB44Op/0d/amUgwc
	I3m/qsS4lV6/HIQnIngLBeg=
X-Google-Smtp-Source: ABdhPJwHvzC34/jLXSMJglm+fac8tsDNLvgYbrYDMZAEB1F1P7UFN/NhraLjOGiAk2qNsFmMimowsQ==
X-Received: by 2002:a05:6870:e2c9:b0:dd:b78a:82cd with SMTP id w9-20020a056870e2c900b000ddb78a82cdmr6912349oad.50.1648889482790;
        Sat, 02 Apr 2022 01:51:22 -0700 (PDT)
Received: from bertie (072-190-140-117.res.spectrum.com. [72.190.140.117])
        by smtp.gmail.com with ESMTPSA id m5-20020a056870194500b000d9a0818925sm1911593oak.25.2022.04.02.01.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 01:51:22 -0700 (PDT)
From: Rebecca Mckeever <remckee0@gmail.com>
To: outreachy@lists.linux.dev
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rebecca Mckeever <remckee0@gmail.com>
Subject: [PATCH 5/6] staging: r8188eu: remove unnecessary braces in conditional statements
Date: Sat,  2 Apr 2022 03:50:47 -0500
Message-Id: <2b46501bb3965a8cf27e7134407c50551c36b7e8.1648888462.git.remckee0@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1648888461.git.remckee0@gmail.com>
References: <cover.1648888461.git.remckee0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Conform to Linux kernel coding style.

Reported by checkpatch:

WARNING: braces {} are not necessary for single statement blocks
WARNING: braces {} are not necessary for any arm of this statement

Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 0c659b40aa1c..832bf25b1a83 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -331,13 +331,11 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 	struct cmd_priv		*pcmdpriv = &padapter->cmdpriv;
 	struct mlme_priv	*pmlmepriv = &padapter->mlmepriv;
 
-	if (check_fwstate(pmlmepriv, _FW_LINKED)) {
+	if (check_fwstate(pmlmepriv, _FW_LINKED))
 		rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_SCAN, 1);
-	}
 
-	if (check_fwstate(pmlmepriv, _FW_LINKED)) {
+	if (check_fwstate(pmlmepriv, _FW_LINKED))
 		p2p_ps_wk_cmd(padapter, P2P_PS_SCAN, 1);
-	}
 
 	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
 	if (!ph2c)
@@ -517,11 +515,10 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 
 	psecuritypriv->authenticator_ie[0] = (unsigned char)psecnetwork->IELength;
 
-	if (psecnetwork->IELength - 12 < 255) {
+	if (psecnetwork->IELength - 12 < 255)
 		memcpy(&psecuritypriv->authenticator_ie[1], &psecnetwork->IEs[12], psecnetwork->IELength - 12);
-	} else {
+	else
 		memcpy(&psecuritypriv->authenticator_ie[1], &psecnetwork->IEs[12], 255);
-	}
 
 	psecnetwork->IELength = 0;
 	/*  Added by Albert 2009/02/18 */
-- 
2.32.0

