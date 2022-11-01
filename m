Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D4562E;
	Tue,  1 Nov 2022 08:00:19 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id y14so35150875ejd.9;
        Tue, 01 Nov 2022 01:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pc6N2WByL4QbQgv5GSMhUl4Mp2rKnUKtiN0a3NdGTvE=;
        b=aHr1p4OQXdVzHTsMzGg/N6wuF7Ng/8iG0ouhvHE40v2qKRkB5lRhiAheuZ4x3Illc9
         6rh2hgjNlUlfvh/GpasNTdTokvBEwFrKNzs/scNKXBZ8dsWlns+Sufo2AXjRiInj1mub
         EeC5RZG4+a4LS/MEfPhiOYKsFUTwi1sPOQeOMT7X0nKGqKnDGbttqy2C4yjBq3t1iBch
         LdSkvGMriQ8j++A7gV6o1oulxAz7xy70MjymC6Sux5Y8K1j4n0n+a30+/VUGFrWN3Q8f
         pYeb9YwFJpOhwV1VX4uCsHYtXeCY5MBnH2aBY36pR7bNfe6875gBAx++0w4eVg8pyy5u
         EEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pc6N2WByL4QbQgv5GSMhUl4Mp2rKnUKtiN0a3NdGTvE=;
        b=p67/i1Y7lfnwldI8LVKQWb/2Vv1GoEFTjwKQ1uBpL/x2lKfQVojdGrgrSIJ4vTGIHl
         fOOr5rP4vCDWJOZkjlQRpnCR9sbHlqoX/fi7JNsAXqILlmfU0V+q1zay7fBR/jCBy0xi
         UoTYWCpMiYMPY0Cd3eHSx0JKaNoOuDGiFnwh52IG66IyL7QFWI2LNAcLavczpitYXk1I
         RsCxqX777pDaoT5O/2Ru86zG0xZNufZ7/JEm25xwGR91x7wQY8ThDUn9g2loGr3rAG+A
         hm4g6E+eSOXmh9NXCuvmujbaYWC3dbsXb6H/taz8Q9r89eVJmAPYvOeMSX5yJkY6S3H+
         +E+A==
X-Gm-Message-State: ACrzQf2PdDWz7bSpDWq0pfnoba5pOyR2I0x/ILqvKU5Hnk4ZcQRWJJOz
	F0LgVq+Yslr+nmwGqHuIEfD7HJL9UUfxzU40
X-Google-Smtp-Source: AMsMyM4+Bb6FpE6sTTOsuP3xH6vg859ohvm9bRplJONNq3jOS67+jOO4IQv/O8ESB6xLTlbnE9ullw==
X-Received: by 2002:a17:907:7f07:b0:779:7f94:d259 with SMTP id qf7-20020a1709077f0700b007797f94d259mr17460230ejc.525.1667289617745;
        Tue, 01 Nov 2022 01:00:17 -0700 (PDT)
Received: from rdm ([137.63.146.164])
        by smtp.gmail.com with ESMTPSA id 7-20020a170906318700b00783f32d7eaesm3836965ejy.164.2022.11.01.01.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 01:00:17 -0700 (PDT)
Date: Tue, 1 Nov 2022 11:00:06 +0300
From: UMWARI JOVIAL <umwarijovial@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: [RESEND PATCH v2] staging: most: dim2: hal: aligning function
 parameters
Message-ID: <20221101080006.GA63438@rdm>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

According to Linux Kernel Coding Style, lines should not end with a '('
Fix-issue reported by checkpatch.pl script.

Signed-off-by: UMWARI JOVIAL <umwarijovial@gmail.com>
---

Changes in v2:
    1.Resending this patch because it was sent multiple times earlier.No
      functional changes.

 drivers/staging/most/dim2/hal.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/most/dim2/hal.c b/drivers/staging/most/dim2/hal.c
index a5d40b5b138a..6abe3ab2b2cf 100644
--- a/drivers/staging/most/dim2/hal.c
+++ b/drivers/staging/most/dim2/hal.c
@@ -346,9 +346,8 @@ static void dim2_clear_ctram(void)
 		dim2_clear_ctr(ctr_addr);
 }
 
-static void dim2_configure_channel(
-	u8 ch_addr, u8 type, u8 is_tx, u16 dbr_address, u16 hw_buffer_size,
-	u16 packet_length)
+static void dim2_configure_channel(u8 ch_addr, u8 type, u8 is_tx, u16 dbr_address,
+				   u16 hw_buffer_size, u16 packet_length)
 {
 	dim2_configure_cdt(ch_addr, dbr_address, hw_buffer_size, packet_length);
 	dim2_configure_cat(MLB_CAT, ch_addr, type, is_tx ? 1 : 0);
-- 
2.25.1

