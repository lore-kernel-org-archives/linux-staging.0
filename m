Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81ACE35CB9C
	for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 06:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787811986; cv=none; b=j9Jnckp8MCXEjqL8VB8dglkGAY5W7VWWsUAhotkvsXAfjIj57t9Mc6sE8UKqdHJGZmfPOUF42khWU7uQcc6m39pv9atP7//kiDyccArvY1o9UoKvHS3ct37MhAW4DkwrQxTaTlL0k2dzp2JsXIl1+ISLa53Gz+co2W8O0rtyPoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787811986; c=relaxed/simple;
	bh=jEstMRNig94iOnFnqSUINlg8AZr6PTalxNt8T4deVsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cbr3dokEbgNNlqucjD2L5LSRzPy/e0itjk+EVszmS49ztej7AZnAlQpnmzHZAq1ZbDABmWltrTVyg5yeG5dn4IHxQbfAX55Wlel2E+UOVyjaaQDuzh6Szh6P5Lt0c2Ugb9Qybwt8k8xiWyC2gP9DI9FUz09LqBiCCk1xJekKwmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXamm5sO; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXamm5sO"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-482f413a232so68273f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 26 Aug 2026 23:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787811984; x=1788416784; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E49tYna2k9EalO9qZ5zTtyDSoIWGyMcB3eAoM0LyPd4=;
        b=HXamm5sOaVmewZPH23rZAR5VMwzK3xYTB9ZUmJK7r9vfnDKB6vGQT2tZiFshzHZdEv
         vvEy9d5jR9AnU3fU/gTNs4Rj46v+xpDsqDzdbwuWTST0vMQ2a4aASVWwrSxklzAUSI6T
         bTgggHKA/6i54PTtvCm5MEBrFjIsCDmQ1Rb7w+fzvi6e9Ee9mV2c1kcmSbTqE+3g0hKb
         nuhJK049mHUviP3CWQFoAOYOeBCAbsuyHBHi7GLX33XN0ofCi4bqs8+jsWfv1NSbt1pt
         elRW1Ev4kYD49epiMbrZqHiVCsZzSLvozm0Ni9RLtja+ZnlcwOBgycwXyvXWoDqWpI64
         lrMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787811984; x=1788416784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E49tYna2k9EalO9qZ5zTtyDSoIWGyMcB3eAoM0LyPd4=;
        b=NNE5VXZ0JQheTdjatxCUZvtWKDLcN96izXxvZzHyKAljiL6YOfin53QOnP8MvUxLfR
         5+4Q9POjvKj/KATBoeAlxDYSNPogg0XgDM0UTjt02WuuCgqHYlaXPDQyHDs5jBXlrI1h
         J6HQQde7FlKLDQCbK/B9lpCZLtxof1Jor+emcUYenCLpGBiB9ZidOTVvFlad6hcmXwI/
         oZGzZS2Xtfl8or5vktgZd+mBDscZd9T8gkBWa++72m/NxAqUEnKs6RHSqneCjby1M7xo
         yYf9l2JP+57YP9vaIyZmeKgoHu7IM23v/7AstteXhJsnTsgACGsZ/mUAoP1ybLPKs+Ix
         9xww==
X-Gm-Message-State: AFuF++kzNageOebfnEXZ/bDTsatNGxGqT1N33NpzAe3gagPj/PIjE8yj
	TbnNLgWQsVI2lMYYLMeOF5AiiTDZ08kc1Vl2pnLhA89H3Ti6yWjUc4dpg69XbhdhHNg=
X-Gm-Gg: AR+sD13Wjn4QX+mG8Op4bZLX2QgGehJ+jilYkeJqUQbXtoovMkdFqTJR2Tr2hTaFCqo
	t8ur5jAA315W+UZGMIFo/myed1qZSMkCmmJU+GgOF554By1BR2jLBKPh9xmH4qpeRIeSHY1ZPSr
	2jW1nxxCFrOQYWgYFgDKKGWMqmXnxWTP2ToAC3ntvCD5AHjp/npPc6o1VvUj2zfxpGo6Rj7WY35
	x+2BDBn6INemSBsJv16z6+r73/SyJuX/MD8henQ9wIYLaElCiaYVmQRYXCC7y3vdblD1GoJ8VVW
	N0zAzXHdgwb19+Q9iTWzI6nHVPFn2AcYoEDOKQKUFd7GHYe9xXAngpb9DFxEVuvtHim3GkkqubY
	4RqEgb9XRU2J3Lw+uLFmUpXWA2l2pp1O2cSD/KT8Fi7orNt71Mk59FJ1Efvz5BLdIwjzp5tu6o1
	PikWsUjuYHRZhzQNyga9x0vc46uGjJGm7OO0sW7smO3DsLdrcdssRWsxtoFHCE0qi3TCUseVCuu
	fPuSXY3oPp0uoxdhyu1tRc8jkdYapgmOcbCC4sR9Qs=
X-Received: by 2002:a05:600c:3b0c:b0:499:b01e:911c with SMTP id 5b1f17b1804b1-499dc6ea9f4mr136989275e9.2.1787811983342;
        Wed, 26 Aug 2026 23:26:23 -0700 (PDT)
Received: from DESKTOP-EHH7ATM.localdomain ([102.203.209.200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4d08d86dsm24536605e9.12.2026.08.26.23.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 23:26:22 -0700 (PDT)
From: Godana Emiru <godanaemiru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Godana Emiru <godanaemiru@gmail.com>
Subject: [PATCH 2/3] staging: rtl8723bs: split chained assignments in _rtw_open_pktfile()
Date: Thu, 27 Aug 2026 09:21:36 +0300
Message-ID: <20260827062137.12937-2-godanaemiru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827062137.12937-1-godanaemiru@gmail.com>
References: <20260827062137.12937-1-godanaemiru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split the two chained assignments into separate statements, one
variable per line, preserving the original assignment order.

No functional change.

Signed-off-by: Godana Emiru <godanaemiru@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 7a9d2fabc..c5f90a906 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -14,8 +14,10 @@ uint rtw_remainder_len(struct pkt_file *pfile)
 void _rtw_open_pktfile(struct sk_buff *pktptr, struct pkt_file *pfile)
 {
 	pfile->pkt = pktptr;
-	pfile->cur_addr = pfile->buf_start = pktptr->data;
-	pfile->pkt_len = pfile->buf_len = pktptr->len;
+	pfile->buf_start = pktptr->data;
+	pfile->cur_addr = pfile->buf_start;
+	pfile->buf_len = pktptr->len;
+	pfile->pkt_len = pfile->buf_len;
 
 	pfile->cur_buffer = pfile->buf_start;
 }
-- 
2.53.0

