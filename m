Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AEB2E03E4
	for <linux-staging@lists.linux.dev>; Tue,  7 Jul 2026 13:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430260; cv=none; b=Ey/KXkBs9p2lee6KmFw24npLXoJhcwTfe8xSBSye0i7r3qPlSizqshQFWTA3ZDHVLFhgxaqrBE7u8wwQBUoUGvtohYNjWU5gq6om6uskvSoTxV6oMhFM7EtxEEsQ+clsMuPM1tE7/Hm2hHKVAdY1Go+4HzXmCLl07tL1dy1SUmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430260; c=relaxed/simple;
	bh=JmZtsug5WtgXf6JhdOF69IW+9iNbUv2Fp4dY8g9+V6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sFXN2cKUMQ/8RwCJuX3yL3PsVAItgUmLdcP0NSTmcsWtsYQAHtO0n/WtoY4jbhhnXimkTYyeinarAv8td+r8oRzHCmzFtEEeLhPpoty0okYOHEzwyWNTlDvYY1XLbs5XCqq8ejMXRBdbzkWq8y0Zc5WVlc5gpMQUGnzVlTKA+KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m6prf1dK; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6prf1dK"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-59d7db12342so933504e0c.0
        for <linux-staging@lists.linux.dev>; Tue, 07 Jul 2026 06:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783430258; x=1784035058; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnKl9zDr4Iq4r6JmBf9gQDMvv/B9gbWj5R0POi5eeEc=;
        b=m6prf1dKSlWq/cfJ99WYxtBT1PdL6G3MokqCFE8DABEwBueTbN8B01tGB/wGADsP5I
         33Xm3mIDR4xjZlCH+jf/WWZQOAbLk1O5XA24mgeuoODTLV9SWF+5LXnMLzcJeN9Biwl4
         HK0o9vUYSlKawToGcuF1pD/RQQvqRhzqXrWa543ScF62GRsxQ8i1nQLpJ2N68b6sevfj
         Fik7dpeuMVxxP1GULdhnN0H5GK5WmC9vzdAMZSS7odXWGNkHaqPGCC9ojwz1llQerS2h
         bhabfGZ3QjWX9YpsTr4vuPg8vGQi6cdQLyXCZBpz+bDbD6ORghy9/yFOXAgdeSt7q8Ks
         dYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783430258; x=1784035058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dnKl9zDr4Iq4r6JmBf9gQDMvv/B9gbWj5R0POi5eeEc=;
        b=ZpvSWuYkMuTIvRys7MdTbnnFeEYeNfY1rNwcfDTdK+j99OS29xV7AAY6Y392tbqXn8
         LMUE9fTgp1ey6gu/86DEDQ/CJeVlgs/167T8w+XFgOlktsxqP3neZHRTT9ywXNmGmLYx
         pmb/w35/HwKzIRPj8OCrEc1Mk48oh+tY8fV4XAqSIeLcpHCRnwQQn4ogdLcKIKeMv6vf
         kzR+dbnbsXm9uPST+tjaLFd+ZJckdiZ1sQI47h4O0lZbEK+oFR2Jsr4LrQAzwwPEV+5V
         yl4aky4BHRZTykh1s0fh1VSSOOdeLA3tlTSfDz3Nh5BklkYcJdtaccERLRtc08bEHUQS
         yHRA==
X-Forwarded-Encrypted: i=1; AHgh+RqpSrpvrZsm/xPDISxKADl98aaYKwTGqvp0DkoxafNRFDNoaR0Xn1VLGxHK58Jv9xqdlNA318S+zOVJwGF8@lists.linux.dev
X-Gm-Message-State: AOJu0YwSLqDJWIUAplrZ5Zi0XkLH/rdIvvIWMTspRWxym9cKjb2JQs5k
	ciormZmwiNwhLDp92tmaJqMWjwsiwe07olhYk3mdFAqRBxVawDNZKcTJ
X-Gm-Gg: AfdE7cnToVMyGgzxnGz8Pq/h/3EgWCIfhLi94I2QEOnyhc/bhRrpAeu5dm4ha3SUCaA
	RJE2uyDkvfHE9Ek4a9p1aUvf1J3p1zb7jAjpolGWsiA202XCs+tpxm2YzEbd5dkBcKJeXwEJNrZ
	OtWW5DXNYzaJ6c/a3Kogwdr5p7O9IoQ2bB+PHLX2M2/ZhsRiFOb0JXnxl8+7cLony4UjVawIbmc
	WqCKHxgCTv2c9mI2CfpxgUqolBxLvZ1OJRwy5dcCpzv7teu/agln205nXuAw26529YV19/ahVvW
	vaW+tp55xjbL3HAzETXvi5rwWb6JnlwATGu9PE+yOybLBMyBysmJHXqzMHr1Mar469OqAC6nrGF
	Rw50FVW1SODKxDwPB0tYf2jcexyL/HHnDbaWVCKkO2y5KS5k0o/4CLKfFsQcvOd+Qe7otPLM0XC
	BYwCQ2WhF3UyI6JriL3g==
X-Received: by 2002:a05:6122:e183:b0:5bd:a7e6:10bd with SMTP id 71dfb90a1353d-5be8953be12mr2766521e0c.0.1783430257549;
        Tue, 07 Jul 2026 06:17:37 -0700 (PDT)
Received: from adr.. ([103.216.221.83])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5be02c5d487sm7425810e0c.14.2026.07.07.06.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 06:17:37 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
Subject: [PATCH v4] staging: sm750fb: rename variables to comply with kernel style
Date: Tue,  7 Jul 2026 10:15:28 -0300
Message-ID: <20260707131529.38340-1-andrem.33333@gmail.com>
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

Signed-off-by: André Moreira <andrem.33333@gmail.com>
---
v4:
  - Drop register renames 'pvReg' to 'regs' as they were merged via another upstream patch.
  - Keep only the 'init_status' CamelCase cleanup.

drivers/staging/sm750fb/sm750.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 0324778768cbc..3a1bd38ab347a 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -39,6 +39,15 @@ enum sm750_path {
 	sm750_pnc = 3,	/* panel and crt */
 };
 
+struct init_status {
+	ushort power_mode;
+	/* below three clocks are in unit of MHZ*/
+	ushort chip_clk;
+	ushort mem_clk;
+	ushort master_clk;
+	ushort set_all_eng_off;
+	ushort reset_memory;
+};
 
 struct lynx_accel {
 	/* base virtual address of DPR registers */
-- 
2.43.0

