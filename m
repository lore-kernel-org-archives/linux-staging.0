Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDD732692D
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 06:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770706428; cv=none; b=B5YDctIhI9xNgRE457enVAYbsLcYHFKfyEC7Ibr3rWUAuXzI51Ai2Wzak/QAWOw6JkGoD+mlla6+DBQBIpQDqtdAt1lBPJh+wsHFQCaVxEUAK/+q/BkNQjLxa3Ombkr6W4+VN7oedmn6/8vXx8bUFwNVl80IODZugBXnF5cTTzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770706428; c=relaxed/simple;
	bh=TYHSo59jwpc6IISLlmY/4lk/BIA8Fbp2hXvGwPzP8yo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=co6zniUSs3wNp5wXpREdjty81VYnux5PyxPICSbb9/scA8I2HepXp5esyPfeP5zwhrdtONvpf5z6tsIMXFd/9tUo9PQvoDldzGFtcWCHq6ZL35bqxLGkfirtaMGRoV30FYQot6D8DylOq51t92TrabTGgLVO7yrKd+vPa8eYPhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTAjxzCz; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTAjxzCz"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-8230d228372so3110989b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 22:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770706427; x=1771311227; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/2qbLVn2pI9kG8ZE9O4WONBuadW6N5yVpKJ1i4ouus=;
        b=VTAjxzCzfNFs7GnFM7G1v1UML3uvI29IY3qLGJG8oDKjoj58d98vZA4MvM+v3q3X71
         6q6b7AgjyfwmUKkhmdg8u5nP26wplY33PNh2QaGMgqKa2ufnR9bln4Om64V7twhw41Tg
         MF3o9J2+OYi/rIIz+TNcZB4KHJdzDSnupmSKaGEXQ12UapXIFXQMihIPUOYX+m+gr4fF
         1dx4lpeRwXiZ0Iw6VOeUDfkw/DcD0yE59tBYp9KpKMb7oaiS5gCMJXHxevrJW3yDfS6t
         txP21n5TxfTPHyZHfQ8xNUR11KuWzfOP+UTOMMpCKqoj7jwEFHD+dBrNT98xy22XdsA8
         iPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770706427; x=1771311227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K/2qbLVn2pI9kG8ZE9O4WONBuadW6N5yVpKJ1i4ouus=;
        b=nRGnJC8oGAJ+NSRi+4Ci5bv0BWpR4z7x7UeWfny+5LVvLLsuc/vHRRFa0MPmyqvfjq
         XVk+lVL0wmeNYojMv+BMOU09l0fu/ziS7f4PNjYdMZ4+l5nr7Mg99NCg5El5Wr6jSQ62
         IlyTdQOllCZlUQlG3t4mIdHrK9Lh4md0eOTarh4QbZC+9sT/VyDlW3z+QOau9RGwFyfW
         NoMEBcs2mJ3gNqdjIRQBepTxLC46yjjHHHJ5phruWIUOstPZ00eO8VKW813vdhypL1lv
         wJX+Z116WnCQ9uhlkmrkGOCDMQZmE66eNcChvleaHhlaGiW9gtBWofLIKAadQ3Sx1HOX
         Y0xw==
X-Forwarded-Encrypted: i=1; AJvYcCWz46Gtye/VQWojTxCaAT2WQ3oIU93yNzjuv1cCacR2Mjz6HxChdPMVIMDh+/YP9P3M51rn+2nzSMH8Hvu/@lists.linux.dev
X-Gm-Message-State: AOJu0Ywqd2gM+J8GRHfWKlDPmULxtMwaHNcVrmjqjm6E5rVCHOpHxcFz
	cIsCj8Z13ILshwZ+12Of8XAXNvfTDlqsio5O2B5yJs/fmn5ojx7Vr6Y1
X-Gm-Gg: AZuq6aJ2U1G1AOKpBO5GtUD7gwZlAJCeqjminOYQt+0vHtXk7tGWQuhwul/X0EK5CRg
	qx1rgliTHS2UXvmfqCl7MBE65DuDGZvsVLncdANric+Y7AnzlEjyrXiFmZp4KWKM7ExaCSMjSFi
	0aXyc5xXo7cKstcb+kLZq7jm4Vk1mG9lX3S4Pl8/BwY5LJ1hlHn5pvVSY3oeWfDCvNrnxs8RMlZ
	xIB4rxmuVYIJrCzhqXaQp0q39bftAiuy3oJD2g+OC2dq/O+3ijeqy/Y7hBsi7smnxM8vFUE7Zsd
	ekLC38lhr3aRM1Zb09LUCEPCpbB1r2tEZFIITbJmpt3cKKm0/+XRpuqGyTTADyw7ouW1i4Oo++i
	GNrb1mrc++vkyMkuFQl/iCedeI2M28y2QEa8f7K+1/d+GhNA81l/1chniRKrt4HAYGzzkDZQUQC
	ImodaplF1L1M1XpAz60Iad9LcVR+/UhBvb5aHdUezs+EaAwsnEgTyEgIoii57qeUUFPVJ0bmBtH
	YT0UkA=
X-Received: by 2002:a05:6a00:2498:b0:81f:9aa4:1e70 with SMTP id d2e1a72fcca58-824417bc327mr11349070b3a.70.1770706427062;
        Mon, 09 Feb 2026 22:53:47 -0800 (PST)
Received: from zeeshan-Standard-PC-Q35-ICH9-2009.. ([110.93.227.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824418b3b80sm12154180b3a.48.2026.02.09.22.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 22:53:46 -0800 (PST)
From: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
Subject: [PATCH v4 1/2] staging: most: dim2: move extra info messages to dev_dbg
Date: Tue, 10 Feb 2026 11:51:20 +0500
Message-ID: <20260210065121.3661-2-zeeshanahmad022019@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210065121.3661-1-zeeshanahmad022019@gmail.com>
References: <20260210065121.3661-1-zeeshanahmad022019@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dim2 driver is currently too talkative in the system logs.
Informational messages such as node addresses and state changes
are useful for developers but provide unnecessary noise for
regular users during normal operation.

Move these non-critical info messages to the debug level using
dev_dbg(). This ensures a quiet log by default while preserving
the information for debugging purposes.

Signed-off-by: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
---
v4:
 - Split the work into a 2-patch series as requested by Greg KH.
 - Converted non-critical informational messages to dev_dbg() to
   ensure the driver is quiet during normal operation.
 - Converted remaining error and warning messages to dev_err() and
   dev_warn() for proper device-specific logging.

v3:
 - Removed "staging-next" and redundant "[PATCH]" from the subject line.
 - Shortened commit message lines to stay under 75 characters.
 - Added this changelog below the "---" as suggested by Ethan Tidmore.
 - Cleaned up temporary submission notes from the permanent commit body.

v2:
 - Rebased against the staging-next branch.
 - Fixed CC list to include relevant maintainers.

 drivers/staging/most/dim2/dim2.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 80af965356d0..e1b1a606f36a 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -246,9 +246,9 @@ static void retrieve_netinfo(struct dim2_hdm *dev, struct mbo *mbo)
 {
 	u8 *data = mbo->virt_address;
 
-	pr_info("Node Address: 0x%03x\n", (u16)data[16] << 8 | data[17]);
+	dev_dbg(&dev->dev, "Node Address: 0x%03x\n", (u16)data[16] << 8 | data[17]);
 	dev->link_state = data[18];
-	pr_info("NIState: %d\n", dev->link_state);
+	dev_dbg(&dev->dev, "NIState: %d\n", dev->link_state);
 	memcpy(dev->mac_addrs, data + 19, 6);
 	dev->deliver_netinfo++;
 	wake_up_interruptible(&dev->netinfo_waitq);
@@ -799,8 +799,7 @@ static int dim2_probe(struct platform_device *pdev)
 			dev_fcnt = pdata->fcnt;
 	}
 
-	dev_info(&pdev->dev, "sync: num of frames per sub-buffer: %u\n",
-		 dev_fcnt);
+	dev_dbg(&pdev->dev, "sync: num of frames per sub-buffer: %u\n", dev_fcnt);
 	hal_ret = dim_startup(dev->io_base, dev->clk_speed, dev_fcnt);
 	if (hal_ret != DIM_NO_ERROR) {
 		dev_err(&pdev->dev, "dim_startup failed: %d\n", hal_ret);
-- 
2.43.0

