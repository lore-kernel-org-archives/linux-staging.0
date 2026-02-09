Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B19318BB9
	for <linux-staging@lists.linux.dev>; Mon,  9 Feb 2026 23:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770681136; cv=none; b=GzZnoynKeDXjHTTbAGXkXSv1Ha5xiu68UG0v1sRWtVgY3j/Zx6dc+gh6nWPvXNI37qCbCMLTkmnRVOwtK8o6FoFSQk8YdyZbripvAHhTsDARr8CXAjuVx2qDx0slAb75wTqa8N3qvQ66IXrhnbj3IpOUWb7D66e/VTm77r4xrXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770681136; c=relaxed/simple;
	bh=JGVZPkVppnHMIo8P4cfkz88wsSVkgOGuQwKwjobYF0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DnY0Cy9qkjfzR7RgwU5vMneIX3F1JV4m9cioXVoJgpjI0qZdEX+jqwkwRIAI6WpXAiIZ4PZoVbK+SiaXilO1yGKMMGoepJWGXNFvBbmXP/zfNpfTWwt8DOsLeps4V0ZIFOnAgSkgCHGDByHYd8+zcmv0XE3x4BDE4OlkgPQnQ+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=esohzEjv; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="esohzEjv"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-35621ce8a9cso1072507a91.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 15:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770681134; x=1771285934; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYdUAAN/G5UFlt9WjWri0jhsBKaunl7bzWpCbawTbVU=;
        b=esohzEjv+nhA6/WdF2YWOgPjTRW0Px33c1MB2LsP8mgVhIZCmeVKEBayU3YH+pMq9B
         6eneItnbrKeYeTOvYFcTuasZGqCKS//G+nzEsuJOMXe91eHPDadxzV67WUOTQZNFc/0e
         tWTNAIgG/PJ1KQQB1+EZQs1FaBBrBQW4xBeFjAXzKaD51CQ0I44AZaGOs2b8Cbs1Fbe7
         Z6MficiQucbziTYPg+6GC24LHirCpVaY/vX8yl7dk1NPQWVRgfRGYLF/g0chKBjGjB9Y
         YrjjhOAWWh8a55KtVDgRsquTdSOcouJTqoszkHbau8kQKlCelHSbHT2TsovtUXpXPBqi
         j+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770681134; x=1771285934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FYdUAAN/G5UFlt9WjWri0jhsBKaunl7bzWpCbawTbVU=;
        b=MbxKkGbcXD19SOya8usAfhjP3S1r9/W2oIQUxGkko39kreqhcwGQTOeW8JNzoE85pU
         1YqpUypfFZ1BWMh97qXCu7JJE4OaFdILhx3tU/kSfPn2NL0nG1ZGiLTFmpvmRzIDIYpo
         UYLqF4hYQemR86FX+e4AZnh1sHVCfDRusIapjQTVpLZoUHfm+RBeobAp2i2fuzv/m5mX
         EYHiOAn+xd0GZpRuUOlpB6WauzBHu3bBSuxtXVqX6dVS701c2EF56WKGucRkVr7zL0b+
         S5OWgWoU3xC12RQlqQkwHwi8LXlZFPyiOljNMo64IUlK3QNMtAwI6h8v8KRpeWX2Ufog
         JVKQ==
X-Gm-Message-State: AOJu0YzmBhpPg3tsc+FYwzCSPeveR4+cLHGxkizKnyzRds25g/E6+y6y
	GEh4gMJdiKytDuRA1qh26PS3K1O5Qne/9KkOnMl2FcnamIX3ZOAISK+wxy8L+E8F+gY=
X-Gm-Gg: AZuq6aJZWROv906JdumCdm5L0wo4SsLom4EyAnds7s7oTnCJgTnSFvI/mFt7UdnlBDs
	huBld4QqwZjLJYjT+dmphnquO6uDkthe+HBC28iqe/82YjWHm+OkDWu2xVYHBuExR5zkGizECzG
	jjf61JxuPBEzL+Bvp0BqMCrr6Ncakv4NgGNUroXVUTibCghbppo28y35W/FCtF+S461jITFYbFf
	hUWn0Vqb2z/hTfr19CAcjRKOzeiHlSLB4w8JIyiTQkKcP2emEPAzo06lhOHUa06pxDYeh1AFavx
	r1LTJYTxjTmSpyXRBJGIrgwne9y79skfxB4qIPPCEsTi3ev+wQkE3A2uC95PbHtDToSdxXlhEDl
	o7qxDeDS9VNKfYItxhpKr3k6fG1+CyNSTIacwuHLRI5t5N9w5l/buUPEp8lPeJfEB0Qf4B9hRT5
	8bRRfUtXzXkN9p+f+H40ZgoubIg4AI0yOM
X-Received: by 2002:a17:90a:d00d:b0:354:c40a:3b70 with SMTP id 98e67ed59e1d1-354c40a41b3mr8426547a91.29.1770681134240;
        Mon, 09 Feb 2026 15:52:14 -0800 (PST)
Received: from Horstaufmental ([159.192.34.193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb64499fsm11581843a12.31.2026.02.09.15.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 15:52:13 -0800 (PST)
From: Siwanan Bungtong <horstaufmental@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Siwanan Bungtong <horstaufmental@gmail.com>
Subject: [PATCH 3/7] staging: rtl8723bs: rtw_ieee80211: remove unnecessary void * casts
Date: Tue, 10 Feb 2026 06:51:29 +0700
Message-ID: <20260209235133.1292161-4-horstaufmental@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260209235133.1292161-1-horstaufmental@gmail.com>
References: <20260209235133.1292161-1-horstaufmental@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant (void *) casts when calling memcpy/memset and
other helpers. These casts are unnecessary since C implicitly
converts to void * and they only add noise.

No functional change.

Signed-off-by: Siwanan Bungtong <horstaufmental@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 8fdeeda88a6d..d9746679a5f0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -108,7 +108,7 @@ int rtw_check_network_type(unsigned char *rate, int ratelen, int channel)
 u8 *rtw_set_fixed_ie(unsigned char *pbuf, unsigned int len, unsigned char *source,
 				unsigned int *frlen)
 {
-	memcpy((void *)pbuf, (void *)source, len);
+	memcpy(pbuf, source, len);
 	*frlen = *frlen + len;
 	return pbuf + len;
 }
@@ -125,7 +125,7 @@ u8 *rtw_set_ie(u8 *pbuf,
 	*(pbuf + 1) = (u8)len;
 
 	if (len > 0)
-		memcpy((void *)(pbuf + 2), (void *)source, len);
+		memcpy(pbuf + 2, source, len);
 
 	*frlen = *frlen + (len + 2);
 
-- 
2.52.0

