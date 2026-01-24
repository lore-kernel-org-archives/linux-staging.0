Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E491B81CA
	for <linux-staging@lists.linux.dev>; Sat, 24 Jan 2026 23:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769296602; cv=none; b=uNBBs864o7NrtmLFj5qnKjaXg3v/Bk6kE1NlOhblTag8EsW+v4NUSm3N2sUieXVOqKfEr8cC+bczifOvntMU0lzAp0TRgm2sJbbHbol16mTMeltKct+kJZLPT/a3r97RSFsK3OuKyPbWB9iFXhQWr928VsR057lWdmpy8dR1Ad0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769296602; c=relaxed/simple;
	bh=wBTgNYN4rPA0PxBebnrEPgAmfmsPxHfY8gTa2K/jAsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XFDdtnRMwZqj8k/7wxpCk/GVNf62H24ENN46ZluXXtgPqDp0SmOf4hpdlsorQOMhs8veCEpR5ju3ZRo0XDjfXoW6iTOUiJy6jOA+qoz4OPU4SqjjbOuw179QTokKFZXjdnEh7fF8rGrFkNsM1flMn1pnphh42RdySg2F7LVzSOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y3qITe/L; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3qITe/L"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8230f8f27cfso1397585b3a.0
        for <linux-staging@lists.linux.dev>; Sat, 24 Jan 2026 15:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769296597; x=1769901397; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GA0XJzUOezBt8w8QYnYiFuNAzMWYlWZmWFNTccUUrS8=;
        b=Y3qITe/L5bAbp7W4uciaaVKqg2WEUYiiCPzKukqi4VTkV4vbhp9iZ2GmuG7h0df/Xj
         t4QLi/AE78MKG/8ESDvv197ZBZqKk0O78g96NdefDFQgyI32cOr3uUi0yu1J8fndCcwu
         H4+Ev5dSmK6T3VF12eyif7h3RD84EZMUYcOJ/oEIyvOAT6aW/t9VriaLLRTmp2Kcmdfa
         rVSb1J8FoeLCE/pLaIl9nyZR8jbrrVEdH1ErfJux7NFmvjGewwlKUYZfFl5Lw9VnDHmz
         P9/t4CBDb2XS6lLXe5R9WCwomRfoz0jsb7SEJDCkAydZmbmMutQYTkBoX6iEedN7j5XI
         FyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769296597; x=1769901397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GA0XJzUOezBt8w8QYnYiFuNAzMWYlWZmWFNTccUUrS8=;
        b=mY/PhGCBsuy33j2mw+Hn45B2XHDqnw4DWUD31lKGHNrwuonVMHb/rLWcu8t23BCQ3e
         9zpYR5zx+Lfx2X3EDmXMXTUupy++480NAT+BYf9yL/7kUJEIEqsprlrUs3h207m/oF4k
         ii323+c1YdRQK5bp4/zmYXxC4B6KAAI8XZy5SoLoHTMwb0OAB5bVo8Nrz/4kaItykqpR
         q57cAX4PtDyHYiuuro7Nfk/7CB6k3aGI3OHIg4Rk4ASbeBVPRcA8N+rZ7oThh/jAVeG4
         3DI8/bpfzA0eDWtCujhAo2xRABnclQaG2u537oi3wrW9Bxi+zJJRfUhXyiu1us+X4OyY
         oJYg==
X-Forwarded-Encrypted: i=1; AJvYcCX4neksNHpPnNCLVyX3eRLwZp8TQ0N11jfP4XUUpMfi/8O2XjmKJZa2dAntww4lS1ZvftB3wX/lajpfvIbS@lists.linux.dev
X-Gm-Message-State: AOJu0Yyy2h7QZZb91At7ftpGGs4DayWLFxlDYgB36BjtvQRvuajn4Z7g
	7hbzngQKdwc54jv9dTLfFhPKIKC0c5RKv5zIx27Ph3GQYMy0ayp3vHg1
X-Gm-Gg: AZuq6aJGY8kxYPNiSTjvpO/f+myceWrzquy5hEl2TDF6P+MJxYbgB/xAbzYCm3se118
	PMqS8ZFRg/AT7hNJWlAcL4Bkbb/V/bWBB0eNnrUjJH1UK7ELPCY0Kd6eCPvdktnDM1hfWR4PnAx
	qYXjYZYhBknXQwcKlQQgzcntIAzOveZD7Hxp5/S9epAuQJaB4PNHQk2mAqtlserjnltZbCrn1hc
	snmmEQAa9A8iyitCCn1Oo83depHZ80ByUsfRO0u/WUQ5mWkdC7uZPcmFfFSxlN5ngsshZ+dZdg0
	UjNj6osqo0Btt7eeEm/CWftn3Ua/kK099rcibYcFeb2en8tbYa2zy4qmnr/Mx+ikohk+CB699T4
	XYcWV8GJy0+bqHgnKaIObd6UkN0tp9m0r0ab3SMfdVKK3MDsvkkLdnwc3gwOuLib0yXfUwZUAmw
	3KOp1hAiLuleFO3rQWWGniYLo3s+yLgv/f
X-Received: by 2002:a05:6a00:1d95:b0:823:1511:530e with SMTP id d2e1a72fcca58-8234120bbbemr108741b3a.25.1769296596655;
        Sat, 24 Jan 2026 15:16:36 -0800 (PST)
Received: from tehuang-Alienware-m16-R2.. ([50.47.240.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231873bf53sm5604506b3a.45.2026.01.24.15.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 15:16:36 -0800 (PST)
From: Michael Huang <tehsiu.huang@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Huang <tehsiu.huang@gmail.com>
Subject: [PATCH v5 7/7] staging: rtl8723bs: use !ptr instead of ptr == NULL
Date: Sat, 24 Jan 2026 15:15:57 -0800
Message-ID: <20260124231557.18189-8-tehsiu.huang@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260124231557.18189-1-tehsiu.huang@gmail.com>
References: <20260124104920.5721-1-tehsiu.huang@gmail.com>
 <20260124231557.18189-1-tehsiu.huang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify pointer null checks by using the "!ptr" convention instead of
the more verbose "ptr == NULL" comparison.

Signed-off-by: Michael Huang <tehsiu.huang@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 4ba4f85be02d..884fcce50d9c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -5994,8 +5994,7 @@ u8 run_in_thread_hdl(struct adapter *padapter, u8 *pbuf)
 {
 	struct RunInThread_param *p;
 
-
-	if (pbuf == NULL)
+	if (!pbuf)
 		return H2C_PARAMETERS_ERROR;
 	p = (struct RunInThread_param *)pbuf;
 
-- 
2.43.0

