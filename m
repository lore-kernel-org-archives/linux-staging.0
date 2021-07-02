Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5432E72
	for <linux-staging@lists.linux.dev>; Sat,  3 Jul 2021 00:00:26 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id h4so11430175pgp.5
        for <linux-staging@lists.linux.dev>; Fri, 02 Jul 2021 17:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zLdbz+KNKw9C/s+UQg9D2c39mkDMgDODryRHEG/G82M=;
        b=LwIRYO0PPgUIWAquYY8ces1Lo5AOOwxoJysiMqJ+rjZyGg7w7Ao+0dMA8KSfoZfGc5
         6Oo5YcN7fF0sVh6fupTmApnNdpAGn0YuYpHa3RdeQ9HLQtFmhKFA3f737hiIjh27Ij9W
         owDAfDx429O+hOGvZlaLFR5Gkd4rsw2ghLWiFb4HPFKGswr0TqZDMdTWh+D6pXzBIzC7
         TJ9RTXC3Xzp9hMEp4/8lV4iOgbNyczTGxqFceZe6SCY88tHvesGZii0SoTh/P5FCHODa
         F2OjEMox6EmIGtzQ+Ffmxx62uJ3YQeVAGZmu5Hho5VHRcvFY4uTXVB2IrttX3BrbRW5b
         2TKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zLdbz+KNKw9C/s+UQg9D2c39mkDMgDODryRHEG/G82M=;
        b=ieTW4uJpWzby4H27ujI2pGXpzw+TlU1qx/Nb2Z7riue5WOVGBbFcfRsLA71S00cSD7
         Cn2c2FMhrzY8w1rVYZWCf/zTCVW4CIkPAaxhlU+oj+T7B2AaNf+uYzdQ55AxMa0Zokzq
         sQ8KqlAGmVjegHRkP+KCM8viLE0C+2xhMnS/fOq8bR12d80cfeiBQPuHeCfHr7/CsO34
         pk5wwZAOpA4RZWjbncXm1LB/KFXojDe9MWtXvD73GU7mKwY50zgIBsQFpHk8eV2VGu/j
         4jX2uaMfp5AA0oYhsMjyRyFclfpCoZlNE3/rOFTol6nz9spcgvB/m0jCW3S1Krmuq6mj
         LknQ==
X-Gm-Message-State: AOAM531MBT0QtGniGEFjpiG+e2wwrv/+SYBZwPh338LXQ/8MKHDXUt0l
	3JadaDukbfcNBe6hQy1vqzg=
X-Google-Smtp-Source: ABdhPJxnbtYL89n654xSOh6b90sp+H5567DRf8tKX47V90OuB40VjJA3YNDZpUKDYmDN9dyRce4MsA==
X-Received: by 2002:a63:7d5:: with SMTP id 204mr2416568pgh.309.1625270425816;
        Fri, 02 Jul 2021 17:00:25 -0700 (PDT)
Received: from localhost ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id 20sm3597615pfu.5.2021.07.02.17.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 17:00:24 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Sat, 3 Jul 2021 07:56:29 +0800
To: Joe Perches <joe@perches.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, linux-staging@lists.linux.dev,
	netdev@vger.kernel.org,
	Benjamin Poirier <benjamin.poirier@gmail.com>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Manish Chopra <manishc@marvell.com>,
	"supporter:QLOGIC QLGE 10Gb ETHERNET DRIVER" <GR-Linux-NIC-Dev@marvell.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 13/19] staging: qlge: rewrite do while loop as for loop in
 qlge_sem_spinlock
Message-ID: <20210702235629.k2k2q7b2lxzw4kzd@Rk>
References: <20210621134902.83587-1-coiby.xu@gmail.com>
 <20210621134902.83587-14-coiby.xu@gmail.com>
 <20210622072036.GK1861@kadam>
 <20210624112245.zgvkcxyu7hzrzc23@Rk>
 <f7beb9aee00a1cdb8dd97a49a36abd60d58279f2.camel@perches.com>
 <20210630233338.2l34shhrm3bdd4gx@Rk>
 <fe4a647d5324e9d8d23564f6d685f3ca720db166.camel@perches.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <fe4a647d5324e9d8d23564f6d685f3ca720db166.camel@perches.com>

On Wed, Jun 30, 2021 at 09:35:31PM -0700, Joe Perches wrote:
>On Thu, 2021-07-01 at 07:33 +0800, Coiby Xu wrote:
>> On Wed, Jun 30, 2021 at 03:58:06AM -0700, Joe Perches wrote:
>> > On Thu, 2021-06-24 at 19:22 +0800, Coiby Xu wrote:
>> > > On Tue, Jun 22, 2021 at 10:20:36AM +0300, Dan Carpenter wrote:
>> > > > On Mon, Jun 21, 2021 at 09:48:56PM +0800, Coiby Xu wrote:
>> > > > > Since wait_count=30 > 0, the for loop is equivalent to do while
>> > > > > loop. This commit also replaces 100 with UDELAY_DELAY.
>> > []
>> > > > > diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
>> > []
>> > I also think using UDELAY_DELAY is silly and essentially misleading
>> > as it's also used as an argument value for mdelay
>> >
>> > $ git grep -w UDELAY_DELAY
>> > drivers/staging/qlge/qlge.h:#define UDELAY_DELAY 100
>> > drivers/staging/qlge/qlge_main.c:               udelay(UDELAY_DELAY);
>> > drivers/staging/qlge/qlge_main.c:               udelay(UDELAY_DELAY);
>> > drivers/staging/qlge/qlge_mpi.c:                mdelay(UDELAY_DELAY);
>> > drivers/staging/qlge/qlge_mpi.c:                mdelay(UDELAY_DELAY);
>> > drivers/staging/qlge/qlge_mpi.c:                mdelay(UDELAY_DELAY); /* 100ms */
>>
>> Thanks for spotting this issue! How about "#define MDELAY_DELAY 100" for
>> mdelay?
>
>I think the define is pointless and it'd be more readable
>to just use 100 in all the cases.
>
>IMO: There really aren't enough cases to justify using defines.

I thought magic number should be avoided if possible. This case is new
to me. Thanks for the explanation!

>
>

-- 
Best regards,
Coiby
