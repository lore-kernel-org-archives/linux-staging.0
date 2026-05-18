Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053D8381B14
	for <linux-staging@lists.linux.dev>; Mon, 18 May 2026 18:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779127618; cv=none; b=AZRy1LvRP6UzSkF1xrXHihE1B7RVUttd4w0KVv5CrYF+NVuB2KSk+0SFX00/924pt/zFfh5djfhAjFl8SE31EYVmPQHc0d4nCHyIDbSzVhN9x4osz6sHa0/6AB4tPT57PQ7cKtCcSCgMiHmUDL+BvFkfrMv/R/h1A/sw4i19Mkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779127618; c=relaxed/simple;
	bh=mGJvorvAwO+6VglE6sqHdZ6CqovsX9RsxwGok/eFMTY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eMvWytz2UGzqCiIA7r2J7XjqfgFPjrUhcJzmW1DIZL3kLeuGOtEkMQO2wuSOza/psJSrH+bb19ptRH2I3q2aFPuRBmgTT6gsxWCSZHKMxWmuGqsqj4z9rMG4L2eM4P2ZY22ICMQ+HBt3TL51x2v/qvonOrF06gWb+ulsGejsuTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXDriwYG; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXDriwYG"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c70c112cb61so2145061a12.0
        for <linux-staging@lists.linux.dev>; Mon, 18 May 2026 11:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779127616; x=1779732416; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qWr0OnE/m3IiE11lZakxiKvtGBuVjjAJONpV2vK4Gqk=;
        b=YXDriwYGLSn5oBMisEupggd2FA5RyyV42gw2d2UTMnQYlNxozer1hYH26V3WMbbh7v
         bEqk7xU3PH46DyFDfA/aYtevZoyjjWgmQdNiDM7Qm3hs5YI5Uo647nuMaiYeLshrAiky
         9wzSVJcreziCqCfGDhUHWDYDS8weKGlKUG6sHAA5WHqAOnQ+LQkYurYJ5WGfS2tBj02y
         cbiFz9xJta5mVACafIU/knbsFcRNjAxJ6WCOjDBOERm8BK7el2jwccEbQpOXZ5mtqXtg
         fwiN1B97bI5X65ENCCNrig18MJsM19hh2YYPnFiu5wt5AZnh5V4Op537hWbhyQ+RdXks
         jc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779127616; x=1779732416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qWr0OnE/m3IiE11lZakxiKvtGBuVjjAJONpV2vK4Gqk=;
        b=oU0cEX9h/cXOBjFz96CwyPuqrjqZrbinPG+ubP98WQQ1inY1ERsOBB64AkzOWMUkNU
         +cN54vdSVFWhVpRguIY8ks0gMmVBvmO8bDGe6x+kPvIdSAygST8gFFxH4N4WgY/jfZPV
         P98AV/mhklfYMnnEoCZBFUx2LXslg5ArjxHuzm/LXn/ly6fSA5Q8qaTP9JeHqmeTl2AN
         O2xSnEN8DIdAlFEqo7H2w2rQoWPxl+dxRovEvnP91YWM85uQTcyczii6gBgSNJDJZCoC
         dPTVnAFA+JuLlT0tLF3FLTybsyaJRbU3hrtsPV27geVr4grVpbIa3C1QCBv14UuyxK5I
         w32A==
X-Gm-Message-State: AOJu0YzcEhsRNJpG6FG3k2WnYAmkQgUYsc6udiNFUxjd9YQx3zynxcBU
	NMwfRUpp4WrOC26yTM98/BzEr8T4uA28CIzcXB5FD/MD91e0ihDpBlzmI4ZwYUzx
X-Gm-Gg: Acq92OGud1olxQ2tVQDOg4i4PiTwk3izL1OXM6toFywAkikt/+VZF64ox8VpjUpzPO5
	gk2ZUt19xlXLb1mBHGIhKxIpurse5OXtu2Eh06eTivkHlZt5Wvcb292cwgsuk4zi+EQU6pwXOZX
	E22MuX1oyFuTMZxpwY99tvqexa7puydNMYOPoS+JwSg+eOOfUC/kVRU+uxkAGo0c3Rdat9qpT/I
	ZTzYs31pGlL6J5Q0hyCOvv1KgZ7Ye9Thv1SNbHxuU3gbB7GoLVV3zJKdnz+xW+suloVg/fn7c5p
	9IyVXMlvr1Z9iMGx1H3DbTToW9z86OHQ9Rl8i5gp1tSylhvD0LLuXDofeHIZkdl/Dpx7+aY/S4z
	B0XV4ds0Ph2kSuurR2/52wJi0EA7STNX3oKc54b+SbfB5yBFg1nd3Qf0tRtl2m2F2nLRLpBojE4
	Ush97zaCxWIN1EQipF3kkIom4Tb63Ttlrww4Nki7dytAobV5Gq2UJnBXKlwdSmSUtiC5Bpbbdt1
	EIMwrtgLumMZwv/
X-Received: by 2002:a05:6a20:6a13:b0:398:77ae:8d8b with SMTP id adf61e73a8af0-3b22e687d5emr17997803637.10.1779127616360;
        Mon, 18 May 2026 11:06:56 -0700 (PDT)
Received: from localhost.localdomain ([2407:4840:a002:5ef4:41ce:f2b7:a7ca:2637])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb0ff0edsm14642773a12.20.2026.05.18.11.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 11:06:55 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org,
	mokshpanicker.7@gmail.com
Subject: [PATCH v5 2/3] staging: rtl8723bs: add braces to else clause in rtw_efuse.c
Date: Mon, 18 May 2026 18:06:40 +0000
Message-Id: <20260518180641.44421-3-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518180641.44421-1-mokshpanicker.7@gmail.com>
References: <20260518180641.44421-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing braces to the else clause to satisfy the coding style
requirement that both arms of an if/else statement use braces.

Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index afece04c09cd..ab7486020b3f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -73,7 +73,7 @@ u8 rtw_efuse_read_1_byte(struct adapter *Adapter, u16 Address)
 				break;
 		}
 		return rtw_read8(Adapter, EFUSE_CTRL);
-	} else
+	} else {
 		return 0xFF;
 	}
 } /* rtw_efuse_read_1_byte */
-- 
2.34.1

