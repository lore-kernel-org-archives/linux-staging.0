Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9EF610B
	for <linux-staging@lists.linux.dev>; Sun, 26 Oct 2025 09:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761472175; cv=none; b=mcG49RlL9VtJLYfBM2yJpvSI7TEErK/Tml6E9gBxGGWTN80xbJ4yWa71NkcXZl6nhvZIeJ52xf0nZAamTqZ3ope8hTThaT15UERunKFxqdHf/Eo9JulYridqbse7arA97F3QWa7UCr1GSXSssOhabnD8wHTgIZekSRydpGrZ4e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761472175; c=relaxed/simple;
	bh=aU9wM9HklXsSvhTQhhvfq6NS3rDCgIi6QDzFVzt3KFA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=P1g923/fBr+AUR/CJl6o4nBsQE1HwHcXxDhdazyBg4+NMntgQbnfEoc5BZV78WvGxg/tXpqf0IlWXsfrSkZ3pHn5ia+uhjyU9anZKL3pepF8410246sMqYwVUbpBbQTlmXmEMblrHjrZkz9do4LE1O6FfkdNspFZv/ImPKtbJkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtZVGPZ0; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtZVGPZ0"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b6d2f5c0e8eso742774366b.3
        for <linux-staging@lists.linux.dev>; Sun, 26 Oct 2025 02:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761472170; x=1762076970; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mg0X71hOgtMQh8VHRDfEtuaTwfT3nKeRP6gMvPjjCIg=;
        b=QtZVGPZ0PzVNgRNYHVAcuVBCXGSiepOzQB24uH71DcWj85lBMD64wf/GmEr8j35y+p
         K8fvED+fB5Mi8GWY0Zs3v+fC6ugzvKYA+5ASHMv23alYnO+6fhsqJtXHFAarxnB075We
         oElcQSzo3I215OYk+AuLk+36kMH/WXjYBB9Yo3C5I+8V5uqppiGF+4QrRgQ1QbLluAeY
         cmBkRYNpEvEflyGD8O0ZqUBPoFiNZeaUUmMWF4w9N6eMRAclVTH+TACLKWnN34YpFZNL
         mfqpjV+5Lsiys4wk9q0NITUnwXvpZcHajyLWOy57Bp7duZb3xK3yx7c9bsqHseIQRRyN
         7XtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761472170; x=1762076970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mg0X71hOgtMQh8VHRDfEtuaTwfT3nKeRP6gMvPjjCIg=;
        b=XlZjDD6ELD4GrTeOxjZgtafiN+uRy1C1sKqt3PtkpVr2KCGokhDYHIp7+kB574EWMR
         FFkBapB2ttQW1FYQlVGJWsfnRYASVlgWGbJfu5tbSILGQ4HZj3SYiaiOu7mmAHrwRf8f
         OxoU4xT64I0B+PWrZFYpV0tEKMjke6SX2S8UbW8sEfluzZjTMJXaV9jCxR/xy6RIci+p
         iW0dwlvlN9Lze3pEbReVTEPD2avEg8n8nXeOxu6mjtwa/fPJzp+vTNDgW+P2T7FEiPRN
         e4I9JMoU09RCXaw+ykAh6J1t7LIgxeBQdDB9EYdtJr8oTxoh/O5gigI9ISItdszfeTE7
         xIJQ==
X-Gm-Message-State: AOJu0YzlUrOknI8LmcyEiazR6IWqr3h+RUVpRdkr4sPqThBHmKFbqzpD
	DuC2MeUW61bLrmHAl4i1SnJf6xYoAUULFmkzgNQ3Lqh8e1UHnAcsI/6WtTtDDQ==
X-Gm-Gg: ASbGncvmtgtc6JJpVCk7UVAVSpA86kGVyyX61y49z7OjlDL8v6iz1woXWFLQzTr5kQh
	dEU3pMOVKvZxcDHqo/y8TS+K+3GLsYYhRrZZUjKUt6cnD7xYbCxE9CLJJywNK8SVlyIrYGKnmgy
	LEohqfCQcLqDjUF8yeaDZfmz23/Du+imMYsR3ITsY/8/7FAh8TUEl2FxHMYG3k8yXmR8Svsnd2l
	k7Y+6VrW9QAJYIZoR4Vabhu9f4pLQAVmHdYN9spzZN/VngEdEPDabVJJ46yZtEZ6CAzuz5LXSfo
	NXYlRo9OTMiqsS2CjaJq42Bflpvyi6yCv48N6KeJeAdmlm2injpGttX9CVxiCd1D2npaR1ed75m
	/xVfUW0ONMXesILFI+wOCrhDvsTDP0Fqz1R1ILV0azFc11vaz/Vj997F8ydOoX3eAWXqMYLzSg+
	Qj0yZk5RNonb2fGVDrn0DpP9YPceG+ZeOVlQ==
X-Google-Smtp-Source: AGHT+IGpOw4EzLjne8Usc66PaEnCvd++rabG0OUP0VRw+UkVl4EYnIUmgPPwXTvqAgDGH2LHJkqZlA==
X-Received: by 2002:a17:907:a42:b0:b5b:3ab0:a5b4 with SMTP id a640c23a62f3a-b6d51c2f66bmr1233047866b.49.1761472170179;
        Sun, 26 Oct 2025 02:49:30 -0700 (PDT)
Received: from localhost ([2a02:810d:bb0b:f200:7726:b432:b66f:d982])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85359c0bsm427910366b.24.2025.10.26.02.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 02:49:29 -0700 (PDT)
From: rafiqul713 <rafiqul713@gmail.com>
To: linux-staging@lists.linux.dev
Cc: rafiqul713@gmail.com
Subject: [PATCH] [PATCH v2] staging: rtl8723bs: remove unused rtw_sprintf macro
Date: Sun, 26 Oct 2025 10:49:25 +0100
Message-Id: <20251026094925.171310-1-rafiqul713@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rafiqul Islam <rafiqul713@gmail.com>

This patch removes the rtw_sprintf macro from drivers/staging/rtl8723bs/include/osdep_service.h.
It was defined but never used anywhere in the driver.

Changes since v1:
- Instead of replacing rtw_sprintf with scnprintf, we realized the macro is unused.
- Removed it entirely to clean up the code.

No functional changes are expected.

Tested: module build works without issues.

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

