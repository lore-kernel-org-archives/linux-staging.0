Received: from mout-y-209.mailbox.org (mout-y-209.mailbox.org [91.198.250.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A38832FA10
	for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 14:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774708064; cv=none; b=m0D/GaT7cN/hXlpjKORcn4VygyO7687r0rl2/aenkauBHUXibni3NpGAenUt0TuFnx+WCXpYJP05RAnAI9FNwvFY0tD3sYpiCzMK50us8lI5tB8uhpq4g7oPV6q6OiLIbVY0um+q2wr9xVy9gvtZRdwPzPnMMXKuudDtNadECdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774708064; c=relaxed/simple;
	bh=RQZh1cL9GDgV9BzilQ9AVw4vUZQjNsSt089KnQMzQAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pgwyM/9z2vqPnM+Jm9MQeKnMd2aiNNqBA3HDachvXTqqwYBakFGd8CeMbten1Ir5agpUTtp+JRmqZ75J+Iw87W7NA4mh/CWBgeGRESDD6numD0Ow6jpRKsJiHfyq+YttHEACjimsKfJdwt7UsgCR+/Jo6R+SKYHEt1DiMZOTQfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=XiotdtdU; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=vNVLFrB3; arc=none smtp.client-ip=91.198.250.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="XiotdtdU";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="vNVLFrB3"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-209.mailbox.org (Postfix) with ESMTPS id 4fjfx35FNTzB10m;
	Sat, 28 Mar 2026 15:27:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774708055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0E0XaUP/axSGkwizJi8jN3xDahGcAKsuxBCkbVWDssk=;
	b=XiotdtdUXtXs6OyvP2ytMCN8ZYNXmHPc+wPoYKSLYgnCh2UMy15DubKreGUHMqLhmtfy3O
	02ASUyB6JZROw6+ZGYdc6o9yr4I+bFsFDx1Q3lEea7A5TJRZnp0h1lAXWg9LhtsxYQ8S3O
	1DGucsAjp1zQI3oshdVUhrOnLIkBR29KBgn+qIGLaw9peNmlJyiBuq8uE6QoA1h0fga90+
	In8p8mUvFyX2sH6ezf+C7F+3iV5sCottjZlMXbSKWE+MCBlU+Ti2eZ6XfRzXmmNYEc+iV2
	WK5Ubr73V1W+MwA8/dxkxn/HXHSkdKvE6bXtwzawz/9bGfbdFtfBzCUk05g8XA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=vNVLFrB3;
	spf=pass (outgoing_mbo_mout: domain of mashiro.chen@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=mashiro.chen@mailbox.org
From: Mashiro Chen <mashiro.chen@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774708054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0E0XaUP/axSGkwizJi8jN3xDahGcAKsuxBCkbVWDssk=;
	b=vNVLFrB3ry8r8t296dqImcdI3i+y5C/YXSigpj2FsIltXRvhTRqQUICh1z6vL7VMgv1BJD
	d3aMb/OYAKJQQY4017g8vP7JMACnKvQmyab90Iw31AV1BYygfN3e6p5IyywhM+lnz1RZgd
	5XGM0XnUpSesI0NcWjWFmJCpLYl5Rt/C+fiuPvUnnR4CR7Lnr0/CP1NZP4rVNt+52sMaZL
	q7yb8hAztieSF8Rft5E6xKGD/PqhstV+tQLjMcpcMfOkORKnwAKW683zxYfymu7UXqfiZX
	ctA5vu90qawsmrfTrHeSGbvxJkLz/tuYWwYzlOZ2UMrLo96U7YdIbWDQyJRFNA==
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mashiro Chen <mashiro.chen@mailbox.org>
Subject: [PATCH 2/4] staging: rtl8723bs: wrap complex macros with parentheses
Date: Sat, 28 Mar 2026 22:27:07 +0800
Message-ID: <20260328142709.330401-3-mashiro.chen@mailbox.org>
In-Reply-To: <20260328142709.330401-1-mashiro.chen@mailbox.org>
References: <20260328142709.330401-1-mashiro.chen@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d45c42f18e53f041208
X-MBO-RS-META: teuq4nfqkf7mfxbr656r9yb5p3ktpf19
X-Rspamd-Queue-Id: 4fjfx35FNTzB10m

Fix "COMPLEX_MACRO" errors reported by checkpatch.pl
by wrapping macro values in parentheses to ensure
correct operator precedence.

Signed-off-by: Mashiro Chen <mashiro.chen@mailbox.org>
---
 drivers/staging/rtl8723bs/include/basic_types.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/basic_types.h b/drivers/staging/rtl8723bs/include/basic_types.h
index 99b12c724..edd64bcf2 100644
--- a/drivers/staging/rtl8723bs/include/basic_types.h
+++ b/drivers/staging/rtl8723bs/include/basic_types.h
@@ -154,25 +154,25 @@
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

