Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D261B1FB8
	for <linux-staging@lists.linux.dev>; Sat,  8 Apr 2023 17:57:37 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id w11so1420103plp.13
        for <linux-staging@lists.linux.dev>; Sat, 08 Apr 2023 10:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680976657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jvEbHjnUF838lN07cBQDokhrXS5LHQhlJGEDy+0X8dg=;
        b=pKaCg9NvbIVEK6K78TRDwr7ES8jioxY4sJm/msDIOVRDyJt+iA1bmB53dmkiZOVL1d
         fOC6DNKI9nUj/jCL38UkC+xWXTwKXzQLBRExgCZ6RQ+2xWDncceniZG9LaIhYY4HzVy3
         L/pamZjnVlGcZ1+N54NEaX5YpYVNnAoRTUFWd5JE5nGQ27nKn3uBuIimLSuuPMjqZ5J6
         CSrcKn5tbqQqQlYEyJfUeFgmJ97xtzDsNwV7w90ErX3Lz/aPgbJ8cka8fImuXYX0AhCW
         5T19DZ53L/uH3KR5juYWxPBzLZCtR86SxXIwqWMCiJgcMgfIe1KZtXAeFgnPdqNzVE4f
         yIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680976657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvEbHjnUF838lN07cBQDokhrXS5LHQhlJGEDy+0X8dg=;
        b=a0LdkXeptbG8hMpvqX4ABb4itc0rgGAVCN0FdXhFohIGPk8URXUraKdznkHGwXMtl9
         G8l9cRsZ64Sz1CGdOd4ERFxFRiN91AhoFDSQN1ONw9G+pXkjddfFraYkjsrd9T72Ge6T
         bww0h+198smGq3/2H9/UdkS+FncnR5sGVD3kZR+FA7f7UqNaC5WNanbLbUs7HGbTWC5G
         /yUF8tLFyMrHrB8Nr5RcqQPhse2q5ErKiwRCqsCEnV5JVevondk9EgvWszlR7AdeJqCZ
         7otFI4lHNfca4RF3mQ834JCF/N7Bx6XxfrjoxWRCvoCcGHwbjZDJrykukoRDvzH84qoN
         rh5w==
X-Gm-Message-State: AAQBX9c5vmBWlMrnQzicth8G7xCLTbL0QqPufvk4tO2kA0M6KQ9YNdEz
	nsptX1SSqlU9XR3NlDinFdY=
X-Google-Smtp-Source: AKy350Z1B6z5jcbAMhr2nmOFpTuBNq3vRV61NMkFifG3bVxk0EXXWJZFza2ZQhnwbrNXiJbTG/UP2g==
X-Received: by 2002:a05:6a20:6014:b0:db:f682:65ed with SMTP id r20-20020a056a20601400b000dbf68265edmr6704234pza.61.1680976657232;
        Sat, 08 Apr 2023 10:57:37 -0700 (PDT)
Received: from sumitra.com ([117.207.136.97])
        by smtp.gmail.com with ESMTPSA id y15-20020aa7804f000000b00590ede84b1csm5178202pfm.147.2023.04.08.10.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Apr 2023 10:57:36 -0700 (PDT)
Date: Sat, 8 Apr 2023 10:57:29 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Simon Horman <simon.horman@corigine.com>,
	Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>, netdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: qlge: Remove macro FILL_SEG
Message-ID: <20230408175729.GA263118@sumitra.com>
References: <20230405150627.GA227254@sumitra.com>
 <ZC2gJdUA6zGOjX4P@corigine.com>
 <20230406144644.GB231658@sumitra.com>
 <2023040648-zeppelin-escapist-86d1@gregkh>
 <20230406152855.GC231658@sumitra.com>
 <2023040618-dedicate-rebalance-90c6@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023040618-dedicate-rebalance-90c6@gregkh>

On Thu, Apr 06, 2023 at 06:33:31PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Apr 06, 2023 at 08:28:55AM -0700, Sumitra Sharma wrote:
> > On Thu, Apr 06, 2023 at 04:57:44PM +0200, Greg Kroah-Hartman wrote:
> > > On Thu, Apr 06, 2023 at 07:46:44AM -0700, Sumitra Sharma wrote:
> > > > On Wed, Apr 05, 2023 at 06:21:57PM +0200, Simon Horman wrote:
> > > > > On Wed, Apr 05, 2023 at 08:06:27AM -0700, Sumitra Sharma wrote:
> > > > > > Remove macro FILL_SEG to fix the checkpatch warning:
> > > > > > 
> > > > > > WARNING: Macros with flow control statements should be avoided
> > > > > > 
> > > > > > Macros with flow control statements must be avoided as they
> > > > > > break the flow of the calling function and make it harder to
> > > > > > test the code.
> > > > > > 
> > > > > > Replace all FILL_SEG() macro calls with:
> > > > > > 
> > > > > > err = err || qlge_fill_seg_(...);
> > > > > 
> > > > > Perhaps I'm missing the point here.
> > > > > But won't this lead to err always either being true or false (1 or 0).
> > > > > Rather than the current arrangement where err can be
> > > > > either 0 or a negative error value, such as -EINVAL.
> > > > >
> > > > 
> > > > Hi Simon
> > > > 
> > > > 
> > > > Thank you for the point you mentioned which I missed while working on this
> > > > patch. 
> > > > 
> > > > However, after thinking on it, I am still not able to get any fix to this
> > > > except that we can possibly implement the Ira's solution here which is:
> > > > 
> > > > https://lore.kernel.org/outreachy/64154d438f0c8_28ae5229421@iweiny-mobl.notmuch/
> > > > 
> > > > Although we have to then deal with 40 lines of ifs.
> > > 
> > > Which implies that the current solution is the best one, so I would
> > > recommend just leaving it as-is.
> > >
> > 
> > Hi greg
> > 
> > Before leaving it I would like to know your opinion on the solution Dan is offering.
> 
> I still think you should leave it as-is.
>

Okay, Thank you.


Regards

Sumitra Sharma
> thanks,
> 
> greg k-h
