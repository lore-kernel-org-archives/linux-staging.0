Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389CF3CF210
	for <linux-staging@lists.linux.dev>; Wed,  8 Jul 2026 10:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783507434; cv=none; b=cV535tnNIJ3FLN5mYC1/Wuxwa2aXxYOCnCDVzFHseTvHqH/RQKTNxufDu9OF2QLNommkUb0JLj/q6DQrPjTkE2zCSHTW81GHwvfMpabWhyVRqSkyDoAaSZy5tDzvbxatsgRSEM4gWXbyzmuGO85upOj8/rBLRppHPrRyCCOgBr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783507434; c=relaxed/simple;
	bh=H5w2AGzF0fc8Ya/zdI3DizU+no0z49YzComkUyJ5R/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rYg7zKJnQYemUTfteNOhdkq+yOpEOKgUEkf5cBDGP8S9RP8Ewv1G0iRu8/zjM7puRjEIsW/qx0RL4+5NXk5hgGYqKVSnlF4pRVVb31qa3T/fzXu4oosJqTei4OI4T7K3V2KvYG6uhKjaiO65E4Fe+z8uX7gCCaoPoFfS8lRPfqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IffDWf3p; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IffDWf3p"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so3572975e9.1
        for <linux-staging@lists.linux.dev>; Wed, 08 Jul 2026 03:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783507420; x=1784112220; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sd+jn8OxzBqMCiodLdjuCiQn2jNeMVrmmbxD+3HhGec=;
        b=IffDWf3pjNacTtnio/3vIRR0mem2IRGAyiseKCDFGFyT07Wrpc30jyNBTPwihJoOB/
         F7iKi024ZWjuoiqtyFcmJS6Z/ROBVBN9UwCFSV16xF0eREZX8DRcEmNYKXC1cu4QyNOJ
         ZUn6hhO/+s3ZoRoY4dznM95UtUuA7szDjb8yzCNoVoL6dJHG9OcT+G0lsBg0E+MrRVSc
         iNKZxzrq0KzCzAyXFWu15jQGnZsQpu/GdOTtDnK216hY1F/aXBWK4pcR8h3wvDi4zfEK
         5s3qhsatxKOMlwU5byM2mz5WcCt/auBaUHt6CYQC5zAHEo0QHTURkxzu4uTa1PFn2c98
         jf3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783507420; x=1784112220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sd+jn8OxzBqMCiodLdjuCiQn2jNeMVrmmbxD+3HhGec=;
        b=lKh4KBtyIlGZvrZegINvcVPy446CeBtuXamo1DxZ1GNw350kppfvDbm3y6eu/A5HFM
         eLDQUU68Xm7gznfYbsMOSJfPWkNCNEcJzZqR4exkQMPDnoElsFDeffCAnQCdZJDNGy/W
         /EpqFbWwXhbc4Lw8nmLNf9h0HyGs8/tVBRYMCnu4ZlGl/7WeR3UKsTmpG+8W30OcmFXj
         IpqjVnduMaR9R2O1NlkkrmxdqAwA+h79/6wfEphj9WyWOBglKSjp75U2hDhc11VeeZg0
         UlV13sYr1gY2IjCxFDuP1Cv048Bsr7cN1fypThcuDNQWh0VKnUjpP+QB2eVNOnTvdYdT
         2IKw==
X-Gm-Message-State: AOJu0YwjquYX3oMYujR2JJr0AsPR1U50UcO7nLqAgN2ko67ilXAK0QYL
	ov1lHfBSr6q2yWbF1HZL2M6QPWKXwCYvxOl7adOBQBlOYYNPCMcwYjrAjhenPz2B+DQ=
X-Gm-Gg: AfdE7cm+7X9sz4kYobqog5bjjAOW8aiMVzvnr/7USj9oRVOGa34Ub1RBBTJr6qUowe7
	ZoV9srQLd0F1u6JiBZ1D7gcNcoqGdGJFFdxpW9nozXc8H74Gkx14Ckqxh76MnoFReYc3lU7+o++
	eysJk0c9EmXMQOEAjLW76CTBTl2e/nNyN26G8siE9h822vc2JjhpF6kXuTQUS84RnGT0zTOY2jP
	SWhFXEhLlWHuXsdDo5EDG86jEcE/NZKdbO8PJgQ6Sl9Va37ZuqtVCPdoSKqoQjmKQX5il5wdhNm
	7moiy77sOq9kwoWJNFujN1OJObwgiuC84vejuXSumJB6vND6bOHpnxWbK8IDJbWTeWss16Aahwn
	AJsL4+30GP6lpoE0qkfWIZXoIrXoKyomGePu6a3DPvRS1LQxCxh/1mqJUaeFc2YlCSaCd+l9jgu
	yU/ngNSAAj+sfqWTK4PWw4FadLvROM/PIKPl/oHi4qBb2UzoIFA8Rk
X-Received: by 2002:a05:600c:548d:b0:493:b8d9:f28b with SMTP id 5b1f17b1804b1-493e68c7f63mr20954575e9.23.1783507419780;
        Wed, 08 Jul 2026 03:43:39 -0700 (PDT)
Received: from fedora ([2a02:586:e223:fc00:8acb:cd0c:11d0:f2d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f50418sm117703385e9.11.2026.07.08.03.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 03:43:39 -0700 (PDT)
From: Panagiotis Petrakopoulos <npetrakopoulos2003@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Hans de Goede <hdegoede@redhat.com>,
	Bastien Nocera <hadess@hadess.net>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Jes Sorensen <jes.sorensen@gmail.com>,
	Manuel Ebner <manuelebner@mailbox.org>,
	Panagiotis Petrakopoulos <npetrakopoulos2003@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] staging: rtl8723bs: fix missing shared-key auth challenge length check
Date: Wed,  8 Jul 2026 13:42:52 +0300
Message-ID: <20260708104252.144101-1-npetrakopoulos2003@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The WEP shared-key authentication handlers use the challenge-text
element's length. This text and its length are attacker-controlled.
The handlers do not check the length against the fixed 128-byte
chg_txt buffer.

In OnAuthClient() the length from rtw_get_ie() can be up to 255 bytes.
It is used to perform memcpy() into the 128-byte pmlmeinfo->chg_txt.
A malicious AP sending a malformed WLAN_EID_CHALLENGE element can
overflow/underfill chg_txt by up to 127 bytes. This is reachable over
the air, before association, during shared-key authentication. In the
case of an overflow, the driver can write out of bounds. In the case
of an underfill, the driver can echo stale buffer memory. In OnAuth() 
a similar issue is observed. The driver compares a full 128 bytes
regardless of the element's length, reading past a shorter element.

The challenge text is defined to be exactly 128 octets, which is
already provided as the WLAN_AUTH_CHALLENGE_LEN define; require the
element to be exactly that length in both handlers.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Panagiotis Petrakopoulos <npetrakopoulos2003@gmail.com>
Reviewed-by: Manuel Ebner <manuelebner@mailbox.org>
---
v2:
improved patch description for clarity. no code changes.

testing:
Compile-tested only; I do not have RTL8723BS hardware to test the
shared-key authentication path at runtime. The change only rejects
challenge elements whose length differs from the spec-mandated 128
bytes, so conforming peers are unaffected.

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index a86d6f97cf02..13634d4e83d1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -787,7 +787,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 			p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + 4 + _AUTH_IE_OFFSET_, WLAN_EID_CHALLENGE, (int *)&ie_len,
 					len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_ - 4);
 
-			if (!p || ie_len <= 0) {
+			if (!p || ie_len != WLAN_AUTH_CHALLENGE_LEN) {
 				status = WLAN_STATUS_CHALLENGE_FAIL;
 				goto auth_fail;
 			}
@@ -873,7 +873,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 			p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + _AUTH_IE_OFFSET_, WLAN_EID_CHALLENGE, (int *)&len,
 				pkt_len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_);
 
-			if (!p)
+			if (!p || len != WLAN_AUTH_CHALLENGE_LEN)
 				goto authclnt_fail;
 
 			memcpy(pmlmeinfo->chg_txt, p + 2, len);
-- 
2.55.0

