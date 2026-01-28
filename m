Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0E82FE575
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 18:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769624953; cv=pass; b=URy6BHWgkGXGHF4ZgaTZCmUeouBxkWiqH4q3ObRgImK7Un8oClBG/y64XyAm5P4k0Q+aNE13Doafq0+sLK0PLqQ5HgtJiyZISXcLgYpay6EQAH4AoBJkI7N+RThiPphZ/S0mIVnkgM8JhQLRDl60/bgnY7IBX3BnTRbjWi0I89U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769624953; c=relaxed/simple;
	bh=afIw1aZ/t0PaBW941TITVnKcTxU2PnHGRLkYlGw92+w=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=S9/SIwTWnjxa6R7fIGMPJubAc08i6HrafzgEBZB8iUBNR/N7xSOe2RTlR4zHxHjhTffdU7zY/NyrlHEt5ksdpMRdL546aO5BaOLAMj5DwCuOAHNwzclu/7x5Yw0Ghs0F2iB7h9l0en1JzDXIdIa/BevUJPboNFCvzBTAIVH2hgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lYch+mMu; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lYch+mMu"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so1160395e9.1
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 10:29:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769624951; cv=none;
        d=google.com; s=arc-20240605;
        b=gUretjzFbwmwRUSTiRk2Cb4cQAkPGRs9ovkcMIguc0HodW31qKiNw7ShUI66kRSz05
         DQwSYAUKEyioJnW88FMA8mp0KB3VNdbsIIzN1EsL3hYNxA7Gdd3v4RBIsLEy8QrCNPV+
         B68j+8Fzu305YkfZW1pLindEJFk/2jkPegcToJDShuatka34goeZFO6X/jbacP7HmOrl
         TBnxe4+Di/0D1V8WOCOHnQt+C4T8NZu4X0ucW3dy+AVQywXFM4AqpnWFp4F+gNC70xs0
         gev9P8EY0KhEtCwuseQkxxNbXS9OlqsBsB6exxCY+TR58ThU2lT5avaqM4pEY4umncai
         jAoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=J/4zIqQQOKtPQ+kDPki4MFmzOeo7RfkYDjP7jsHVZwI=;
        fh=OGuGyImkAcJwt+sRhpXRgKfXKBxNQnSga2zoz3XK8eQ=;
        b=Yxu1BZghQiSPxb8o5ubUeKZ7xuSS4UNXi3HiY3dJ6GyxMqzYeilQ8IdUdFFPQrYkBb
         VpcbCPBDab2ciGBxbSl8t0fVjGXH1oJV2pw7lK8cJPg8TYbFu/Zugyy4KS8ckAp0Ax+F
         EzwNZZCPtKDVjgf0cMSuEs3dGy3ABiWIau8bzm3mb7boEqxHJAa48IBfleWRhvODjXRb
         Cv9+1J0iKHhhJ+H+lBL029tEoQCEG9xmv1JxweScTNVY3qlzR2BiE2PBpxcrSuRf5Ae+
         OvJ1WebVeiGp7k4qndrCwyMJjxB0SzRTWdluDu4DvlDyITXiPpFheQhHSBR7YTmbTKIp
         Zaqw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769624951; x=1770229751; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J/4zIqQQOKtPQ+kDPki4MFmzOeo7RfkYDjP7jsHVZwI=;
        b=lYch+mMumyvr4gs7LHPPMkiGEXX+bHBYj0+uh3o2fvukSujcY4n6YnAYPEh4aDcJLB
         4HG5HZoY1jJ+J+bvFLAWYe98zsNNar+MpE5PLQSzxx/ia+C5IRMMSi4eUI/lmV/7E6rS
         Ya6z/cbw9AN/nYA9DrDzuayPNZV0PECRkHKZHurqm0KrP8za9R4kSq0z4aBOCeAfDdzS
         cRii11U2uxpSOG+9I1v7p0Gr90xc0V0QKXutImPFHl/7Z0zRXGfNwkMjeN8MeAE2Ixe2
         PRfJrVs0Kzj1pZnXGkSF0yrbpQA7Q29MTcLRn4VSyrHVciaOnJuLAUS0Bggp1SRSP6X0
         B98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769624951; x=1770229751;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J/4zIqQQOKtPQ+kDPki4MFmzOeo7RfkYDjP7jsHVZwI=;
        b=UpL+Ahbv4n+NOnL3dr4XbZwsJogLV7+JG57awUaRRSGuramQ8UFbjo6fhsl4UTyKD0
         uQboaPmHXhUWs361fuyKARjo70AAUU174vOh0B5752Ho2rWSEvb0CQr0AOpuJYPsaGWj
         Q6w2dCJN8FRlVdpeNjghGwRqWbCyO42GczMWV7tdXTdMZaAfPurcVASSB+jqFzhPh3dL
         xhbccBnoVMZ0f8Tj+RNtYbcqKxOWK4SFp9Rn/hof5awisyKOc/5Ipe5kQ8y2iUIYW5G6
         sYwNT9zzaeb6+W0A2a1sBp53W3fX3WMU7jy9kSKFtTCMmhHzJSO13NmnQpJGFeMni5AO
         16mg==
X-Gm-Message-State: AOJu0YzNodIIee051V2PbjOM6UXr08g2giyBoOJjEW2sV4iI+bLPaDUa
	4KvkKxH9KIwiXBsXs6dibV+QHZOkR4B97V2zFDieTk1Gh6m7/mFFEZS1Y46YanJCCPjzQAH9u7T
	6UAD1VIlkfWYlc+qTzDO+CQOpNyO5iUg=
X-Gm-Gg: AZuq6aLPNhMgFjPVd6uB2qEW2IItJnRV2ZM7M+0ASM2KiXIeKqfvr6QUzxD3sZp8gc9
	oJ8QPNwE2HG+OsWVCGqXAVa9SLS8u6ThOG094L0dM6lQXVj8RKBVsd1u+HfcUooJZfK+jidVBos
	fxesJOJ+kvlEkukTqetVEdolxUJDFENzkaz6POfeS9t8+MtvVWxqmK2TJnt4z6k3a16ogSv+MNQ
	6QYU8bOPUHlqqen0+tIZocFCETLcEem+f7aWRQpFeusYPR4rbjAsgyrH5hye86ouJZNPpx/
X-Received: by 2002:a05:600c:1e0d:b0:480:4a90:1af2 with SMTP id
 5b1f17b1804b1-48069c86e2amr91641655e9.35.1769624950436; Wed, 28 Jan 2026
 10:29:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Gus Stoermer <gstoermer1@gmail.com>
Date: Wed, 28 Jan 2026 18:28:59 +0000
X-Gm-Features: AZwV_QiKtlI_f_g45Vjp1E00ntMQ3gYCsAbiFlZyrhgxaB-TPw8_6cF0fxiEel0
Message-ID: <CABm+q84v7jvq-kF4v7U3bQZjdQJS946FTGowSAGPjk5FY_LKpA@mail.gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix checkpatch warnings in os_dep/osdep_service.c
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From 64ab45283c7e006c3420242e0f7b00acc1c3fd38 Mon Sep 17 00:00:00 2001
From: xlumen1 <gstoermer1@gmail.com>
Date: Wed, 28 Jan 2026 18:08:46 +0000
Subject: [PATCH] staging: rtl8723bs: fix checkpatch warnings in
os_dep/osdep_service.c

Signed-off-by: xlumen1 <gstoermer1@gmail.com>
---
drivers/staging/rtl8723bs/os_dep/osdep_service.c | 11 ++++++-----
1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index a00f9f0c8..95b1d4e8e 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -7,9 +7,9 @@
#include <drv_types.h>

/*
-* Translate the OS dependent @param error_code to OS independent
RTW_STATUS_CODE
-* @return: one of RTW_STATUS_CODE
-*/
+ * Translate the OS dependent @param error_code to OS independent
RTW_STATUS_CODE
+ * @return: one of RTW_STATUS_CODE
+ */
inline int RTW_STATUS_CODE(int error_code)
{
       if (error_code >= 0)
@@ -152,7 +152,6 @@ void rtw_buf_update(u8 **buf, u32 *buf_len, u8
*src, u32 src_len)
               kfree(ori);
}

-
/**
 * rtw_cbuf_full - test if cbuf is full
 * @cbuf: pointer of struct rtw_cbuf
@@ -204,6 +203,7 @@ bool rtw_cbuf_push(struct rtw_cbuf *cbuf, void *buf)
void *rtw_cbuf_pop(struct rtw_cbuf *cbuf)
{
       void *buf;
+
       if (rtw_cbuf_empty(cbuf))
               return NULL;

@@ -226,7 +226,8 @@ struct rtw_cbuf *rtw_cbuf_alloc(u32 size)
       cbuf = rtw_malloc(struct_size(cbuf, bufs, size));

       if (cbuf) {
-               cbuf->write = cbuf->read = 0;
+               cbuf->write = 0;
+               cbuf->read = 0;
               cbuf->size = size;
       }

--
2.34.1
