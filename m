Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A48306D3F
	for <linux-staging@lists.linux.dev>; Tue,  7 Jul 2026 20:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783455483; cv=none; b=FdcAdeRFkcarz4uiYEATDz104Ye0OtsqPVWNdqLrRSbcNBmZGIpyihI/AcLVyBNp9QUm9j9qWOIoQ1RyOeAaXkv8LY73hfzRu2dL7BoD4F8o4pKLB4Pf98LOuVfG6zEDyJGlM5ymHRUuwfzo6rwJxwarfGkxRbGUyzFcw45Iwwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783455483; c=relaxed/simple;
	bh=LT84Mt9Usfp2EKOVxpbMacj1qP8vDd8wrB3bl7sGTqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hSxVlDDO0mPjli5DjkAK6uV6IoqTtNarR543FOfmQJq5WmNf4A4CqIVxaYNmpFvIqQD0hxc2/KJZETEAwMWOP5dNwJs56cxXCWKf/1W2pF2XH9bXt+ZKO0xhDwr6FXmGb7gKeGsTdh3WMOC9biVhSNpSzn8S8Ocdh2PuGfMrkdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r6gk4TjX; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r6gk4TjX"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-13b5fae0710so27005c88.0
        for <linux-staging@lists.linux.dev>; Tue, 07 Jul 2026 13:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783455481; x=1784060281; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9aWTekv18Vz7q14Rh1vzCFo3WAspKNMWkB+3v3BTdxo=;
        b=r6gk4TjX8A6iP864fafWmtQdSI3Cp7+ePduYumQcPCIgJtiJr0393CMXUrb3dn49rC
         Uq+xyG/bBTb1suMtbCafQgf48r85LKYBsV2cTWMy1EPf0E5+GfKgGCs9wURY8zf/Q/Gj
         fC2L5ZpEgepqBiQBmbEgOxxXRBWOf6srBdF6fsb5YxsWcA0/vZWpCmQADRF/tfsYnNuM
         KRgmi+3sce9adUfs3oaJtx0XM8wC9UtCXKkr2EkrbzWnIG71J8exFCQxRSD5lz5nOfWl
         Wc5bpiaBl5htssDagFZ/ZWwTHYksVqnasvd1KrRL79TUdmpcvX1DXALnoBVVWjgDeJFf
         zRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783455481; x=1784060281;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9aWTekv18Vz7q14Rh1vzCFo3WAspKNMWkB+3v3BTdxo=;
        b=GWCXmQYIAQOQ2Z4LuIO0uE6XBnjhQerXABiwGsS4LcsW/sQrVNi+WdfxXZICMmY8+W
         3cxVTa9ed5/EvaGJpKGvCDI7UeyCRURE1OHIbz+HP5EdOyVMDWF8rRfiJXx2p4aSjefB
         sVaMuwdqjmMaF5kdJNsIBMjzlqVls0+IC30kYXHVl1fvTDzGS0vrAADA3GifuOc8jzWq
         I1eSIBKGjkNWu96En/dkkanzK9WyCkXh+WWVZ2mSEFDhdn7jZ/YbJznNQPSz5yD4/Jqv
         DNSMefysmL0mtqeJEvZMK7qy+j3mYDyVuxXr2Bx3fdVJXBEjhEu0qZ4hB6BXJJNsmFDp
         KVcg==
X-Forwarded-Encrypted: i=1; AHgh+Rq1ep18BySpO77doqKrDNW1JRwG6xHQi+Actp5peI9ELY9AM5xJ6DdADyunz+Rliz2blMWNKR3nnQpBhCYP@lists.linux.dev
X-Gm-Message-State: AOJu0Ywt/3v8b3ujBNwK36YNUHPCOHd5y4N88XEicDM+JnEyC06tOF8j
	0BBEIFvVIsTNq5H/0v/Tp25d8Oul1zyTWh4EnuFSj7oLOB/WdshqrIVkCit1ugqg3NGreR7M
X-Gm-Gg: AfdE7cmHnxL/EBw713fUQbSg3kcrYpJOVXgpJHlvIj1aqXOe2NNeeQHsUHwv1M0cTk7
	munUdlB6Sph4O61x2FA7NaX7LXAAH11yEEwdPy+xHxF+vh4bL9uZVORzIaHNXaPe0bZzHA/9294
	mJ2QrbMpzsOVN0GECmFYqi6gYNwOMtjsZ6d8uWSNDRLaYrTm72TY8zAfE8efYkg2sxaGxwOyLvK
	OKPudr+KTw5g0gdso4cNgQNARijq2VdWrmuTZD4mNtcGuEANK6KaWAGgJtt7fUe/YO3xb3r5S88
	/mG5im3UhatG8iZyLP8Gj9qnvhMAsnlqWx7wBbIrtvGQTdjmInI/ZBLZHp+O8biIPJ7tv5pRKQy
	nVYe02qlskE37CpRrNFX7J6STox7coGWLShag//PRRvYNI7FGLvK6skj+Q4J3aD41hFeJCO54eS
	Hgk+FBQAmIgnxILflS+A==
X-Received: by 2002:a05:7022:f10d:b0:136:959a:abf2 with SMTP id a92af1059eb24-13b625e0929mr57728c88.2.1783455481318;
        Tue, 07 Jul 2026 13:18:01 -0700 (PDT)
Received: from adr.. ([103.216.221.83])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b65960d88sm9835785c88.6.2026.07.07.13.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 13:18:01 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
Subject: [PATCH v5] staging: sm750fb: rename variables to comply with kernel style
Date: Tue,  7 Jul 2026 17:15:41 -0300
Message-ID: <20260707201541.12459-1-andrem.33333@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026070710-exact-unveiling-e321@gregkh>
References: <2026070710-exact-unveiling-e321@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rename 'setAllEngOff' to 'set_all_eng_off' within the 'init_status'
struct to avoid CamelCase and comply with the Linux kernel coding style.
Also update its usage within sm750.c to prevent compilation errors.

Signed-off-by: André Moreira <andrem.33333@gmail.com>
---
v5:
  - Fix broken diff from v4 that was accidentally recreating the entire struct.
  - Update the variable usage inside drivers/staging/sm750fb/sm750.c to
    prevent compilation errors.

v4:
  - Drop register renames 'pvReg' to 'regs' as they were merged via another upstream patch.
  - Keep only the 'init_status' CamelCase cleanup.

v3:
  - Added changelog history to satisfy the bot.

v2:
  - Renamed 'pv_reg' to 'regs' to completely remove Hungarian notation, based on Greg KH's feedback.

 drivers/staging/sm750fb/sm750.c | 2 +-
 drivers/staging/sm750fb/sm750.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 89c811e0806c4..00c293430a7d5 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -848,7 +848,7 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 	sm750_dev->init_parm.mem_clk = 0;
 	sm750_dev->init_parm.master_clk = 0;
 	sm750_dev->init_parm.power_mode = 0;
-	sm750_dev->init_parm.setAllEngOff = 0;
+	sm750_dev->init_parm.set_all_eng_off = 0;
 	sm750_dev->init_parm.reset_memory = 1;
 
 	/* defaultly turn g_hwcursor on for both view */
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index d2c522e67f26a..589ae51444f81 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -44,7 +44,7 @@ struct init_status {
 	ushort chip_clk;
 	ushort mem_clk;
 	ushort master_clk;
-	ushort setAllEngOff;
+	ushort set_all_eng_off;
 	ushort reset_memory;
 };
 
-- 
2.43.0

