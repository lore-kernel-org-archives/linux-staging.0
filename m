Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D095C6D32
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:12:21 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id g17so24108071edm.6
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c308+yfadZXEa39RyDgSQZ1T5YwYu876mH/IhtVO9lY=;
        b=vpbJHZQElgTKMg7MZK4yVQWT5MNYrJDerCHirB2wFA8G3AZRMFEQcQpFUZFwtXxRy+
         Rvo5fW7txqAsIj2bGYRVSCqsfqlvaQ9AywFTg2onkFj8oxK77cVcJ3mcTrikEOK6oXit
         oUBsigv9ixcqNyOqMtDIkoyttIfzMIHq9T4VbyEaq8pc4KYsVJt0oOSSTZMBvbmQr0u6
         qfsZF2iiLJUg+oMPG7txVPXxCH2jYhmWvaNjQhV0Eon50218HU01wsW32DzvyL/zwLlV
         nUizxS9lGhM9O/RVzKdyVlJrke48GqAybl7i9yl0kO8uImP5AJpebD6K1b+x9wL+/lVI
         nx1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c308+yfadZXEa39RyDgSQZ1T5YwYu876mH/IhtVO9lY=;
        b=HSQqFzxMi/sTKiVvA/Qps4djNcZy7oH3Qr5w+8LCKppwexQz29BwrBdnBgEeZum1Kt
         JLUYDN6PcocpQcVjalsEWycF/Do5I5XlRLMBC07EaZCRIF2EEcGjKH0AOnJXfs+NlT++
         oog4IqsKFGYJm6rZR5jFpF1V+e7QQLY1e1osUfrDDpA3SfU+Hg7ehBg8Hp2+k6byhia0
         Mq938/6yxhvGS/2VRXgIxOS/S/EM56GfwJBQZ8lvq5Lhyd1XbH5TjzDf5woUw0n772c6
         4HH9FtSGVsOxwsnr6az7EOzvA6wALRJnfcm5RymPwlNC6OVqadnhpNxCYRvqrVLxvVb4
         aMgA==
X-Gm-Message-State: AOAM532RKE2v8sa40lM7OKzfFZcOCXPUxBXf9gZcCohGazbqj5XIeqId
	vuTo+gG3IA4NxKkB0vKeHmNAkQX0gcVgEQ==
X-Google-Smtp-Source: ABdhPJxJHo4U6+7XhGwn5uG58L7ljlneomW9CWI0TBM9S7XMFr9qGk8Nv1avk9FzWWD6BHXmERjByg==
X-Received: by 2002:aa7:c74c:: with SMTP id c12mr183517eds.346.1618423940400;
        Wed, 14 Apr 2021 11:12:20 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:12:19 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	karthik alapati <mail@karthek.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH 44/57] staging: rtl8723bs: hal: rtl8723b_phycfg: Fix a bunch of misnamed functions
Date: Wed, 14 Apr 2021 19:11:16 +0100
Message-Id: <20210414181129.1628598-45-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

... and fix a misnamed param.

Fixes the following W=1 kernel build warning(s):

 drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c:53: warning: expecting prototype for PHY_QueryBBReg(). Prototype was for PHY_QueryBBReg_8723B() instead
 drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c:87: warning: expecting prototype for PHY_SetBBReg(). Prototype was for PHY_SetBBReg_8723B() instead
 drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c:252: warning: Function parameter or member 'RegAddr' not described in 'PHY_QueryRFReg_8723B'
 drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c:252: warning: expecting prototype for PHY_QueryRFReg(). Prototype was for PHY_QueryRFReg_8723B() instead
 drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c:285: warning: expecting prototype for PHY_SetRFReg(). Prototype was for PHY_SetRFReg_8723B() instead

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: karthik alapati <mail@karthek.com>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index f43abf9b0d225..011b42e1b9917 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -38,7 +38,7 @@ static	u32 phy_CalculateBitShift(u32 BitMask)
 
 
 /**
- * PHY_QueryBBReg - Read "specific bits" from BB register.
+ * PHY_QueryBBReg_8723B - Read "specific bits" from BB register.
  * @Adapter:
  * @RegAddr:	The target address to be readback
  * @BitMask:	The target bit position in the target address
@@ -66,7 +66,7 @@ u32 PHY_QueryBBReg_8723B(struct adapter *Adapter, u32 RegAddr, u32 BitMask)
 
 
 /**
- * PHY_SetBBReg - Write "Specific bits" to BB register (page 8~).
+ * PHY_SetBBReg_8723B - Write "Specific bits" to BB register (page 8~).
  * @Adapter:
  * @RegAddr:	The target address to be modified
  * @BitMask:	The target bit position in the target address
@@ -231,10 +231,10 @@ static void phy_RFSerialWrite_8723B(
 
 
 /**
- * PHY_QueryRFReg - Query "Specific bits" to RF register (page 8~).
+ * PHY_QueryRFReg_8723B - Query "Specific bits" to RF register (page 8~).
  * @Adapter:
  * @eRFPath:	Radio path of A/B/C/D
- * @RegAdd:	The target address to be read
+ * @RegAddr:	The target address to be read
  * @BitMask:	The target bit position in the target address
  *				to be read
  *
@@ -263,7 +263,7 @@ u32 PHY_QueryRFReg_8723B(
 }
 
 /**
- * PHY_SetRFReg - Write "Specific bits" to RF register (page 8~).
+ * PHY_SetRFReg_8723B - Write "Specific bits" to RF register (page 8~).
  * @Adapter:
  * @eRFPath:	Radio path of A/B/C/D
  * @RegAddr:	The target address to be modified
-- 
2.27.0

