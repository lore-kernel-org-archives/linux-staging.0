Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04D770
	for <linux-staging@lists.linux.dev>; Thu,  6 May 2021 08:40:22 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id t18so4682335wry.1
        for <linux-staging@lists.linux.dev>; Thu, 06 May 2021 01:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=YJunylqKrAFKcZYPy1RKyOb0koq1mXxTxP9J/wCCEYQ=;
        b=BBxp2QpDbIHb9zC+DoVsFNeb8xxCFN+GfyhP4ugNKM27X5fwkpRihEnHOQb63kPz2m
         fL34g6Girlhu/ERxDFIXLvOnmS1zpY/k30I++XEw2aQzNkASjFcykRAeH1iygaIFlKCx
         tJKyo+NreMFvVjPJdrHLjcLiD57KAL6QcbbJrKqvFHHfDKPuiHx6GboaPohdjKb8aM2g
         /H9fl+5WuiMfCwNTOA948JqN7Xk3g2T6oGgv026d1O1xSecPSRpbvOmKafYkM15uFfgT
         nSEZg7a3k9G0pZnIEf7uuklwGo001E+Cc5mHpasGKxc/bRjkLOYc9L6TjVFg3aRBkJgH
         MuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=YJunylqKrAFKcZYPy1RKyOb0koq1mXxTxP9J/wCCEYQ=;
        b=AFlRehlARUIhDLECuN3wXOc8JcvlDSJv6av9hts5AHHTdfbF25fBylaX1TvTIXuxE5
         CtptNjNdFykgda0Cs50skFsfc8bpcpa5xbBefxs5veL98DBAYV0ejFSoO17NdCueaOf7
         yR8Md+YGe1ReD46RRt1bR4/izPO2fJ1gb4qjYCgy8TcmjiS4LopYpLDyhjvgW6gzHgfG
         lU2GcuoC4BCRefFjdkmtC4yk8C+AZN2PPmW8HHTE83iRCaXOlxG0NXcYIkqH9QetXSg+
         83oN6t3DuEqKu9cc8vwOkc5COiux1pKEVTUBUw/N+HHqYWQkQAd3YPcU+PsXmE8ORtI+
         E6uw==
X-Gm-Message-State: AOAM533gbVhJW1mzN6isG4M11Lz/fZNRQJqrzdA9gQWMvdDVxZplW3n+
	l9WiVSpHYWaHHvqr4FM3r1Y=
X-Google-Smtp-Source: ABdhPJyThqFAZpsE+bzKd4GFo9l8mESA5LbbLywTkBvBxeUGPo10bbKVN4z4GXuI3zK3yzvWEHhLXA==
X-Received: by 2002:a5d:608a:: with SMTP id w10mr3657055wrt.342.1620290421303;
        Thu, 06 May 2021 01:40:21 -0700 (PDT)
Received: from agape.jhs ([5.171.72.109])
        by smtp.gmail.com with ESMTPSA id v13sm3100952wrt.65.2021.05.06.01.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 01:40:21 -0700 (PDT)
Date: Thu, 6 May 2021 10:40:18 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Sven Van Asbroeck <TheSven73@gmail.com>, linux-staging@lists.linux.dev,
	kernel@pengutronix.de,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/2] staging: fieldbus: anybus: Make remove callback
 return void
Message-ID: <20210506084017.GB1432@agape.jhs>
References: <20210505202923.198607-1-u.kleine-koenig@pengutronix.de>
 <20210506064843.GA1432@agape.jhs>
 <20210506075213.uytlw6txmgstapam@pengutronix.de>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210506075213.uytlw6txmgstapam@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, May 06, 2021 at 09:52:13AM +0200, Uwe Kleine-König wrote:
> On Thu, May 06, 2021 at 08:48:44AM +0200, Fabio Aiuto wrote:
> > Hello Uwe,
> > 
> > On Wed, May 05, 2021 at 10:29:22PM +0200, Uwe Kleine-König wrote:
> > > The driver core ignores the return value of struct bus_type::remove()
> > > because there is only little that can be done. To simplify the quest to
> > > make this function return void, let struct vio_driver::remove() return
> > > void, too. All users already unconditionally return 0, this commit makes
> > > it obvious that returning an error code is a bad idea.
> > 
> > looks like that the commit description hardly matches what you changed
> > here. You changed the return type of handler remove() of struct
> > anybuss_client_driver. Are the latter and bus_type tied in some
> > fashion?
> 
> Oh, vio_driver leaked from my copy-and-paste template.
> 
> > Why using :: notation?
> 
> If you have a better suggestion I'm all ears.

maybe a simple dot? '::' reminds c++ or rust, this patch fixes c code.
But I don't think it is a real issue, I was just wondering why you choose
'::'

> 
> Will resend with Sven's Reviewed-by and
> s/vio_driver/anybuss_client_driver/
> 
> Thanks
> Uwe
> 
> -- 
> Pengutronix e.K.                           | Uwe Kleine-König            |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ |

thank you,

fabio
