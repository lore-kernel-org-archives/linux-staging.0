Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DDFA922
	for <linux-staging@lists.linux.dev>; Tue, 31 Jan 2023 18:18:55 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id p26so32989827ejx.13
        for <linux-staging@lists.linux.dev>; Tue, 31 Jan 2023 10:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2SQFNshp+niAV6ZWs0KnsP1NDdpFWrEbjuiVeSvzcaU=;
        b=RIrWdl9tEMcArKzyN+RgfkJBfsJOzolJQ6xJotRxrMAP77835kNylEL8XOMhCUGmva
         hBSZzgy3CMPyn1zbiWCe+lDLe9jx9SiU41CzSZmeART5OH4/jzdXAKkQvebO0Qu8HSoB
         GEN4UaiHWiQvJG6zHoXxggNXEm2u/dhHLTzDa50t/th+tDkoDQ3IcxpCi/HI4aU508pb
         exf+HQ1XQMiEE/GOz6raOHd37V8TwambRGkQ+NnFCPWk+B5PLgVxjH8Zk1gijEsMRdSa
         rbFeMBUbhqEW+hQHR/WkGQCxGPQH0pQcgSKPjpmAosepKc8fY5bcJ5b6zk4JCoRYZ9KG
         POKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SQFNshp+niAV6ZWs0KnsP1NDdpFWrEbjuiVeSvzcaU=;
        b=MgO5p3nuWmk2Jqdx89cHMI/mUoeg1SAhuK42D8MiuYihiOoNQ75vzKO+CB8t70LBo2
         4Mtfw8mQaswwzL9VDJBhdswiq/fWAWq0PusZTMkfRXSWIXE/rRFFzyQ3Zxy3ame/EJeY
         yqi17BG2E6Jpd+ILxksL3IT9pnEilSnheFNldlvmAPEX3R7vf2htRA9IQUWHooImVEDU
         Dr7KpyQCDN6Stb1AMJdGlwIy9eYEyu5kKt0+BUXCyartMNh0dufU6Y68nl6O40Vu4MdI
         FDpOPu8I6CEId+YAe0Yogu12wufg480d/YAMet9D5S+4Elc9cDtB3slxYNvS2KqRiGTT
         Z/zA==
X-Gm-Message-State: AO0yUKXHMdnGAcdrA8HNe0RWTyq95US8I+nRNxXDDktNYEqM5gp4hqpa
	Wl508czxI1/YmdwIalfZG+6D47E4Nw8=
X-Google-Smtp-Source: AK7set91ZIDRCD70YQC3RlYcXitaYcuYNmN9kgoIQ50Yt8skiHE+1SAtE8yAqG3jy0D+X//XykcIKw==
X-Received: by 2002:a17:906:31d1:b0:879:2a5:dc40 with SMTP id f17-20020a17090631d100b0087902a5dc40mr17140250ejf.76.1675189134022;
        Tue, 31 Jan 2023 10:18:54 -0800 (PST)
Received: from combine-ThinkPad-S1-Yoga (gw.combine.ideon.se. [85.235.7.115])
        by smtp.gmail.com with ESMTPSA id jz6-20020a17090775e600b00880dbd4b6d4sm6174613ejc.136.2023.01.31.10.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 10:18:53 -0800 (PST)
Date: Tue, 31 Jan 2023 19:18:51 +0100
From: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: pi433: modify bit_rate from u16 to u32
Message-ID: <Y9lbi8TGLmVXudjG@combine-ThinkPad-S1-Yoga>
References: <Y9h42l/8EcPqn63x@combine-ThinkPad-S1-Yoga>
 <Y9ilj812USHrSXe+@kroah.com>
 <Y9jrOKMGl7ITKxhP@combine-ThinkPad-S1-Yoga>
 <Y9jwcdYcFQ9f8+mR@kroah.com>
 <Y9jy+f5JpD1NrbZn@combine-ThinkPad-S1-Yoga>
 <Y9j4BI3/ybsaLCfw@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9j4BI3/ybsaLCfw@kadam>

On Tue, Jan 31, 2023 at 02:14:12PM +0300, Dan Carpenter wrote:
> On Tue, Jan 31, 2023 at 11:52:41AM +0100, Guru Mehar Rachaputi wrote:
> 
> > I would like to know, if it is mentioned in the TODO, why is it
> > so?
> > 
> 
> If it were as simple as just changing the type, they would have done
> that instead of adding it to the TODO.  :P
> 
> But in fairness the TODO entry is sort of vague and useless.  It should
> say that this configuration stuff needs to be moved to sysfs instead of
> being done through an IOCTL.  The we would need to port the userspace
> tools to use sysfs instead of the IOCTL.  Then we would delete the
> IOCTL.
> 
> https://lore.kernel.org/all/20220118135902.GH1951@kadam/
> 
> If you want to send a patch to update the TODO then you can do that.
> 
> regards,
> dan carpenter
> 
Thanks for your mail.

I have now updated TODO file and submitted as a patch.

-- 
Thanks & Regards,
Guru
