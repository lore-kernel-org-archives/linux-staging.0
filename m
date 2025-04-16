Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D230A24CEEC
	for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 20:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836146; cv=none; b=rruLAP0fceoI6dOqdUrDBXqIUl2Djw5fVvb1Z8SBp5bp/aGY8pLrBdysWruLpljYssPNSqhEds6rR8bHICvCzYT0wMLGhcg5wWnJBJ6+ORfJNjuc5KP/gXqsIJv9iHtb8JiRl/vgbqg/M29+i2bg1PqbrE3DpmPWUPJoYRp5two=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836146; c=relaxed/simple;
	bh=7nOnj/t3IWRKRJuUCHCZoJzmMsnxpf6ffPgcSoWr688=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RiPsWWoAwTYdhTPsk8Y979H2kKVzTPHLvp4hZ6HdaPeigsaQYJkzuaEKYvb6YKxRDHqqt0MnE8K1KcIA0fDb+HmQ0I8mMww2mRnl8Jl1iTC98jQNtrtb+HfLTAPUydyeWGOKfu6WpoecJMuPj0J9xiGf0nbeSoqgMr3hqmFkxVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=feaK/gHI; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="feaK/gHI"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-301c4850194so13262a91.2
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 13:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836144; x=1745440944; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akTpKyJqwtY/MzR6JYTv6U/YQl7Z23JU2ZL/gi1Jfw0=;
        b=feaK/gHIESuNoIRc0IxlZ+GkBfdgit/98yTlne7UnhQpGB+mMb+u9p4lxDA1tpwPrt
         AKgZcqclkY/jRaRrGSMJVIi6W/nhc0rgwJerbJuFpZFGpQJTFo6YWCCDe8oG+Ih099Ph
         i2UrS41mgW6hI7RCi5YVBoyrCaUPxpUjZo8fi6n3BLn1/uzXwcXO1Hp0BPddVq5Cy9bJ
         2W25avoSET275safLDAnTVBx8I6U3R4h2+iDMSxegXRMyO4q0r26cY4i3/ZnWNEu7ZlO
         3Pu34tIuhuO1/hGDu/+2ABsO0BDoJcRAjn4xZDKg1u5qfIVCQt+BLGnq9aBP5rEpojUa
         6CAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836144; x=1745440944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=akTpKyJqwtY/MzR6JYTv6U/YQl7Z23JU2ZL/gi1Jfw0=;
        b=S5tIZyqNu0gJjAi6Os4UpPDcS3lWiAXbUhLNbaWUQO7qv+TzmDoc/bvdQ62tc9NuTX
         Pen2/gW5SlP++vPpSA0hCJxD5Zb8vKICjKqD4humvI7fxXdVhc7FTxw3iElZ5W5dFTNV
         L50F21JPLebSwhjKM+Hz6vf7btMiD29f+Ihcf35/oHfeHILdfAH5ldwM+qTWnBu81tg0
         q2FAxiOgvrXBjSUm5hn5AcMbXCHW4uK4mmw7EDR6L8/TSYH25IJIiO+dv86BShg1VDwX
         EBsXf7D+qDUIsCYjskQxZE7NsRETEMegFXR7XjU5a6m/DrnvGSzz2iNujys/9xN6JQiY
         rR1Q==
X-Gm-Message-State: AOJu0YyBndfH59T1pxfR+Z39WAcpbAJhrtBeZH8GLoGAcsfolS0lm9r9
	qb7ylGsNpM72qVR9fLkx2iwcpUIR3rCN3fFYGSQd7v1gIfvLhjudKkV9vwcNcA==
X-Gm-Gg: ASbGncs/b9kUSIFFILiCZAnccZnhcoE1xxJ09ojOrrw+5Q4lzhGR+ZzVmLz6eqOvS6G
	VM2z22TJUukDdokN2HDaaVct1KhCTeSjh5XGub7KFK83NONzLmlM98QSO0XA4EuNAe41/QWT/Mf
	T2zJQQ4soxp0zDN7gMYZHUb7dRPkHw4pWqaGv52FJZJKM0LTj4rOACrc2h0q+Y115ZN+jUPlv+d
	7uOiMbhGlGxaetAIXU6t/FqjbG5GhBDghk4UXUQb5NAmTU5a6RdpCkM+E0yu1cDb+jX3qR4UHRD
	ysyuWZvMjIWSwC6yTgzFqfY1li+PhOyun/PBnVZ0u+ipvtpiCw/qcryu79vMfHDeZgwMFbe9xJ3
	9dGnTfA==
X-Google-Smtp-Source: AGHT+IEahXeFFjWp0p2qul0O2oupUGo/5kKivWmtqB61asyg9Eiq7M16/a86vLVksRu/6PZ7myUDpg==
X-Received: by 2002:a17:90b:2b50:b0:301:1bce:c26f with SMTP id 98e67ed59e1d1-30863d1de1cmr4820746a91.3.1744836144196;
        Wed, 16 Apr 2025 13:42:24 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308545a257esm2151852a91.2.2025.04.16.13.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:23 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 14/18] staging: gpib: lpvo_usb: struct gpib_interface
Date: Wed, 16 Apr 2025 20:42:00 +0000
Message-ID: <20250416204204.8009-15-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416204204.8009-1-matchstick@neverthere.org>
References: <20250416204204.8009-1-matchstick@neverthere.org>
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
index 47f56fea28a6..494cfa21b938 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -1055,7 +1055,7 @@ static int usb_gpib_t1_delay(struct gpib_board *board, unsigned int nano_sec)
  *   ***  module dispatch table and init/exit functions	 ***
  */
 
-static gpib_interface_t usb_gpib_interface = {
+static struct gpib_interface usb_gpib_interface = {
 	.name = NAME,
 	.attach = usb_gpib_attach,
 	.detach = usb_gpib_detach,
-- 
2.43.0

