Received: from mail-oo1-f65.google.com (mail-oo1-f65.google.com [209.85.161.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1952F3126B9
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 13:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780494487; cv=pass; b=V4wz7WXLvQd+W4BzxtefRwX6xP2cRPN4LI4jLxlBabJITFTb/8bzbs7cdeufzQAUEv1+HqDWwtlY8AreGlbcW814JP+vDH7pvL0gPPj3nTpvBTfD1xyGo+eA6BtAlVV3KMaUM39qp7eQAmyPN11/UIvYjfKyAdVUzIBA67UebpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780494487; c=relaxed/simple;
	bh=XHJ6nTx4CJH87cXCPPoHmnXEJkEw34rMOpIRW6Qg+TU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=qKn8LEAUb/msZS/TpvH41bf13Di5IoUr3FykUHSsyFnwue6G7NNqEkdHsDGRUaAH6WViRRrBzAb9cwZF0LWemgzdKNuYInSZmyjRJFdt19SbX0lqwwfgv5ZpETqdVwk+8V4id7GrMUzYiH/+GWLxo0d3rPYPNDA8sDcKJnPXSBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YSgl/C5Y; arc=pass smtp.client-ip=209.85.161.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSgl/C5Y"
Received: by mail-oo1-f65.google.com with SMTP id 006d021491bc7-69d7aa0ac18so8014607eaf.0
        for <linux-staging@lists.linux.dev>; Wed, 03 Jun 2026 06:48:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780494485; cv=none;
        d=google.com; s=arc-20240605;
        b=Mbd19rPCim0U4TiZz7yiSIcZs6dOB32ee7xQhrZEamiRqf2J8NXkmrhs356eg21NQo
         3RFSnplA2VWjIcoJRhAvTkD/qehJM8NVx8uPszb9Rh79A1OrTvqvQzPWiaKI9ETw/WNt
         I07XOa3KdkIOpsIFH3xNrLb/TntKHqCeuDQH4ErE+SBUX15m+bo7zm9TL92QrO+hNB6U
         Zv4SKXfYlo0ZyuT5MWa3QTXBfl0BH9vpCAy4rcJNIq4Rn2et5hzumuftS1iUa62DrvuY
         aQPV+Das7bH60TP5rSw9kx6FqiUckLTllflFHuMHDo7wL+wxxwbdfmmquQ2MIGbBYun1
         ga3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=XHJ6nTx4CJH87cXCPPoHmnXEJkEw34rMOpIRW6Qg+TU=;
        fh=0H6ivSpXKgR14aZa0mVd2GzoetHTykkVOrdBO4croYE=;
        b=bu36Pko4ePf8HHnPPTwKAlt/fW3w1Y/ysNIsGYPlIHCt1WE4JFtIXLzDLjsbI6hbSZ
         cl2IBSlVbsEzU9XnGJtmf5IoN+HKeNY6AYZQMTYCJzNgDmCmvS4ZIjTTKwVVK1hc8eUG
         JwlSAWrtV/u86+F2s5bbPNNe45dZkbD6Pj40MoVk6VZJhfwgPYcFxOyyiPgQ2OUEOSXK
         CJSTCcEgYg/Bef2Y2bsmvPbyNre+K4FIZRrmLt28Taaq885J3J948pGSSueOluw5xR59
         MX4ptYkkMnUkkTe1CzQbDA7z05+iHctc8ZSNAJPPa9qk2zwjV1tzehFP0ZWr1orLjpOY
         KcIA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780494485; x=1781099285; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XHJ6nTx4CJH87cXCPPoHmnXEJkEw34rMOpIRW6Qg+TU=;
        b=YSgl/C5YhrOu0rK+65Qgw5739CLQ2heme5BSmwOgmSVHtYN0iT28+kmhAsmUc6IKER
         6aYofTNGg/2A6p/B6N9uyYreY+KCyPBcQFP42tcpBSkyHNOVu6rxsGvsuUi2JCaW8eTZ
         mpzVKLRRNnO3XrwqBuPNwo4yiWD1nJVuGKXsjEceFJLXm6wyfuHC9Oc3tW+wpMFURGyT
         0Dfh4EQ6NZqYvJQPn9uiDId7jWp3PATbMz8o0YD1d9bcBrMy3EJyEUER496j7KWRox3Y
         QyKFruNBWRM42af0i6wrn1GTt3UCMDYWXNrrl5VtvVnz0p+4nXEA2c0g+OV1v+Sd39wA
         XfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780494485; x=1781099285;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHJ6nTx4CJH87cXCPPoHmnXEJkEw34rMOpIRW6Qg+TU=;
        b=a/CBlH3xNdOF6XJPeh4QpZSKKbBghvvr/jszF3Al9ckkeaNlKAxQmWO1gY6RTaQHQX
         99s5Hokbjj8Wv5xTCFBrYb2XTpZOdppfzvDLojFQ5iSfcHavYkK/spCO+3SYcLLn20HB
         laxAfPL04xVhAAQrs95ydfOqp2i5OF3Y7bYWmmkQA8N026X2lCNIiu5drwy4wkiVDcdI
         vbuuh/bw+O1soOSLzlqg0nrl7p0a7hMeOKjEHIGyvcSiPOJQhRqfKIj4gMGTi12xKxCH
         8Wkmx6SguTPyQzSo2wSnkPCdHo58XgqdlY0SX+hKIsQMJHIQpvG9iTIbxWc55sM8l+sM
         VOTw==
X-Gm-Message-State: AOJu0YywU2RY2pfGmqztj8p6iTAWRDVJytH6fcWjVxyYkY01JpL1PPhL
	/qPdFbfcqa4z9WVhKctZGpc5mgHRgFIiHsh3XaMEqGuipvS3YqGUn/KDpuBP0fCFx+BkkNOUAKO
	WlJIOJIJNMAGfpDdJ4gcFV361iKEiSM00w50u03g=
X-Gm-Gg: Acq92OFtRWzC32fz8+WcMZVxZpAW0HyM+ivGyZfU6u0dR77/OnJqdR2a7Ud5GNpst0G
	tqMS6Iplrl6ju5SUPttFDVXYYZcsOmAnGxIT7ICIA6AlqSvjkxHgJZ+9EEsotI948W8vFNerRjP
	FVU8OmBxDQAG+ExQWlM/SzxGg53STtJF9JmOVAhrlsVL2wt/bFJiSVJ76I07mXPMhhlaa7hzCSr
	Cav43T34sk+P3jVjOgwoigFV/Rt8igtXHjcLWb5vGh00OzMKl3tgeXYFzO6zt2oIOdb9fxO7yXL
	z8BzkpO//bqzxYmfmQIvzLbkxVT9zjc/00dhZVIq/HIB15cqHOSp
X-Received: by 2002:a05:6820:4d06:b0:69d:e344:206f with SMTP id
 006d021491bc7-69e47f6c7f1mr2030591eaf.29.1780494485095; Wed, 03 Jun 2026
 06:48:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Denny Lin <dennylin0707@gmail.com>
Date: Wed, 3 Jun 2026 06:47:54 -0700
X-Gm-Features: AVHnY4KsUXEItwA8hWgXO3q5zvc6c2naLiNuNvxzlgg58YSUSPv-_SfIjbZF4KY
Message-ID: <CAGEkeHfdQcZ4tfayL0=pbN7roXrO7VBqdWNu_sq6yLjEk=G3Dw@mail.gmail.com>
Subject: Re: [PATCH] staging: axis-fifo: remove driver
To: linux-staging@lists.linux.dev
Cc: dogestad24@gmail.com, Dan Carpenter <error27@gmail.com>, ovidiu.panait.oss@gmail.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, jacobsfeder@gmail.com
Content-Type: text/plain; charset="UTF-8"

> I could not find any user-space applications that depend on this driver.

While searching GitHub for userspace applications, I found a couple
of public projects that appear to use /dev/axis_fifo_* devices:

- strijar/brass_gui
- ppoolad/uoft_lidar_test_system

Thanks,
Hungyu Lin
