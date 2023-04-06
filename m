Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB4879F9
	for <linux-staging@lists.linux.dev>; Thu,  6 Apr 2023 14:46:50 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id l7so37439284pjg.5
        for <linux-staging@lists.linux.dev>; Thu, 06 Apr 2023 07:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680792410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SIhojiTLqyVrTvC+meMw7ddDQq0KQb5DwLtt0z99fS4=;
        b=LPUqTdbAeabs6BLVmyhbYxfBjQSM8+XilE80rFItRmkRM+te/ztDTV20B3uSAbeeVJ
         CjxjKpGHBYXNBSpSDcHDKVV4zmaj5EFhjmH+ck6iY9Q+N50SSrAG82KiRK+TJpuTLy7T
         V4NDpqeZJ8ntPvhXOmKMytJrbLbINT9iA8maFufGDrsu/RXcH5vFxLO3hCGSDueScBy7
         YVOH6vRFhDk3t1X1oxh/a/esJ1frAlD+WQs8aok3HKMTNd6AhHbq+5ggtXJ1N312U071
         gE22a48PM2MWi0V74QQKd/ngayQKb8pickTzR1ee7N7z1y+Y4n6BijOncMGNf0+t435A
         Hk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680792410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SIhojiTLqyVrTvC+meMw7ddDQq0KQb5DwLtt0z99fS4=;
        b=cp737Dc2rEhJq3A6x1A8z7fJloeDbAbAMKAKfhDi5lB/HNTlu5NHHh2UW2skde6NJy
         KLdy0L7USi3phTcgk3cUL4PF2vPtpiq6Jsnm//OfJ6QkD50u4Vp2UOxGMtifNIgvB3uB
         nizZWUVq6XZypC71KecuAxmwrSSZJj2wQ/guFb/3z6bym8bX08LfOuGsH3tn3BoJ/Nvp
         eIw3Zt8oEkD0lyx8qtJFmqYm4slwBd2MiYHtKeW+F4vScZ6BgWNwH1rOxhJ2t+xoVa9g
         pSY491ME6g+Yxaiqd+scu6bscHqNwjFwulH/3UTvV2vOjarZ1vDZWw+H23TbgLQXOVVS
         TxJg==
X-Gm-Message-State: AAQBX9ftqty+nf5r0VHG6yZ1/4uvMfZfvL97MQohiXZ0cvHBLtGvSbRH
	2LLoB2lsTPIQ4C9wv5V0tK4=
X-Google-Smtp-Source: AKy350abzAKHLW9OvImIJ3zGuffP+U0koYbtzEU9hGSsUT299uxniBCi798jPsKoyBhL1N6xdwz4/Q==
X-Received: by 2002:a05:6a20:c105:b0:db:9e4e:8129 with SMTP id bh5-20020a056a20c10500b000db9e4e8129mr3299859pzb.40.1680792409857;
        Thu, 06 Apr 2023 07:46:49 -0700 (PDT)
Received: from sumitra.com ([59.95.156.146])
        by smtp.gmail.com with ESMTPSA id j11-20020aa78dcb000000b005e4c3e2022fsm1483340pfr.72.2023.04.06.07.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 07:46:49 -0700 (PDT)
Date: Thu, 6 Apr 2023 07:46:44 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Simon Horman <simon.horman@corigine.com>
Cc: Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: qlge: Remove macro FILL_SEG
Message-ID: <20230406144644.GB231658@sumitra.com>
References: <20230405150627.GA227254@sumitra.com>
 <ZC2gJdUA6zGOjX4P@corigine.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZC2gJdUA6zGOjX4P@corigine.com>

On Wed, Apr 05, 2023 at 06:21:57PM +0200, Simon Horman wrote:
> On Wed, Apr 05, 2023 at 08:06:27AM -0700, Sumitra Sharma wrote:
> > Remove macro FILL_SEG to fix the checkpatch warning:
> > 
> > WARNING: Macros with flow control statements should be avoided
> > 
> > Macros with flow control statements must be avoided as they
> > break the flow of the calling function and make it harder to
> > test the code.
> > 
> > Replace all FILL_SEG() macro calls with:
> > 
> > err = err || qlge_fill_seg_(...);
> 
> Perhaps I'm missing the point here.
> But won't this lead to err always either being true or false (1 or 0).
> Rather than the current arrangement where err can be
> either 0 or a negative error value, such as -EINVAL.
>

Hi Simon


Thank you for the point you mentioned which I missed while working on this
patch. 

However, after thinking on it, I am still not able to get any fix to this
except that we can possibly implement the Ira's solution here which is:

https://lore.kernel.org/outreachy/64154d438f0c8_28ae5229421@iweiny-mobl.notmuch/

Although we have to then deal with 40 lines of ifs.



Regards

Sumitra



> ...
