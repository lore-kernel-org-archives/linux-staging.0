Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7972D375F97
	for <linux-staging@lists.linux.dev>; Sat,  4 Apr 2026 23:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775344517; cv=none; b=t7olzq4PVa99ua/G+JvSqraKA06TCR8EXfmTh4zjDIqFi+EZ7OnIPWjzL1KtbiA1Kw11StzoRzgTaGKY/DJLsQPrrFukl2omJoU2fn7BWllFEPmnzzRxcELN9VQoTSfYX/tJKUxDnVrf3wpR4pPiaKVr9hYda4+TcI5o1cdm/yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775344517; c=relaxed/simple;
	bh=BFfEBHoOQD9zKHEK3USgxGLRzNVMUlg5LDU4MWxYSFA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ur27WGlrqHkQ2U+Se50tz94SoEPYnCxalWdkEW8o5/x4I5HIWAb4j2FmoKUYUInNp0g5GVYeyC4+TcqW9HXoshWDhp1BiwngrZUgYpm7N8TJ/xNGqFS8qrgS6rYHq87g+Y/J1hB8UV7GHG5st/FzVjNKisk/mpuamH+uWwII6Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OcSvjFLr; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OcSvjFLr"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso2878890e0c.0
        for <linux-staging@lists.linux.dev>; Sat, 04 Apr 2026 16:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775344515; x=1775949315; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IsyZtp0eCcqVcLwkTIytTvDvI0E5vLNCVUYCrxMKN0s=;
        b=OcSvjFLryI6MSK804YYwEmb+3CvgbDm/1U/DnL5tX0uETLMocBa/vMv1BA9oyIdPjr
         qx1wHGogOkm05qEtChTYungiLn1/Pfx8F14nzf4CKXmitKoUOlhGoF8rY73dx2nd4XiU
         gEyYZfFM+/XdKT1mN+0tKVEpm19xIB+8maoJOKVK9omgid5hYm+q93yzV3vXt1SUBMBm
         ZwqxW44nxZqdngqC0XcK2YEk6Qxf+uaAon15rGPbIfK2nBVT/Uyttk0uGRivF5SY0IDZ
         l+PjSzNB5q6l1AhRxThbz0QCsRXDiWWzklu+JE+FUeTW8Pd8DxKJclQA5pyUVAZ8/qJQ
         hjqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775344515; x=1775949315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IsyZtp0eCcqVcLwkTIytTvDvI0E5vLNCVUYCrxMKN0s=;
        b=eWof9M/skSHmhK5uXs8nSJvnJyF7f08fFLhs0kADq+GuVylJOHfYe+TSt/LHoQNvtd
         VFUjlThpDSt+v7mmab0YIKVsPVsvgiZ+N5TjLo/HH0pJIC4EQiHo4iCMgIGcn37qtjBp
         G544HEYcNiUf0D5uUDaQjAvT5WjnZP+90JPEJEds4yzLmMkYr5nDO1tbCBPSwe3G2QH2
         Ug8YdoY7hwT0Kt58P4BZTb4lzmpoks7YoIqzngmBYwljqgsguoCiJiWoHZfu/t8mwLAU
         5XJS0lTc15hHxK9ROrog14ZLMTpveMRwU/Pxg/Tmnx15Sje3w8sTEJAo4ukoQc+zV8bC
         n9+Q==
X-Gm-Message-State: AOJu0YxjeiH5uepF2ccZ2Zm51gbOCNU4l8If2HPLSxL7UIGgwJNFfZOG
	LTVgHN4DrhLe0NmkOdM+XCebKB3JbQlDugDjd9ZWdNNCxtJ5Fh3DiSjg
X-Gm-Gg: AeBDieunRlMy1N/A5T+FuFtm47rb1VrkuZaKQcOvHdxvLUtOgjaPC9Xp7HYIoG6qnhS
	MsL1G6/udibING/x+INln1e7IVwWLTkSPYCmLp35AgeaWaTJH1vL59Bu2HR47LZAYCIk/zQb8Tz
	Sf+grW77tmuvnhWiHDH9W18LxGZTVQ089F5prO1VgoR3C/JtBoFv/NKUr6HV8whMxNGTe66YpHW
	GsA2eh53pSdy53xBzzQntxrsxNbDznVR+j+dpyA8JRVJGOa7Yox9DP8gSc87MfMOyNOqTHLcMdg
	QXzpo4o2fsdzfasLWoeDX70+h6rqWGI9tHIqTTR+T7M07tNKVTJfuFXpiLDDA2n1YXxHqO8vgYs
	JIGwa/3ff+2im8CkftHjTxf/dGUSZpDgufkvtE+3ePltr++S62Jf1BWQ05HWJXHhDLmkWBG8OvQ
	3tgC6h6VvzY8vpCg20TimJwhdgG/sxjn7QC8p8aQy8
X-Received: by 2002:a05:6122:4b8a:b0:56a:f34d:f225 with SMTP id 71dfb90a1353d-56dab9b2575mr2856867e0c.11.1775344515249;
        Sat, 04 Apr 2026 16:15:15 -0700 (PDT)
Received: from localhost.localdomain ([102.244.98.15])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bd0a8a3sm11835630e0c.17.2026.04.04.16.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 16:15:14 -0700 (PDT)
From: Delene Tchio Romuald <delenetchior1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Delene Tchio Romuald <delenetchior1@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: fix out-of-bounds read in portctrl()
Date: Sun,  5 Apr 2026 00:14:49 +0100
Message-ID: <20260404231449.63661-1-delenetchior1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In portctrl(), the pointer is advanced by hdrlen + iv_len +
LLC_HEADER_LENGTH and then 2 bytes are read via memcpy() to extract
the ether_type field. There is no check that the frame is large
enough to contain these fields, so a short frame leads to an
out-of-bounds read on kernel heap memory.

This code is reachable during 802.1X authentication when the station
is in the ieee8021x_blocked state.

Add a frame length check before the pointer arithmetic and wrap the
existing ether_type extraction in the else branch so that short
frames are dropped safely.

Cc: stable@vger.kernel.org
Signed-off-by: Delene Tchio Romuald <delenetchior1@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 28 +++++++++++++++--------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 337671b12..1c84a5f6d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -532,17 +532,25 @@ static union recv_frame *portctrl(struct adapter *adapter, union recv_frame *pre
 
 			prtnframe = precv_frame;
 
-			/* get ether_type */
-			ptr = ptr + pfhdr->attrib.hdrlen + pfhdr->attrib.iv_len + LLC_HEADER_LENGTH;
-			memcpy(&be_tmp, ptr, 2);
-			ether_type = ntohs(be_tmp);
-
-			if (ether_type == eapol_type)
-				prtnframe = precv_frame;
-			else {
-				/* free this frame */
-				rtw_free_recvframe(precv_frame, &adapter->recvpriv.free_recv_queue);
+			/* Ensure frame has LLC header and ether_type */
+			if (pfhdr->len < pattrib->hdrlen +
+			    pattrib->iv_len + LLC_HEADER_LENGTH + 2) {
+				rtw_free_recvframe(precv_frame,
+						   &adapter->recvpriv.free_recv_queue);
 				prtnframe = NULL;
+			} else {
+				/* get ether_type */
+				ptr += pattrib->hdrlen +
+				       pattrib->iv_len +
+				       LLC_HEADER_LENGTH;
+				memcpy(&be_tmp, ptr, 2);
+				ether_type = ntohs(be_tmp);
+
+				if (ether_type != eapol_type) {
+					rtw_free_recvframe(precv_frame,
+							   &adapter->recvpriv.free_recv_queue);
+					prtnframe = NULL;
+				}
 			}
 		} else {
 			/* allowed */
-- 
2.43.0

