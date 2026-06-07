Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE82239567
	for <linux-staging@lists.linux.dev>; Sun,  7 Jun 2026 20:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780863445; cv=none; b=dn7KKYd5MjpG16LboeftPn/sETq8YdD1jIAwSuxb3L89mT83trDgnEVL5+I7FzkDs0eQntv9Tk625QoIh5C53hqiwaeNQFH7x93ty1VLHSybjThnp02rY+fL1NNx9Gro6YihWbts4fgqdCTBRSmkF7Tul5a8zW7yPuRUR/kUtu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780863445; c=relaxed/simple;
	bh=UOGYWWTW+WEXSYQLS0GAi7bVhWf1f6S3xCv+nvyx2Sw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nfyjc8/gQsssKoAqkHMx4qfGR0YvEM1G8F2Bx0sTCC+FIcLUmugBhvd6fTjSO43jxPNdinY3TrXg8ceH84fqDUB9C3Ydtkg2q+wpU4hTYuG9vgPr6rlHrHU52KY5P7xXDu2oMU4EFrlJ2Sw1jq+MbtM6lSDk44mixdZubBOvnEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eRZr5/nx; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eRZr5/nx"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aa6cdebc33so3231539e87.2
        for <linux-staging@lists.linux.dev>; Sun, 07 Jun 2026 13:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780863442; x=1781468242; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cy/zUtWfVLlQnRmwYycbaxD9q0kWKYQ8XVFOlWopOt8=;
        b=eRZr5/nxyAQC5SHfo3XkWMBcEgsDBLoen1X3VA2L+XX66uhM14i99AlePDyFH9h4c7
         Sqt1ir+M5vt2aBsvcOooSV16Ed2li7/n1sH0ncPSJ0gan+GaYqMEtyKIBmGIWec9FEe9
         duDyQp4hx3oXT4CFagu1HLPcrgnErlydgS+rcuN6I/SVM4pcj/h3H1ODjoe+JgVW3Oio
         uelaULfon3VzOJqZYEd6NBfUQgiW5oR/JP1BGo8s2mmt5Ae3I81cdfF9PeFBaxtl/p8g
         UZV3CIyf0Y7bwLD4iMNfM7+Eo4vUUcHQ2TIPbbdF910o5XgGQCFU+BDSQrkc8F3ixIuH
         vz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780863442; x=1781468242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cy/zUtWfVLlQnRmwYycbaxD9q0kWKYQ8XVFOlWopOt8=;
        b=qROPft33A1QpkrGBO6ZEsfTun4Wkr6JqQdtnE+BBjCreXqXfqc7R37QRNyOAHXsnfn
         oHlM/kttSj6kSx/zYazliUYhs04mguexovD8CAGqpqP01ZAv1Y/ta6K6mIyotlqFpSg/
         n4BWJMZQklJRLZA7cqHqFkzJkbXvos0DZhvYCneq8nuSRruSjPST8IclcByE4w3VBrha
         aSNcgiz038UTgyRBNQaA5v7NlG20G0lKc7B1fG4jKHRE5KrcknF0cMgYPXFCy7ItzkHy
         O+8AsckhkCn8UiC04FZOrl6wjhFn5z+9bIeUdZP7hrp5FjigV22InKmn0/OEzUGfuN2q
         KH4Q==
X-Forwarded-Encrypted: i=1; AFNElJ8eW4W7GAEAcIAo7Elj30LOo83OgkL+Vs0ml522R0L3DekE/745T2MfeZKmz5p/8Db8AilX7eyC2WIj9aEV@lists.linux.dev
X-Gm-Message-State: AOJu0YwGxW4p93S69ZnRZ9dQXzhiBV4gDeQoGkRVQmppSx9krU06a4av
	BKz2+Wx4lTUhL6neVy3/1EMcYE3WU+lgcg7Xqy/NwNqfc6zK+NorLB15
X-Gm-Gg: Acq92OEfYq72Tbm8YZ90Vf4xa2cQJY576kRV4YxsQxyrlOg5uBkTB9q1MoVM0c/PXlj
	8P0ZwVS/SkyhDkDqNhtIOZ7hYklU+6QpwmPiIIFm8MlzH3JmoAQhthdzvTxCxcVGv2rEPPcB7O+
	MVI4LWtETK15WjUOB27RFDS6hrqUA1DZ2vMB552/8qG029ugmCyJtvGVyP25CE9QGIiTWRJXimb
	qAqHwjGL7MBB9RBwje1/A/C3uks2C3xvjQGuXI9cU7TQSqI+vQtpOz9RYK6C7XiN/lvysPnbPkr
	JDNACncnIvJaEe+pc5qfQDtR7FU/iKwPDGgLAZ7AxtYMhibTRQqKKHgXedRkmN4U4HT5JyXJZx2
	fvPfYvysZz5LQlZ1fJSHgcBE+dtPFsjLx2Wsk8As59J6M7GiWXKp49F/THpI31OkMFV1CS0nw74
	VWMTaLTYrQa7AUGPDU9shjrh8TebrP49M=
X-Received: by 2002:a05:6512:32c8:b0:5aa:7078:4a12 with SMTP id 2adb3069b0e04-5aa87c23abbmr3618491e87.42.1780863441904;
        Sun, 07 Jun 2026 13:17:21 -0700 (PDT)
Received: from fedora ([37.113.99.0])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b907269sm3276268e87.34.2026.06.07.13.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 13:17:21 -0700 (PDT)
From: Georgii Druzhinin <ilovelinuxgames@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Georgii Druzhinin <ilovelinuxgames@gmail.com>
Subject: [PATCH 2/2] staging: fbtft: fbtft-bus: remove prohibited space before close parenthesis
Date: Sun,  7 Jun 2026 23:17:08 +0300
Message-ID: <20260607201708.88644-2-ilovelinuxgames@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607201708.88644-1-ilovelinuxgames@gmail.com>
References: <20260607201708.88644-1-ilovelinuxgames@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl error: "space prohibited before that close
parenthesis ')'" by removing the empty argument and comma
in define_fbtft_write_reg macro calls.

Signed-off-by: Georgii Druzhinin <ilovelinuxgames@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff19e4..409770891c54 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -62,9 +62,9 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.54.0

