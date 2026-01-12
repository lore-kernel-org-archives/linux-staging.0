Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDFE322755
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 10:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214859; cv=none; b=lT0muWHokAx+Rk3gSRYOhFF2GQqu4IeuD0bM7X8gH5zvxVf/Qtdd0TqGI2+qheyRfzDLKcK6qMPQMwP45sO6rRh5hXvZbg05NUrZry3ofe73hyORTRPZmkBI/w/77i/9BR3rErOuDKcAqlpQArEJ/sdcJolb50Mj3nhOlARNeqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214859; c=relaxed/simple;
	bh=9tZthIVBu95zPu2t5ZtV3OcPpnLUDEjCuJP/6rzqwhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pz7vXfxM4y4mw+WKJzHBDEt6tgSljdgrZ0AS3e6Uk9iFUlH9sQfp3QJlXnjPidVMBfV5gLtc4xGp+L8C4VhTiVD2F6PFcvSEcpu5mfZIz48viQd8Eb7P5miTA74mecwdP/VCcFCFFgfCqySwDhagZB9CPEvB+DcR1ObErFkMpCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GhkO4HMU; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GhkO4HMU"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-34c3259da34so3748629a91.2
        for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 02:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768214857; x=1768819657; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b2/SF+GJSWtyWb4db89JOTgrx3X1cSctZF3nFdm5ee4=;
        b=GhkO4HMUxa3rf31tGm0Cz0mYDo/KRhI46oHEyef8j6OsZYWTadjpqsHHSDZYxiuGqN
         ZlWh6bid+2xgqPDBJDtAQWJWs7aR1T9gVuKKYoL0zdNU2sty3XKTMirmf+HTfyRvxLe4
         Ya6ROtaodDEOMrAArpFJJJ/beYOApc5PSK+H9MJH1ocOqgF+zqJbOpxbj71Uz0xfqPfa
         63cHWu2BFgMhwACtjMPav+T+F+6VgqsObateY6VNkTy41W5Ma3V0ETYPZdJHQeJMlJ7K
         jIYnse1L6THP+Auas9sXv/W6ta8WKcYCzo4jH9u4AFCV9KQk7mQvkEk/8U8wTqGBK3J7
         P2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214857; x=1768819657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b2/SF+GJSWtyWb4db89JOTgrx3X1cSctZF3nFdm5ee4=;
        b=G/iF0Up3LH+9ao5cGbG99kIUJeWRtEB+ui3Rr+hW527aijwrEd8eEahXFgPkQW2s76
         fsA51K0g1DhHMOvJLrF0qbmcDNAE1oM5LVTb473msUiPuDKdLDSaNXroEtzsPuvIexQU
         gNaSiNgds92PEXenE2wzF1YvyK1l31pdDodDvHv3JAPg7mqJyXjy6hr0SDKQqs3v4PIh
         CcM+KIAuHcvNdrMfzbA+WWcjle615jSwX0iBmYKbNOYGxyKpvQcuMrwk9rWR2uNV79Mh
         /97yEVO/1TJDACP+ihJ0f7ZDfi2H9T9l/v8/IT0s4yGH/s5T8xy5wT2M1d4+IkadCqis
         i5dg==
X-Forwarded-Encrypted: i=1; AJvYcCXHZo4dCKpIEPLGaSGGjrupM7X03J3IoTceV659dtK1NYzGKdMhlilpPgMkvFTOyeZybUZ7mCpc2bjkXuOw@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6BUxTiGZIKSyqi/JgqxVuMpZKybUUivieZSt5Wx+qMfdg71ci
	uLim+wYVxmuumnPsiTDRsYTB1T9hfzh9XNR4Mwc0mxTKXjcZckHJC1/BKAkVAw==
X-Gm-Gg: AY/fxX7rXys3/7ogrLQRYY8Ur2NvcBV57ZrxnIDHwU9DUzEmKYgONBxErTAXS9BfVFw
	GjV6iIBGuj8Uc3DlIU6u1FBrEv3506wlSCI8FYbfwaktxVJVyWDNCMg4z/zILQcbCIVfIIlTqLS
	BLOERZknLG50one+he8qUtD12RWwunXJGLZZ5tLpssofAVZS6pPlkUYncZsK7t2iIXPU45D8mSX
	8NlSQlJpwMe5qwyIiVsk3RXrD3Xf5+H8lTjJ4aM7KYNABqb1PGYuE3Xtez+1T6BSKDpZv2/oLJr
	lMvEF8AGdcOk29PR4dQ3+68F0api5n5gD9CRtI8OYEDnjel5/LmPIouPy2zldY23zMNP17Y1F0e
	QJl7VSt2nIPi3384j9geaHg5F+mtWx/tYfOmpM5HjEqmoCYL3GEyS49gpKuIcHHC9gMeC8FoOjO
	cvEuEMa77OhtcnU2cAjWTX
X-Google-Smtp-Source: AGHT+IF7GWArZ7/eyQikRknBPxACifAFj2Qd2yFGv0EZUeFK/hJQBmFNwcGQzu5vJHRgrDo6lYtrhQ==
X-Received: by 2002:a17:90b:38cc:b0:32d:f352:f764 with SMTP id 98e67ed59e1d1-34f68bd1af3mr13749501a91.2.1768214857281;
        Mon, 12 Jan 2026 02:47:37 -0800 (PST)
Received: from UbuntuDevVM.. ([103.171.99.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f6b10a44asm5686116a91.5.2026.01.12.02.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:47:37 -0800 (PST)
From: Nayana Mariyappa <nayana.mariyappa@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Nayana Mariyappa <nayana.mariyappa@gmail.com>
Subject: [PATCH v4 2/4] staging: rtl8723bs: remove extra blank lines
Date: Mon, 12 Jan 2026 10:46:52 +0000
Message-ID: <20260112104654.45175-3-nayana.mariyappa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112104654.45175-1-nayana.mariyappa@gmail.com>
References: <20260112104654.45175-1-nayana.mariyappa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed unnecessary blank lines in osdep_service.c and related files
to follow kernel coding style.
No functional change.

Signed-off-by: Nayana Mariyappa <nayana.mariyappa@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index 9d676a61981c..0f767d3e8c80 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -152,7 +152,6 @@ void rtw_buf_update(u8 **buf, u32 *buf_len, u8 *src, u32 src_len)
 		kfree(ori);
 }
 
-
 /**
  * rtw_cbuf_full - test if cbuf is full
  * @cbuf: pointer of struct rtw_cbuf
-- 
2.43.0

