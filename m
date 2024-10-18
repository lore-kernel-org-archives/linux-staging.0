Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB461428E0
	for <linux-staging@lists.linux.dev>; Fri, 18 Oct 2024 06:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729233152; cv=none; b=b5kSHFeYhPT2iLqAxA1UyHiZfq0fW9dWTwCYV1uuMqHitmRaEQXWjG7D76mhbymj41l8OU96A4BgIPB6JP+XKl+WHXlT3UxLDuNQwR/fiqkaXscXA2y0u4WB/RJnEbFdYkE5DcUsHQaNedKNxD/7TooYWpmw3QmXW1Yt4FVuH9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729233152; c=relaxed/simple;
	bh=PKRI46aJCwkbfAHkWjgskykakteqHAdjxmRVbNHD7KM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OOc2ir0beteK4MWFnGjjePthyuhKbIOTciwRd3cFAnIxSjREgsHSJwYsfaSsBXo+76CFOnIaD92OoU5lpyGcymYRO0ohYV5fe7SlhE5a2Mb7Iqf9/o9kisIlST0ItwKaMzZ+qSt9XVXEb6k2EMmGrf7zT4jsLu6LBjHVM5RL5vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gz4XvUDr; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gz4XvUDr"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a99ebb390a5so535359566b.1
        for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 23:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729233148; x=1729837948; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XX7LxYQzNZzSuHrwyDkABVnoTWqmyq3oKjH3me2WrJ4=;
        b=gz4XvUDrpIDDY0LLtpLkItlSvJbrqC22nV/xR3OJAGzYBP585jTzLQcvTlRP2NdYrr
         rIBPSaz0fgARjxYZpoGDEj3uZtVT4CttIbCVHDPtcRVLFGetFLyYGUEaqv4lxLNfsJSP
         5uO2BTVJZpdse7Qp01ZfavXYuVa5kuhps6LGYzszfO3x/JEPjMiXc3Gc60kALO4YOvhR
         1oEo0NBZm9N937s2z9efQFNkAqFwHdVz6kYgmrltFFritkEKWcKTvsI95dYZ+xoeJ2cz
         RgNXj/47/jZ9/kjzT66yp18ow28caBP+AGCLZnz3gwgOtjgQ92InGJXNAZCdOSPiOhFt
         p8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729233148; x=1729837948;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XX7LxYQzNZzSuHrwyDkABVnoTWqmyq3oKjH3me2WrJ4=;
        b=QeFn5rpvaE/RNwr5z+IcKBiOhMU/Iyeh0Fh3bUhGHGBQ06N1AVBJ+TVPbdY1Z3XV9I
         zXSqk8O6L9je7PbsSfYxevA2C+5Uyu0ywsZxZPsklK1IuHZ63nBYAh9TYiyXbLDxI2c/
         tlnel7FcrC6bI66L6CmlKza6scCVULBYQnaF5YI1KjckujuyH9mQ0WRbovb5QqWvZE+d
         Xd6lgyNfN86EaZ979PwgqFSN1N5Yf1yCwBy0HEfAd1duVwBcutJP5hFCZCevE/J6FI1T
         ZLUCx8QjICzCiKX1vyLGvtBm1YPXb8FKyy6yWPCAzwhyQ1qqf5Kaf9MsF1Ndsat8R+We
         Z0Kw==
X-Gm-Message-State: AOJu0Yy6qFkoVhbPje10JEkVPsjpBJ+jgRpoyW86HbeI6bJlku2Va1m+
	u1agJdFy4q5Ohf9ykxcePkRV+2MVUCZXSQtk33r7hdFqZmJqimke0/+lltzPro9SXk8yKlIjKJ1
	Lcac=
X-Google-Smtp-Source: AGHT+IFHasihfLGx38MezmhMp2LfB+lXXnj1s+QxG57eDOCyu3Bjpap8GKbsHvsIm1lvvwJtv7S5qw==
X-Received: by 2002:a17:907:7250:b0:a9a:5b84:ac81 with SMTP id a640c23a62f3a-a9a6a5b1a5dmr103822966b.31.1729233148343;
        Thu, 17 Oct 2024 23:32:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68ac3853sm50723166b.48.2024.10.17.23.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 23:32:27 -0700 (PDT)
Date: Fri, 18 Oct 2024 09:32:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: [bug report] staging: gpib: Add GPIB common core driver
Message-ID: <4efd91f3-4259-4e95-a4e0-925853b98858@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Dave Penkler,

Commit 9dde4559e939 ("staging: gpib: Add GPIB common core driver")
from Sep 18, 2024 (linux-next), leads to the following Smatch static
checker warning:

	drivers/staging/gpib/common/gpib_os.c:541 dvrsp()
	warn: no lower bound on 'sad' rl='s32min-30'

drivers/staging/gpib/common/gpib_os.c
    525 int dvrsp(gpib_board_t *board, unsigned int pad, int sad,
    526           unsigned int usec_timeout, uint8_t *result)
    527 {
    528         int status = ibstatus(board);
    529         int retval;
    530 
    531         if ((status & CIC) == 0) {
    532                 pr_err("gpib: not CIC during serial poll\n");
    533                 return -1;
    534         }
    535 
    536         if (pad > gpib_addr_max || sad > gpib_addr_max) {

sad comes from the user in serial_poll_ioctl() and it can be any int.

    537                 pr_err("gpib: bad address for serial poll");
    538                 return -1;
    539         }
    540 
--> 541         retval = serial_poll_single(board, pad, sad, usec_timeout, result);

Passing a negative doesn't do anything harmful and it looks like probably it's
intentional to mean there is no "sad".  But instead of saying that "any negative
is valid" it would be better to say that "-1" means there is no sad.

	if (pad > gpib_addr_max ||
	    (sad < -1 || sad > gpib_addr_max)) {
		...

Presumably the user space code is already passing -1 as the no sad value but I
don't maybe it's passing INT_MIN or something weird.  This is an API change.
We're allowed to change the API so long as we don't break userspace.  In
staging, we have a bit more leeway to break userspace as well honestly.

    542         if (io_timed_out(board))
    543                 retval = -ETIMEDOUT;
    544 
    545         return retval;
    546 }

regards,
dan carpenter
