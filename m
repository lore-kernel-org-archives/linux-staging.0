Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA102CA0
	for <linux-staging@lists.linux.dev>; Fri, 28 Jan 2022 11:54:58 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id u24so9298823eds.11
        for <linux-staging@lists.linux.dev>; Fri, 28 Jan 2022 03:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rYcKKUC0DJ5U+UFpd0rarJw3mrhHuo/xI2TduGQquMw=;
        b=pMdRF4HTSskGIzaus8V13bLzXZuJL2KoBZQ/pdp6ALyTY94SQgDU0Or+bmjMttfb7f
         6Q/YECi1w/de6nfTyKQ/UMXtQgOPjqDVjKzBkPYCMwILSTDAyRtNuOMBOxuEL3H61c2a
         iGKSECzCTwusQCgLGseyhOW30+F4qNjXcV5IBwBio9Y3am0yyYNEvWxxQhIb0W7sSrWS
         rOGdT4MsIegJms7SSA7/e+o9vg2K+Dn6Evb0PEf+LYpZA9li2JWh+i5vMTOxIdwDFPqq
         3MIexsLTj9beqUCo+Aal1BuS0mTKcftexgoZNdPDS8zQW69dUOI9/O0AYzBn7fLTMFpj
         7Bfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rYcKKUC0DJ5U+UFpd0rarJw3mrhHuo/xI2TduGQquMw=;
        b=FZ0DicQb8nRcJRDdZWVFC4MGhDUD5aw+4JXCdMrUAHowyk2uLjP8VSq7M6hJf0c7PO
         o7VYQJBzT2FH0xmfS8/8NfhXctRfPs2oP8/NedRKuZqsJD5vXHT9dISYHhAFBNgad7vN
         IngnRNs6ubg6i5Wd7mMDA1+yqYc7Ln2Kk0T1aVl4N+FLZb7kKqGJVIcRALkYwrLezjfb
         8o9x5Kz1b64OhgVfrab43Jx0/gBSRJiYtI+mcwpWRVd23ndoATZFeRi4YvqsNJJMXEd6
         iZc6BhK0rAa/KCCcLeBDbzM9MocKs7pplsKa/FoH0rReDJFAhM+47ZbFjafmEAkNC7qC
         Zsfg==
X-Gm-Message-State: AOAM533wup9hzFVmi9rsWPVjSg7ubhkmNZ/AnebVTWgdXxTPkfG8WgbO
	Z/egw0ZMGQbl4TIy2Cj4sTk=
X-Google-Smtp-Source: ABdhPJzG99Lv0g65i4LcvY/9roHxtf/XxjYMUpzCuBbthShAEZARuQR+/kGBhVY2FjUmVqlRw9So9A==
X-Received: by 2002:a05:6402:3585:: with SMTP id y5mr7921099edc.104.1643370897115;
        Fri, 28 Jan 2022 03:54:57 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb9e.dynamic.kabel-deutschland.de. [95.90.187.158])
        by smtp.gmail.com with ESMTPSA id h20sm12494261eds.9.2022.01.28.03.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 03:54:56 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/6] staging: r8188eu: convert GetHalDefVar8188EUsb() to void
Date: Fri, 28 Jan 2022 12:54:43 +0100
Message-Id: <20220128115445.6606-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220128115445.6606-1-straube.linux@gmail.com>
References: <20220128115445.6606-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The return value of GetHalDefVar8188EUsb() is not used. Convert the
function to void.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_halinit.c  | 6 +-----
 drivers/staging/r8188eu/include/hal_intf.h | 2 +-
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 87382806774b..7a640fbaaca6 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1600,10 +1600,9 @@ void GetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 }
 
 /* Query setting of specified variable. */
-u8 GetHalDefVar8188EUsb(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue)
+void GetHalDefVar8188EUsb(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue)
 {
 	struct hal_data_8188e *haldata = &Adapter->haldata;
-	u8 bResult = _SUCCESS;
 
 	switch (eVariable) {
 	case HAL_DEF_UNDERCORATEDSMOOTHEDPWDB:
@@ -1647,11 +1646,8 @@ u8 GetHalDefVar8188EUsb(struct adapter *Adapter, enum hal_def_variable eVariable
 		*((u8 *)pValue) = haldata->bDumpTxPkt;
 		break;
 	default:
-		bResult = _FAIL;
 		break;
 	}
-
-	return bResult;
 }
 
 /* Change default setting of specified variable. */
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index f382b7fefb4a..96016e175cb5 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -102,7 +102,7 @@ int rtl8188e_IOL_exec_cmds_sync(struct adapter *adapter,
 				struct xmit_frame *xmit_frame, u32 max_wating_ms, u32 bndy_cnt);
 
 u8 SetHalDefVar8188EUsb(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue);
-u8 GetHalDefVar8188EUsb(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue);
+void GetHalDefVar8188EUsb(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue);
 
 unsigned int rtl8188eu_inirp_init(struct adapter *Adapter);
 
-- 
2.34.1

