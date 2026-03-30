Received: from mout-y-209.mailbox.org (mout-y-209.mailbox.org [91.198.250.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758B43C9423
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 11:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774870981; cv=none; b=hOKtkhjpu9mvhRfsPhgRfGzVx/P0pQoA+oZFcU+L6hs0xE5ZnTI14Enp5i+9P6vAPKvpoRKDYqDlGWniUh/HTQIYqDAorItABKQNyRaoxAuIea0Q26oKB+wTorR3TfUyquGGzUJsmkYXoVrPiDXyuYuEHtQM71FADgctd336m8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774870981; c=relaxed/simple;
	bh=pg1atujQH8ePeNzCq622ssWzobnuLmFm/iIyg/Fc1uA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t8RRYSnd8GRWlST3ptrc5RhEqIfpSfRY5tBPjdEisZfSQDwsXsCKU2BmUa8fdFnYG2fWP3RarI9bLgyQgZlH3ThfWlC00X1uQza/jFie1hB78OfbXTAOtIIHxD+yuvRTiuwSex/xXeF4B3diwwd70M9SrLbdMUaBxGJQgOD/Lp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=rXZpW5tW; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Eksclmm9; arc=none smtp.client-ip=91.198.250.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="rXZpW5tW";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Eksclmm9"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-209.mailbox.org (Postfix) with ESMTPS id 4fkqBB4rkWzB0tF;
	Mon, 30 Mar 2026 13:42:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774870978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DTCrseNHFLcmcwzbWXB+4uGWNmrDvhV/Uz39fuLhUZ4=;
	b=rXZpW5tWrIi+ozOFy9IIh6hMjxUJqbWOKCWnbAoieFJO5mf3KYB37QzQBv+Q3OX/LUc0oy
	KGoew7+BcuPW5yXw/3B0RMQKedrTD/vpes61vH3UFACbK/xILBxuGAocLR3sgZDyKUAvjP
	1iRlcdM3+BEPjt/Z5YsMHQtlA12dxVEd+c6CmiU9QluRLE9iQNY+hxf9llaob7od7377bs
	RHxdgty7owPjBcrBXxBDhADyvynJDQ7yYAzP6vvel/H8iPjx8DVanJSf9o1vmF7qIVj1xD
	hwV+dJtMWC8szT1BQGzUJLFCH4XAMt+sbi2bwVPifgTV+V4qKHMA2xDN36Sz5w==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=Eksclmm9;
	spf=pass (outgoing_mbo_mout: domain of mashiro.chen@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=mashiro.chen@mailbox.org
From: Mashiro Chen <mashiro.chen@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774870977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DTCrseNHFLcmcwzbWXB+4uGWNmrDvhV/Uz39fuLhUZ4=;
	b=Eksclmm9rt3Mm5H0I7aJgiLt3gcgCqniLQV50poapMCHRxX8rJzLL5bDe0GTWHW/F9g4Uz
	P0S3n33mvnqcT+m1eKTuG2Kcsukf+UQhQhi1dB1kshmHDzjNbAfEad5JnmfwcHjI0KoTT2
	hGha/kKBgw3DSLQBzjd6r/rgIk+rMWBewYe04pn5oSG4kuKO9GQ22bFNAfMEbbHYPYCueU
	FJX6vFmq7teNJBhPxvBYvQ0F61JAUWj5kitp+xhJbkOieXmH5Gw5TMc+9YUmoTzi33ZQJc
	2UwI4acifFIk521cwrrRsx6YVr12Eb68Kx4Qwqol5IsuL+NbNIq80AxsJ31HvQ==
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mashiro Chen <mashiro.chen@mailbox.org>
Subject: [PATCH v2 2/3] staging: rtl8723bs: wrap complex macros with parentheses
Date: Mon, 30 Mar 2026 19:42:31 +0800
Message-ID: <20260330114232.91431-3-mashiro.chen@mailbox.org>
In-Reply-To: <20260330114232.91431-1-mashiro.chen@mailbox.org>
References: <20260330114232.91431-1-mashiro.chen@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: afbadaee6e82c3fbbfc
X-MBO-RS-META: 19o6b6c1keqgkguhw7nmcbxbg6dyowyw
X-Rspamd-Queue-Id: 4fkqBB4rkWzB0tF

Fix "COMPLEX_MACRO" errors reported by checkpatch.pl
by wrapping macro values in parentheses to ensure
correct operator precedence.

Signed-off-by: Mashiro Chen <mashiro.chen@mailbox.org>
---
 drivers/staging/rtl8723bs/include/basic_types.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/basic_types.h b/drivers/staging/rtl8723bs/include/basic_types.h
index 69f7402d8e5c..2cb6d24fdb1b 100644
--- a/drivers/staging/rtl8723bs/include/basic_types.h
+++ b/drivers/staging/rtl8723bs/include/basic_types.h
@@ -129,25 +129,25 @@
  * Set subfield of little-endian 4-byte value to specified value.
  */
 #define SET_BITS_TO_LE_4BYTE(__pstart, __bitoffset, __bitlen, __val) \
-		*((u32 *)(__pstart)) =				\
+		(*((u32 *)(__pstart)) =				\
 		(						\
 		LE_BITS_CLEARED_TO_4BYTE(__pstart, __bitoffset, __bitlen) | \
 		((((u32)__val) & BIT_LEN_MASK_32(__bitlen)) << (__bitoffset)) \
-		)
+		))
 
 #define SET_BITS_TO_LE_2BYTE(__pstart, __bitoffset, __bitlen, __val) \
-		*((u16 *)(__pstart)) =				\
+		(*((u16 *)(__pstart)) =				\
 		(					\
 		LE_BITS_CLEARED_TO_2BYTE(__pstart, __bitoffset, __bitlen) | \
 		((((u16)__val) & BIT_LEN_MASK_16(__bitlen)) << (__bitoffset)) \
-		)
+		))
 
 #define SET_BITS_TO_LE_1BYTE(__pstart, __bitoffset, __bitlen, __val) \
-		*((u8 *)(__pstart)) = EF1BYTE			\
+		(*((u8 *)(__pstart)) = EF1BYTE			\
 		(					\
 		LE_BITS_CLEARED_TO_1BYTE(__pstart, __bitoffset, __bitlen) | \
 		((((u8)__val) & BIT_LEN_MASK_8(__bitlen)) << (__bitoffset)) \
-		)
+		))
 
 #define LE_BITS_CLEARED_TO_1BYTE_8BIT(__pStart, __BitOffset, __BitLen) \
 	(\
-- 
2.53.0

