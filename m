Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779696;
	b=Af810IdSsS6KCFAkz9p/+7qkLZRxOHqBdL4FBgUJ8c4uIp0zbFzcXNnnfdIVSew/i9gH
	 NvwmuI8nXUXQwznpe7avkTv6OmnvH2ypaUqOmVyaDSQTeolSQAyLnSbGXVH8Q8ktWz73r
	 Rlq86ySB4ZEzjUdceBqNiBhJHsc9c1Dg16v9mc1yHReJMBJxsiI13cr4QOzTlyeb+olQq
	 4P21WrJKBLykuHo43j3X9iBlq9Kv1uP8ACkGpYXF9m9YdlI06ScDuF637GipRfHefoXK/
	 xTo25AoQ+o9ZZUrtS5OywvMsoKkftb31CJ/ZiFgJbKBYrE4MW/Ch76cT1zyZmbOkO7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ll+dYl6IjHGgVeB0nKnh3CO9OrbX/VIAlSchVwuRn28=;
	b=UzR6URdUUxyyMIorTtPvM523OKQFqUAIzB7QG+p3uG/dFyh4yAOO2zKZOCGaYZSsWNVC
	 5FMJkPVxZLYO3sR5/8tLMrbe265e3y65G5P52QBORmuBqCIvw6EfPDO1eoRRdq1/W5L56
	 WZrguyxM/efhr81XNXdoKWLiLnjvy3SqXhRfA7LP4tLt/btPObYtUWfmVNC5kkUSSRWlA
	 tLciyG83Tu8ZFFt8imf5rL7IBmoM6wATqqZcHaluMlvBtcR54E/TcFI/FsTtJ9EqpZy/M
	 7LlR/HY49jEpoltpTOZB6RDi9R/lwTY3Ze5w45IVA3IeZjA6XIx2NPXxNVAc5sqN6VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sBrzvc4M;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE0E606A32F
	for <linux-staging@lists.linux.dev>; Sun, 15 Nov 2026 21:54:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFE0E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sBrzvc4M
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so16393745e9.2
        for <linux-staging@lists.linux.dev>; Sun, 15 Nov 2026 13:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794779694; x=1795384494; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ll+dYl6IjHGgVeB0nKnh3CO9OrbX/VIAlSchVwuRn28=;
        b=sBrzvc4MUMTTMCw7PdD6jTigZ3mPLagei/xI2nq/oRem0Eg83X0oDHHkLwyGwq7bya
         aVHDEypl0c1wLneHnaqaQrplN/200AIHIICPTqk5fr6DxK9c1Mxn4eEMniCdvAx1tFML
         LYg6/lSuc61EhGw96YZis5E0XZXxaV8fup/uG1DXl/4gbf6bcK+5Rw+x+O6CShImYDXL
         sISNpsLnEV+M/VSAcSqLo/1/4vR11zEpQYRZF12Pvxb5yY0lGTj7aslc4Zfg53ZzHVBs
         L3nlSzIdYtv1rBojsSmbuSXdzFAlNlW3Wyu4i78Pgr5qwktC+CQ9srG/xthN0szu2rrm
         QqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794779694; x=1795384494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ll+dYl6IjHGgVeB0nKnh3CO9OrbX/VIAlSchVwuRn28=;
        b=t6jt1lqQW4iLtDigZaiTb/jMekHsTfLpW1Vo1jWi1VPWSevel22nb6L/kEiynHz9u9
         BhIvA/NyiEmreyNRa66IqcLeDJSJSvfPTyxiN/ANm4dmrCPL+JZMjYSijUwhWgeT21/A
         bN0dm39lLZ4AF4Qih1x3tHXwVzJq7Cd20FvhV5gmlt7eYK94LgRKh3qfJd/O2+mVw7XI
         amZ8kWLMwmbK0c6MrBeIJDmHztfMbB4ugzj4YBhGRZDGJ27tNxK7+Lm65ixaiiLu++TB
         9B5JYjt7Vu6ldqriJemhT/SPQhr6rwTHm7txfyG+vXUzuf/KMhyEaGEOtbRVG0ev5rdR
         7yrA==
X-Forwarded-Encrypted: i=1; AL+hErG4nkuAQcLxrR1lsQ3r7KSO9+lS6cOBDvQZj+5og5NzlsuYBOPfV64ngJai+F+krySVmZ8RGog7KS6TCj0f@lists.linux.dev
X-Gm-Message-State: APuU4Z9R0+VL/Nq2oNodWdHBn7o/zg401cZxaKFZJ6Tfxf6rro8epf7U
	WV7M9aeYDDb43UzmBS7Hg/qtyGeWPmx3kOTHkxO/lcVdWXqs9D316klj
X-Gm-Gg: AYBFou1A4wGB+LdECVvfVs8+0mrCyGm5xOJvmThu6YUnjkI5hb+BMVPQNmlPJqIhwQI
	X1c5YLnwtrPl2zeIXRIQwNASx8ls+xUJ+sw0XbCSG0GVq4Afec+uh9GL1ea39aNexkug7izr5wl
	7R5+8o0nMsAWMJAEGf7hlzqoTp71HL1EA8C3jcnilE3a08ufw6itbWZL3k2rF8aaDzV9J678uJ3
	60yDp97kR1vfEnu5hH0G7sXih9NzZrp1SX87dMENxTJG+d9n33/Uws0obqeJVuDZriz3BZgluiH
	zKn3cH2qVx+xxTlu9GFzIrxLsYp2xr1tDFswexPz+ZZqE9EpMDzMpge4fwKC2TAwZzHOgC1PNsl
	Jgp+Q674RDF+ofdgsnnuQv/W2BvbvMl95ugZAkizr5soDZUKvmi5r/hmtiXP9R67jrkidtzTRt6
	hnO11P1L9ln0t2xY+KWBg3JnBEDIO0VBTL9z70lVEd1pQ8luhj2u54NSLBsRZP/Bo+IlHez4Lar
	GkIEvkusbaC23qTB0ruPaUV+j+aZ9aFYjD1gQt2U3GoRFoReyRb5cJQhjFbFY6xiOGbOYxuNpZv
	o7zF1xYpWU26paTZpLfLJM2vBYdyxIgJlV/Oh8EqwcmdkFXBTcWUQ1O9HptZ4si7pu+iSPa9Xx6
	T/HP6TDOW6a6rMg6GZhvKZdMKFBLuhgVQxD17t2IEJPJSxim0Vt4g6u+DQRKEX4ZU3CZ3EalR5e
	WG
X-Received: by 2002:a05:600c:5617:b0:4a3:12fb:1ef1 with SMTP id 5b1f17b1804b1-4bb55a71035mr134809435e9.29.1794779694189;
        Sun, 15 Nov 2026 13:54:54 -0800 (PST)
Received: from leon-mainpc.tail82c8c6.ts.net (77.119.194.237.wireless.dyn.drei.com. [77.119.194.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d673ce75fsm12553145f8f.55.2026.11.15.13.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:54:53 -0800 (PST)
From: Leon Pelzmann <brunonick1801@gmail.com>
To: gregkh@linuxfoundation.org
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Leon Pelzmann <brunonick1801@gmail.com>
Subject: [PATCH] staging: sm750fb: remove ineffective sw_i2c_wait() busy loop
Date: Sun, 15 Nov 2026 22:54:27 +0100
Message-ID: <20261115215427.112315-1-brunonick1801@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sw_i2c_wait() is meant to insert a delay between the bit-banged I2C
operations, but it only consists of a loop that computes a value into
a local variable which is never read. The loop has no side effects, so
the compiler removes it entirely and the function compiles to nothing.
With W=1 this also triggers:

  ddk750_swi2c.c:95:16: error: variable 'tmp' set but not used
  [-Werror=unused-but-set-variable=]

Remove the function and all of its call sites. The I2C timing is not
changed by this: the object code of ddk750_swi2c.o (x86_64, gcc,
allmodconfig) is identical before and after this change.

The W=1 warning was found by building the driver, and the change was
prepared with the help of an AI coding assistant (Claude); it was
verified by comparing the objdump output before and after the change.

Signed-off-by: Leon Pelzmann <brunonick1801@gmail.com>
---
 drivers/staging/sm750fb/ddk750_swi2c.c | 34 --------------------------
 1 file changed, 34 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750fb/ddk750_swi2c.c
index e63f3b00ec..e298bf3128 100644
--- a/drivers/staging/sm750fb/ddk750_swi2c.c
+++ b/drivers/staging/sm750fb/ddk750_swi2c.c
@@ -75,31 +75,6 @@ static unsigned long sw_i2c_data_gpio_mux_reg = GPIO_MUX;
 static unsigned long sw_i2c_data_gpio_data_reg = GPIO_DATA;
 static unsigned long sw_i2c_data_gpio_data_dir_reg = GPIO_DATA_DIRECTION;
 
-/*
- *  This function puts a delay between command
- */
-static void sw_i2c_wait(void)
-{
-	/* find a bug:
-	 * peekIO method works well before suspend/resume
-	 * but after suspend, peekIO(0x3ce,0x61) & 0x10
-	 * always be non-zero,which makes the while loop
-	 * never finish.
-	 * use non-ultimate for loop below is safe
-	 */
-
-    /* Change wait algorithm to use PCI bus clock,
-     * it's more reliable than counter loop ..
-     * write 0x61 to 0x3ce and read from 0x3cf
-     */
-	int i, tmp;
-
-	for (i = 0; i < 600; i++) {
-		tmp = i;
-		tmp += i;
-	}
-}
-
 /*
  *  This function set/reset the SCL GPIO pin
  *
@@ -257,11 +232,8 @@ static long sw_i2c_write_byte(unsigned char data)
 		else
 			sw_i2c_sda(0);
 
-		sw_i2c_wait();
-
 		/* Toggle clk line to one */
 		sw_i2c_scl(1);
-		sw_i2c_wait();
 
 		/* Shift byte to be sent */
 		value = value << 1;
@@ -272,9 +244,7 @@ static long sw_i2c_write_byte(unsigned char data)
 	sw_i2c_sda(1);
 
 	/* Set the SCL High for ack */
-	sw_i2c_wait();
 	sw_i2c_scl(1);
-	sw_i2c_wait();
 
 	/* Read SDA, until SDA==0 */
 	for (i = 0; i < 0xff; i++) {
@@ -282,9 +252,7 @@ static long sw_i2c_write_byte(unsigned char data)
 			break;
 
 		sw_i2c_scl(0);
-		sw_i2c_wait();
 		sw_i2c_scl(1);
-		sw_i2c_wait();
 	}
 
 	/* Set the SCL Low and SDA High */
@@ -316,11 +284,9 @@ static unsigned char sw_i2c_read_byte(unsigned char ack)
 		/* Set the SCL to Low and SDA to High (Input) */
 		sw_i2c_scl(0);
 		sw_i2c_sda(1);
-		sw_i2c_wait();
 
 		/* Set the SCL High */
 		sw_i2c_scl(1);
-		sw_i2c_wait();
 
 		/* Read data bits from SDA */
 		data |= (sw_i2c_read_sda() << i);
-- 
2.56.0

