Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FC772
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 16:35:35 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id m11so11775853pfc.11
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 09:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=dd20NqXtrojKGrBJQbQ2lRtgUmGNTiUlPe1joyxcopU=;
        b=IHFs8FlI+E2aYsqYZDA/xjPPjwlgQOduLuWNDf2cgPNWnj3Oy9WLA9fUOhEbATI+PE
         Z4s5GySRJjI8+3wsFsACFI+AcdnjHoxdHuJGFguBUBNb4S/0cVWD4oEVq2WkxB8bNalr
         CxQVY/XPBRxFMXyGtcY0lxV0PiKL62F0c/OCpLIsCbrjA+p55wRTDcwGCOMaebnjSuBr
         tz9qcRrCtQT/Fbau2ZEWyqeyBgfSOSs0B+C3L6Qr3TXfkOhkZ/XGh6CAE7y7k86sj8ah
         Dk8Bv4iuEtHja1ussXG+SeSQSxdHCI2SQcq3izqWyGjp8CU3bwRdheVeHOWT0dEfsnzm
         csbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=dd20NqXtrojKGrBJQbQ2lRtgUmGNTiUlPe1joyxcopU=;
        b=jdzMR/Is+KN7DSehYa7XqLvI2DBxUxmcqXDOrvmDB6SFHr9iR9G4ULn3p665u+Ih7w
         7Uql7tNFpb9w9dySCKs4a8qgK4XewBUJti6N3PQOr1ncZLq0xjvZ4K/szA+MMTRorMHx
         CJ4bnJTV88dkCJMLw7Zp6ZQdLoL4mTPpfc77Bu1mPne23acdud+z6sQpuAWhNkwwSCTH
         AzuuCGg4NsKd+cMXT1h5lXxECJz+jdfCqf3cMhx+M7jSdCrYj073gg2AZTK4vB/q8RPS
         Vk1xzzlq3r3sQbtPF/LRLt4XSnTkmSgWy+iUYHPpwHAU+jFhk/mjyPBs4KzXhSoJFNeE
         oC0A==
X-Gm-Message-State: AOAM5313E2pCCQUzD3t2f+haGaHzbiAxttgjNHVhcm864UsnZVkUuV9/
	AtqhrD+QKGoof1XNt6ZePEI=
X-Google-Smtp-Source: ABdhPJzQfoOV1tSHdZTGBisqi78C3nrKplsv/ZKnmC8yl6nptENeS276rzZ7sxyorD4DPW2QPa20+g==
X-Received: by 2002:a62:824c:0:b029:21b:66f5:c813 with SMTP id w73-20020a62824c0000b029021b66f5c813mr29926041pfd.32.1618331734483;
        Tue, 13 Apr 2021 09:35:34 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id v11sm14904582pgg.68.2021.04.13.09.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 09:35:34 -0700 (PDT)
Date: Tue, 13 Apr 2021 22:05:26 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: [PATCH v3] staging: media: zoran: reduce length of a line
Message-ID: <YHXITpUbYOb2lO/u@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reduced length of a line which exceed the 100 columns limit by splitting
the line into two statements and commenting it with '*' to meet linux
kernel coding style for long(multi-line) comments.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---

Changes from v2:- Rebased this patch and made changes against mainline
code.
Changes from v1:- Made style changes according to linux kernel coding style
for long comments.

 drivers/staging/media/zoran/zr36060.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/zoran/zr36060.c b/drivers/staging/media/zoran/zr36060.c
index 4f9eb9ff2c42..27eec3446592 100644
--- a/drivers/staging/media/zoran/zr36060.c
+++ b/drivers/staging/media/zoran/zr36060.c
@@ -249,7 +249,11 @@ static const char zr36060_ta[8] = { 0, 1, 1, 0, 0, 0, 0, 0 };	//table idx's AC
 static const char zr36060_decimation_h[8] = { 2, 1, 1, 0, 0, 0, 0, 0 };
 static const char zr36060_decimation_v[8] = { 1, 1, 1, 0, 0, 0, 0, 0 };
 
-/* SOF (start of frame) segment depends on width, height and sampling ratio of each color component */
+/*
+ * SOF (start of frame) segment depends on width,
+ * height and sampling ratio of each color component
+ */
+
 static int zr36060_set_sof(struct zr36060 *ptr)
 {
 	char sof_data[34];	// max. size of register set
-- 
2.30.2

