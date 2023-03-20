Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556277C;
	Mon, 20 Mar 2023 17:05:52 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id y4so49576510edo.2;
        Mon, 20 Mar 2023 10:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679331950;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zQkTB0/4ldrNaO9D1BgQTCKKXr2Ih0+bSHKLWiX446E=;
        b=KVVsRwmUXiVQ7NDcj2WO9wVepkc8LHmIY62hwNyQTYVeF9T2LbbRcDkduzcaIw/F6r
         ouWGoUAE2HmsCmB1napvDOx/jtPS3NlGSsPoDi4ibo+zDxXp4d7hs7/ZXqN23P9HmrGy
         qpaW3QldJqwPqsGsrZcv9ie8ndOQoWtz5fXrkF8+G67ikA1qY8Buo+pNM8uofDJhOJnA
         j4HYAb2ePYmpfVgtADy/wxbqJnuq29cOyXj+ngP8h/y3GxodSrI1yJ+v33QbOkDeovEd
         ScVBPuAomG8S3D2hYOiaYmbjba0+kdZK94EMN4YNeYzSffdO/EH4E1Rm6Od2uJRljKyd
         LZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679331950;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zQkTB0/4ldrNaO9D1BgQTCKKXr2Ih0+bSHKLWiX446E=;
        b=i7v3W91uMmwSMW4Ssic1g/tUkgWRpM25lQi65P5ulqhYlGcNiXu8ialKOmnAEndZ9O
         ogmBNeVuePM3MZeXIEhSr/QucBTA9RHG+0vDOHAuVLJgY0Kjl/TcqHc++n2yw6kc8Y4c
         XBmAzS6KS+UrFcbc1QqFfc6pFYsQVB3d4rLux8DWIlMwRi0TBNPMLUoFnCuusizN+mVj
         NkEbKCsSpUZIcJNAHC76qVEwfUHZKLH6abgdgJG5KRUmIAavLWKFdY+mPdX3O2zjP23j
         k4mdIVEkSc8VDZ2m7oOTD+ni/65EC78aCz1lhAyNf2PxC6ipj7ac4jFpgUGFZ9+ktzyV
         5K6Q==
X-Gm-Message-State: AO0yUKVkkND93K1z1uHbnL8HCY0XBcfWlejkxvehxXsBDXUrchd497Uy
	VBFOND86EFfDlhjw/rpyX0w=
X-Google-Smtp-Source: AK7set9WuCwjM7YHHnOJ4tr3crBgY7rHMv9FyaxWn8wPIAKTViDb1Fntb/c87wgMVcnao59hO8rYYQ==
X-Received: by 2002:a17:906:eb5a:b0:8af:2d2e:5d31 with SMTP id mc26-20020a170906eb5a00b008af2d2e5d31mr10140219ejb.31.1679331950060;
        Mon, 20 Mar 2023 10:05:50 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.111.78])
        by smtp.gmail.com with ESMTPSA id gy24-20020a170906f25800b00930445428acsm4746151ejb.14.2023.03.20.10.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 10:05:49 -0700 (PDT)
Date: Mon, 20 Mar 2023 22:05:47 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8] staging: axis-fifo: initialize timeouts in init only
Message-ID: <ZBiSa5BJXZXcV6N0@khadija-virtual-machine>
References: <ZBN3XAsItCiTk7CV@khadija-virtual-machine>
 <3180435.l52yBJDM9G@suse>
 <ZBhvU/USP0es8e4P@khadija-virtual-machine>
 <3648719.TKLx3GfHUD@suse>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3648719.TKLx3GfHUD@suse>

On Mon, Mar 20, 2023 at 05:55:20PM +0100, Fabio M. De Francesco wrote:
> On lunedì 20 marzo 2023 15:36:03 CET Khadija Kamran wrote:
> > On Mon, Mar 20, 2023 at 02:38:24PM +0100, Fabio M. De Francesco wrote:
> > > On lunedì 20 marzo 2023 07:34:04 CET Khadija Kamran wrote:
> > > > On Fri, Mar 17, 2023 at 11:29:25AM +0100, Fabio M. De Francesco wrote:
> > > > > Khadija,
> > > > > 
> > > > > Congratulations for having your first patch in Linux, via Greg's 
> staging
> > > > > tree.
> > > > > 
> > > > > It will take some time before it reaches mainline, although it is
> > > > > already on its way to get upstream.
> > > > 
> > > > [snip]
> > > >
> > > I'm confused by this statement. Can you please rephrase?
> > > 
> > > > Am I getting it right?
> > > 
> > > Not sure, it depends on what you meant with the previous phrase.
> > 
> > As you said above that the commit message makes the reader miss the
> > permission details, so should we write more about permissions in the
> > description?
> 
> No. Greg took your patch as is.
> No new versions for patches that Maintainers (i.e., Greg Kroah-Hartman for 
> drivers/staging and several other subsystems and drivers) already applied.
> 
> We've been discussing this topic after Greg had already taken your patch only 
> for the purpose to clarify to you why he suggested a better commit message. 
> However, he suggested that better message while stating that he prefers to 
> take your patch as is to give you time to work on something new.
> 

Hey Fabio!
Okay understood. 

> I suppose that you received the two automated messages, the first which 
> communicates that your patch has been applied to his staging-test tree and the 
> second which says that it has moved forward to the next step, which is the 
> staging-next tree. I saw those messages in Cc because I put my "Reviewed-by" 
> tag to your patch, so I know you had them.
>

Yes, I did receive the messages. 

> Fabio
> 
> P.S.: Today I sent you an off-list message. Please locate it and reply.
>

Okay Thank you for your help.

Regards,
Khadija

> > > > Thank you!
> > > > 
> > > > Regards,
> > > > Khadija
> > > 
> > > You're welcome!
> > > 
> > > So, thanks for working on this patch as long as it takes to get it done.
> > > 
> > > I think the lesson to be learned is that in our community there are 
> barriers
> > > to the entry of substandard products and therefore people have to do their
> > > best if they really want to see their work applied.
> > 
> > Yes, you are right. Due to this reason, the whole process is making me
> > learn a lot. I am really glad to be a part of it ^-^
> > 
> > > These tasks are not for the "faints of heart" :-)
> > > 
> > > Fabio
> > 
> > Regards,
> > Khadija :)
> 
> 
> 
> 
