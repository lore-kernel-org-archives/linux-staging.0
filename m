Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE84548FC
	for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 04:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709008935; cv=none; b=qCyvOfAEnLFP3hSwwOvXYnpnzi2xAiCuraDDtJrc0zSiNJ8FaUR1BQxtr7mRj9nQQu4E2UfvHXwW/IM5IrfRv7MiDWOKWu4oQ70OtI/Jb3EDwNkp43GOPrDRPMQDv2unFMCziIa6FfPq5LRqSi3J2z30OhUm70Mx5+if1iuEASc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709008935; c=relaxed/simple;
	bh=I+aEcppQ4MzexRfR6gl9QtKT4yGqbNUgp/gFvY5km84=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kAttfkbXQYuRHzQH9i7mbhW9YsYjqyFybSZGSXWBTEBWXsXwyT8tv6NfpCQ4JAPOuQ84nwLfitWL9BAPZ4IY6bfgN/fEeay2nHyKZ0uL6/yDXwvHK/eDLAHulLLBdcULHknmiucJjATaRykeI9CFLd7it49L+yYcNYoje2uYZSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=T0af7z3G; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="T0af7z3G"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3651edae0a1so7956705ab.0
        for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 20:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1709008931; x=1709613731; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmDzivMUGF5BY5Dmmv3uETYHPmN1bUF8ybnEjd+639w=;
        b=T0af7z3GZKtgwphfzeTSsDbTOxP32S0gtzCfaa8iDgPbLWUga7zKVK0uhzwm7pjtbb
         Ku8XIqgZ+JliGJ6U4AuJqgCPSxmr9Z3Z/uYdrmi3PeLF+wnd7Rq8G6G3W2c3db1UYp34
         Mh7WSI/P8HJb9AIsTDLi+bsTqFNSkOxrJyl3n6o7l/GvFnUI4cA/BYp/hbOhelbWe5gV
         r15E0NMtqYUVQtNQO9bLzHDOhWhX5cG6XwD/Ei1VZhEorXa9zu/54KGL46I9EWYaymOf
         m6LkxStSZ5ACtvf1iuOO2UTrP1Y/oyjgb/oVh8htxbCwI+bFhlNpPk1Nd0SZjgeKAOw9
         vQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709008931; x=1709613731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AmDzivMUGF5BY5Dmmv3uETYHPmN1bUF8ybnEjd+639w=;
        b=dSGKZbqddViYGxiVM8bNPPS1AYObVnCQy9HjsBZ8455Rm1OYmsQvlTvyN8OfwF0ze0
         LmhhYhx1z6aVasJUjKhJ9aCH+J3x01vzyTIkBUTlmY7hSbKnCaiVTuUBtlDvGtlW7UIL
         s6bTugGtZfFPixm9rygPvZPq/bFFRi7FN7Ck9DHhhskB8M3cIXxze9d5ceZGL8pavtjI
         p1Gsz66sT57FIzFy2hTQ8eM+BqH11aDTIS5hXzq9xebPx1qyeGw+NpKy/jrRHfnWkaJe
         ssnjZji0kgAe8xAEUtEH2omoeXFXKDvrFtGU6tvfo7ZupcGRMMxyquySfBWs0IPOTg/a
         X6MQ==
X-Gm-Message-State: AOJu0Yz7E7azcWJmrF3bJDjz+XIO7SDDvhBSA+l0ijQ4SJE8XsKugdza
	ZV13mJcoU33zfh3PZM6vtixdnZHPbCPdLudP4hV79lrrILu0zp+lh/QhIC+XGZc=
X-Google-Smtp-Source: AGHT+IHYNOCnN33B6wYz4ZzVNkCh+AGdu4lPAErutB++OYPwnt5SOwTpGhjNFdgxQWxcLoy9oaonBg==
X-Received: by 2002:a05:6e02:216a:b0:365:259b:711e with SMTP id s10-20020a056e02216a00b00365259b711emr11005508ilv.5.1709008931691;
        Mon, 26 Feb 2024 20:42:11 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id e30-20020aa798de000000b006e4ecc3e394sm4899782pfm.79.2024.02.26.20.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 20:42:10 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 09/20] Staging: rtl8192e: Rename variable CcxRmCapBuf
Date: Mon, 26 Feb 2024 20:41:46 -0800
Message-Id: <20240227044157.407379-10-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240227044157.407379-1-tdavies@darkphysics.net>
References: <20240227044157.407379-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable CcxRmCapBuf to ccx_rm_cap_buf to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: no changes
 drivers/staging/rtl8192e/rtllib_softmac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index f5e0741af047..477d736fe22d 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -838,12 +838,12 @@ rtllib_association_req(struct rtllib_network *beacon,
 	}
 
 	if (beacon->ccx_rm_enable) {
-		static const u8 CcxRmCapBuf[] = {0x00, 0x40, 0x96, 0x01, 0x01,
+		static const u8 ccx_rm_cap_buf[] = {0x00, 0x40, 0x96, 0x01, 0x01,
 			0x00};
 		struct octet_string os_ccx_rm_cap;
 
-		os_ccx_rm_cap.octet = (u8 *)CcxRmCapBuf;
-		os_ccx_rm_cap.Length = sizeof(CcxRmCapBuf);
+		os_ccx_rm_cap.octet = (u8 *)ccx_rm_cap_buf;
+		os_ccx_rm_cap.Length = sizeof(ccx_rm_cap_buf);
 		tag = skb_put(skb, ccxrm_ie_len);
 		*tag++ = MFIE_TYPE_GENERIC;
 		*tag++ = os_ccx_rm_cap.Length;
-- 
2.39.2

