Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EF5168
	for <linux-staging@lists.linux.dev>; Thu, 24 Jun 2021 11:25:10 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id 13-20020a17090a08cdb029016eed209ca4so3284089pjn.1
        for <linux-staging@lists.linux.dev>; Thu, 24 Jun 2021 04:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AvRzk6yM4BX1NO5XMxEtdArbNT4paDVtHU1ZzBJEtC0=;
        b=ZucTXTtcuQRo5/mqSnG5JDGiaO/6AySlJbTTkNZd2961RYCpQdnDAV5hu58lP286uN
         rbA/vwA0GuvmfyP4ZcD8GOwqUc87JKfkdwxFOkH0JeyyegY96WQfxaq402f2n+9eCVOg
         SUSojswAsqdRzDtBnt2j+6HaEZc7FGS9tSHMPapzxbLrfgMSLxU0UluJ57wTPbwjov/a
         21kmEUPlVqZTtNCGZbJeySWFfsKE9gD/fZuOZ87xAuvC2a5y/+8RcMu3u9fbaV1V4ZGK
         3iNNtyqFv7TpU7Wi+g7Wo0lU1tN96jiotb375rgyKj8H1kEdkHMdZpFrc4PEUle6xTNi
         fVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AvRzk6yM4BX1NO5XMxEtdArbNT4paDVtHU1ZzBJEtC0=;
        b=EPFSslmpOqTz7KWX/YihS6hieyfRW8zDD8f6Ivxu6ShhOLmQrQl+NPLevtjJnMK9l3
         KBQxuN/NLO2bmiygWeRoE4UCQfWsXB8XyA2qEwQdyUmqCG8FB0WB8FLHmVyBWVc64DTn
         lbeLd5YPV9TGlmeRPouHZKd5qlQro41JpgXg6XYqwKLtYYiJk04QzKeruB1kD7FMnkES
         8QSH/f7Q4vo4AvCmqJ6JMSbAUfTt5EneHqrlNDjhR/HbP/ldLkznp6p579i+yilDBySY
         GMZrMHuDxnNkw6VmGVZ4mD6Z1m5INb51muiiE7NpN7FKq34PCPpgSRzqneKX8DBoKPX0
         7s0Q==
X-Gm-Message-State: AOAM531M02wBhy4xVV5odYZBpnBsWdtBaJYYgO+JFj8YNEoHZnQ6dvhr
	BbYJRHCmCYNHQ/F8ouMFMHg=
X-Google-Smtp-Source: ABdhPJz/EGT07gFEDdUsHICmy8CCAGTPDKKFllLVjQePTtBP+V7Guimcr/NEVqCw8G9dWlpLubZvVw==
X-Received: by 2002:a17:903:31d3:b029:ee:bccd:e686 with SMTP id v19-20020a17090331d3b02900eebccde686mr3907255ple.1.1624533909744;
        Thu, 24 Jun 2021 04:25:09 -0700 (PDT)
Received: from localhost ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id w11sm2227719pgp.60.2021.06.24.04.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 04:25:08 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Thu, 24 Jun 2021 19:22:45 +0800
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-staging@lists.linux.dev, netdev@vger.kernel.org,
	Benjamin Poirier <benjamin.poirier@gmail.com>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Manish Chopra <manishc@marvell.com>,
	"supporter:QLOGIC QLGE 10Gb ETHERNET DRIVER" <GR-Linux-NIC-Dev@marvell.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 13/19] staging: qlge: rewrite do while loop as for loop in
 qlge_sem_spinlock
Message-ID: <20210624112245.zgvkcxyu7hzrzc23@Rk>
References: <20210621134902.83587-1-coiby.xu@gmail.com>
 <20210621134902.83587-14-coiby.xu@gmail.com>
 <20210622072036.GK1861@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210622072036.GK1861@kadam>

On Tue, Jun 22, 2021 at 10:20:36AM +0300, Dan Carpenter wrote:
>On Mon, Jun 21, 2021 at 09:48:56PM +0800, Coiby Xu wrote:
>> Since wait_count=30 > 0, the for loop is equivalent to do while
>> loop. This commit also replaces 100 with UDELAY_DELAY.
>>
>> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
>> ---
>>  drivers/staging/qlge/qlge_main.c | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
>> index c5e161595b1f..2d2405be38f5 100644
>> --- a/drivers/staging/qlge/qlge_main.c
>> +++ b/drivers/staging/qlge/qlge_main.c
>> @@ -140,12 +140,13 @@ static int qlge_sem_trylock(struct qlge_adapter *qdev, u32 sem_mask)
>>  int qlge_sem_spinlock(struct qlge_adapter *qdev, u32 sem_mask)
>>  {
>>  	unsigned int wait_count = 30;
>> +	int count;
>>
>> -	do {
>> +	for (count = 0; count < wait_count; count++) {
>>  		if (!qlge_sem_trylock(qdev, sem_mask))
>>  			return 0;
>> -		udelay(100);
>> -	} while (--wait_count);
>> +		udelay(UDELAY_DELAY);
>
>This is an interesting way to silence the checkpatch udelay warning.  ;)

I didn't know this could silence the warning :)

>
>regards,
>dan carpenter
>

-- 
Best regards,
Coiby
