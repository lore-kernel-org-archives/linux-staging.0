Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5D11FCFFC
	for <linux-staging@lists.linux.dev>; Mon,  9 Feb 2026 23:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770681148; cv=none; b=qON9E0IM4gd0Dtx7IIcWOgicW/e9VMHnuxq6WwqLh6XME973p2rdGs9FWn9PdAPmI1oNIbLAbTJOwJosvqiyqHbId6dLTEBDT4aq/LTFcdpGyiIYo0vAYEuIK+eGGwYELFxfF7bgqSG5l9wTBSBqmrxWd7HxogDojG1y24rBrHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770681148; c=relaxed/simple;
	bh=6AR1PTp0t3xQtvOavM3d3Vj5lyoufUhRecKBjXETc4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u9cFlJr3Hjzy3A/qBs8Bh+3JA+2rApeaEoP8+NzdxA0mMdxPDlIxSE0cnAlcDYVJDjiVc99s2iJcbXkO2zJu/1u1kd69n8pJWmjhwFfVblLjyMRXUJ1IRVMGbZomn7Q4zq0X0t41uc0NKEvhMTpGVF373YpMwUERcDvfnOk6kNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZzLUBkH; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZzLUBkH"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-81e8b1bdf0cso174133b3a.3
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 15:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770681147; x=1771285947; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jDyyX1DrZiAZNPGF5erj+3gAfvstEQrpExy5Nzi+oY=;
        b=TZzLUBkHK+PiNNg5tQuW/WJat0Xa6qpnUB+ylDWs0KXEwyXK0ZH3S+yNCF86sqehv/
         eCFhVb5zirKqa7pOV4m6RZdvvZJdnFfXb0IeGxXQJoETZoQO1MsrZsOi499l31ZgV9lS
         7999+VKErju6bCGIBZtrRd/eZq3KgM2Gva09DeGSdlW2aVO3EnZUXsU6P+Q6+CC0rdrO
         8JpInYCOPCCQyFjoe+8citcoaRF3HGqptClJ3VFDWYezhJWx0j9lTMpKozxeylNrlKdn
         c2WkoxGACpn5hzRkYSc5u6lPufhzbGHSX52TaVREKgIDx0/SGtOgoYv9i8vJLLYicjCC
         yTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770681147; x=1771285947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4jDyyX1DrZiAZNPGF5erj+3gAfvstEQrpExy5Nzi+oY=;
        b=IfYkSpUwolabc3JbxyXqGSF4/TrenxryhSzkBz97uPUZYSSsyo5Sw4YiKvGvwQWNNu
         2TAm9yC8MrT1afdgdKui5YfYzK0h6ewXj6YShXWw7V9fvMlnFqTsBxP9WvtLnSj0cnil
         8XMkd+6cHuXCurgreHLryc8LZ0JMb6dpsfQYgDlBqVe91sll3IjZmt3EFJP/wJvCzNFu
         nhPI5xecdg3yHjZ/FV0zBQzzTxChfxqZQjjxhjl22Q+JYO1DNNUYxo+89hmRSB91Myl+
         qQ2QZcc139JOaOKRvsOWcAJv1UMiLFt6RzkeweY9Fb492Cw1XqEuVeLQeEKWiZJAuPp8
         o/8w==
X-Gm-Message-State: AOJu0YwhDA9lfiHDFurGSjtrUqLfMymL8hJ+A6dNPiK1Os5Q7Yw7AdX7
	RPHhk1ee2//7fqX7Y0rjf2buzrEZNhOxDuTocoNCkdcCoqEm7gSgi4g7
X-Gm-Gg: AZuq6aLngXBkAAFHtfEyJRvlvXQRzT6/W8OYwgZ1BceH38TZkQ3bbeV/EYwdLBVxqwz
	M9+6RNP+w2uHw7Cw/6gZjpAjgSz4Pp2TkIvwz5sqCoFb98Oi/HBDk9gUvEBIE+QkNNLpMEY6QFd
	JaHFnmQUSqEsZT9xIEKkBQZHtYg7iwchfQUrYPFPFELHvnwM8gZWW7AdGRMwEGZUCywhP9XBxpY
	YELBVX2Rd8NONOO9DvwJGLlqBVk6cxZVRBl6ilhcGrtAvRngJ2QXxBVlAkkIIuyH0ux82Iob3B0
	yyrUVhUtlyrWEFSUrfBIiznd7WcVwK6oUgvgaimrn4E4g5GwLlb1HCyotEDOvVN8B9+C8S8fEgF
	1Ii7MlK0p+5M09KvYgG8fvo8CT2liBSMVzo3OCTl1AftqMkHoVayLmSyVGFvGiGinEvLRmN8pyj
	B3ezXr2SJw4oUt+pGUgxC6fw==
X-Received: by 2002:a05:6a21:1509:b0:38d:f8e6:fc9c with SMTP id adf61e73a8af0-393ad3d7d65mr12624883637.69.1770681147031;
        Mon, 09 Feb 2026 15:52:27 -0800 (PST)
Received: from Horstaufmental ([159.192.34.193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb64499fsm11581843a12.31.2026.02.09.15.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 15:52:26 -0800 (PST)
From: Siwanan Bungtong <horstaufmental@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Siwanan Bungtong <horstaufmental@gmail.com>
Subject: [PATCH 6/7] staging: rtl8723bs: rtl8723b_hal_init: remove unnecessary void * casts
Date: Tue, 10 Feb 2026 06:51:32 +0700
Message-ID: <20260209235133.1292161-7-horstaufmental@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260209235133.1292161-1-horstaufmental@gmail.com>
References: <20260209235133.1292161-1-horstaufmental@gmail.com>
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
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 57c83f332e74..7955f1ff209c 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1187,12 +1187,12 @@ void Hal_InitPGData(struct adapter *padapter, u8 *PROMContent)
 		if (!pEEPROM->EepromOrEfuse) {
 			/*  Read EFUSE real map to shadow. */
 			EFUSE_ShadowMapUpdate(padapter, EFUSE_WIFI);
-			memcpy((void *)PROMContent, (void *)pEEPROM->efuse_eeprom_data, HWSET_MAX_SIZE_8723B);
+			memcpy(PROMContent, pEEPROM->efuse_eeprom_data, HWSET_MAX_SIZE_8723B);
 		}
 	} else {/* autoload fail */
 		if (!pEEPROM->EepromOrEfuse)
 			EFUSE_ShadowMapUpdate(padapter, EFUSE_WIFI);
-		memcpy((void *)PROMContent, (void *)pEEPROM->efuse_eeprom_data, HWSET_MAX_SIZE_8723B);
+		memcpy(PROMContent, pEEPROM->efuse_eeprom_data, HWSET_MAX_SIZE_8723B);
 	}
 }
 
-- 
2.52.0

