Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7B120821F
	for <linux-staging@lists.linux.dev>; Wed,  6 Nov 2024 18:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730918045; cv=none; b=lj4tcRU9+SDdC3htlVW2OPZl/F64yH/SDdhQHQBFhuWUKl7wqQ6d5olxIK/iPmJpZksQLrU1BSJBpWN1DbJG7R4YuWJfQP+TN3MSUWMBXS02zmImZ26FTwYy+LvXSSdQYrgnYXiWy4sWnj8/rcXWQLMlYax9tpjOA8UNIVNtxcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730918045; c=relaxed/simple;
	bh=ny1IUjXEbFDtNqc0wWpdYefNkINbbN1F2HIJhO+MYzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GQVdKQaHpjyRtHmA0F3PPc6XKm+gEjlh2jzZFqR22gwahJ9vQ6xwGAGq8bTM8a6DD1ZIxg6qDoq9dKwmmwW/B/rq4yY7q56+UeGt7CQPKc13iSRd47UTF64UjNSz00x2mz2w87E3r23ZJTyfxFWwMBX624+GBzDE4gyy7ulDMcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cusL4R7D; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cusL4R7D"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9aa8895facso7446466b.2
        for <linux-staging@lists.linux.dev>; Wed, 06 Nov 2024 10:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730918041; x=1731522841; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3pzCEQrbiGJWQExVv2MGO23rU23gFTpZ/mle6QP108=;
        b=cusL4R7D6UHgIpxaaDAPU1S8t1bzWscbDfdHeyt2eocD/mDXEfXQVpS6+pwceRWO5a
         cOow/dnwu2GKUCFBzy/AAqjhKUt6Hgh/p/463QOJwO9WH75tCzxY5LE32JVIHLE0Tcvx
         kfIlKVDw99xHPHLgGSjhHWld3bLlIINBRRHbgudDGXdvmDWJ68pI125IqP0ytvmOuGYc
         mUowYTWxWkeR2rO4Lvon73sYsKaqXzhdxHRaLFm6C5wHOXXHIM2fEpRQ5rmYUeW/6F+n
         szfCkrpr1iuR7YacZPJ0XTv3aGBGk9Uf/YPMGdolJ6/3NXKDzoJXuFtiNfuD6ihkVx8F
         Q50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730918041; x=1731522841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t3pzCEQrbiGJWQExVv2MGO23rU23gFTpZ/mle6QP108=;
        b=doovKobQysr1b2qI+YgGQXqYwrcLfFQN/RVJWT6jIS2W50c+UHd0W3Ffjl2ySwqAAN
         B/zuUB2IaVeEfd2nrBTjK7xovbzqkWeL15oMNFYmVuEAG38pBISpIx3drO/yVigNrYf9
         c8MYNzcZEXpwtep+W8YQ6wRKStctkuooPzRpeujln49L/qGwNWFWamBldlgiXDC7kziy
         nUZtkQCP0goe5hy3PP7vUmoBet7ew1yU6w+YIhOygmSXCu/mzSgaK7gT9CMlcE8domiz
         WaGLo26bl67ZFy+lK1/aekzIbF5zaAHAfrCMHe916sbZnWvuDvWpq95KQOuzExrmHsVB
         1Tdw==
X-Forwarded-Encrypted: i=1; AJvYcCV92j0f1DTLeiWFWgZJNaQ4n0IL6xX35hLFYrKtOAh43C5rtEhat4PELmuQntWSPahcJlmWhK3IFBQpwyx9@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1IGYr2Idz4zlym24r/+2fbVmBRkYpjqjo9d2ykKGlLYbGpMy4
	Juu6IysU4jAQklWtlqzsLUw22urqBOCummkWndGe27lZCYygIVZg
X-Google-Smtp-Source: AGHT+IFAh3RBtPNKcN9/sNK0cNys4JGcj/3Rx35+A4EhhOmpgVoWubYQ22spneKC0iomtUT8jV2EKg==
X-Received: by 2002:a17:906:fe01:b0:a9a:6477:bd03 with SMTP id a640c23a62f3a-a9de5ff917amr4046905066b.38.1730918040971;
        Wed, 06 Nov 2024 10:34:00 -0800 (PST)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb1813a07sm315298966b.190.2024.11.06.10.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 10:34:00 -0800 (PST)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 11/16] staging: rtl8723bs: Remove unused function hal_EfuseConstructPGPkt
Date: Wed,  6 Nov 2024 19:33:40 +0100
Message-ID: <8625bceb13e5a319a1d0752bde79888fc8622ca0.1730916582.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1730916582.git.philipp.g.hortmann@gmail.com>
References: <cover.1730916582.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused function hal_EfuseConstructPGPkt to shorten code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index ceb234cdbd74..acd9c8128f94 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1168,20 +1168,6 @@ static u8 hal_EfusePgCheckAvailableAddr(
 	return true;
 }
 
-static void hal_EfuseConstructPGPkt(
-	u8 offset,
-	u8 word_en,
-	u8 *pData,
-	struct pgpkt_struct *pTargetPkt
-)
-{
-	memset(pTargetPkt->data, 0xFF, PGPKT_DATA_SIZE);
-	pTargetPkt->offset = offset;
-	pTargetPkt->word_en = word_en;
-	efuse_WordEnableDataRead(word_en, pData, pTargetPkt->data);
-	pTargetPkt->word_cnts = Efuse_CalculateWordCnts(pTargetPkt->word_en);
-}
-
 static u8 hal_EfusePgPacketWrite1ByteHeader(
 	struct adapter *padapter,
 	u8 efuseType,
-- 
2.43.0

