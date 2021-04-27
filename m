Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C5E72
	for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 12:23:39 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id y62so8609164pfg.4
        for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 05:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=oIH8WYIkB/ztyv6SBr4INOuz26sOP+Zv7q5JUrWt5S8=;
        b=vh8IqGRq8Sq5pPjUyHXRnecANmNmrskCeP5WRIHL8932dVb8+07Vfg+D8d6+gS9Br5
         WSuLY6wi16zCyeba0dAwEnQzEO4Vexq4RFxiq6lELPEmfHHC3yooTUFzG3tCjn0kvVry
         PcWuG7OyqHnSWAn8X3iHnuyLc4tcEI2Riz7+kkaFUFz5DnqqCJKkGO1mZHWpgTxfaxYe
         1ke+gztJKXZKnjzmAOor/Nob/X8j2t9D2zDVRMVEf5zXukVH+WF9N//8A7+uvXNWgcKu
         8YI6xb2CaMZ6rqA8cRGIW549UzkP3FfKFKg2Ad4NgRBRlqi7GOcUwh+VXroFbLHh/Nqn
         vYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=oIH8WYIkB/ztyv6SBr4INOuz26sOP+Zv7q5JUrWt5S8=;
        b=ugU6BLU+uINEnWSsxk8vqySA2xIrjFSOFHyLVqmn+lQno/gOU3xONnUu60vIzVpmxn
         finXtVg3GJSdlBKd0LFbrRkfE5fk3Ew86WWSyyLfmqROwJ2rPpccXoGgEwUez7020rYg
         ucp15v2Qap/+kMIc8Hdib/7hq+CWMufFckK/3AvHDcuWQMTyNKk34sc5Zol2hn1k/cHh
         5HPhHeDyvkB2iZV1cdfba/pT0YsTtRfcOZhIsHjPNXOF+4p7/bxvEOJDXiSbogEwyEk8
         qsVwq1SGHuM+znMC4jMlvI32tzQzIi2KS43QGnucXeVLeAEiloct2BjraQ5LTrvEWhNL
         Lz3Q==
X-Gm-Message-State: AOAM530Kj3uZj4vxpW2ale5mCiL+9IbfAn0PVB3JApcdf0Z5Bt9v64uK
	wxxstX22DXJNsH5WhJBjsu0=
X-Google-Smtp-Source: ABdhPJx20lR4SNDF+cm5Avx5zJyQMAHpmnv+dL6KMGctS63n9+BFqdat8Zmwu3RXnlq4jMvuMrvHfA==
X-Received: by 2002:a63:540b:: with SMTP id i11mr4719813pgb.44.1619526218307;
        Tue, 27 Apr 2021 05:23:38 -0700 (PDT)
Received: from ashish-NUC8i5BEH ([182.77.14.23])
        by smtp.gmail.com with ESMTPSA id b21sm2576751pji.39.2021.04.27.05.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 05:23:37 -0700 (PDT)
From: ashish <eashishkalra@gmail.com>
X-Google-Original-From: ashish <ashish@ashish-nuc8i5beh>
Date: Tue, 27 Apr 2021 17:53:30 +0530
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ashish Kalra <eashishkalra@gmail.com>, Joe Perches <joe@perches.com>,
	Abheek Dhawan <adawesomeguy222@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Romain Perier <romain.perier@gmail.com>,
	Waiman Long <longman@redhat.com>,
	Allen Pais <apais@linux.microsoft.com>,
	Ivan Safonov <insafonov@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: wlan-ng: silence incorrect type in argument 1
 (different address spaces) warning
Message-ID: <YIgCQtwK8tpGSOQ5@ashish-NUC8i5BEH>
References: <20210420090142.GA4086@ashish-NUC8i5BEH>
 <YIE3IffGcjrkz4ZE@kroah.com>
 <20210423152619.GA2469@ashish-NUC8i5BEH>
 <YIOz6o8gwHv+cAN7@kroah.com>
 <bc8873a274bf489ad856386a9d9ee1110de4c4d3.camel@perches.com>
 <20210424081529.GA1731@ubuntu>
 <YIPWq6rp246rg9D0@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YIPWq6rp246rg9D0@kroah.com>

On Sat, Apr 24, 2021 at 10:28:27AM +0200, Greg Kroah-Hartman wrote:
> On Sat, Apr 24, 2021 at 01:45:29PM +0530, Ashish Kalra wrote:
> > On Fri, Apr 23, 2021 at 11:11:05PM -0700, Joe Perches wrote:
> > > On Sat, 2021-04-24 at 08:00 +0200, Greg Kroah-Hartman wrote:
> > > > On Fri, Apr 23, 2021 at 08:56:19PM +0530, Ashish Kalra wrote:
> > > > > On Thu, Apr 22, 2021 at 10:43:13AM +0200, Greg Kroah-Hartman wrote:
> > > > > > On Tue, Apr 20, 2021 at 02:31:42PM +0530, Ashish Kalra wrote:
> > > > > > > Upon running sparse, "warning: incorrect type in argument 1 (different address spaces)
> > > > > > > is brought to notice for this file.let's add correct typecast to make it cleaner and
> > > > > > > silence the Sparse warning.
> > > []
> > > > >  struct p80211ioctl_req {
> > > > >         char name[WLAN_DEVNAMELEN_MAX];
> > > > > -       caddr_t data;
> > > > > +       void __user *data;
> > > > > 
> > > > > Does this looks ok to you and is there any other check possible if this is ok?
> > > > 
> > > > Wait, what is "caddr_t"?  Try unwinding that mess first...
> > > 
> > > Might not be that simple.
> > > 
> > > include/linux/types.h:typedef __kernel_caddr_t  caddr_t;
> > > include/uapi/linux/coda.h:typedef void * caddr_t;
> > > include/uapi/asm-generic/posix_types.h:typedef char *           __kernel_caddr_t;
> > > 
> > > 
> > data is part of p80211ioctl_req and is used at two places only inside p80211knetdev_do_ioctl
> > it seems both places it will be used as void __user* only
> > 
> > 	msgbuf = memdup_user(req->data, req->len);
> >         
> > 	if (result == 0) {
> >                 if (copy_to_user
> >                     ((void __user *)req->data, msgbuf, req->len)) {
> >                         result = -EFAULT;
> >                 }
> >         }
> > 
> > Will it still be problem if we change it from char * to void *.?
> 
> Why do you want to change it to void *?  Never use a void * unless it
> has to point to unknown data.  That does not seem the case here.
> 
> > is there any way to check how caller of this function will be using it?
> 
> Look at the code to determine this...
> 
> thanks,
> 
> greg k-h
Thanks Greg and Joe
I have found that adding __user to data is also fixing this warning, 
It should be fine logically to make this change
Please share your opinion and will post v2 for this patch

--- a/drivers/staging/wlan-ng/p80211ioctl.h
+++ b/drivers/staging/wlan-ng/p80211ioctl.h
@@ -81,7 +81,7 @@

 struct p80211ioctl_req {
        char name[WLAN_DEVNAMELEN_MAX];
-       caddr_t data;
+       char __user *data;
        u32 magic;
        u16 len;
        u32 result;
-- 
2.30.2


