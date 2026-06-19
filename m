Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B143264C7
	for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 02:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781835784; cv=none; b=PXFUJoxCRSLWgHaW0Pz+xuOOWW/6XnQDXCCKGr9IUuiTlSxBSBlQ15efs4EB0eZdnKneOvmTCciBckj4IM1e3+6ulv7+dy4PG35GKdcbuBZ2tcN2E+bJQq9OLeXK6C47Zjii+L4KMUvXiWFYCOKs6mm3MCkKJNPq4iK870ftI4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781835784; c=relaxed/simple;
	bh=xayHssk6ExGQx27bQD6XNhHeARCmD6kJL27VOIfjIZ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aq/zUWDwnJx7qNFgeZJz8t07TJa8ZA9HPDfoxJCL9sN3f2bmZzuukHsyLh1+EYUD+5c4yCucWEGvaQx2LRUKN9EqcEcluR5gusLKqTd9f94kqDm1lkal7sq6HNJeh7+VBQO1me31u0wTHRdE0cWJcdZzYr31sVjPjw7MpKjLFOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dO9Zt60v; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dO9Zt60v"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36d5fd50d20so1193316a91.1
        for <linux-staging@lists.linux.dev>; Thu, 18 Jun 2026 19:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781835783; x=1782440583; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8FELxJtMp7+kDLfBZkhIAjWWarATj6Hw7w3n2Fhhv4=;
        b=dO9Zt60vqYuRfdOD+pr/fhpxG1qSKv9DJ+GwZ2cx/6z2NVOsvqYSL1BnK/r3zWCOg5
         wYNWXAXZay8TtHKCZQjEJJSbZk2XQpczOegGNk5ZmD/wWuhx5Xho5qu8/AkUKGyGKBKq
         KkZy3a0YQ5gMhn50rv0EJoBlWdWGf0VVeb7Pc0MIW26/U/0nGhAIxjxF1oq/TRHrwKk3
         eTs7XHCX3aaRcB2ig29/Xnf21y+66M4SuKEKpkPmR9XQdObBlLsX/pD36ysrb/csFly2
         AtKq4lW9TlR74ofB1HCIEq4mXEiOjVJ6q6sr37g1ixg6XVf2wZZtPfFHF7r3xpvVnZWA
         eyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781835783; x=1782440583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p8FELxJtMp7+kDLfBZkhIAjWWarATj6Hw7w3n2Fhhv4=;
        b=pUdn448s7GEw4i0MRLxPtrn+Gl3mpgJRoVKsuK3kGYdLGE38ZQ79KUmIGvUlFRDoT6
         BGk0ShtzXgeGOwYWRgvkM95GqBgHdTbduWOeTUGWfnO2dWUI42wzLH28GJe3lp+V8ZQa
         e/+rCPZnX2WiXrbSfnd9+yt3Ygt++s3IJ4gv2hluFjuX8CnXZEv1TRIpWOVr8r0IFd0/
         35GywYeuBXUny06/osR4ghrxCg47iTYWW+aA5NxozuaunSW0GYip1woEsrPEwDCNX+/s
         a9pe1s74AKZIQOiml5THFqbzpgUmkKmwTaXX0kOttayqEFy+RlSITDl7cisg8t426rZR
         thsA==
X-Gm-Message-State: AOJu0Yzp9MIYJA1ikDNA6DP0HDrAS70rPEpeX34V2yUPCDpy1lvlPWvV
	BM78locNTuugMSJlp7v9ohZCt8dotgpyUP76qla9Jj6KqL4qDvsaC/ZI
X-Gm-Gg: AfdE7ck+FvV8NufmQaQlELZNwjvts6M9JhxLaPi0Mo7er4cAd1xfanP+GRo+VXITnCr
	4hEkQub7FoC7KxJcCtxtVYG57xHO9foHfd3v+/XNKgtdLqW/wmrTw7C60FB5JT1e1a2/SY3kRQH
	nwFbNWkM7ud2AgYRznd9zRw1q85sU6Tkm6sey5aZJUeTjYaRjL/dnp/fOb6o3ZwS2ROiRLBYD5b
	iCV/LFjY/NiN3kpsYoW8NI4WP3jbTlPJo1Jq9XK7P2TvwaVnkBlfIrKJC3FVSZ1UxLT6Ew5sAiW
	Ug0loLOEuxeIDY4VZdqhzkeBf6JEFDtsXrIEVO4PljnkLXJv9OJsmOK+vG58ZnBnQ0HBScn++EO
	/1UMtAdYo7vyZTBqrxjXbeVNusbwgCeNjDfLO3TY4974C0TCBXqzYgeQfLa/y7V0mH8zUq3ED/W
	16LgFpoSpmdwqxfGkgALqX3q4ESmwHCcou/gFIoTzf3X4bO7EQt4hpTQ+l3jtaVhuMxfpz
X-Received: by 2002:a17:90b:39c5:b0:36a:8ce7:b879 with SMTP id 98e67ed59e1d1-37d1e82f4e9mr847153a91.5.1781835782778;
        Thu, 18 Jun 2026 19:23:02 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([2401:4900:c0b0:86df:f75a:8ee6:3dae:31fa])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8a888e219fsm768539a12.21.2026.06.18.19.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 19:23:02 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH 2/3] staging: rtl8723bs: Replace bare 'uint' with 'unsigned int' in xmit_linux.c
Date: Fri, 19 Jun 2026 02:22:09 +0000
Message-Id: <20260619022210.143940-3-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260619022210.143940-1-mokshpanicker.7@gmail.com>
References: <20260619022210.143940-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace bare use of 'uint' with 'unsigned int' in rtw_remainder_len()
function definition and its declaration in xmit_osdep.h.
This fixes the following checkpatch.pl warning:

WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/staging/rtl8723bs/include/xmit_osdep.h | 2 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/xmit_osdep.h b/drivers/staging/rtl8723bs/include/xmit_osdep.h
index 880344bff..b47b3f0c6 100644
--- a/drivers/staging/rtl8723bs/include/xmit_osdep.h
+++ b/drivers/staging/rtl8723bs/include/xmit_osdep.h
@@ -33,7 +33,7 @@ void rtw_os_xmit_schedule(struct adapter *padapter);
 int rtw_os_xmit_resource_alloc(struct adapter *padapter, struct xmit_buf *pxmitbuf, u32 alloc_sz, u8 flag);
 void rtw_os_xmit_resource_free(struct adapter *padapter, struct xmit_buf *pxmitbuf, u32 free_sz, u8 flag);
 
-extern uint rtw_remainder_len(struct pkt_file *pfile);
+extern unsigned int rtw_remainder_len(struct pkt_file *pfile);
 extern void _rtw_open_pktfile(struct sk_buff *pkt, struct pkt_file *pfile);
 int _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, unsigned int rlen);
 extern signed int rtw_endofpktfile(struct pkt_file *pfile);
diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index dc0b77f38..5c82b60cb 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -7,7 +7,7 @@
 #include <drv_types.h>
 
 
-uint rtw_remainder_len(struct pkt_file *pfile)
+unsigned int rtw_remainder_len(struct pkt_file *pfile)
 {
 	return (pfile->buf_len - ((SIZE_PTR)(pfile->cur_addr) - (SIZE_PTR)(pfile->buf_start)));
 }
-- 
2.34.1

