Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0309F3FD2
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 13:27:09 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id u15so805835wru.6
        for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 06:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9fEc5H1/dJK7kbB7Zq4oeHdHd+S6Nk+AiiBRDAVWQuQ=;
        b=csGDyJmNerJxVcvLyj+IxSvsY9ZKq72TUfVRzJQvXW8sGyyKBAqBksmEAvRZANkrnn
         ieHETmJ3FBekVAH24UWGA7bI1uMY8dXsaiN9+SfXQdrOoSCIIQ6bYIUn+WXTY2RjM8w6
         2/PYWv17AtRLR4fHuMUbvLnFRoB7ZHiwrBTlDYeT51MPePrHWyHwBRnhGlWtaD0M/2jN
         qJow20EPUUahE++2UsSeo1kWCJS+pompr8rliCeGdRsVGSPT+RQvEPRzaIhnAzYBPXT+
         KUnB5YPLqoLRcw0EWmft87Jnlp0ogX+CTPIof/hvkNqPXU3VE+lBPU3WDRNRDSi3qFH8
         aDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9fEc5H1/dJK7kbB7Zq4oeHdHd+S6Nk+AiiBRDAVWQuQ=;
        b=Na1/63hmOWZdd18aqy4ihqxr1+RmpulzJjB0vgrcxy8ytcdYQLiFb9viB5MFLOzmFn
         /91I4jamfyM/ANIQNo3uIBJdQBqvSFVMvEIU+YaCd4sS96pTFKU+wnHaZDKPHZLrsDo1
         IKQXyt2zIwIAcwKFbR+AHV6WPHcKnbY4SZSxJK3MCUmJRmTTNXvu/Yep3X/9+CRbQAQP
         m7pt7lgZNna3v62AZqipMZ1KB06c9g0o4T45vy8GRVBUtOuWhYm4/T/5r0BjCR2n/h58
         M023BdaztLwbc6sWDRxYZ54P+jZCPP3C6YWCmO6qjpf8iqIsNYzQqo3SbiZdU6vXOIPB
         +Z5w==
X-Gm-Message-State: AOAM530q0kM1jEi0wK1Y60d2e/jnAFA4IcbWWgPIJC22U9iUn518qZFJ
	Dmtb+Tu0u2zmcjVQPXceJGc=
X-Google-Smtp-Source: ABdhPJxGPQ64vlPoB/Hp1CRBK1D6jbv4lJbBXLV4atGXBTFKhSpwdAuqqMVrS7ELBPHFdQiUdBsEow==
X-Received: by 2002:a05:6000:128d:: with SMTP id f13mr3086156wrx.244.1631366828524;
        Sat, 11 Sep 2021 06:27:08 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id 48sm1770253wrc.14.2021.09.11.06.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 06:27:08 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 04/18] staging: r8188eu: remove unused ODM_FillH2CCmd()
Date: Sat, 11 Sep 2021 15:26:21 +0200
Message-Id: <20210911132635.30369-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210911132635.30369-1-straube.linux@gmail.com>
References: <20210911132635.30369-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function ODM_FillH2CCmd() is unused, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm_interface.c     | 8 --------
 drivers/staging/r8188eu/include/odm_interface.h | 5 -----
 2 files changed, 13 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_interface.c b/drivers/staging/r8188eu/hal/odm_interface.c
index d45eacabfbd6..7b36584f0e6d 100644
--- a/drivers/staging/r8188eu/hal/odm_interface.c
+++ b/drivers/staging/r8188eu/hal/odm_interface.c
@@ -155,11 +155,3 @@ void ODM_CancelTimer(struct odm_dm_struct *pDM_Odm, struct timer_list *pTimer)
 {
 	_cancel_timer_ex(pTimer);
 }
-
-/*  ODM FW relative API. */
-u32 ODM_FillH2CCmd(u8 *pH2CBuffer, u32 H2CBufferLen, u32 CmdNum,
-		      u32 *pElementID, u32 *pCmdLen,
-		      u8 **pCmbBuffer, u8 *CmdStartSeq)
-{
-	return	true;
-}
diff --git a/drivers/staging/r8188eu/include/odm_interface.h b/drivers/staging/r8188eu/include/odm_interface.h
index 4769087b9412..9afc5178955f 100644
--- a/drivers/staging/r8188eu/include/odm_interface.h
+++ b/drivers/staging/r8188eu/include/odm_interface.h
@@ -130,9 +130,4 @@ void ODM_InitializeTimer(struct odm_dm_struct *pDM_Odm,
 
 void ODM_CancelTimer(struct odm_dm_struct *pDM_Odm, struct timer_list *pTimer);
 
-/*  ODM FW relative API. */
-u32 ODM_FillH2CCmd(u8 *pH2CBuffer, u32 H2CBufferLen, u32 CmdNum,
-		   u32 *pElementID, u32 *pCmdLen, u8 **pCmbBuffer,
-		   u8 *CmdStartSeq);
-
 #endif	/*  __ODM_INTERFACE_H__ */
-- 
2.33.0

