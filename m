Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792480138;
	b=fFCGxUszbmXhAMny/TfBW4/DvFd8Ht4mUllji+YDfUfBva5bjutUawc3hdWHsWEaZK56
	 T1FWEAz2fYqj6NFZM3ehy7AVQBsYJq+NN2LZb5OysnHBtHoiJAj/R6QzjhNHplj/H5rYF
	 qI1MR9QhFfB0iG1Z/b/hDwT2IEVWfFucW05z2yF3vZaQECKvAOAIxq3ZDGom76YbLZGjp
	 lGqNU5/q1z8dREpQRpOJh0+EgsdwpAey7HI0oR+MIvzKH4UofRZJv7XPSh1oBeuetqb8x
	 1JLpNNPtVqJipjkKZaFvPbYa+84gJt5MlUm5lZ877QWC0L/WdaLZ95if4r2fJxxVk6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792480138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=kolieKWh2nPC2nJyOLCFMBJ1N1MrKdM8BWLbLnHeQB4=;
	b=pkfPaDAY0KTcjs970CK/yg4R50gO+5qd+im+ESy8/SETXH8/rphiDcjZioDVIyG0dsMu
	 j9hDk5rr5oKTwBrrBUf7vMSpo41zewKs9EXqZnwLDA+03Ad+tWrlBC+XImsD3hM7xNzOo
	 KEC1vQBti9i1L1J1jrG0JVX6bQSFgyk7WnTiKg4OGMqB3xUL7oTavykLcoKqdE54zDLOM
	 vj05WDL+9ATj22djcJD7FSqEWz3QvLNB/j5MmQCyaXeERIHe8gg5uM4NdNDh/VdgQRHRd
	 HvoqgiWH40mPYDLah8RGqHR8iF+OUWkAc/EmeLfIFdPahpv4O6tiBQpJjNbb2e21pkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gCLi41xK;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18054606A319
	for <linux-staging@lists.linux.dev>; Tue, 20 Oct 2026 07:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18054606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gCLi41xK
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a01933b584so20304635e9.0
        for <linux-staging@lists.linux.dev>; Tue, 20 Oct 2026 00:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792480136; x=1793084936; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kolieKWh2nPC2nJyOLCFMBJ1N1MrKdM8BWLbLnHeQB4=;
        b=gCLi41xK1CjP8Fs3tv4WKpAzPBZXQMPpHK3i5HoVC20QCtalNRTEQT1JfiwWMv/xLT
         rIzYKnKk0GQP0lFNs+ef81OuixqdWnoLADBPJVhe6+QrhcyL/1nwIt75VpjYDMNGcRT6
         7vzKnbsuVVhq8jPl6V0YF8TOXOu3ksygax/5FK3KzUSGvBExKt6OksNtEuUjH6ZywQoU
         MNp7HP81TND9Lz9N94JAkRH9+jDLqYwaJCcw5nfI9irTxbVZjTEY9V953nZgBeQtzTKH
         TEhrYNz8GVHRQcDiELPiGJdnizqbYWdj5vPB0UpprTsZqxTAx7mcFfNsVIC/OTn28qFa
         WL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792480136; x=1793084936;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kolieKWh2nPC2nJyOLCFMBJ1N1MrKdM8BWLbLnHeQB4=;
        b=0j/m50se6WZLFCkYvq7S/w5ays6O+aIkoCEq7WQM8LVGDr6bc9RR+njmhBgtSpXDvc
         HmLtJtztUWEzoznqYDo8ht0N7y72RmEgdZ12VrNR9XgaMqQNPI72+7cyX163wUU5licI
         HKaduYY1jbiq75adzpTYMQVt2FQeihRv0xA8ACYNoP7558Jv2Ayb+Djl+ZTb5VR5n+v+
         r3S9KYHAYy3RbQDTJ7+YM0vGnaNocUEx9KpMavW3OmpL9klhMkwg3l72k2kcE4R/oM+8
         sYfKdXdl+/NzOKis5pWJ0tjbg4XxFAMzcRVcrof5yxf2yjhf8bLjH7w/4bFg2cGmMqlv
         Cn5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwxznhSG9eDm16K5v2b10mFJHkXgmO41T141TYMFhYqka0iD9LBaSr9k4G5G09i7/0HoKk8F5IXLx6R61XQ@lists.linux.dev
X-Gm-Message-State: AFq9FYLx3PtrCYK4GK2S7MqyD4V1ohoqKvFKG1xieb9Rrd7G5eJGY0jH
	jiBo/ctyVXHgJTg4e/G8XOTZS+orH/DRzBJAmU2UBIJ5R4hWCIZnHBE4GGrcVQ9btTk6FBg1
X-Gm-Gg: AYBFou3oGAoscJuR+BcQ/Kk7B2WyDCFgv6nq9AcBkRfKeWhoSO+yU+a37Ip70virACC
	8fRu6w+mz+krFP9KlgnA7nB3fRMm2r9n7tiM2hnSh9TkLzUquRupwWpwf4BJuNsGv0J2dDjMI2w
	Sf2uAx2L37Dn5jqftdcRlwy4/nIleprM4MYGch9ln8sdoU2NFFzmIVCdEk5a1VHM9D5B2Orrvie
	H9Y4JYZTuCksCI6/p6h9sdqIdvodLeDELdEdwFG78Zun212ayYvH6haMV8XADK75MpqRCsPruXi
	cd7ocQsbTDUvOjmInihSuTqMP+TP7cvP2twn2W3a3fnE0XxbYZAk8UsU9TvZCWR4XfYT8aGjnbO
	dM+zaX5W8bOPuA9YB+uxHF7FfUA5J70Mu229/ixW/pbxa7KNkNDN493ZDQAycqggpcS+Lp+L0My
	Iw3RNcKL/d4AAl1cMZ26wPMAfwIuSEaYH36GHgcf3dZY0BQAer7DQ7MmIcaIjbx0hRROs=
X-Received: by 2002:a05:600c:4f95:b0:4a1:a7f8:c11f with SMTP id 5b1f17b1804b1-4a1d75e6e09mr228906055e9.9.1792480136359;
        Tue, 20 Oct 2026 00:08:56 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d6e2dbsm53727135e9.13.2026.10.20.00.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:08:55 -0700 (PDT)
Date: Tue, 20 Oct 2026 10:08:52 +0300
From: Dan Carpenter <error27@gmail.com>
To: sarbansah151@gmail.com
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: replace yield() with usleep_range()
 and cond_resched()
Message-ID: <atcThOcDxCXURMw4@stanley.mountain>
References: <CADyAg8dZO9PfT+wkj-qDAEAgBOs8AK0fjs5ma4q3qAT+BKxOBw@mail.gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADyAg8dZO9PfT+wkj-qDAEAgBOs8AK0fjs5ma4q3qAT+BKxOBw@mail.gmail.com>

On Tue, Oct 20, 2026 at 12:59:47AM -0400, sarbansah151@gmail.com wrote:
> yield() merely reschedules the calling task and does not sleep, so
> using it in hardware poll loops spins the CPU while waiting on the
> device. checkpatch.pl flags this class of bug ("Using yield() is
> generally wrong", see yield() kernel-doc in sched/core.c).
> 
> In the firmware download poll loops the git history shows a
> commented-out mdelay(10) at these sites, which indicates a ~10ms
> delay was intended; restore it with usleep_range(10000, 20000), the
> correct idiom for sub-20ms sleeps. In the firmware checksum/ready
> poll loops use usleep_range(1000, 2000) to rate-limit register
> polling.
> 
> In the TX path there is an explicit comment that sleeping even 1ms
> causes throughput loss, so use cond_resched() there instead: it
> yields the CPU only when the scheduler actually wants to run
> something else.
> 
> Signed-off-by: Sarban Sah <sarbansah151@gmail.com>
> ---

We generally wouldn't merge this without testing even without the
staging anti-AI rules, but mainly this driver has been deleted in
linux-next.

regards,
dan carpenter


