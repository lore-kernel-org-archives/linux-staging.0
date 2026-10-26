Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793002731;
	b=dhGWE2jg+eBYrGJhaOllziHmDOBeMZDTABc1RbJiCXkZTwpQzTAIi4iCvtj4hfTZBkh5
	 FSpWrEIxto/IEkDR1eXIZqpxftlXj56gV/gkKqvZapyEB1oeZlxZfM3tndJmrGC/itR8d
	 6kIEFTDGHQE59wWEe1uT6Qt2gL/3lrwIdSnzmW03rK3gM7N37s4aLQKH1cauCIp9wmdk0
	 o8XbPwe1KyPdEDGW+6raVNqvr7V4oXLsA9rF0xm4cC8OC3geJ5CXAO3Zo/elim90Ye4f2
	 E5RM6CqA5+98EAyFrlmNOAfWMJ63qus5PIRIIu+QiW9X54JARDj1rwlmRoNg32slHKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793002731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E6zA7UN4800aROAky49ikegUFLsqpLG7wSuvYuvN3r8=;
	b=JK9bhYguoIFIJp43I1IkCBuUpyOGfGS6fLKCfs+fknoc9TgEi2qVfhmEtijX2RbDvnwn
	 WyJnjKW4hvXjEdytiXcozgR3pe1cqm6xBMSa6CnKT7tSEKPXOnpYyu4eNNhGcZkJrNl8A
	 LjOWnlDbS9mlaTRGNppKmM+3qBVqUpvgXCPDam7gVlbqjDluZKLBkvoXHRFrCaYcn3Axi
	 /UU7lP+yVFQXT5WstmNv+4E+eXUyzfUca7DUEKQ1yfIrepTd/bu0YLfHoDjsMGHwMqL9N
	 TDtxXNbF3EaSkrLpa7aaU/Q1BDpJjc8WaVs4qHx3+NtSD+UmDVRY5BcNH81/jZS5hQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dtOIWORL;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4C9606A31A
	for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 08:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE4C9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dtOIWORL
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15ea896ddc8so4661113c88.0
        for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 01:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793002730; x=1793607530; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E6zA7UN4800aROAky49ikegUFLsqpLG7wSuvYuvN3r8=;
        b=dtOIWORLXxElCZODR+3LBIynCYlDLxHW6mjN6qrMX9wsUsYwB5USgDcifaQEwDr+Rv
         YBZ8KVigcB6iDVKzO3foync/NhtSCxr2wtGgl3q8zlGlAgjxX8+uz13e2jPXyEuAvxhM
         4q3fkfIiCAQ8twdKqf8rDwyglre/CXDd/rRpk/dT/Sfjb8cSsgjvvt0a8mHfO1uSJohB
         9w3EqDUzbxHGqrKSOR2mWArd4R1PteeoIFZDKPV0BPzp7rXiXXE9CBMa6Q+mknzeXtpG
         TCtP03LAafb6q5eMqgTlmIZG273KhN7ZnPHoswk2FP5EuDXJHueRbVhXrAzihoRLtjo0
         QP4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793002730; x=1793607530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E6zA7UN4800aROAky49ikegUFLsqpLG7wSuvYuvN3r8=;
        b=UzZLYzPAkbr3rsNEP+ndOei+3mAHYijvKog5Ny0tKGjes+N3Vdb0e1ET8prOPGqE5F
         LPzfN7FmoAs2CCAoh1fjvOMeDEZeizojD3pLQ1IvMmJapkbvy1iDcEWsAEmfeo4UeG0S
         yqtzP7S4ltVaUTNhua1FSRqaeIo9SZMLql/VsvzPSv1k+JPMBbQ90STe0iVfbRe5i7na
         ykWiJoJsMtPu3ZBw7WSHvqS4rSqkvSShQJn7kI2kXN2W/48hi+NmkqTNIk0M5YZlFw26
         6tC1PQqMaqUd2pEljzvJlDHzNxONB5MOfV6Hk1vcbfjYi1tCyVO5gYArBdGRnpYjPSca
         lqzQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6KaLu03iWZWVuC4ZjOMeVpXLMZhQ53213A70y0qNrVLBRYgVya/Wyg1pi6pHw5cNKR2OZAodHaNt/X3wh@lists.linux.dev
X-Gm-Message-State: AFq9FYIrS2cLORscy90TznOkibryBF1Yb4Kj0rYqx/9jUpnKZnmyqAA6
	0CurPqnw/wOm5qJg6qZ2Wb6HsmqNpb2T5G8LBMo2yuTxXfsQGML1+hNO
X-Gm-Gg: AYBFou12fYdwGBN0VdAvOM9PJKturwcoKtqt7lJ5GAq4SzEMNNSi6MF+VMQO1JHG8Y6
	k6TIxccbvk+th8AD47X/F17P6Sx4KFmdz3zoo5rXjP/FfWJNDfYS2SNhukiRujFoxkL/oqyJrxx
	cLQvehxEf8btVK11y8lkPrGoKkBRJWIELjpAZumNtnPVjU63g/x0PGqLAxNHb0EVDbcP30acm8F
	0XqHRzHacMZwOT/TKEWi13jS0QEB87CKsDC8pPbwWE0VYxa+OF1ZVI7OOn2t2c60++jIz1rHKPa
	SdS+JxLzF03clTOFyhcg+FyTaaq6YFLLhKdF2rr94xsAEXyhZA9FaMckBCDG0x3s8nnPd2ENvMT
	R3Kw1WtlYPp7MJPu9ZhtICqJDN+9jWUHVp90Yf6zqA5Tpc0RRqOkWh5vG4e00h3a7HpuKq4+k35
	LjDDi7wRt8xk9/g0O5yRwa8o2eUpcxoyh0M4Gzmq4rNa8MsjszufEUQhZnRPixid5abu5j5vNAE
	Cg9Qiss2KXsax7+dRduWROcbNlYf2oTIc3ynuyZrCGkpMnZ5URL4UHUGzXJM646GmlSgWXKqH4=
X-Received: by 2002:a05:7022:7e0a:b0:195:9228:50a0 with SMTP id a92af1059eb24-1993686f4a1mr10019388c88.42.1793002729532;
        Mon, 26 Oct 2026 01:18:49 -0700 (PDT)
Received: from himanshubakshi ([2401:4900:1c9b:1c1b:d646:355d:1105:8655])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec865esm21698270eec.26.2026.10.26.01.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:18:48 -0700 (PDT)
From: himanshu bakshi <himanshu.bakshi478@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dennylin0707@gmail.com,
	cenzhang@linux.microsoft.com,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Subject: [PATCH] staging: fbtft: Remove unused macro
Date: Mon, 26 Oct 2026 13:48:32 +0530
Message-ID: <20261026081832.60570-1-himanshu.bakshi478@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>

fbtft_init_dbg is not used in drivers/staging/fbtft directory and
since dev_dbg messages are good enough, fbtft_init_dbg should be
removed. After compiling the driver, there are no undefined macro
issues.

Signed-off-by: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
---
 drivers/staging/fbtft/fbtft.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index 40a7567df1eb..16459e4e0ba0 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -420,13 +420,6 @@ module_spi_driver(fbtft_driver_spi_driver);
 #define DEBUG_REQUEST_GPIOS_MATCH   BIT(30)
 #define DEBUG_VERIFY_GPIOS          BIT(31)
 
-#define fbtft_init_dbg(dev, format, arg...)                  \
-do {                                                         \
-	if (unlikely((dev)->platform_data &&                 \
-	    (((struct fbtft_platform_data *)(dev)->platform_data)->display.debug & DEBUG_DRIVER_INIT_FUNCTIONS))) \
-		dev_info(dev, format, ##arg);                \
-} while (0)
-
 #define fbtft_par_dbg(level, par, format, arg...)            \
 do {                                                         \
 	if (unlikely((par)->debug & (level)))                    \
-- 
2.56.0

