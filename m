Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1691925A5
	for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 19:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729193518; cv=none; b=EmYKjjEbr62tJ1r678qLrErK0YnePJEfQtS5tLqaT5lW6LlLrayeS7d0l8fOrYY0PkFaV3IUMN5lbEcREkvcjpcGL5Pm3J3O+rIz2X+y6doEaG7t23qNlRHhOKLcbde8yC4JMenIqAV855yRMYk8+2e0cZK+jZvVyfTrBA9wMQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729193518; c=relaxed/simple;
	bh=dAkeaamY7o1370cUdKQG7yxKGStXqWiEAMiubdm6br8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YASmN2yieKOGJI6LGYTfbqhgNvPxG7kObyPO95r/Ynhs01L+eLSbLE11FI9vk1xzd47JqVM+dyXMEn8DldSbXCcPVcHiEMm35cpUHyXJT1tXo4tt2aqzTF/Z6CMeNeMwOJi/7q7Em0TvIa0Omgc9nifS9YYT8WApEEJ3RZIxCqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RiktThgE; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RiktThgE"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9a2209bd7fso160289766b.2
        for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 12:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729193510; x=1729798310; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+PI6B1iY+JP2eo71Lss2ueaqQvzi03LBy+TDhNeB/Zc=;
        b=RiktThgEi/MVd8TVr7KPkb33waBn8No0lI9HXTc3Y7VMLV928QeT1XlvZzVFAq6Fbv
         ASKBmUw7E6pWbtPXjuqg9fXDvsk/cCWBSRzmcAlGiBwHREBRjMfhz8Ntm+qlqDul55FC
         dvxNw6YQojnaEoH/yzgwq/HeT9ldlLuzk8mM5OagJDwJJDO+97lFDKb0sCOUEwdFBUW6
         6QAnsWeBT2qQVY5JN5JwTJoRqodm/9u+ltWQk9lkohLiglfhQarSv5kGvLuagHp14eFb
         G5To+c2P+1zhy2K5fDojMqmnrBwvVuet3GEWERG09XTFOBpKKJGblJLIUwxM9/NFLM2o
         NMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729193510; x=1729798310;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+PI6B1iY+JP2eo71Lss2ueaqQvzi03LBy+TDhNeB/Zc=;
        b=FSuXI2FXJBDZQpHOtzutAkNu/RC1tCRaJKp+lNdywSxLV5gbBGEBpCtDA51blOGSUp
         L+p5GTo8DxbI70bRB7I1ufjOExhzFdfSyxGe6MEJxzPmEt3ht4XbBrwPnvr7sQOCbojD
         6SK71rvqmWM9tfT3O3sDzEokqzEdo7r2XpQGU2s122RWda96JdH7cUbGRhlNihbDgn/X
         szhqKxgSkJz/vSDWZfVeKoC2UIa8Ogvg2jgxhDvmRfuRqZT+ie+bMwqVTNVDmeiK6398
         0Pu5ssyQkAmex7c6i4DxgNbTR+Cxb+K1PC4ArkqSMmYc682vV32tIcZOilWxb2nNs9cV
         ZHZw==
X-Forwarded-Encrypted: i=1; AJvYcCWukUiekPgvDjWQv0agrnwxNQEPaQWaMZnpt2H242B9vhkzjpTF5xInph+nO+yT3LTfYJOF8PtyM5YFtBQB@lists.linux.dev
X-Gm-Message-State: AOJu0YwnsJ1vIIEXIE0qS+vGXYAlruOUWDWfzw1It7aVYdIA4e7pFdu2
	AN4xyL+HsExfvbwrU/I6Ngg9Q+8ypcgq5L94QTM0eTIiYUjfH9NVA+3aCLc0E90=
X-Google-Smtp-Source: AGHT+IGJon+b9dsLW9OFTm+VNv4AExNUwMLbQMOv3biKDHICy+rUsUPzF2VOZMg3pm/HFx79t1+13g==
X-Received: by 2002:a17:907:f709:b0:a9a:b4e:b9eb with SMTP id a640c23a62f3a-a9a34ec99e7mr838913366b.46.1729193510331;
        Thu, 17 Oct 2024 12:31:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68c29b73sm2298166b.202.2024.10.17.12.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 12:31:49 -0700 (PDT)
Date: Thu, 17 Oct 2024 22:31:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] staging: gpib: fix uninitialized variable in
 usb_gpib_command()
Message-ID: <a7fed100-ea4d-4dd8-97c6-3fbd2c15f795@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The number of bytes written is supposed to be zero at the start of this
function but only one caller, ibcmd(), initializes it to zero.  For the
other three callers, setup_serial_poll(), read_serial_poll_byte() and
cleanup_serial_poll(), it's an uninitialized variable.

Fixes: fce79512a96a ("staging: gpib: Add LPVO DIY USB GPIB driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index aa7af352e709..4bcbaee65aa9 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -596,6 +596,7 @@ static int usb_gpib_command(gpib_board_t *board,
 
 	set_timeout(board);
 
+	*bytes_written = 0;
 	for (i = 0 ; i < length ; i++) {
 		command[3] = buffer[i];
 		retval = send_command(board, command, 5);
-- 
2.45.2

