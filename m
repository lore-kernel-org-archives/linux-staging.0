Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198D21374;
	Wed, 26 Oct 2022 13:28:52 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id o4so18110856wrq.6;
        Wed, 26 Oct 2022 06:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BQjuqzUbSlDqvGhbLmWueKhvNccMA5rF1ebwhNIRC8o=;
        b=G1//KcT6j5z5YfC3wUevGXsdon0yVPojTloeyZWcGQUIBIpxrMzrrmxlKdUMgcoZCC
         Vzjun/6shaKnwzglVWT5DQi/RVTo0SXYUWk165DbwchhlZtG2EvVyC1aOY8hJeIqoWnt
         5dbY0P199x+Dg8MlAcNsjsZFpyvpkuQ2yMUlMEp7FMZaRw+drjxs+/DDwmBTek/dpYQ7
         T+q4dVQXQ7SfjsX19UaZLQt1ZRGkq0mhQiQrRRvOI0ZT2n/Ia9SuW0k/gnxhNKdEs70u
         KKk03DLDus9d0JECKciycUKSEw1dP94wsoJ6Dw2+/HVFhj7eDLfckwDW03CRjrdDvbFE
         UbSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BQjuqzUbSlDqvGhbLmWueKhvNccMA5rF1ebwhNIRC8o=;
        b=N27AIcdiqpMCc+rBQwiGKVI/ZiiYNYiH8a/TmYuC9EKIYPXfR3kgkfkJeaIzXhzzGK
         4GaJoH/tWrAZjV902TFkuC4bokrWOh8fR18BDPHLpRKb0RDa4CB069P1HIsVXAhYW0/2
         RTbpSVyrm2NIqfigrlwAe52qQpTHIKt9j5LBsPegIiQyjkmXte5NGRmacJBYd19Wyg0T
         0GlyfF7tTd0cJqIFYBkyM9cpOrTqTdDs84TiWJ+reCdcxKuterJFHyeWXrDqzXuCR4Ih
         Vd3KOamiEgwdhWrscKTC3XxYSsFVdZSm1mdA4iTchwgNcOcgJWWfsa6Kqrnp2+nnrPeD
         2fwg==
X-Gm-Message-State: ACrzQf367yaIU3t0aCYSfQillvnMhmzIuEvi+zzT8286Cv183fDAA0tR
	zwU++dkGsXI6/YwyqIhFeLGAD7hqjqhAimq6
X-Google-Smtp-Source: AMsMyM78UzBXXIbb9unvFZjujdL/F1OC0cQ2qXXhpRfAXkOjGjJNAIPF9DIUo7PeTAW2K3bTJo03Hw==
X-Received: by 2002:a5d:42c6:0:b0:235:1b3a:8d2e with SMTP id t6-20020a5d42c6000000b002351b3a8d2emr23154184wrr.689.1666790930423;
        Wed, 26 Oct 2022 06:28:50 -0700 (PDT)
Received: from rdm ([41.75.188.129])
        by smtp.gmail.com with ESMTPSA id 24-20020a05600c021800b003c6c2ff7f25sm1842410wmi.15.2022.10.26.06.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 06:28:50 -0700 (PDT)
Date: Wed, 26 Oct 2022 16:28:38 +0300
From: UMWARI JOVIAL <umwarijovial@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: [PATCH] Fixed[ERROR:trailing whitespace and braces around scalar
 initializer]
Message-ID: <20221026132838.GA44037@rdm>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Using the checkpatch.pl script, found the below errors and  fixed
ERROR: trailing whitespace
CHECK: Please don't use multiple blank lines
warning: braces around scalar initializer

Signed-off-by: UMWARI JOVIAL <umwarijovial@gmail.com>
---
 drivers/staging/most/dim2/dim2.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 7a5f80e637a0..28259ce05024 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -987,7 +987,6 @@ static int rcar_gen2_enable(struct platform_device *pdev)
 		writel(0x04, dev->io_base + 0x600);
 	}
 
-
 	/* BBCR = 0b11 */
 	writel(0x03, dev->io_base + 0x500);
 	writel(0x0002FF02, dev->io_base + 0x508);
@@ -1084,7 +1083,6 @@ static const struct of_device_id dim2_of_match[] = {
 	{
 		.compatible = "xlnx,axi4-os62420_6pin-1.00.a",
 	},
-	{},
 };
 
 MODULE_DEVICE_TABLE(of, dim2_of_match);
-- 
2.25.1

