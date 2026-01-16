Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76AE3375DD
	for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 16:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768579781; cv=none; b=KU3HiNcP6hhBIovI/34vj9iUqaFeoRKHFWqvIid6r9B2UFS24cbA+pb5srUcQIOP5jmnpEhmZ3SD3sL6Wf29dj4pv2CJUpB3iyTiMwToj4u89YkIgtaoY2NmSBGOALTfI74tttWmNUyOh1XfFnZ3n0c4vo4Mevy4TlF+IQdtZCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768579781; c=relaxed/simple;
	bh=bO5zymcyZarooLDErLzgmF54iwY4TrgFt/XMuVuCq7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f1Mf/AiKDUoQARg2kH/fKMXv2PE8i90BNjnyxOPymNfYUgD4pJRayJaovXZVCblJyZVmf0Orn6IcQXXxneZAtpfRu4DmCJBLpzm4dZHIdEoaDlo19CtZz3S5+zGe1UPY/SYImPtKpkd0+9Q0spPhb+VmdBOwP3pCCqRMqB7ADiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ejLzh9sK; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejLzh9sK"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-88fdac49a85so22724926d6.0
        for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 08:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768579777; x=1769184577; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FPi0jfs6WP6pYpeYjKG67SdyjTmO3oa0UAbq+GKQQU=;
        b=ejLzh9sK+/CVRgkSPby6zpiHoHeSbTSxF2beD7s7XWhX4hFXX6wy5Du5OaKqIQR45T
         YnqV9qpHodJqQurkRQzQVBL8E8eTlaE6NtSCKbjzplf0vBg+WML5lIrWxypmtH4VVryF
         hkdf40+Rm4xQ36lECoYJEFyIfD6YwYIFZwe/+AYp/gRcHCk0SnYtK3apsHqNdHCdh7Ku
         5pXIovTKdry1xtvbwIFxWsG/XYbh9iZtP9+NFYntDo+x3aXQQblklQgbDqpenzg0S7Xu
         7h/wx7c2GF/vw6T43KV5aggSP3/PDmhrxJ1QE0dl0jHBQMMTDR6T/B8y7VQ7liqhizTT
         2IjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768579777; x=1769184577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4FPi0jfs6WP6pYpeYjKG67SdyjTmO3oa0UAbq+GKQQU=;
        b=AKfX8Yyay+F1pagsc7GVNXD/x7PZ1En7a+qAcHh9+FD97JlMRTH4NhEV8y6qTcTVbK
         SAMznQOHfwmoP5Dst6RyYr9tA+oVALzjEq4dWWcJLBvj1J3xHxZROUa5s1oWmgaqFDJA
         p3qDpKl6CQV6KtCTmUyEI7ZwifxVWe9J93DRNUtKFipZOb1hS4mcUxTmpXc9Cu9+Fb2m
         g0pqXovySPSEDmwKgY8+1V26vwcfW5LlpgdblY+r1pUufSR66kibgFB0tzB1fQLMKbKC
         L2QFqvaMSR1pw44L8Y3VhbeTqqoSTnvPIsJcgwGIsPxbIiyOk8B0JEId3X24z79eeUi8
         qgrg==
X-Gm-Message-State: AOJu0YylymKHAFWmDEn3Rh+GARMKEBj+89m5HZkPCCBNKxPwgtzvmKJ3
	PyYlmu79U0o36F6ZXp8TrVxL+2FHvKHVZAqwh/5GhljGi2yslWqwVBBYA2aJNBqw
X-Gm-Gg: AY/fxX4DBc57S4oI76UNoW8FCxUAGrvPrIu2n4iDRgX5jMc9hd9XATOEloUarFW+zwY
	ugNpT0oq1xG5elwUQ+Q6UcTsWeiEY6CDQOXIb6swPN1JgGFkaZ2sOISE6l7XcD0NofrcCchOYIP
	QckvTDr+eoNObSBwNgq+uR9k4sRjRbeMxPbisqCPMTd1W5rbcWWRj2wtOVjXYNXf498hbi5TzpE
	yvDh4MhbxzZAITztTDuGwHbWQ+jw5Ba0RCIFyhZtHM9vOXdQfnHFj/TTTQ+dtcWcQPPiL/q54RK
	kytFFFGV91rlVIR4Kmd/pzyOUSydD3XCOgA0QDJkwMY+A6GiRKHHR2vvkgqIrBPD2XG4Cd44cXc
	noyANkcJQ3OhCPeWabhY/LrmC/OVrE8Hu6vTcKwn2noj9pGjUu35rhk83xmEBRzCtnzlPfLS3qw
	d+XfxtD6++iYJ61epuyhGGtOyx
X-Received: by 2002:a05:6214:21c9:b0:888:7e41:a9a with SMTP id 6a1803df08f44-8942ddb8495mr48907186d6.46.1768579777539;
        Fri, 16 Jan 2026 08:09:37 -0800 (PST)
Received: from localhost ([132.216.195.103])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e602d53sm27131796d6.14.2026.01.16.08.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 08:09:37 -0800 (PST)
From: William Hansen-Baird <william.hansen.baird@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	William Hansen-Baird <william.hansen.baird@gmail.com>
Subject: [PATCH 2/5] staging: rtl8723bs: core/rtw_mlme_ext.c: remove unnecessary else statement
Date: Fri, 16 Jan 2026 11:08:48 -0500
Message-ID: <20260116160914.88069-2-william.hansen.baird@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116160914.88069-1-william.hansen.baird@gmail.com>
References: <20260116160914.88069-1-william.hansen.baird@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace else-statement setting wpa_ie to NULL and wpa_ie_len to 0 by
initialising these variables beforehand.
Else-statement which sets wpa_ie and wpa_ie_len is
unnecessary if variables are initialised to these values from the start.

Signed-off-by: William Hansen-Baird <william.hansen.baird@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 83342d48e730..d0c88f6c4ba7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -935,8 +935,8 @@ static unsigned short rtw_parse_assoc_security_ies(struct adapter *padapter,
 {
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	unsigned char *wpa_ie;
-	int wpa_ie_len;
+	unsigned char *wpa_ie = NULL;
+	int wpa_ie_len = 0;
 
 	pstat->dot8021xalg = 0;
 	pstat->wpa_psk = 0;
@@ -991,10 +991,6 @@ static unsigned short rtw_parse_assoc_security_ies(struct adapter *padapter,
 		} else {
 			return WLAN_STATUS_INVALID_IE;
 		}
-
-	} else {
-		wpa_ie = NULL;
-		wpa_ie_len = 0;
 	}
 
 	pstat->flags &= ~(WLAN_STA_WPS | WLAN_STA_MAYBE_WPS);
-- 
2.52.0

