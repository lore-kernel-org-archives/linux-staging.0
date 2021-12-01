Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89082C82
	for <linux-staging@lists.linux.dev>; Wed,  1 Dec 2021 12:15:15 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id 71so23387802pgb.4
        for <linux-staging@lists.linux.dev>; Wed, 01 Dec 2021 04:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=BWoLD73QX7+FTV8wI4C4spMqnEhiSiDSCX55FCfSJCY=;
        b=kQqXd4xSOM95bxGvC6GxBhxVGdA9YzvNYCOYV/Atd/5DdJj9JoXege7BjluyfAuB/m
         75bnJwrpfwrMx93jOy6SNvGSjnpsbKQTYPKk0PhHfZteDHktLfZrIroHHuaDw7jYlTu9
         q/uaE7HZ+uVz9PNryie5aYSDrV/aPZN6rDH1kHj4Y8Nw3mD0g45xedzXwfTS4zvdLqWx
         fYNdE9nA4UpUaUrhW1kG0KnlIbZXt7fazt8Pe3NqlCYFPYYjARZMdezbGFh6UCkFULK5
         1buNzS8EDwHvZi+w5hh0ixT/bh9sG7oTfW9beWjdxcf8OFKlTfsv6Cmr+6t4G2ySR/oT
         MEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=BWoLD73QX7+FTV8wI4C4spMqnEhiSiDSCX55FCfSJCY=;
        b=CkSlI2ALf1kmdK//Mh9ZpmnMXiCYy+5BFCJ1qjQbundV0XzebU0ryKm7pT1S067aEu
         ko3ovUPqXqjTB/7SJbzhSvfT+nOHp01MPkK8Pdg3DY3HVGf3rmuustocDeuDAP9qJhNU
         inlVpOyN1FmEiVVHHVqyFl1Veqoeiflne68wuZ8EAq0QBfXv+v8Y7QL+wYGlXn2Jatfs
         ZPU1/MMS+Hv/jIRK6KiSuFxDF/HEq4CpJHwaw42er9r98eylMTqgjtH39zfD3tNgVjux
         xVrmBhoySU/q+L9QniKJi2oPFVHDhzmJgbC2aLFaia1fPzejADI6S0ijngAeO5uFZqcX
         GWkQ==
X-Gm-Message-State: AOAM5306o1x9bupTMHgxHlPd+hhdsrSIrMcyAko/eI4KL2n21RhRDWxG
	8SplXjJ/YSKsjgpRPH2ghrgJga9VnuVpYQ==
X-Google-Smtp-Source: ABdhPJxMgXPlCDOFu23je2GMfoYQd20LckC3gvpVejUhzQq4Q6FGmpk7+yyeE7OvXMindEJXjgQWDA==
X-Received: by 2002:a63:e648:: with SMTP id p8mr4362617pgj.620.1638360915420;
        Wed, 01 Dec 2021 04:15:15 -0800 (PST)
Received: from ?IPv6:2400:4052:6980:3800:dba7:2b1f:3f26:a5ec? ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id x33sm24790606pfh.133.2021.12.01.04.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 04:15:15 -0800 (PST)
Message-ID: <0d5acf26f560b82da9d77a2c9d46042d8c4cd5d1.camel@gmail.com>
Subject: Re: [PATCH 05/17] media: atomisp: pci: fix inverted error check for
 ia_css_mipi_is_source_port_valid()
From: Tsuchiya Yuto <kitakar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Hans de Goede
 <hdegoede@redhat.com>, Patrik Gfeller <patrik.gfeller@gmail.com>, Sakari
 Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>, Yang Yingliang
 <yangyingliang@huawei.com>, Dinghao Liu <dinghao.liu@zju.edu.cn>, Deepak R
 Varma <drv@mailo.com>, Alex Dewar <alex.dewar90@gmail.com>, 
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org
Date: Wed, 01 Dec 2021 21:15:10 +0900
In-Reply-To: <20211108163536.07bd2282@sal.lan>
References: <20211017161958.44351-1-kitakar@gmail.com>
	 <20211017161958.44351-6-kitakar@gmail.com> <20211102113332.GC2794@kadam>
	 <ed17420d96bd302479b528f7ae8694ff9cd2e72a.camel@gmail.com>
	 <20211108151455.GI2001@kadam>
	 <efaf74b587e5e31403895cd5af88852402fe92ec.camel@gmail.com>
	 <20211108163536.07bd2282@sal.lan>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Mon, 2021-11-08 at 16:35 +0000, Mauro Carvalho Chehab wrote:
> Em Tue, 09 Nov 2021 00:25:52 +0900
> Tsuchiya Yuto <kitakar@gmail.com> escreveu:
> 
> > <removed Alan from Cc as the mail address not reachable>
> > 
> > On Mon, 2021-11-08 at 18:14 +0300, Dan Carpenter wrote:
> > > On Tue, Nov 09, 2021 at 12:00:29AM +0900, Tsuchiya Yuto wrote:  
> > > > On Tue, 2021-11-02 at 14:33 +0300, Dan Carpenter wrote:  
> > > > > On Mon, Oct 18, 2021 at 01:19:45AM +0900, Tsuchiya Yuto wrote:  
> > > > > > The function ia_css_mipi_is_source_port_valid() returns true if the port
> > > > > > is valid. So, we can't use the existing err variable as is.
> > > > > > 
> > > > > > To fix this issue while reusing that variable, invert the return value
> > > > > > when assigning it to the variable.
> > > > > > 
> > > > > > Fixes: 3c0538fbad9f ("media: atomisp: get rid of most checks for ISP2401 version")
> > > > > > Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
> > > > > > ---
> > > > > >  .../staging/media/atomisp/pci/sh_css_mipi.c   | 24 ++++++++++++-------
> > > > > >  1 file changed, 15 insertions(+), 9 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > > > > > index 65fc93c5d56b..c1f2f6151c5f 100644
> > > > > > --- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > > > > > +++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > > > > > @@ -423,10 +423,12 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
> > > > > >  		return 0; /* AM TODO: Check  */
> > > > > >  	}
> > > > > >  
> > > > > > -	if (!IS_ISP2401)
> > > > > > +	if (!IS_ISP2401) {
> > > > > >  		port = (unsigned int)pipe->stream->config.source.port.port;
> > > > > > -	else
> > > > > > -		err = ia_css_mipi_is_source_port_valid(pipe, &port);
> > > > > > +	} else {
> > > > > > +		/* Returns true if port is valid. So, invert it */
> > > > > > +		err = !ia_css_mipi_is_source_port_valid(pipe, &port);  
> > > > > 
> > > > > Don't invert it...  This isn't supposed to return 1 on failure it's
> > > > > supposed to return negative error codes.  
> > > > 
> > > > You mean I should instead modify the return value of
> > > > ia_css_mipi_is_source_port_valid() ?
> > > >   
> > > 
> > > No.  ia_css_mipi_is_source_port_valid() is fine.  It has a boolean name
> > > so returning bool is fine.  What I'm saying is that allocate_mipi_frames()
> > > should do:
> > > 
> > > 	if (!ia_css_mipi_is_source_port_valid(pipe, &port))
> > > 		err = -EINVAL;
> > > 
> > > Otherwise it returns negative error codes and 1 on failure.  
> > 
> > Ah, I see! Thank you. I feel I'm a stupid... I'll do so in v2.
> 
> I would prefer if you could send such changes on new patches.

I'm a little bit too late, sorry. For the record, the return value issue
pointed out here is already gone with patch ("media: atomisp: sh_css_mipi:
cleanup the code") [1]. Thanks!

[1] https://lore.kernel.org/linux-media/b541d4c9923154be7ae0518d01ce994acbef3f9b.1637142905.git.mchehab+huawei@kernel.org/

