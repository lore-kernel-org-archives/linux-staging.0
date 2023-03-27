Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A1BEA3;
	Mon, 27 Mar 2023 12:24:08 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id t4so3357845wra.7;
        Mon, 27 Mar 2023 05:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679919846;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bSN9Ecs9VgPdHBd5DnU/Mgt1P34wB8c/uf3669zchqk=;
        b=UsozCZrqIdoaol4lsXeG6Jm+fEgT2eIoHwmPfbkhHu60pYddYnrGELrNj1HM16VO+g
         0VN25oOSeZkqv+Hu3w+i2vQLWz2f3sg0+zUfS7wRrFIA8riP8pcogE6cJkmeQXdKvZaq
         lshsdJbAYQWg9U4GfIh7vlX1Ns9/q30KoaujAEnVjQz2l6EcV21uCqoLbxfkDapZ3v21
         6dZh9/nq2oLXkDjurwy0B06V1qGbqMp73x3uKoedFJ6b70VBP15kVuNSNa6hN41rTjO8
         shSZupws5iDXSHKpEdTl+LpxUyyTrFmh01bL3urp/TTUdRq0xesowqqTlw28UrJv2dj3
         aJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679919846;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bSN9Ecs9VgPdHBd5DnU/Mgt1P34wB8c/uf3669zchqk=;
        b=6ZHLw88ZSL+Uyx51p0Q3B4EKzvSE5+sJVDhioOz2QQm9+O1vVJWZD41CBxH1ztZl+o
         s/GVwPn1qiki7d4wxqHWJRF8bUDcOE2OT5wg7+QGo7ryTDKDtYWhnPKHSB3zoBJY4Y7q
         pv9T10gIeMoye93CS+aNjGJjygAJTXlbXgWmHGV9k63lti4jg2y1miD5QNmd4oPbNITW
         BOIBzZAaPHQ29e7UplUur2SJGK9coTmgGrFT/d+ZiysiI9sTUuNhJT2naxWGDdzeVr7R
         Ns/2wQJ0JgZls6lZ1nK01dh45L0Y7tksPlWcJs3IUWCCx3cLeCI2KX85EKUf96AC3dBf
         Hnww==
X-Gm-Message-State: AAQBX9f9iMY33oIUegF66/QYtqiW/SFkdEXKW2LffTEWdk5ypV6pn9la
	LGHulY/MHrPzw/3K3PxxOx8=
X-Google-Smtp-Source: AKy350Y4+SmDaAw0i4BZZuuGJw+65kINTLrCwALVgm/y45Sj0LIANiuD5QhZrxawSRu+H/4ReKGB9w==
X-Received: by 2002:adf:d849:0:b0:2ce:aa2f:55ff with SMTP id k9-20020adfd849000000b002ceaa2f55ffmr10455838wrl.1.1679919846201;
        Mon, 27 Mar 2023 05:24:06 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id n16-20020adffe10000000b002cfe63ded49sm25001223wrr.26.2023.03.27.05.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 05:24:05 -0700 (PDT)
Date: Mon, 27 Mar 2023 17:24:03 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: nvec: replace udelay() with usleep_range()
Message-ID: <ZCGK4+zUDT1lLz6s@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace 'udelay()' with 'usleep_range()' with 1000us as upper limit.
This issue is reported by checkpatch.pl script.

CHECK: usleep_range is preferred over udelay; see
Documentation/timers/timers-howto.rst

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/nvec/nvec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index b3f114cb00dc..1b51935dba4f 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -627,7 +627,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 		break;
 	case 2:		/* first byte after command */
 		if (status == (I2C_SL_IRQ | RNW | RCVD)) {
-			udelay(33);
+			usleep_range(33, 1000);
 			if (nvec->rx->data[0] != 0x01) {
 				dev_err(nvec->dev,
 					"Read without prior read command\n");
@@ -714,7 +714,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 	 * We experience less incomplete messages with this delay than without
 	 * it, but we don't know why. Help is appreciated.
 	 */
-	udelay(100);
+	usleep_range(100, 1000);
 
 	return IRQ_HANDLED;
 }
-- 
2.34.1

