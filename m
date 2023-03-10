Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B787B;
	Fri, 10 Mar 2023 04:01:26 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id bo22so4132579pjb.4;
        Thu, 09 Mar 2023 20:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678420886;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OkeU/XIvYLV7i/BgDe2gN+ETpxPN9Z7bVS2VtFVoXBQ=;
        b=VmwKFKxsj4V7DC/N7M+8Yp58I1Pd7coa9KKLGavkX4MwK+VBg/TTQJtfJRzTywrLPO
         nFBbSmUUomVQVkKzK3pLbK8gtBKOQWefsgx/f14Beb73MOrlNhRwShvc4fjZoj6T5jCI
         8ko//+4ctKuEN2fNUoDa+cZspp/MxfDraN309nTuT6gfbfvZfGpBzn/NF5/2dwlrKDor
         VllBIkjuvV1MFSn4NodHmGIaly1EFWnAq5z5Z/fVqWtQ5GEwNU1VDPbfE3/Rnx6Y71cd
         Wr5tS/koB+yaP7RFuITmL9/NtT9/ByaMaP8k5RqqDNkgcz7N25uGV3Wu1kL8Hc3hUB+r
         x4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678420886;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OkeU/XIvYLV7i/BgDe2gN+ETpxPN9Z7bVS2VtFVoXBQ=;
        b=KtIL+LlIjBn8Ss1mWS8jo0ytyugdqk0aKK9dSTn136vRIF5rjTau4U8aYwQGHSknKH
         JX6t+H72ksuAADcZ6HG33OTElJdzunIU7HFvyl9DCBn/6Ouzk+We1iJm+1PUWqpamxCR
         Xh1EDMqpEPzulaR636/sGEYurPV00kqwJMdeUtB8e/WEo60mYUHK5pxZ2OzHHKcZjUQV
         MtRB0JbdNi9LF8OCXPZ9PETWQ4/33FTT5bCdStfP9DQj1F5y5CMSzOq5bV24seeZquQG
         58lBlgnOnKlb7UVXd/BfvvN9BYJSj9rQ8DXquLZwgBTkfpLwyv58ffYiQOJF23qTXSj/
         jKZw==
X-Gm-Message-State: AO0yUKXYrBR/jFuVsY7+8LjoTY0o5THa23ygnZRaxJ9zVYhkMtbX2PMN
	UQDOd7mqyLF5OnnOiraSZIs=
X-Google-Smtp-Source: AK7set+xOPSnesA1jGx25WYZmGOi3VMcUa0/wGgX01Cvh5lRAe2wMpjt0fhEDksDw43BN8ewWdSxhA==
X-Received: by 2002:a17:90a:6acf:b0:236:6e4f:bc1e with SMTP id b15-20020a17090a6acf00b002366e4fbc1emr24949878pjm.49.1678420886155;
        Thu, 09 Mar 2023 20:01:26 -0800 (PST)
Received: from CloudiRingWorld ([122.231.69.163])
        by smtp.gmail.com with ESMTPSA id u5-20020a17090aa20500b00233b18e6fb3sm358597pjp.1.2023.03.09.20.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 20:01:25 -0800 (PST)
Date: Fri, 10 Mar 2023 12:01:21 +0800
From: Kloudifold <cloudifold.3125@gmail.com>
To: gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] staging: fbtft: fixes alignment should match open parenthesis
Message-ID: <ZAqrkWn22Q1eXjCL@CloudiRingWorld>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch fixes the checks reported by checkpatch.pl
for alignment should match open parenthesis

Signed-off-by: Kloudifold <cloudifold.3125@gmail.com>
---
 drivers/staging/fbtft/fb_tinylcd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb_tinylcd.c
index 9469248f2..7d4741c47 100644
--- a/drivers/staging/fbtft/fb_tinylcd.c
+++ b/drivers/staging/fbtft/fb_tinylcd.c
@@ -37,8 +37,8 @@ static int init_display(struct fbtft_par *par)
 	write_reg(par, 0xB3, 0x00);
 	write_reg(par, 0xE5, 0x00);
 	write_reg(par, 0xF0, 0x36, 0xA5, 0x53);
-	write_reg(par, 0xE0, 0x00, 0x35, 0x33, 0x00, 0x00, 0x00,
-		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
+	write_reg(par, 0xE0, 0x00, 0x35, 0x33, 0x00, 0x00,
+		  0x00, 0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
 	write_reg(par, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
 	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
 	udelay(250);
-- 
2.39.2

