Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA53D3FE667
	for <linux-staging@lists.linux.dev>; Wed,  8 Jul 2026 22:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783550463; cv=none; b=QfS5Peif2+f8G1fVMUvWerna6IBHWlpLS1PcOVyZ5edo3qQpb2S5OEPoV60yeO0bbMu90tXhB6dJNRPKuEr5e8YucowPN90jgMXXLyFsT6c6dJUWcmAVyxLlFCPrbEigXAjiT2DVDGeZ83Yfl2OnEOP4DEwSe+Huj2MS3AoY3i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783550463; c=relaxed/simple;
	bh=uGlhnGMPuQ4RayAkHaS64ixQCOGbt+5A7KdNeuN1TRY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=irMD6KCr9I/CMMCpa5u/3fxlMwMwX7RL38/wEFpjC6jy+mmfJYWIXL4lz2SZvXg0eAG4eSXBQRUCX7B9ia1JpAaN/F1g5oFTPmzPkFFbtjNYyWzOkc/gnOCmeMawWiZvV8afxu1f+R/zcCI0ld74+oUxjqX+BPc9ms8LS9m+kIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tb9mJ1+U; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tb9mJ1+U"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-847aa193d98so1038435b3a.3
        for <linux-staging@lists.linux.dev>; Wed, 08 Jul 2026 15:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783550461; x=1784155261; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kgIG9CSRr33TUP10cuCLiIIubx4Ez94VMZXmdWVcrIc=;
        b=Tb9mJ1+UMWwlbuNaYxhKnMPt0NtkYm/Blvu/3x/OW42bxqKZiBDERKR686wtoY5MuW
         Hi/WJg4X0KShpo9mGGrGWYWH5dBai6WL7SFqFKX+ieJYWzZ/0zkW+W1EdqNwFwuofJFc
         2m55wJwsTKmIwBMzSjOGEPfu5oXWL/OshmU3dXeeKIwiv8A6y74nFw3NEHsnELMnuSeV
         h4tUMEuTQIFGATf5l4P8RqMXoC3euZ3KIUFwIGXZXXrXlTYtdThRUNz1HbL4tlxT4FpA
         XJHB1QvsBy9h2DX7cUbb15I7lg4EbKbvbwCSV13VMh5latkwksAC8949MZ6zcTp2M0eW
         fzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783550461; x=1784155261;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kgIG9CSRr33TUP10cuCLiIIubx4Ez94VMZXmdWVcrIc=;
        b=JGEscoWOeQEMM9EKm9PZDXT1zbgOqUl7+fkSU9VHYB/rF1hDMIwdJAIc6C/9P8KBlQ
         XXIPybMAlmVN9gWoZzXfcefmsdyGvAgAhUCwbQJDbqg5x+1nw/R5B+xDPPJDPyDMSKi/
         QnUTRV1SR/h6SDmhvg2yO/XSgHzo7vse4wGd4t4fe5cfQi3N13DBuRetDmXCTaI6vgBv
         qaLHpkJdOukgWjxZrxeSBIafuUzgqZZBlTf43WJ9dk9VIxfiixHjFD+vY8t1x9fGbRrK
         wRNbyrXh6fq+S4qwZPTJVdSx+FsJNCxq4XPWM1L2NU8IdCaiFSPND3bNq6N5lTQRYvB1
         b66Q==
X-Forwarded-Encrypted: i=1; AHgh+RoP3/wIRD4btgKQ63O+hydZ163QOunFT90tdimswubhPhmHoMVd6i7EsDOi896Mobz2IhBAJ+PgNTrVD7WY@lists.linux.dev
X-Gm-Message-State: AOJu0YwlStcsn57IaXrbTG3loBHJhOvaYOfytL5DUYbixqdYZu9haCWq
	XWIs64aG/gesPcbvSTrb4JPkU9CkQNXK48+69RkhG6aZekZk37jS9JEx
X-Gm-Gg: AfdE7cl7y4qg1eOtoO++S4cy/nkksezu9jrENTYygqWeRGgkLABwOxW0WS4T7PrmgDW
	vIKumRos7cNFJn0kuVgvpQiQ62lSCELmK2ygFog6dtO2lSU28kIAUWkbAyvRKqc/enVm060t3Ph
	VwYhvv+11+4zNqo1evQ+M68pT9fAc0st3DMRfMMMNe0vMpTDVA40Gf/BJzuuHYEyS/EY1/JLtQ6
	Nw0Aq33nTQOwE5KOWhzKI+Ckf5MQ+uHWCxhs2fBiVm45qhojL3M9kaTQ+El5b/J6po0p5jCrEdv
	P7UoSONxWBlmjwJtZMGRi0TXye3kn8jbRxpOIooomvB0HAIVUAmX6ViKKU1Ruo2B3ggH/iJQlkv
	5ZZHyOP2VPpXGhDBJH/rjpLtCaXQz1DARgzedphMmw1LUx8IWSs/YdRi+AsicPvC6QR41g8dPCW
	6cN0zf2burD4eU/Aqzv3JMQDxkcp42CICQ+BxcCI4SdfNTB6E5l7BXRCIfUYTa0Ad5
X-Received: by 2002:a05:6a00:92a2:b0:827:4bca:f1a2 with SMTP id d2e1a72fcca58-84842fdf0c3mr4465217b3a.10.1783550460969;
        Wed, 08 Jul 2026 15:41:00 -0700 (PDT)
Received: from thesun (222-154-149-34-fibre.sparkbb.co.nz. [222.154.149.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b96c0fsm7588089b3a.20.2026.07.08.15.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 15:41:00 -0700 (PDT)
Date: Thu, 9 Jul 2026 10:40:54 +1200
From: Ashton Warner <drflamemontgomery@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH] staging: rtl8723bs: Wrap line exceeding 100 characters
Message-ID: <ak7R9mUk_0hth0xm@thesun>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Wrap lines exceeding 100 characters to improve readability and to adhere
to the Linux kernel coding style. This fixes LONG_LINE issues reported
by checkpatch.pl.

Signed-off-by: Ashton Warner <drflamemontgomery@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 86c5e2c4e7dd..519953c33034 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -44,7 +44,8 @@ signed int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *pada
 
 	precvpriv->free_recvframe_cnt = NR_RECVFRAME;
 
-	precvpriv->pallocated_frame_buf = vzalloc(NR_RECVFRAME * sizeof(union recv_frame) + RXFRAME_ALIGN_SZ);
+	precvpriv->pallocated_frame_buf = vzalloc(NR_RECVFRAME * sizeof(union recv_frame)
+						 + RXFRAME_ALIGN_SZ);
 
 	if (!precvpriv->pallocated_frame_buf) {
 		res = _FAIL;
-- 
2.55.0

