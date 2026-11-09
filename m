Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231463;
	b=EKQGm/wIiCtFIZKDwsHuErDgHEUjSipqBipY245OidGBUmeW0/f3r182DVUWFgnCdPed
	 TDsiGVVqpoCXQ2T3DHprdZMNbiC9H6jakkwSUyhN+2TrRgWaqbjCXn0F1e3B9DXGGF3vR
	 E4YHl5psZB9LK/R5VZ2LLguqLgMdIU0qPdjUoKdnVcnBrG9hPx0YIjs0vqejvs5sWkqJe
	 1uT8W6KjDGXDEVuNMoCHMAhZ7NfmFvrxxtt79q/1tU2vbKW0FJ1o2aWEVphpeAA5onD7E
	 0xUqL8NxISbXhZLLrFwSZ5Bp5WIrwjqndC/V0nQy9mHmSZJETtg9q4+w8v14/69WMgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=QWyQhqJ9ucdQAcEnl95DfWPx+aoHDTMLg3gXeTbngSs=;
	b=UnSVkMyWEweIaQPLJ4CdrDdA//NFUbbl9jFDEiYdt2jBFfewv53ooySpcsKIlFHEc4TX
	 stEmlGJ+Ijccqe214YIG6r1Ax1sIpbdeAgq60VvRS1prl/oSMOQHt4Z1AkPNVKmwl5Vxh
	 xTKdI/RoaOZnbS3DggG93En2yqYYfpBKYCcxwWY4Y3pv9PaTTJDGhJqni9IQj4qX55HN9
	 +DqFrRR3leD+S3gvjm4wRli2mRm4RbvInvkaeCab3LxsNgidezSAI/20xL6rkmS8oWMuD
	 ceB8jFBfMIYNEgrseL/4mvAJNrcMeyJOMGBEAZaJ//eVk31gjWQgsIW4Wjpp2ICukuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OZHHLv+w;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B65606EE80
	for <linux-staging@lists.linux.dev>; Mon,  9 Nov 2026 13:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4B65606EE80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OZHHLv+w
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-37000e7234bso749080eec.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Nov 2026 05:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794231462; x=1794836262; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QWyQhqJ9ucdQAcEnl95DfWPx+aoHDTMLg3gXeTbngSs=;
        b=OZHHLv+wtuakew83JmCAT7F+nfdfE/ocwOpUVXP2tbWDqLhnTutXyYNyc0LD+35zEq
         KzwB1K4zd5wo1klwUWA8pfmIHSvhD8xSTQBwVfiyL+hWJQ4PxoqefXT5V8n6VFb4oXfF
         7nqjpXXaG9dCu3j0Tu/GtHOh7z7fd4AcIxe1Wj8ad6lPt63yAXh0Dn7SZQkRFEOiwzsJ
         YH2PFt0/+yz8NXRJkVneG+mdzAlCa4DAQD4gC8+RPI1tzQWh+2MdqfcCNXpvKRH8wTRN
         ZDS42H1jzTIBZbJ3r3KZvBWFI+CQLYw4jpAzE4BX6tYYrnL48Fdi49g4ceffjaZO0d7t
         4o8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231462; x=1794836262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QWyQhqJ9ucdQAcEnl95DfWPx+aoHDTMLg3gXeTbngSs=;
        b=zOuKq4vsQaIuw1HRsSyNJjKRAIFs8b5VHWaY9SKsVlDIhsUMKmvBXHnXSp8HkOxFEQ
         m/7tlHHPFivBJsdjSQcocU/qfJvePiYD9DDSJRgxu3NjOlEoKwhTpJzQ2D2Bnsh9pd9c
         UvLWNc9KaFdq8f9Er4ieraFkPjtY8QGExClgCxwsSdo94wr8pOybQVo7DLc5YwdKr1Uk
         D+ViGp/bssmops1T3Sn+UgeqBeO6dKF7CapfK+vXhyV7viDkEdHWLyNq80W4PXiBCwTc
         UJMddQvoUDtaPSO/yQ5Na6QorHkl0GD9of8QDq9QGLfzsPejxOLl5SdVLQC3wMr+h76y
         5SSg==
X-Gm-Message-State: APuU4Z/2NlHXD3LDcIPIvuU1p8u1l7pH2boZ2cLesbnWbEjBLYxxUx2z
	HcVuiwpOgwDygIfN8UCrcH2kJk69GZe3bR2dwysC0aP5br2fvybanWRroy+Nu8KKjUY=
X-Gm-Gg: AYBFou1q9BdeNtdEY/1/ricq4oyVlkZq0kJffctP7CHe9DNsycP5VzB6/sQmIGH/2P7
	bNQ7sXxhzI8Bgzz1qFsRIu/T4RnpnrcSl7cArKdk2rflExAMTBqBJGcltq2aIrFEr4eBDO1Rqbf
	2dLjDhihCEG4EwwD8FaMNsO4OXzSwfwMXl1ibnw0JssZ1IJXHL1bjZ6BbgBXWjammvPqU8C/mc8
	q8lIuAAIsDs3K3Tj+EGt/5DkPmgljd0YZdBAsaozoEldzZBfQxN90PSQ1csqrpMbAvh60wMLXhO
	bGBNcsk4daWlLycq7R9RxttKyZIKEu4Ugwj6fHISGIDutaUcdoyQG01FRxMTcYl7JJr7KEv5enr
	CPRxN/rcjL8LnNzDLNQX/3CYTXNUtshv1TSAUZD4yef/mv2VYfx2naBdxUjs+ODKBIaKCNug2qC
	jrk58sk+ziKi95rsf3kYx/d8fAm+Ab7r+zpJffkDtWm3vphF9CCeVrBtEgrpz/ms90PJK7pcJpn
	seVusUbah/epWVf7MBibMcYxwaT2qXm9pAW/NtU3NPBiBCnbFmgRNgd0WTBmWyn3lkCi5ldUlSU
	uc+giI86Ct3twz6VeWOS3UZqsa/IyVBUIzqJAmWtObhmgW2TavEE8kBq9C9o+yX57WizOy7478g
	tgdKu1RB2MOotc9OguGR/mMmcF+VXHjiZJTv4pzb2AOz2
X-Received: by 2002:a05:7301:6497:b0:369:efd5:9cad with SMTP id 5a478bee46e88-37255475628mr7236459eec.8.1794231461483;
        Mon, 09 Nov 2026 05:37:41 -0800 (PST)
Received: from localhost.localdomain ([203.92.58.30])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372666d2fcbsm13225525eec.24.2026.11.09.05.37.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 05:37:40 -0800 (PST)
From: Shivani Patel <patelshivani2283@gmail.com>
To: outreachy@lists.linux.dev,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Shivani Patel <patelshivani2283@gmail.com>
Subject: [PATCH] staging: fbtft: fix spelling mistake "writte" -> "written"
Date: Mon,  9 Nov 2026 19:07:31 +0530
Message-ID: <20261109133731.66016-1-patelshivani2283@gmail.com>
X-Mailer: git-send-email 2.50.1
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

Correct spelling mistake in comment ("writte" -> "written").

Signed-off-by: Shivani Patel <patelshivani2283@gmail.com>
---
 drivers/staging/fbtft/fb_st7789v.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_st7789v.c b/drivers/staging/fbtft/fb_st7789v.c
index 861a15414..c4db681eb 100644
--- a/drivers/staging/fbtft/fb_st7789v.c
+++ b/drivers/staging/fbtft/fb_st7789v.c
@@ -221,7 +221,7 @@ static int init_display(struct fbtft_par *par)
  * write_vmem() - write data to display.
  * @par: FBTFT parameter object.
  * @offset: offset from screen_buffer.
- * @len: the length of data to be writte.
+ * @len: the length of data to be written.
  *
  * Return: 0 on success, or a negative error code otherwise.
  */
-- 
2.50.1 (Apple Git-155)

