Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972CC2D839D
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 03:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770692847; cv=none; b=jNKVmM12h1jW+Uc28nS6TzPWiFSJv5GYg01nVhHu9kwQZySsh2cdl+Jlj1UjWcdLZSfSlICN2uNESw2jHJoc8tgRaz2gSnMT+q+X7s8YM0IFravlxMtFSjZ1FnJp3KM1BEs/1XA3wq6HSlt51vIG5Mgz0ATaX0xknBa8gbCIdYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770692847; c=relaxed/simple;
	bh=i7/JBASeHXM/cjI1waN21y6SIWDoM6hDKessSLPjiLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cykKJja0Fugbx4FCO99JkOfaLq9BSD+Nl66znxxPFXIrTYeS307fdCtJTuhla/f0ITbXeOLquvlj/l2JJzMQhLc6yFyG2d0efOse/NNZE9fL2b4lDHBe5SVLjziXzF7C1bYLOdn7xJ0Ptc7I0iyxtlfbZPixmSVcWpu5D60Zghs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lOP78KKu; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lOP78KKu"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2a871daa98fso25561835ad.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 19:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770692846; x=1771297646; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iyrI5LfPT28faT0T8IssVn66RCCqnrxefCozcBVyhK8=;
        b=lOP78KKuewKfCC59qRSUQ60U+s5RDHciIs7Wai+MPUXU1C5z5ThB7r0Dip+UBlug+X
         1VVLXqBaodZHtOD3VpbZXDHsJsJX//tRsaVVlLLUHWU3pB1zk/faxhOyb9270sy0LQZv
         tYz8u0EDfRqxPtg7lpOVJEeYVqhPb51sSiSKViOMQqg8gcQ8z9bPR38OsAGPNXDjSGB/
         J+wiptQNWxnSe70nn2bKkjoU9HP1OmeuYjqX5hyfx8woBhxqETECqDo2D5AH+XBK0DTj
         1XhAtnLHiIF3KdxxwZvJ9wyX95nD0tS6czOXEXwgJmIRxYCHbnlDg2bpqEEW9tSyzVAD
         EGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770692846; x=1771297646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iyrI5LfPT28faT0T8IssVn66RCCqnrxefCozcBVyhK8=;
        b=TczOchnaiDvrZcC+cW/6eu9qTlLXYprhGrGWHhRDY9youwFOv42Y2qRSEQprogMBSx
         N45hFZ5wX7n9P+POG/7X3eQaXquPv7h7AEGvybj9GfkCnOJPTGsHNUQhkVt009esQFX7
         qaHbcF2RCbjUF4Oh7z8iro/h7Buz8W1/9MTcr6Q7AvNgn2/vxnzcw9lbSu1F4rY3EaGB
         WiXcnqXPETOeENwQXvczKEzt4O5dSJaKC9UvOD3I4ALMMEByg0kNjSat0MmcWbalH4OO
         Gb+Y5DA6aEqSxbaxeg5sPzR86aVsHzwW9UzmonbzoFE3YaSLOd5qNP7zb1KYZmQXaq0R
         /lJg==
X-Gm-Message-State: AOJu0YxV33ZHekem5em8nI/r17M31aTj7H/DFPue14MJ9ZQrwIs0hx1E
	9zkycSBUWMUT8/aqag2OMatQw6ZNzsvpjKaDPT8y+ePXnWhdCI+PtXl5
X-Gm-Gg: AZuq6aKzME1OldZ67mvd/hVWZCOgahD0lyRMf8BGk1hZMeavsxSH1t/eGOGiNST8soD
	XcPosjbvLFhPzTy9D/zO4TSczLfek4IsJeiNkTxyKMMx8CB1v0LxlkNfZNQDr3ApB7n/AcgdeON
	ieS3417ifNldFRHr7snN5EwKYIS1EJXG/sLpRBE9FMuAnenFvKQH95rYeDWRuxtRA/xYlw6oUI8
	Rl9tq1mPOjwyYHnFlrLqyhawMg79iM1E/Fz4kcvwbLbJQAlqZcHxxQOj9/l65SWNmEgMgpo9omJ
	qUhoM6facLEHgnNzdb9zQwlazBoAbMtks/IsBHGAz9LG8PfFx+Vj/uc6odzA39XvaDLnetxTPm/
	4sCV9B5I15RSkHgRm3CgvJHj4hL8plir4z9qhtWWMhcwdN90pJbqifIgRNvhhtaNBKv6e3bJmd0
	FfS3psAAXDq4DSJ+UrR7SN0kDyJSELTP3WSPjSS+iF
X-Received: by 2002:a17:903:15c3:b0:2aa:f43d:7c42 with SMTP id d9443c01a7336-2aaf43d8075mr41667695ad.24.1770692846007;
        Mon, 09 Feb 2026 19:07:26 -0800 (PST)
Received: from Horstaufmental ([1.47.25.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c809desm116248265ad.30.2026.02.09.19.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 19:07:25 -0800 (PST)
From: Siwanan Bungtong <horstaufmental@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Siwanan Bungtong <horstaufmental@gmail.com>
Subject: [PATCH v2 5/7] staging: rtl8723bs: remove unnecessary void * casts in rtw_security.c
Date: Tue, 10 Feb 2026 10:06:05 +0700
Message-ID: <20260210030607.1430567-6-horstaufmental@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260210030607.1430567-1-horstaufmental@gmail.com>
References: <20260210030607.1430567-1-horstaufmental@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant (void *) casts when calling memcpy/memset and
other helpers. These casts are unnecessary since C implicitly
converts to void * and they only add noise.

No functional change.

Signed-off-by: Siwanan Bungtong <horstaufmental@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 2f941ffbd465..c2860dad2576 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1113,7 +1113,7 @@ static signed int aes_decipher(u8 *key, uint	hdrlen,
 
 	/* start to calculate the mic */
 	if ((hdrlen + plen + 8) <= MAX_MSG_SIZE)
-		memcpy((void *)message, pframe, (hdrlen + plen + 8)); /* 8 is for ext iv len */
+		memcpy(message, pframe, (hdrlen + plen + 8)); /* 8 is for ext iv len */
 
 	pn_vector[0] = pframe[hdrlen];
 	pn_vector[1] = pframe[hdrlen + 1];
-- 
2.52.0

