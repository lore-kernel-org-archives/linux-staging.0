Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A795220E026
	for <linux-staging@lists.linux.dev>; Tue, 12 Nov 2024 10:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731405937; cv=none; b=nkB0eA7IkL7n9508XhYEFlfO1KgpimM6wrErehhR54SN6aAXCx5JSaZn3i775ylsBMZvkCTx2HH6WFXK/uil1Gxjpe6J8jzNq6Yq33ul0UqNgzXieAmM7Yqrt58Q91+r08WvwdhZahypF1ondinOWhbzjKuqpnaLeG/ojK1lomM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731405937; c=relaxed/simple;
	bh=O2uSt5gnI1yrtkGtt18jzoddzVBt1TEMeTJCY5GkLdo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pPbujOuVUs6Y0OC7AO0j79wk+82ESF4OxRWLgm3oc4hlyzWSLVUi/Q04M3e572P/fWSdWvHtjxMWps8lyd23Fsftd/LMNKaJ0RvyrWqoPb4p90bMVKxYg/jwfKcm8GsUaIJNEteE5w/2oJS5T2Oz/OxpeXXUPGhh7fjswg4Z2o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tsPts9ao; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tsPts9ao"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5ceca7df7f0so7126303a12.1
        for <linux-staging@lists.linux.dev>; Tue, 12 Nov 2024 02:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731405934; x=1732010734; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=55sIuCId/U6Zt1MLC5cA0C5zbJ5A0XkpZp2wkCcolsg=;
        b=tsPts9ao0f4s5jBcIp4qmKGHg6o9W4LRYCaEku7HAGxbOVrdhxnlmqTdv456pIVGMG
         X4ySw1HQLQLK0w5nxQbwcYNcyqqAVL4nvDz8rfkwaE+oBpU5XbkY5cDkn+IuTNh0GvXZ
         /X9mC6qzsawoeYuXzqF0rFSHJZPCnLsIOqgLXzZDRG25yeA3mXUwngGJGpsg0MxW/VPZ
         1fPe1IwztrbsEvmuinQwxzMYTiW2KJgsh18jNlg0ByW/pgKYKtqp9R9jeVPbBGsXBuwZ
         nMCPblhWoXeBEph2jyDvbE2ZHHJPjcOOHq/fwUGtASUpztGqt6L/vmhQz+Du8hnfNJML
         E7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731405934; x=1732010734;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=55sIuCId/U6Zt1MLC5cA0C5zbJ5A0XkpZp2wkCcolsg=;
        b=uP6C/NwMEdjz7IZ6Hds36BLEjt3+hHELyXsM2nFMqAZrDxhGMer/zxi04+E7DjDeTr
         TDXvcCFvDB8lZWzgv7/QgLPt5bxKH+5B4seEbNNlf0qJp5uSSzWNPYzIj2M2w3KrCUtf
         hX6EyMKuXiSEjsjCchYpQIVQeIzYuBJvYjjt4qwkJ2Js25/lnQwSBQJER2b3J39zmcoM
         38OecQ76aojOXrkg6bnV2SYgyNAbrCDiERPzVc6mbuz4jpZh1LV+2Fpw78ZOOeq0gH1+
         CfYtYcI9q0QPVmvHwKTF5cjwoY01QVspCtO5H1eqEgncz7V8Goy7DkP+94bskRaaQSx5
         zCgw==
X-Gm-Message-State: AOJu0YzdPB2cyfMD25//x5GAycF+4CNxonZFktKi4jB9dyQ3i2nl7d4E
	X5JEDylLlbQP+sjOOXAExgxcpGzPILkTNyJqa1AxAi3OBzVtOZ667J8BhQ5EXLE=
X-Google-Smtp-Source: AGHT+IFsE58OGXw4irD+JkV9X9tWVnXZGPxJH1ZPLb0MB0CoRrNtz+4P+G/ZVqSlLQAmoW8uQ1z6Bg==
X-Received: by 2002:a05:6402:350e:b0:5cf:45ca:983a with SMTP id 4fb4d7f45d1cf-5cf45ca9d1bmr3737446a12.11.1731405933938;
        Tue, 12 Nov 2024 02:05:33 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03c4f63bsm5816087a12.67.2024.11.12.02.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 02:05:33 -0800 (PST)
Date: Tue, 12 Nov 2024 13:05:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: [bug report] staging: gpib: Update messaging and usb_device refs in
 agilent_usb
Message-ID: <2d99b7a6-f427-4d54-bde7-fb3df5e19e53@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Dave Penkler,

This is a semi-automatic email about new static checker warnings.

Commit fbae7090f30c ("staging: gpib: Update messaging and usb_device
refs in agilent_usb") from Nov 4, 2024, leads to the following Smatch
complaint:

    drivers/staging/gpib/agilent_82357a/agilent_82357a.c:1450 agilent_82357a_detach()
    warn: variable dereferenced before check 'a_priv' (see line 1449)

drivers/staging/gpib/agilent_82357a/agilent_82357a.c
  1448		a_priv = board->private_data;
  1449		usb_dev = interface_to_usbdev(a_priv->bus_interface);
                                              ^^^^^^^^
The patch added a dereference

  1450		if (a_priv) {
                    ^^^^^^
right before a NULL check.  I don't think it can actually be NULL.  It gets
allocated in the attach() function.  Could you remove this NULL check?

  1451			if (a_priv->bus_interface) {
  1452				agilent_82357a_go_idle(board);

regards,
dan carpenter
