Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FE970
	for <linux-staging@lists.linux.dev>; Mon, 28 Jun 2021 00:15:36 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id e22so13858711pgv.10
        for <linux-staging@lists.linux.dev>; Sun, 27 Jun 2021 17:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VZuXigR7cViPxOT07DRneZhTndTX7Fj6p6fDTv4kP8Q=;
        b=gmUtWqSmrtkcw9/cvXq/DSN5fCGFmCdhAod5dOcElRSbdTpZMZWBXSzXctMoAxfuuH
         eFR/illJn6tVQet6en3xgmCInx33P2HgRYqQwH2DMC2egOMspMvJmRmubVUOf8e3GxQp
         RCBr/XGQjqYwe3Ak5WFE25OuKI6/EP9CyXy2j4M5HruBS3Hc8YtxQEaj+PLty5+ynOMx
         0vZFKQvPGsy2JG3+whUGOnYbccRx89hNxv58+NALqiJIGe5nghyupTT/wvKqtTB/DiUP
         O/HRN3vcyjBBO8nOftKZBspNHwXsnRqx9EkF0ESpJTfW6Q1Z6uFrNYS/V/AwYUXIbhMq
         i6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VZuXigR7cViPxOT07DRneZhTndTX7Fj6p6fDTv4kP8Q=;
        b=GTjXRRrUPcXOHU82yTa0fvEEa7031obSuR6HiproosyncLWcYn9jghjDI9RD9ynvJA
         eghyPur3c5I/Ae0Ew2Me9PUa7QtR2pbYiTt90m/p9F/REkO/1QG5p62PUVV32vj4N3k7
         DtXOeFrxeAhMl2OasEo998jFF4REdK5oeshFVpUcyWaiwA1rmjZsXMBJEUe+GViRjQxM
         Pgsg1RuHp7kelTffpOfuduqcumnoa03XKOnVMuzVDrLzHaIR6Cf38HtV0htHV89mZ9AE
         gGoKV+V/NWmwNy2D2ZaUmjprzXWdyLPwc8492qyWWvd01nZtuq5CYzNAGtvwJ2NFtMKD
         IEbg==
X-Gm-Message-State: AOAM533UWdeHDZs3S7dbrYkfpHxyc1iHd49bY2PsbRMnneNWs/liLnVn
	24DVdp2xmNHnvy0bj+Mamj8=
X-Google-Smtp-Source: ABdhPJws2QhuGOY4Ocg5kOzw0hbRAPY1TXZ0N1TR1cnkc9ACDq+YGz7eOLgwaaIszXzanMiQl07HUw==
X-Received: by 2002:a05:6a00:10cd:b029:30a:ea3a:4acf with SMTP id d13-20020a056a0010cdb029030aea3a4acfmr7760984pfu.51.1624839336176;
        Sun, 27 Jun 2021 17:15:36 -0700 (PDT)
Received: from localhost ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id w20sm13813106pff.90.2021.06.27.17.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 17:15:35 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Mon, 28 Jun 2021 08:14:42 +0800
To: Benjamin Poirier <benjamin.poirier@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, linux-staging@lists.linux.dev,
	netdev@vger.kernel.org, Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Manish Chopra <manishc@marvell.com>,
	"supporter:QLOGIC QLGE 10Gb ETHERNET DRIVER" <GR-Linux-NIC-Dev@marvell.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 01/19] staging: qlge: fix incorrect truesize accounting
Message-ID: <20210628001442.7fl3v6to5dzr557a@Rk>
References: <20210621134902.83587-1-coiby.xu@gmail.com>
 <20210621134902.83587-2-coiby.xu@gmail.com>
 <20210621141027.GJ1861@kadam>
 <20210622113649.vm2hfh2veqr4dq6y@Rk>
 <YNK+s9Rm7OtL++YM@d3>
 <20210624114705.ehmzmysl3vdylg3x@Rk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210624114705.ehmzmysl3vdylg3x@Rk>

On Thu, Jun 24, 2021 at 07:47:05PM +0800, Coiby Xu wrote:
>On Wed, Jun 23, 2021 at 01:55:15PM +0900, Benjamin Poirier wrote:
[..]
>>>> Why is this an RFC instead of just a normal patch which we can apply?
>>>
>>>After doing the tests mentioned in the cover letter, I found Red Hat's
>>>network QE team has quite a rigorous test suite. But I needed to return the
>>>machine before having the time to learn about the test suite and run it by
>>>myself. So I mark it as an RFC before I borrow the machine again to run the
>>>test suite.
>>
>>Interesting. Is this test suite based on a public project?
>
>The test suite is written for Beaker [1] but it seems it's not public.
>
>[1] https://fedoraproject.org/wiki/QA/Beaker

FYI, the tier-1 tests are part of the CKI project and are public [2].

[2] https://gitlab.com/cki-project/kernel-tests/-/tree/main/networking

-- 
Best regards,
Coiby
