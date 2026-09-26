Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80493E49F7
	for <linux-staging@lists.linux.dev>; Sat, 26 Sep 2026 10:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790418482; cv=none; b=RM1x3F5SSS4zME08QXTEAByOYu8aFpiHbZvM3cCY8p4RF/h6JBGbDGEPKfeHPPGhc6j4oEly68O4V9lHWWT5m4tKQgDgrWm+Or3Kl/CN6A7kwVdw1PXLZVYPAryFJFIBgOpqmkFuhyFqvif4UBwTfF72eF1FXK87jSSOdPpJ5Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790418482; c=relaxed/simple;
	bh=EX4Uxb/Tm1kN69l5KZyoMnonP3Wjubs+yppWBVrvgsg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HMzzVgKYbejlWrh7rDwHJJN8MQxFcixy2cgQfiNYipyVZ9ef2qEqPpEZTDesnkYzT3e1IzLsAuutsg6cKYuSkew2+qA/95/LWDQgF6EHntt8LzItocl5cOHMiz6aM2wPFm1Vj4+o6j/F22j0N0RDogl/LehrKI8MzKNapk4Zr10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FFT2hzMB; arc=none smtp.client-ip=74.125.229.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FFT2hzMB"
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-342d720df34so379830eec.0
        for <linux-staging@lists.linux.dev>; Sat, 26 Sep 2026 03:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790418477; x=1791023277; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1oNYWnhVHWPsTs9fwu8jkatxdu2fZWhgiXhQOy61cHY=;
        b=FFT2hzMBEajVaocOqIjZ6nHr8EHoudDeQckrUAezw2INCeuWIVee9lySggvMSjCw0h
         52XPwXNGwUnhpFAC47oFpSD8eARZtUPld5C2QdnXzR3H6qoIMlTRlYyv1NvrZJm487WD
         +c4MpZX1HNkmKz7LFsQ3sOr1z84dW0dPOq8yasMu8zlAl3vh+mzaeFBgSlcsQ/SFzd0j
         shTahSONJBPPuvhmvBxF1hjKM5XX46jZUJPkkmhKke40vGpejAzB+X48yfonu0JAQ/E+
         ellNT8/sWLObfY2+4LKgzMmfVTr1u7MLvWtRQnb6+J5QlVzK7AFT/dwokJ74EFkYePvZ
         7jJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790418477; x=1791023277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1oNYWnhVHWPsTs9fwu8jkatxdu2fZWhgiXhQOy61cHY=;
        b=ThO2NfhxJYdkJfcTGHyFV2OGiN6PsqMjlbrbqAh1jJL08Dt4v71VHsRjZcwh29YghE
         nNNkPiCFRxoaQQWTUxTDw5eWyd9OlneDwZBaDI1hyJPtsFlydGjhT5LHfZIe08FOOAxa
         Kl6/5ElHREB2avDKaPRlVRygGevSOPnYaSK+BTD/wEeGcYxPIA5jqVtKSCMZzYiMyer+
         WUb61AqveUW2ElfBPnAtK5px94bDHHjMI9b8qYXX+3cqQf8aLWngqGS5JrErXhnunaBV
         lSdem4Be5IJj2sPNgROuzi3vtdP67HVExxHVYmf9+twp93APEwi53kT8/YjeF/cXZGno
         +gwQ==
X-Gm-Message-State: AFq9FYKBD5zr9yC7uPeesKDclfzkJaC34ZMePYfk5KdUn9ZL9txg9vcX
	jITZP55MSZWYTxlaF8HMYYEGTnVtsAO7J7GF+Pu4v6XId8IuePxewEke
X-Gm-Gg: AYBFou1RpKUt3sUCJzpNyyQEbLSrV8ZJSRsWxax0zs3ALub8f1j5mw6octNMS4njR8C
	Ww6/N9CzpzIDUStnl+CbuSOcp0Jdn5saWPnfaLzDDU4/lxqwywxes1m8bPQWGtujWUOaYB+++OD
	U/qIlwpLiVjCQgkva/dJWcoY670RmxRIFRBBnibWHy01eYUf6esGcGTmSegpnQ7d2erZ9uhdX9R
	1d48U4laEvhIlZpfZ82Cm68gemiYh0kaZQ2D2kcam6CSYl893UbQyv8ge4+LX4+ZthZL5EV1fRo
	I/EnjT81IY2uc6ch9hGzW0YTBLFbj97bRHzH7XileaDB2BxHQFsD0fzZJL0UjaEubS4IS2ZovYD
	q5oU2w1kuEQ+DDe88rFheLDxKod51zgQTbn0kakdmlf2lAXO3KXhThEl71aQMIqLylXQxyezRqF
	88mxu6ixYkQKNxwc/tEhYzY7ktCzkAdltkJYWdWJxD2fMuZbYaLt68XXewwKrM38OscjdnXCinu
	CWwIPCyYXMbEp3OoDMgVKfceMT+2z/90T2onA==
X-Received: by 2002:a05:7300:c88:b0:33c:e91:271b with SMTP id 5a478bee46e88-34273347562mr3890672eec.36.1790418476668;
        Sat, 26 Sep 2026 03:27:56 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3413fc2413dsm13027997eec.0.2026.09.26.03.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 03:27:56 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] staging: rtl8723bs: make xmitframe_swencrypt() return void
Date: Sat, 26 Sep 2026 10:27:36 +0000
Message-ID: <20260926102736.2773-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xmitframe_swencrypt() always returns _SUCCESS, and none of its callers
use the return value.

Change the function to return void.

No functional change.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 95350fd6a94f..51d63fb7a311 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -881,7 +881,7 @@ static int xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 	return 0;
 }
 
-static s32 xmitframe_swencrypt(struct adapter *padapter, struct xmit_frame *pxmitframe)
+static void xmitframe_swencrypt(struct adapter *padapter, struct xmit_frame *pxmitframe)
 {
 	struct	pkt_attrib	 *pattrib = &pxmitframe->attrib;
 
@@ -901,8 +901,6 @@ static s32 xmitframe_swencrypt(struct adapter *padapter, struct xmit_frame *pxmi
 				break;
 		}
 	}
-
-	return _SUCCESS;
 }
 
 int rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattrib)
-- 
2.43.0

