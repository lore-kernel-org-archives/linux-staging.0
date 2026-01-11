Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFD234D4C0
	for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 18:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768156617; cv=none; b=ngxjfjYb/ddXPi/nb5dYdmbnLobwODEcLH7dGGhZOrJyYKATPLUrAnil4lUmKEXfMsVN8Dwq4AGANKF2Ssjgx70ZNzkElYYYhqdkznIeNCbBqZxrPXfwoJkTKQrg1KlDZum5qOAE5KYY08JhjfjnqORyt5O60g5kF+lo39a1uFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768156617; c=relaxed/simple;
	bh=RfoR3xMJW+uLzSIimYsSVR3bUQmRz/kr4vXkyIqbvM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TpddRkvnf+OExojDuA3kJ0iD/9ji/v/lZG9ljak3GQ/1yusUHkeFmXmvPneCI5to/TaIk8R3zjKhmu7IwF/SUDxTzSuIBmlsOitZueIi/FdXElW4W+LqOxCSEDlA06Ir7AMmNLJtP7ODQyKUIpE5BD/Xrz8C8jQwcroNhOIy4vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XdVdg2O6; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XdVdg2O6"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a0f3f74587so43665835ad.2
        for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 10:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768156615; x=1768761415; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2bYFsTaRn2xRwgOpRbSAT236NvK7vIan+IE9pLqpfU=;
        b=XdVdg2O6W5WdL3nDImGu26DtrZtOpmFaGkGa1Hh3yGKhoFCXiup0SGN+wyo3ZFKTRy
         Pt7PhFQnRHilmFZ7rpMTditSK4howM36FvbeSKJrg+yh6fgYV9Sm50mYDP/jcJO4l86Z
         FN7lmxeRfeQgwMIub0Ju7wLrYz5WDCwEx6IcAEPATQrk3Ca3esxYOLyhRepV/vdNCsHC
         3DSVcBmUUC/u+CP3iJDbRy99PFFmx9hnxuvQlTzckCfS4U6x9cn+TOQCqgNxocXUcl84
         ESkmQXA7Er0sXm5sTuAPLM6XLQG9BUAZnG0r3X8rycg0JVXRzK4OMX75koZlUCTZ+pqR
         lcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768156615; x=1768761415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T2bYFsTaRn2xRwgOpRbSAT236NvK7vIan+IE9pLqpfU=;
        b=C7gEubI0buNMwX+Rzk1by27eo3rxxjpjX3OXlJdjPyeO7fAdplWWTCBcA7RvF17biL
         R9HxQ5qZshkKCSfaIWnroSjxKGgNhX0gy5fmTJQ6+Q896KHyw8yBNQ+KOvdnle/jnDM7
         U1rHSBE+JNp1kk5sG8W5dPBiVALVb58s6RAWPCQ9QOu9+aZ6mMNtQ0BURWieZRF3KOGI
         clfO2zv5I4bHebf0GD5UJydSlDAB2YUeL2drEQVk5QEzY3MkeazT/I+pn20vkg6Y7XFm
         WFLm9cCMLiqDepujgphcq1GldyTRy/8n71qJ//R0Vz/IewAffbxlFBNbBlRZw9o+VGgU
         E9MA==
X-Forwarded-Encrypted: i=1; AJvYcCXDqN898Ke8yp/y1J/wRxFwXvl22wEeKHEo8oOinAkLLVCmouoqs7Q/SBZmhoq3otmzFMo8mUEyIgGgBSiX@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7p9BrbLFqindBU9+PED+JMKyHQD7qWyKTO52UIBZG7P2XmxMU
	wYcSI/RIj2dRJ5yZaDbaJEI3uvr6HkcbKCxPGyqAEjYu4wDpzr5ji9VO
X-Gm-Gg: AY/fxX6I7qLGJWilOdrXkerz4DJoI0HOsY13ixdE+kgQEsTJJLyOKxPG9/Q0pwimucR
	NSlw0ljG1LMS+7kFdRvFr4NKKtoYfF94wo6/7SHLIG/Qtyy3LnjzqBMQxLVAsuQlLtUJ5N0ngP6
	HFJZf6ssPhrGgHy/hh/kGHl9jtbXwOIeJd3Irr5TPLbemQogVcVhflwrpd1bP6Q4WoJdgIdSovF
	YoXgILMfMWBhPoQCwmlDtEnKqayqKYbKYCzS/GcMDOikpoMIzpg/j2xVewCFyuqHvQSXW9P/pqI
	AJf5cD3gmWZXOpQGk6MnUoJgymeBwLgT6zj3UyJn92AaMNaWmvvbMQB0HfKgKK3DHB6nMq66R8i
	J5gjgZBF65V+ZPN5rGsk0gb7DH0svlNNmc1ACcsma5Ya7x0gBGZ0vyqRrNulw7oB+FXhZt5ynFO
	pVbctmxoXuju0XnQcWRXNT7SJI
X-Google-Smtp-Source: AGHT+IEDbYtHRruwP0zfxe5VoMray2gU36CUATh2bXwLrTEuDy8sEz8rRVhQFSHTPqf7kqY065ro3A==
X-Received: by 2002:a17:903:2ec5:b0:297:f527:a38f with SMTP id d9443c01a7336-2a3ee452d90mr149596415ad.18.1768156614601;
        Sun, 11 Jan 2026 10:36:54 -0800 (PST)
Received: from snowman.bbrouter ([43.241.121.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd2953sm152220415ad.86.2026.01.11.10.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 10:36:54 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH 2/9] staging: rtl8723bs: remove empty branches
Date: Mon, 12 Jan 2026 00:06:23 +0530
Message-ID: <20260111183630.12816-3-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260111183630.12816-1-khushalchitturi@gmail.com>
References: <20260111183630.12816-1-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove empty else blocks in rtw_xmit.c to improve
readability and follow the kernel coding style.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index b0d7e59e492d..cf7d92a85d6c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1707,8 +1707,6 @@ s32 rtw_free_xmitframe(struct xmit_priv *pxmitpriv, struct xmit_frame *pxmitfram
 		queue = &pxmitpriv->free_xmit_queue;
 	else if (pxmitframe->ext_tag == 1)
 		queue = &pxmitpriv->free_xframe_ext_queue;
-	else {
-	}
 
 	spin_lock_bh(&queue->lock);
 
@@ -1999,11 +1997,11 @@ inline bool xmitframe_hiq_filter(struct xmit_frame *xmitframe)
 		)
 			allow = true;
 
-	} else if (registry->hiq_filter == RTW_HIQ_FILTER_ALLOW_ALL)
+	} else if (registry->hiq_filter == RTW_HIQ_FILTER_ALLOW_ALL) {
 		allow = true;
-	else if (registry->hiq_filter == RTW_HIQ_FILTER_DENY_ALL) {
-	} else
+	} else {
 		rtw_warn_on(1);
+	}
 
 	return allow;
 }
-- 
2.52.0

