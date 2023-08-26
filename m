Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46CDD2E5
	for <linux-staging@lists.linux.dev>; Sat, 26 Aug 2023 15:16:20 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-57358a689d2so634788eaf.2
        for <linux-staging@lists.linux.dev>; Sat, 26 Aug 2023 08:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693062980; x=1693667780;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SfmfX8y4suuxxYB42Bu/PClc6bkVL6Z00B4RiTnt8xI=;
        b=L7LnsOgwWbNlgsGKgh1RQjFFH4TkfEIgREvE+uQ+9fpjbxljh2PaFgQYCbzTXFr7Fs
         e8PFAuz+LpjHsQ0F+IfUyGCTtgO6pLKLmJmvopyBZe259yBxZOSFYTLpP6opR+xV1KTY
         UIRu/nj0e+3rBuxPWk9vuvwQ+jeXANcdATyh6mCqoY0BX/ll+B1G6idTmxUSSYex3396
         PeAAPyLz/KIWLZcfkTLjZO6/YxnXFDaDpcOYFgPA7hc90W25Z/2JVQaEX3Fg2VB2Hth3
         ZDEGskg8GiruTcPm2uXSEnfqMiazVq9/ygZFK8q8NqNFkRxjFDkG/mw+ShghoVJFgmCy
         AvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693062980; x=1693667780;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SfmfX8y4suuxxYB42Bu/PClc6bkVL6Z00B4RiTnt8xI=;
        b=MTFXDWfCrB4xRGXly6eORDCubw1iRtEGgMG/rMnhN9C/2RY1PGJd5v4QDLAaQju9nV
         6JB6P8ALTp5wJjpbDT45dEAKai5zac2QAAWzctMsB4f9HRxAUxbmESv9gKqHiKhLQbCU
         SUxozkvG8L2Zts46VRpdhOWZEn2/h9wVYkHIkk6ZSzv0900Gvz/y9xO07PeedkFoGO57
         e3YntLWd8LALum6e41ajR4ynXu5whHtJwT/SrcqYi9IwzL7/FRwtiTKUj7/FTN4cG632
         1iSwYzX7hlyWyHCIHIGnBdfOWc7iL0NiKyX+VRPKCsrFJ4QBflchS7j6hZsq3dgzwKvr
         Ru3A==
X-Gm-Message-State: AOJu0YwmyBboCnneY7I2Rl4e4dk1OuuPXHclo+jbC8OZkjDcERqB0mnX
	8hicSE7pS77PbKjHYULACRA=
X-Google-Smtp-Source: AGHT+IHnoQkuq2Dxh/yd+t9QK4MX/uUIiw8dD8tvrP054uia23peRbBDWmfv9Wu08d298DuPJZQz2A==
X-Received: by 2002:a05:6820:41:b0:56e:5a8e:654f with SMTP id v1-20020a056820004100b0056e5a8e654fmr7898675oob.8.1693062979763;
        Sat, 26 Aug 2023 08:16:19 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:82ea:8c7c:b784:3f92:988a])
        by smtp.gmail.com with ESMTPSA id c206-20020a4a4fd7000000b0056e9ffefee9sm2103688oob.3.2023.08.26.08.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 08:16:19 -0700 (PDT)
Date: Sat, 26 Aug 2023 12:16:13 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH v2 2/4] staging: vme_user: fix check lines not ending with
 '(' in vme_fake.c
Message-ID: <ZOoXPVHQInOz4gfh@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed all CHECK: Lines should not end with a '('
as reported by checkpatch to adhere to the Linux kernel
coding-style guidelines.

Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
---

Changes in v2:
- Fixed summary phrase with tags to indicate commit order
in the patch series, noted by Greg KH

 drivers/staging/vme_user/vme_fake.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index a88d2c8a785b..dbaf050f88e5 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -403,8 +403,7 @@ static void fake_lm_check(struct fake_driver *bridge, unsigned long long addr,
 				if (((lm_base + (8 * i)) <= addr) &&
 				    ((lm_base + (8 * i) + 8) > addr)) {
 					if (bridge->lm_callback[i])
-						bridge->lm_callback[i](
-							bridge->lm_data[i]);
+						bridge->lm_callback[i](bridge->lm_data[i]);
 				}
 			}
 		}
-- 
2.41.0

