Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B0423D2B1
	for <linux-staging@lists.linux.dev>; Fri, 25 Jul 2025 17:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753465510; cv=none; b=L3GkIZSIGbkbUAophGUHRJx+Ik4c8l5e7k6BIa1S1spC3+ODiGx46heTfEvGL8C7XM7EE0FKF+IhL+K8sMKRBR19UFwG3ZXJc41LhXNrhxhym4V2JmWzeSj7A4dQpf1DOGqoliSOpSo3aXuWSYP191MjI18TkxobLdQ0A2a5Eu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753465510; c=relaxed/simple;
	bh=9sRf1xg4wEQuT9FtdI/i5Zt5IfYFrC+lTVhOM9sf6+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fASobCTdsXO5HUhmmGgFwfty9kmo7ByHBKFRSFASGZz/rhW3XEabIHZ9ul42dumEJ7LzMRXglJUhSUP3NmCa1IYm++4YABN2hXVswotnaQD37fqT1ud2AQ84hFAxdk3SKmhskUgcmwatw1pv6Vla8SJI5GKD5VOSHRtpL0TY220=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bCQyZrEi; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCQyZrEi"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aef575ad59eso402621766b.2
        for <linux-staging@lists.linux.dev>; Fri, 25 Jul 2025 10:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753465507; x=1754070307; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OtzwgImI+mqwxLZh9QnNUbkg7K6nkVm9gAGvrX9Q2Y=;
        b=bCQyZrEiI3KJf0z7XrdwlJ45JUCBl87QhsUoGUAiiSv5hGCs/2FAcmnCcQ4x+HAXO8
         pJFE5+0xiiUV4o2imOFsg606px2KtWhD23mxt64ydpemuQoeEFin0G6Pcvuznl9MJMcW
         jnEsWpaJC8spUy+GPnSzC8WpVU4EFNT0eLnShHw24HseBCZFJQDNLxwnw3+Hb6tgf4yt
         eweZE1rNX2AxuehynpxeECLUccXVrzVKR4GvHNMqSVIJPfbl752kZdA42i0IJ7MGMO9P
         BZAV6CqE0yOK40OEjAr1vga8nRZqFTXLpDBb4aunnzSV4qX+pSefkyKeSogmE99+DJ3r
         +yZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753465507; x=1754070307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2OtzwgImI+mqwxLZh9QnNUbkg7K6nkVm9gAGvrX9Q2Y=;
        b=rWshpkGWH8ImX9rzlfwdd0ZYf5p7Rxtc5BbOzUK2a9sTYXYJJfF5WLjMKlywPN9Th7
         Qmy1XRuRNzzN1wAFwLtSGVGb+dvXPB4yVX1R8SmT7j1smL4OJaEZzpxcauSTuCm7k0mJ
         A/RWpiM/IrLea++Eif7uZ+Ju8RwGavP9Owu7Cubn2aB37HTn+OPNhbqux6WFd4hlB5kD
         W5RA8Xk0sVcaM0RgTuQ2rAvB8R4VG9RTqSyvFY9f/vjUm1deua2sRHfDD0aqUpPGcxuq
         XM1DCtBY9nKmVTUnH98HmTbRrE+lf/wU8w7p5TnyM2PjLmLKauv5V0Y1JvckBvI4pQo1
         RbTw==
X-Forwarded-Encrypted: i=1; AJvYcCWLwp22gosHYb/E2XeKKko6oGRdTwAiI76QgOi1gmvTI4aBbf0cjUzX8+yoqNvPFUtMo0SsIEejI8724LFK@lists.linux.dev
X-Gm-Message-State: AOJu0YxzHPOUinsrBQ9kUcuT3KgcMRRzeAVYI93xbDhwqSnVAt5yGTJ9
	dTSCf91HUjavHY956xFsCqnKlashd5o5Ehji40eDWeWVn+FA1WGXec9ZU25rGssc
X-Gm-Gg: ASbGncvPQ31iDi39MdxPALR9E7obwVlVA4BQUGuQJii9IerwsT4gDQdUaFZQLhogdHA
	dMdEG90mTTVtiJtPWq62CeLIOeiTBpRaCzg4G+bWJ/smgPI2kD241Wj30fMkA+6z1crIqdl/1Bo
	0maq3ixuCGzpxFzzElluR0Dn6aO+rhHH0nySMmzNGmSm+kkbK2X54FfUBl6MpHtoJgBk7Uab8iS
	i7C42BdUROBnumfl5xLt6/Bw8k5TwbWdXRNJej9jmv3xlss8IAoMJF06keVLUKTGyY1MKPN2kKU
	QNOPJ/UjnPEokSUbSp6lxduSMa5KNMjbWBx5s0jwm5eXJKMpD6kjs1fMafCdM43qMp0D0gAhX5u
	sjzYm1Z0DmiaHRfruCYu9aHoSq5O12bjtBMjGLTCg9eTpoyb37lWoDNdCOYK1fEPmzs+L+mo=
X-Google-Smtp-Source: AGHT+IEmq5lzdiUntelzsfZ0+vVpNfXulcXdUNvkZLPLCOf6NCvEZVd9bAmaxELCyyg9xtE3PW9RCw==
X-Received: by 2002:a17:907:da5:b0:ae3:75e5:ff7a with SMTP id a640c23a62f3a-af61b6dd540mr345271966b.19.1753465506547;
        Fri, 25 Jul 2025 10:45:06 -0700 (PDT)
Received: from PC01.localdomain (094190205166.static.ipv4.heldenvannu.net. [94.190.205.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af6358600b1sm23968966b.7.2025.07.25.10.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 10:45:06 -0700 (PDT)
From: Bruce Qin <bqn9090@gmail.com>
To: bqn9090@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4] staging: rtl8723bs: fix if-statement alignment and line continuation in rtw_ap.c
Date: Fri, 25 Jul 2025 19:45:04 +0200
Message-ID: <20250725174504.15726-1-bqn9090@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725171933.10027-1-bqn9090@gmail.com>
References: <20250725171933.10027-1-bqn9090@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes several style issues in a multiline if-statement:

- Moved '&&' to the end of the previous line to follow logical
  continuation style
- Fixed indentation to align with the opening parenthesis
  of the expression
- Avoided ending a line with an open parenthesis '('
- Moved closing ')' to the end of the last expression line
  (as suggested by the maintainer)

These changes improve readability
  and conform to Linux kernel coding conventions.
No functional changes.

Signed-off-by: Bruce Qin <bqn9090@gmail.com>
---
Changes in v4:
- Rewrapped several commit message lines to strictly follow the
  72-column limit.
- checkpatch.pl allows up to 75 columns, which led to the initial
  oversight in v3.
- Added back the missing v2 changelog that was accidentally
  omitted in v3.
- No code changes; only updated the commit message formatting for
  full compliance.

Changes in v3:
- Wrapped commit message lines at 72 columns (checkpatch warning
  resolved).
- Ensured only one copy is submitted (per Greg's feedback).
- Carried forward the fix from v2 (closing ')' adjustment as
  suggested by Greg).
- Thanks again to Greg Kroah-Hartman for the helpful review!

Changes in v2:
- Moved closing ')' to the previous line as suggested by Greg
  Kroah-Hartman.
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

