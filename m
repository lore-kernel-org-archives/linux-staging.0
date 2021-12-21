Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE2829CA
	for <linux-staging@lists.linux.dev>; Tue, 21 Dec 2021 20:40:09 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id l11so230001qke.11
        for <linux-staging@lists.linux.dev>; Tue, 21 Dec 2021 12:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CA9IWavU63XG2gXPf0Ek8dVYzF3SSJzma8mENQ8i0FI=;
        b=GUJqO5fkKd228TnOmKcYkuDCb4kQeaJrE/8O3rq5oOYr558k1XrQseIUEwv60oB53j
         MLNB3eWYdA3Ar5fU6Y7mG6IvL1lCtMbrKxFgsTXa99XwsErz8kr7gj8dGT37yfezNc2f
         PaNiUp+2F/WnpTVhKcxn7DGWrrR6WFpGQkflQaZ3NACVRfdw+ckC+OndqEFV49gdEgc6
         O7p5rMquNSl1YHyQwXbWeU+xhlRkCapl6goJ/8gWeE+cBH+m6NrBmv2RifibLrguZE9m
         w86TScRZR/y/NmI5iSfwUIPHPcBkhLA0XLmQtsgv3B0r6pMp9PCj8eziAIeBRs3lCr5o
         RW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CA9IWavU63XG2gXPf0Ek8dVYzF3SSJzma8mENQ8i0FI=;
        b=VCxI9Iur7ISabuCfUNFdcAgcoT/UoAVs7HVkCwYNsqCev13bsjJH08CXyVAms4ntRV
         ZgwFudIIdv6w5IzFC7L/HJATruttDLbvYCHQKB3uY9WIP0frmRkwmJ1BrpiB0PeiRTnB
         uXr5p5Yoxheg6Ltr/tkvrptqUjGHMBvRJFxBWLk18wfz+D0F1tjmFVrVgbSePyO+YcAz
         +e6HMUbhgrZZCWcs83jPseksn0z57hT0aobkCRsH4TE0d8WY9z0sdJbp8vTKqCsXOdcv
         9NHrSJXhBdC97aUvx9IOnIPtVn96xhhJP2YzgKnKiye2V6MKkqQJ6LEBg+v+KPrZZxF3
         KERA==
X-Gm-Message-State: AOAM533OV2NlZmZ0LW3pZ/rpTNcGJlZLa0xH3esep+8ptBeQEmHRDWoM
	Eb4anL101+OLdSIYJT7zh9k=
X-Google-Smtp-Source: ABdhPJw0wRHZas/LCq2WLTm8mLs8VsVYgQgbhBLolRHcZrEdPydvbZvbiU/KzDQWHRpUBOc9rzwwww==
X-Received: by 2002:a37:a956:: with SMTP id s83mr84812qke.500.1640119208810;
        Tue, 21 Dec 2021 12:40:08 -0800 (PST)
Received: from debianG ([190.191.20.243])
        by smtp.gmail.com with ESMTPSA id w63sm41651qkd.88.2021.12.21.12.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 12:40:08 -0800 (PST)
Date: Tue, 21 Dec 2021 17:40:00 -0300
From: Gaston Gonzalez <gascoar@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, nsaenz@kernel.org, f.fainelli@gmail.com,
	rjui@broadcom.com, sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	juerg.haefliger@canonical.com, rdunlap@infradead.org,
	dave.stevenson@raspberrypi.com, stefan.wahren@i2se.com,
	unixbhaskar@gmail.com, mitaliborkar810@gmail.com,
	phil@raspberrypi.com, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: Re: [PATCH 0/4] staging: vc04_services: avoid the use of typedef for
 function pointers
Message-ID: <YcI7oGVjwQA4+5uc@debianG>
References: <cover.1639858361.git.gascoar@gmail.com>
 <YcFyNFR66Ii2tos+@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YcFyNFR66Ii2tos+@kroah.com>

On Tue, Dec 21, 2021 at 07:20:36AM +0100, Greg KH wrote:
> On Mon, Dec 20, 2021 at 06:29:10PM -0300, Gaston Gonzalez wrote:
> > This patch set removes some typedefs for function pointers in vc04_services.
> > 
> > After patches 01 to 03, there are no remaining typedef under vc04_services.
> > Hence, the patch 04/04 updates the TODO file removing the 'remove typedefs'
> > task.
> > 
> > Gaston Gonzalez (4):
> >   staging: bcm2835-audio: replace function typedefs with equivalent
> >     declaration
> >   staging: vc04_services: replace function typedef with equivalent
> >     declaration
> >   staging: vc04_services: avoid the use of typedef for function pointers
> >   staging: vc04_services: update TODO file
> 
> These are not the name of the patches that you sent out at all :(
> 
> Are you sure you created this properly?
> 
> Something went wrong.
> 
> greg k-h

Hi Greg,

I'm sorry, I messed up editing the subjects using git send-email
directly. I didn't realized that that would create a mismatch with the
summary in patch 0/4. It is clear now ...

thanks,

Gaston
