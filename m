Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EDE2C99
	for <linux-staging@lists.linux.dev>; Mon,  8 Nov 2021 15:48:39 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id f5so15482381pgc.12
        for <linux-staging@lists.linux.dev>; Mon, 08 Nov 2021 07:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=yS9RVOYSJmLmsjplw6tcopiKSzTd9TMH34xX1w9V238=;
        b=GaG5gwfYDsY6S5gEPFlYty9FkBO0xUxnhHCh5q3oGiw+pVhceO+fm3xYdU3j7hriFf
         zNm/HGCN1t1a6RRGVqGBN/N1UjTSUlRofW/vATUZ/LBDjQHL+cCZuui0mnBHjHrhhn9k
         bYlbxklFvcCtOpA2slWgoGBUPuck+0qBbJf89PX+efcL5mh/8HoibJ1lGMJPfB+ZRzfy
         N9MPizJxzURIQnlTjPiJMO8JEiXHomBXUJAxpGHRsNEaz2bM8DCxGuuSnrdSgaJHjV6J
         +BPYjiCN8qx/mmoyUeaDKf8vPt1LVGemgGgMEur4aQ7KNhk9M/dTyNpE7UT+I1+Op5Wb
         656g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=yS9RVOYSJmLmsjplw6tcopiKSzTd9TMH34xX1w9V238=;
        b=EUeWvnwldqTS2FSLftDJN5G8uH6SYbqW/HUATzyc1IGGSLAWc3n1w/E7y9h+Hy2pd/
         UbMBN6tF0zWzsfkSD0Y04qC56XxN5JYRL2w6QTzea5CmfLUo/uIKbYDu8H/wBJOZsm6Q
         U7kZLoR+vZBK6OYbrGXZguhuQeXqxLzZYBoeqee+rWCKyFZ0FlfZ6hn5/+sDXS5xQGGf
         aas3+l55nvcZvv6FMTxB/w8TAMXeJPWcmZDrgH8Mbapv1+ianlJtRmN0oNjmJBrKyWwb
         6OAa0tBhwLZlfVRUPReetX5AqEK9bdxTSPcaJK5FRqOe90piwaTR61th6LTHuTpk8jAr
         3JTg==
X-Gm-Message-State: AOAM532/7NX1jRMWO0SYELRjIUukUvfzKQwYIcLRpAVX5JleS1S67UKI
	0Ur7wMhFSurpq3IjZFgzOjA=
X-Google-Smtp-Source: ABdhPJzlS6xr6yExAOENTvlx33UuzblttBiBy/PsFjq5pssNpcnIMno4bFDl3z/oWLXnYHwWYScSXQ==
X-Received: by 2002:a05:6a00:170d:b0:49f:9b39:d555 with SMTP id h13-20020a056a00170d00b0049f9b39d555mr393823pfc.27.1636386519115;
        Mon, 08 Nov 2021 07:48:39 -0800 (PST)
Received: from ?IPv6:2400:4052:6980:3800:dba7:2b1f:3f26:a5ec? ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id bt2sm16621345pjb.33.2021.11.08.07.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 07:48:38 -0800 (PST)
Message-ID: <abada89901e0ca11f13d8380de8c1184522eb6db.camel@gmail.com>
Subject: Re: [BUG/RFC PATCH 3/5] [BUG][RFC] media: atomisp: pci: add NULL
 check for asd obtained from atomisp_video_pipe
From: Tsuchiya Yuto <kitakar@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Patrik Gfeller
 <patrik.gfeller@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Kaixu Xia <kaixuxia@tencent.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Yang Li
 <abaci-bugfix@linux.alibaba.com>,  Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Alex Dewar <alex.dewar90@gmail.com>,
 Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>, Arnd Bergmann
 <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar
 <mingo@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org,  linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Tue, 09 Nov 2021 00:48:33 +0900
In-Reply-To: <20211102130245.GE2794@kadam>
References: <20211017162337.44860-1-kitakar@gmail.com>
	 <20211017162337.44860-4-kitakar@gmail.com> <20211102130245.GE2794@kadam>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

<removed Alan from Cc as the mail address not reachable>

On Tue, 2021-11-02 at 16:02 +0300, Dan Carpenter wrote:
> On Mon, Oct 18, 2021 at 01:23:34AM +0900, Tsuchiya Yuto wrote:
> > diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> > index 366161cff560..7206d29ba263 100644
> > --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> > +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> > @@ -1715,6 +1715,12 @@ void atomisp_wdt_refresh_pipe(struct atomisp_video_pipe *pipe,
> >  {
> >  	unsigned long next;
> >  
> > +	if(!pipe->asd) {
> 
> Run your patches through scripts/checkpatch.pl.

I'm sorry about this. I did checkpatch for another series I sent earlier,
but forgot this series.

Regards,
Tsuchiya Yuto

> > +		dev_err(pipe->isp->dev, "%s(): asd is NULL, device is %s\n",
> > +			__func__, pipe->vdev.name);
> > +		return;
> > +	}
> 
> regards,
> dan carpenter
> 


