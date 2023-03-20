Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA9F10E5;
	Mon, 20 Mar 2023 06:09:14 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id er8so30568122edb.0;
        Sun, 19 Mar 2023 23:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679292552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B7UOiw41bpLJve3LKKjgnQqbxjPTHaQhG5RB2MINhKQ=;
        b=SctT/Tkm/ivkqQkfVBpFtE7T/joHnHzcdEyHTJF0vqOrdSOpJjNXtNZMRHMkwu/iuL
         i5mk2R6Ce8BWJzubNGuGVykUorOapK3hQNmMUOEVgTQKh6beZW8mnBnnOprk35MzHUjc
         6ynFlGb4lfo44GRMGAJ8GbFkW8nxhTjV8ri0e4Wx9g6vfLd3Yq/CCvsDkAnw2H8kEcom
         e9v5OavtRdNMLWUYyejMibRVMIXde4ZtgsoPhtT8fQM4iIWJ5Vcxqegn7Gn+c+3T05m2
         xYrjeCcrhfPjldgAhl5kmjLewDtNOwwQTocdUEQFvk1pZBuA2UXO2Ol8nF+0K3XzJpaO
         7aKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679292552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7UOiw41bpLJve3LKKjgnQqbxjPTHaQhG5RB2MINhKQ=;
        b=qLgbZjU3kn2Q1Fe+ytf9+5eH/tG2ii0OTMIXZ8YRSg9g9QyAAqbzbSwPi3dchR43x9
         LC7/BuK2Mg2RVn7h2mzfgK18xRfuu9iC8+t1t1WwA9aS1eag4YMbJOhBOPCxH19EBRO1
         nGOx9yBE5Sm6f+0ypMS8Ei9hIYA04kRQ2AtQQ0ZGn7DRIZtqZ+JqpJNgaYSzslVrTrmR
         4XdxjlLM8sbtj9nnlPIgse6IETM9IRYDbgV1bWkvD3chrINu/n30waB4GRqhFAWWzrLp
         8CflYlTvMJLAV+knAkI/+nW/6F3rh3B+T+VeCpoNZx23j3WhU7ut9uSJnWJFZ/7aaEP4
         Pk1w==
X-Gm-Message-State: AO0yUKWy+KcJvRTOHPxJZQk8gvMoMsHNq6JFi8bDmx4Wx9tyXfOqAYul
	Js/WYZ1v7S6ZEXBqkPNl+Scl6T+DKW+abXt/
X-Google-Smtp-Source: AK7set///LL3/LUcKa4wejbguEjJf3lHvo8oqS3aIVB6f/6JY4Aq2YUilOD/xGkq/E/nILjev1ahIQ==
X-Received: by 2002:a17:906:3393:b0:8b1:7fa:6588 with SMTP id v19-20020a170906339300b008b107fa6588mr7815475eja.12.1679292552481;
        Sun, 19 Mar 2023 23:09:12 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id gy15-20020a170906f24f00b00932bfab0fcesm2973754ejb.55.2023.03.19.23.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 23:09:12 -0700 (PDT)
Date: Mon, 20 Mar 2023 11:09:09 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8] staging: axis-fifo: initialize timeouts in init only
Message-ID: <ZBf4hUBVnqkw9xGs@khadija-virtual-machine>
References: <ZBN3XAsItCiTk7CV@khadija-virtual-machine>
 <ZBQTIVk0zsgv1hMH@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBQTIVk0zsgv1hMH@kroah.com>

On Fri, Mar 17, 2023 at 08:13:37AM +0100, Greg Kroah-Hartman wrote:
> On Fri, Mar 17, 2023 at 01:09:00AM +0500, Khadija Kamran wrote:
> > Initialize the module parameters, read_timeout and write_timeout once in
> > init().
> > 
> > Module parameters can only be set once and cannot be modified later, so we
> > don't need to evaluate them again when passing the parameters to
> > wait_event_interruptible_timeout().
> 
> I feel like we are being too picky here, but this isn't the correct
> wording.  It is possible for module parameters to be modified "later",
> if the permissions on the parameter are set to allow this.  But that's
> not what this driver does here, so this might be better phrased as:
> 
>   The module parameters in this driver can not be modified after
>   loading, so they can be evaluated once at module load and set to
>   default values if needed at that time.
> 
> > Convert datatype of {read,write}_timeout from 'int' to 'long int' because
> > implicit conversion of 'long int' to 'int' in statement
> > '{read,write}_timeout = MAX_SCHEDULE_TIMEOUT' results in an overflow.
> > 
> > Change format specifier for {read,write}_timeout from %i to %li.
> 
> You are listing all of _what_ you do here, not really _why_ you are
> doing any of this.
> 
> Anyway, if I were writing this, here's what I would say as a changelog
> text:
> 
>   The module parameters, read_timeout and write_timeout, are only ever
>   evaluated at module load time, so set the default values then if
>   needed so as to not recompute the timeout values every time the driver
>   reads or writes data.
> 
> 
> And that's it, short, concise, and it explains why you are doing this.
> 
> Writing changelog comments are almost always harder than actually
> writing the patch (at least for me.)  So don't feel bad, it take a lot
> of experience doing it.
> 
> All that being said, I think we are just polishing something that
> doesn't need to really be polished anymore, so let me go just apply this
> patch as-is to the tree now so you can move on to a different change.
> You've put in the effort here, and I don't want you to get bogged down
> in specifics that really do not matter at all overall (like the memory
> size of your vm...)
>


Okay Great! Thank you Greg!

Regards,
Khadija


> thanks,
> 
> greg k-h
