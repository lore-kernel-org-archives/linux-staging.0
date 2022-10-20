Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334B317C4;
	Thu, 20 Oct 2022 05:28:45 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id z5-20020a17090a8b8500b00210a3a2364fso1676374pjn.0;
        Wed, 19 Oct 2022 22:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=idaemZJ4csdYQSk5DNwSXmcpzySUvaL6oGtY2A/pmHc=;
        b=bPyjIzfP8NR+KGkFgJtIYT2TRbQoO0X5uDTBkC6qKpQa+6t+BPqZCc6IrFdzL3TM8D
         3voGE7l/kHaG2qYIZxfW0ixOKDyFLYrbKV/YvIA7IfXxXZfShZqRscZ/4+xSdQ9OEoex
         lo5HMIQZtXxUVX9VoUG8SOlajoZ5TajJNjClnfJBWQIGusHVhWUIY9NSzqtBtQ4TJXSN
         ChybBcVm9jNL/MEJrt/ZS5iLKnUdAV/q3Z1px+7iHHL7+cO1KfxLDFDLXrzn3xtFz0uY
         1tKYKxRq/OCN0V7Cmg+y2UYvTpOW1w1iOlELao/FdHCsbUXwPkpDKqzkNr8IAAeZx3sp
         rc/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idaemZJ4csdYQSk5DNwSXmcpzySUvaL6oGtY2A/pmHc=;
        b=cppfJbVwdxzHjlifFuk9XgRG6depgCxn1PnDm+1Zdw0aiAL95fJAvfkE57fI85qbdJ
         DmUjoRPluXPrGkrXw5glG39LsAMR3pGEA4K2kSJFwxav8S4iEHA6aNHyHassukfKMOWL
         vCfORigRO1GtVlcD4uXOjn2qdxlXC3/c30yIS4IDn6VLm6YYbWQD1QVo3dCdUjZdePe0
         D6ZO8O+sC4CqKKSOTfC77aXorvCPdrgdh4ook621ZrErmutgoUZXd/CHGqhXtL7NM5UE
         PNUvFp8L487I2Do8DUQp7dMHiPkaQK83rvjNFB82h2jI0IcT+h2MERqp5kHmLp73rht5
         eXyw==
X-Gm-Message-State: ACrzQf2SRYzPwrTjz+Tj2G0hilu26HSIdgjB8d1DNCuj4PpG23YYdbHx
	0zxsCqGpKMUHtb0Q4BnCt0vXNlFOWjXe+Q==
X-Google-Smtp-Source: AMsMyM7Ghg0TLaHKU8+0sdAQTVXNr1b0AdUrotXbCxjXB3blG78Ufy8peRucdlv0AdNoEKKqVCIxWA==
X-Received: by 2002:a17:90b:33d0:b0:20d:5edf:8b92 with SMTP id lk16-20020a17090b33d000b0020d5edf8b92mr13865210pjb.117.1666243724769;
        Wed, 19 Oct 2022 22:28:44 -0700 (PDT)
Received: from marshmallow (192-184-163-51.fiber.dynamic.sonic.net. [192.184.163.51])
        by smtp.gmail.com with ESMTPSA id y8-20020a17090322c800b0017c19d7c89bsm11796630plg.269.2022.10.19.22.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 22:28:44 -0700 (PDT)
Date: Wed, 19 Oct 2022 22:28:42 -0700
From: Emily Peri <eperi1024@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] staging: rtl8723bs: fix white space warnings
Message-ID: <Y1DcimyMZwkSDm+C@marshmallow>
References: <cover.1666230736.git.eperi1024@gmail.com>
 <45558673b486808e7978e2e4838c6ce5a2485b8b.1666230736.git.eperi1024@gmail.com>
 <Y1DVH+UatalfjDN5@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1DVH+UatalfjDN5@kroah.com>

On Thu, Oct 20, 2022 at 06:57:03AM +0200, Greg KH wrote:
> On Wed, Oct 19, 2022 at 07:10:51PM -0700, Emily Peri wrote:
> > Fix the following checkpatch warnings in rtw_ioctl_set:
> > 1) Add missing blankline after declaration
> > 2) Replace spaces used for indent with tab
> > 3) Remove space before tab
> 
> When you have to list the different things you do, you should really
> break that up into individual patches.  This should be 3.
> 
> thanks,
> 
> greg k-h

Thanks greg for the feedback! I got the idea to put them all in the same
patch from the PatchPhilosophy guide, which suggested combining a bunch
of white space corrections into one commit. But, it sounds like I
misinterpreted what the guide was saying. Maybe if there are identical
warnings, such as "trailing white space" in the driver code, could those
corrections go together in a single patch?
