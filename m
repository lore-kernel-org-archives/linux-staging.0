Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F017B
	for <linux-staging@lists.linux.dev>; Sat,  9 Jul 2022 10:07:00 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id h17so1307203wrx.0
        for <linux-staging@lists.linux.dev>; Sat, 09 Jul 2022 03:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=S5D5zyYSVc5bYEUxb7MqmQQ/xud6/l4/rKt8C+dOKPo=;
        b=J6xj2JgUG2AXybfK0eo0+w3XOakF/s1IPQBftgOLpHE3Yp/WUvnbPBTVmmde2XZ9c9
         htaxDp+2uKsttpa47BO8sHTnr4cgxk1tS4RO7iIcr4IMzDRDr95p892ZK29FDWxhUN0V
         y4GAT6ZdADQqzzpG85wLdNbOai9fJJOdJ3lWtj4amvleseSmDOKKiwVxIXFRF8I9B1kz
         EIyyldMAoa2K0RQKuJd/ifqmKBUKVsJhc74Xhu32V++xtyTZ62gXqWkp7lpkg2Lix8YC
         puL69MDFPNFAMrxy6MDKrLbp3Zl6da2C1mz9wntQ/aI94bxqSYMgiHvGjVI13Uw1nn3J
         q18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=S5D5zyYSVc5bYEUxb7MqmQQ/xud6/l4/rKt8C+dOKPo=;
        b=zrx7gWuZCY1jXeOqq7XhFW1t+9YI9YKCZOKzXkccbC8m74wu7c05jgZR5vKyju2ch0
         56USkzQedDZBqusU4f9DotbTiRKYmgw+n3CuGKPEIQlfo9uW7j5EvezWHoNjzF/wiOr/
         ZFWp/KaKA6hMGKN9nyGofv0b4sQSCdV1G6ywt3sIbbRAFWp5OXTR5NMZFGaqJkXpP0rZ
         8u+FPS3FXbvQ5zVycFYMQKf8kCSZV/hSUYo8grffocAz590d/Rw/OEWI6URQulJMEH+5
         KeNDw2XFQ6+U/7r0j6fGc+Ch8MnFxGwjgaE2pqnZZRB2/Lv4hdGD9R83hTppOSzHWiQt
         GT5w==
X-Gm-Message-State: AJIora/b6tPuZOtXCzm56aZ2kmdh+gdtO7H0Cs9CoqTQQOBp27+szSU2
	6xdExTu/oyP2oc2wll61Oow=
X-Google-Smtp-Source: AGRyM1tewS4z2taUnVOHwc/upLIlIYpD86273il6dbaFWgZu7U7GIfgnZCxK7zM/oA89WedBCs1puQ==
X-Received: by 2002:adf:d08c:0:b0:21d:768b:c56a with SMTP id y12-20020adfd08c000000b0021d768bc56amr7517095wrh.318.1657361218685;
        Sat, 09 Jul 2022 03:06:58 -0700 (PDT)
Received: from mandalorian.koija ([2a02:587:4ba0:ca00:ca84:2153:48dd:9a6])
        by smtp.gmail.com with ESMTPSA id n68-20020a1c2747000000b0039c96b97359sm1053376wmn.37.2022.07.09.03.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Jul 2022 03:06:58 -0700 (PDT)
Date: Sat, 9 Jul 2022 13:06:56 +0300
From: Christos Kollintzas <c.kollintzas.92@gmail.com>
To: gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: fbtft: replace udelay with usleep_range
Message-ID: <YslTQLhM7GSaGXki@mandalorian.koija>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Adhere to Linux kernel coding style.

Reported by checkpatch:

CHECK: usleep_range is preferred over udelay

Signed-off-by: Christos Kollintzas <c.kollintzas.92@gmail.com>
---
 drivers/staging/fbtft/fb_upd161704.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/fbtft/fb_upd161704.c b/drivers/staging/fbtft/fb_upd161704.c
index c680160d6380..eeafbab4ace1 100644
--- a/drivers/staging/fbtft/fb_upd161704.c
+++ b/drivers/staging/fbtft/fb_upd161704.c
@@ -32,27 +32,27 @@ static int init_display(struct fbtft_par *par)
 
 	/* oscillator start */
 	write_reg(par, 0x003A, 0x0001);	/*Oscillator 0: stop, 1: operation */
-	udelay(100);
+	usleep_range(100, 110);
 
 	/* y-setting */
 	write_reg(par, 0x0024, 0x007B);	/* amplitude setting */
-	udelay(10);
+	usleep_range(10, 15);
 	write_reg(par, 0x0025, 0x003B);	/* amplitude setting */
 	write_reg(par, 0x0026, 0x0034);	/* amplitude setting */
-	udelay(10);
+	usleep_range(10, 15);
 	write_reg(par, 0x0027, 0x0004);	/* amplitude setting */
 	write_reg(par, 0x0052, 0x0025);	/* circuit setting 1 */
-	udelay(10);
+	usleep_range(10, 15);
 	write_reg(par, 0x0053, 0x0033);	/* circuit setting 2 */
 	write_reg(par, 0x0061, 0x001C);	/* adjustment V10 positive polarity */
-	udelay(10);
+	usleep_range(10, 15);
 	write_reg(par, 0x0062, 0x002C);	/* adjustment V9 negative polarity */
 	write_reg(par, 0x0063, 0x0022);	/* adjustment V34 positive polarity */
-	udelay(10);
+	usleep_range(10, 15);
 	write_reg(par, 0x0064, 0x0027);	/* adjustment V31 negative polarity */
-	udelay(10);
+	usleep_range(10, 15);
 	write_reg(par, 0x0065, 0x0014);	/* adjustment V61 negative polarity */
-	udelay(10);
+	usleep_range(10, 15);
 	write_reg(par, 0x0066, 0x0010);	/* adjustment V61 negative polarity */
 
 	/* Basical clock for 1 line (BASECOUNT[7:0]) number specified */
@@ -60,7 +60,7 @@ static int init_display(struct fbtft_par *par)
 
 	/* Power supply setting */
 	write_reg(par, 0x0019, 0x0000);	/* DC/DC output setting */
-	udelay(200);
+	usleep_range(200, 210);
 	write_reg(par, 0x001A, 0x1000);	/* DC/DC frequency setting */
 	write_reg(par, 0x001B, 0x0023);	/* DC/DC rising setting */
 	write_reg(par, 0x001C, 0x0C01);	/* Regulator voltage setting */
-- 
2.20.1

