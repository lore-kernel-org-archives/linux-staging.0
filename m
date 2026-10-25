Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792922003;
	b=33kI3W57t7R9QPVl4NQh/7d5vfnCubSV0LgHkzeS86mwA5/j6b04koQ9ZQXaMKo3Ig8J
	 IQfJV7EmSdI4c6yaQHs7RCGBQktYe3FT0/6ETR6I/G8lQAQXsD9Ty2NzcpRCzC5hfeWtD
	 0UEF3uPClENNQuX4oF+tjXuoymB1MHoQSvQRh2d8n/uGrgZLKT9H+cgRnrG6q1i3AxouY
	 P//IUIdreTX/SSIb69IXGoCaPl7Z5lf41rxnds/FcDdj3S59sH546/f/2xg4hG6eVVh21
	 biY2dAg7QuCpWzOgXPzWJD8Rkf9NwX7enBdDyDZO5QspN/u6PrT704anmkHbbT/8gfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792922003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=6PtEA2UtMTqcqVdkWoMV++OnOcpG82BOix7xLgA714w=;
	b=3GCjgSo/R33QsTGAqv4nuzxGd9ICQatJA312nBLsM1Ot1dr3uoLdXpZwkyicDlpkQUBb
	 uv+qO1G5OlDP6lPZz6ueBmlBDTrOz5D3XxEBpjjbyySA/cmn9LrN1xOikuZBF6YuqcUkN
	 1H5Xv0sbc46DNblKDYUcyVgbRIG6dSA7urkfp98zKBMV20l874XO9Njfm15IvgMyjlEpT
	 sUROGRYnS+/rPrwXRljlM4RBh372J4MvxDnGBVi+nBM6pULzTsrPGjElkffFIVwQKSeuD
	 LvBdCVRJFJeTCzjm695V5RJ51ZE5Uz5JqqHJjNmlkGxSUI7j0dTQ04IXUQJ/t1CbLzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q1QAVOsx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF48606A31D
	for <linux-staging@lists.linux.dev>; Sun, 25 Oct 2026 09:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEF48606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q1QAVOsx
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b1aa4d71e7so2205641a12.0
        for <linux-staging@lists.linux.dev>; Sun, 25 Oct 2026 02:53:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792922001; cv=none;
        d=google.com; s=arc-20260327;
        b=qi8vbMQLhPYOVrRlDBccPVJ41rCb/uedn5KE1tV1tncnQ94fNQ/Y1rsX6TdHVHvKSp
         gkf18gnLf7VoErD7pWjch9RgRgFO8TympeNFaJOhscqgTiUo/4jUQuXYs5uV+Yh0KE/4
         G5zZzx3XXOyTizrsR0vHXreoO3InfKj/lV0Zm7zpW7QtEkcgLYbk/jvGVTmbaVnxO2gx
         R5fMEQ0x9+72k2XanhMiOmYoqH2nMB0/E6WxyRktUxvLH0/vcm+kXT4Uv7QNf8Vln0qX
         DEeJEdd3NOlQQPQA8jYiupVIIiX8fSs1JfuqTfMX4/9mQzZXt3oHSjxsBwS/A+jN/Qbi
         k2UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=6PtEA2UtMTqcqVdkWoMV++OnOcpG82BOix7xLgA714w=;
        fh=91bB1EKvbx/yYTynwrOUwNSqYGOsGXe7iyn56Qzd/Dk=;
        b=KbBYolOXDp+dP0t2dpcGo6J6MV/vrNB0AYws0bqxU+SOQIZmbcA3bBvli/Kicv/Avx
         dmZmKfvFNjpS//a3p5Mrr5cxgnvWaCSjX/FzRwM+FzmPKlKQRNLYUgHRfyI1kSr3pLJV
         xMBIP43naCN3cmzlBmxZ3YVJ7moOeQbl8DwyMj7WBgKJjdcTwwsRpdjS6t+Zius631hj
         FoH5denfrJSnMwH37ldwHfYJOB8PvCWkNJJzDK66TMSgjRB+pul46qPTnNix3EWDv4T9
         RfgIOIxjWtSBzlAzkUil8eOXWunUWZN0rKHmB/ST2WLZK2fbtYohpYxs/q9LziogymEC
         2Szg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792922001; x=1793526801; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6PtEA2UtMTqcqVdkWoMV++OnOcpG82BOix7xLgA714w=;
        b=q1QAVOsxJI2rkuJ1BWMjyxePsP7YBS4jBxUbuNDzYcfR1wPNoyBOedgyA+GpXOIQBz
         tyQ91Q+8m4ZjDR8czFtTzgXl3ZUnnKkq7qCSU956+bKqFLoPS1MWY1Q1/BkC3NBN40sc
         79oQfrLt1L2nsIvDDGoFNa/3LQ5ko/i7LVZ2KBUshn0P4hDhogwZB4mt1O+HZd33NUm7
         0Sy3S0DUicLr9R7u1CYSlqBFk2XeTYv/31TCm3T2jmK/DDZ20IeCiCugIBQXPKpSoMut
         dLtRumvJdbbMTdEdkxVGXbSuIz/lTjT5wOYqP3ezcdLSYeOzzt4jMw4eUi1209ZLNbNB
         zxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792922001; x=1793526801;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6PtEA2UtMTqcqVdkWoMV++OnOcpG82BOix7xLgA714w=;
        b=bR6V9x2gSybTnJL4LcCzDikAuMrvQUct3EkookToIpif2VzJWBHnz33tMTBWG3BvcO
         ydGziTlj96B8p2viyjBhyi7EkbXpnSzah+PM0eApW/JEEYrC3Fpg6HCfnPXMBxTNfcuO
         qJL8tL8sxT7GU7+ZnuN+U8I6THgn+5xo375ZY3cCZTHwiLaMCzM7wEqRTYhegYrugfAO
         C/I5Sa5c9PUm8IKfHPMTONvR+W871038YS06dTbiylouYTNkD1Bctg4q4Iv90FvZO6nr
         5vbZgMX0/ntEQcFE8leebd+Rpwugn21uz1tEwEz2fjdfyK/2InQ8NNa+bor6Xo+ZCfb/
         lpYg==
X-Gm-Message-State: AFq9FYIZ/TXj+pQo+fd93MRktDcSV9lAJ/SRUwzwx1Pyr010yxQCx3x6
	iqhL2AwoNRatXIbTfhY90b4dlHkiCc7Jb/2HIME7drjB+7/yr72InqunqiUHWhNbfClc0NbCeAa
	tlwWfbExtT6ZKuw27w120ZQ1PfGE7W1A=
X-Gm-Gg: AYBFou3sr7Y6jWJJWvX/yyoWqok9pqMCcffa4ZzNgwtpBroVsgNMXwCKoL+cHYO/COp
	ObKAvvPOkHBrV0HAKOsu63dtJ3TypZWM0SBc5qC244CSf/xO0FKbkUYZBjSB5PPlkMj2KKlVoBw
	LbetYlKOfME+ghE6sVu769HQX6rGid6FT4Pt0Xchgty7pOKMeZCkQ2XFZtL6xMiMrXpiyuT6Z57
	1kEtWH0bdyGhAEwBDsQpYy+QXocHJz9XbNOgnACHUXTMaX/5KhcCEFCjzWubE/Dt7nJPaejxSEG
	OODuf+0PJBLN5xXOjv/Xk3Cu/QouVYUqbI7E87QQEfOrH49g9Z6rUOfq88exgsr9B86kISwXfew
	DyCVhUX2lpWnIXEzFXjOHfMqGn9fZTBje9S/mwzbe2xgFPURqqvn3fHETZ7vQwDotso0=
X-Received: by 2002:a17:907:9d1a:b0:c2e:2d8c:4585 with SMTP id
 a640c23a62f3a-c46bde8a1f2mr445903566b.36.1792922000889; Sun, 25 Oct 2026
 02:53:20 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Abubakar Musa Samaila <abubakarmusasamaila@gmail.com>
Date: Sun, 25 Oct 2026 10:53:07 +0100
X-Gm-Features: AclHuK_xZzMIUgzgDxUYS0S8n_we1GNSKAQQHoI-f2BeDz1YvWNvfoIENaxJN_0
Message-ID: <CAHxSwT_ya=kxLdQkx5iY6DdVbxDv9MP5shRUF5-yDUvM=cFpKw@mail.gmail.com>
Subject: [PATCH v2] staging: fbtft: fb_upd161704: Replace udelay() with usleep_range()
To: andy@kernel.org, gregkh@linuxfoundation.org, outreachy@lists.linux.dev, 
	julia.lawall@inria.fr
Cc: linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From 778030aa9291e3a7d40ffb03b19e6877041cddc8 Mon Sep 17 00:00:00 2001
From: Abubakar Musa Samaila <abubakarmusasamaila@gmail.com>
Date: Sat, 24 Oct 2026 12:02:25 +0100
Subject: [PATCH v2] staging: fbtft: fb_upd161704: Replace udelay() with
 usleep_range()

Signed-off-by: Abubakar Musa Samaila <abubakarmusasamaila@gmail.com>
---
v2:
- Send patch inline in the email body rather than as an attachment.
- No functional changes to the code diff itself.

v1:
 drivers/staging/fbtft/fb_upd161704.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/fbtft/fb_upd161704.c
b/drivers/staging/fbtft/fb_upd161704.c
index 7288140e7..94ae5bbf0 100644
--- a/drivers/staging/fbtft/fb_upd161704.c
+++ b/drivers/staging/fbtft/fb_upd161704.c
@@ -32,27 +32,27 @@ static int init_display(struct fbtft_par *par)

        /* oscillator start */
        write_reg(par, 0x003A, 0x0001); /*Oscillator 0: stop, 1: operation */
-       udelay(100);
+       usleep_range(100, 150);

        /* y-setting */
        write_reg(par, 0x0024, 0x007B); /* amplitude setting */
-       udelay(10);
+       usleep_range(10, 20);
        write_reg(par, 0x0025, 0x003B); /* amplitude setting */
        write_reg(par, 0x0026, 0x0034); /* amplitude setting */
-       udelay(10);
+       usleep_range(10, 20);
        write_reg(par, 0x0027, 0x0004); /* amplitude setting */
        write_reg(par, 0x0052, 0x0025); /* circuit setting 1 */
-       udelay(10);
+       usleep_range(10, 20);
        write_reg(par, 0x0053, 0x0033); /* circuit setting 2 */
        write_reg(par, 0x0061, 0x001C); /* adjustment V10 positive polarity */
-       udelay(10);
+       usleep_range(10, 20);
        write_reg(par, 0x0062, 0x002C); /* adjustment V9 negative polarity */
        write_reg(par, 0x0063, 0x0022); /* adjustment V34 positive polarity */
-       udelay(10);
+       usleep_range(10, 20);
        write_reg(par, 0x0064, 0x0027); /* adjustment V31 negative polarity */
-       udelay(10);
+       usleep_range(10, 20);
        write_reg(par, 0x0065, 0x0014); /* adjustment V61 negative polarity */
-       udelay(10);
+       usleep_range(10, 20);
        write_reg(par, 0x0066, 0x0010); /* adjustment V61 negative polarity */

        /* Basical clock for 1 line (BASECOUNT[7:0]) number specified */
@@ -60,7 +60,7 @@ static int init_display(struct fbtft_par *par)

        /* Power supply setting */
        write_reg(par, 0x0019, 0x0000); /* DC/DC output setting */
-       udelay(200);
+       usleep_range(200, 250);
        write_reg(par, 0x001A, 0x1000); /* DC/DC frequency setting */
        write_reg(par, 0x001B, 0x0023); /* DC/DC rising setting */
        write_reg(par, 0x001C, 0x0C01); /* Regulator voltage setting */
-- 
2.34.1
