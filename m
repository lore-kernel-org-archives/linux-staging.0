Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FC82C85
	for <linux-staging@lists.linux.dev>; Wed,  3 Nov 2021 15:57:06 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id d3so4283813wrh.8
        for <linux-staging@lists.linux.dev>; Wed, 03 Nov 2021 08:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=eRvj9qYI+2l7/7aUCZ50U+44Z6UG0IqeflVK/0bEcvo=;
        b=BZz+zyywefqfNDI4gN4GDIM0uwo+FGSPcLNoq8DH2EXoe56E32R0v4glZZpSqHvkR/
         sbLHeTm4jmFtLgyiP5il6cidyVwnm/QcUw+cpD1tSl0vT7dMlJnK2qrC2bJvlJVSeLBz
         mItrt4gUdMoh7jQfhyR0fMzPZnw+Slkatr5pyLYowy4Vqf9MZWbXhjXvWJHn1o7tFSBl
         3kw7mG28mKixAVjUtYZzWipsWohjqyBC8vluMVwO+QhPb3QAcNJlAqREIe+O56MgF+Rj
         6lSVMNXjMG0DB5I3FHvra0nW8vhSCHdLX85k5eUkA6+Fq4mpthVNJGWj1iaLSihcnUmM
         QD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=eRvj9qYI+2l7/7aUCZ50U+44Z6UG0IqeflVK/0bEcvo=;
        b=NwJ4dgtbkDwnesHlvV5keD8gv0fe4EYlPvdG1f/78jzgTVW7HwNt3M8zKGkF6FNCfN
         ZTw2PwG/j+aIVQlGS9/tsG2BteqMwFQthBeeB0YAZsgFLKP3rF41o5T+zM1vJY56F8YT
         vOZexFSTuvN5ukXHvpJ79bbeT+wJYg+REZtQPqW7GW9HW7QVW5jQeKp5ZIBm3KM1ZdvA
         ZQ7FvBv1BPTKXAFLJk11YBKLsENBbAPZH8Xj+JOthfQRcZznK7YoWTGWVECzHHQ7HmSH
         0oj5MUdw2JKdaBUyIJy5P8c9hw8HEajIGfYLkSOkkJhLVQvT3LwPN39QDeNBVStjHhmg
         zRFA==
X-Gm-Message-State: AOAM532uqKYJVf18hQp6evjoXjuFnT0tMnUgGuYZEMjJdCBBToHdcV5f
	CME+XOsMnvCpqrZC1fsRSAPYJg==
X-Google-Smtp-Source: ABdhPJxvQ4B9y40EuhwiBKOvJ12HuXF5RU2mRbTh9lwg4xo6yOedTE2cuS4DHK3f5Fl5qo4ZYIHTSg==
X-Received: by 2002:a5d:4890:: with SMTP id g16mr58678884wrq.10.1635955024911;
        Wed, 03 Nov 2021 08:57:04 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id p13sm6470355wmi.0.2021.11.03.08.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 08:57:04 -0700 (PDT)
Date: Wed, 3 Nov 2021 16:57:02 +0100
From: LABBE Corentin <clabbe@baylibre.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net
Subject: Re: [PATCH v3 00/14] staging: media: zoran: fusion in one module
Message-ID: <YYKxTrWI299pvqo7@Red>
References: <20211026193416.1176797-1-clabbe@baylibre.com>
 <a85c93db-e118-274f-d86a-d127c7399926@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a85c93db-e118-274f-d86a-d127c7399926@xs4all.nl>

Le Wed, Nov 03, 2021 at 04:21:02PM +0100, Hans Verkuil a écrit :
> Hi Corentin,
> 
> On 26/10/2021 21:34, Corentin Labbe wrote:
> > Hello
> > 
> > The main change of this serie is to fusion all zoran related modules in
> > one.
> > This fixes the load order problem when everything is built-in.
> 
> I've been testing this series, and while the module load/unload is now working,
> I'm running into a lot of other v4l2 compliance issues.
> 
> I've fixed various issues in some follow-up patches available in my tree:
> 
> https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=zoran
> 
> At least some of the worst offenders are now resolved. Note that the patch
> dropping read/write support relies on this patch:
> 
> https://patchwork.linuxtv.org/project/linux-media/patch/4f89b139-13b7-eee6-9662-996626b778b0@xs4all.nl/

Hello

My test branch already included your "zoran: fix various V4L2 compliance errors"
I have quickly checked other patch and I am ok with them.
I will add and test with them.

> 
> But there is one really major bug that makes me hesitant to merge this:
> 
> This works:
> 
> v4l2-ctl -v pixelformat=MJPG,width=768,height=576
> v4l2-ctl --stream-mmap
> 
> This fails:
> 
> v4l2-ctl -v pixelformat=MJPG,width=768,height=288
> v4l2-ctl --stream-mmap
> 
> It's an immediate lock up with nothing to indicate what is wrong.
> As soon as the height is 288 or less, this happens.
> 
> Both with my DC30 and DC30D.

Just for curiosity, what is the difference between thoses two ?

> 
> Do you see the same? Any idea what is going on? I would feel much happier
> if this is fixed.
> 
> Note that the same problem is present without this patch series, so it's
> been there for some time.
> 

I will start on digging this problem and add thoses commands to my CI.
And I know there are a huge quantity of problem since origins.
A simple example is that just setting MJPEG as default input format does not work.

But since it is not related to my serie, can you please merge it.

Thanks
Regards
