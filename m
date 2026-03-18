Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28D9340A59
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 17:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773853580; cv=none; b=TGjFBLKXodCN1YG4ZsV4Jp4ju7CTCNIVSEnRlZHhu49cgYnq7RIRRsFviDcVZQBegWfGpLj71wPORLxqXPUf2GM+HxS+dlSSR2ldcsrbvY0kwELfprWv4yoD40z0DAXQVjlUMBPliHU/IWuj5EpxkCeRpnQdMHu0kjgvt3mPbZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773853580; c=relaxed/simple;
	bh=hGxHQ4wepycODTgWMNLguLRHOgeThULgmpSZbykI5KM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XSOCYF4HDPT6/BGzfx+KIMsBd9YDS/CzeP+tmh4ajssy7m1hxyOh+ACFtHziOzeE8c/YLvX12z6bTSBsACc8FXL+rkgCPwONKy++5dkAMjzELJ7uVCiiCkpsM+AcptS4oRZHcWc59umLSPBGKZ0aEt2ny0iNTnH9coGsaTvSuEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CwEi/qya; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwEi/qya"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486b96760easo701235e9.2
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 10:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773853577; x=1774458377; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8RMIRhTiuMF31oaJqo4/x9sgi11wfPHkl7OaY7LxSUE=;
        b=CwEi/qyak85ss6mcKI9qSBetucwfSPXL6Tz8BodQrd/ff9WzT8PNw4d/oQtwVoyVPO
         PAt0B7PuSXeTWjT4OiFG8H5HyJlxHyDVWBrKQLdg/udC9KGbhFEoy5VmPCbx/0pWprou
         t2oOzfGzOXSr7HpG+71f0YV/pYKwTi+0aumXCgiBQ58pbfF1DDKYSRGgXisINhkgMsjI
         p+kNKCZ8FB7VS1TLDQLaGqKJVkGpNwjUbI2I6pnzbHi2wp+kIvsZGMgwNJPNnSPPJqiU
         BQw3Dd0eZJchjPzvcvCDvlfdAbfRQzCVdi7QGYD0OLNz68UkRlxuMm7nOf+vLcK3T0bf
         IVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773853577; x=1774458377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RMIRhTiuMF31oaJqo4/x9sgi11wfPHkl7OaY7LxSUE=;
        b=CotJ0uGeJ00MUI9IQNxzQU/AhMffxo7YO3EIju41iDyik8V0FjaOkdNov1mIMiVsRr
         t99qJRrFAShfITLJY7sMBtB7r9J11Mg6B58eu8332CMrGdMASICS3kRPTxAez10wVTn5
         FRddtXjARQEtiliXJ/FaMvaCkSNylCjWOXcCsABODFvRNarBZtir16yc0XKi0e3hmld1
         b+DVGntF1NbokGn0bgbjQGzzp2bPGF3gaGg6hZQXiWjkDKCYN45GkXZYQy2agjrrAWDA
         4AeX25lSKID2jn+qgERJvbJf3nVB7bxECcBjcoIJhCeqXoIiC7OoFvvMn0/hpBAr0ZWA
         7c7w==
X-Forwarded-Encrypted: i=1; AJvYcCUUo4i1uwH7uAN2hP8t5yY6eZ+AFF98Y/RxH6p075erPd11JosD86qIrxCC+GTlFF/8SSTz3bRX18l+C13i@lists.linux.dev
X-Gm-Message-State: AOJu0Yytyscc9fkafNVfRsiZiOXI0PwYkfRn3mnPgA1Bk3rdNgDRQhwT
	Q6/vJQPoiVrxzIXAMS2GJ73yTQ9rqYCgdpJznfQ0dskZVCnO27hlwdmQ7XlFKUoJnPo=
X-Gm-Gg: ATEYQzwC+PJtlILLYFg9yhF3bJhbCY0+kiq1PAaPuX2rIrWMs80/DlcI/qxDqJighTg
	F5TLotpKXjrsvxUnpHRmiPqUvjiUP6sPwIhKvFxLdgPxtxgTmsLcKiY6Z13Yr3No/6joQ7ADLi7
	j53t7sf44ZR8WrBpntfGFknVCArrAZLgW7PrPcWQ1ceon/gW9lMNYpzifxZpsrgowXOlbHdX68m
	pHOrxOGQIgW7/TVMzeWmpSD1fDPFuNs/5pWY3Hvh/SXnHXzE1k1WlupZnJmL0EVLtpVb4iHj3CN
	F+ewnZo7nDDjfbqHeUsmXMDDE00VcPqdVEhTimMktJcG0/M5iK8U+fE6AFmGHYPISVfqP4IwmTm
	lvcy98T8ye3CiZIvBQX4lsLp8Jcpxb8sBzrpzgdi3VTkjqiSa9VFB2l6rNoNNpVsLAgysXuz24q
	NlMn14GNIaDzGw+Xq9ivPFJlrvYaWbYJtow339QNN5+sAoStn4nxs2HEzrDZXQZfqL
X-Received: by 2002:a05:600c:4753:b0:485:3c66:e21d with SMTP id 5b1f17b1804b1-486f443848cmr65801035e9.2.1773853576966;
        Wed, 18 Mar 2026 10:06:16 -0700 (PDT)
Received: from localhost.localdomain ([176.216.150.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8ba4baesm7061495e9.13.2026.03.18.10.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 10:06:16 -0700 (PDT)
From: =?UTF-8?q?H=C3=BCseyin=20Can=20Erdem?= <erdemhuseyincan09@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?H=C3=BCseyin=20Can=20Erdem?= <erdemhuseyincan09@gmail.com>
Subject: [PATCH] staging: nvec: fix block comment formatting
Date: Wed, 18 Mar 2026 20:06:04 +0300
Message-ID: <20260318170604.10254-1-erdemhuseyincan09@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The block comment in nvec_interrupt() does not follow the kernel
coding style. Multi-line block comments should have a * at the
beginning of each line, and the closing */ should be on its own
separate line.

Signed-off-by: Hüseyin Can Erdem <erdemhuseyincan09@gmail.com>
---
 drivers/staging/nvec/nvec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08..0e655f79e 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -660,7 +660,8 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			to_send = nvec->tx->data[0];
 			nvec->tx->pos = 1;
 			/* delay ACK due to AP20 HW Bug
-			   do not replace by usleep_range */
+			 * do not replace by usleep_range
+			 */
 			udelay(33);
 		} else if (status == (I2C_SL_IRQ)) {
 			nvec->rx->data[1] = received;
-- 
2.47.3

