Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6738E3ED11A
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 12:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770206765; cv=none; b=Xc0w6Lpsgdi+Jt3YEnjtZr2VgIvbecuwu5I/8OO6TSDLti6Ms9LWBTzIvVGQJ64ca42g9ZyI5TLkPY/WgBfRhsxgCeyKTPNadI0WMtdIShnePvj7I1oxxE9OIEu11MfXRKsYuWY0pkWjPcnlj6f3mfMTPKr53lqMpTiRl55UMEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770206765; c=relaxed/simple;
	bh=oSOQ1qqB2JidY7/rJ3ObHNdfZRoRO3hxs/JuZ4tPmfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n+s+TQRy2ov4dVcJEl3xQVQYKYPadrLhJ9YdMx/jccYu4AGq9ZsJ7RTMdrfyNLIH0OxYqI5usx7qSaorVgyzxnHU+b58jf1cNBT9Ow9RDV63np1Tx9RaTnJh410IHTkXnds5CyN3SHc6MrNFN9DWtUiltchGw4GDJRn/TSI1+sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6EnxB0Z; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6EnxB0Z"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6581327d6baso9752307a12.3
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 04:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770206764; x=1770811564; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KxN2zf2qIjBp1ThVJ6buFrEw2Y/sACcP5vWdi5FjtTs=;
        b=l6EnxB0ZI16tvjovzexkBE6uenid/lXnMj2VK6b1X1QDHM3uoskJo9pt7i2br5N31K
         r2nH4vO6OADxYMmDSyI9kBAOBrddx8NsmASD+fSaekPZ6ooxnzpHurmAEWuhu2q0mG3g
         Xi6pMQroVaFW92OEjKai9uxCIHdJVh4Go0LdXZKCbiNfak3gfg71tepG7466Rg56yT4/
         p9QRQC2W5Q4oFlf3rMbCJwUqIndwS4Mlt6+74fqQUQQLjI1YnTpw1bryKigo5URHBbPE
         Qm/YKc9UqDUvC3c8jmJxLKBSbkqqmVyf6Hl6aCW128O/5qdt5c9Sj54TRy57ng3EO3q1
         64fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770206764; x=1770811564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KxN2zf2qIjBp1ThVJ6buFrEw2Y/sACcP5vWdi5FjtTs=;
        b=PvSJ5XXWKIfEGeftzivurtVD4k/6hqKHRDNPeH+HOamBN753DuRRyXPVZkwzDyZQcN
         wlW9JbIu1Tt5y88rz/trnCvOB166GG6yBD7m9/jsViIaSAWMq7BS9Xc3weD73AEKrrF2
         ZNZ5yqrh6imZKwc99IKoKzKU5lwG2dx4/Y+8klFcaWnIfb9E8Rand0/2qqY3GpUlxrhc
         P0dLrMMrAkPrP+HspQe4nM6wRl+gGxY/NRpiQNnpNKHyz3DwJ4chqhjUUg7IKP8J4pR/
         4h93c2jJUa9aYK+2ocgfdX6feiv0fl5iJfHgbPPVmtgYhd6bEG8VftZIPelHugQbJ6MG
         EwlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZEUsH++wzSHTTwltOPSgkZS8aKnD6b9u2om5bQddQhXz/a6bwRiTkzFCwoFgDWy8PRxlopneF0DxJTQPd@lists.linux.dev
X-Gm-Message-State: AOJu0YzjsOxnckV1GNsp+OBTo4olusIWvOG0fCABjTozUa179Abdc2X5
	HTmAlDpbK4YtWRq8f8G7IYLBH3xNpPCBs/MMQF6NmV5Mdz8LX0Whxk6G
X-Gm-Gg: AZuq6aIkgyd6Llu8y5CM8dTswD3MeMTdXr1herLBGQwb24mXb9jsCdFj0TgeHKI/SGg
	YzYYLfdfDBksiDatj6TNhLkRIlPfOZpiwBSSKMJu+xojTcT+MFhXQtr3t42zM2vVoaHIrHaJT3f
	hR0jS42LyCphiPoIcoYdzFL1I+nUZn703zG7rrtA8WjgWr3ZYshuytKA4BIbGR6Xjl72fKsqv67
	S00cDxnscGLN3eblF4eJ8N93wWGOtaPUAEibYmRNEVnNPRabN8XPGYXaVBu12l+LYOy7U5iO86r
	5+XFQXOTpyFf1UJ0AnMSn3jCJiJa8lgkuuf6NLvTb21MuZ0Uk5DGTXOOyrEfVT2iggDVrDv798q
	6YyR+OzpUzRS8HGhTiGcf9Ui2tE0jAY+Q1Msc59ODJDcm75zc8WJYU3qol/R2SObR+RMkUP0aKL
	6X1ra7GsznjPfcpj2JdrHyIfBkhEHNfujVBxZKYLb0oq3yAhE9s9OQtxknyp3WY7KYwckNsAgZB
	kVvtbELAEnimHaOpoBP8r+zcvMnn8wQSTsq3L+o70gAsE8o8F7Av+WTf3g=
X-Received: by 2002:a17:907:3ea8:b0:b83:1327:920d with SMTP id a640c23a62f3a-b8e9ec9179dmr202964266b.0.1770206763624;
        Wed, 04 Feb 2026 04:06:03 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-a.c.od237066db22328bb-tp.internal (216.79.91.34.bc.googleusercontent.com. [34.91.79.216])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9fcd8be3sm117979666b.10.2026.02.04.04.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 04:06:03 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH v3 2/5] staging: sm750fb: use strcmp() for exact option matching
Date: Wed,  4 Feb 2026 12:05:59 +0000
Message-ID: <20260204120602.6715-2-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204120602.6715-1-iprintercanon@gmail.com>
References: <20260204120602.6715-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace strncmp(opt, "...", strlen("...")) with strcmp() in option
parsing functions. Options from strsep() are complete null-terminated
tokens, so prefix matching via strncmp() could cause false positives
for options like "noaccelXYZ" matching "noaccel".

Fixes: 81dee67e215b ("staging: sm750fb: add sm750 to staging")
Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 4c6e84c03..bd2d4a290 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -937,21 +937,21 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 		dev_info(&sm750_dev->pdev->dev, "opt=%s\n", opt);
 		dev_info(&sm750_dev->pdev->dev, "src=%s\n", src);
 
-		if (!strncmp(opt, "swap", strlen("swap"))) {
+		if (!strcmp(opt, "swap")) {
 			swap = 1;
-		} else if (!strncmp(opt, "nocrt", strlen("nocrt"))) {
+		} else if (!strcmp(opt, "nocrt")) {
 			sm750_dev->nocrt = 1;
-		} else if (!strncmp(opt, "36bit", strlen("36bit"))) {
+		} else if (!strcmp(opt, "36bit")) {
 			sm750_dev->pnltype = sm750_doubleTFT;
-		} else if (!strncmp(opt, "18bit", strlen("18bit"))) {
+		} else if (!strcmp(opt, "18bit")) {
 			sm750_dev->pnltype = sm750_dualTFT;
-		} else if (!strncmp(opt, "24bit", strlen("24bit"))) {
+		} else if (!strcmp(opt, "24bit")) {
 			sm750_dev->pnltype = sm750_24TFT;
-		} else if (!strncmp(opt, "nohwc0", strlen("nohwc0"))) {
+		} else if (!strcmp(opt, "nohwc0")) {
 			g_hwcursor &= ~0x1;
-		} else if (!strncmp(opt, "nohwc1", strlen("nohwc1"))) {
+		} else if (!strcmp(opt, "nohwc1")) {
 			g_hwcursor &= ~0x2;
-		} else if (!strncmp(opt, "nohwc", strlen("nohwc"))) {
+		} else if (!strcmp(opt, "nohwc")) {
 			g_hwcursor = 0;
 		} else {
 			if (!g_fbmode[0]) {
@@ -1156,11 +1156,11 @@ static int __init lynxfb_setup(char *options)
 	 */
 	while ((opt = strsep(&options, ":")) != NULL) {
 		/* options that mean for any lynx chips are configured here */
-		if (!strncmp(opt, "noaccel", strlen("noaccel"))) {
+		if (!strcmp(opt, "noaccel")) {
 			g_noaccel = 1;
-		} else if (!strncmp(opt, "nomtrr", strlen("nomtrr"))) {
+		} else if (!strcmp(opt, "nomtrr")) {
 			g_nomtrr = 1;
-		} else if (!strncmp(opt, "dual", strlen("dual"))) {
+		} else if (!strcmp(opt, "dual")) {
 			g_dualview = 1;
 		} else {
 			memcpy(tmp, opt, strlen(opt));
-- 
2.43.0

