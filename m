Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8385A7B
	for <linux-staging@lists.linux.dev>; Sat, 11 Mar 2023 12:45:55 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id fy10-20020a17090b020a00b0023b4bcf0727so89844pjb.0
        for <linux-staging@lists.linux.dev>; Sat, 11 Mar 2023 04:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678538755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3j8ks3vfE8OUvi8OJ7FLwinz41gLFvcGI1tfcUxOy4E=;
        b=lmWcqQKa0ad0CCJUGL9rhXfmg/81IpEczMZFU1UycuOfdX4PNDi62lKfZt62x2lyHB
         WuLhF9/9Yu5uwnQm+SMV63Xoxk+kcPWekJtMPUbU61AIOz1UFI3QjI8mMRk3pJBu2T1x
         dUp+4SfWMslzJj9tZwNIj27K2sk4NQv2oyEe0m7n2tIkuoaZ91PVOKuxTnX23BfUndn4
         85bDU9m3GN9fmDj2eYvs5/aBi6801t4LcxBN8zRzTnkBZ74WPANEiaKki1Cf8okvPvxe
         iYbId3xLr9JwI7O1HZTHVgqzmoluYawsIytkYyMDFfxZ0ABaQnqVHGRsmygkT13YWcB3
         PrYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678538755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3j8ks3vfE8OUvi8OJ7FLwinz41gLFvcGI1tfcUxOy4E=;
        b=D49Lm+LOUWh75yclE+WzBgLKDzpaS9ZQpWwt5u/cfE6j7DnbuRsZopXxS49z/22LaS
         uUWB8PLRH+0B3hAgfXviMtWskjEUrBWvBxNMh4lnaT2pRvIdmy/y2DT7y/AZPB5N3VI7
         1z2+NK7KgDtVpfisanzFgrb66xTdxqD8knDP9W3PJXi1NDsNHjnZwXJMX1eXmm5oo45+
         jg/dUrDHu/7TBRe2zTVC8OXidQUOYxR7t0nUu0kFxDQZLOu7tdsZXhL4EGA19kUzgYaF
         slVRJNV9kMQNM5y50RrTZmTmIw3Wwjkv/VnLGnIPTOsqoxXbp5sEoqq3LzgzNMCS3Tyz
         3csg==
X-Gm-Message-State: AO0yUKXDn5E3OymRe8ETjlcwyLBOrOlgYf6qr3ygPSZo0ozqXBElnGPD
	c/vk0dKk0l5s/5UG7XaBh3k=
X-Google-Smtp-Source: AK7set+3PeDUSpK86x45ZkUxPLSFDHcEP/kMjVEmc5mwZozYZ0js3RSVo2/iNiWGEREq1XDc6MdVxQ==
X-Received: by 2002:a17:903:18a:b0:19c:df6e:6aec with SMTP id z10-20020a170903018a00b0019cdf6e6aecmr5295158plg.7.1678538754964;
        Sat, 11 Mar 2023 04:45:54 -0800 (PST)
Received: from gmail.com ([20.230.228.239])
        by smtp.gmail.com with ESMTPSA id s19-20020a170902989300b0019e76a99cdbsm1482291plp.243.2023.03.11.04.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 04:45:54 -0800 (PST)
Date: Sat, 11 Mar 2023 12:45:52 +0000
From: Archana <craechal@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>, drv@mailo.com,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/2] staging: wlan-ng: remove else statement
Message-ID: <ZAx4AB5DC9Ok5Pdu@gmail.com>
References: <20230310205917.2161-1-craechal@gmail.com>
 <20230310205917.2161-2-craechal@gmail.com>
 <a4096cdc-97d1-4265-8ce4-b8021ecf5933@kili.mountain>
 <14be11a8-722c-4520-9e1b-5b147bb3d3fc@kili.mountain>
 <ZAwwRnthlPFta9oL@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAwwRnthlPFta9oL@kroah.com>

On Sat, Mar 11, 2023 at 08:39:50AM +0100, Greg KH wrote:
> On Sat, Mar 11, 2023 at 07:58:51AM +0300, Dan Carpenter wrote:
> > On Sat, Mar 11, 2023 at 07:34:25AM +0300, Dan Carpenter wrote:
> > > On Fri, Mar 10, 2023 at 08:59:17PM +0000, Archana wrote:
> > > > else block is not needed if j is set to -1
> > > > before if block
> > > > 
> > > > Signed-off-by: Archana <craechal@gmail.com>
> > > > ---
> > > 
> > > Is Archana your full legal name that you would write on a legal document?

Yes, Archana is my full legal name.

Thank you for your feedbacks.

I have sent revised patch.

Regards,
Archana
