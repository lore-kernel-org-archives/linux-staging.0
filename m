Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8410971
	for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 09:31:37 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id t4so43859675ejo.0
        for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 02:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HvoBw86ctVXyhbWOgqr0xC6pEc+fFV76B2CUFf5kjSI=;
        b=ixbflPe1nhsPohr943bOZRN0CJ+ifoIo0TDjt48YRc4xHRRCPSrahZoEgrS5nzfzZb
         PONow1l+ujnBhdNyMHuqJQdz3N84k2ah+t7CE1DVLjfjuYw5mCU8B0M7IYfl8rg1qju1
         HssrGdLLzIgvXR4bt6VHeZwvddqLLcwh6Pa3ruvgWHL8/jS21QDK/SGqXypD4053Gsmp
         gBJ4E8glAaO98vKkkOIwyrpwQPZ7/Iu/ao0s1VInzy/sVRFTDgXrwK1ByT/uUpjAiCxY
         u4Jt2w3dijAU++3Z1mptel+cC6+WWwvGOcJ074K275VTqlnC1P3/ipsYgYafCu8FXHsL
         DYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HvoBw86ctVXyhbWOgqr0xC6pEc+fFV76B2CUFf5kjSI=;
        b=m/6ImoY3C/czbtvQUrN5aCxJmcRGakiMKVn1LhjJPZYMqxUL4iiZpQC6WmbPi40zjS
         xDTkfqe3anCuV+KbqNax0yflXr1a0CTcRPXuMyKBnl7slATJLTeI2q/IyLqulJPeZvh9
         DkoeRbEjI61lJ7M0y4Pkm2oIHv7u88xRFR0EFkBK3L41DhgFf7oM4wfE3gpviGW2x2NN
         i/EheLHIhStU0GRmvB5Yo+kreWpeJbZ8ftkDPowgejrd379U+IK5zdL1JvKqqUTvli/l
         MaCM2dVLZr8gNhq6Ko8PGxSRHlFfpRTQZCCPn1QIMEQLQYJKYz9DvTqJUN3F8aUwEuWz
         JmWA==
X-Gm-Message-State: AOAM533fes6mjIdMIkZmOGfDUNZURSxVLL3/C54pyHXxbxaQj+7NzFES
	wsRi3StIsHfzOKZh1wKVQAQ=
X-Google-Smtp-Source: ABdhPJyMMG/8Kf6iC2x/uQf7CA6SwYK6+F8q8EGAG4/wT5mAAZPcB0VU/MD/prGUZ6iseHDub9Lu+A==
X-Received: by 2002:a17:906:c1ca:: with SMTP id bw10mr20705685ejb.512.1620984695970;
        Fri, 14 May 2021 02:31:35 -0700 (PDT)
Received: from agape.jhs ([5.171.81.81])
        by smtp.gmail.com with ESMTPSA id o20sm4047302eds.20.2021.05.14.02.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 02:31:35 -0700 (PDT)
Date: Fri, 14 May 2021 11:31:20 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	youling 257 <youling257@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: staging: rtl8723bs: questions on TODO list
Message-ID: <20210514093119.GB13800@agape.jhs>
References: <20210514083856.GA13800@agape.jhs>
 <85289dbc-e986-9beb-f7d6-eca9e8750c8a@redhat.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85289dbc-e986-9beb-f7d6-eca9e8750c8a@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, May 14, 2021 at 11:15:42AM +0200, Hans de Goede wrote:
> Hi Fabio,
> 
> On 5/14/21 10:38 AM, Fabio Aiuto wrote:
> > Hello all,
> > 
> > I'd like to have some clarifications about rtl8723bs driver.
> > In order to make this driver ready for moving out of staging
> > I would like to know:
> > 
> > - find and remove remaining code valid only for 5 GHz. Most of the obvious
> >   ones have been removed, but things like channel > 14 still exist.
> > 
> > is it possible to remove all 5g code, even the one related to power
> > regulation when on band 5g? As far as I know about this card is that
> > it doesn't support 5g, so may I just delete all 5g code or there are some
> > constraints I'd take care of?
> 
> These cards are 2.4G only so any code of which you are sure it is for
> 5G only can be removed.
> 
> > - find and remove any code for other chips that is left over
> > 
> > Ok this seems clear, are there some suggestion to do it safely?
> 
> Get some hardware and test that things still work, preferably
> against multiple access-points.
> 
> > - convert any remaining unusual variable types
> > 
> > Ok (but feel free to suggest anything)
> > 
> > - find codes that can use %pM and %Nph formatting
> > 
> > Ok (but feel free to suggest anything)
> > 
> > - checkpatch.pl fixes - most of the remaining ones are lines too long. Many
> >   of them will require refactoring
> > 
> > Ok
> > 
> > - merge Realtek's bugfixes and new features into the driver
> > 
> > Please, can you explain what one could do that?
> 
> I know that "youling 257 <youling257@gmail.com>" is using a different
> version of the original (out-of-tree, non cleaned-up) Realtek driver
> code for the Android-X86 kernels he works on. You should probably
> ask youling why that version is being used and try to get a copy of
> the original Realtek sources on which the staging driver is based
> and do a "diff -ur" between them and see what is different.
> 
> > - switch to use LIB80211
> > - switch to use MAC80211
> > 
> > I think I need a few details for these last points as well.
> 
> I'm afraid I cannot help there, you should ask for help with this
> on the linux wireless email list.
> 
> > Do you think that one will need real hardware to complete
> > these tasks? I don't have rtl8723bs card at the moment, so
> > I think I will focus on those TODO activities which
> > don't need it.
> 
> Yes you really do need hardware, even simple coding style
> cleanups are known to (accidentally) break driver functionality,
> so you really should ensure that you are capable of testing your
> changes on real hardware.
> 
> Regards,
> 
> Hans
> 
> 

thank you for your answer Hans,

fabio
