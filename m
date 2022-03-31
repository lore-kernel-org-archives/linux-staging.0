Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4827814
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 13:05:34 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id r23so28124804edb.0
        for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 06:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hDkMgRtARbafWLIsbRUHsKRuUskVl4hLD8Sy8XkZqqQ=;
        b=RuBqpGSqjVaNIFU0quQSMU7nMkXosvjERI4FrDrlsgaGgLhK7/ARVZFry+fAVp5s6S
         hq5MsxLjysLVqULWFzG5uFc3dGwdt+l1F5cuib5Evgsp+n3/C4j7gkf0qGTpyC8D7Ee7
         rT9VRxPfPa4O47VYd+paKpeo/6OXAbd61PMNSi6vaC2rz7HE07gY6WpDne/AxvKJV0ro
         1b90+Dgxu3gkPnGQktk/lmBWr4rzxXrSgZSB+MZ53RFqWUttx+vUbLVYQOOH0ct32Z/D
         p/dzmDFriyTZoPxKpfxOlAmxNzcpjIBb/mBnfMt1u5jUQFok19miYGi+yzl2x2tSR08M
         2G4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hDkMgRtARbafWLIsbRUHsKRuUskVl4hLD8Sy8XkZqqQ=;
        b=IU/1yQpqc7yylwdQNaTwA9Xy4OD3FSEgPx1/6z+JK7LGwIvmQzzdKxmnXhy0gZFEjF
         pWadCI8JXQAHvdoIeiseJryfRxMawyQKSEuWCbfp2BB4TIVADh1xHIHhmVwGhi2jn1Ga
         7uvEZrS8WWPeyLz3wYIeNaK45svl1yR5KtwS8vvULn+jWDMID+qg94f7jNxwL3/6jgcs
         2QUxXTXSOgLoFzdsBv/7OGqCcrX9vmJd8MCQlmeoO3JvOcIPTw7/LrUimZvUahfeuz4T
         wOIw7k1dK9qoMXC79sTaLsc70+++XFiP47G9LBbVu6w/Q44ai/6kxbJIPVQcixq6gCcx
         xl6w==
X-Gm-Message-State: AOAM533X0QwaNhCyUgNyTgKCZvHRbBWIRzgb9GWz7fiT0D7+FNwiv65i
	mx9inQFd4nQZM39AOI4dCClsH5uaJ+c=
X-Google-Smtp-Source: ABdhPJzlp512fZ6CXDDdg1NM8qbyrCqIy1+fO2jPvqpDCyPTWMsKe07QK7eYVqWYDPJO22cPiDbllA==
X-Received: by 2002:a05:6402:4248:b0:419:4583:eaa2 with SMTP id g8-20020a056402424800b004194583eaa2mr16571892edb.376.1648731933208;
        Thu, 31 Mar 2022 06:05:33 -0700 (PDT)
Received: from localhost.localdomain ([95.90.187.85])
        by smtp.gmail.com with ESMTPSA id kw3-20020a170907770300b006d2a835ac33sm9333358ejc.197.2022.03.31.06.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 06:05:32 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 5/5] staging: r8188eu: remove GetHwReg8188EU()
Date: Thu, 31 Mar 2022 15:05:22 +0200
Message-Id: <20220331130522.6648-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331130522.6648-1-straube.linux@gmail.com>
References: <20220331130522.6648-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The only call to GetHwReg8188EU() that is left over from previous
cleanups sets a variable that is immediately overwritten. This call
is useless and we can finally remove the GetHwReg8188EU() function.
This is part of the ongoing effort to get rid of the unwanted hal
layer.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_halinit.c    | 15 ---------------
 drivers/staging/r8188eu/include/hal_intf.h   |  1 -
 drivers/staging/r8188eu/os_dep/ioctl_linux.c |  4 +---
 3 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 37c56690b13a..6b4b0b0c4f53 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1283,21 +1283,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 
 }
 
-void GetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
-{
-	struct hal_data_8188e *haldata = &Adapter->haldata;
-	struct odm_dm_struct *podmpriv = &haldata->odmpriv;
-
-	switch (variable) {
-	case HW_VAR_DM_FLAG:
-		val[0] = podmpriv->SupportAbility;
-		break;
-	default:
-		break;
-	}
-
-}
-
 /* Query setting of specified variable. */
 void GetHalDefVar8188EUsb(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue)
 {
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 0033a0aca27b..9b465001975c 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -66,7 +66,6 @@ void GetHalDefVar8188EUsb(struct adapter *Adapter, enum hal_def_variable eVariab
 unsigned int rtl8188eu_inirp_init(struct adapter *Adapter);
 
 void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val);
-void GetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val);
 
 uint rtw_hal_init(struct adapter *padapter);
 uint rtw_hal_deinit(struct adapter *padapter);
diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 7df213856d66..6383b399ae40 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -3620,9 +3620,7 @@ static int rtw_dbg_port(struct net_device *dev,
 			break;
 		case 0x06:
 			{
-				u32	ODMFlag;
-				GetHwReg8188EU(padapter, HW_VAR_DM_FLAG, (u8 *)(&ODMFlag));
-				ODMFlag = (u32)(0x0f & arg);
+				u32 ODMFlag = (u32)(0x0f & arg);
 				SetHwReg8188EU(padapter, HW_VAR_DM_FLAG, (u8 *)(&ODMFlag));
 			}
 			break;
-- 
2.35.1

