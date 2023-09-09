Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219361878
	for <linux-staging@lists.linux.dev>; Sat,  9 Sep 2023 08:43:14 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-68a3082c771so1991238b3a.0
        for <linux-staging@lists.linux.dev>; Sat, 09 Sep 2023 01:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694248994; x=1694853794; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ThoAJQ7R+le+t9BWKxFb3NnyvFQ177oeH/Jedkgpock=;
        b=LaGnrB2nr7JG0XxGkGFOph9/05wgtj54cJDcz1XLRdWOYp2zaLMoQTln4fzu5DbEAy
         Tmd2bFQ4cChUplpAezFtgJAFFFLOm9sR5sxRPPrhcvhKfgMhxyyc9OCEr3VxmPc5//30
         qU1Wp07HtNjKs0xSed9bRaEdFi0p3N4Ooz7D8SuMlnV9aUgHHfcshUotTTyMtNDehTIk
         eTCQJPXZhcYq57vYHQjkjSxFS7wMmsmLNUZxK/MWHq90gZfif2jqpPkZyWs3vG0mL6w0
         7jzJCsxRibofn6+sZ/dX+ziNQEgVgSuLVwF5mS8ener44a3NOP/W8IVjTXBHTHRYn+sA
         4irA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694248994; x=1694853794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ThoAJQ7R+le+t9BWKxFb3NnyvFQ177oeH/Jedkgpock=;
        b=D/yL47TCVS6nCa8qZyuQCJlxxWzGrHoghFpWC0zRA5MzQeAChEVu1dfkNJEE4jlnsD
         ALY3/A3CBsy3qNJsT/a+PUiXWPA4XK2kTpPlt31SdNSQAr3Agq3TBZ3uMO9rW42G+KAt
         uaV8JvfnceOu1IcOo4JCwy2jyhA4I5D1Rjk4Yr9qCR8CSZSw3KHh4tF4pyesPuPdIJOL
         cJovfccpYJ1k6tbYM1U6SUWREbh6iRDMTpfhOhZ1caShNykqWWXSPzBbCwqLCA/AxLEG
         3qaYakFADkUXlZHAPKxZ/o1U3H9D5+82NpqUUTT8Cd1sU/II+wsPunlumPMxhE0wQ70l
         x1zA==
X-Gm-Message-State: AOJu0Yxtaqm1mAYX1OJGRsq7UT12atUiIPUBEvJYLXLCBjqAUfMH3fgS
	L2Y6W06mn9NfIDpuebhyJ4g=
X-Google-Smtp-Source: AGHT+IH5mFmbkeOpk4JDcg5uSRaKHYaekmXQCVdNMFXfvc+bDuheJu2c+lU7X6vO1FKNAfuSFZUbIA==
X-Received: by 2002:a05:6a00:a1b:b0:68e:28dc:8d5e with SMTP id p27-20020a056a000a1b00b0068e28dc8d5emr12388144pfh.16.1694248994272;
        Sat, 09 Sep 2023 01:43:14 -0700 (PDT)
Received: from ubuntu.myguest.virtualbox.org ([223.178.252.251])
        by smtp.gmail.com with ESMTPSA id i12-20020aa787cc000000b0064d57ecaa1dsm2376397pfo.28.2023.09.09.01.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Sep 2023 01:43:13 -0700 (PDT)
Date: Sat, 9 Sep 2023 14:13:09 +0530
From: Pavan Bobba <opensource206@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Forest Bond <forest@alittletooquiet.net>,
	Michael Straube <straube.linux@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: vt6655: Type encoding info dropped from
 array name "byVT3253B0_"
Message-ID: <ZPwwHY1TDOBEljxr@ubuntu.myguest.virtualbox.org>
References: <ZPnLw+njcL/D391S@ubuntu.myguest.virtualbox.org>
 <2023090724-trial-ipod-93d2@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023090724-trial-ipod-93d2@gregkh>

On Thu, Sep 07, 2023 at 03:43:53PM +0100, Greg KH wrote:
> On Thu, Sep 07, 2023 at 06:40:27PM +0530, Pavan Bobba wrote:
> > Below array names updated as per coding guidelines:
> > 
> >    1.byVT3253B0_AGC4_RFMD2959
> >    2.byVT3253B0_AIROHA2230
> >    3.byVT3253B0_UW2451
> >    4.byVT3253B0_AGC
> > 
> >    Conversions performed:
> >    a.type encoding info dropped from names
> >    b.names replaced by snakecase
> > 
> >    Issue found by checkpatch
> > 
> > Signed-off-by: Pavan Bobba <opensource206@gmail.com>
> > ---
> >  v1 -> v2: Name of the tool added in the body of explanation,
> >            which found this issue
> > 
> >  v2 -> v3: subject modified to more specific detail
> 
> Any specific reason you are not sending this to the maintainer that can
> take it?
i used scripts/get_maintainer.pl to get maintainers names and i am
adding all those people to the mail. kindly let me know the maintainer id
and the correct way to know the mainter of a file
> 
> Also, your changelog needs work, please read the link the bot referred
> you to.
> 
> thanks,
> 
> greg k-h

sure. i will cross check once. Thank you
