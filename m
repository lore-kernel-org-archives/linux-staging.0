Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50741C959;
	Thu, 23 Mar 2023 19:56:16 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id eg48so91429101edb.13;
        Thu, 23 Mar 2023 12:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679601374;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FYRlJa6a2No9s6NXBUhNFjPStBEW6jedBGv/pSig1z4=;
        b=Kn1b/aFaavHDgC7YmWZnNxcrxO9CFUOKs9075y4FhoNL1KBFvc3/MIGFyvHy2D/ES6
         sE3/AUJy5PL5ASYw9TVl27izLDpiAvOB7NqmApmTKKcAfdVx6zTPp+NSr3cA3/0PRfuA
         R8g6ufeoYV0i8AmY02U61BkA9yGQ/ZVugNuxVI/8o373ePYg2AKCWCcwwcBlQmFBENak
         rEcEJP/dUpCXWoJc/03Gh6CQ8oSyWZOj6WPy4P39JwCRl5C+pXuIn+OhSdbymmzVgbmL
         HAj4fbDKeFvSQm7E2cAZ7MUmXgYU18Tzj2TYomdWzdiSwenQFRbavbj5qO0ngSLk4EDq
         UDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679601374;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FYRlJa6a2No9s6NXBUhNFjPStBEW6jedBGv/pSig1z4=;
        b=MW7NUcM4GQQVk3aabvd2E8z40MK6gV3OV46C6VkUF30m6JXU59fR2xfZe5+x2dOBCZ
         +lpTpMd204zVZBYNPKAWLl8M9DIvV1DllF3B2sJuMWq0KeQKp9Z6v38kzMsty1L8u2jw
         1HSx+CXlccRAakFh60vEmKVI7ZP3av7ZRt96lITHA4zr+ZSTPIhEs7/ebmXeQQ0ZDflk
         t+Fvt+Z97UVMZC8ffKgMGh0X6ntRm5rIduhP/7cvSUuN07sBNFPzessqURSkeXIxrxZt
         TIk2fz2YoqO7SRytFYoua4l9oQlgcl7blHnnMhUbczDww/NBObcQFK17D64jGfPmQURR
         vkEg==
X-Gm-Message-State: AAQBX9cwRiBXqhAFnEyIjvh+aBWDir4rsXl8jCbC93tlw/YesvwSWpaF
	WDT7NHDv1oZtUIgMFeTfvGs=
X-Google-Smtp-Source: AKy350b2vWNeXZ5OkAFkp6bZZPQE43kxZ8z04Ds5oz4LW4BNgDt/feaRHXQ8XNXKH0n4yZTPPaHPCg==
X-Received: by 2002:aa7:cf86:0:b0:500:2cac:332c with SMTP id z6-20020aa7cf86000000b005002cac332cmr519749edx.25.1679601374293;
        Thu, 23 Mar 2023 12:56:14 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id q18-20020a50c352000000b00501d39f1d2dsm5147384edb.41.2023.03.23.12.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 12:56:13 -0700 (PDT)
Date: Fri, 24 Mar 2023 00:56:11 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: most: fix line ending with '(' in dim2/
Message-ID: <ZByu29jb1mE3KOsn@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Splitting function header to multiple lines because of 80 characters per
line limit, results in ending the function call line with '('.
This leads to CHECK reported by checkpatch.pl

Move the function parameters right after the '(' in the function call
line. Align the rest of the parameters to the opening parenthesis.

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---

Changes in v3:
 - Changed the subject because another patch for 'most/' with the same
   name was causing confusion.

Changes in v2:
 - Changed the description

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
2.34.1

