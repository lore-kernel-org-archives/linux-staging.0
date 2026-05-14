Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108053C063B
	for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 06:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778738639; cv=none; b=Xc6d9g7tbd6ioXMX731oEDJFEbWb3/Hlpiw/uWm2CtxFGU9Hyv6OmRxYUUkUqiH+PGwPqo00HpepFKG8hQO2VobiH9Tjt+/YgBwhFnFGAKceuaNhBwZTk2eaqtdq1+kJhGBwo3fMbrftCYKiHPan/8T8EVmgqe6W2BwtjuAyg2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778738639; c=relaxed/simple;
	bh=11dcICdL6yAMWZIt05foSVoZ8djH8Ghv+x8fPZ+bFrQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EWk4jYmDnzXLmuOebnRW/0bGNbv7V66TtbMKRPX6J/N2EmvXU36Btw9IMlrhx/N6ng3Xa/3jdgmclvqSwqW7/139+8vY8+LDzRXQflulptK6Em1XmfsJ26SgchfTpu5smwT7QbFjF5wPNxSuAkaIybln639k5CLG4xhPLu7XxC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G3+rBmLU; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3+rBmLU"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-2f33ae12f97so2985877eec.1
        for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 23:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778738637; x=1779343437; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wt6IobLS9ikgtJxLPxmko8DdVcDAzzBqW2zVT+4q8FI=;
        b=G3+rBmLU41sgFa0xRsINfrkDV/i23Ap+3QaAO0LEhXlcK0f2f4QhgVgqaWpskX8R9I
         OiTUTfFqq6VU7GUxjFx+POXNMXBjlqvSoaOERMjtxmfpF1a/z7WpGQEVcqTzbcOBCTQF
         NfOGwc4x1OQQmj+j8Eq04PvKJMal8Rg8JY5GMTnkHYSESaiXPm31rKH4ozOYG9j5oS7a
         zSSn4gy9axMbNGM+mepL7nzhPLmIbNOHUWTarBqNwxFDtlq8YmMwGsPFSaNdTUbRf3v4
         GyLGFfensdoV3WAKv6iNCoegQHMce7SIYkHTuOpmoncl6Fyrp9eSvPzLJlnyEYDx1dMu
         ucqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778738637; x=1779343437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wt6IobLS9ikgtJxLPxmko8DdVcDAzzBqW2zVT+4q8FI=;
        b=CMF6VIyZd+Ryyo10UaszWLiwOhN4lVyCxV8QOtnrNoU21wrUnj0qC2s/i7//0yALXn
         vs+yvN5q8Z2qsZyyR581SvLPB+L6eJ+xgGf8UizTNRSR3Dpb7Hilmy2CQRzfUZ+2GeI9
         yqdgPjob4XlVpXX5QsSAYw6ZMxiE1BWLnQTyJzlacqj/iVzZadRq6NFSuFJea7qiJ0Nm
         ITx3H6m1ePIPH71SCb1FAClu8R5VycLFIqbHEFokD/91osoi0aHz7+/qe0w/xzSWDRCI
         8EydcnUprQN8mwJPLGdXR3k9M75PqZL8vG4sJwADfcZOhI69vjNjs31UVGqRyS+HT757
         0Nuw==
X-Forwarded-Encrypted: i=1; AFNElJ/t8qd05n5oCPPJkBZn7p2j1JfMdKRBlZgkwwGmkINYcFYBaaDlVPwS0fhwNGXNc4LedgBN4mGMtyb5bfZG@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/q8aXuW2BMVY0jFyBrMf0ZkKNWtNYhoJ+aNMMcwAckeURgmwj
	cGgoxpP3sLg8PZyg2GbvO/tAI8vN6c7o1NaWGUzzLY6VrOzwfTJNEfEPCBv5ZPWmivc=
X-Gm-Gg: Acq92OEcZggznij/tIRColPIi3zSQOPOm5vJgDW0x+jj9DLIcwWuZtj5dE/Z2teDkv2
	qRWFyj7qWHZKeMWQG0EVHMRfS1baEXG21PrIF0zzYyKAIO0WtxAm159fiBggVnFUYF6VrMEnFMy
	Ho8QLe+YWsK7PSXGhI4O8oB79CiUdOZf0c0NwMW17CrezdHirgUQmn9fphe9ZDr5Tnw4RpK02F/
	bT/NApL5WXH0MJd3qjLt8KJK2CISTN7rbiuA5ppO9e/NZarP0ItkhxyxkmE9hjagw1MfwqcB8nV
	i9h0JkhAZjQVuXgr5M4/AA9gTP8xTd3XOWiIMRfFa2ADXQtMEVgpCSrGO5Pss7QHh9ujM9pxHxj
	xr5APlm1/i70W3DkubdhB7/83SzGxwx6YEMM3nAwpS9EpogR9NYCmPqI5UCPyy/fIq1GoLOOSaw
	dSAvpSyFqXDWktuDxLb//b3pNHEIIV6n2/VBLGYraayU/QTUpM72LAS6fPqWwSys8xdw==
X-Received: by 2002:a05:7300:a986:b0:2c1:6676:5ebd with SMTP id 5a478bee46e88-3011758698cmr3924036eec.10.1778738637099;
        Wed, 13 May 2026 23:03:57 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcb6adsm2034772eec.15.2026.05.13.23.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 23:03:56 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 5/5] staging: rtl8723bs: propagate errno through hal xmit path
Date: Thu, 14 May 2026 06:03:23 +0000
Message-Id: <20260514060323.24895-6-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514060323.24895-1-dennylin0707@gmail.com>
References: <20260514060323.24895-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Propagate errno values from rtl8723bs_hal_xmitframe_enqueue()
through rtw_hal_xmitframe_enqueue() by returning the error code
directly.

Also update rtw_hal_xmit() to explicitly map the boolean return
value of rtl8723bs_hal_xmit() to _SUCCESS/_FAIL, clarifying
the return semantics at the HAL boundary.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c       | 7 +++++--
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 2 +-
 drivers/staging/rtl8723bs/include/hal_intf.h   | 2 +-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 03f23b75d532..77fa6e67530a 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -99,14 +99,17 @@ u8 rtw_hal_check_ips_status(struct adapter *padapter)
 	return CheckIPSStatus(padapter);
 }
 
-s32	rtw_hal_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitframe)
+int rtw_hal_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitframe)
 {
 	return rtl8723bs_hal_xmitframe_enqueue(padapter, pxmitframe);
 }
 
 s32	rtw_hal_xmit(struct adapter *padapter, struct xmit_frame *pxmitframe)
 {
-	return rtl8723bs_hal_xmit(padapter, pxmitframe);
+	if (rtl8723bs_hal_xmit(padapter, pxmitframe))
+		return _FAIL;
+
+	return _SUCCESS;
 }
 
 /*
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index ff82b6efefc7..ea7c9f4ac0f4 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -519,7 +519,7 @@ s32	rtl8723bs_hal_xmitframe_enqueue(
 		complete(&pxmitpriv->SdioXmitStart);
 	}
 
-	return err ? _FAIL : _SUCCESS;
+	return err;
 
 }
 
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 9b000681ff80..ee8ad26325b5 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -195,7 +195,7 @@ void rtw_hal_set_odm_var(struct adapter *padapter, enum hal_odm_variable eVariab
 
 u8 rtw_hal_check_ips_status(struct adapter *padapter);
 
-s32	rtw_hal_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitframe);
+int rtw_hal_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitframe);
 s32	rtw_hal_xmit(struct adapter *padapter, struct xmit_frame *pxmitframe);
 s32	rtw_hal_mgnt_xmit(struct adapter *padapter, struct xmit_frame *pmgntframe);
 
-- 
2.34.1

