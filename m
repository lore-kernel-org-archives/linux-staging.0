Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B4C7B;
	Sat, 11 Mar 2023 14:04:16 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id ce8-20020a17090aff0800b0023a61cff2c6so10004546pjb.0;
        Sat, 11 Mar 2023 06:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678543455;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kYqoBUUyzsIk/ss9ywgxsMkPFqWgNfKL1ixz5F8qfn8=;
        b=KuLW6ZaIq2jIlOSyU+lDH80+1cZqTRKsURnlgH7HOJviqbyZQNCcKt29SMXa0CuYdp
         AbvvDznDDdg3RDoiN+1yFq9o7CNi6Cse3kDjff/w8cIaFUkaeNFmtjgA7QaNDuGsXwMl
         vLjDkubrR853/pBK4v0gi4QHUPWZ2vtg6QpJmVjpfWFK3J58iSGMfwia+4GdpAVL+ILa
         mCBmGqwGSqdzTc+kIe1eF2eHtgYyT0MPYWxT8rn5YawwAJuRumCxq5VRsUOYn5unrwK1
         oeda246IfeqPw63cCWokkG7iQJpEv2KnXfCuLRsJmxb8fRS+9Clb7TRIMgJaKt0TtPvs
         fXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678543455;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kYqoBUUyzsIk/ss9ywgxsMkPFqWgNfKL1ixz5F8qfn8=;
        b=NCBeia08oleEXTTG83HTvKAzZsoFr7H6hGFpBDdnOoeUKpny630IKLRY9zSltTm6mm
         3h/OKBHorTlYJA05fTSyFBrbSaXEia+X5GOY5Su9eoVVh9i5dgqapeuMRoCLsD/oPfKo
         KHbKcp8G1xUynC+p++BHxrw2P0mUqvYw1dIU9hT4dF0wgbMTiW/vh8kXKqXmy8eg6QkM
         IU+HiRk1tHpFbFJPilmH1+pTMELfRl84MzLWdzZSGjmiM4vwUN9fwzN4NfpCdNEkVUs7
         TOQxAWbAhvlPKI2WOEGkPm0oZWvBb3InVNmLXZgR5xvyJAIJxGkLl+okzwXGFm5nkiUF
         7XYg==
X-Gm-Message-State: AO0yUKVE7Z5oKI4lRAUFh9BbL1Q4zTT+vpw5xidoOwoyJQ71xjClPany
	E/UEZ2xGbIlI2mNTIKrUOzvPqHyam5JJ7Q==
X-Google-Smtp-Source: AK7set+5gcskv9cOYnEoWY0Belgr0Oa8Cx7t4Z/HyjU8BwbL/Lb8ms/J+2WRyYx9/NfjFQiS/aDMAg==
X-Received: by 2002:a05:6a20:3d26:b0:cb:c276:5879 with SMTP id y38-20020a056a203d2600b000cbc2765879mr31859030pzi.32.1678543455193;
        Sat, 11 Mar 2023 06:04:15 -0800 (PST)
Received: from ubuntu ([117.199.152.23])
        by smtp.gmail.com with ESMTPSA id c4-20020a62e804000000b005a8de0f4c64sm1545649pfi.82.2023.03.11.06.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 06:04:14 -0800 (PST)
Date: Sat, 11 Mar 2023 06:04:09 -0800
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: outreachy@lists.linux.dev, manishc@marvell.com,
	GR-Linux-NIC-Dev@marvell.com, coiby.xu@gmail.com,
	gregkh@linuxfoundation.org, netdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: outreachy@lists.linux.dev
Subject: [PATCH] Staging: qlge: Remove parenthesis around single condition
Message-ID: <20230311140409.GA22831@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

At line #354 checkpatch.pl:
CHECK: Unnecessary parentheses around 'i == 0x00000114'
CHECK: Unnecessary parentheses around 'i == 0x00000118'
CHECK: Unnecessary parenthesis around 'i == 0x00000140'
CHECK: Unnecessary parentheses around 'i == 0x0000013c'

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---
 drivers/staging/qlge/qlge_dbg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/qlge/qlge_dbg.c b/drivers/staging/qlge/qlge_dbg.c
index 66d28358342f..b190a2993033 100644
--- a/drivers/staging/qlge/qlge_dbg.c
+++ b/drivers/staging/qlge/qlge_dbg.c
@@ -351,10 +351,10 @@ static int qlge_get_xgmac_regs(struct qlge_adapter *qdev, u32 *buf,
 		/* We're reading 400 xgmac registers, but we filter out
 		 * several locations that are non-responsive to reads.
 		 */
-		if ((i == 0x00000114) ||
-		    (i == 0x00000118) ||
-			(i == 0x0000013c) ||
-			(i == 0x00000140) ||
+		if (i == 0x00000114 ||
+		    i == 0x00000118 ||
+			i == 0x0000013c ||
+			i == 0x00000140 ||
 			(i > 0x00000150 && i < 0x000001fc) ||
 			(i > 0x00000278 && i < 0x000002a0) ||
 			(i > 0x000002c0 && i < 0x000002cf) ||
-- 
2.25.1

