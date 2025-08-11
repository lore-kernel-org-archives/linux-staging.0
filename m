Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5022561AB
	for <linux-staging@lists.linux.dev>; Mon, 11 Aug 2025 07:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754896166; cv=none; b=c2wg/XbY5Gix7U0oi6sjDf02mbGE1gELME8D9Rjf2UOd/R6BuAl1eVel4NLZgCfl+6mpY3hnhZpkR2YdSMxeXv3Lm9KZ9a3FEDf1oHXoFW5IPWw6p962AupY1jSSj+eEcasypPqVG4j0yHb20GkjyuhyJW79FFqZbXLD8q5EZo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754896166; c=relaxed/simple;
	bh=2LEV/rJ2EpdmlK9SWpXccKfrDc9wj/whCvLfKvBSOzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dBG6Dgf+e4Gx7BQfi/KRsb6Uq5dRgY+wzhrg1iQegfnRQGFHMSiTUyqz7t6LurMJ/mB0xNIOBfMv6Y9GvL5zCsH4JXp94MaZmBX+NYEQXD+5ENV0RArSPaFswhGKCdiGyacX55AYJhxJyGyHMvw8JXcm+FlbfvFf/EAsL95ZxkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CNP8L90U; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CNP8L90U"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6157b5d0cc2so5663030a12.1
        for <linux-staging@lists.linux.dev>; Mon, 11 Aug 2025 00:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754896163; x=1755500963; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtPUIfPE/JF5lmxQvk2lcZwUGw+llT/Y6memSadyYOk=;
        b=CNP8L90U57L6T1MfCk8WzjyRQ4F93sQWYqDZN1DOfcLH/NPZOlRMoFvxEp3uaj8Bx6
         ns8RdQKwjBlv6GM0xBHymXfN8/IuHtsAmWI3vNfQ8mto5P/dWjJmmWJPchkFjQgXeBSv
         PwhACGhp+y1x5HrM01evf8qmFI2FmlAyr+WA6CbofCnz1tehZz0/mG+sd0k0K3gwdYjy
         6ODRSYIqjyVUXLjHa+7e/kBfQkqKWm4SPgbpCMMowS4XxTTMY7z2NwWa1fqDPWE2/y7z
         PWoXVVWq/z7K1T9z6cWOTI6OIVhBiMBcJWeAxouJnBfeDh80nbBdc6cq1zngircb6dZP
         Z0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754896163; x=1755500963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xtPUIfPE/JF5lmxQvk2lcZwUGw+llT/Y6memSadyYOk=;
        b=hYVydpWg3XTVcFRr3X4xjs5RsH5CyVd+ybR+HSpaZY7g0okn2UDu4qs+28XECBTqst
         jpb4S8o3sbtH6aYhqraAY54UBMpzM4AT43iY/89uCB8++YibUO+CdxQkL+zqfycecGyq
         NcNq1ogxjGZF7d2YXSSRcsaRQZfcWMWi38JYVv2eE5/0PZ/M8MM35sZdf4fYyQXKI+90
         Qq11G9WbrMwhO6US8GW9b7aV8fV7zUf5BrKuvS7yLZbCCn8EVdJf66RewQsh2e3Vhb3B
         irpwu5V4lIwnOUvzzoodZ7kR7Ce8I8nj8AzixkL5+xDEhPd7Jw+7FLWJUCN9MIvwVhqI
         L6/A==
X-Forwarded-Encrypted: i=1; AJvYcCVXT60o0ote0t/B7XtY68J4HfsL/7IQ4WCSpzoCb9YJTJ9fpusvvCV3oiJ0NN5+v5imTqZ1KDWHzF92eufr@lists.linux.dev
X-Gm-Message-State: AOJu0YyZpLGgWMFLtn6NCpw1TmejK+jizCW67qxs76QFmKLvwhIC1a+l
	JgS8ChiGgmGoa57cgebuUqWfvFbFPDUPz2YrBvgil8xIfLJ90KxZn/zR
X-Gm-Gg: ASbGncvTXKqF8l7RCj/w8qh/eCC5wD3SeTKpqox7Le01+vWBNRJn5tSr79t7VHcYbyt
	HxtJHG9/7BftQgt41X6cELO1FC4qLtwqGSlU4fcu6vaxW6pzyQC0OkcKl7jvwnEvcU8U2jU0vO/
	CAQQFw2M/V3/otSYR3v4V5p1pd0m+YJ7TLrhEiz7WgRv4lTbLBAWB28UqlZ3/qAjZvPHGSheZSF
	6NImE4ky52jYZ9ErPSHYpdiHlSPfFICwEZuALkswbY3cUOmg52li9iW4q71yjyCOEToeSmItRA/
	CsHB568xqQJhjrlJJo5BNGo6qNcRR+UU/2KbilaaLMiFmjrmfEZBD1jnaZnH+2zxTEAkGdHddrY
	I1YZRk6prTVNT2tmIuqwYqDe+QnfbnJzu/Y8jFN9FM1ujnzePTQfKMYiyoX/C8rrT2XMIUgzm+q
	9R/yI=
X-Google-Smtp-Source: AGHT+IEPOlXRGWGo1oXongH5SS8hW59c99+Y0D69n0H0pJPQ/thMH3hAwghRrl5UfxU1cXmatROwQQ==
X-Received: by 2002:a17:907:96ac:b0:af9:406d:f0a8 with SMTP id a640c23a62f3a-af9c64187c6mr1089954866b.23.1754896162857;
        Mon, 11 Aug 2025 00:09:22 -0700 (PDT)
Received: from tumbleweed (ip5f5ab8dc.dynamic.kabel-deutschland.de. [95.90.184.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a14a0sm1979188766b.33.2025.08.11.00.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 00:09:22 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/2] staging: rtl8723bs: use crypto_xor_cpy
Date: Mon, 11 Aug 2025 09:09:05 +0200
Message-ID: <20250811070906.27232-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811070906.27232-1-straube.linux@gmail.com>
References: <20250811070906.27232-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the in-kernel function crypto_xor_cpy instead of the custom function
bitwise_xor, as using in-kernel functions is preferred over custom
implementations.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 46 +++++++------------
 1 file changed, 17 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index e9f382c280d9..08d179857203 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -7,6 +7,7 @@
 #include <linux/crc32.h>
 #include <drv_types.h>
 #include <crypto/aes.h>
+#include <crypto/utils.h>
 
 static const char * const _security_type_str[] = {
 	"N/A",
@@ -641,7 +642,6 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 /**** Function Prototypes ****/
 /*****************************/
 
-static void bitwise_xor(u8 *ina, u8 *inb, u8 *out);
 static void construct_mic_iv(u8 *mic_header1,
 			     signed int qc_exists,
 			     signed int a4_exists,
@@ -849,18 +849,6 @@ static void construct_ctr_preload(u8 *ctr_preload,
 	ctr_preload[15] =  (unsigned char) (c % 256);
 }
 
-/************************************/
-/* bitwise_xor()                    */
-/* A 128 bit, bitwise exclusive or  */
-/************************************/
-static void bitwise_xor(u8 *ina, u8 *inb, u8 *out)
-{
-		signed int i;
-
-		for (i = 0; i < 16; i++)
-			out[i] = ina[i] ^ inb[i];
-}
-
 static signed int aes_cipher(u8 *key, uint	hdrlen,
 			u8 *pframe, uint plen)
 {
@@ -941,13 +929,13 @@ static signed int aes_cipher(u8 *key, uint	hdrlen,
 
 	/* Calculate MIC */
 	aes128k128d(key, mic_iv, aes_out);
-	bitwise_xor(aes_out, mic_header1, chain_buffer);
+	crypto_xor_cpy(chain_buffer, aes_out, mic_header1, 16);
 	aes128k128d(key, chain_buffer, aes_out);
-	bitwise_xor(aes_out, mic_header2, chain_buffer);
+	crypto_xor_cpy(chain_buffer, aes_out, mic_header2, 16);
 	aes128k128d(key, chain_buffer, aes_out);
 
 	for (i = 0; i < num_blocks; i++) {
-		bitwise_xor(aes_out, &pframe[payload_index], chain_buffer);
+		crypto_xor_cpy(chain_buffer, aes_out, &pframe[payload_index], 16);
 
 		payload_index += 16;
 		aes128k128d(key, chain_buffer, aes_out);
@@ -960,7 +948,7 @@ static signed int aes_cipher(u8 *key, uint	hdrlen,
 		for (j = 0; j < payload_remainder; j++)
 			padded_buffer[j] = pframe[payload_index++];
 
-		bitwise_xor(aes_out, padded_buffer, chain_buffer);
+		crypto_xor_cpy(chain_buffer, aes_out, padded_buffer, 16);
 		aes128k128d(key, chain_buffer, aes_out);
 	}
 
@@ -977,7 +965,7 @@ static signed int aes_cipher(u8 *key, uint	hdrlen,
 				      pn_vector, i+1, frtype);
 		/*  add for CONFIG_IEEE80211W, none 11w also can use */
 		aes128k128d(key, ctr_preload, aes_out);
-		bitwise_xor(aes_out, &pframe[payload_index], chain_buffer);
+		crypto_xor_cpy(chain_buffer, aes_out, &pframe[payload_index], 16);
 		for (j = 0; j < 16; j++)
 			pframe[payload_index++] = chain_buffer[j];
 	}
@@ -995,7 +983,7 @@ static signed int aes_cipher(u8 *key, uint	hdrlen,
 			padded_buffer[j] = pframe[payload_index+j];
 
 		aes128k128d(key, ctr_preload, aes_out);
-		bitwise_xor(aes_out, padded_buffer, chain_buffer);
+		crypto_xor_cpy(chain_buffer, aes_out, padded_buffer, 16);
 		for (j = 0; j < payload_remainder; j++)
 			pframe[payload_index++] = chain_buffer[j];
 	}
@@ -1011,7 +999,7 @@ static signed int aes_cipher(u8 *key, uint	hdrlen,
 		padded_buffer[j] = pframe[j+hdrlen+8+plen];
 
 	aes128k128d(key, ctr_preload, aes_out);
-	bitwise_xor(aes_out, padded_buffer, chain_buffer);
+	crypto_xor_cpy(chain_buffer, aes_out, padded_buffer, 16);
 	for (j = 0; j < 8; j++)
 		pframe[payload_index++] = chain_buffer[j];
 
@@ -1137,7 +1125,7 @@ static signed int aes_decipher(u8 *key, uint	hdrlen,
 				      frtype); /*  add for CONFIG_IEEE80211W, none 11w also can use */
 
 		aes128k128d(key, ctr_preload, aes_out);
-		bitwise_xor(aes_out, &pframe[payload_index], chain_buffer);
+		crypto_xor_cpy(chain_buffer, aes_out, &pframe[payload_index], 16);
 
 		for (j = 0; j < 16; j++)
 			pframe[payload_index++] = chain_buffer[j];
@@ -1156,7 +1144,7 @@ static signed int aes_decipher(u8 *key, uint	hdrlen,
 			padded_buffer[j] = pframe[payload_index+j];
 
 		aes128k128d(key, ctr_preload, aes_out);
-		bitwise_xor(aes_out, padded_buffer, chain_buffer);
+		crypto_xor_cpy(chain_buffer, aes_out, padded_buffer, 16);
 		for (j = 0; j < payload_remainder; j++)
 			pframe[payload_index++] = chain_buffer[j];
 	}
@@ -1187,13 +1175,13 @@ static signed int aes_decipher(u8 *key, uint	hdrlen,
 
 	/* Calculate MIC */
 	aes128k128d(key, mic_iv, aes_out);
-	bitwise_xor(aes_out, mic_header1, chain_buffer);
+	crypto_xor_cpy(chain_buffer, aes_out, mic_header1, 16);
 	aes128k128d(key, chain_buffer, aes_out);
-	bitwise_xor(aes_out, mic_header2, chain_buffer);
+	crypto_xor_cpy(chain_buffer, aes_out, mic_header2, 16);
 	aes128k128d(key, chain_buffer, aes_out);
 
 	for (i = 0; i < num_blocks; i++) {
-		bitwise_xor(aes_out, &message[payload_index], chain_buffer);
+		crypto_xor_cpy(chain_buffer, aes_out, &message[payload_index], 16);
 
 		payload_index += 16;
 		aes128k128d(key, chain_buffer, aes_out);
@@ -1206,7 +1194,7 @@ static signed int aes_decipher(u8 *key, uint	hdrlen,
 		for (j = 0; j < payload_remainder; j++)
 			padded_buffer[j] = message[payload_index++];
 
-		bitwise_xor(aes_out, padded_buffer, chain_buffer);
+		crypto_xor_cpy(chain_buffer, aes_out, padded_buffer, 16);
 		aes128k128d(key, chain_buffer, aes_out);
 	}
 
@@ -1223,7 +1211,7 @@ static signed int aes_decipher(u8 *key, uint	hdrlen,
 				      frtype);
 		/*  add for CONFIG_IEEE80211W, none 11w also can use */
 		aes128k128d(key, ctr_preload, aes_out);
-		bitwise_xor(aes_out, &message[payload_index], chain_buffer);
+		crypto_xor_cpy(chain_buffer, aes_out, &message[payload_index], 16);
 		for (j = 0; j < 16; j++)
 			message[payload_index++] = chain_buffer[j];
 	}
@@ -1241,7 +1229,7 @@ static signed int aes_decipher(u8 *key, uint	hdrlen,
 			padded_buffer[j] = message[payload_index+j];
 
 		aes128k128d(key, ctr_preload, aes_out);
-		bitwise_xor(aes_out, padded_buffer, chain_buffer);
+		crypto_xor_cpy(chain_buffer, aes_out, padded_buffer, 16);
 		for (j = 0; j < payload_remainder; j++)
 			message[payload_index++] = chain_buffer[j];
 	}
@@ -1256,7 +1244,7 @@ static signed int aes_decipher(u8 *key, uint	hdrlen,
 		padded_buffer[j] = message[j+hdrlen+8+plen-8];
 
 	aes128k128d(key, ctr_preload, aes_out);
-	bitwise_xor(aes_out, padded_buffer, chain_buffer);
+	crypto_xor_cpy(chain_buffer, aes_out, padded_buffer, 16);
 	for (j = 0; j < 8; j++)
 		message[payload_index++] = chain_buffer[j];
 
-- 
2.50.1

