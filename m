Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7742125A2DD
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151128; cv=none; b=snMzcU0mGH3oNW+RqXIdTFPwCLfNRnYjzEoz6KKi0Zryj+neVOgGy58SIMeO5zfvU/8FOyoooRcDm/HaAQAWIiiAzNAgeS/W2lo+ius267U9/wWUfcmRrQXq1G/hp4qWgwlrwT5GH5t9fm7m1r2ZTHzoYWOegjhS8eItcGQdZjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151128; c=relaxed/simple;
	bh=aotjQhayfde11pBuCYSMkPo/542taqwscZUcYD4hF4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KvAXYQuvYE41tQWSW0bBY/+3T3FVajfRqunYZ9pARjXmcgNVGEp5QEKzFalUNk/6gRnbRBKNpwiinpubZYQOXMYCRoSD++HxicvrqlDmyqMtZvLXDqwEyM53H2xM6ySqOwPqsdyDhAKuY86+JnW0EUHgSc/Zd77Uz12A5YgvBEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=PM+uj0YQ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="PM+uj0YQ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-227a8cdd241so71141585ad.3
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151126; x=1744755926; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+y3vOzvRwsIdZi2JyqyS7+haX78zm+EDNg0eHrvZINY=;
        b=PM+uj0YQab3alsxQ0tfUnGPDkKbwyzEn7xPoUMXJBiNvPRiyAOZID0L+gx2D7WztCe
         00BjWmS4pmypGHJyfV9siNpUkeaRYhDslZ01sxs5lSyOYfcNvldMwfi1Lw/xPpuYlJsz
         LaHA1hcrRnvagrN/t/X/F7N0abNFjn1O1s5AFuipUL6oe2Q2P6SvmHhqZ790t61uF7l3
         gWSenqFSzAt7MAqkdbTKzH/iin0jY/YZnsaRweeHWT87bBca7lCkUkkQH7enLpljjGuC
         miV1xCLHYeadZd0NSktlzMf3OXhJXmR39tsE/JDpAS5hnJZN11rgmrkn7mPdPYtf3Kx2
         vcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151126; x=1744755926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+y3vOzvRwsIdZi2JyqyS7+haX78zm+EDNg0eHrvZINY=;
        b=qA/MTaRy0LrMJDm7/X6/aSZEk6TxvJ58NHouijZP8giiA/A8Kurf7fKINQJJ+H0gWy
         O0za0y1Qd/RkP5AumI+oZTaq2VQAyyhyGzwD0/baNLr8XciSuMXv3sJmPZreTIivMKzE
         NpvhaZhiuDE7yD6+cc6n8sCby9f1f7nw/G7WixacNBvtnhcBZum6ISauSfn6ck3P84/E
         sOHSj6sdlGHriqIOA0Pt+h5ywXV6l6YZDZZXE72rydT/IO44np2t6bCWNaNarvgpJw21
         z3nPbEP38m0jA9KhnbmnwO3w/x6vPEpD+1ToAu7LbDkzQuJaf9mBVBxSrf5/65uzFJqS
         6ooQ==
X-Forwarded-Encrypted: i=1; AJvYcCWViaOJkln4HUohVWIGdzDZgGDmzqxDd6+tAagtG2qk4PIRJdDTUXG4S8/+R9KPXaIm/87ON5YDEL6Af5Ob@lists.linux.dev
X-Gm-Message-State: AOJu0Yxjs++Hqgcyn8A9k5FAK8/qtN+tb+2lPTTKS6+m/zINeE3h4xaI
	J4gcovXFsv+Z4haYEZBnrNov3oUmQm/elaPDEnaN62VPyRyu5psfj4J4Y2/Z0g==
X-Gm-Gg: ASbGncuaDLc34X7uyrnpp1f8reZCYOxr4PeoYm0vauux1ZjpmFwPuMp2d7q9avwKFN7
	f2tloZcpU2gs42xp0RR26NzdjN8B3qoZSecp26CuZ4qX2iRnboBswTcl8f7UaYyk1oZqeDDzpbn
	/Pdo5jhrFkZ614UJP6jpYfVUf/xEftcY4Y2m1fy+aN5hyX0kwzwIifJhdNpBid84+OPYZbetOxt
	81i4aBYR5/DTYW3auQUeJh+IWIHAkJCl0LrHJwSCcKS+b1ikkV+wL9zCRPXDv7jwfe0p69y7nE2
	ethy63Pp+aY99Ck7gLZRginSFfOqPyc1M9Ivg7ILRctz2U6oVu3WVSW/G6aSXUCyxnWDeXnE5Ws
	eOI6t4eMn1A==
X-Google-Smtp-Source: AGHT+IEFsOIdLyZPCOfJFwBag4ZcDio9PNzxGSt0K1n7La2fdzlWclz3+1UZj0jjYvhUX09Xbu6XrQ==
X-Received: by 2002:a17:902:f64b:b0:223:65a9:ab86 with SMTP id d9443c01a7336-22ac29a59b0mr13846235ad.12.1744151125867;
        Tue, 08 Apr 2025 15:25:25 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e3ecsm106501235ad.198.2025.04.08.15.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:25 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 14/18] staging: gpib: lpvo_usb: struct gpib_interface
Date: Tue,  8 Apr 2025 22:25:00 +0000
Message-ID: <20250408222504.186992-15-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222504.186992-1-matchstick@neverthere.org>
References: <20250408222504.186992-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index faf96e9cc4a1..a4bfa95357bd 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -1053,7 +1053,7 @@ static int usb_gpib_t1_delay(struct gpib_board *board, unsigned int nano_sec)
  *   ***  module dispatch table and init/exit functions	 ***
  */
 
-static gpib_interface_t usb_gpib_interface = {
+static struct gpib_interface usb_gpib_interface = {
 	.name = NAME,
 	.attach = usb_gpib_attach,
 	.detach = usb_gpib_detach,
-- 
2.43.0

