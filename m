Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889DCC97D;
	Tue, 21 Mar 2023 16:28:37 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id i5so15081291eda.0;
        Tue, 21 Mar 2023 09:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679416116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qRUXMjw1yqtizFMO9hhf0y6intRqN77LQ8iMEXFSQeU=;
        b=IVfOxzk8m1QldR3hACl0mrlKEk/3Mpgb19D3F14wwyGcDk89LmFr8cuGJREN/viaRy
         Z2z1xAeEALG5HOZkNqX9P/arLTn0gqJ7OIjVOkbU24b2SgFm4aY8VZo3cTXPt+EC4ymP
         sWKwg6sLlpkuqpqSos4LLaGG6Ua4IV8O/ip+Qisdjw9xzbW7CsOx5on5C8MoGcFmjKnW
         cDMB8eZxwtUw7dgXVaQEuk4xQiO9A2GOyRWQiaPDKuxkaKBK7mCTWlwj1AoqZYbixqv1
         qCrwijAhes24rXjbU0Z7eDNYMQCm+dqyTxRrzFdlVj1VHV+jlNQpmGftzv4K38C9n0jb
         Y/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679416116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRUXMjw1yqtizFMO9hhf0y6intRqN77LQ8iMEXFSQeU=;
        b=vcOSRk/fGUCnhVUW4m0gpfvNHI2kRcPcSmg7bDrTCBLT7GiBZuuEMVncWPqTkEwE52
         L7IqgQhGz6rBdeS7hoB8Y3w5tzrEN5Ne/lsKpxwlLWCMOp6GsSpGHo+fy7vTM8lbgyvv
         mdTLXnqw69m3WcK/O3EKU/rxqnEkwzRaP7WmwLoDWYLvbN3KE9g1ghPGnPFTReekImgA
         UPeV455zSZJ0B5YhwCY+9+NaRlnCWRiWmTakZDjlEb1du23U1ATM2qYbNkQ/oNPzHdce
         lQ/pQOTjf1vRQeFA9014fnJfW55j1TeiGo2s+8UlmGkVAjYyiqDxBHCetyET0sNYrJq2
         dAAg==
X-Gm-Message-State: AO0yUKXHF6VBaKaLGl+5J242URwGeAEbKcMrQ2u6Jlv7L28V3c21w9R5
	i6fdgWVv7ZlgJykDcYp+79c=
X-Google-Smtp-Source: AK7set9J9hxl4uXIJrgVRbkzC7YMBJZZcmmKgSQPLvjIZ1YSEcv9LYFHdmAhpM3rIq9prmlmfnFaDw==
X-Received: by 2002:a05:6402:38a:b0:4fc:d277:a6d5 with SMTP id o10-20020a056402038a00b004fcd277a6d5mr3838658edv.19.1679416115750;
        Tue, 21 Mar 2023 09:28:35 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id x23-20020a50d617000000b004fa268da13esm6623696edi.56.2023.03.21.09.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 09:28:35 -0700 (PDT)
Date: Tue, 21 Mar 2023 21:28:32 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, Forest Bond <forest@alittletooquiet.net>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: fix line ending with '('
Message-ID: <ZBnbMEJS6q+NWNiT@khadija-virtual-machine>
References: <ZBhNOkQbG4ygNF98@khadija-virtual-machine>
 <ZBnZD5alylOgjhYd@khadija-virtual-machine>
 <ZBnZ+xM0+59Lmvhi@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBnZ+xM0+59Lmvhi@kroah.com>

On Tue, Mar 21, 2023 at 05:23:23PM +0100, Greg Kroah-Hartman wrote:
> On Tue, Mar 21, 2023 at 09:19:27PM +0500, Khadija Kamran wrote:
> 
> <snip>
> 
> > Hey Outreachy Mentors,
> > 
> > Kindly take a look at this patch and let me know if I should wait for
> > the response on this patch or submit another patch.
> 
> Less than 1 day later?
> 
> Please relax and always keep working on new things, don't let my
> response time be the gateway for you doing work, otherwise you are not
> going to get very much done at all.
> 
> You normally have to wait about 2 weeks to get a patch reviewed,
> sometimes I go much faster, sometimes slower.  Either way, it's
> uncertian...
> 
> thanks,
> 
> greg k-h

Okay understood.

Really sorry about this message.

Regards,
Khadija

