Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A436372
	for <linux-staging@lists.linux.dev>; Wed, 11 Aug 2021 03:34:01 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id u16so909531ple.2
        for <linux-staging@lists.linux.dev>; Tue, 10 Aug 2021 20:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=m6CXaNqtRLHnClh51em5VXaRltlyHBjfVA0SbTkGniM=;
        b=jad795R/giqx2OsIdRjkwKtgm0giTnxaDbCT3VT9yFTfUP/k3gLoHwlLyPXz6OVbhg
         OLzqxquD1JK2WMEMi+Vh5rTN2MO7wNDBiAmY+Alo2XLsh9rJ7iS6UKQkgUguSYo3yRKp
         HS2uVGAF9LSmYjEnMLCVQd1VeeOktb116TYYrgkZdXHaZDapNqXtcxJRgXJdCQBPo7qN
         TvueySgj81xZ5iPHJseIM6tpaFH/LopvFkTlf6yHIr44+XoI8oBTpHaY8UThu6r+Aewz
         C7jh4bFm+DMedm7ocGOe7zfiq17fNZpvU+f8eHEt6zmsmLClP7JmSkkau5v1xEavRqlh
         v0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=m6CXaNqtRLHnClh51em5VXaRltlyHBjfVA0SbTkGniM=;
        b=d8gDgw53SGHv0puYjeUXDNenuocHmAgDOdMztPkzrMWf3hF8BO0eVBHpcN3dDTXiw1
         vus4xFmZKIhFLO5YlhMB0RpCF9DH23zOEoAd+GQ6KQFCN8OC1gw+0ynm2LFyZ8Ilt4c4
         8GuGYGOkLrN0XaAYBYkVQh6MiF4JEJhByW1LBZ63Tvc1NBsAgwJNRZ+qN/jrLDvkYxdy
         fCgcnXB7ip4+LLgAQoosFxXk1Cdd9yQaUOWAYRvZf5fkmhJEaWj7sT1a2lZlRKA8VYs2
         rsLd3vv0iQfbsoToBPzesbJrAJVLKCXiCSCSpOs5OuHgExtPXCxjHf+AvI7ZNm86MZto
         bO+A==
X-Gm-Message-State: AOAM531utbFoTXX7NfP2xcB1WvimeMIysIVVrPE/xtahVz9vLTTyblM/
	ksEANHLoiXrtDQQ+XtlF0Cc=
X-Google-Smtp-Source: ABdhPJzWJwpud25p45iHCCPjvKh3LtcAdaaJ1vu//greJ4qXp1F4M6T5UOfnv2V19XQijt2f8tk3Fg==
X-Received: by 2002:a17:902:7008:b029:12c:ec3e:3952 with SMTP id y8-20020a1709027008b029012cec3e3952mr2443860plk.35.1628652841209;
        Tue, 10 Aug 2021 20:34:01 -0700 (PDT)
Received: from [10.178.0.78] ([85.203.23.37])
        by smtp.gmail.com with ESMTPSA id d5sm6841587pju.28.2021.08.10.20.33.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Aug 2021 20:34:00 -0700 (PDT)
To: gregkh@linuxfoundation.org, will+git@drnd.me, davidsondfgl@gmail.com,
 zhaoxiao@uniontech.com, dan.carpenter@oracle.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 "baijiaju1990@gmail.com" <baijiaju1990@gmail.com>
From: Tuo Li <islituo@gmail.com>
Subject: [BUG] staging: rtl8192e: possible null-pointer dereference in
 rtllib_wx_set_encode()
Message-ID: <a86f508c-84b0-3523-2a8e-6710e35e5bb3@gmail.com>
Date: Wed, 11 Aug 2021 11:33:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hello,

Our static analysis tool finds a possible null-pointer dereference in 
rtllib_wx.c in Linux 5.14.0-rc3:

The variable (*crypt)->ops is checked in:
342:    if (*crypt && (*crypt)->ops && strcmp((*crypt)->ops->name, 
"R-WEP") != 0)

This indicates that it can be NULL. If so, null-pointer dereferences 
will occur:
389:    (*crypt)->ops->set_key()
400:    len = (*crypt)->ops->get_key()

I am not quite sure whether this possible null-pointer dereference is 
real and how to fix it if it is real.
Any feedback would be appreciated, thanks!

Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>

Best wishes,
Tuo Li
