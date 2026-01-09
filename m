Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C92D33B6D3
	for <linux-staging@lists.linux.dev>; Fri,  9 Jan 2026 11:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767956777; cv=none; b=SeADc6y2+D6CFAhe6Dq0kO97n/2qELlaN7iAc20WbIgnBAslT07+m8gMAURDRxbkbDNhjhS9GGtWAnbiCdVYx9CuVhcgKKu7Un+qhoVIS7+Z/QISsAI+7lyuJZCszWT2f5uZti0nQdrHJaSzba4Xgj7vQpcTYyC3UIZiRlW7ig8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767956777; c=relaxed/simple;
	bh=2VV/3JRUbpX3Mt/rpWRBVj7/8nT/dWxAxwMEuBJp5aA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a70gXPiX8JYwrze3SnzDHLPu4q8PDmTIdIl7GbsuSJdPIIEuRjCx9ao+CLao/40pF6qt3MAlpZgZYyOgKI0hAdzGyKIPg3DD+zDR0dZ2D3Vr18khr6zuLUxBPZf4y78m3UPvsq7dRw/FjK//pA/Ygx5cAGepldF/04Un5Lq1VNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=neXQnaHq; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="neXQnaHq"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c2af7d09533so2610949a12.1
        for <linux-staging@lists.linux.dev>; Fri, 09 Jan 2026 03:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767956776; x=1768561576; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhOAkftyUgGWTKNPNqIsFMady3FhxjZfEF6SBj5+Qvo=;
        b=neXQnaHqgJhw/6yq8CIaR3X2Lf22lTotinqgUHU3pCVtMuqp5/dXSx8YnhQJsARgrX
         kz50n9KXhlAGhZ54u5D8Dl/yq8DCDURekz3XiyaBTvXaowUdP63+otysOPMK9Z4LzKqQ
         1fsgXlBhuYhC15wYplN1nQLg32EpNV6Ng4b5D+f0JvFssH/zf2J1f5iGw/h+NtCWEYqI
         /vZtsivsJmMQDfJRu9XGRfwa0LiZqWYI9Fw5Xwbasw0EY34NfSHwUbCQV+v6c8ugWXtI
         8cok7ak/5wF+/+B89/YlrZ520rPllHj7uMrJ6RSSUS3C5ZaUoQ1YOy5vUzVtKSZcP25k
         E0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767956776; x=1768561576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rhOAkftyUgGWTKNPNqIsFMady3FhxjZfEF6SBj5+Qvo=;
        b=m6nBTMWNY2TjFITGUTOsJN02B/78CTKpFXKs2ILNpgbg/lsZGg5NK/nFzvbfOcaiSF
         c/g5/XCKEbszMYa+9MKLiQvYjBxt5iSw3NE7B5IAL/sACNkIkDQQH+6HsNW+HJH16xpa
         l2z9DE0CVS3BNtsNGLLwng9pmyCCZxJkW0U7nk4/eagWgipkRSJ4B6j1e5Wwu4jj4Wqv
         AI5w5aVhMrA45qPJblC2GR5xVpPzUwKkvI24rswlOjKHRisrdN33dpS1elczbrhVrjge
         m0o4xwmtcOSep8ue+g0FYJBk834jyvMrfAOsD5IhNbpfgQWyLmzMd96FiPvmsXt1z9qA
         m71A==
X-Gm-Message-State: AOJu0YzgB6VBlXIP5yRcRPlXaoReWzLLlSNtrzSJES4f9wdvDdfD7TIQ
	XMt0B+XEweyXPEo3HlBZEaHiPchABX7uuKiMZKkbysguTp06ASEOloMB
X-Gm-Gg: AY/fxX5upJbvpetdtEZSxP4cPIdB6AIS6dhNcgMSikWOYPHFChH2iHlSVXXE4BYV+5R
	3Gu+frzCu0Hvbs/+dL4FME3W0Ujy2moxLrQw1FeGy0k39/p1UDZPWNg4OxsSLS+6fLsH09xfwKY
	uqrr+QkjZgrECKJQYikFt3s/mu9ka2v6SQIy+CALokeONBVUVkJVGMYWlZphD5MHIVjC5+R4/QO
	w8sUBncCHAor7kW+Cm6GlXsnW4k3RdvK3bqhS1c8xj86RsCx4VpweL3o6JQyYPzsbVM4e8/Si8o
	jktPrkk374ZPsq3rXHYJVawzuNHX0340l9i27eGlwTFDQKDgmpuBsZt6RjV56ogdpLgOLCUNMS/
	BoRq3oY6TygQqIq4fjbyd23k02kOkwsuJF8OuS7pOj+rO3pzU/X19IdLwjtZE5K9z+v23xVm31R
	lQnBjpYwJ1Vljo9XB4YVVw
X-Google-Smtp-Source: AGHT+IES4q7YfPxlMq3ztSPxyzdEGuNm+weGSPGpce+x3jtNmO00jxPDvnDyDtQ5mIpev6pLdSwjyA==
X-Received: by 2002:a17:902:ef0b:b0:2a0:7f87:2347 with SMTP id d9443c01a7336-2a3ee49df42mr92718585ad.46.1767956775659;
        Fri, 09 Jan 2026 03:06:15 -0800 (PST)
Received: from UbuntuDevVM.. ([103.171.99.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c47303sm102491515ad.24.2026.01.09.03.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 03:06:15 -0800 (PST)
From: Nayana Mariyappa <nayana.mariyappa@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nayana Mariyappa <nayana.mariyappa@gmail.com>
Subject: [PATCH v2 3/4] staging: rtl8723bs: add blank lines after declarations
Date: Fri,  9 Jan 2026 11:05:56 +0000
Message-ID: <20260109110557.16381-2-nayana.mariyappa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109110557.16381-1-nayana.mariyappa@gmail.com>
References: <20260109110557.16381-1-nayana.mariyappa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added blank lines after variable declarations in osdep_service.c and related
files to improve readability and follow kernel coding style.
No functional change.

Signed-off-by: Nayana Mariyappa <nayana.mariyappa@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index c9be4dc63598..c490de437bf1 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -203,6 +203,7 @@ bool rtw_cbuf_push(struct rtw_cbuf *cbuf, void *buf)
 void *rtw_cbuf_pop(struct rtw_cbuf *cbuf)
 {
 	void *buf;
+
 	if (rtw_cbuf_empty(cbuf))
 		return NULL;
 
-- 
2.43.0

