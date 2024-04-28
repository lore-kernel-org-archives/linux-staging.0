Received: from out203-205-221-240.mail.qq.com (out203-205-221-240.mail.qq.com [203.205.221.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FD453E14
	for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 12:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714306783; cv=none; b=ZmE6mPROAusB59rzhnlrYHI4ALJ/OmANMIJ+NFTePuy0vOk8QxL4tzAQPQGfM+Znks0T+VzLn1Zo9a/FGh6tAYjxkxDUwIw9bNF7Lwld6y+Hu5+8NjX2URsE0KtE9KpKBQdNGxaA6ZGng8dtRD2EMcA4M24iNoBAyQyCXhZI4Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714306783; c=relaxed/simple;
	bh=TmOhP4qc8Qi8jh/T/QcsP5k7J4MiQIZY8f+q7/ewjis=;
	h=Message-ID:From:To:Subject:Date:MIME-Version; b=q4rRv7e9k4HCpmEzWrP+6ztixP/lhqJ01HXYGq2q/8ptVvigamxd5OH9/u0MFeVbQe1ukcHbkEf+xuxn9nfahCMySdOT6xl3NEByBeNMMhgg7mT4JmG4xldy5kNAAY/7Yk1+29JJxtdsY+jr4pVmaqs9Q+IED4tUsv1HileQ2RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=rwrW4mzo; arc=none smtp.client-ip=203.205.221.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="rwrW4mzo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1714306763; bh=WhRK7c5VI5zG7dpXv/k2M42hjr8IyRYvYtQoYcJ0eOU=;
	h=From:To:Subject:Date;
	b=rwrW4mzotcqbFh9j9SnVYuky3lY9KwkFH+bX28FFZRy8OGn3lCP7QTQc9VgmnfFji
	 NJPeiLT8k3vJ4/wPK+ef4umV8X9CSx31KoDVOaQGXWybTN2VOGWnPFe4wJiwsSw4Xc
	 IISmAkkZjuTYSY+j0efJd0umCPeCoP8m5gGJ4xI4=
Received: from pipishuo-OMEN-by-HP-Laptop-16-b0xxx.. ([123.115.148.131])
	by newxmesmtplogicsvrszb9-0.qq.com (NewEsmtp) with SMTP
	id 4C8B4CD2; Sun, 28 Apr 2024 20:19:08 +0800
X-QQ-mid: xmsmtpt1714306748t5cry6yph
Message-ID: <tencent_FDF9E162435F21368C39AB61255D2F2C8D08@qq.com>
X-QQ-XMAILINFO: MR/iVh5QLeiesT/qxp6yj39CByasNjpnL5Z9mIbo5D+NZ9po4qliBl7DIFt78D
	 ITDjU605nzcmebLng8uzqyv7GojIslOw3SROUovLp80U7NtYgHQnx+0tG0sDkC4/pM60JQYKoO7t
	 Sc+vbmlLFOlv7X0tMWf3+tqikoA56BEh+DMM5Dk1GSPcU9TD+GBbEd1roUWxE4AFFwgCR0iDXn8Z
	 LaXMgDB6PqBeaz1v8uoeiG1eh5QLGos1LwTtyWf36ATlikbNTZIsVpx7vIVHcWrbXfismzSPwC0G
	 +XCifmb0TFFO07iC2Lx9MyQjno6okveCNNfKqna0LEGzNp0oQ/GGvZiPpXQJAe/+dVs1Yz1zXVjl
	 w0hKCqlP5nWcES09G7l18v93GFj85xB2QdzDiwhUc3cFs9gu1+w/yvaCVE8t0a9RHi/xmps0szop
	 LN/43paZ/CXvrvxBV/VHobonLF1cePaUBzMk/ECZl5iPF+/d+0G1Uc7Yn77KUminZ091tYdvjEwt
	 2fCPcK2cmxfhPXR2/zB3zArhQNnd2XtBJ50S5fP2MRvQhocC1n80yo0trCqnUgF/g20xmoWdrks6
	 HLJYE0cjSdT+iEVS5YfFs6YPJoSYS6z5+AwZiaowHzc8U+3hXN8PYsYmWDFHERA20ph5hrKc/7Xv
	 agjPWoZ6Z0jq/Nx0+EIFGTfUTkDocBNNuu8r7BXAixw9JmosQKKI1fYOsQftT+Tt5XanuVvw5msF
	 URs7/MTpd7ccZ2Uy604K2VaoBx+w5YCUFzLDETlEkR1HCL+m/vWpCYMHimitSueAmWxL7U9vb2vK
	 7BcryxX+D7XLOL7LVFFenBBKXXwDsCsRM6P/KOpR5gboNr2z4SvJDjgWI7Nloi3g6FyoyXc8VMtm
	 jyq6qdeBlI8XArgDPCYq2PNXnDyuvB/V6QO0x5sEBxGdi+Lp7lU4lkbfms6e3HijM4uAUcb8aGAw
	 us/kan5KW3wwyvPVYAEtBKLnJcWR/OY9UMG+5SYU7lU2/8AWvgsEg/VKHtMaSdtOJBEQWZSmrVXA
	 YzeRrEoJ9G5TB+eSHCM9xEtP82Ca6j4UXkIpg0/Q==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
From: pipishuo <1289151713@qq.com>
To: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	1289151713@qq.com
Subject: [PATCH] staging: fbtft:fixes unnecessary parentheses
Date: Sun, 28 Apr 2024 20:19:08 +0800
X-OQ-MSGID: <20240428121908.16060-1-1289151713@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the checks reported by checkpatch.pl
for unnecessary parentheses

Signed-off-by: pipishuo <1289151713@qq.com>
---
 drivers/staging/fbtft/fb_ili9320.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_ili9320.c b/drivers/staging/fbtft/fb_ili9320.c
index 0be7c2d51548..045275a9bc0b 100644
--- a/drivers/staging/fbtft/fb_ili9320.c
+++ b/drivers/staging/fbtft/fb_ili9320.c
@@ -37,7 +37,8 @@ static int init_display(struct fbtft_par *par)
 	devcode = read_devicecode(par);
 	fbtft_par_dbg(DEBUG_INIT_DISPLAY, par, "Device code: 0x%04X\n",
 		      devcode);
-	if ((devcode != 0x0000) && (devcode != 0x9320))
+	if (devcode != 0x0000 &&
+	    devcode != 0x9320)
 		dev_warn(par->info->device,
 			 "Unrecognized Device code: 0x%04X (expected 0x9320)\n",
 			devcode);
-- 
2.34.1

