Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A46F37D29
	for <linux-staging@lists.linux.dev>; Tue, 28 Nov 2023 20:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1wFwfmu"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40b5149a4efso386085e9.0
        for <linux-staging@lists.linux.dev>; Tue, 28 Nov 2023 12:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701204189; x=1701808989; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+8Awudp5GYWpf8rpOsAUkyVnz4CdB7ttjVu4BYCLfzo=;
        b=J1wFwfmuzsc2Te9ar6C00zBBSM0+uV1kFuSYhpKuASs2OSSXARq5jgKVxCccaPuIM8
         ptHVLIHwBAxi9SRRjUpS9DkwdIMaZZkf564K8UmSQ04ctfA16fmVV/nBVdgvkpTkgaLk
         fkgcAqhv890rwkG2mkWJg2yBD+JpMoAw3p1hAnv0ijDN5iUdq995bFPpeVum/IzW5Y4+
         zwGzZsJ0HHQiSxisX6Hbn2cp+pQdJvBavBFcSRXPpruBkuUwqqabC73CYXN/yhkV5tf+
         RaUmBc4sSPFEngvC6hu6pepgdHzl4iU6ZVDpUBcyaC101quSldAbvK42lhDsudHq5d5L
         QZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701204189; x=1701808989;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+8Awudp5GYWpf8rpOsAUkyVnz4CdB7ttjVu4BYCLfzo=;
        b=mo18UHj3TVGfxR9njzJQzXUfjVyw2Do7Pk4KjFZamQDTjYG9+DZyQ5u8BTopOh/PvQ
         LGsVEmEqbZlpDcumZ5zy1TrTJpvf8BqX7ZVnfGyfxllrtll057swjKZFID2NlIzPfemA
         C5yZlMyO5B8sfXN4FibMh60OkZN+1qLwiGywiv7hyBD/QPcTkQS0s7s4ZqcZ72Q4aC4N
         hGHSEf/QQKtYqoj8I0zUKXfF+u9GHxzw0TGnHeSpTRQ/WtdaNN3KzQVLgIui7SNTPS0I
         n/Pt81iTFer41mlo1HQ28n+mFVQdkjoDEruoLo/hT0SOolu7D/iJMhtC+dR1PKfjpCyA
         GOzA==
X-Gm-Message-State: AOJu0YxlrYY4e/MM5TzTAyuWw4r6RSCCU95ArkaNrkWuEQzXnYicUAAl
	QzC3B6XQ9krFEGVRHaWSCqc=
X-Google-Smtp-Source: AGHT+IEbfJp/yQHh7SQ42Y15xiVD2dKDwlsR63ME/1S17+huXuroYI5EaQ7egaZFPUCUeedYixms4g==
X-Received: by 2002:a05:600c:993:b0:40b:3d90:884e with SMTP id w19-20020a05600c099300b0040b3d90884emr9448329wmp.2.1701204189184;
        Tue, 28 Nov 2023 12:43:09 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id l6-20020a05600c4f0600b0040b3632e993sm18727804wmq.46.2023.11.28.12.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 12:43:08 -0800 (PST)
Date: Tue, 28 Nov 2023 21:43:07 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] staging: rtl8192e: Remove action block acknowledgment
Message-ID: <cover.1701202700.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

AP are learning very quickly that rtl8192e driver is handling block
acknowledgment (BA) not as expected.
The log of the driver is showing the following output:
rtl819xE 0000:03:00.0 wlan0: received DELBA while QOS or HT is not supported(0, 1)
Then AP are giving up.

Tested with rtl8192e (WLL6130-D99) in Mode n (12.5 MB/s)
Transferred this patch over wlan connection of rtl8192e.

Philipp Hortmann (6):
  staging: rtl8192e: Remove action block acknowledgment
  staging: rtl8192e: Remove unused function rtllib_rx_ADDBAReq()
  staging: rtl8192e: Remove unused function rtllib_send_ADDBARsp()
  staging: rtl8192e: Remove unused function
    rtllib_FlushRxTsPendingPkts()
  staging: rtl8192e: Remove unused function rtllib_rx_ADDBARsp()
  staging: rtl8192e: Remove unused function rtllib_rx_DELBA()

 drivers/staging/rtl8192e/rtl819x_BAProc.c | 262 ----------------------
 drivers/staging/rtl8192e/rtllib.h         |   6 +-
 drivers/staging/rtl8192e/rtllib_rx.c      |  33 ---
 drivers/staging/rtl8192e/rtllib_softmac.c |  30 ---
 4 files changed, 1 insertion(+), 330 deletions(-)

-- 
2.42.0

