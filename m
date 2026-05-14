Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B09390222
	for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 10:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753251; cv=none; b=S6m8HLJPtoT7E1bK6uJYal3mzAr62dEqd5B1Aw0cciuPUDr8lbaNrCEW1I+XpNolKgfZy3uRxnZ4RJ//w3Nt3o3ci8R8UvQm0Hr/WExro1vy4Z0XN5JzshK0lC0JKvdpISzVAG3cUiuttFQnM3Mz0Hj+FDeu2qvYV3trdh8ifGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753251; c=relaxed/simple;
	bh=RPY2YGdcwZmN2y65thUH+fDewRbjIejIAuxOMinGZBA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lOv1mVGzZA2BG+uT//WteYYwulKJwMOh3ZTgIS3zNqkNC4kJqWf/mtB2v3KIigU4jkITAPBfBcMAwJrHfyEWyFwV3dK/oRCkOji4JIzMPVCPjWIu+VigwVYIybY6a5qUCy8xMPmBNhT4H4KV97bP93uMkNIENJG9K/p0PNhz8zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQmIbEZK; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQmIbEZK"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-1329507c387so3723053c88.1
        for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 03:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778753249; x=1779358049; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/WaJCxuPkp9m47CrrlWhqVf7lEthVaN44VofO+IDbE=;
        b=NQmIbEZK3qyvph21Pp3w93N6wf6DykvJNtCLe3tAVsSGt9mknTOz1mlO0ATDspPi3i
         XFoR+MVJilB445uOQy11SQXkJ5cOHKa/GtS+DV2xyEHykqWLBDfmfcOf5zHn03dk4pLh
         CD1s2BX6jq+abuo8tDZTdSo7xjU9vakDw8G9lTL8Wb8xci20boDY7byK1DA9fFMcF0I0
         6yI5I7x0tMx64WKLDOq22nskfc+70nqCgTX2ScOYH1NcU1etmsTQezVAT8BA0BC7IBT8
         KtXSTVUGFIskk0oaus+dFgWK6HJnlUfj61b0mVphA0uujLuI0fQqwtG22U4z8CeCO6V/
         kVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778753249; x=1779358049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U/WaJCxuPkp9m47CrrlWhqVf7lEthVaN44VofO+IDbE=;
        b=WtsXr9EPOwwcdfLYwzDHvXznzspucaDEGk6i3/d+fix1KOuUNIkxdMXWMTIB108pmn
         T3DwZiZDEreqdHiy3og6tP7Di/K8YE3lTU33xSEQ24UuqgwTDLcQ31mWlySO385dFTZd
         IPUPz7Hw6XdSA5gZpl/AkOMiJ1lnxz4qUU1mFe/kQ0qCp05HyC2TZIKUcMPXM2l4yptM
         8yKCv6WDeTvM+Nl+vmy0/ebjTlv5Fv5Dbmeo4S9t+2y61JRtPe/I15xbV5ISq9bc99vs
         vd025H+53qwfhVTLGegYftA/tS3DkFVdM5JI1pLnpLo28NJCgGPXNs25xlnBVmJXUq4O
         0abg==
X-Forwarded-Encrypted: i=1; AFNElJ/kAoCktpmWiUKBHdeCm0j8ik5VvvaKF3upm8XlQV6JNIyNdZkD8bYA7G1s3TSxADmf5gKmBSZYcuwN0ON5@lists.linux.dev
X-Gm-Message-State: AOJu0YyR/WDkV/+F6QJm6RwzpInM4VLkY3Dkpu14rdRRbgteCi+CEwKA
	kaLRO7XYtsTBPRI0EkHWsfyqzXou+ZjW3JqQD/dbiLA1WtiEn1V2H+MC
X-Gm-Gg: Acq92OHFlc5oaHE22Ur6Wy/5jxNnddUM+rrhCliyqoNZLebWHujFIv4psek1DiAx3YP
	O7ZGgEmHR0R19o7nbTMUxoyMKXq4yoVhg/FSzjXQMh6Ql1t6dTGlClaTsQ2ytL1ffHhoiC4NjxJ
	Dg4U7M+fyY1Vx7q+gYUM9Ndmqh+KXRBeBYPuU0psgNE5wQOW1D4a0aEVRJ5v757UQJN6AuPnbGF
	v5zdFj41UPG8dcNnNm01g+31mJFeGLew179muM83wqNxgLAQhGRJufd2KRlibBKisuzXXscZx/J
	Dn/GoKBtqP91gCJvnfA9qA07TP8uQY//yvaECfAImATgI+O2uDm3NszcaDDTgN4kzxevSfey3jy
	OBYDxpLFbJxsGHk0MgGzQoquRv81iIR0c4vj0S1r2xqmYJ0fK5e52AZvnJ3ParKnpLe7s08Ttdb
	g2CYIFe6ARoKZdXQUoZUYI/TTcLbxXdPr83BTNOLB5o1kgr8hk2rp0iRc=
X-Received: by 2002:a05:7022:660b:b0:12d:de3f:d840 with SMTP id a92af1059eb24-1349ac7cab6mr4335778c88.35.1778753248760;
        Thu, 14 May 2026 03:07:28 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb93f3sm3757921c88.3.2026.05.14.03.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:07:28 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2 5/5] staging: rtl8723bs: propagate errno through hal xmit path
Date: Thu, 14 May 2026 10:07:08 +0000
Message-Id: <20260514100708.25031-6-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514100708.25031-1-dennylin0707@gmail.com>
References: <20260514100708.25031-1-dennylin0707@gmail.com>
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

Update rtw_hal_xmit() to explicitly map the boolean return
value of rtl8723bs_hal_xmit() to _SUCCESS/_FAIL, clarifying
the return semantics at the HAL boundary.

None of the callers of rtw_hal_xmitframe_enqueue() check the
return value, so they do not need to be updated. This change
does not affect runtime behavior.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
v2:
- Clarify commit message per Dan Carpenter's review

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

