Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793429248;
	b=sfC6dVySL2HiKTHnDqI8jpAXt/BMAjgjHgvacoWXOhYwqTjyg/Zi0okJ87n/mP0eYJCs
	 qgnGJEvhD/TMIGThlxtaTVfBjzclLVMmq1KLxXP9wjj3wYmqCHWbrRDuzEZWgl9OsNrFA
	 DY65hPcT/5vklFF2xlrXI0+FCjsf3DxNUBr1TPDcp26066SgawAUhP+yPujIhfzgIhnqh
	 N7Eb+93y832RLHW5Q6TtgosIpgpL1UmSryNLSj+4n+YyeQxrFAZdFEN2kUy4U03Y0hksH
	 Ib+L/ypx3wJIr0hmW06PlKIZYnIcu/BGoCvD69ygTA/ss2H8X2gO8t70Zr+hVFcIhOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793429248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9U3dWfP9wuIKNIASQMC6j7LlTeXrOraHdMR5EURM28M=;
	b=AXNqZ4pNWI2v1UrGrwr1iCFBgfTynuP1FmoMq5fVNwjYY8v1vyFHksAkbDzlNwam6JTV
	 nQ/1ckHkwmGBAZxTwfh2rKcFBOXbc5AUDl+cKqTaIgTE35kEPTRimvjsvZUEAdZ1gLtbf
	 BSuUdSvMDjOUL8JOOVdg/I1rwZp/RZWEd/+01JSkaYtOC4fzYDxOUkUk6k06qcBzIXfgn
	 CMlQET0V6bFKdU1cpV5O7DGg5ukmgqot6yrAJVEdFxuHmfbiozDj+QqAqx9kRnVVGsnjB
	 NZYoaUpXDxk+Ku3FnsVgBV7F2PqjsLe8CtzZGpLN5Zh+Km37mj3DcelIDwh7K7SuF6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="CextaM/u";
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DC4606A31C
	for <linux-staging@lists.linux.dev>; Sat, 31 Oct 2026 06:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76DC4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CextaM/u
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c43373ae89aso217612266b.3
        for <linux-staging@lists.linux.dev>; Fri, 30 Oct 2026 23:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793429246; x=1794034046; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9U3dWfP9wuIKNIASQMC6j7LlTeXrOraHdMR5EURM28M=;
        b=CextaM/uhnUhvU0XgqLXLOrm2KorM3IwDgZWKwZiNyfa4i2aod8ZsQliiK5NH8bsQl
         +a6/Jek5nehbMgfl5Tq6O+vifjzRQ7Fb5lKZljR/aJfaaLO9xBiJqrTCBWukbgEfj88u
         yrDwgS/WJ9y1cMFYyZqFgvF/6JeRdyoI9O0aq8uNRlai4fk2IBTDzIVZWc4Png5wddqV
         hvJ5L1FdmysOZorNoqRHEY+NKseILhXixTKc635Fx6XHgVHMFCUpAn+S+X1P7bwGv8t1
         VeuswA8AfUnBTUqaYsauBbjWnqEC5PHTzqYnVUXR7BjVzojgwVkBFIzneTJpZSyBXChl
         TIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793429246; x=1794034046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9U3dWfP9wuIKNIASQMC6j7LlTeXrOraHdMR5EURM28M=;
        b=mj91kYRY44yIrqR8QwHWB2xo7Awpz+MFGO9yHvnfMAD3fZXhlk4VPKMTyFD9OSIQKN
         aSd7bCNHcXOGAu1fX+9WZY6kQ7/9DE9Tev/BWXI8u/VqA9zmav+O428IIO+dMXSJf1cp
         wqjiexPSdGT8/gQ+OUUUFmw62r+Rw+/RzbHKEYfNWFA13qbn/mCWmkPOFKc9Q9AkmkF4
         MoVfFl5OJaybkvKr5sZaC+bOKQLbp4KMN2mjEqlEnXoJUZ3XS9brHdQ54hpGxfS+Q//E
         qeg//bgS8CUTMkg6qn9ow4//J+sLOhcM9Zii4CkqPGmhgXyXS5RFcVApsgUgEzT/vbUM
         462A==
X-Forwarded-Encrypted: i=1; AKwUvBzy3hc7rMTvSn4DSafPYQL+uL4nIt/nJW5Ak9+4Uu0Y7ATBEPz03A0vRxQEb+4bbzt1Ht9HmtWhptwvNNL+@lists.linux.dev
X-Gm-Message-State: AFq9FYJkdNX9cJcWDYQyXFkKkZUu622QP2MOLlL9bEjwWAmUve9J83+/
	iI3tRCSvU0edVIyFdeRURF2Q9VLZesa5jG6/hJ+z0wgmgI140GaCQHbn
X-Gm-Gg: AYBFou3ZV6zcw/eJ9LBKh5VXlCCCUIIErkUQBkKGNxszqiuMZxEhP0ipVxeDzWKRnQX
	ydXvivyUfc4VrFyb51hNG4sGQknLh2XJGL+OnDM23xUimf1IANMVOc58WK9tQlxPJdrIKnXGPG9
	QI6JpD4wo3PDyIA1p6yU9cvhC7AOq7E8X1rQAgdaSu5zGM4d2p3Czgmo7c4XHOMzmF/y7zN8Dpr
	AsyTwdX2BlYVxO3IoBOmwYw5rwhTsXwlhGRHFEVG2JuSa1ABPou1wwpk27UJQgj1jS3ttP0+A9G
	uk67tTRzcMPjkTQTjFd0VFFwzksB3M07s0TgX2XFBjh+5BNBpZid9eqwF2VswJ9IBnxmaMjiBvX
	ZcXoPSJ/sBeU6hUEwn0q+VUrf5MpHpaIY+/JXfNU1pKG621cV2vwU+PT6saDL+0mwqdLJVCUkdd
	irCnDjvTL3ut8Je/nF3fKFZqlfuU/63sFVBDQSCksLMes7ChFarED4tiOcWbgfULO9S+zpo8uqZ
	tayu1TR1+gMaxgVH+rJToX1d6QlUccxpthhfySNTPOEFbC4fP5Km55n+3yK+FMJONwoSIgbVhBw
	EYqbPmwf4z/c4yVRZ+sL2tWbQUOs+k0ZHnVOMN5rVHbYqSIWcHcmbAJpiL0MDX9PmNK0cP6Fp0u
	+c7uY6673D5CUg+rBnmg6QIW9QUrnLWFQxq4bvNSVD7Id4u/NBko6RzMhPuxANro/JNk=
X-Received: by 2002:a17:907:9346:b0:c49:b9b6:4b5e with SMTP id a640c23a62f3a-c4ca7b1f727mr373328966b.20.1793429245709;
        Fri, 30 Oct 2026 23:47:25 -0700 (PDT)
Received: from maria-VMware-Virtual-Platform ([182.186.37.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabf43b19sm145030266b.87.2026.10.30.23.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 23:47:24 -0700 (PDT)
From: Maria Sheikh <mariasheikh812@gmail.com>
To: outreachy@lists.linux.dev,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Maria Sheikh <mariasheikh812@gmail.com>
Subject: [PATCH] staging: fbtft: fb_tinylcd: align argument with open parenthesis
Date: Sat, 31 Oct 2026 11:46:59 +0500
Message-ID: <20261031064705.9513-1-mariasheikh812@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Align the continuation line of the write_reg() call with the open
parenthesis to fix the checkpatch.pl check "Alignment should match open
parenthesis".

Signed-off-by: Maria Sheikh <mariasheikh812@gmail.com>
---
 drivers/staging/fbtft/fb_tinylcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb_tinylcd.c
index afa8f1c740c5..d58b1247262b 100644
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
2.53.0

