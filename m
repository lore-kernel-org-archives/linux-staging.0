Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6146F71
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 01:34:31 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id g35so5157397pgg.9
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 18:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=Wsw3laNKp4K1pOr1JmqRCZTS7mmbPQQcq1XguLZwJWk=;
        b=mPl5ou5UDi5gzboKS8ESlunB9Caylq8iYe9f7S8SqpJIPLD6c/nmaPw8xccBUo4m6N
         cC1+DwpUg+98fmJlDR0TwsDVU4AVJBw7KFPd5Aj5SJvplHRM5uQ8UmuZ/JJoQcDJGby1
         UCwdZE6snEEXhQc590gMigbKKc8hi6vvH/RqgEpYUa5QzggXv/ENL2PB9IAhF3+SB5/i
         0N49haiU3Dyrh5juc4xdgfM5HZL8U7gZUUsDuzjKEb+/R9mcT3HyL0COxDPEQAQ3KH4m
         bXwZvCN/g7cgRaaqigirMy4DZPQMPCadrDeQ3S9b0WM6+avpMJQsbtwRxq38OhAhRvXM
         AN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=Wsw3laNKp4K1pOr1JmqRCZTS7mmbPQQcq1XguLZwJWk=;
        b=BP+kFp4k8stQvsXh1Vlldi5H6eTCTHVaoUvbGzKz5Qls2/BM49+pMOWK/NbCUJbgM5
         +DHhYY899TO9Zy+w6qGaqT9k8MHWJrQqAOZ3sGUBG7MZlfuBsa1N/4QaTKnfbXz+K5iD
         seKGkSOPYw3xdez2i4EYEzyh0WQTVfLQIsDBh69V5AQXQl7NB3Aw2pBS3GAtMr8LocsC
         xh+V8vkJQh7gejYH5IDqqtYe5KPlp/xiqXiJ2wsagSeSa1hGipyjKFr51JUT39xtjQF7
         L1VGiwDzEmKYb/zQ/LieGWIEIqEFmdgngD0+Vf3LgV1T6EgXjNSBg+Abq7BRrhUFsuAI
         rlOw==
X-Gm-Message-State: AOAM532gNYv3tIKeq9iGW7NGlA5ee3S8YoV7qGK+TGGvcblIpYndvHlK
	++Lkb6GrWqFrGqXzaJqRXcc=
X-Google-Smtp-Source: ABdhPJya27UWLDN4A0QZSK1DUEyyim8s0lL+liJM2Tz9w8TmAxTDVFCrPi/Ds2PSdNrOZXQiEJLJqw==
X-Received: by 2002:aa7:98c9:0:b029:242:18fc:562d with SMTP id e9-20020aa798c90000b029024218fc562dmr14420057pfm.39.1618018470710;
        Fri, 09 Apr 2021 18:34:30 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id u14sm3179714pji.15.2021.04.09.18.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 18:34:30 -0700 (PDT)
Date: Sat, 10 Apr 2021 07:04:23 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH 0/6] staging: rtl8192e: cleanup patchset for style issues
Message-ID: <YHEAnyO11wgp5PNZ@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patches fix the cleanup style issues.

Mitali Borkar (6):
  staging: rtl8192e: add spaces around binary operators
  staging: rtl8192e: remove unnecessary blank line before brace
  staging: rtl8192e: remove unncessary blank line after brace
  staging: rtl8192e: matched alignment with open parenthesis
  staging: rtl8192e: removed multiple blank lines
  staging: rtl8192e: align statements properly

 drivers/staging/rtl8192e/rtl819x_HTProc.c | 43 +++++++++--------------
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 28 +++++++--------
 2 files changed, 29 insertions(+), 42 deletions(-)

-- 
2.30.2

