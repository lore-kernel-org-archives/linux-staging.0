Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E9C3195FB
	for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 16:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779553727; cv=none; b=L6rCbbMAhNfaGyqWyX6d+ZAR37Fx5h076oJhMkOoAz61kGEbeqOhWFbHPlyyhew1zEZg2ltiodmT2kroYbpqfI340rPJ2PHAvzybP28bEcNm5Mo6DvJK8bYUMCKFC6ZEPwQRPQOi7bmjzGBMc7GOHdBeLyLUF+6uGTQERg5SluI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779553727; c=relaxed/simple;
	bh=Wq+fVBdvJhEilhE8iB0HzwZY4lIO/x38LxUEhg5dr8o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=du6rIRs+ui4U8cmeqHYo7NicXHzwIfxJOGrA8wLzAyW1rcIPfglg12ZqVyAlOO+eckR+tnxfKTfxDVGd3bBQox78brBh6QtGaU5oIDP0rqNUCsL+zUDU9rT/CQsIYergcrAAGLuU8b5kLFRKySz5LiJlkwq5zhaINFKRxcdl9U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fK0E6Xfa; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fK0E6Xfa"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3698e34a567so7521564a91.2
        for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 09:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779553725; x=1780158525; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zKbFKHpbbO8EuxXK+9KCu2Vc5rjksu2tQauAesQqJ60=;
        b=fK0E6XfaEKRLqXcTCJW51s7EZ3nkhWzDlZZuK7/rLEncsgp+L3wHy1G6U+DLF0ZrYX
         qQtvtMLGlSRhsGA+XJwHq/GIeodGMtL09FjYdXiu+C2/j/1qsUDDGTlPBlIy/IGb95Vp
         M8VtxWSV85BaIpIadL18gN5IWUcDqE9fH06EAYPyWY/YwfZdsAwQ++G0RRRSIgJ9ev6U
         DMRaTVzQXoVvB2jIVNz3a09yVqDav9gXs05n05vPb5kTR2L/Pa0ilm3jCpxBu1OYrdBi
         Gbv+pyFRXVbFP1JQNJWTZPKGAQNuREWRabbgTQolYJUr5D+K4m7kClwC7OmqS6IM+xHD
         KgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779553725; x=1780158525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKbFKHpbbO8EuxXK+9KCu2Vc5rjksu2tQauAesQqJ60=;
        b=GbNFnbQIiSpZW+fjRtU0yX3T6FUTJu6U2rNtMdfN5u1wPfNVXMvOkLxhA8qppEOh9Z
         MAtug5cECwUXdtOJCATV0CtwNBZuiiS/wCWl52Hlpg9nFLgGpOhYoFAjeNz96SfNneYu
         oN7xvk12ZGRK/gCx/f60Wapw8y+fafiwv9BEk6IDgfUUg0hsjHHDPTZHEDLES/h+dYQn
         uwnJ7D2m4ASZVA81wWCjFmEo3PGxhJ7mjq+M1DOiHGpmSiNqyy2p/AOnwxEaXPrzBO0P
         ioDS/Tvj4HumDFNg8wdVj/pBUw+uPf4w6AfOmJE8Th18oPkm0qlggMWBgdXvVN6TqONs
         eZ+A==
X-Forwarded-Encrypted: i=1; AFNElJ82uxb8wi0iMk3tOrgv0nq9a2nYE96uc4Qee+EhcYd/rD3ghhS+hqy3VFS0S5hAFJBzFBGbw0hzkonig9eo@lists.linux.dev
X-Gm-Message-State: AOJu0YyYWKRqsiH0dmOw2sC4yyGL7hBo+yK0ppu8XIF18e+xUeQ95TcN
	rhTPnqpOl+0b+RsHWf9TOFhrcurCmi5GSPOkdlM96Hv6PLg/Jti2L4+z
X-Gm-Gg: Acq92OGUawdFWu8TeZioYnmYTXAvMU0hTpTWuEmC5FLLzlEiCu2ewO6N9W3br7KDrdi
	okFywcrZLZPVsdw3dcp3q6IOLdUlij6lvybUcjsr6wkaR83qKKqNE27SuTMTMrHbZswb35YN9mp
	ByZ3ABIqbWvPXFkRIZDTJDs2tNM4/xMwC89H2cioh70xhtF29jFhUOy3Wiwuyd6bRN2rFGrd13J
	hlGSQHXu/u9s6TnELRyr0IcKXinGl0ejnNjmzHJ2XZfSJYviU8+/VPZPvcl5p+n8o2/VpFiaxs+
	CBTdq/v3AZADLEu+9JU74yPmMINbtFnmx3AUJXNWDjGsiQqQEvU0FLEyDumCRSOSqL/q+3q1o0d
	oP0NR2fg4yYL/gF2FFvdkDEPZql3raToS5Xot2MLntM6xL2LnfZMU4efolgn+eYHa7nGHNYiQiH
	lgmUGi2tcGPAl/UR3N9JpBf/Rp/1uaexbH55bYRFry
X-Received: by 2002:a17:903:4405:b0:2b9:87e0:1f80 with SMTP id d9443c01a7336-2beb066c91emr85519815ad.24.1779553725083;
        Sat, 23 May 2026 09:28:45 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d008:80b:a00:27ff:feb6:42dd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56e090fsm55792545ad.34.2026.05.23.09.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 09:28:44 -0700 (PDT)
From: Pramod Maurya <pramod.nexgen@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pramod Maurya <pramod.nexgen@gmail.com>
Subject: [PATCH v2 1/1] staging: rtl8723bs: Fix line over 100 chars in xmit_linux.c
Date: Sat, 23 May 2026 12:28:31 -0400
Message-ID: <20260523162831.163704-1-pramod.nexgen@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wrap the long function signature of rtw_os_xmit_resource_free to
comply with the 100 column line length limit reported by checkpatch.pl.

Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index d5bb1c7932fc..cb053af6b893 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -46,7 +46,9 @@ signed int rtw_endofpktfile(struct pkt_file *pfile)
 	return false;
 }
 
-void rtw_os_xmit_resource_free(struct adapter *padapter, struct xmit_buf *pxmitbuf, u32 free_sz, u8 flag)
+void rtw_os_xmit_resource_free(struct adapter *padapter,
+			       struct xmit_buf *pxmitbuf,
+			       u32 free_sz, u8 flag)
 {
 	if (free_sz > 0)
 		kfree(pxmitbuf->pallocated_buf);
-- 
2.52.0

