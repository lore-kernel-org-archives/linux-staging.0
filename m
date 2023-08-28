Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D1F11CB8
	for <linux-staging@lists.linux.dev>; Mon, 28 Aug 2023 14:57:31 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-99bcf2de59cso438673266b.0
        for <linux-staging@lists.linux.dev>; Mon, 28 Aug 2023 07:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693234649; x=1693839449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WYkAe7NQaVeDP5OA8zcaPDgJkUgX7N7r1SPuR8WIwUA=;
        b=rQGRDIpppn/BRfyMuxZOBXfzA/M3kiT8RMbs6zg2WjZaMb0EvvFwQtdf5DtU9LmHDT
         zb6ts8w2v9iaLUShPhxUem/KcaVXIdeoTX6zYOTgQHxhAH4Lk2OObjyF/Jnh3kSqpRFk
         NyoIgL0eUcs9yyjKg09jOmBPx/Bb5rT3rG4LCkz2toBtMsiNPbdoROVq9hlo5jRZHCkE
         D7of23X+Ta3ZVdtQtdB57fS7s4ojK5ANcBS7YInWDrAn7YZGwS5JsIijz+XADpnUsfDh
         QXTpfFUvdZfFeHiJz3X0hJY/rnANcl15eUHDehEI5lg9RRQvSJQah+DzvwLTYN9yWFcc
         53sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693234649; x=1693839449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYkAe7NQaVeDP5OA8zcaPDgJkUgX7N7r1SPuR8WIwUA=;
        b=U4Rl0/JDXyuvRDev1BNoltypnppXX4G33TUflN+71rsLE0ruqtIU2z7/XlFHUzXzwe
         BpPQRD1jnYB9ZPlQhnXD/thZJRpA0Ps1LBNFcTjoOlObvhLYKWPWeAuXjiLkC5N/TOdT
         Ayt8MZ10NU2ghdoZIQMrBdQlwQV+Fa9V34HeYKivFqcFBsyPtKTQ+61RjiAMqneWNCL4
         7m5pIyF3idMz+t8WPRtwrgsCVsTVRvGjvawx5alqZkVxlDaJAyoqUWTm6BWYvWr3MnWM
         PrHW2NNxYGjuR2TIF0LxgoYUODmWRcAIja8gse+cATByhbegrQiczIS2nuFDYi9jsw81
         8UNA==
X-Gm-Message-State: AOJu0YwcBbimkROUv4GTbvWqbwk07Vs4taEB/gLUmjUrUAXFY7WZjfFz
	hahdayq2WT/sXbdyc3DNzDrZMj+DXmc=
X-Google-Smtp-Source: AGHT+IFg9zzdb59NtlI0AIGBTSMSAhQM6frf2jFV/srcK9SjHU/uyD45EAxs6DF6qb1ZHfGgKjJ6CA==
X-Received: by 2002:a17:906:5a64:b0:9a4:6437:3256 with SMTP id my36-20020a1709065a6400b009a464373256mr7076564ejc.39.1693234649007;
        Mon, 28 Aug 2023 07:57:29 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id fj9-20020a1709069c8900b00992e265495csm4708621ejc.212.2023.08.28.07.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 07:57:28 -0700 (PDT)
Date: Mon, 28 Aug 2023 16:57:27 +0200
From: Nam Cao <namcaov@gmail.com>
To: ozlinux@hotmail.com
Cc: gregkh@linuxfoundation.org, colin.i.king@gmail.com,
	sumitraartsy@gmail.com, u.kleine-koenig@pengutronix.de,
	geert@linux-m68k.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v4 0/6] staging: octeon: clean up the octeon ethernet
 driver
Message-ID: <ZOy1169cQaWBIWj/@nam-dell>
References: <PH7PR11MB7643280D48E45D2B660F5B6CBCE0A@PH7PR11MB7643.namprd11.prod.outlook.com>
 <ZOysbIihBA5ZMGc9@nam-dell>
 <PH7PR11MB7643DE405C5FBBE0B0E63313BCE0A@PH7PR11MB7643.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH7PR11MB7643DE405C5FBBE0B0E63313BCE0A@PH7PR11MB7643.namprd11.prod.outlook.com>

On Mon, Aug 28, 2023 at 10:44:42AM -0400, ozlinux@hotmail.com wrote:
> On Mon, Aug 28, 2023 at 04:17:16PM +0200, Nam Cao wrote:
> > On Mon, Aug 28, 2023 at 09:39:13AM -0400, Oliver Crumrine wrote:
> > > Make the octeon ethernet driver better conform to the linux kernel coding standards
> > > 
> > > Oliver Crumrine (6):
> > >   staging: octeon: clean up the octeon ethernet driver
> > >   staging: octeon: clean up the octeon ethernet driver
> > >   staging: octeon: clean up the octeon ethernet driver
> > >   staging: octeon: clean up the octeon ethernet driver
> > >   staging: octeon: clean up the octeon ethernet driver
> > >   staging: octeon: clean up the octeon ethernet driver
> > > 
> > >  drivers/staging/octeon/ethernet.c     |  6 ++--
> > >  drivers/staging/octeon/octeon-stubs.h | 50 +++++++++++++--------------
> > >  2 files changed, 28 insertions(+), 28 deletions(-)
> > > 
> > > -- 
> > > 2.39.3
> > >
> > 
> > The patches themselves should also be sent with this cover letter. Instead they
> > are sent in a different thread :(
> > 
> > Best regards,
> > Nam 
> 
> Looking at the what I sent, all the patches should be in reply to 
> <cover.1693229582.git.ozlinux@hotmail.com>, both according to the patch
> that was created by git format-patch, and Outlook. If in-reply-to and
> the thread are 2 different things, please let me know, and instruct me on 
> how I should put the patches in the same thread. 

You seem to do it correctly, so sorry but I also do not know what went wrong.

Maybe someone who knows more about email can help here.

Best regards,
Nam
