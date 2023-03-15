Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33AA525D;
	Wed, 15 Mar 2023 13:17:31 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id cy23so75284156edb.12;
        Wed, 15 Mar 2023 06:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678886250;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rxURf+psBqe1s2q26pfxC4QOrHgw3rDqBW2xfMo8qjE=;
        b=ZbpCbllL5NG5xKpwbFyUvB9kj3Gd2mgMQwGrxsNn8opc98RzOSeOsdkpfZBYJ8Hoi2
         J7XE7+sEp0Ls+A3kGgJOHbgCeBwXhFSgkFs6Nab0UPvqyMEKRXD7YysnFYmIcfdKXfq1
         rttuTphm8XPZg7hkmQYHUWROHMAAQjkh3dzBMm3JVLzrM6Dw7pqDACOYLqRGzYhhMrVD
         MEEsjVDI5dXY4rdBip8lLSqJ1cgFhv2tj08w4xtpC0fPFT6jzuOj7QGjKB4gvzZu/Neu
         8/fQ8a8yAPK6Ke+48lrANUwyPJvWhYjGr/18vlQ+uZzRzMnZosbJymqpEda2SQIIuNRI
         CjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678886250;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rxURf+psBqe1s2q26pfxC4QOrHgw3rDqBW2xfMo8qjE=;
        b=0+0e1aEo2GeMgSdECsaeFHlNtvny8AgB5f6xXvrOYnn0tvjZWycV2DEXH/IuHBUwyv
         VbbxbKSJrlzZ+rT7M+WWSPxiGeen41nBa9jeNH04UETluaUucTDRie2d+ylCwgHjV8l4
         ChL6kZ8MVXxt1z7MShLUkbbI7UavXRNnv8L2HwoxcEDN1doldZC0LwD8c8+Kdg+5iFW2
         0xXLD52137vgjkOerQRvLHGU7DqH00TrwmphpzRlJ/IEtmER5LNLac4l9d1EsIBtDELh
         cLiipL2VDlO5ixymAZUi96bTQS03GFIGoQM9JQv47PZC5qnoo4mNxKM6+gDf9OI+isgD
         2Klw==
X-Gm-Message-State: AO0yUKX42FyHtSUGn/yOu/yMqg0C5KJSpc1N+11WL0z4/x7LV3+k25qD
	TmWUKzNxQd9xW+BpLcRL4sM=
X-Google-Smtp-Source: AK7set91wtHjhXetIVBcBhjO6ED4bASi3NFH/TWqHxikavMlL85x4i+gvUsCw5stT7YBbbyv+/iEBQ==
X-Received: by 2002:a17:907:385:b0:8f1:da18:c6ca with SMTP id ss5-20020a170907038500b008f1da18c6camr5658278ejb.3.1678886250262;
        Wed, 15 Mar 2023 06:17:30 -0700 (PDT)
Received: from [192.168.1.16] ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id sd5-20020a170906ce2500b009222eec8097sm2500281ejb.75.2023.03.15.06.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 06:17:29 -0700 (PDT)
Message-ID: <ec13bbba-88ec-64b0-58ae-eee8617990b8@gmail.com>
Date: Wed, 15 Mar 2023 15:17:28 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Michael.Hennerich@analog.com, lars@metafoo.de, jic23@kernel.org,
 gregkh@linuxfoundation.org, linux-iio@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Outreachy Linux Kernel <outreachy@lists.linux.dev>
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
Subject: Outreachy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Mentors,


I am Menna, Outreachy applicant and I work on my clean-up patches.

Is it Okay to work on this error reported by checkpatch script?


drivers/staging/iio/frequency/ad9832.c
--------------------------------------
ERROR: Use 4 digit octal (0777) not decimal permissions
#256: FILE: drivers/staging/iio/frequency/ad9832.c:256:
+static IIO_DEV_ATTR_FREQ(0, 1, 0200, NULL, ad9832_write, AD9832_FREQ1HM);
ERROR: Use 4 digit octal (0777) not decimal permissions
#257: FILE: drivers/staging/iio/frequency/ad9832.c:257:
+static IIO_DEV_ATTR_FREQSYMBOL(0, 0200, NULL, ad9832_write, 
AD9832_FREQ_SYM);
ERROR: Use 4 digit octal (0777) not decimal permissions
#260: FILE: drivers/staging/iio/frequency/ad9832.c:260:
+static IIO_DEV_ATTR_PHASE(0, 0, 0200, NULL, ad9832_write, AD9832_PHASE0H);
ERROR: Use 4 digit octal (0777) not decimal permissions
#261: FILE: drivers/staging/iio/frequency/ad9832.c:261:
+static IIO_DEV_ATTR_PHASE(0, 1, 0200, NULL, ad9832_write, AD9832_PHASE1H);
ERROR: Use 4 digit octal (0777) not decimal permissions
#262: FILE: drivers/staging/iio/frequency/ad9832.c:262:
+static IIO_DEV_ATTR_PHASE(0, 2, 0200, NULL, ad9832_write, AD9832_PHASE2H);
ERROR: Use 4 digit octal (0777) not decimal permissions
#263: FILE: drivers/staging/iio/frequency/ad9832.c:263:
+static IIO_DEV_ATTR_PHASE(0, 3, 0200, NULL, ad9832_write, AD9832_PHASE3H);
ERROR: Use 4 digit octal (0777) not decimal permissions
#264: FILE: drivers/staging/iio/frequency/ad9832.c:264:
+static IIO_DEV_ATTR_PHASESYMBOL(0, 0200, NULL,
+                ad9832_write, AD9832_PHASE_SYM);
ERROR: Use 4 digit octal (0777) not decimal permissions
#268: FILE: drivers/staging/iio/frequency/ad9832.c:268:
+static IIO_DEV_ATTR_PINCONTROL_EN(0, 0200, NULL,
+                ad9832_write, AD9832_PINCTRL_EN);
ERROR: Use 4 digit octal (0777) not decimal permissions
#270: FILE: drivers/staging/iio/frequency/ad9832.c:270:
+static IIO_DEV_ATTR_OUT_ENABLE(0, 0200, NULL,
+                ad9832_write, AD9832_OUTPUT_EN);
total: 9 errors, 0 warnings, 0 checks, 462 lines checked



Thanks in advance,

Menna



