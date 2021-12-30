Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280B62C82
	for <linux-staging@lists.linux.dev>; Thu, 30 Dec 2021 14:56:27 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id u16so18402143plg.9
        for <linux-staging@lists.linux.dev>; Thu, 30 Dec 2021 06:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vFH2S9/SPFr2cX1fts6IlFx6h2kNtoUhgIhOm/pvEmo=;
        b=ZhOgUPC5bUoJql5Fx6nUGX8tiaPdbiaZtsNX4d5bE11o2G3EDLSDI7rneXlL4y3YSf
         MrNiE7Ij09mrIpYRvqX67erSi7zw/Y3mSgVqXgtxuZuBqaDPRfuGSeTxeUq+P1DUO7r8
         D9cLJ5ILgpWxroWr4avTZMlhDDtKFXusKEp3WfhQM8m95tKNDdJXoKG2/NUMjykcIHMj
         TVqqDlKfOlhvBUoynlO0gBg9sTN+Ui8JcWmBS5kgrGV6M1WmjVlYsw7FDB1xQGvHMGeA
         c9V4htvvHk5nS+Vh0kkAINQe/PJ4U/BjrJMueEMxazyxFkM8uUjV9iOAR/O54MBbtS0l
         EfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vFH2S9/SPFr2cX1fts6IlFx6h2kNtoUhgIhOm/pvEmo=;
        b=BNIAU+DlavUAW0JocfuApESsqkANbKTz7L6x7EQ3b8TB6pWuXlKF0mURYcm9Eoemp0
         B2uMWInWmDGBboSrb/Ho3BnTaLBys3+mtIG/urT1xWTQ5ni+mEDNEy359eS6UJ9JMIMm
         sm1mp9m3kubVV+sI/2wM7H+5ljaGdtTGpcgclYhIhVZpU4uAwFIgp1g9wfOlgVRX3Ltl
         ADThaNqlbZr2Ew5O4qgfyilkjuCUfFAl5oyHD0yo9zdEntYJboIjTH10PQ3M4LvqO5BQ
         EdPM5vozzMwwuTU/dvNnLypqVbnG+DQdWj2zobezf6An/sS2pra5RLwjZQFbukB+ioq8
         NxOA==
X-Gm-Message-State: AOAM533WO0CdDhUqHgbJonluCRsbf+MFpgTygrTTb3vbmnUaJz+gNm1F
	RyLB1u1HIJ7hjhah7SnHjBA=
X-Google-Smtp-Source: ABdhPJwGhDfFBamhxu7nFxp8gB31M2zkqBL/XEgelVha8hrRSjl/80nfntIqPOHySsRY5vIqSkXC5w==
X-Received: by 2002:a17:90b:3b4d:: with SMTP id ot13mr38984562pjb.196.1640876186671;
        Thu, 30 Dec 2021 06:56:26 -0800 (PST)
Received: from localhost.localdomain (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id s207sm23518792pgs.74.2021.12.30.06.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Dec 2021 06:56:26 -0800 (PST)
Date: Fri, 31 Dec 2021 03:56:21 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: realwakka@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: pi433: add comment to rx_lock mutex
 definition
Message-ID: <20211230145621.GA3236@localhost.localdomain>
References: <20211222215615.GA9361@localhost.localdomain>
 <Yc2QYUcIAV2SY9JU@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yc2QYUcIAV2SY9JU@kroah.com>

On Thu, Dec 30, 2021 at 11:56:33AM +0100, Greg KH wrote:
> On Thu, Dec 23, 2021 at 10:56:15AM +1300, Paulo Miguel Almeida wrote:
> > +	/*
> > +	 * rx_lock is used to avoid race-conditions that can be triggered from userspace.
> > +	 *
> > +	 * For instance, if a program in userspace is reading the char device
> > +	 * allocated in this module then another program won't be able to change RX
> > +	 * configuration of the RF69 hardware module via ioctl and vice versa.
> > +	 *
> > +	 * utilization summary:
> > +	 *  - pi433_read: blocks are read until rx read something (up to the buffer size)
> > +	 *  - pi433_ioctl: during pending read request, change of config not allowed
> > +	 */
> 
> This is nice, but way too specific, and will quickly get out-of-date.
> 
> How about something simple like:
> 	/* Protects all rx_* variable accesses */
> 
I see your point. I will send a new version of this patch with your
sugestion. Thanks for guidance.

thanks,

Paulo A.
