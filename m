Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782813;
	b=E8js2tDdktkRpcm/ObE1eaKdeQ2Vjdh5ATXlXD9z8+Sezh1q2VyIRWm8eBbr0fuKxVl3
	 l7Mp8tj0o6beeJ+uclutakYIyivg98CEEaUzLks4S4rSEXCEJch1aiT7JXQ9TlxBzcWlJ
	 DMOcHscSJQ+rieLaE5QOEuMANHFkCaoMp2YF8fgBuu4jLB+mieaAIXoSYBFI1Mm7cWjrn
	 k5F0Gw7QERWDxXBIuKwDi/PYMbPBDLeygyJTB6maPGGArgJhm9TfOPiwkkx4UHWRUo+L2
	 kn2sNPy3RDHZtR8M4PM+a0F3kt/bqfMsBhH5KOf3ZE9BkoNKwGJETmitn92h953tdOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hIeANPuOo+0UodL/jtwBsvki60pnCVOtzVXCd0ehd7Y=;
	b=i1U7aZMfVA7lopSugx7c4K2qdlwQfc7BgsTz2fxpx5CZT0a2CrKiD4ociVQ1rMXC3odI
	 rPlhKXRSAO6M4Ly2zvtlASOqmQwyyCPufhnDIqmvXjbCu7EucjnbvfBx+VXHBWBNFEqHp
	 FgEzecXtzb1n9RjJDL/oVdMJT5qfJJ2M5EkHrbYL8aI+QtFfHR/RNqBNw2uhm/9b1GtUL
	 J5HdOV3cvV9Fxr4ZDuKyW5EWMxyZQknq7AH0YdIsNtXX+I0pgKRPuq7xWYHsYN9CXAKN8
	 dRQuFNDFUyTsUYPMfvKlqG0EG9kmZheobOf390Txq7/yIm8fESTopNg/fLdF18JhISA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o63nI28F;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96ED8606A31C
	for <linux-staging@lists.linux.dev>; Fri, 27 Nov 2026 12:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96ED8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o63nI28F
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so3941945b3a.0
        for <linux-staging@lists.linux.dev>; Fri, 27 Nov 2026 04:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795782813; x=1796387613; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hIeANPuOo+0UodL/jtwBsvki60pnCVOtzVXCd0ehd7Y=;
        b=o63nI28Fj29AnOgUicPK84F+1FciW6wzuwxJlI70Lu9chyACYI7sJuittc2Gdr7aMD
         rnekT4LEvR+krFouC6j54LDFHjzgMjPdN0a06yKYqyTGPxlaJYG0M7Ji6cvseN3huK0D
         vQy+koICFqYf+OE+TdUaUU3LY5D6Bk6DBYh8FM5t0nD2AVSoLoZNIpIcIR3UlObA+Rmk
         AfcQ7k/7wBjAZ590vnon6WspLO1HR9Xol+zbWfgxEo8kcCliqw2GzcOzLh3k56PJD62i
         u3brQMe8aXcFZVIBs6mnBamKC3gou7zkKoziF+ugb/+fnmucwHRaylTMvjeXFfguMDvM
         irJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782813; x=1796387613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hIeANPuOo+0UodL/jtwBsvki60pnCVOtzVXCd0ehd7Y=;
        b=A1iZy0wlNjB5xgXTvv+3v45/Am1R64rknIyb5XdVuVXNjZg28pgZ0SZjDQtjicyoiE
         I+aUY3RoVhuooOw8WhwX5gkMupQe8+N5tgr1F+i1njy90XLUz4ldx1o/+zLSkeOiTFF5
         U0z9PI6Tx/ou/CInPo9aQhJ9D2nEQe3xg/buc9cgGYv67LLRrdzwbtfRHZ//EaYTQCKX
         4gPReaAujBbELjO5F+TdhU7flSAjo+2P+Agde+s0yJWVfhTITwNBIaiUAVgj2VIAGpuL
         rfB3ztB02z2hWmKpsmXuXOgtRY4KVSQ1oh52hpPkjJcZm+5RdNG2dxsmA6/pc8UIv9Bc
         YKKQ==
X-Forwarded-Encrypted: i=1; AL+hErE85rUJp5yN54Apsyrwmu0OP4o3E11hveOWNB2CfI4mMo3MmHSGUeVAfvcOi4+YX6jjJUAKa6pawkrfcXtZ@lists.linux.dev
X-Gm-Message-State: APuU4Z/8MlePYPFTvpMxp9QawMp6/FvMBZYRRNFh8EXBanxnKbDE4hHZ
	gfQTAuwODPCAfi3zGkIr72TzoXh+Ios2tltSzmVzymoj2entPV9gipKz
X-Gm-Gg: AZFdTZfIiD3VHjwkVnQ2N/AeWmjkwT0HN8vxUrpR6tIOeBTOZJ275DMHqd6WQhg8/sx
	aM3MEDqyqqbha4ukQLr/wFQMb2jL/X5KBqlKqnGZ//Vt1m3qHJg6vHVnqvMY9xjIpLXKRQw2tTD
	t36Ypgufm8je0zCcC5jllkPAJFzg5capeQh+/4DArRGqZo338aM9QZ6WFT+NHwc9VDHBwOnzNTX
	zaCCB6dXzyEi0O8EEiMOaxOB821pf5pnoricisHgBUGx60yDFbNcq5gVd0Soza1jZL6aTqph3TA
	1Cp7moE4Iw+CI5s/4F6qEa8a+TPwPa530hDY6Xh5y1U9kqF1i0YKphSwfKzM9WsZI66Y8DmEUs2
	jw/VqSXRmNdMr0IyTTAWxn9UFIsgV/oV8/Q1JiJpGGxDLmoEIDtsF9yTYM2uuTQARtQvg88bT+f
	mrTjMPkwSXM52Fx4N4XGygzVQ9+4turL1uMfcDWPqKRidUqlHtnWaYjgWQ+agjLwztjuDPJY0LF
	XyP0Vpd8VcmWlMZMEw6bUmcdsbfgfh9m7OAwPd0EWo9XRd2b4bhwQY6X4CYdDjLE+qwIGMqfLfK
	69Y3Fbw5Qm4ImHH+Lbe841mrStWbUguDVwR/7QCUx/GCcXqwkAbmc8Uci5cWevGWnu9E6Vk=
X-Received: by 2002:a05:6a20:6a0c:b0:3f8:d7eb:1ab9 with SMTP id adf61e73a8af0-4014ca4512fmr27148069637.15.1795782813040;
        Fri, 27 Nov 2026 04:33:33 -0800 (PST)
Received: from localhost ([2401:4900:1c2a:12da:3176:e694:92eb:c932])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm12568899b3a.2.2026.11.27.04.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:33:32 -0800 (PST)
From: Punnay Sharma <punnaysharma805@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux@analog.com,
	Punnay Sharma <punnaysharma805@gmail.com>
Subject: [PATCH 3/4] staging: iio: impedance-analyzer: ad5933: fix settling cycles readback
Date: Fri, 27 Nov 2026 18:03:02 +0530
Message-ID: <20261127123303.144052-4-punnaysharma805@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127123303.144052-1-punnaysharma805@gmail.com>
References: <20261127123303.144052-1-punnaysharma805@gmail.com>
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

Writing 1023 to out_altvoltage0_settling_cycles reads back 1023, but
the chip uses 1020. The cycle count in the register is 9 bits, so the
driver programs 255 with the x4 multiplier. Odd values from 513 to
1021 read back 1 too high. Values from 1023 to 2044 that are not a
multiple of 4 read back up to 3 too high.

ad5933_store() saves the value in st->settling_cycles before it
divides it by 2 or 4 for the register. ad5933_show() then returns the
saved value, not the count the chip uses. The ABI says the attribute
is the number of cycles before the ADC starts a conversion.

Save the value rounded down to a multiple of 2 or 4, which is the
count the chip uses.

Fixes: f94aa354d676 ("iio: impedance-analyzer: New driver for AD5933/4 Impedance Converter, Network Analyzer")
Signed-off-by: Punnay Sharma <punnaysharma805@gmail.com>
---

Notes:
    Tested in a virtme-ng VM with i2c-stub. I have no AD5933 hardware, so
    this checks the register value with i2cget but not the real settling
    time.
    
    Before: 1023 reads back 1023, but 0x8A/0x8B hold 0x06FF, which is
    255 x 4 = 1020. A write of 513 reads back 513, but the chip uses 512.
    
    After: 1023 reads back 1020, and 513 reads back 512. 1022 and 2044 read
    back the same as before.

 drivers/staging/iio/impedance-analyzer/ad5933.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
index da07a75ad3a9..bb72d9c55f6d 100644
--- a/drivers/staging/iio/impedance-analyzer/ad5933.c
+++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
@@ -414,13 +414,17 @@ static ssize_t ad5933_store(struct device *dev,
 		break;
 	case AD5933_OUT_SETTLING_CYCLES:
 		val = clamp(val, (u16)0, (u16)0x7FC);
-		st->settling_cycles = val;
 
 		/* 2x, 4x handling, see datasheet */
-		if (val > 1022)
+		if (val > 1022) {
+			st->settling_cycles = round_down(val, 4);
 			val = (val >> 2) | (3 << 9);
-		else if (val > 511)
+		} else if (val > 511) {
+			st->settling_cycles = round_down(val, 2);
 			val = (val >> 1) | BIT(9);
+		} else {
+			st->settling_cycles = val;
+		}
 
 		dat = cpu_to_be16(val);
 		ret = ad5933_i2c_write(st->client,
-- 
2.56.0

