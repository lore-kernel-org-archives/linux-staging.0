Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544FD72
	for <linux-staging@lists.linux.dev>; Sun, 10 Oct 2021 07:08:52 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id k26so11965470pfi.5
        for <linux-staging@lists.linux.dev>; Sun, 10 Oct 2021 00:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=NnvNITiJrBSPHawLF3zDlRAc4rrEXIDC7UHTgO1Ku1I=;
        b=q12ZZL84Tkbasfna4BmFiJlCpPt18tKqcP6uP2W9BOXWKfV1gurpiQYaWra73AzouX
         VpCyCWrPiGING82efBBsZMAeEAgsk1iYeLCqHQrHNXyLNrPRwQJSxSzxrf/hickh+FiP
         dErt4DFQh83+V9ocCx0FRnwn49CkaCj+a8vNAbVLWamQqQ2tvoJYR0oGZO7lq35lJNR0
         5B8YQapoguD9wrYFWDbeUW9W3Sh7SXnYisZAytcCRuPL/BxEsllS1m/aiyMx+M1TCAyH
         MTrhvX7H73CcpSdlbYsKunl1WAwMhoR/Oj3hEGc2S/ZIlFaMKG5UbvyMrExbiRLrBrW+
         BF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=NnvNITiJrBSPHawLF3zDlRAc4rrEXIDC7UHTgO1Ku1I=;
        b=AXi8SJkzTEYK+y9yk7QKBspd/4UYzmeqfkhx22x9qvyMFo6vBAAuUGsm3JaUmM9nWa
         CcQsT6EiFTJoAlfOxp57tC71zQvCTmbyvcb+4d4M1RFolLWW5++RB9ZuOwTqhkZ0xSL+
         waizmAiyhN49BSLOsSjmxMvC8Zr2kGAyAqI7k5YP4sPjdjZQdp0a2j0ZezoUT6a+2kVu
         5QF1RYDh4awRTGC4vChtoJCUysw4yTVQ9S1UKn7P19sfwBrNwKlHzTwB1IkFCWKmyRIZ
         ubZvbmLUeHBUT5bZfAEPg4OOWUcF6NhOyxtTpt1XbMgCfv2cLoIulhiUr2EYMDOHOJd5
         7Nfw==
X-Gm-Message-State: AOAM533WG2QT8AaM5aj1izyAJ8ryobQ88BpRsQjEnbEvDck2Q8NFMDVo
	InwfTU1bdTTWhLQBnimrMc4=
X-Google-Smtp-Source: ABdhPJxmema94gfSVmx7Z5qkzmZ8GJKpcNBrAq+qgHtEunarpfEtV8sKR3ZN5n+giEId3FhFp9zRcg==
X-Received: by 2002:a63:d19:: with SMTP id c25mr12667130pgl.393.1633849731682;
        Sun, 10 Oct 2021 00:08:51 -0700 (PDT)
Received: from user ([223.230.43.197])
        by smtp.gmail.com with ESMTPSA id u24sm3844457pfm.81.2021.10.10.00.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 00:08:51 -0700 (PDT)
Date: Sun, 10 Oct 2021 12:38:45 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: gregkh@linuxfoundation.org, fabioaiuto83@gmail.com,
	marcocesati@gmail.com, dan.carpenter@oracle.com,
	hdegoede@redhat.com, saurav.girepunje@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: rtl8723bs: hal: remove duplicate check
Message-ID: <YWKRfYpTioAmTWa0@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove 'bPerformance' from if condition check. As on previous
if condition it is already check for same variable.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_DIG.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_DIG.c b/drivers/staging/rtl8723bs/hal/odm_DIG.c
index beda7b8a7c6a..7e92c373cddb 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DIG.c
+++ b/drivers/staging/rtl8723bs/hal/odm_DIG.c
@@ -544,7 +544,7 @@ void odm_DIG(void *pDM_VOID)
 	/* 1 Adjust initial gain by false alarm */
 	if (pDM_Odm->bLinked && bPerformance) {

-		if (bFirstTpTarget || (FirstConnect && bPerformance)) {
+		if (bFirstTpTarget || FirstConnect) {
 			pDM_DigTable->LargeFAHit = 0;

 			if (pDM_Odm->RSSI_Min < DIG_MaxOfMin) {
--
2.32.0

