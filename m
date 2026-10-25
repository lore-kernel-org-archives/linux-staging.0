Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792931181;
	b=ZJ+KK2yDiiI9HpvjX0IlSdSkiySX6GxdpZe9ZHufojGUVCAPLXbr406WoYicmewgPmfF
	 Ss0Av3lJ13d3z3NA6fDx4VIR5sGEcX9M/TPV0Ft1sCrMfeLjHJLYrPzfs+V6UJCepdnEv
	 JxWubCbAEyLaW3pYhVdBCPUK15z5/50McsyZcSAeyuKh/YhDGG5hJrgGG5827AwWvGrdW
	 zyr2pK+6Q73RN73zQuZZiaz7ebUjLo5Po5H3j4u6I77DuK3m4GninKPIwPRbXNLFbMetm
	 UKbWyCBQHRm/C0kXSA9UEWNLpEoP5tC4fdrfdl7S7aTR4pkfqF+sQuSv1aRk8Ga5nyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792931181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=jufQttOKS5p8h7UvGh24c7CdZP0e0JDC2zgLNdpUMHw=;
	b=nd3q5tvfPO3vgtBJXNVDuUiyctZdoDBP69MjT6ZJ5W85GooKx7CdgdHLOfu8K/oTLoM0
	 iXpSj/ZuNGaGSawOoU4daR9cGqpHk3HF2JzDZDi5nSJCrhwlQv2jFibUU/zMDI2cNLfTj
	 Fzc+YDqztZQc1Ue8F0GQhxamA4amoJwSlvhSZXnyFDINm8n/kpVqijr9RdYmql/0+LG2G
	 IrsDkPi6w5Rgkq85oXA6JygvVBeC6T9+etqU+HnCsv8lWE4DRdrlSMTTkERLdFtOQhdz7
	 zTbcqOL7zv+97Z9IrUgpLjyvAgtom8SUGNitJ/w6E2OY02BzO6S3C2pCYYT7Ha+3sNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WmntTRwD;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A86606A31E
	for <linux-staging@lists.linux.dev>; Sun, 25 Oct 2026 12:26:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93A86606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WmntTRwD
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c4d870d54so1274799f8f.2
        for <linux-staging@lists.linux.dev>; Sun, 25 Oct 2026 05:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792931179; x=1793535979; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jufQttOKS5p8h7UvGh24c7CdZP0e0JDC2zgLNdpUMHw=;
        b=WmntTRwDahOuJx0LX/l0J6Q5aFRq3NG/xL9k8YwhTjEthYfqy90Ic7MfJi2w/HFm40
         v0Zg90RYY6C+ta+FSSelgUiYpiwIwNDRLXLN4xN+rVV1vqFdmyBv9xbGPTAMhQh59sPV
         iLOcmJdSNj5XilByjUpms/8mu+gPw+6zb8mo30JUzCAquKn6KfyWV/JY12U/WTSVk43N
         Xt7Zrr5C0aqOL0kR1qhJhya7q1R+ZIx9cOb3pvucJo46kYzC67uGB6uW9oFaGjKEoY9z
         GEsUlFdBWoSA+1V7x0lEOj7nIKMhS6WA21ZB/hhlLVmreRkMkHvpFDxHn/3Basw7GKFc
         lJnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792931179; x=1793535979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jufQttOKS5p8h7UvGh24c7CdZP0e0JDC2zgLNdpUMHw=;
        b=O38zzsnD4LfsRPiZ+u7F2QSufbXkrKUKYJw3b3wPBCjGy60hHpPfMMMHxwJKskwgo+
         DwZqRCygA7f+hrr4CUZZKVXtHEQ2LKKTK1/b7Q/BM85ma0DJyc/gzIO9o+rtEiREyxq1
         dtV++4H3LVnscZ1uHPxa+OVX9nbE/1acUQ1x2JJ3m+tqX7dcNt3wHRBkmnfjARGkwEcE
         eRhsVumIk1m1iBlaA65OwHpgga+TakLX23FCiYzCUMB24IGYEjfN5PmiRF7unq9U9Nzj
         FtMF+WrPhzz6qp9sXfIWhWTIeuZBsm1IxRTlprfB6kYAsPuaOkG26xOJBetD/KEgL6/w
         qWOA==
X-Gm-Message-State: AFq9FYLBzKId1ACPlzqBiWfBddMo+ZzskkIK4S6beWab0PzN+SxrDqYT
	Hsn614YumUSwBo3xDuG77Ja96KJeDsMhMe+RcAdB4hv9Myn6SWZovDfF
X-Gm-Gg: AYBFou3BbjZ/Q0SjyKx1l+QCt0GtGNnO24njHVsL7dUnwI3mayszgghhm4airUOLAHd
	0wC70UYqS65zCNHUsxGUK8MbLYZZ2BWXRbYhXIYBTSVWjzFBEymICjzLR2lluJasNShACx8Gljy
	RP/MONOaBruEFJ8MIYrQ/U7CW1aSLVduaYAFhYMFNrQTQAnPRTOE2pE9Y9b4EnmM4CYWd7MUyrG
	ugGhtXYP7CRu6/Fkbsu+IkzaUgfvc7IlPPZocmKqsGFu6+YVP8LySSIp2RDyecz3GqLDem9/FYw
	5nPad8UaqnvG6tPYzyhbrxVEhL/oULZFhs9yX7H1lW5NNeMTJrqAmmBipkEcUCVZwWLoSH76BX+
	GPMzVXkTcLsQOFNm4pADVop6omFzJmhhLytLz3khPT8gyIY2p5I6s8tfoSzZN5K9bAfrkHIRXrF
	6vVsUTpqi+jZBO1Kgxap4CYAeKQTojeiiU3TM0TeXQeCOTjinOyrhlJbWShaAbFjSpO/UY89wB0
	8QBe7tlP1F6FI9X8xvxFoJoZUZ6YH1BvQAdBOkR9jpRPdExdHRnKbuSRvCqmrG9jt3wbpQEKcq6
	aonCg4W0Gqb+41Guvw==
X-Received: by 2002:a05:6000:1843:b0:48d:f36e:fbcb with SMTP id ffacd0b85a97d-48e3eb8b2a1mr7255770f8f.14.1792931178772;
        Sun, 25 Oct 2026 05:26:18 -0700 (PDT)
Received: from Ubuntu-vm ([115.186.50.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd354asm9403851f8f.43.2026.10.25.05.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 05:26:17 -0700 (PDT)
From: Haasham Khan <haasham93@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Haasham Khan <haasham93@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary goto
Date: Sun, 25 Oct 2026 12:25:04 +0000
Message-ID: <20261025122504.8404-1-haasham93@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The goto exit statement jumps to the next statement, so it has no
effect. Remove it and the now-unnecessary label, and simplify the
conditional block.

Signed-off-by: Haasham Khan <haasham93@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 6f4bdad00f60..c2d0cd314b81 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -2005,12 +2005,9 @@ static int recv_func_prehandle(struct adapter *padapter, union recv_frame *rfram
 
 	/* check the frame crtl field and decache */
 	ret = validate_recv_frame(padapter, rframe);
-	if (ret != _SUCCESS) {
+	if (ret != _SUCCESS)
 		rtw_free_recvframe(rframe, pfree_recv_queue);/* free this recv_frame */
-		goto exit;
-	}
 
-exit:
 	return ret;
 }
 
-- 
2.53.0

