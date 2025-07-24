Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413B5214204
	for <linux-staging@lists.linux.dev>; Thu, 24 Jul 2025 19:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753385012; cv=none; b=unLXZSoo6pF7gln4Frnb0CwVW0GvGLZ7G5NIFV4BOxNlYQa5m1tgbjLD1m1U5RICEGubV9RRDox0L/9asGswNg8KVplg1QF6JQqHAorfGU+JBO6QC1DKDR6ZeNzltnVK9Dslv/PYfWW7gz1nZw8IlO4TZVBZUs/2hMfT8ua/mN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753385012; c=relaxed/simple;
	bh=Wl/MVrfadxWCvbcWuLboGbrjuXmRyvy0BBIFUzsNgX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XaGG1edgL6/HE52ErwHZxn2XuWYZ21pPBBV832Hdjqf9nRFImOQav1vQlRd/3cyJixyPbd+JwLttFuZpxSROiGLefRO8W4jXk84udEhVvg480R0gX9+/8dVeoUKhBUNUzKW4GSVo2PGjYnH5kXfB+sCu4N1xDfUuSb5PVrYWS6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LudHEHsT; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LudHEHsT"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-612b34ef0c2so2701666a12.0
        for <linux-staging@lists.linux.dev>; Thu, 24 Jul 2025 12:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753385009; x=1753989809; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjrrUXAL6KpzkIM6/6atzGF3H/f1YResH0MiZx9rdi0=;
        b=LudHEHsTDR31JsEboz7ABXA+UcjorxqZ3aYS+XAdiFgwUfbTQje1Mv12ryBjbgceit
         CBUf93cbjNR9n1hDQLYnczj5l5pYlTWNw6owtjQLv5+7fjC4GVCmOwM4809m4D2BaE0G
         IqCl6+XPFhyqh/fHnUl38Fv6w2OKSmLY47v/kPeRXUD8yTAFrnFAfGiEyVrISJzSExJY
         1hoFje7eTuuNi3ymtZgIQMv/GNZj9fIpPP1Tf7rzGHbvhgcXOvZk+MVXfKm7RcQJtddy
         pn0vAwONlbfsULTphKE7cazGl6dJIwXacp1Rv8i6rfYOQoj6e4osNK3go6BI1KLEpzS8
         CPZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753385009; x=1753989809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjrrUXAL6KpzkIM6/6atzGF3H/f1YResH0MiZx9rdi0=;
        b=cjSIN6Epv4M059KpgQjhRipypzOCK4e+4u29if5LrA/2onN0CdzCMPA/PcBlcxS8Ec
         QrPtJjo9fY1f5GCLFBtVmOabinT71mqC1/PQ+ZoBYjaqVOe5EtAl4jKCeK0es8SvdKN+
         JdZPHIERkaQxK8Hgop4zYoa9tbCOd+nGwUPUHMEDh7gsYNc/q3BmaNDioNTK/qlvIKf0
         iTRg8Ha71dXkyXto929DVI4X1Ct2/H2lzeyxO0pdUkoSC4scsmNi5QSGaFZov2KaabtD
         QEmP5Vr9zDPSICreqrJ5niw8ylBfvr9i/tAj02GX0EUcsE3IJN10TF+ZA2FAVSjb+1Ip
         M+PA==
X-Gm-Message-State: AOJu0Yx6OdcYh/PyDfPM+OyjFIAPVSo6JWx/WPTzG9A9WW1RPGsP1b13
	XuOlEnDLEhVo1kyW/K47sNgqRvPIt9LDIsEpViNEegj9FRil3OYA6kMh
X-Gm-Gg: ASbGncvfa9qaQFA18UalRsUHPOHevzBKlIYlkkCkEFIPjWBZ6Rpc9HTmC2JYqSJpEGO
	uR7170CctgTz+cgy8BdwZQodb3SJoNJhV/MN7XHz4pzPEWnC4TBQZ/8Y/bP42uSHz7U/fLhLLKX
	CtceXFOPPC2WwFV0RZUXDxbpEqe4XqyQgEadDulW6qfe0knmvvPvbpCUgIxJCDzSOmTk2tPpO5q
	5eFvR0+Fzi3DwnEOsr4s+jyHeBumAd4PhLqvdJXHb1cqCtJiPMYyxtDbyLoPOpc67/sHv8cMiAY
	14yYgfEhRwNWsc6XR7DZUq1jkGzcAuRdE63x0Y0PUIrf2EWD1st/L7/e0oStZP3cznqUnsVuuPe
	wc5T7aPn0KBldmtUhu3U8kb8m0PJNir+T1Zp+Dvi/ix+glRTApqmZk1eEgedT0hslYzXaX4M3MA
	Jcu5WFLA==
X-Google-Smtp-Source: AGHT+IFc2z3KY2WsKxoGa58pXpWWO6lA3PIPKIetHzV+uzHC4ZKznczYmr5VepT2G+/L75iREA8ZsA==
X-Received: by 2002:a05:6402:42c9:b0:612:a996:5cfe with SMTP id 4fb4d7f45d1cf-6149b5b01d5mr6939759a12.31.1753385009110;
        Thu, 24 Jul 2025 12:23:29 -0700 (PDT)
Received: from PC01.localdomain (094190205166.static.ipv4.heldenvannu.net. [94.190.205.166])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-614cd31a0c1sm1155516a12.47.2025.07.24.12.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 12:23:27 -0700 (PDT)
From: Bruce Qin <bqn9090@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bqn9090@gmail.com
Subject: [PATCH v2] staging: rtl8723bs: fix if-statement alignment and line continuation in rtw_ap.c
Date: Thu, 24 Jul 2025 21:23:24 +0200
Message-ID: <20250724192324.19893-1-bqn9090@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2025072409-promoter-shame-8105@gregkh>
References: <2025072409-promoter-shame-8105@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes several style issues in a multiline if-statement:

- Moved '&&' to the end of the previous line to follow logical continuation style
- Fixed indentation to align with the opening parenthesis of the expression
- Avoided ending a line with an open parenthesis '('
- Moved closing ')' to the end of the last expression line (as suggested by the maintainer)

These changes improve readability and conform to Linux kernel coding conventions.
No functional changes.

Signed-off-by: Bruce Qin <bqn9090@gmail.com>
---
Changes in v2:
- Moved closing ')' to the previous line as suggested by Greg Kroah-Hartman.
- Thanks for the review and feedback!

 drivers/staging/rtl8723bs/core/rtw_ap.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 383a6f7c06f4..c652e0cd35f3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -258,11 +258,9 @@ void expire_timeout_chk(struct adapter *padapter)
 		} else {
 			/* TODO: Aging mechanism to digest frames in sleep_q to */
 			/* avoid running out of xmitframe */
-			if (psta->sleepq_len > (NR_XMITFRAME / pstapriv->asoc_list_cnt)
-				&& padapter->xmitpriv.free_xmitframe_cnt < ((
-					NR_XMITFRAME / pstapriv->asoc_list_cnt
-				) / 2)
-			)
+			if (psta->sleepq_len > (NR_XMITFRAME / pstapriv->asoc_list_cnt) &&
+			    padapter->xmitpriv.free_xmitframe_cnt <
+					((NR_XMITFRAME / pstapriv->asoc_list_cnt) / 2))
 				wakeup_sta_to_xmit(padapter, psta);
 		}
 	}
-- 
2.43.0

