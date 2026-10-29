Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793298209;
	b=lIzSpgIq0CUAwnaHXbuTB3q5vOIdkMCZacrg4bvEAx7E8UwpKBej5PMsIClGI8A3yuvb
	 xE1Rja6iH4J10gUjpTzrq09ZfPYDFUIKdgkHY4qwRp5kRFyq9wvKz04QncLbKcUAQn1H1
	 v1VdsStwSEgbKgpwxY13AF2J4bZcAng7/R2FPe398jNraNbH6YchUIh1jg1MdcyhPIIGD
	 Fly+paN2037hD2pug/OCWHB9WEny5PdmDv3rbFwz/vLwFG/mib7x+GUgqx7gA2FMA3dWs
	 M67Zoj2Ofj+fFbHjEOckPlX8vp9kObvezkjoVNKRytAm8Uwifw4Q6a2NOTyx/WN/XNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793298209;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=m7m/PP9iIYn4ZcYdo39mudQdZHZfOuXSk/uRU0Y3HEs=;
	b=trxrm41HyUiLMDNXea8P2hgCdrTxMAV44t52eQKVs0MuALcz1AHunAx21NBHJlTys2Ee
	 DvDO81CvmHRnluHKYh2j7ebj/B2zWWwklT50waa2weR0oDYYX4vQzSE9l+HIzBpOPgv2y
	 1sfctJ1fWbju6BmKyhnXorSzMX7Z4elDFGIlQ8sGYlAwtKtwivf0M7zB4yFCjhFrdeDf5
	 m4xPA37Fb23F9FFWlTDgtg51/ll21gHi0fmeLhMSEwDepXfSberh8IzRwBiZJDE+fxmG3
	 SNfBhfROr2ZlqEmXz3qpPE/xrB4cw30Vod9CpKUURtuLUB7S5ZqJJcg2USG+ceAe5Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eVpGLZqx;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8253C606A31C
	for <linux-staging@lists.linux.dev>; Thu, 29 Oct 2026 18:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8253C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eVpGLZqx
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a215344409so4235085e9.2
        for <linux-staging@lists.linux.dev>; Thu, 29 Oct 2026 11:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793298207; x=1793903007; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m7m/PP9iIYn4ZcYdo39mudQdZHZfOuXSk/uRU0Y3HEs=;
        b=eVpGLZqxcd8QfEZg++TlVjezqJLCyw485KKd5aixFtTIYInfkRf6qZEuf3K+4Z83Dm
         hQyTKbv0BoYf0aJRl+abKRUC3Ji3nc6VFET4YhwTbwsZM+Q6+uWalOc15uJOkcbGORm/
         wzSVVtxIDHgLV/NPd159MddOjxW3aJNaTsolzdsChxXNnsLw1qdYubWJ4BzOtxgLOsYF
         SlZCWgf5/2niylFxJjcf+OQqWNu4mfv+mN6T8No8T3QWsy9DYDQXWR3yXIV0ViCs2WAV
         pwgx7oFwyGh1CvKn7NxYoI5yWy4dezESEmNXTMbhF1xBCff9Mfoi0KEUaS+kN7Fqzwmm
         GRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793298207; x=1793903007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m7m/PP9iIYn4ZcYdo39mudQdZHZfOuXSk/uRU0Y3HEs=;
        b=fJgZjdTg3YBj0LCffUzGcFadp4PdsPsula+cKl+yv78dOAfc9+FnxQzq2HfwLHk8JR
         DQWImRjMuYBtKgkVw0kkeIaLzp7ocUy5uV67HSdHXRidmp+lZZJbHxxP+HlHFnTe9gSo
         x2He0Mkcq1Kljd3TchOGbQzCaisNhEfhkFLLHgsCH2C2D93J+mGSsh326V8EAg7zqoUf
         QIWguKC0zQX/IJdYxTGWMuhDSsBexbJPxO1bTxUe5Co4KXIvjyIK7ReqDI0+zyjdRE9D
         N4SStk+5JIcDnxD7GwRENYFSzLRtjhs6ivGx78BUZABmXAxi+pp+4if7RttMLwPaMwIV
         +BHg==
X-Gm-Message-State: AFq9FYJz1TdjhHDrxq4WT7zW+0DqJglp6uaFWFjJf1vXARI7yzBBLFh7
	uqI1Za1xRuSpbAAQk4xSJFVMMXWIPhapBPLlsVAopZFtrZZbLytREAlI
X-Gm-Gg: AYBFou2HIfM9mUrLIg3VpwiBSvKjVvL6tBG2ZNeHQjT0CQRD7mVeICrFlf0xUARLREq
	Kix+yDD8U2nJVHEb7kNFrj1j7pqdy7fulynrjkVJs5uTUAKA+qNODyz1dmh7fGs3GHgh4fApeVQ
	hkNbtiliHdvWcs8nJirg0qIxEwgGQ+n0fzyWIjeIkXT739gnn5CA93ERGp2kSuYJB7O2b6MaQrp
	9iyhFNPsmmXrMDfRYvs6VkRZ2e6N3d6L7DcsontnJq26vpMrOsL7Hbd3zWpwjFqw4CJGi6A2kgO
	FUhuRc0Uh/EXKxORjZtrUbzlTbyWYzxSMuXZbICThTFCnok+w2o/hbbxIzPcsrGVVYkJzX4tGJj
	LHWOdD8OmU+xw0ovgVRh5bUc2BIh2MPbbfnc1/JwPDao+UgZOfVPBgiKYYxeXrBhL3B8Ddqjy2D
	AudIO6IYuuCkzfaBeHuycYDLPxaqFCsUK1bgu2Vy0mexr3qvpV/iYSqf8XDPV5n5dRQsm2kP/dq
	ax72unQ+NP/Dsk8CEmcqDu3VXKv732eVMb/yDCe52umgbys9SoRbQihXxW/ZdME+Eet3tm3bVLA
	tJhLcPynb+rY9JWIKMGZ/5ZorHpO
X-Received: by 2002:a05:6000:268a:b0:48e:5d5e:c27b with SMTP id ffacd0b85a97d-48e6e514692mr459042f8f.6.1793298206614;
        Thu, 29 Oct 2026 11:23:26 -0700 (PDT)
Received: from debian.services.ir ([78.154.61.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6eb97b29sm60896f8f.47.2026.10.29.11.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:23:26 -0700 (PDT)
From: Odin Mirdamadi <odin.mirdamadi@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Odin Mirdamadi <odin.mirdamadi@gmail.com>
Subject: [PATCH] staging: fbtft: fb_tinylcd: fix alignment checkpatch warning
Date: Thu, 29 Oct 2026 21:52:44 +0330
Message-ID: <20261029182244.173276-1-odin.mirdamadi@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Fix a coding style checkpatch warning where multi-line function argument
alignment did not match the opening parenthesis.

Signed-off-by: Odin Mirdamadi <odin.mirdamadi@gmail.com>
---
 drivers/staging/fbtft/fb_tinylcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb_tinylcd.c
index afa8f1c74..d58b12472 100644
--- a/drivers/staging/fbtft/fb_tinylcd.c
+++ b/drivers/staging/fbtft/fb_tinylcd.c
@@ -38,7 +38,7 @@ static int init_display(struct fbtft_par *par)
 	write_reg(par, 0xE5, 0x00);
 	write_reg(par, 0xF0, 0x36, 0xA5, 0x53);
 	write_reg(par, 0xE0, 0x00, 0x35, 0x33, 0x00, 0x00, 0x00,
-		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
+		  0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
 	write_reg(par, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
 	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
 	fsleep(250);
-- 
2.47.3

