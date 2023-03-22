Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE88D1FDE;
	Wed, 22 Mar 2023 09:02:04 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id ek18so69825893edb.6;
        Wed, 22 Mar 2023 02:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679475723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BCa1vNdf5JIdm5XhB04hnPQ5Dz4ynxiKvZbs1xK5RLM=;
        b=fDrT7DOCdaO0lsHYQyuyqCtL7fr48LL7EONKJhHP5v0Lg6QK45tdpcdaoYex49hwUl
         f1keobdjNM5PGyeUED5PEWZNiZhf9OiJ2zkf02FxDsz6JxZcH6Q1Dk4HhOuiZdDxusb2
         27NmRXyyLy5RV3/KsBhlBIh+GJ31iIhEKxJfwqwS3zfmmh5ahdmMwjQKaGnk4cL1wt01
         AYYgaMFRCtJC1DhnS0XeUpbLqunwl345jPgb481VIrTeuMFEajDkLWSDL4ewmXMA7qXU
         dx+O+DF6Fqrtu1d8uyIKm5dcWpIoj1Ao01oj+whO30cB99Dyfuhd4DhppwUdJcQGB3uS
         hBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679475723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCa1vNdf5JIdm5XhB04hnPQ5Dz4ynxiKvZbs1xK5RLM=;
        b=IX69wRBM+J/7ta88XNUIRSza+KJ7kFdtrqfaDE3T/MAv2GblD0Y3Uz59flsnw9Rsrs
         whdKSJhZ1lTmafLHdKF2Ck6cL6tZfZUlQh/wes+ESr8kJ66VVP2lONZTafLSt4ctbmfT
         GweTmVr+jil1qwdC6gdgnrNh5WfAzXwFw/nr4BmkGa1XTiUQb5wWu1Y3NwgsF39O+iqM
         harqnFyLDwukOQGzB5B0QZxqr1fJpu3rbYyVnz4CCeG4AxIEckg1WawfDsbTE5tZdFgc
         2Rb+Ldkhx7WOBvGmEbRDwOdMsJYcRaRhTgfAhvQPvq45MOWaMwrdO31j0YugnVWgfXLe
         uCoQ==
X-Gm-Message-State: AO0yUKWiMTQ7D2npy2w5l/wLq2/1WxpZIaVamvrmcyL2bxMo0gJu6/L+
	qTIJAptrvoVt4En/ZMDq9nA=
X-Google-Smtp-Source: AK7set+A5c4A7sQ6Fh3p58WoQpMb/Dtml9TPJ6OPQnXwvA94gq0SpFTH1y4fcjrz7fctxgtUGPrjJQ==
X-Received: by 2002:a17:906:b087:b0:926:8992:4310 with SMTP id x7-20020a170906b08700b0092689924310mr6488404ejy.38.1679475723058;
        Wed, 22 Mar 2023 02:02:03 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u23-20020a170906409700b009334a6ef3e8sm4822307ejj.141.2023.03.22.02.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 02:02:02 -0700 (PDT)
Date: Wed, 22 Mar 2023 12:01:58 +0300
From: Dan Carpenter <error27@gmail.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>,
	Kloudifold <cloudifold.3125@gmail.com>
Cc: teddy.wang@siliconmotion.com, sudipm.mukherjee@gmail.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v4] staging: sm750: Rename sm750_hw_cursor_* functions to
 snake_case
Message-ID: <9c85a688-ef2c-4808-9aed-4acdefaed5f2@kili.mountain>
References: <ZBfro5U4s0lWA6tl@CloudiRingWorld>
 <ZBlov9bVs4pAJIlA@debian.me>
 <c561746c-6061-4c8e-8961-114a507d72e9@kili.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c561746c-6061-4c8e-8961-114a507d72e9@kili.mountain>

On Tue, Mar 21, 2023 at 11:37:33AM +0300, Dan Carpenter wrote:
> On Tue, Mar 21, 2023 at 03:20:15PM +0700, Bagas Sanjaya wrote:
> > > 
> > > - sm750_hw_cursor_setSize  => sm750_hw_cursor_set_size
> > > - sm750_hw_cursor_setPos   => sm750_hw_cursor_set_pos
> > > - sm750_hw_cursor_setColor => sm750_hw_cursor_set_color
> > > - sm750_hw_cursor_setData  => sm750_hw_cursor_set_data
> > > - sm750_hw_cursor_setData2 => sm750_hw_cursor_set_data2
> > 
> > I think from the diff below people can see which exactly functions that
> > are renamed, so the list above is redundant.
> > 
> 
> I like these lists.  They don't hurt anything.
> 

Kloudifold emailed me because it wasn't clear how to respond to the
conflicting review comments.  I was going to respond privately but I
thought it was an interesting topic for Outreachy.

First of all, this patch needs to be resent because of the issue with
the email headers.

Second, when reviewers disagree there are three factors:
1) Who has the most authority over the patch?
2) Who cares the most?
3) What do *you* want to do?

If you get feedback from Greg, then you have to listen to Greg.
Probably Julia and I outrank Bagas in terms of authority.

In terms of who cares the most, Bagas is the only person ever to
complain about lists.  On the other hand, no one has ever insisted on
lists.  So keeping the list is fine and removing the list is also fine.

Third, Bagas complained about these tags:

> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202303110849.X24WnHnM-lkp@intel.com/

I happen to know that Greg doesn't like them too much so just delete
them.  I noticed the links in the earlier email but it's not something
I care about personally so I didn't say anything.

The other thing is that Outreachy people are very very strict about
process issues and commit messages.  That's because Outreachy is an
educational thing.  But in real life, the focus is just on adding value.
If you send a high value patch such as a security fix, then I will take
whatever you send, clean it up, add a commit message and still give you
authorship credit.  Or if you add a driver, then I'm not going to
endlessly nitpick your grammar or whatever.  We do have minimum
standards like checkpatch clean etc and we definitely don't want bugs.
But driver code is all different levels of quality because having a
driver is better than having nothing.

So if you want your patches to get merged then work on high value stuff
and we're much more flexible for that.

regards,
dan carpenter
