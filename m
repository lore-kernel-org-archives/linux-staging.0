Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1668D7483
	for <linux-staging@lists.linux.dev>; Tue, 28 Oct 2025 08:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761641902; cv=none; b=LyAMB/1zdPxDs+Xmlouu2nrwXX24IgAd8GGSVokafx134fz/Z+tPBz+6+Kk76BAaWYG9tz5/mlzKQkRaGxCE/JvrS+l4dRbjQhCoUFv/LbLonK+mErbnKfHvrspTf/8KPrz9+W46lziqqVlyCfv3qeIyzGxxdkgm1auTBdXvdSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761641902; c=relaxed/simple;
	bh=T7vc8fBSsaCXuLEcScuPWNjcN2dPgBKZTUWWhxrAXDg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Pt42L9gWpFneUuAIFvnsWGdXeIDJiwkMFgA/vQzP+HqyCYCrK0Y8jXWz6KcJaYGDAIlOiw+NwugZZcTXv8+QKFUZOvDUai05rBTBmKdI1WqDQvoABtQOMVtSq0iKoKxIt3eHMu/1JNdu7WZCOMDA35HeT8FLrmDZdYNt4NRicII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZlSZr50F; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZlSZr50F"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b4736e043f9so1017442266b.0
        for <linux-staging@lists.linux.dev>; Tue, 28 Oct 2025 01:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761641899; x=1762246699; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+wFTnkf9dCxwSD/TcKQG7ubiRnRlCXjSJjeQaj9CrRc=;
        b=ZlSZr50Fbzn42Kh4MZJoIjyWhfzOugezRwOXnBzlMP4mSpwlpA/As9XeClElUHpFgS
         AoO4ix2SpmUoPjLDAWvoD42ryVnE6Iz4br6+QXOb3TFj/npuHwUVkvsWt6HDk/3ctI+x
         hvDHpfsiHOKdF/jDlqOq+EQQRw+vPctSvTX0XAP0ya+TKxmxvzY0CqwgytJaBUGQyDE3
         oiQKUtVDPU9wTX1sHmZ2jVZ7oZK+swBDFW4IPVvlCPJ4EzukbvZlJpMItoieNX7jfjDl
         y4Eiv7BYTvJjS9+POaOzViPbk6GEhwv6Q8ksSavk0o1viqMsWEDysVTTJk1ys1NSbUvw
         g4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761641899; x=1762246699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+wFTnkf9dCxwSD/TcKQG7ubiRnRlCXjSJjeQaj9CrRc=;
        b=J4gVZ3HhI7D9Jr4JYJfeB8WBDY9hUlI6AHyhQrdJXB06DyfuWBas5k8hImHOqZH5u1
         UE/sDuRJjCslcLaZbBCrCm3q5gEy6L42Z0nmRmvlNDiDYT2OOborBGoccAa37su/ow7p
         GUg8sZgAOKxbaK3G6NvUyfl56k/94fCUk4Fl+nru+UgWFzbc1rhre2cfNdOMw3DopswX
         6E9ppenuBVX1DPjhjo4azxsGFMvgXv73s4ExFme0K9Fbklgwb2KQjs5/7vp9tCqlug+k
         fAjNkqhpo6ZYWb9fzDebVvjZvn8iPR1wtfbReZ+IQLTSO+RDIhGxkxM9fefo4GLSmYSS
         wH/w==
X-Gm-Message-State: AOJu0Yzf4/XtwGkfkq5twtUrsFRVLeCk592BQhlRMbJVobLhGlYdBAGO
	z3IkwagskaBEtxOFAUnXT0SIXRF/vg+vwvkZjfEkA+0B5TkaYHXUmXvqxVqlMg==
X-Gm-Gg: ASbGncutIrpbv5I99kB/IeHXbeK42Sa2upqlEcyu8LWbT5bB1jnOAupjsc8A+NhMxLo
	duGAnWK+CkpQj02qkT2f8I0nkT6rvf8fwdGaP+w+fM+tRxYlJej2JZEZs/JKak/RgvSOEbwVDWG
	nNTr/x8Brr4FYC7jxlQeDo8Xh0rBAdDOni1Iijf9bgeBWXzYpuqmx6miBBWYMswRPCmN7MKPAKJ
	cETZd1lzChBy8tVMUdAKl8a2o0ayKZlPwx25VtGf4uZWrVwnV6Nu8qaVhJ/iPzn0eeSrghYUnOA
	BG9/ce/GNwJuqOzRGKq6THgPsuBCm51iP4PY6dwNlwhgGtAZcG3gkmCeQ0LYnVUVSMX+GQVuVpR
	9OVRubLKu3a3Rum+lMKXFFmRJlc2FagzBEmlHhtz4oetq7CmcmQ8S0MKArwGKSc2bpSIvqsu+Ni
	F6pWBfHZ0kVC3aEdEV23DjXOax2OKIPg81dw==
X-Google-Smtp-Source: AGHT+IGAUXVr26zXazIZApqwProFXE2ozOmkcPCsLJ1qa7ztWzj9DiphR9AgDKNwN1FOiyw5bbgWGA==
X-Received: by 2002:a17:907:7254:b0:b2a:5fe5:87c7 with SMTP id a640c23a62f3a-b6dba447458mr336316666b.12.1761641898053;
        Tue, 28 Oct 2025 01:58:18 -0700 (PDT)
Received: from localhost ([2a02:810d:bb0b:f200:f6aa:c117:a67d:9aaa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8544c9f5sm1052719466b.68.2025.10.28.01.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 01:58:17 -0700 (PDT)
From: rafiqul713 <rafiqul713@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Rafiqul Islam <rafiqul713@gmail.com>
Subject: [PATCH] [PATCH v3] staging: rtl8723bs: remove unused rtw_sprintf macro
Date: Tue, 28 Oct 2025 09:58:11 +0100
Message-Id: <20251028085811.20831-1-rafiqul713@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rafiqul Islam <rafiqul713@gmail.com>

The rtw_sprintf macro is defined in osdep_service.h but has no callers in
the driver. Remove the dead code.

Changes since v2:
- Addressed review feedback to delete the macro instead of replacing it

Signed-off-by: Rafiqul Islam <rafiqul713@gmail.com>
---
 drivers/staging/rtl8723bs/include/osdep_service.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index 8b1634f4091e..12369ee2ce1d 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -115,10 +115,4 @@ bool rtw_cbuf_push(struct rtw_cbuf *cbuf, void *buf);
 void *rtw_cbuf_pop(struct rtw_cbuf *cbuf);
 struct rtw_cbuf *rtw_cbuf_alloc(u32 size);
 
-/*  String handler */
-/*
- * Write formatted output to sized buffer
- */
-#define rtw_sprintf(buf, size, format, arg...)	snprintf(buf, size, format, ##arg)
-
 #endif
-- 
2.34.1

