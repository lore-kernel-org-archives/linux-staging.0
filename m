Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8848101C7
	for <linux-staging@lists.linux.dev>; Sat, 18 Nov 2023 08:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mvDKezS1"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9c40c3814a8so83405366b.0
        for <linux-staging@lists.linux.dev>; Sat, 18 Nov 2023 00:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700297523; x=1700902323; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zMz8/s0f1rrtzmkkOs21rTHNKe3hKx+usDsY/Vx3Y2c=;
        b=mvDKezS1NF/fKL1w11VG5+nOSjCVPUdve9WNPwqObu/4P2yCwkfYyuVKxjHcGuuWR4
         5J39uJKB8AWqwWnLnNwoTR3X32d/94y8esv0x874g3FStO4zuu7wr3veRXv8GUSt5xtQ
         2vGhgSCJLQJwAnvOxcuqzLQlv5JIuLusagwkbxpDKjvZocaxk0dg5R+RgTCqAS7ommdZ
         z9BXMC9JqSY3i91h+3mrmVtMpei7ovaKlofYtMIQTDdtDbzH7vOtKIeA+/nNSTPB7Vj3
         FodtVKyASGOdzx8+VdqWPxfcQQhdMgcmyTFYBHBH0rTNEpVmPGNLfiE2EE5UGfLt6M9Q
         M2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700297523; x=1700902323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMz8/s0f1rrtzmkkOs21rTHNKe3hKx+usDsY/Vx3Y2c=;
        b=qKgyQhvF/xDhWqrDbAlRzE84wtTVB5Wtw30dK6e/khzOArZVekG4nqjBzU++G10Ywr
         9uYaD6B+oi6YfCMnSUITYCNKfgoDjXFbBN0dktjNSYWtyIZSMxYI5y0TMIZzWJjGqOcc
         OnRARwPTSTXVbRuxXpkn1wykZyUBd7TwPYJEh8SWZxlydnbUXvzaGVMKduj//HlrZ+sf
         fUqSRNs8n4TVVl80s/vRtWUQPzbSMvvvNXYbqw97P70iWPhpB5uXCrWkAh2KX7bnh22L
         Fhg2z3CUQBE4fLBPEKPaPpHg7vhQpZmMM35Z2e4YCZTkoZoWvLwXArizWzW4xY8F4nS1
         euSg==
X-Gm-Message-State: AOJu0YxxxIa7CQe8pc+0dvcaIym93ToiJcusEx9CVHr0hrish22Rl2Mi
	mKVVgMaCz8TU2V+1d1UHPU8=
X-Google-Smtp-Source: AGHT+IHx+v/ZGnNo4+fLMZ/G906LymFhb0eamu67zefP3CIQKl8CBvzEJXfUuBsuYSErr8Vqey8HMw==
X-Received: by 2002:aa7:d755:0:b0:547:da7:9c10 with SMTP id a21-20020aa7d755000000b005470da79c10mr1261003eds.2.1700297522916;
        Sat, 18 Nov 2023 00:52:02 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57ba2f20.dip0.t-ipconnect.de. [87.186.47.32])
        by smtp.gmail.com with ESMTPSA id g22-20020aa7c856000000b005487d3fb436sm202605edt.90.2023.11.18.00.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 00:52:02 -0800 (PST)
Date: Sat, 18 Nov 2023 09:52:01 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 09/10] staging: rtl8192e: Remove switch for a constant in
 dot11d_channel_map()
Message-ID: <d81caa0894bdaaca471010cb3512f3459a2e7df4.1700296319.git.philipp.g.hortmann@gmail.com>
References: <cover.1700296319.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1700296319.git.philipp.g.hortmann@gmail.com>

Remove switch for a constant in dot11d_channel_map() as the result will
always be the same.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/dot11d.c | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8192e/dot11d.c b/drivers/staging/rtl8192e/dot11d.c
index b515008045bd..37106fd54f00 100644
--- a/drivers/staging/rtl8192e/dot11d.c
+++ b/drivers/staging/rtl8192e/dot11d.c
@@ -62,24 +62,9 @@ void dot11d_channel_map(u8 channel_plan, struct rtllib_device *ieee)
 				[channel_plan].channel[i]] = 1;
 	}
 
-	switch (channel_plan) {
-	case COUNTRY_CODE_GLOBAL_DOMAIN:
-		ieee->global_domain = true;
-		for (i = 12; i <= 14; i++)
-			GET_DOT11D_INFO(ieee)->channel_map[i] = 2;
-		ieee->bss_start_channel = 10;
-		break;
-
-	case COUNTRY_CODE_WORLD_WIDE_13:
-		for (i = 12; i <= 13; i++)
-			GET_DOT11D_INFO(ieee)->channel_map[i] = 2;
-		ieee->bss_start_channel = 10;
-		break;
-
-	default:
-		ieee->bss_start_channel = 1;
-		break;
-	}
+	for (i = 12; i <= 13; i++)
+		GET_DOT11D_INFO(ieee)->channel_map[i] = 2;
+	ieee->bss_start_channel = 10;
 }
 EXPORT_SYMBOL(dot11d_channel_map);
 
-- 
2.42.0

